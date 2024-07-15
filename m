Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC886C3DA5D
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 14:15:18 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.38952.1721052910192393679
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 07:15:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YB4B2leO;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ee91d9cb71so45737571fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 07:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721052908; x=1721657708; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MHRGAKeXAQEg0wG7vpCt6KCDnhphvCiCi4pipi/lJg=;
        b=YB4B2leOU2k+iH5PyzHd3DLQ93kxyK7g/yDkPVeP7jK4bhbYzS89oJt1PLmmi72g28
         NHfdK/EBemo9b9gP0ctoec2sJtqVXoINMBrIdHV1RaZn7+NWrHFEbmDzc/iqRGkM2Lrw
         dMngWajwP7MuHBT0R9pQTDewYOQjh8iA2z+I2ouqloIqCaAJkQcw6T4P56BDfvcYGWY0
         pHNvoOKbh0voFLJrSGB+o5NdSOIcQChqnRCoOdA7gl1paJpLio8rRBo8wLoT1kzV6pqS
         GaefZGriSoHe1DTFDmBewGHfkt4EnE/xPm8pT8EJ/LBgtvXpWcAtvgL6hGCi07QhVMn2
         1kkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721052908; x=1721657708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6MHRGAKeXAQEg0wG7vpCt6KCDnhphvCiCi4pipi/lJg=;
        b=knK29SINM+YlNNwIM87ElwAB9HilmwHMK4kkoqa12je7Uf3nYy8KZFzusUdw5+tnNJ
         bSRzkeDTLv968q2YPG81gCh21IOQOC7svrJjcV83ODyamTq3+7eiWLXbJWYxFkkHfTxO
         T1yAzGOfnJA5fpaO6zX5qQhSHNAAegOoPMhVKhzadMDyXEV+hBkVBjw/TC+Ch4/hFKe6
         4GMn24+x1bP2g2pg50mH2We7/jnNZZ929ieeoSJw90Utex06iFPMcD6XYqnWviOs/jTZ
         ydDJ1ppq/+Js0m6pE5LOXdKkfNaX7+RltGh+NydyWDJ33z1tgaPOwSb/Slp6qfhzyWdP
         mGfQ==
X-Gm-Message-State: AOJu0YxGtE/bCGUNREJQoK3PZR4aDDuGkVjukyQbl3F3DKPuTGDYif3q
	Z1tJpE8DUUVQ4k712GyR9lCavTmeWlOxZmAxk81jdNg8fFSpulEnRRlmuw==
X-Google-Smtp-Source: AGHT+IGNf/yQ+O2JJWVdazoHIiAGxu6KCTNxisx0gtzR+9r+vXi7W7peiYfkfJwnMYxU3MlVN+0ypw==
X-Received: by 2002:a05:651c:502:b0:2ee:8eb6:ff61 with SMTP id 38308e7fff4ca-2eef2d852e2mr267931fa.2.1721052907475;
        Mon, 15 Jul 2024 07:15:07 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680daccbddsm6499074f8f.64.2024.07.15.07.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 07:15:07 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/6] kernel-fitimage: fix intentation
Date: Mon, 15 Jul 2024 16:10:38 +0200
Message-ID: <20240715141448.2158477-2-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240715141448.2158477-1-adrian.freihofer@gmail.com>
References: <20240715141448.2158477-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 14:15:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201927

From: Adrian Freihofer <adrian.freihofer@siemens.com>

white space changes only.
- python part should be 4 spaces, not 8.
- use tabs for shell

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 64 ++++++++++-----------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index 6e6898e5f6f..ce52297aec3 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -29,27 +29,27 @@ KERNEL_IMAGETYPE_REPLACEMENT ?= "${@get_fit_replacement_type(d)}"
 DEPENDS:append = " ${@'u-boot-tools-native dtc-native' if 'fitImage' in (d.getVar('KERNEL_IMAGETYPES') or '').split() else ''}"
 
 python __anonymous () {
-        # Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
-        # to kernel.bbclass . We have to override it, since we pack zImage
-        # (at least for now) into the fitImage .
-        typeformake = d.getVar("KERNEL_IMAGETYPE_FOR_MAKE") or ""
-        if 'fitImage' in typeformake.split():
-            d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake.replace('fitImage', d.getVar('KERNEL_IMAGETYPE_REPLACEMENT')))
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
 
 
@@ -480,13 +480,13 @@ fitimage_emit_section_config() {
 		# default node is selected based on dtb ID if it is present,
 		# otherwise its selected based on kernel ID
 		if [ -n "$dtb_image" ]; then
-		        # Select default node as user specified dtb when
-		        # multiple dtb exists.
-		        if [ -n "$default_dtb_image" ]; then
-			        default_line="default = \"${FIT_CONF_PREFIX}$default_dtb_image\";"
-		        else
-			        default_line="default = \"${FIT_CONF_PREFIX}$dtb_image\";"
-		        fi
+			# Select default node as user specified dtb when
+			# multiple dtb exists.
+			if [ -n "$default_dtb_image" ]; then
+				default_line="default = \"${FIT_CONF_PREFIX}$default_dtb_image\";"
+			else
+				default_line="default = \"${FIT_CONF_PREFIX}$dtb_image\";"
+			fi
 		else
 			default_line="default = \"${FIT_CONF_PREFIX}$kernel_id\";"
 		fi
@@ -605,9 +605,9 @@ fitimage_assemble() {
 				DTB_PATH="${KERNEL_OUTPUT_DIR}/$DTB"
 			fi
 
-		        # Strip off the path component from the filename
+			# Strip off the path component from the filename
 			if "${@'false' if oe.types.boolean(d.getVar('KERNEL_DTBVENDORED')) else 'true'}"; then
-			    DTB=`basename $DTB`
+				DTB=`basename $DTB`
 			fi
 
 			# Set the default dtb image if it exists in the devicetree.
@@ -715,8 +715,8 @@ fitimage_assemble() {
 	# kernel-fitimage.bbclass currently only supports a single kernel (no less or
 	# more) to be added to the FIT image along with 0 or more device trees and
 	# 0 or 1 ramdisk.
-        # It is also possible to include an initramfs bundle (kernel and rootfs in one binary)
-        # When the initramfs bundle is used ramdisk is disabled.
+	# It is also possible to include an initramfs bundle (kernel and rootfs in one binary)
+	# When the initramfs bundle is used ramdisk is disabled.
 	# If a device tree is to be part of the FIT image, then select
 	# the default configuration to be used is based on the dtbcount. If there is
 	# no dtb present than select the default configuation to be based on
-- 
2.45.2


