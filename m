Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F0AC3DA40
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 07:10:33 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.5048.1720077028765429440
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 00:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mlDF5DOX;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42565cdf99cso2348065e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 00:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720077027; x=1720681827; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YGgHOGkUBuv6eYgeSjuiCtb6ggI4omC5RLKnXlPWg5c=;
        b=mlDF5DOXWBJFdbYMV8w7lc2+gGKZ0mx4HeiPtJq3h73SJmMKmFwGm6G2qWImhC3R1o
         wQ/vjb6XyR+DHMsP+tXtJhwYrXON8dVPHy/KAgOpTMDN4FGskNU6yVx3ZUx0yEG54uqM
         /Xdv8WCr7WdsdJtt0G6HzXStXl1GdrIV1bDYI/yOqeDs94Bzo+ZWvCjy1Yg50C1zcVWr
         Ad5WKZSVCg01bV25jfMn9MNT+H9wUId10eEYvP4RWu8jVLevj8AhLmXMq+spIlKRWRQi
         uoFj/SZrxplrm/io59j39f91kt3bn6fHc1C8OFb0+43OCukrNNTqWzRKnkhJJwUO2pgm
         bgxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720077027; x=1720681827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGgHOGkUBuv6eYgeSjuiCtb6ggI4omC5RLKnXlPWg5c=;
        b=nxMJu48tpKHkJNgSFntaMo+mJYUXb+GSklHA2mH96ZmBxfZJcleziqB+yBCF01yJKX
         DlBcE90x3WayZR3MJQJsITEl10rAD7hyMTXrb+P2UX05z62B1pHXriyfN4xJy717SZnp
         PHoUn2reF82JDMFttNjE1bs3u2tOlv7rwj+o3k1MVaYsijzmDp9Svss+1ZX5ggznZ2qe
         wgujk31KmaiNNX6DM9UgM5E2G6UfgKopElrEke5Y79aeWVSAj2+DjR6Ff0ZRNxOQD+zI
         q/9C2FVvcuz0UUtSe/zh86YIT33+UlyWHs5fvLegEtQdOyTqU9fqAItAkdIDhXG/crB7
         Cp1Q==
X-Gm-Message-State: AOJu0Yym6llkplmm0GPKLYqDTkeA5j0dzMFnSrbkNNi0jWDAnG58x2X5
	R/Cx/LarSDXgKBqP/2gg3UZyfUaIVV7Fh30RFzrGaCNqbIw21jL8ZtfRAw==
X-Google-Smtp-Source: AGHT+IEe8NKC3mxzrPG6MjUzQwIzHVENGfnfX7PcDm1l+EV9JBbg/OzwMgdujmvxc28sl4Lj+zLLiw==
X-Received: by 2002:a05:600c:511c:b0:424:a4a2:9478 with SMTP id 5b1f17b1804b1-4264a3f2f7emr7060975e9.25.1720077026846;
        Thu, 04 Jul 2024 00:10:26 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1f23f9sm11597255e9.26.2024.07.04.00.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 00:10:26 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 11/14] kernel-fitimage: fix intentation
Date: Thu,  4 Jul 2024 09:09:47 +0200
Message-ID: <20240704071013.2982700-12-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240704071013.2982700-1-adrian.freihofer@gmail.com>
References: <20240704071013.2982700-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 07:10:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201516

From: Adrian Freihofer <adrian.freihofer@siemens.com>

python part should be 4 spaces, not 8.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 52 ++++++++++-----------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index 64836f6bef0..88b8edb9b54 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -29,32 +29,32 @@ KERNEL_IMAGETYPE_REPLACEMENT ?= "${@get_fit_replacement_type(d)}"
 DEPENDS:append = " ${@'u-boot-tools-native dtc-native' if 'fitImage' in (d.getVar('KERNEL_IMAGETYPES') or '').split() else ''}"
 
 python __anonymous () {
-        # Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
-        # to kernel.bbclass . We have to override it, since we pack zImage
-        # (at least for now) into the fitImage .
-        typeformake = d.getVar("KERNEL_IMAGETYPE_FOR_MAKE") or ""
-        if 'fitImage' in typeformake.split():
-            d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake.replace('fitImage', d.getVar('KERNEL_IMAGETYPE_REPLACEMENT')))
-
-        if bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE')):
-            bb.build.addtask('assemble_fitimage_initramfs', 'do_deploy', 'do_bundle_initramfs', d)
-        else:
-            bb.build.addtask('assemble_fitimage_initramfs', 'do_deploy', 'do_install', d)
-
-        image = d.getVar('INITRAMFS_IMAGE')
-        if image:
-            d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
-
-        ubootenv = d.getVar('UBOOT_ENV')
-        if ubootenv:
-            d.appendVarFlag('do_assemble_fitimage', 'depends', ' virtual/bootloader:do_populate_sysroot')
-
-        #check if there are any dtb providers
-        providerdtb = d.getVar("PREFERRED_PROVIDER_virtual/dtb")
-        if providerdtb:
-            d.appendVarFlag('do_assemble_fitimage', 'depends', ' virtual/dtb:do_populate_sysroot')
-            d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' virtual/dtb:do_populate_sysroot')
-            d.setVar('EXTERNAL_KERNEL_DEVICETREE', "${RECIPE_SYSROOT}/boot/devicetree")
+    # Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
+    # to kernel.bbclass . We have to override it, since we pack zImage
+    # (at least for now) into the fitImage .
+    typeformake = d.getVar("KERNEL_IMAGETYPE_FOR_MAKE") or ""
+    if 'fitImage' in typeformake.split():
+        d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake.replace('fitImage', d.getVar('KERNEL_IMAGETYPE_REPLACEMENT')))
+
+    if bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE')):
+        bb.build.addtask('assemble_fitimage_initramfs', 'do_deploy', 'do_bundle_initramfs', d)
+    else:
+        bb.build.addtask('assemble_fitimage_initramfs', 'do_deploy', 'do_install', d)
+
+    image = d.getVar('INITRAMFS_IMAGE')
+    if image:
+        d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
+
+    ubootenv = d.getVar('UBOOT_ENV')
+    if ubootenv:
+        d.appendVarFlag('do_assemble_fitimage', 'depends', ' virtual/bootloader:do_populate_sysroot')
+
+    #check if there are any dtb providers
+    providerdtb = d.getVar("PREFERRED_PROVIDER_virtual/dtb")
+    if providerdtb:
+        d.appendVarFlag('do_assemble_fitimage', 'depends', ' virtual/dtb:do_populate_sysroot')
+        d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' virtual/dtb:do_populate_sysroot')
+        d.setVar('EXTERNAL_KERNEL_DEVICETREE', "${RECIPE_SYSROOT}/boot/devicetree")
 }
 
 
-- 
2.45.2


