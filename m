Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6068.1793051195747913951
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 14:46:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oSbwVeu0;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-48eee44b908so2107201fac.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 14:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793051195; x=1793655995; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ixwZywXXbhp5HqkpDBB0XHk0fgGBqlbqBA8TTGVPvA=;
        b=oSbwVeu02QtWd/k6UePS1x3V3WJBrTdy5HnyjCMCevy8MmSIVJOeIflFudF+nnvd24
         XeHK62TqEQSHMV5Pe09/n34SgIqcRORKLtPqWkbl0WfXr/m9WKloFjDgN2U0+aNpqV4l
         hR0mlZMY/GwhVjacR3/769yzLEGjgs0c74aHPoszsJxJp6oSHD8tBXp13iJ+47dDJ/vm
         0kayE5zjNy3nn6Jjh58MmucRdJRer+g8Dv2Gakf88obp99lrFOPDZcfE/586TRNEeqaU
         rjKB6Ui+YndgaP3FKsub99ZJAOULseuR4apGO/HdG/gxTHNBjJAakarpdZvkZUWJBSsK
         MAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793051195; x=1793655995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/ixwZywXXbhp5HqkpDBB0XHk0fgGBqlbqBA8TTGVPvA=;
        b=hMHWQKkyrUuB+q2DDXtLa88UM0ZsjqePp9/jM3fKwRWb0vCdKC+XA4vkAeMeR2KFMs
         0j1tBkYyxeB71jm9OSXmv3sY5rm9fk+B/U9fL8AsXzQ8Qj+dcN3TAQarahe9b2N87XYC
         fBhmo9cJ+kYYrquvvTmDawwfR3nR2bjPBtmFPYAt6Y3T+bxtA+iuwjh2SVIZHi9lDmB/
         27NSi3VqYyErwbTkRtrWt2h0CjutlQxYi3wub+t8D5A2RSGbiU3mL3MNxHBp7jNZxS4b
         0jgk9uwtZeDZEq7ZDhLVZqC+Y3EgJhoqNfYazoOO4joAD5j6dot221DPeUrB6tgifJSe
         i09w==
X-Gm-Message-State: AFq9FYLK3egJlR6G+ELID7J+T4R9A4mOPNzocSbpK2alACjUWckFHU9N
	zYtkqeG8AdOgx3udUHk0+5LV9IGG4Yr2zabvG/+NrRmapUrCYsRzCzP3ZEvR/Q==
X-Gm-Gg: AYBFou02st4gkMi6mWe69MIjdZ3b1LnYkAwALrYGIpHbCi1uWNEHRSypbbBS+y5MHEX
	UmiKpcqYwCuqptfJPCFo58qjgJLSNpf5k+awtLgbb2p70ZJL2RZgxs9XjDzCkWoTMCYxl6oH2oK
	jaMx0Igi3zmX8Jh6EoCTVtUcAXUnu7PZugwdgaVBTSIFDTcSftwXF6NZ89CqcFCuCBL1BGyJAe4
	B3b2xSDj4BNVmDVyFCwu4KBC1gXvHe0EUiF4410+DoPKoiGOaLY7xl39AImUn21vv4HJ1q1r72L
	y58wcglOu0LTEsc9JpO3TvbjZkXo9rfoZxAxJpH9yaCFdireq55UMXN+Vv9T9l+5WPwnAcFUNGV
	GUGIYrVrqDMf2CtjK/TgZpxsm/S69Yy0PfiiITRmi0jKWcB4xYlD19oU7s6zWeNTav7WZADOvcy
	ATSJO4c8/KHHO3EpuKatlfWoh38Ad3eYGcbe7BU7nJtZVfES3/QJQp6VJ/Nn5GqL79j+I5fmv6D
	jTettQa4Ns6nbxu2XfxRiuDoqm0lsMzyjGGfPwaYJTk7u5aDyIjng==
X-Received: by 2002:a05:6808:c1b4:b0:4b9:a8ac:479 with SMTP id 5614622812f47-55c0026d2c6mr5659200b6e.23.1793051194732;
        Mon, 26 Oct 2026 14:46:34 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::283f])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0424a05dsm6304219b6e.4.2026.10.26.14.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:46:34 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v5 6/6] spdx: Replace do_create_image_spdx with deploy task
Date: Mon, 26 Oct 2026 15:45:26 -0600
Message-ID: <20261026214627.2388650-7-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026214627.2388650-1-JPEWhacker@gmail.com>
References: <20260630210422.1903245-1-JPEWhacker@gmail.com>
 <20261026214627.2388650-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 21:46:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248699
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
index 6077105094..f79ecac153 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -375,9 +375,6 @@ python () {
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
index c1c0733508..567613cebc 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -1544,19 +1544,19 @@ def create_rootfs_spdx(d):
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
@@ -1649,13 +1649,18 @@ def create_image_spdx(d):
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
@@ -1677,7 +1682,9 @@ def create_image_sbom_spdx(d):
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

