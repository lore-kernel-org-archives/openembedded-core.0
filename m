Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31669.1793141382573749942
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 15:49:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=AsZyTsWs;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-48e9476e26aso151322fac.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 15:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793141382; x=1793746182; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ixwZywXXbhp5HqkpDBB0XHk0fgGBqlbqBA8TTGVPvA=;
        b=AsZyTsWs8F6r6ZEgreH5agLBMZd0Ip4c8Xoomj7QhRER4e4fz2SLKmmu1O3LefLpqE
         bTGYLR7GBovqKSZh3m6KhA8mGCKmm1l1F6QDL43BieqtdXAITLPW4YNahjmHdlX47o/j
         6rZW1ULri4bE5Mh3311mCaKhEdEeGohy85qgM0d/vurQVv5Xs+mlMS+pmCtuwh8ht606
         uEkKvYAMDJHYVJbA8aEKmpspC9An51BQkB/ufStFCjWrIQkH7x34/eY4j/+jORitnmti
         Jn7z26TsiOYfFPKr7Z/dwes8cb8AE0rOBN0WIIDfjBMAdO11S1p8pfSwfG5XsjFQuiGL
         CSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793141382; x=1793746182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/ixwZywXXbhp5HqkpDBB0XHk0fgGBqlbqBA8TTGVPvA=;
        b=E+zzNmKBhNv65vOO2zMd4SIvKBsxu21ZBh0z6IILL3hsoL2SWUg4EiDgcqmmPFPwN8
         YhTFeCaaxDSidwEx08lTLpmnPqgUifnu5WNXwjvvNZT6clYLkaHx++Z5I0v4kd+91yhM
         ibU56u/HEzZzsCO5Z6OhswwUEu4DQZoNEIqJkedayK8dqpZYF01TZ0v9VR/nmlT1niaI
         r+KtNqXC/5+XMHC1KtGTlmqy0lREH5m6QjmQtGCq6h0pJJMCsyqu41LLVS+BkuUyGfBU
         1Jef1szq4aQGZR8CtPTAUV00szRmtO8zyIWq9FV7W/cUoy+pwSrRg2YedRqes8Golx8U
         ytUA==
X-Gm-Message-State: AFq9FYIiO31LZco92XQE4DbCsbb/Z/YA1Rw/qHMFfagoQ+d7OYVUOFEj
	oYQswI//O5P+FHEcRcsoeLGOGQGuUmLLl6PyiOHx7omYCumQWx84dHIOZaUDWQ==
X-Gm-Gg: AYBFou09mk9ONPNlPSGb7f6HY9JwmrJOrYDU/2m71f+CvR/9vTe7nZuW3oXlZJ2sB18
	NJQ1cXcBwEVcfALXH7l2Alt+5SiSyImjgiuSpfbVXKU/wOsnFh8GeTZnyVA+ksZFFqy7Bgbo1/g
	ZMfv9ixhiQX0e9rjw9chOVG9TjHNo6+T0grnNeH/McuSEyrMfKD2YmITB8x6I8+C1zzdFLJUnbJ
	Pu1PLNRcjzfNQZWd8VPscqyNK9cqvQW0IJQT51NBjJxc3AUz+mpHD0HMRDIfKdx83917FMTys/0
	YBoFYXOmzIwDuItTNm9MTmY9pqa8esHIne86XRDFOsrizbVM4X5/ca6qlDr/RZwxn6GxhW+9Ren
	FztmquLZcWKGPBsC06PfJECNyrOu6B4OVfC5HPuyW0zmpdKJtnBMseCsLRVYOrU1dbfeW0u2dTZ
	PNLoW8ZRc5xhpyTGNrjVjdTaUBYSl1v+kCGhHIYMXwZzAfBfPtgZqixbo7O0AMjvvRmzlo4JFa/
	y9zXWBFQiwlqKU8ROZ3wfRQPzoRefcs+m8eZ/m6S6VwmF25Z4Qi/w==
X-Received: by 2002:a05:6870:d114:b0:491:993d:d9b0 with SMTP id 586e51a60fabf-4a8bb5ce9d2mr752393fac.13.1793141381746;
        Tue, 27 Oct 2026 15:49:41 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::1109])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b7979514sm1111037fac.17.2026.10.27.15.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 15:49:41 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v6 6/7] spdx: Replace do_create_image_spdx with deploy task
Date: Tue, 27 Oct 2026 16:47:20 -0600
Message-ID: <20261027224931.385138-7-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027224931.385138-1-JPEWhacker@gmail.com>
References: <20261026214627.2388650-1-JPEWhacker@gmail.com>
 <20261027224931.385138-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 22:49:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248770
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

