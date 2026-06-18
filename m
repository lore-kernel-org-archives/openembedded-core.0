Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA0FCD98FF
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 16:50:47 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24331.1781801441069950696
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 09:50:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lgLl+o27;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4864aea1316so694814b6e.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 09:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781801440; x=1782406240; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jx0YobAOck+2Vy7wKwLs9JsZ95vr20hd0zJqDzYngik=;
        b=lgLl+o27F9p1pTeTYUmxaXB/4mAfaSS8Pqp/Ax1Z+1hJ8P707Y346KSChHgKbldY7i
         F+SG/oaVwDJXpt7lv+7gHwcnsqQcOWLPS1av4NiBI2JphHnUABenPrg8yCmeiHk+Eyv5
         Tq39jKYQbYl4I6WPvetXZoRF3cIsmws6wAZkWX4T2FcpjlGvVzaleREZUskAmbxt95nE
         E+j3CkrF7WpHGlTIeNTyhF7IfDh4pzjMFQR9+Gy+uVSHeOPqEEOXYWkXYNZYWv49b0eU
         zNvDnZs6gTY+ok1YyTSteY+4xsdDsqKg75WImwk8+WkALHAvEmJzIwB4iG2d56kDM/3g
         n5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781801440; x=1782406240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jx0YobAOck+2Vy7wKwLs9JsZ95vr20hd0zJqDzYngik=;
        b=IyO7+u/2zg//Xudt8KSoJW2N2hxrIkPwCR3WJhNpxpnQxyFobbH+tPrN7JQ/nhZliz
         Mgcz8W6PQrcNUp/cnhtQmHsTvodSFuKDLg0dtNCip7swZJhaCujmoD2Bv5qXd/Urx6ET
         6+aZpkpDt1yLgD1rrFn+tCBc4DqjHvUSIDSkP/Vjawc/x5tTawqCd1fRDn+wqzo6ldQG
         aRqujW5MSJgBFB538drLlE0efF/5DrW2xkv51O40X4UdwVXS+R8Cti2L8wUCfg+12o9n
         EdVw9Lp+q3q9kOK5NinRy1hMA3MqL7f0CDUxJIs5cOoAUKfSwHVgm6AdWd9d3DuV+OB8
         5ioA==
X-Gm-Message-State: AOJu0YxNtRVuGWckAdNPx5XnGrABwwfRAIRThJBG3cx3URbwiq2u7yj7
	xU1p23VHlI3VYmsadZYyzLSAKwaEGgzDOf7xplmw6qwERiE/ux5BgBcZ/OY7dQ==
X-Gm-Gg: AfdE7clYyNLkpjhBT3YC5Bm/+brJnGA0jJtMoN9mGMbn791yJ6x19KLtW7HwHBX3nH0
	SVPy2OT1qsgmpvA2UOA8Uke9xVT4I8eiH+99JbfFYWGpiG7RgLuiC98Xzb26TPH4iiyYx7Tpdzx
	u6ZAxj7V0jDkgN6MlDoq/RqYimYf52ky2VCSVHO/hPIQHZYtGoz+B0DNcnEQbdowd4zw8tZN8fX
	iFIZxQlKJ5PHNxqWvizU7pXNBt3Y2/6tuWMDta5rFjnupJ10liyC/KPt5UcOh6g6mDrs/MBtmDK
	TAEBXUVMh1G17wtPQmmppZMEoyCpRd9Uyw4YSw0EqRUJ/Ypv91HxCv/ES+8Ph/YhKcjJkbGPU+l
	lFJD1uC/J7b5AkuXPV0mmSajTIDk0ZXZsBX0mNDaXhu6LIv6gt8R4h5rWzfiJ9lH0NrBaQZl7Ar
	SHBi8nphG0Jw==
X-Received: by 2002:a05:6808:171a:b0:489:5df6:68ef with SMTP id 5614622812f47-4896accf5a5mr109766b6e.40.1781801440083;
        Thu, 18 Jun 2026 09:50:40 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::8b4b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4875dda5ee5sm8732987b6e.2.2026.06.18.09.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 09:50:39 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 4/5] spdx: Replace do_create_image_spdx with deploy task
Date: Thu, 18 Jun 2026 09:38:44 -0600
Message-ID: <20260618165032.347436-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618165032.347436-1-JPEWhacker@gmail.com>
References: <20260609222331.1293007-1-JPEWhacker@gmail.com>
 <20260618165032.347436-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 16:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239094

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
 meta/lib/oe/spdx30_tasks.py                   | 21 ++++++++----
 5 files changed, 26 insertions(+), 32 deletions(-)

diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/classes-recipe/create-spdx-image-3.0.bbclass
index a96cfb25ed..838a82c802 100644
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
 SSTATE_SKIP_CREATION:task-create-image-sbom = "1"
 do_create_image_sbom_spdx[sstate-inputdirs] = "${SPDXIMAGEDEPLOYDIR}"
diff --git a/meta/classes-recipe/nospdx.bbclass b/meta/classes-recipe/nospdx.bbclass
index b405f57d11..9c30c4d2c0 100644
--- a/meta/classes-recipe/nospdx.bbclass
+++ b/meta/classes-recipe/nospdx.bbclass
@@ -9,6 +9,5 @@ deltask do_create_spdx
 deltask do_create_spdx_runtime
 deltask do_create_package_spdx
 deltask do_create_rootfs_spdx
-deltask do_create_image_spdx
 deltask do_create_image_sbom
 deltask do_create_deploy_sbom
diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 13d1de2774..919de094f8 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -373,9 +373,6 @@ python () {
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
index 4a7d442ac7..6a3a626db1 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -1539,19 +1539,19 @@ def create_rootfs_spdx(d):
     )
 
 
-def create_image_spdx(d):
+def create_image_spdx(d, spdx_deploy_dir):
     import oe.sbom30
 
+    pn = d.getVar("PN")
+    current_task = "do_" + d.getVar("BB_CURRENTTASK")
+
     image_deploy_dir = Path(d.getVar("IMGDEPLOYDIR"))
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
@@ -1644,13 +1644,18 @@ def create_image_spdx(d):
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
@@ -1672,7 +1677,9 @@ def create_image_sbom_spdx(d):
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
2.54.0


