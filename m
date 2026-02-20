Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0C5FC5AC7A
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 15:41:48 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.347.1771602102012757321
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 07:41:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dpDVaYnT;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-677a11d11e0so815115eaf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 07:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771602101; x=1772206901; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XcUahur4GoX4QtzfOJWzF+fCRktws5InkjXE3UlFUjk=;
        b=dpDVaYnTYn2sH0/xeKltrG1ysgxmx6r/S4C13Yvg6NeLGwI6G3fVY6PRUAu+oKHq2c
         owrivU2Y3T4r2w06FA2Q4iN6/dDJHuT9+hIgajhkyD6Flg9ZI603iPgZDBaNLo4VCypi
         jkwnAtJyd6BeATszJ5pEQCceQZOJIplQwiBL2IxKJWk5//5OAlby+uwcj1947uFhUy5k
         aGvvWw+JWDNvjusybR9nq5c2GZsYYjyNt+wdV715ATHunFQg5dxm2eEv4P5FuL8N+8AE
         imsxxy9gAkXw/PCfQrgBRC1QuZoZt41sllV2VNgGm6v9TMVNVA26FkGyvp6iTWSFDlkm
         4Vqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771602101; x=1772206901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XcUahur4GoX4QtzfOJWzF+fCRktws5InkjXE3UlFUjk=;
        b=sdBYq7PzxbzFRfiD/ZyUsW0EPezOL0ShaJXoVMpOANcAmem5d8Uh5tjUCX5ro0M4em
         EcRag2fLGws6mrxEhsiuvaIjVa9Ny1zLfaW1Xxum6BnkgBKsObQQGRTpFHKQpWFr+Lih
         RFXEv75d9psiK28FdBbbuiAhkm2O062DrBi/573mp7484v+cfvt08jz7/klzgBtlEZG7
         Vs08NsEim5+YWuU908RZxMhkIswPyunY6nF1FIPxJ8h1Hn+zba4ccJhuJvwG9BzCxdkb
         2cM0ou/NvyCF9x0gI39N/HQGLlyKM9yzj2xgQwiSVL/0v/xnMgQImVtsWGQ/GNINhGsV
         KMLA==
X-Gm-Message-State: AOJu0YyWudHkzWwi2kiigDAGvT5+fHCK0l/qTI65XCxInmZRlgZZtPLp
	vvXdBU2f0oy1ybx6k3qFDEo1NvRI2W3ZE7qcuz7UiBvwD10UbkP13P3nG/I8jA==
X-Gm-Gg: AZuq6aKpX72/YYXK2q3h176P2a5UVJPEOizPyQmvYsVmo9QTGdsCUF06Elikgv/tIdu
	NLspw41oJ3Nwy2oQDGrsVKGEatM908Bmif/mMckz1gS96IJyb89CdSxJQoez6qPfT4dv64mmvEI
	nLxJGUWu3OCliAWQKHPrmy9P4zXlXhnuLbgl26DAITCNuJH9Yu/qwyHyp4yy/YAUWliDAhDs9GR
	HWmg1J8/qPcanNKs2pjOR+Pwyn/4ddtSRP81InegywtFrfuMmpmwv3bf+EPAIx3/R77qGbBl9VH
	JGPfiafZEZkSSZh8OgAQx33CqxfFIsOifltm+Cpjjctowx7m7q0TqScyNFVlmo1FJgkV6NHkWcM
	lWjvg3HaSHKMWfXvwbFFk5G0zlJnLBWXCCmBSEr61h8N3DesSIzHBMV3z0hI2qLqVRWMiZ9ivJh
	+mAptm0V4ekRFqCel6cMcF
X-Received: by 2002:a05:6820:1c99:b0:662:c8a5:66bc with SMTP id 006d021491bc7-679c46fe92bmr122414eaf.50.1771602100984;
        Fri, 20 Feb 2026 07:41:40 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::6492])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6772583294bsm15127188eaf.14.2026.02.20.07.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 07:41:40 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: benjamin.robin@bootlin.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 4/9] spdx3: Add recipe SBoM task
Date: Fri, 20 Feb 2026 08:40:39 -0700
Message-ID: <20260220154123.376880-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260220154123.376880-1-JPEWhacker@gmail.com>
References: <20260220154123.376880-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 15:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231523

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
 meta/classes/create-spdx-3.0.bbclass          | 28 +++++++++++++++++++
 meta/classes/spdx-common.bbclass              |  1 +
 meta/lib/oe/spdx30_tasks.py                   | 10 +++++++
 .../meta/meta-world-recipe-sbom.bb            | 26 +++++++++++++++++
 4 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-core/meta/meta-world-recipe-sbom.bb

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index cd70a07534..e12c116486 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -240,6 +240,34 @@ python do_create_package_spdx_setscene () {
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
index 0c1fd09b6f..6f35dbf8f6 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -25,6 +25,7 @@ SPDX_TOOL_VERSION ??= "1.0"
 
 SPDXRECIPEDEPLOY = "${SPDXDIR}/recipe-deploy"
 SPDXRUNTIMEDEPLOY = "${SPDXDIR}/runtime-deploy"
+SPDXRECIPESBOMDEPLOY = "${SPDXDIR}/recipes-bom-deploy"
 
 SPDX_INCLUDE_SOURCES ??= "0"
 SPDX_INCLUDE_COMPILED_SOURCES ??= "0"
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index a8b4525e3d..9a312a870d 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -1564,3 +1564,13 @@ def create_sdk_sbom(d, sdk_deploydir, spdx_work_dir, toolchain_outputname):
     oe.sbom30.write_jsonld_doc(
         d, objset, sdk_deploydir / (toolchain_outputname + ".spdx.json")
     )
+
+
+def create_recipe_sbom(d, deploydir):
+    sbom_name = d.getVar("PN") + "-recipe-sbom"
+
+    recipe, recipe_objset = load_recipe_spdx(d)
+
+    objset, sbom = oe.sbom30.create_sbom(d, sbom_name, [recipe], [recipe_objset])
+
+    oe.sbom30.write_jsonld_doc(d, objset, deploydir / (sbom_name + ".spdx.json"))
diff --git a/meta/recipes-core/meta/meta-world-recipe-sbom.bb b/meta/recipes-core/meta/meta-world-recipe-sbom.bb
new file mode 100644
index 0000000000..60209fba7e
--- /dev/null
+++ b/meta/recipes-core/meta/meta-world-recipe-sbom.bb
@@ -0,0 +1,26 @@
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
+python calculate_extra_depends() {
+    exclude = set('${WORLD_SBOM_EXCLUDE}'.split())
+    for p in world_target:
+        if p == self_pn or p in exclude:
+            continue
+        deps.append(p)
+}
-- 
2.53.0


