Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3759.1794253687841315510
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 11:48:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=t42GyvD7;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-70b875f6f1fso927167eaf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 11:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253687; x=1794858487; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=znJsOH+KAlXRhXhiVX0zyArJLwg5I7pykD+KpriRkIo=;
        b=t42GyvD7IkcO9Q7+X+2Xjzlu+zFnFPsYMUaXQV6X8vjFXNOpk5H4Kk/pW+SMRXnv24
         O5SEN8w6H9cMlRofvheDV8aiodJsG5dL3huOEyscVs64XScIaovdF5tyl6+Q0TTDILVU
         eC/MbGyd64boQGiHNQ4i/BxkqnygvKwCSd0pgWa06alef96VgzQarmVi2tylBat1ZEmF
         P7CtmLFKcfK2uQfV3PjVZiqdS01WfcWY/RMdHbEthe3EoXZ0rhwiVRAO1ElHzqwANcTY
         BuzLKs+zlgmkZ0CMej25GExnko+z7vyheOfGcBRW/7z8eysz1PQYOVnzDJ/yRpViC/fO
         4XiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253687; x=1794858487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=znJsOH+KAlXRhXhiVX0zyArJLwg5I7pykD+KpriRkIo=;
        b=pnnH/9anEPJioRkP/u1gtRVSOwXaatLnKJqph/tpmV2y3DRxjhX/RGSxTgapUnLVJI
         eTEdGwQxhXDsrzdV8cSeuoCXU7ruOEeoWRvOo1byuz//x22TpuORrF9M90rCaolr62IG
         eksY8OKQOdXUw6iX3CiOpkvXI4IyFMziB+NO/P0vRaDFdHFOSrkwbMYSktDmslcgUxhl
         0vrNYesUyrcsD6fZwkpp4NF0yayKPGNd0S0Q2uXLMWg9DkfclCFet31en2iESeUFdA5c
         WRQb+NWogaf7CYqTEmErjwsjiDmq0Ge/mQfZQvr3tV/bBHbIsg651dHHnAzMd6lWeUT+
         fJag==
X-Gm-Message-State: APuU4Z+mhjI0GV85gh7d9NA01FwkRhA/5Arqw0AvgBeilIgsAev+fOPM
	EHdsx44xCYwYFcrUeiDrzgCeDnhrcJqkI5VK1tVaCU6gQX+HyEwKxQsZI2uyBQ==
X-Gm-Gg: AYBFou2meY+rLbepXMTTwdMch4wGVtpswnKc74MY1Pf2XsYwpz6Oe7HVZlP6KYQIMIf
	Dv2OufkIXKgfrHRcqALHxiar3YNPa5PBlACyecM5Bt/a2nRO7bsZEsLYthXWSGz6OUAx9qAEIQZ
	K88ZVCqJHVbftSBjiclJPUd/5jWm0qdIf23H/AOzymKUutjIvO0i6bD5JrJ/aLk2as5TBvxyvcD
	79fZLixwFQZzqu/dtNPE0LIG/VvRRPoJy1M4AiV16s32+1Vz+28ijh4CMPeCAGTUbUWev27RsoM
	bXELarEW90GeUdT8T/CQH/Q+C9+lDpzZ8HIh0+7euWkr7+JnZa/3MDtzT+npJ5si/tow9V6w/sQ
	nHbop9Hxi459zmCSYIRUhic0ZJLzAB7lWab6UI55WdtfTmCGx+35e1b9UT06GfealsMqetTeK44
	H2m3s1fknrNMUihSPpJgza72DQMRGB2qcIRBeEWyBcIFDuMQ8oXkV506ckxa5WOT47CpZTeV2j8
	rQJqSvg30uWnGpTA2yoNfBE8JHgzKWBeWQsX0ka5MYsHIRhcVa2eMVMKgNlJElROhecbRxUAa+t
	/O59NqevHhTlhswsVknyVYJ5cCk=
X-Received: by 2002:a05:6820:8593:20b0:715:264c:2330 with SMTP id 006d021491bc7-718a5e4b845mr66558eaf.33.1794253686951;
        Mon, 09 Nov 2026 11:48:06 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::3232])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718aa132e65sm70363eaf.14.2026.11.09.11.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:48:06 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v9 6/9] spdx: Replace do_create_image_spdx with deploy task
Date: Mon,  9 Nov 2026 12:45:42 -0700
Message-ID: <20261109194759.550935-7-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109194759.550935-1-JPEWhacker@gmail.com>
References: <20261104153535.3184146-1-JPEWhacker@gmail.com>
 <20261109194759.550935-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 19:48:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249871
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

