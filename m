Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CF2CFD4F2A
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 18:41:13 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2595.1773168067871544730
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 11:41:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V9IqUOg4;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-46703fb602fso953794b6e.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 11:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773168067; x=1773772867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTEs0ehcHll89HzxGCoaETOYfkK7ZCZMY3NvuGYxHJM=;
        b=V9IqUOg49UespN8oudqYbz/cusVZilnj0Ci5G6j01mpcUAIIdcXf88g9IqCdhflUCA
         p5pXHB3T57QZvUSxrSsV8Sx7QA3Zi+1ybaPhg7z6u93bu9bvJhnHYkB8pCnHaTvPh96W
         YRlP6ZAxpImwdA6jIovSUY34p2MiTJdxItKMsU8FVfIC2vULmp+vTeRrtCJCkkjHwlLE
         QE+EGbtwH5nP4x9AObiRo+QX4Kqv8qqSTwM8dADlxL8hKB18PqJbenWo8yF1SRAuygSe
         ggZBQWoDXrMoJGp63j8fIvHtpGW8mh2802dhcVH3n3xTuOGFxCN3mVA7tsI8OI/ni2ly
         eIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773168067; x=1773772867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vTEs0ehcHll89HzxGCoaETOYfkK7ZCZMY3NvuGYxHJM=;
        b=V9/oCqaILdyiJhj3msYKwx1b9lgqmTDGJMCziMCidh1IZDiN9EJDDM6tC0b7Svk0Yl
         19I7zJa1COCE+cpWnL/SkBXQpCvFqmnnom0KR1oNzF5Tvd5ah7K4x6Bqjnn8mHygk5af
         FEblTQZeoLMtHr0DjqRuOqCiCSrxCoJ0HpKZfsezAgsR22zCSTre1xysXfRVkmeXkSg1
         ralK9cRIGxWMNp71L6wZJbnftMixG4xvm923WVcshN+HSG7O5x0nGBefzELJ0JUSy6HW
         3niBuKe0BeiF7WdRVLg4Uan86X2OZMt7e3Eq7pcJkMUKaKOy6VAM/qR/7GdK9yXLssyU
         BqIg==
X-Gm-Message-State: AOJu0YxteGJdpFR+eN1dMRttKFRDCU7rADGWkIzSlq+OXN3QYqBW0SDI
	30xCmL7B2AvkAZHNk7/D3MWhBzQYRXD36KajvSCP0q5Z4K7+rbwf0XdAHNwHeQ==
X-Gm-Gg: ATEYQzwArCSHUMLJFkI8n35+2dELqPmez+cML9C4Umltg50ErJcgU5oVmvhjEKKoR0C
	ld0zbod3xBeHg2aoeLxwnw1jqXQVNMZx6uTxDP/6a0OrtWx8aa+6igvrXyyzGiXlVeNdT0rWeJL
	aWou3boZ6MWO4dBd9Cz6wjqO97tvNNZHIK+Ic2/uj+v/IfdbQwSsez47172j9Es4u9DV7GV8gkz
	kStosYq5RVEp4a894+No1QFvRCygCa+wMXsad1iuR4HzHh+IJYG/IlcIAhEAsCBM4KhuQB9ETE6
	50pRv9i+C9Z28PBtY8R6krwqb8tGkN9nJ0JoeosTH9pW99f7M6kfpwrEM74wnZn0LLyHKkCq7jP
	to42M6ulJnZRVkNzAZrHVMJCh7gZIjfsPkc/W5aKiFx9lcN6GvAH3UBP6Sz4MEEhg1oTIi3F75f
	axTb5/CvF0WywfeLIuVV68
X-Received: by 2002:a05:6808:179e:b0:467:1cf5:768b with SMTP id 5614622812f47-4671cf84823mr2298820b6e.10.1773168066933;
        Tue, 10 Mar 2026 11:41:06 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4200:11c0::9891])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4671d2a7ebfsm2444524b6e.20.2026.03.10.11.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 11:41:06 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v6 04/15] spdx3: Add recipe SBoM task
Date: Tue, 10 Mar 2026 12:38:24 -0600
Message-ID: <20260310184058.533343-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310184058.533343-1-JPEWhacker@gmail.com>
References: <20260304164835.3072507-1-JPEWhacker@gmail.com>
 <20260310184058.533343-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 18:41:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232815

Adds a task that will create the complete recipe-level SBoM for a given
target recipe, following all dependencies. For example:

```
bitbake -c create_recipe_sbom zstd
```

Would produce the complete recipe SBoM for the zstd recipe, include all
build time dependencies (recursively).

The complete SBoM for all (target) recipes can be built with:

```
bitbake -c create_recipe_sbom meta-world-recipe-sbom
```

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-3.0.bbclass          | 32 +++++++++++++++++++
 meta/classes/spdx-common.bbclass              |  1 +
 meta/conf/distro/include/maintainers.inc      |  1 +
 meta/lib/oe/spdx30_tasks.py                   | 10 ++++++
 meta/lib/oeqa/selftest/cases/spdx.py          | 10 ++++++
 .../meta/meta-world-recipe-sbom.bb            | 29 +++++++++++++++++
 6 files changed, 83 insertions(+)
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
index 3c7fc4974d..40e090d452 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -535,6 +535,7 @@ RECIPE_MAINTAINER:pn-meta-go-toolchain = "Richard Purdie <richard.purdie@linuxfo
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
index 759ca86b73..efee0214fc 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -151,6 +151,16 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
             "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/packages/package-base-files.spdx.json",
         )
 
+    def test_world_sbom(self):
+        objset = self.check_recipe_spdx(
+            "meta-world-recipe-sbom",
+            "{DEPLOY_DIR_IMAGE}/world-recipe-sbom.spdx.json",
+            task="create_recipe_sbom",
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
index 0000000000..b47a3229c9
--- /dev/null
+++ b/meta/recipes-core/meta/meta-world-recipe-sbom.bb
@@ -0,0 +1,29 @@
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
-- 
2.53.0


