Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8313.1793225179324877135
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 15:06:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=OvHWlMFW;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4932b13c4ccso912641fac.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 15:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793225178; x=1793829978; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hZSmURBO/asW2c3yPgYbfLgj6euKLa4vKOrL0iSBjEs=;
        b=OvHWlMFWFA7EcjfHbXJbkM7nu7NhUVpPZwHnNr6MUMMvymo1RE+GYRPhxQFLwsN30j
         C01q75gTVHGn33tOe5gBifbw6qXi8hJOuwutz20rgTaI0bMnAjxh2m4ius2HfFnxcUi4
         Br8kokHJe41UNHtmh7I3Z1qd6ZMhI6H3WJCJajccMKspD+d6vc8LD3a7rrIfbAsPd7Ce
         njYxFTKafnabwKofEjAdHxu/3hKS+bkA92iPhgffEuOOJkZ4S226DxXZGHMYVWmguOSf
         zJOM8Wf/YtRVDZvQCwrbjs9VaCKuF9rAa/j9/e6TPCYLIo8XVKez1i23FCNgy82kCv3d
         2elA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793225178; x=1793829978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hZSmURBO/asW2c3yPgYbfLgj6euKLa4vKOrL0iSBjEs=;
        b=rBdy3iAmyTF+SxfkRwqiJUwQXnnA7lbiUrwk32xGUt7vyN9iQUgfWp0nCuIuWUYVMx
         10a2BzAjkch683v8KoGT8qMBD4B5SRlu89TxDf8MbjrC+Wdou9hJFvPX2Ng55koBcPGV
         Hx3nh+U86NUw7QCBOecFkwD38sE19EK5vUo27RRHxFWb97veYajk33PcZByo+Niob9B7
         Sc8sdBUJG2LEk1ZWAqKIEI4Drk6offwOlHrTVaK7v2S/UiCUyIN0wMsMEHE4ylWQ6G3s
         CGglKW+GFaDHMLiwfCVqQ3DalcvJRrvY3JK6UW3CQMneJv+FDo6JqrIZO9EsgdDfl5TW
         k0cw==
X-Gm-Message-State: AFq9FYIVYqk8AlVPaVIA39U6vwsL7ZtReSFRleGl0cSA/4EEVI8cpeP0
	nv96KB59mOfPOBr8Ee9AXON0yR/7H3WvLl5DCKCb4AfFAbhuYCu8nIpnCGh2Bg==
X-Gm-Gg: AYBFou2+ZB2yxpK7QTG9I3dCjwMU8JL/D9zpTyLoZNY45tZygiS1y3J0sBbPe/nNgxQ
	RjiVehAqIqeY5GSeFfbXEJJDgF1sMYcXL6ZhUKEMHqWddORt3NA7aghJ9y30IG+qAjBzsAtRh20
	4qUzXDEk9JqVhE1l5aX+QKzkU/J4A+xtcPD7pGffgplVrOf4u0mrHQZaCIE/FZDTHbT/WNKFMHr
	b1By6AcdGD4nlUaFhYFDfxTwBTs6cNATlWAFFal/RzndQWB2/lYwRlxVi/as+nxFLohTniNhmu4
	Ni58zy8xoVzWC5u9Pmp0Faysam//932PdQi4gB90ZQU9ipNp1dJAdOG2YisvCgTmltaiiXH/+NW
	D118lG88xz+46QqM1d8Zfm9r8tksZV0Sy9iOgB4qNJHsfB/A0STHj3cODCcF2Si9xuxGbKheEF1
	1qJO/8r/dImL3raTMjCohmB7YeF+9KgoFo33cRT1NE35KbdGvhDc5iW+eqhyZfkKNmExyjToU4W
	mQG5uB7Pf0km7q5jadawwmF2P57LIBOyBQw8+b/QuDql8wTmkcCDFDbCPxky5QJ+frLEYb/YmfV
	9pKTyHVXJpWTBzhD2DOm+UVKJZo=
X-Received: by 2002:a05:6870:9f08:b0:475:e235:905 with SMTP id 586e51a60fabf-4a8bba79bfcmr2541449fac.35.1793225178493;
        Wed, 28 Oct 2026 15:06:18 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::8aac])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b77abffcsm3527597fac.4.2026.10.28.15.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 15:06:17 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v7 6/8] spdx: Replace do_create_image_spdx with deploy task
Date: Wed, 28 Oct 2026 16:04:37 -0600
Message-ID: <20261028220609.1348489-7-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028220609.1348489-1-JPEWhacker@gmail.com>
References: <20261027224931.385138-1-JPEWhacker@gmail.com>
 <20261028220609.1348489-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 22:06:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248843
Content-Type: text/plain; charset="utf-8"

Replaces the dedicated do_create_image_spdx task with a deploy task tied
to do_image_complete (which is task that deploys images).

This has the advantage that images recipe SPDX dependencies are now
completely automatically detected in the task graph, and the SPDX
documents are merged in automatically when dependencies on
do_image_complete are detected

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../create-spdx-image-3.0.bbclass             | 32 +++++++------------
 meta/classes-recipe/nospdx.bbclass            |  1 -
 meta/classes/create-spdx-3.0.bbclass          |  3 --
 meta/classes/spdx-common.bbclass              |  1 -
 meta/lib/oe/spdx30_tasks.py                   | 23 ++++++++-----
 5 files changed, 27 insertions(+), 33 deletions(-)

diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/classes-recipe/create-spdx-image-3.0.bbclass
index b60cdd826f..64cb065632 100644
--- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
+++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
@@ -30,7 +30,7 @@ python do_create_rootfs_spdx() {
     import oe.spdx30_tasks
     oe.spdx30_tasks.create_rootfs_spdx(d)
 }
-addtask do_create_rootfs_spdx after do_rootfs do_create_recipe_spdx before do_image
+addtask do_create_rootfs_spdx after do_rootfs do_create_recipe_spdx before do_image do_image_complete
 SSTATETASKS += "do_create_rootfs_spdx"
 do_create_rootfs_spdx[sstate-inputdirs] = "${SPDXROOTFSDEPLOY}"
 do_create_rootfs_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
@@ -43,33 +43,25 @@ python do_create_rootfs_spdx_setscene() {
 }
 addtask do_create_rootfs_spdx_setscene
 
-python do_create_image_spdx() {
+python create_image_spdx() {
     import oe.spdx30_tasks
-    oe.spdx30_tasks.create_image_spdx(d)
-}
-addtask do_create_image_spdx after do_image_complete do_create_rootfs_spdx do_create_recipe_spdx before do_build
-SSTATETASKS += "do_create_image_spdx"
-SSTATE_SKIP_CREATION:task-create-image-spdx = "1"
-do_create_image_spdx[sstate-inputdirs] = "${SPDXIMAGEWORK}"
-do_create_image_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
-do_create_image_spdx[cleandirs] = "${SPDXIMAGEWORK}"
-do_create_image_spdx[dirs] = "${SPDXIMAGEWORK}"
-do_create_image_spdx[file-checksums] += "${SPDX3_DEP_FILES}"
-do_create_image_spdx[vardeps] += "\
-    SPDX_IMAGE_PURPOSE \
-    "
+    from pathlib import Path
+    current_task = "do_" + d.getVar("BB_CURRENTTASK")
 
-python do_create_image_spdx_setscene() {
-    sstate_setscene(d)
-}
-addtask do_create_image_spdx_setscene
+    spdxdeploydir = Path(d.getVar("SPDXDIR") + "/deploy-" + current_task)
 
+    oe.spdx30_tasks.create_image_spdx(d, spdxdeploydir)
+}
+oe.spdx30_tasks.create_image_spdx[vardeps] += "SPDX_IMAGE_PURPOSE"
+SPDX_DEPLOY_TASKS += "do_image_complete:create_image_spdx"
+# No deploy sbom is needed since do_create_image_sbom_spdx() is used instead
+SPDX_DEPLOY_SBOM = "0"
 
 python do_create_image_sbom_spdx() {
     import oe.spdx30_tasks
     oe.spdx30_tasks.create_image_sbom_spdx(d)
 }
-addtask do_create_image_sbom_spdx after do_create_rootfs_spdx do_create_image_spdx before do_build
+addtask do_create_image_sbom_spdx after do_create_rootfs_spdx do_image_complete before do_build
 SSTATETASKS += "do_create_image_sbom_spdx"
 SSTATE_SKIP_CREATION:task-create-image-sbom-spdx = "1"
 do_create_image_sbom_spdx[sstate-inputdirs] = "${SPDXIMAGEDEPLOYDIR}"
diff --git a/meta/classes-recipe/nospdx.bbclass b/meta/classes-recipe/nospdx.bbclass
index 723194da2d..fafcdd0a13 100644
--- a/meta/classes-recipe/nospdx.bbclass
+++ b/meta/classes-recipe/nospdx.bbclass
@@ -10,6 +10,5 @@ deltask do_create_spdx
 deltask do_create_spdx_runtime
 deltask do_create_package_spdx
 deltask do_create_rootfs_spdx
-deltask do_create_image_spdx
 deltask do_create_image_sbom_spdx
 deltask do_create_deploy_sbom
diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index fb6a4f249e..0d0bddcc67 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -381,9 +381,6 @@ python () {
         # for the recipe, at least until it's possible for do_populate_sysroot
         # to describe it's own output.
         "do_populate_sysroot": "do_create_spdx",
-        # If an image is needed, also depend on the task to create the SBoM for
-        # the image
-        "do_image_complete": "do_create_image_spdx",
     }
 
     def map_task_deps(task, flag):
diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index bca169670d..13839aac3a 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -15,7 +15,6 @@ CVE_VERSION ??= "${PV}"
 SPDXDIR ??= "${WORKDIR}/spdx/${SPDX_VERSION}"
 SPDXDEPLOY = "${SPDXDIR}/deploy"
 SPDXWORK = "${SPDXDIR}/work"
-SPDXIMAGEWORK = "${SPDXDIR}/image-work"
 SPDXSDKWORK = "${SPDXDIR}/sdk-work"
 SPDXSDKEXTWORK = "${SPDXDIR}/sdk-ext-work"
 SPDXDEPS = "${SPDXDIR}/deps.json"
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index ce28ab4500..6010fe7230 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -1546,19 +1546,19 @@ def create_rootfs_spdx(d):
     )
 
 
-def create_image_spdx(d):
+def create_image_spdx(d, spdx_deploy_dir):
     import oe.sbom30
 
-    image_deploy_dir = Path(d.getVar("DEPLOY_DIR_IMAGE"))
+    pn = d.getVar("PN")
+    current_task = "do_" + d.getVar("BB_CURRENTTASK")
+
+    image_deploy_dir = Path(d.getVar("IMGDEPLOYDIR"))
     manifest_path = Path(d.getVar("IMAGE_OUTPUT_MANIFEST"))
-    spdx_work_dir = Path(d.getVar("SPDXIMAGEWORK"))
 
     image_basename = d.getVar("IMAGE_BASENAME")
     machine = d.getVar("MACHINE")
 
-    objset = oe.sbom30.ObjectSet.new_objset(
-        d, "%s-%s-image" % (image_basename, machine)
-    )
+    objset = oe.sbom30.ObjectSet.new_objset(d, f"{pn}-{current_task}-deploy")
 
     with manifest_path.open("r") as f:
         manifest = json.load(f)
@@ -1651,13 +1651,18 @@ def create_image_spdx(d):
     objset.add_aliases()
     objset.link()
     oe.sbom30.write_recipe_jsonld_doc(
-        d, objset, "image", spdx_work_dir, create_task_link=True
+        d,
+        objset,
+        "deploy",
+        spdx_deploy_dir,
+        create_task_link=True,
     )
 
 
 def create_image_sbom_spdx(d):
     import oe.sbom30
 
+    pn = d.getVar("PN")
     image_name = d.getVar("IMAGE_NAME")
     image_basename = d.getVar("IMAGE_BASENAME")
     image_link_name = d.getVar("IMAGE_LINK_NAME")
@@ -1679,7 +1684,9 @@ def create_image_sbom_spdx(d):
     root_elements.append(oe.sbom30.get_element_link_id(rootfs_image))
 
     image_objset, _ = oe.sbom30.find_jsonld(
-        d, "image", "%s-%s-image" % (image_basename, machine), required=True
+        d,
+        "deploy",
+        f"{pn}-do_image_complete-deploy",
     )
     for o in image_objset.foreach_root(oe.spdx30.software_File):
         root_elements.append(oe.sbom30.get_element_link_id(o))
-- 
2.56.0

