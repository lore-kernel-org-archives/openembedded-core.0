Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11867.1793806544645950549
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 07:35:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=i6R8LxJJ;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6df5e315bd1so695561eaf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 07:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793806544; x=1794411344; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=znJsOH+KAlXRhXhiVX0zyArJLwg5I7pykD+KpriRkIo=;
        b=i6R8LxJJTa8Da6EckPjbU1ihGnm8zh0hjztb+G6gvlIMjCiLNyNcu842XiQbc2IljU
         1W3GTMiE9aHarnMU5g+pcSRCEF+XYFJzFCwBAeeO9zTdTiqLlo8nWX4pSaG0Pk8vRSRX
         QX7L5r31zecsvgXJChkq+hBWvrnNnL6aK3VFLUgloQyC0kiTLTdH4lQf0WCKc1llecbf
         HK1ICL4By0ZtcrJ0uN6b/4AlaBZPxfXIBHHumpdBP1vOf0gmTk+CUdbe+qi//uIHM9lt
         TRv8xm8qz5WMpMUvIbdQHFjul6wHRS56jlWWDel2OXtQbr0EZjx94OHUr7hXVdgCgaBc
         TzNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806544; x=1794411344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=znJsOH+KAlXRhXhiVX0zyArJLwg5I7pykD+KpriRkIo=;
        b=OQehuL8xyx5sX1eCm2je/iUri58k/952XaAslShl+D5kqptE4jbHSAjoqM+Ay8h6Kk
         8fneWgr/bJ7SUdSyTTfXAXRxiyCrqrJmAebH4/aG0amSUlYkJ9Gf7J3yM0FADPR7nMAx
         yQVvqvrJ9wn0bqxcv1aorgmadcpLVw/tIiRn5IbCU2Ai+DtLeKvFC1Vcm4z1E5ZWNtti
         Kv4UQDpT13v7DCp/vLD2k9aAFG7gcrTSS/8bBe6tKE79GDTE2y8S8Bl62UDUeqduu/OG
         XEXHNH2+BPjsgAXlKbmi3yz+iMfDKOwTD209Cp7LikpiZGhgbZ4dNnBwy5GXteKoK0fr
         /vCg==
X-Gm-Message-State: APuU4Z9Cj0bGZf1QLAiyjT7WXi5yKrNKHCNgCqpSf4hbqwhbbq1uC9v+
	quFseC2CRnUBNAm2aeuLWS6mxKblytopBD6DyTrhSt6njioOy+R7LTqOMYHwiQ==
X-Gm-Gg: AYBFou0Uc5MdKtOMPAIEsziBFvUO2n09xGo3EiCQPk+DbITllenAR/pE7vCzj6qLwyV
	e1/7u3ojsxjTYEQ+uSFvPWN06DSLnXqTAeerOUl4zWIpHdcd3ZZKj3kffjS8TyQhX0Zvt0OyvfV
	Gv7fxtT5AX3JPbw7mCvo6kj/+Gk4zkJR1HKDPOLvNFk0fyBDDDYDs30/D2qCB+aReM/rBie1wWI
	wxZW1PdHv2WO9xtZrEr+KNmgksQ6lbBTEvkC3x9SQRFgGDxF4n2p3ff+FHLth0YQ63r+DC3oLVl
	iEmx+bcdyGRi4Yd4RDXIDdnozaAQRo0Ns71YndCn2PIGZ1p/USF/qH1hmTU8yvHoCBsIJEBNvzV
	Y+cGWJhJPXOF1pHj6yxkc/a747tEVCPjOcOLE7OSdm8OoAmedSOMleP8XDLLXwFn9/a+DyiJThC
	/bYqUR9tVjsz8hsdfNGgIinIFm6dqrf6eul9tYP5MO98QLpAdToCcaVQ2B3eJ/qTjRRxA3rL1VF
	4L7+5tbfD3KnC4zyX4IVblxe7wjoJZKmKAZz7iWD03Hwr2t6Te4iszr7IZwmjR7O1UtQxALlDEt
	FC6hmkp2+X4m33I5vyHLFRjthIJe
X-Received: by 2002:a05:6808:3206:b0:4cb:818f:d56f with SMTP id 5614622812f47-5640deeb28cmr10965329b6e.23.1793806543716;
        Wed, 04 Nov 2026 07:35:43 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::1d6f])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9f8basm1894928b6e.12.2026.11.04.07.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:35:43 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v8 6/9] spdx: Replace do_create_image_spdx with deploy task
Date: Wed,  4 Nov 2026 08:33:59 -0700
Message-ID: <20261104153535.3184146-7-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104153535.3184146-1-JPEWhacker@gmail.com>
References: <20261028220609.1348489-1-JPEWhacker@gmail.com>
 <20261104153535.3184146-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 15:35:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249400
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
index 43e196806f..069c759523 100644
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

