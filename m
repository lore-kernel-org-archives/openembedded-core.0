Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D7BC47073
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 03:24:49 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.46701.1704338686951064607
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jan 2024 19:24:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dpXl4SWA;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: festevam@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-28bae84fc2eso22844a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 19:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704338686; x=1704943486; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3FhboBCbOlFYlXSse3gcBtAJIqF0Nb8E4YbKsDUh9ag=;
        b=dpXl4SWAh05hKBIVtLCcJkVMJpsvoAsTDeOoncGNX30hc9a9GZPQ6BXGqkBZ+xh1YE
         5AzVgytAI4S0mEZnA/rq+bOFHfBn3vr/uCIlqaxNfydR4asW4rwPnQu5E1huwjsR2cW5
         4oNZlLhLyLVxW3v5Fc1gAiCCyClWWuw6brguBXU5ci8I3NUeJx6ruLOD77E+wXJpTTHx
         0rn3ylbFXqML+t9qHvEXflcFNCxrTyZeGLHzH7X4A7VeQ14suEwNlhPAqrvNWd4ypRBI
         Iq+R8DZfCQSZvggCMywrvkgKt9pAWUwUIxd1P5NRs+2KZbjndF/KNzx5hgqMvrvr3pC7
         vBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704338686; x=1704943486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FhboBCbOlFYlXSse3gcBtAJIqF0Nb8E4YbKsDUh9ag=;
        b=YwGfnrU5WG5VzI1uO85PWWnGWMmHJaHm2jQdc8xu3f605VLyaFSg3qbVEvGQTDsEFz
         Ox9yynJEk4EXwrpqnH9p+AEeD5uoB+GO98by/04F0Ztxys6wuIxvJuqA9begy5f66x2j
         PrZyKRxFG0Iv5Wx8nVOkMdYfFVSusj28V737qCUqI+53aJFXTAwS9EmrIe6JRohurPi+
         Q/EV2GpM37/LFQATSB1Y+pkXrSheA/TZF/EOZK43Elgt5xfsg3ikpuhJDTdn372FcWgg
         tvrkoCNRLiJT35B/OYJA86WSMikUT5SI1X6wZ6z69Cm5Njm09kkvs7GF1YdLnZeAdrqD
         M6oQ==
X-Gm-Message-State: AOJu0YzLL0TKxyi+LAiMM+qzpFhoIQr1D+Tc/gCfxZvnmVg/Xul7ob4Q
	y/k9Dlo+KGgW06l6UhB9xXZO+tLgPWI=
X-Google-Smtp-Source: AGHT+IFIcdcy2XxZLGG9V70+ObZucWjVzdknce8L32dxSn1I2EnyUDftIZq/o+b6H7z9hHcV5eOgtQ==
X-Received: by 2002:a05:6a00:4b0b:b0:6cd:dfff:19b6 with SMTP id kq11-20020a056a004b0b00b006cddfff19b6mr66018pfb.2.1704338685826;
        Wed, 03 Jan 2024 19:24:45 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:eaf1:ea0b:ed94:6b4f])
        by smtp.gmail.com with ESMTPSA id v3-20020aa78503000000b006d7f1ae421csm24486552pfn.145.2024.01.03.19.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 19:24:45 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] usbutils: Update to version 017
Date: Thu,  4 Jan 2024 00:24:34 -0300
Message-Id: <20240104032434.1943385-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 03:24:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193303

From: Fabio Estevam <festevam@denx.de>

Update to version 017 and add a patch to fix a buildpath error.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 ...0001-usbutils.pc.in-Fix-Cflags-entry.patch | 34 +++++++++++++++++++
 .../{usbutils_015.bb => usbutils_017.bb}      |  3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/usbutils/usbutils/0001-usbutils.pc.in-Fix-Cflags-entry.patch
 rename meta/recipes-bsp/usbutils/{usbutils_015.bb => usbutils_017.bb} (88%)

diff --git a/meta/recipes-bsp/usbutils/usbutils/0001-usbutils.pc.in-Fix-Cflags-entry.patch b/meta/recipes-bsp/usbutils/usbutils/0001-usbutils.pc.in-Fix-Cflags-entry.patch
new file mode 100644000
index 0000000000..039dd5cd72
--- /dev/null
+++ b/meta/recipes-bsp/usbutils/usbutils/0001-usbutils.pc.in-Fix-Cflags-entry.patch
@@ -0,0 +1,34 @@
+From f558919e858453a31313a3df35906de2e036940c Mon Sep 17 00:00:00 2001
+From: Fabio Estevam <festevam@denx.de>
+Date: Thu, 4 Jan 2024 03:32:11 +0100
+Subject: [PATCH] usbutils.pc.in: Fix Cflags entry
+
+When updating the usbutils version in OpenEmbedded from 015 to 017,
+the following QA error is seen:
+
+QA Issue: File /usr/lib/pkgconfig/usbutils.pc in package usbutils-dev contains reference to TMPDIR [buildpaths]
+
+As this causes reproducibility problem due to the host PC path being
+leaked, it is treated as error.
+
+Fix it by using the standard Cflags entry.
+
+Upstream-Status: Submitted [https://github.com/gregkh/usbutils/pull/184/commits/3b3e5e1ebea7060bfa118d25a91b816dfa176b31]
+Signed-off-by: Fabio Estevam <festevam@denx.de>
+---
+ usbutils.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/usbutils.pc.in b/usbutils.pc.in
+index e69778c3195c..0aa0005de951 100644
+--- a/usbutils.pc.in
++++ b/usbutils.pc.in
+@@ -15,4 +15,4 @@ Requires: libusb-1.0 >= 1.0.14  libudev >= 196
+ Conflicts:
+ Libs: -L${libdir}
+ Libs.private: @LIBUSB_LIBS@ @UDEV_LIBS@
+-Cflags: @CFLAGS@ @LIBUSB_CFLAGS@ @UDEV_CFLAGS@
++Cflags: -I${includedir}
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/usbutils/usbutils_015.bb b/meta/recipes-bsp/usbutils/usbutils_017.bb
similarity index 88%
rename from meta/recipes-bsp/usbutils/usbutils_015.bb
rename to meta/recipes-bsp/usbutils/usbutils_017.bb
index a30037b693..a2e340ea4f 100644
--- a/meta/recipes-bsp/usbutils/usbutils_015.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_017.bb
@@ -12,8 +12,9 @@ LIC_FILES_CHKSUM = "file://lsusb.c;endline=1;md5=7226e442a172bcf25807246d7ef1eba
 DEPENDS = "libusb1 virtual/libiconv udev"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
+           file://0001-usbutils.pc.in-Fix-Cflags-entry.patch \
           "
-SRC_URI[sha256sum] = "2b8140664578f39c3f6f0166a1b950f8655304e63e3d7f89899acb99bc5cb8e7"
+SRC_URI[sha256sum] = "f704c4cb78a060db88b43aac6ebfd3d93c2c5cf1d6dd0e42936faaf00814ab00"
 
 inherit autotools pkgconfig update-alternatives
 
-- 
2.37.3


