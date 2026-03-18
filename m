Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0287A103E181
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 13:47:10 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14406.1773841620949327854
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 06:47:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aOyJ4ZaS;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-67bb3a6c6f3so564688eaf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 06:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773841620; x=1774446420; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2XuK1/Em0BrU2YK1t33ZIx4D+QmhWiHU8dV8JDK01I=;
        b=aOyJ4ZaSCQzvv2twndUrM4BTvXeJ43kTlX+77xH88tF2CBtLWNTEi272IS6kIibpWp
         P2P91AnVEyinu0W5OW5fWqVG8zhrgWlQTGwDCEt2gFiAxjBTtwsN70YXgNK0J2LUPdDr
         +sn5h+aGfDUsm2gi9iB8Eumhw0ppi/1wmhu+CUoeOku8pLaORyK2OAKNFgY+P35lOxtK
         yjFlYspwRzsMwvj/obxHa4vxFWtzA//48fNOe+JX8KUtpid7ImGsj3sNok5pZgQ3oCl3
         Je7ldGHBKAwS1C9CRnM0TiEtLbcS/pBu0l2IqH+EAuOn3CvRj1dNxUx4jCIpkkmdUzZo
         SbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773841620; x=1774446420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G2XuK1/Em0BrU2YK1t33ZIx4D+QmhWiHU8dV8JDK01I=;
        b=FMuzOi/XjuVe2UzkPa5Z2zPYqdz7AkrE11An+41FhVfXds3m40Z/MYrk7JYKzXSnX0
         6nd2GCcrNi8OAGGIyUUhW9k8XavaZin8JpYrp+VMWlLc0OaMjqWIXaLd+Ch7aQKAhVlT
         c19T2LjhLSJJ5O07Co0JkKUNhlg+00LmP7CXxO37rUPpalRCGnWfqVkja0bApT5/rKkn
         T1NHInwceSs7b+zniortiQoXTP5PEptqBju+HqahWY2FxVQ9vuPlmk06Epv4H9HXRBJW
         nCTp4USRqFqRAy9lot5J8+lLUWuvUVF8tkd7gpGYwzaoZMKb/9zJSO2UIgRFS6ckpEu9
         sJBg==
X-Gm-Message-State: AOJu0YyfcrXVeCVxhEpxXbo3sxMJ1NC7tE6LJ6EA+QtLq+krcGpQwpnr
	WSkGQGgpnRpIo1pv8ocezEm5hsEab6Zx9dL1AFCFYbXdN/pN/TAmxDhtfoBmjg==
X-Gm-Gg: ATEYQzzkxHMtYvRIdqzpfCD53hNj++fQcCz+qvLNy0+Z9RjC2wTm/BMIf2YI/Jxx/Pi
	pubo122qzdMShFQGWRCW7BSiB9paHTsioqg1IJsSrLBW97aBbqTTpCK22wtoeZL0hSqaWj2Qetz
	XmChYo9aI20fuAnPivmPEVPkN42DdVs3lBImDqx86miA20PQv2dZ3YBmghUHBimRlj7/27yjzw4
	P+2pxh1ntZWaJS379xip0E+b87tA+vNVAnJYexQOukcj+TzET1979w90Hq1I/1tzZWa8bEsod2a
	2MCSll0zaw5InYBkYuovcAJHQ2UOavwz9rrfygrlPGuWLHzh/LGl7GzKf+3tPcCZr1mfs/56+WD
	g6XLWx5hMkTXSeSEyU/fiszl6/A2SWDdnfx35YXWN8/4QqREsOYunVHI0lVX1cAPutIdSkXotLy
	h/MK1viDguHMPWtKtIs39/
X-Received: by 2002:a05:6820:20a:b0:67b:f12a:e020 with SMTP id 006d021491bc7-67c0ceb19f6mr2304356eaf.0.1773841619971;
        Wed, 18 Mar 2026 06:46:59 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4200:11c0::8279])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67c0d89c739sm1763625eaf.13.2026.03.18.06.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 06:46:59 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v7 02/12] spdx3: Add recipe SBoM task
Date: Wed, 18 Mar 2026 07:44:30 -0600
Message-ID: <20260318134655.953233-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318134655.953233-1-JPEWhacker@gmail.com>
References: <20260310184058.533343-1-JPEWhacker@gmail.com>
 <20260318134655.953233-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 13:47:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233392

Adds a task that will create the complete recipe-level SBoM for a given
target recipe, following all dependencies. For example:

```
bitbake -c create_recipe_sbom zstd
```

Would produce the complete recipe SBoM for the zstd recipe, include all
build time dependencies (recursively).

The complete SBoM for all (target) recipes can be built with:

```
bitbake meta-world-recipe-sbom
```

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-3.0.bbclass          | 32 ++++++++++++++++
 meta/classes/spdx-common.bbclass              |  1 +
 meta/conf/distro/include/maintainers.inc      |  1 +
 meta/lib/oe/spdx30_tasks.py                   | 10 +++++
 meta/lib/oeqa/selftest/cases/spdx.py          |  9 +++++
 .../meta/meta-world-recipe-sbom.bb            | 38 +++++++++++++++++++
 6 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-core/meta/meta-world-recipe-sbom.bb

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 672ca27cd0..c3ea95b8bc 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -142,6 +142,10 @@ SPDX_PACKAGE_URLS[doc] = "A space separated list of Package URLs (purls) for \
     Override this variable to replace the default, otherwise append or prepend \
     to add additional purls."
 
+SPDX_RECIPE_SBOM_NAME ?= "${PN}-recipe-sbom"
+SPDX_RECIPE_SBOM_NAME[doc] = "The name of output recipe SBoM when using \
+    create_recipe_sbom"
+
 IMAGE_CLASSES:append = " create-spdx-image-3.0"
 SDK_CLASSES += "create-spdx-sdk-3.0"
 
@@ -240,6 +244,34 @@ python do_create_package_spdx_setscene () {
 }
 addtask do_create_package_spdx_setscene
 
+addtask do_create_recipe_sbom after create_recipe_spdx
+python do_create_recipe_sbom() {
+    import oe.spdx30_tasks
+    from pathlib import Path
+    deploydir = Path(d.getVar("SPDXRECIPESBOMDEPLOY"))
+    oe.spdx30_tasks.create_recipe_sbom(d, deploydir)
+}
+
+SSTATETASKS += "do_create_recipe_sbom"
+do_create_recipe_sbom[recrdeptask] = "do_create_recipe_spdx"
+do_create_recipe_sbom[nostamp] = "1"
+do_create_recipe_sbom[sstate-inputdirs] = "${SPDXRECIPESBOMDEPLOY}"
+do_create_recipe_sbom[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
+do_create_recipe_sbom[file-checksums] += "${SPDX3_DEP_FILES}"
+do_create_recipe_sbom[cleandirs] = "${SPDXRECIPESBOMDEPLOY}"
+do_create_recipe_sbom[vardeps] += "\
+    SPDX_INCLUDE_BITBAKE_PARENT_BUILD \
+    SPDX_PACKAGE_ADDITIONAL_PURPOSE \
+    SPDX_PROFILES \
+    SPDX_NAMESPACE_PREFIX \
+    SPDX_UUID_NAMESPACE \
+    "
+
+python do_create_recipe_sbom_setscene () {
+    sstate_setscene(d)
+}
+addtask do_create_recipe_sbom_setscene
+
 python spdx30_build_started_handler () {
     import oe.spdx30_tasks
     d = e.data.createCopy()
diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index 3c239a718b..abf2332bee 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -25,6 +25,7 @@ SPDX_TOOL_VERSION ??= "1.0"
 
 SPDXRECIPEDEPLOY = "${SPDXDIR}/recipe-deploy"
 SPDXRUNTIMEDEPLOY = "${SPDXDIR}/runtime-deploy"
+SPDXRECIPESBOMDEPLOY = "${SPDXDIR}/recipes-bom-deploy"
 
 SPDX_INCLUDE_SOURCES ??= "0"
 SPDX_INCLUDE_COMPILED_SOURCES ??= "0"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index c7a646a643..86a11867a1 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -534,6 +534,7 @@ RECIPE_MAINTAINER:pn-meta-go-toolchain = "Richard Purdie <richard.purdie@linuxfo
 RECIPE_MAINTAINER:pn-meta-ide-support = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-meta-toolchain = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-meta-world-pkgdata = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER:pn-meta-world-recipe-sbom = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-mingetty = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-mini-x-session = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-minicom = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index a8b4525e3d..b6c917045e 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -1564,3 +1564,13 @@ def create_sdk_sbom(d, sdk_deploydir, spdx_work_dir, toolchain_outputname):
     oe.sbom30.write_jsonld_doc(
         d, objset, sdk_deploydir / (toolchain_outputname + ".spdx.json")
     )
+
+
+def create_recipe_sbom(d, deploydir):
+    sbom_name = d.getVar("SPDX_RECIPE_SBOM_NAME")
+
+    recipe, recipe_objset = load_recipe_spdx(d)
+
+    objset, sbom = oe.sbom30.create_sbom(d, sbom_name, [recipe], [recipe_objset])
+
+    oe.sbom30.write_jsonld_doc(d, objset, deploydir / (sbom_name + ".spdx.json"))
diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index 759ca86b73..af1144c1e5 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -151,6 +151,15 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
             "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/packages/package-base-files.spdx.json",
         )
 
+    def test_world_sbom(self):
+        objset = self.check_recipe_spdx(
+            "meta-world-recipe-sbom",
+            "{DEPLOY_DIR_IMAGE}/world-recipe-sbom.spdx.json",
+        )
+
+        # Document should be fully linked
+        self.check_objset_missing_ids(objset)
+
     def test_gcc_include_source(self):
         objset = self.check_recipe_spdx(
             "gcc",
diff --git a/meta/recipes-core/meta/meta-world-recipe-sbom.bb b/meta/recipes-core/meta/meta-world-recipe-sbom.bb
new file mode 100644
index 0000000000..841fb8ea16
--- /dev/null
+++ b/meta/recipes-core/meta/meta-world-recipe-sbom.bb
@@ -0,0 +1,38 @@
+SUMMARY = "Generates a combined SBoM for all world recipes"
+LICENSE = "MIT"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit nopackages
+deltask do_fetch
+deltask do_unpack
+deltask do_patch
+deltask do_configure
+deltask do_compile
+deltask do_install
+
+do_prepare_recipe_sysroot[deptask] = ""
+
+WORLD_SBOM_EXCLUDE ?= ""
+
+EXCLUDE_FROM_WORLD = "1"
+SPDX_RECIPE_SBOM_NAME = "world-recipe-sbom"
+
+python calculate_extra_depends() {
+    exclude = set('${WORLD_SBOM_EXCLUDE}'.split())
+    exclude |= set(f"{v}-{self_pn}" for v in '${MULTILIB_VARIANTS}'.split())
+    exclude.add(self_pn)
+
+    deps.extend(p for p in world_target if p not in exclude)
+}
+
+python() {
+    # Ensure that do_create_recipe_sbom is the only dependency of do_build,
+    # since the sole purpose of this recipe is to produce the world recipe SBoM
+    d.setVarFlag("do_build", "deps", ["do_create_recipe_sbom"])
+    d.setVarFlag("do_build", "deptask", "")
+    d.setVarFlag("do_build", "rdeptask", "")
+    d.setVarFlag("do_build", "recrdeptask", "")
+}
-- 
2.53.0


