Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7AB7103E17F
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 13:47:09 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14405.1773841620596471280
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 06:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EQ+nhRq9;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7d738fe814cso5345532a34.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 06:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773841619; x=1774446419; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GXI7idm+D1nl9zMby/r1oELBEq5rGXbSp2Z1dA7pCn0=;
        b=EQ+nhRq9C1XxXUTjYY9s39cZnSh4Zbsj9MIDYeEkbs48maKMLURMNoDdZR7sXQy9q9
         byYXrRv2I+5p1R/qQn0sujq/u/VVsnPqAmJyK02ygoS5MGy9ZT8NN9ddVWO73rjyuDTj
         vD5OX8qO+Ab4G8XhKV+kSBPF2zd9TkRatsml/TW3toxe+hW2Wb6KEctG1lXbJiv4/IEs
         K47lRhayEtiImWHtAKnF+o544XE8JqgClMvQZPPF2pfrDFd7XFHGON5kJXSml91HI9Zn
         ePN5LI8A7PDWgLsdSyVvQjwwwyIaZFijLrnmQOvyfDsD79unkWNcFcVHzU1BIDqSM+P/
         jZKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773841619; x=1774446419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GXI7idm+D1nl9zMby/r1oELBEq5rGXbSp2Z1dA7pCn0=;
        b=cgLPlRWoNa/K0N8IUEIfkyb4LtkwaLGg6QXYnaIPp7t0giPpTtkhlkHs1DHyyC83o/
         pUdHhN9GsqZ2WpGQ1pPMxGg2M4TtWVG2w7GlQO+OBL6WIH5fr788CrUrpIl3kIPxoVQY
         okX9Q98syuuj3g8z/YPljfgYM+6VULgOiML39II8mUX8KBwL51ovGua39dU02hpp0jLL
         fasADjAynmtGQ83eqS6ub8KhuyVBRMgq/c3y03N5pEGz/0da/2+FNIDurNlF6DB1eqvs
         2V1PuudCCqDSfVTXo6IWG7W28vmn1gLj1fk+UvWXmOKLUPL+Ata+6IZff/mga2TfFfPu
         k19g==
X-Gm-Message-State: AOJu0YyEjkoP9AIu5IBK0B8IOw0OHngjEkbqK+nkfLcyJZF/fIOnAwLv
	w+ZrcVb0yopkonwu3O3DHGO/17mFa6C6WVNqHNCYwLnVdHpXw/4wC0uiuGi6aA==
X-Gm-Gg: ATEYQzwutt3L2oBELgns2g0MiZk7q5KKo1ZN7P+Q/VCHcaBVtlQmvQ21FpHKwM5FE3x
	45iDSZUPUAzdDnjYTvLUOi1F1Wu/KJYI/HMBPULK37TdsJNgjpHkv2rfByQgpxL9esK01aUPbz/
	ZMHN/0bvCA5cugrioCcd9V5WkB1hn/zIY/iCP7ASSMYLRe82fAxB4LmIOqPS9JEszzsp/Wq9DGZ
	57YoHg5Dghu6+5YBRRb45ovVAkfJJT537MMZ5Xng9VBd0R190gXwn1Mqm1FSP0MTDM2D1Mn4Cyl
	Yj93UJI1f1H+ViMTJU/FC6zetbDzjIB2jlfQhH/gwdgmnzYagtQqjdPyKBnxl/isb2G0QWh0bju
	H8VHfiIyYE5EI1iikO0TfkJFiXPEi7UCAoNKppkDh2MscTngQ60ZkVbqiaNH3kYPdlgDOPQpkIo
	4g3an2X2va5G9IDdaAcDOJ
X-Received: by 2002:a05:6820:1b18:b0:67b:ab43:778d with SMTP id 006d021491bc7-67c0daa3720mr2372244eaf.28.1773841619245;
        Wed, 18 Mar 2026 06:46:59 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4200:11c0::8279])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67c0d89c739sm1763625eaf.13.2026.03.18.06.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 06:46:58 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v7 01/12] spdx3: Add recipe SPDX data
Date: Wed, 18 Mar 2026 07:44:29 -0600
Message-ID: <20260318134655.953233-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318134655.953233-1-JPEWhacker@gmail.com>
References: <20260310184058.533343-1-JPEWhacker@gmail.com>
 <20260318134655.953233-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 13:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233391

Adds a new package to the SPDX output that represents the recipe data
for a given recipe. Importantly, this data contains only things that can
be determined statically from only the recipe, so it doesn't require
fetching or building anything. This means that build time dependencies
and CVE information for recipes can be analyzed without needing to
actually do any builds.

Sadly, license data cannot be included because NO_GENERIC_LICENSE means
that actual license text might only be available after do_fetch

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-global/sstate.bbclass            |   4 +-
 .../create-spdx-image-3.0.bbclass             |   4 +-
 .../create-spdx-sdk-3.0.bbclass               |   4 +-
 meta/classes-recipe/kernel.bbclass            |   2 +-
 meta/classes-recipe/nospdx.bbclass            |   1 +
 meta/classes/create-spdx-2.2.bbclass          |  12 +-
 meta/classes/create-spdx-3.0.bbclass          |  51 ++-
 meta/classes/spdx-common.bbclass              |  21 +-
 meta/lib/oe/spdx30_tasks.py                   | 402 ++++++++++++------
 meta/lib/oeqa/selftest/cases/spdx.py          |  19 +-
 10 files changed, 354 insertions(+), 166 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 1c3df0f544..88449d19c7 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -945,7 +945,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
             extrapath = d.getVar("NATIVELSBSTRING") + "/"
         else:
             extrapath = ""
-        
+
         tname = bb.runqueue.taskname_from_tid(task)[3:]
 
         if tname in ["fetch", "unpack", "patch", "populate_lic", "preconfigure"] and splithashfn[2]:
@@ -1107,7 +1107,7 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
 
     logit("Considering setscene task: %s" % (str(taskdependees[task])), log)
 
-    directtasks = ["do_populate_lic", "do_deploy_source_date_epoch", "do_shared_workdir", "do_stash_locale", "do_gcc_stash_builddir", "do_create_spdx", "do_deploy_archives"]
+    directtasks = ["do_populate_lic", "do_deploy_source_date_epoch", "do_shared_workdir", "do_stash_locale", "do_gcc_stash_builddir", "do_create_spdx", "do_create_recipe_spdx", "do_deploy_archives"]
 
     def isNativeCross(x):
         return x.endswith("-native") or "-cross-" in x or "-crosssdk" in x or x.endswith("-cross")
diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/classes-recipe/create-spdx-image-3.0.bbclass
index 636ab14eb0..15a91e90e2 100644
--- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
+++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
@@ -34,7 +34,7 @@ addtask do_create_rootfs_spdx after do_rootfs before do_image
 SSTATETASKS += "do_create_rootfs_spdx"
 do_create_rootfs_spdx[sstate-inputdirs] = "${SPDXROOTFSDEPLOY}"
 do_create_rootfs_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
-do_create_rootfs_spdx[recrdeptask] += "do_create_spdx do_create_package_spdx"
+do_create_rootfs_spdx[recrdeptask] += "do_create_recipe_spdx do_create_spdx do_create_package_spdx"
 do_create_rootfs_spdx[cleandirs] += "${SPDXROOTFSDEPLOY}"
 do_create_rootfs_spdx[file-checksums] += "${SPDX3_DEP_FILES}"
 
@@ -76,7 +76,7 @@ do_create_image_sbom_spdx[sstate-inputdirs] = "${SPDXIMAGEDEPLOYDIR}"
 do_create_image_sbom_spdx[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
 do_create_image_sbom_spdx[stamp-extra-info] = "${MACHINE_ARCH}"
 do_create_image_sbom_spdx[cleandirs] = "${SPDXIMAGEDEPLOYDIR}"
-do_create_image_sbom_spdx[recrdeptask] += "do_create_spdx do_create_package_spdx"
+do_create_image_sbom_spdx[recrdeptask] += "do_create_recipe_spdx do_create_spdx do_create_package_spdx"
 do_create_image_sbom_spdx[file-checksums] += "${SPDX3_DEP_FILES}"
 
 python do_create_image_sbom_spdx_setscene() {
diff --git a/meta/classes-recipe/create-spdx-sdk-3.0.bbclass b/meta/classes-recipe/create-spdx-sdk-3.0.bbclass
index e5f220cdfa..a4b8ed3bf9 100644
--- a/meta/classes-recipe/create-spdx-sdk-3.0.bbclass
+++ b/meta/classes-recipe/create-spdx-sdk-3.0.bbclass
@@ -5,14 +5,14 @@
 #
 # SPDX SDK tasks
 
-do_populate_sdk[recrdeptask] += "do_create_spdx do_create_package_spdx"
+do_populate_sdk[recrdeptask] += "do_create_recipe_spdx do_create_spdx do_create_package_spdx"
 do_populate_sdk[cleandirs] += "${SPDXSDKWORK}"
 do_populate_sdk[postfuncs] += "sdk_create_sbom"
 do_populate_sdk[file-checksums] += "${SPDX3_DEP_FILES}"
 POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk = " sdk_host_create_spdx"
 POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk = " sdk_target_create_spdx"
 
-do_populate_sdk_ext[recrdeptask] += "do_create_spdx do_create_package_spdx"
+do_populate_sdk_ext[recrdeptask] += "do_create_recipe_spdx do_create_spdx do_create_package_spdx"
 do_populate_sdk_ext[cleandirs] += "${SPDXSDKEXTWORK}"
 do_populate_sdk_ext[postfuncs] += "sdk_ext_create_sbom"
 do_populate_sdk_ext[file-checksums] += "${SPDX3_DEP_FILES}"
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 094c1148b6..2d8565bd55 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -883,7 +883,7 @@ do_create_spdx:append() {
         except Exception as e:
             bb.error(f"Failed to parse kernel config file: {e}")
 
-        path = oe.sbom30.jsonld_arch_path(d, pkg_arch, "recipes", f"recipe-{pn}", deploydir=deploydir)
+        path = oe.sbom30.jsonld_arch_path(d, pkg_arch, "builds", f"build-{pn}", deploydir=deploydir)
         build_objset = oe.sbom30.load_jsonld(d, path, required=True)
         build = build_objset.find_root(oe.spdx30.build_Build)
         if not build:
diff --git a/meta/classes-recipe/nospdx.bbclass b/meta/classes-recipe/nospdx.bbclass
index b20e28218b..90e14442ba 100644
--- a/meta/classes-recipe/nospdx.bbclass
+++ b/meta/classes-recipe/nospdx.bbclass
@@ -5,6 +5,7 @@
 #
 
 deltask do_collect_spdx_deps
+deltask do_create_recipe_spdx
 deltask do_create_spdx
 deltask do_create_spdx_runtime
 deltask do_create_package_spdx
diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 65d10d86db..3288cdf75a 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -399,6 +399,15 @@ def get_license_list_version(license_data, d):
     return ".".join(license_data["licenseListVersion"].split(".")[:2])
 
 
+# This task is added for compatibility with tasks shared with SPDX 3, but
+# doesn't do anything
+do_create_recipe_spdx() {
+    :
+}
+do_create_recipe_spdx[noexec] = "1"
+addtask do_create_recipe_spdx after do_collect_spdx_deps
+
+
 python do_create_spdx() {
     from datetime import datetime, timezone
     import oe.sbom
@@ -594,7 +603,7 @@ python do_create_spdx() {
 }
 do_create_spdx[vardepsexclude] += "BB_NUMBER_THREADS"
 # NOTE: depending on do_unpack is a hack that is necessary to get it's dependencies for archive the source
-addtask do_create_spdx after do_package do_packagedata do_unpack do_collect_spdx_deps before do_populate_sdk do_build do_rm_work
+addtask do_create_spdx after do_create_recipe_spdx do_package do_packagedata do_unpack do_patch do_collect_spdx_deps before do_populate_sdk do_build do_rm_work
 
 SSTATETASKS += "do_create_spdx"
 do_create_spdx[sstate-inputdirs] = "${SPDXDEPLOY}"
@@ -605,6 +614,7 @@ python do_create_spdx_setscene () {
 }
 addtask do_create_spdx_setscene
 
+do_create_spdx[deptask] += "do_create_spdx"
 do_create_spdx[dirs] = "${SPDXWORK}"
 do_create_spdx[cleandirs] = "${SPDXDEPLOY} ${SPDXWORK}"
 do_create_spdx[depends] += " \
diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index d4575d61c4..672ca27cd0 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -159,11 +159,18 @@ SPDX3_DEP_FILES = "\
     ${SPDX_LICENSES}:True \
     "
 
-python do_create_spdx() {
+python do_create_recipe_spdx() {
     import oe.spdx30_tasks
-    oe.spdx30_tasks.create_spdx(d)
+    oe.spdx30_tasks.create_recipe_spdx(d)
 }
-do_create_spdx[vardeps] += "\
+addtask do_create_recipe_spdx after do_collect_spdx_deps
+
+SSTATETASKS += "do_create_recipe_spdx"
+do_create_recipe_spdx[sstate-inputdirs] = "${SPDXRECIPEDEPLOY}"
+do_create_recipe_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
+do_create_recipe_spdx[file-checksums] += "${SPDX3_DEP_FILES}"
+do_create_recipe_spdx[cleandirs] = "${SPDXRECIPEDEPLOY}"
+do_create_recipe_spdx[vardeps] += "\
     SPDX_INCLUDE_BITBAKE_PARENT_BUILD \
     SPDX_PACKAGE_ADDITIONAL_PURPOSE \
     SPDX_PROFILES \
@@ -171,7 +178,19 @@ do_create_spdx[vardeps] += "\
     SPDX_UUID_NAMESPACE \
     "
 
+python do_create_recipe_spdx_setscene () {
+    sstate_setscene(d)
+}
+addtask do_create_recipe_spdx_setscene
+
+python do_create_spdx() {
+    import oe.spdx30_tasks
+    oe.spdx30_tasks.create_spdx(d)
+}
 addtask do_create_spdx after \
+    do_unpack \
+    do_patch \
+    do_create_recipe_spdx \
     do_collect_spdx_deps \
     do_deploy_source_date_epoch \
     do_populate_sysroot do_package do_packagedata \
@@ -181,18 +200,25 @@ SSTATETASKS += "do_create_spdx"
 do_create_spdx[sstate-inputdirs] = "${SPDXDEPLOY}"
 do_create_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
 do_create_spdx[file-checksums] += "${SPDX3_DEP_FILES}"
-
-python do_create_spdx_setscene () {
-    sstate_setscene(d)
-}
-addtask do_create_spdx_setscene
-
+do_create_spdx[deptask] += "do_create_spdx"
 do_create_spdx[dirs] = "${SPDXWORK}"
 do_create_spdx[cleandirs] = "${SPDXDEPLOY} ${SPDXWORK}"
 do_create_spdx[depends] += " \
     ${PATCHDEPENDENCY} \
     ${@create_spdx_source_deps(d)} \
 "
+do_create_spdx[vardeps] += "\
+    SPDX_INCLUDE_BITBAKE_PARENT_BUILD \
+    SPDX_PACKAGE_ADDITIONAL_PURPOSE \
+    SPDX_PROFILES \
+    SPDX_NAMESPACE_PREFIX \
+    SPDX_UUID_NAMESPACE \
+    "
+
+python do_create_spdx_setscene () {
+    sstate_setscene(d)
+}
+addtask do_create_spdx_setscene
 
 python do_create_package_spdx() {
     import oe.spdx30_tasks
@@ -205,16 +231,15 @@ SSTATETASKS += "do_create_package_spdx"
 do_create_package_spdx[sstate-inputdirs] = "${SPDXRUNTIMEDEPLOY}"
 do_create_package_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
 do_create_package_spdx[file-checksums] += "${SPDX3_DEP_FILES}"
+do_create_package_spdx[dirs] = "${SPDXRUNTIMEDEPLOY}"
+do_create_package_spdx[cleandirs] = "${SPDXRUNTIMEDEPLOY}"
+do_create_package_spdx[rdeptask] = "do_create_spdx"
 
 python do_create_package_spdx_setscene () {
     sstate_setscene(d)
 }
 addtask do_create_package_spdx_setscene
 
-do_create_package_spdx[dirs] = "${SPDXRUNTIMEDEPLOY}"
-do_create_package_spdx[cleandirs] = "${SPDXRUNTIMEDEPLOY}"
-do_create_package_spdx[rdeptask] = "do_create_spdx"
-
 python spdx30_build_started_handler () {
     import oe.spdx30_tasks
     d = e.data.createCopy()
diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index 3110230c9e..3c239a718b 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -23,6 +23,7 @@ SPDXDEPS = "${SPDXDIR}/deps.json"
 SPDX_TOOL_NAME ??= "oe-spdx-creator"
 SPDX_TOOL_VERSION ??= "1.0"
 
+SPDXRECIPEDEPLOY = "${SPDXDIR}/recipe-deploy"
 SPDXRUNTIMEDEPLOY = "${SPDXDIR}/runtime-deploy"
 
 SPDX_INCLUDE_SOURCES ??= "0"
@@ -67,12 +68,6 @@ def create_spdx_source_deps(d):
     deps = []
     if d.getVar("SPDX_INCLUDE_SOURCES") == "1":
         pn = d.getVar('PN')
-        # do_unpack is a hack for now; we only need it to get the
-        # dependencies do_unpack already has so we can extract the source
-        # ourselves
-        if oe.spdx_common.has_task(d, "do_unpack"):
-            deps.append("%s:do_unpack" % pn)
-
         if oe.spdx_common.is_work_shared_spdx(d) and \
            oe.spdx_common.process_sources(d):
             # For kernel source code
@@ -84,8 +79,6 @@ def create_spdx_source_deps(d):
             # For gcc-source-${PV} source code
             if oe.spdx_common.has_task(d, "do_preconfigure"):
                 deps.append("%s:do_preconfigure" % pn)
-            elif oe.spdx_common.has_task(d, "do_patch"):
-                deps.append("%s:do_patch" % pn)
             # For gcc-cross-x86_64 source code
             elif oe.spdx_common.has_task(d, "do_configure"):
                 deps.append("%s:do_configure" % pn)
@@ -97,8 +90,8 @@ python do_collect_spdx_deps() {
     # This task calculates the build time dependencies of the recipe, and is
     # required because while a task can deptask on itself, those dependencies
     # do not show up in BB_TASKDEPDATA. To work around that, this task does the
-    # deptask on do_create_spdx and writes out the dependencies it finds, then
-    # do_create_spdx reads in the found dependencies when writing the actual
+    # deptask on do_create_recipe_spdx and writes out the dependencies it finds, then
+    # downstream tasks read in the found dependencies when writing the actual
     # SPDX document
     import json
     import oe.spdx_common
@@ -106,15 +99,13 @@ python do_collect_spdx_deps() {
 
     spdx_deps_file = Path(d.getVar("SPDXDEPS"))
 
-    deps = oe.spdx_common.collect_direct_deps(d, "do_create_spdx")
+    deps = oe.spdx_common.collect_direct_deps(d, "do_create_recipe_spdx")
 
     with spdx_deps_file.open("w") as f:
         json.dump(deps, f)
 }
-# NOTE: depending on do_unpack is a hack that is necessary to get it's dependencies for archive the source
-addtask do_collect_spdx_deps after do_unpack
-do_collect_spdx_deps[depends] += "${PATCHDEPENDENCY}"
-do_collect_spdx_deps[deptask] = "do_create_spdx"
+addtask do_collect_spdx_deps
+do_collect_spdx_deps[deptask] = "do_create_recipe_spdx"
 do_collect_spdx_deps[dirs] = "${SPDXDIR}"
 
 oe.spdx_common.collect_direct_deps[vardepsexclude] += "BB_TASKDEPDATA"
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 99f2892dfb..a8b4525e3d 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -32,7 +32,9 @@ def set_timestamp_now(d, o, prop):
         delattr(o, prop)
 
 
-def add_license_expression(d, objset, license_expression, license_data):
+def add_license_expression(
+    d, objset, license_expression, license_data, search_objsets=[]
+):
     simple_license_text = {}
     license_text_map = {}
     license_ref_idx = 0
@@ -44,14 +46,15 @@ def add_license_expression(d, objset, license_expression, license_data):
         if name in simple_license_text:
             return simple_license_text[name]
 
-        lic = objset.find_filter(
-            oe.spdx30.simplelicensing_SimpleLicensingText,
-            name=name,
-        )
+        for o in [objset] + search_objsets:
+            lic = o.find_filter(
+                oe.spdx30.simplelicensing_SimpleLicensingText,
+                name=name,
+            )
 
-        if lic is not None:
-            simple_license_text[name] = lic
-            return lic
+            if lic is not None:
+                simple_license_text[name] = lic
+                return lic
 
         lic = objset.add(
             oe.spdx30.simplelicensing_SimpleLicensingText(
@@ -178,7 +181,9 @@ def add_package_files(
 
             # Check if file is compiled
             if check_compiled_sources:
-                if not oe.spdx_common.is_compiled_source(filename, compiled_sources, types):
+                if not oe.spdx_common.is_compiled_source(
+                    filename, compiled_sources, types
+                ):
                     continue
 
             spdx_file = objset.new_file(
@@ -293,17 +298,16 @@ def get_package_sources_from_debug(
     return dep_source_files
 
 
-def collect_dep_objsets(d, build):
+def collect_dep_objsets(d, subdir, fn_prefix, obj_type, **attr_filter):
     deps = oe.spdx_common.get_spdx_deps(d)
 
     dep_objsets = []
-    dep_builds = set()
+    dep_objs = set()
 
-    dep_build_spdxids = set()
     for dep in deps:
         bb.debug(1, "Fetching SPDX for dependency %s" % (dep.pn))
-        dep_build, dep_objset = oe.sbom30.find_root_obj_in_jsonld(
-            d, "recipes", "recipe-" + dep.pn, oe.spdx30.build_Build
+        dep_obj, dep_objset = oe.sbom30.find_root_obj_in_jsonld(
+            d, subdir, fn_prefix + dep.pn, obj_type, **attr_filter
         )
         # If the dependency is part of the taskhash, return it to be linked
         # against. Otherwise, it cannot be linked against because this recipe
@@ -311,10 +315,10 @@ def collect_dep_objsets(d, build):
         if dep.in_taskhash:
             dep_objsets.append(dep_objset)
 
-        # The build _can_ be linked against (by alias)
-        dep_builds.add(dep_build)
+        # The object _can_ be linked against (by alias)
+        dep_objs.add(dep_obj)
 
-    return dep_objsets, dep_builds
+    return dep_objsets, dep_objs
 
 
 def index_sources_by_hash(sources, dest):
@@ -423,9 +427,7 @@ def add_download_files(d, objset):
             if fd.method.supports_checksum(fd):
                 # TODO Need something better than hard coding this
                 for checksum_id in ["sha256", "sha1"]:
-                    expected_checksum = getattr(
-                        fd, "%s_expected" % checksum_id, None
-                    )
+                    expected_checksum = getattr(fd, "%s_expected" % checksum_id, None)
                     if expected_checksum is None:
                         continue
 
@@ -462,50 +464,96 @@ def set_purposes(d, element, *var_names, force_purposes=[]):
     ]
 
 
-def create_spdx(d):
-    def set_var_field(var, obj, name, package=None):
-        val = None
-        if package:
-            val = d.getVar("%s:%s" % (var, package))
+def set_purls(spdx_package, purls):
+    if purls:
+        spdx_package.software_packageUrl = purls[0]
 
-        if not val:
-            val = d.getVar(var)
+    for p in sorted(set(purls)):
+        spdx_package.externalIdentifier.append(
+            oe.spdx30.ExternalIdentifier(
+                externalIdentifierType=oe.spdx30.ExternalIdentifierType.packageUrl,
+                identifier=p,
+            )
+        )
 
-        if val:
-            setattr(obj, name, val)
+
+def create_recipe_spdx(d):
+    deploydir = Path(d.getVar("SPDXRECIPEDEPLOY"))
+    deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
+    pn = d.getVar("PN")
 
     license_data = oe.spdx_common.load_spdx_license_data(d)
 
-    deploydir = Path(d.getVar("SPDXDEPLOY"))
-    deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
-    spdx_workdir = Path(d.getVar("SPDXWORK"))
-    include_sources = d.getVar("SPDX_INCLUDE_SOURCES") == "1"
-    pkg_arch = d.getVar("SSTATE_PKGARCH")
-    is_native = bb.data.inherits_class("native", d) or bb.data.inherits_class(
-        "cross", d
-    )
     include_vex = d.getVar("SPDX_INCLUDE_VEX")
     if not include_vex in ("none", "current", "all"):
         bb.fatal("SPDX_INCLUDE_VEX must be one of 'none', 'current', 'all'")
 
-    build_objset = oe.sbom30.ObjectSet.new_objset(d, "recipe-" + d.getVar("PN"))
+    recipe_objset = oe.sbom30.ObjectSet.new_objset(d, "static-" + pn)
 
-    build = build_objset.new_task_build("recipe", "recipe")
-    build_objset.set_element_alias(build)
+    recipe = recipe_objset.add_root(
+        oe.spdx30.software_Package(
+            _id=recipe_objset.new_spdxid("recipe", pn),
+            creationInfo=recipe_objset.doc.creationInfo,
+            name=d.getVar("PN"),
+            software_packageVersion=d.getVar("PV"),
+            software_primaryPurpose=oe.spdx30.software_SoftwarePurpose.specification,
+            software_sourceInfo=json.dumps(
+                {
+                    "FILENAME": os.path.basename(d.getVar("FILE")),
+                    "FILE_LAYERNAME": d.getVar("FILE_LAYERNAME"),
+                },
+                separators=(",", ":"),
+            ),
+        )
+    )
 
-    build_objset.doc.rootElement.append(build)
+    set_purls(recipe, (d.getVar("SPDX_PACKAGE_URLS") or "").split())
+
+    # TODO: This doesn't work before do_unpack because the license text has to
+    # be available for recipes with NO_GENERIC_LICENSE
+    # recipe_spdx_license = add_license_expression(
+    #    d,
+    #    recipe_objset,
+    #    d.getVar("LICENSE"),
+    #    license_data,
+    # )
+    # recipe_objset.new_relationship(
+    #    [recipe],
+    #    oe.spdx30.RelationshipType.hasDeclaredLicense,
+    #    [oe.sbom30.get_element_link_id(recipe_spdx_license)],
+    # )
+
+    if val := d.getVar("HOMEPAGE"):
+        recipe.software_homePage = val
+
+    if val := d.getVar("SUMMARY"):
+        recipe.summary = val
+
+    if val := d.getVar("DESCRIPTION"):
+        recipe.description = val
+
+    for cpe_id in oe.cve_check.get_cpe_ids(
+        d.getVar("CVE_PRODUCT"), d.getVar("CVE_VERSION")
+    ):
+        recipe.externalIdentifier.append(
+            oe.spdx30.ExternalIdentifier(
+                externalIdentifierType=oe.spdx30.ExternalIdentifierType.cpe23,
+                identifier=cpe_id,
+            )
+        )
 
-    build_objset.set_is_native(is_native)
+    dep_objsets, dep_recipes = collect_dep_objsets(
+        d, "static", "static-", oe.spdx30.software_Package
+    )
 
-    for var in (d.getVar("SPDX_CUSTOM_ANNOTATION_VARS") or "").split():
-        build_objset.new_annotation(
-            build,
-            "%s=%s" % (var, d.getVar(var)),
-            oe.spdx30.AnnotationType.other,
+    if dep_recipes:
+        recipe_objset.new_scoped_relationship(
+            [recipe],
+            oe.spdx30.RelationshipType.dependsOn,
+            oe.spdx30.LifecycleScopeType.build,
+            sorted(oe.sbom30.get_element_link_id(dep) for dep in dep_recipes),
         )
 
-    build_inputs = set()
-
     # Add CVEs
     cve_by_status = {}
     if include_vex != "none":
@@ -514,7 +562,7 @@ def create_spdx(d):
             decoded_status = {
                 "mapping": patched_cve["abbrev-status"],
                 "detail": patched_cve["status"],
-                "description": patched_cve.get("justification", None)
+                "description": patched_cve.get("justification", None),
             }
 
             # If this CVE is fixed upstream, skip it unless all CVEs are
@@ -531,8 +579,7 @@ def create_spdx(d):
                 bb.debug(1, "Skipping %s since it is already fixed upstream" % cve)
                 continue
 
-            spdx_cve = build_objset.new_cve_vuln(cve)
-            build_objset.set_element_alias(spdx_cve)
+            spdx_cve = recipe_objset.new_cve_vuln(cve)
 
             cve_by_status.setdefault(decoded_status["mapping"], {})[cve] = (
                 spdx_cve,
@@ -540,13 +587,118 @@ def create_spdx(d):
                 decoded_status["description"],
             )
 
+    all_cves = set()
+    for status, cves in cve_by_status.items():
+        for cve, items in cves.items():
+            spdx_cve, detail, description = items
+            spdx_cve_id = oe.sbom30.get_element_link_id(spdx_cve)
+
+            all_cves.add(spdx_cve)
+
+            if status == "Patched":
+                recipe_objset.new_vex_patched_relationship([spdx_cve_id], [recipe])
+            elif status == "Unpatched":
+                recipe_objset.new_vex_unpatched_relationship([spdx_cve_id], [recipe])
+            elif status == "Ignored":
+                spdx_vex = recipe_objset.new_vex_ignored_relationship(
+                    [spdx_cve_id],
+                    [recipe],
+                    impact_statement=description,
+                )
+
+                vex_just_type = d.getVarFlag("CVE_CHECK_VEX_JUSTIFICATION", detail)
+                if vex_just_type:
+                    if (
+                        vex_just_type
+                        not in oe.spdx30.security_VexJustificationType.NAMED_INDIVIDUALS
+                    ):
+                        bb.fatal(
+                            f"Unknown vex justification '{vex_just_type}', detail '{detail}', for ignored {cve}"
+                        )
+
+                    for v in spdx_vex:
+                        v.security_justificationType = (
+                            oe.spdx30.security_VexJustificationType.NAMED_INDIVIDUALS[
+                                vex_just_type
+                            ]
+                        )
+
+            elif status == "Unknown":
+                bb.note(f"Skipping {cve} with status 'Unknown'")
+            else:
+                bb.fatal(f"Unknown {cve} status '{status}'")
+
+    if all_cves:
+        recipe_objset.new_relationship(
+            [recipe],
+            oe.spdx30.RelationshipType.hasAssociatedVulnerability,
+            sorted(list(all_cves)),
+        )
+
+    oe.sbom30.write_recipe_jsonld_doc(d, recipe_objset, "static", deploydir)
+
+
+def load_recipe_spdx(d):
+
+    return oe.sbom30.find_root_obj_in_jsonld(
+        d,
+        "static",
+        "static-" + d.getVar("PN"),
+        oe.spdx30.software_Package,
+    )
+
+
+def create_spdx(d):
+    def set_var_field(var, obj, name, package=None):
+        val = None
+        if package:
+            val = d.getVar("%s:%s" % (var, package))
+
+        if not val:
+            val = d.getVar(var)
+
+        if val:
+            setattr(obj, name, val)
+
+    license_data = oe.spdx_common.load_spdx_license_data(d)
+
+    pn = d.getVar("PN")
+    deploydir = Path(d.getVar("SPDXDEPLOY"))
+    deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
+    spdx_workdir = Path(d.getVar("SPDXWORK"))
+    include_sources = d.getVar("SPDX_INCLUDE_SOURCES") == "1"
+    pkg_arch = d.getVar("SSTATE_PKGARCH")
+    is_native = bb.data.inherits_class("native", d) or bb.data.inherits_class(
+        "cross", d
+    )
+
+    recipe, recipe_objset = load_recipe_spdx(d)
+
+    build_objset = oe.sbom30.ObjectSet.new_objset(d, "build-" + pn)
+
+    build = build_objset.new_task_build("recipe", "recipe")
+    build_objset.set_element_alias(build)
+
+    build_objset.doc.rootElement.append(build)
+
+    build_objset.set_is_native(is_native)
+
+    for var in (d.getVar("SPDX_CUSTOM_ANNOTATION_VARS") or "").split():
+        build_objset.new_annotation(
+            build,
+            "%s=%s" % (var, d.getVar(var)),
+            oe.spdx30.AnnotationType.other,
+        )
+
+    build_inputs = set()
+
     cpe_ids = oe.cve_check.get_cpe_ids(d.getVar("CVE_PRODUCT"), d.getVar("CVE_VERSION"))
 
     source_files = add_download_files(d, build_objset)
     build_inputs |= source_files
 
     recipe_spdx_license = add_license_expression(
-        d, build_objset, d.getVar("LICENSE"), license_data
+        d, build_objset, d.getVar("LICENSE"), license_data, [recipe_objset]
     )
     build_objset.new_relationship(
         source_files,
@@ -575,7 +727,10 @@ def create_spdx(d):
         build_inputs |= files
         index_sources_by_hash(files, dep_sources)
 
-    dep_objsets, dep_builds = collect_dep_objsets(d, build)
+    dep_objsets, dep_builds = collect_dep_objsets(
+        d, "builds", "build-", oe.spdx30.build_Build
+    )
+
     if dep_builds:
         build_objset.new_scoped_relationship(
             [build],
@@ -587,6 +742,22 @@ def create_spdx(d):
     debug_source_ids = set()
     source_hash_cache = {}
 
+    # Collect all VEX statements from the recipe
+    vex_statements = {}
+    for rel in recipe_objset.foreach_filter(
+        oe.spdx30.Relationship,
+        relationshipType=oe.spdx30.RelationshipType.hasAssociatedVulnerability,
+    ):
+        for cve in rel.to:
+            vex_statements[cve] = []
+
+    for cve in vex_statements.keys():
+        for rel in recipe_objset.foreach_filter(
+            oe.spdx30.security_VexVulnAssessmentRelationship,
+            from_=cve,
+        ):
+            vex_statements[cve].append(rel)
+
     # Write out the package SPDX data now. It is not complete as we cannot
     # write the runtime data, so write it to a staging area and a later task
     # will write out the final collection
@@ -645,16 +816,7 @@ def create_spdx(d):
                 or ""
             ).split()
 
-            if purls:
-                spdx_package.software_packageUrl = purls[0]
-
-            for p in sorted(set(purls)):
-                spdx_package.externalIdentifier.append(
-                    oe.spdx30.ExternalIdentifier(
-                        externalIdentifierType=oe.spdx30.ExternalIdentifierType.packageUrl,
-                        identifier=p,
-                    )
-                )
+            set_purls(spdx_package, purls)
 
             pkg_objset.new_scoped_relationship(
                 [oe.sbom30.get_element_link_id(build)],
@@ -663,6 +825,13 @@ def create_spdx(d):
                 [spdx_package],
             )
 
+            pkg_objset.new_scoped_relationship(
+                [oe.sbom30.get_element_link_id(recipe)],
+                oe.spdx30.RelationshipType.generates,
+                oe.spdx30.LifecycleScopeType.build,
+                [spdx_package],
+            )
+
             for cpe_id in cpe_ids:
                 spdx_package.externalIdentifier.append(
                     oe.spdx30.ExternalIdentifier(
@@ -696,7 +865,11 @@ def create_spdx(d):
             package_license = d.getVar("LICENSE:%s" % package)
             if package_license and package_license != d.getVar("LICENSE"):
                 package_spdx_license = add_license_expression(
-                    d, build_objset, package_license, license_data
+                    d,
+                    build_objset,
+                    package_license,
+                    license_data,
+                    [recipe_objset],
                 )
             else:
                 package_spdx_license = recipe_spdx_license
@@ -721,58 +894,41 @@ def create_spdx(d):
                     [oe.sbom30.get_element_link_id(concluded_spdx_license)],
                 )
 
-            # NOTE: CVE Elements live in the recipe collection
-            all_cves = set()
-            for status, cves in cve_by_status.items():
-                for cve, items in cves.items():
-                    spdx_cve, detail, description = items
-                    spdx_cve_id = oe.sbom30.get_element_link_id(spdx_cve)
-
-                    all_cves.add(spdx_cve_id)
+            # Copy CVEs from recipe
+            if vex_statements:
+                pkg_objset.new_relationship(
+                    [spdx_package],
+                    oe.spdx30.RelationshipType.hasAssociatedVulnerability,
+                    sorted(
+                        oe.sbom30.get_element_link_id(cve)
+                        for cve in vex_statements.keys()
+                    ),
+                )
 
-                    if status == "Patched":
+            for cve, vexes in vex_statements.items():
+                for vex in vexes:
+                    if vex.relationshipType == oe.spdx30.RelationshipType.fixedIn:
                         pkg_objset.new_vex_patched_relationship(
-                            [spdx_cve_id], [spdx_package]
+                            [oe.sbom30.get_element_link_id(cve)], [spdx_package]
                         )
-                    elif status == "Unpatched":
+                    elif vex.relationshipType == oe.spdx30.RelationshipType.affects:
                         pkg_objset.new_vex_unpatched_relationship(
-                            [spdx_cve_id], [spdx_package]
+                            [oe.sbom30.get_element_link_id(cve)], [spdx_package]
                         )
-                    elif status == "Ignored":
+                    elif (
+                        vex.relationshipType == oe.spdx30.RelationshipType.doesNotAffect
+                    ):
                         spdx_vex = pkg_objset.new_vex_ignored_relationship(
-                            [spdx_cve_id],
+                            [oe.sbom30.get_element_link_id(cve)],
                             [spdx_package],
-                            impact_statement=description,
+                            impact_statement=vex.security_impactStatement,
                         )
 
-                        vex_just_type = d.getVarFlag(
-                            "CVE_CHECK_VEX_JUSTIFICATION", detail
-                        )
-                        if vex_just_type:
-                            if (
-                                vex_just_type
-                                not in oe.spdx30.security_VexJustificationType.NAMED_INDIVIDUALS
-                            ):
-                                bb.fatal(
-                                    f"Unknown vex justification '{vex_just_type}', detail '{detail}', for ignored {cve}"
-                                )
-
+                        if vex.security_justificationType:
                             for v in spdx_vex:
-                                v.security_justificationType = oe.spdx30.security_VexJustificationType.NAMED_INDIVIDUALS[
-                                    vex_just_type
-                                ]
-
-                    elif status == "Unknown":
-                        bb.note(f"Skipping {cve} with status 'Unknown'")
-                    else:
-                        bb.fatal(f"Unknown {cve} status '{status}'")
-
-            if all_cves:
-                pkg_objset.new_relationship(
-                    [spdx_package],
-                    oe.spdx30.RelationshipType.hasAssociatedVulnerability,
-                    sorted(list(all_cves)),
-                )
+                                v.security_justificationType = (
+                                    vex.security_justificationType
+                                )
 
             bb.debug(1, "Adding package files to SPDX for package %s" % pkg_name)
             package_files = add_package_files(
@@ -851,14 +1007,15 @@ def create_spdx(d):
                 status = "enabled" if feature in enabled else "disabled"
                 build.build_parameter.append(
                     oe.spdx30.DictionaryEntry(
-                        key=f"PACKAGECONFIG:{feature}",
-                        value=status
+                        key=f"PACKAGECONFIG:{feature}", value=status
                     )
                 )
 
-            bb.note(f"Added PACKAGECONFIG entries: {len(enabled)} enabled, {len(disabled)} disabled")
+            bb.note(
+                f"Added PACKAGECONFIG entries: {len(enabled)} enabled, {len(disabled)} disabled"
+            )
 
-    oe.sbom30.write_recipe_jsonld_doc(d, build_objset, "recipes", deploydir)
+    oe.sbom30.write_recipe_jsonld_doc(d, build_objset, "builds", deploydir)
 
 
 def create_package_spdx(d):
@@ -1197,17 +1354,17 @@ def create_image_spdx(d):
             image_path = image_deploy_dir / image_filename
             if os.path.isdir(image_path):
                 a = add_package_files(
-                        d,
-                        objset,
-                        image_path,
-                        lambda file_counter: objset.new_spdxid(
-                            "imagefile", str(file_counter)
-                        ),
-                        lambda filepath: [],
-                        license_data=None,
-                        ignore_dirs=[],
-                        ignore_top_level_dirs=[],
-                        archive=None,
+                    d,
+                    objset,
+                    image_path,
+                    lambda file_counter: objset.new_spdxid(
+                        "imagefile", str(file_counter)
+                    ),
+                    lambda filepath: [],
+                    license_data=None,
+                    ignore_dirs=[],
+                    ignore_top_level_dirs=[],
+                    archive=None,
                 )
                 artifacts.extend(a)
             else:
@@ -1234,7 +1391,6 @@ def create_image_spdx(d):
 
                 set_timestamp_now(d, a, "builtTime")
 
-
         if artifacts:
             objset.new_scoped_relationship(
                 [image_build],
diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index 5830d7c087..759ca86b73 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -141,6 +141,11 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
     SPDX_CLASS = "create-spdx-3.0"
 
     def test_base_files(self):
+        self.check_recipe_spdx(
+            "base-files",
+            "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/static/static-base-files.spdx.json",
+            task="create_recipe_spdx",
+        )
         self.check_recipe_spdx(
             "base-files",
             "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/packages/package-base-files.spdx.json",
@@ -149,7 +154,7 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
     def test_gcc_include_source(self):
         objset = self.check_recipe_spdx(
             "gcc",
-            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/recipes/recipe-gcc.spdx.json",
+            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/builds/build-gcc.spdx.json",
             extraconf="""\
                 SPDX_INCLUDE_SOURCES = "1"
                 """,
@@ -162,12 +167,12 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
             if software_file.name == filename:
                 found = True
                 self.logger.info(
-                    f"The spdxId of {filename} in recipe-gcc.spdx.json is {software_file.spdxId}"
+                    f"The spdxId of {filename} in build-gcc.spdx.json is {software_file.spdxId}"
                 )
                 break
 
         self.assertTrue(
-            found, f"Not found source file {filename} in recipe-gcc.spdx.json\n"
+            found, f"Not found source file {filename} in build-gcc.spdx.json\n"
         )
 
     def test_core_image_minimal(self):
@@ -305,7 +310,7 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
         # This will fail with NameError if new_annotation() is called incorrectly
         objset = self.check_recipe_spdx(
             "base-files",
-            "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/recipes/recipe-base-files.spdx.json",
+            "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/builds/build-base-files.spdx.json",
             extraconf=textwrap.dedent(
                 f"""\
                 ANNOTATION1 = "{ANNOTATION_VAR1}"
@@ -360,8 +365,8 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
 
     def test_kernel_config_spdx(self):
         kernel_recipe = get_bb_var("PREFERRED_PROVIDER_virtual/kernel")
-        spdx_file = f"recipe-{kernel_recipe}.spdx.json"
-        spdx_path = f"{{DEPLOY_DIR_SPDX}}/{{SSTATE_PKGARCH}}/recipes/{spdx_file}"
+        spdx_file = f"build-{kernel_recipe}.spdx.json"
+        spdx_path = f"{{DEPLOY_DIR_SPDX}}/{{SSTATE_PKGARCH}}/builds/{spdx_file}"
 
         # Make sure kernel is configured first
         bitbake(f"-c configure {kernel_recipe}")
@@ -392,7 +397,7 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
     def test_packageconfig_spdx(self):
         objset = self.check_recipe_spdx(
             "tar",
-            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/recipes/recipe-tar.spdx.json",
+            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/builds/build-tar.spdx.json",
             extraconf="""\
                 SPDX_INCLUDE_PACKAGECONFIG = "1"
                 """,
-- 
2.53.0


