Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5771FCF6499
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 01:58:16 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.45296.1727661487146729365
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Sep 2024 18:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lrOq/q4Q;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20b833f9b35so3479835ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 18:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727661486; x=1728266286; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FuTDtFMLQaNjq9X78GGgaBn+oCjyQgeLO254Nl6vu0=;
        b=lrOq/q4QBxxoyVYUreHXrty3goPrIWjyzdC2XZAbYbcm5jQNThuaGap3DYTTRNi52b
         ljP0k58FHlSzr2NYxSjxm/6GgWNsVn67zooaH/0LEqq190h2kAFVZOI+D+0X1ahalXjU
         ncB/PQXgIquZHfi+XsRUEMwrbPONcULd29BwWplb2wyWnbhDmpsU2d0ahUsfy31anYjL
         B208KzQbTIZUIDku0lTyBU76PGcq0jLYb6xklwDdNEC3S5/OEBHnCtaFoWDVipme03uA
         EoQN1BLjLewCH6DVyljRN/X1xVc2sLB7iCh0wjPlj8BWyICZW3vWpaeR827quackdaLb
         4rZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727661486; x=1728266286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3FuTDtFMLQaNjq9X78GGgaBn+oCjyQgeLO254Nl6vu0=;
        b=cLphrYxLHQoHvhdODuHm0DVIw9dZgtGKwo2wsMzcWZeWyrY4rPjQNKgEvMzzH6OLnJ
         h5kZKbuJgLbc7ws9P1MX+G0atJXqYi0UuJcHERZ+PAFJgvEkW1VgitMKTQr2dSAACz6f
         oUK4FlvHVtvF71ByBUW1chCBtD3R4uetXbIx5yvfhw1p+krQwds0d4TKSKmtaR3e0NoK
         N3bazxVA3o9FJFF0D8AGC6wWcuKJqJ+xkcL4V+/tW8b8meLU5fj3ZrCp5KNbnis58hP3
         N92S9v1OuGyfXEmzcAsn3kjkYfBE0aCmdmwFgpMqw5MX3Hwrx+z0NI1Gh3qIBaBFI6jr
         YTJg==
X-Gm-Message-State: AOJu0Yw0tPrifmm54kP2bWuM0s70NWwDGK7PgxzJDPEiGvn5alG03Hb5
	2XAFo5CTVLlNHvzpFTcQsipJCS069bhynIWEhaY8sdfx3dadpKLK++AUjGXA8bFJ7SFOyc5KKpa
	avnc=
X-Google-Smtp-Source: AGHT+IFP0Lf9jn/Mm12+7B3MaU/JV+BycNoaXdItdo1FCy97N4dVC12hAOFro+tnsnsKVWX+qndZ6Q==
X-Received: by 2002:a17:903:24e:b0:207:894:6e58 with SMTP id d9443c01a7336-20b37ba5f34mr186269615ad.56.1727661486118;
        Sun, 29 Sep 2024 18:58:06 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0d4af744bsm5496070a91.23.2024.09.29.18.58.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 18:58:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 22/27] kernel-fitimage: fix intentation
Date: Sun, 29 Sep 2024 18:57:17 -0700
Message-Id: <667aab25e83c84c0daccd43eda574ae34c75c8a7.1727661284.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727661284.git.steve@sakoman.com>
References: <cover.1727661284.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 01:58:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205084

From: Adrian Freihofer <adrian.freihofer@siemens.com>

white space changes only.
- python part should be 4 spaces, not 8.
- use tabs for shell

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 000079a973e8c97d496ca721259437880a7ea70d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 64 ++++++++++-----------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index 4b74ddc201..16c8d88802 100644
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
2.34.1


