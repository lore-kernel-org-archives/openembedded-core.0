Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB1ACD3A67B
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 18:28:03 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.1095.1730226476749229636
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 11:27:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zhwirtmm;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: festevam@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20cd76c513cso53903445ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 11:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730226476; x=1730831276; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QE1YXfAPW0PlCcolSIaRHqVlndshx3P/HUFmjChRHFg=;
        b=Zhwirtmm0KWmzTJZVM4dsCXUjZl7f+L0vwRQc6in64oki+UOI1aYbZrqaV35qwly3E
         jDGun7xu6kAD6Kp23Mm0uEIrOQsCxjBFMNG7l4pk7osyZJMmLv0dB1i3+kKvEwyGTypS
         8quiiARjEDmfvG5APgQTjxU/kzcYfbfaTNwGnvhTsapqIjjeEoVXS8R4ZOeNsUnJISoq
         EGd83DjUt0wQcpasciYUCvLCJ6AsxDdLNW0LDTh3b+6cSqYSXIquaXgOKGrSFStcUA/L
         z/swjfQwvCJDp9akO5JFnXvp4npz+7NLC0IJiOzliIzKkMJipsbzj3eep8dEjgyE60vd
         XAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730226476; x=1730831276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QE1YXfAPW0PlCcolSIaRHqVlndshx3P/HUFmjChRHFg=;
        b=X7C6TzWE6Y8TvoMp8HYm22ZNm7ecmO+cYqVvKSsx/PXbDf8i53NBIcmH/1frd8ogoi
         eX2zjJK2Jkk8Z8qqLnr9DkBW4id/o+X3PC/6fLTL8e8YcEWolCqLo2s+0+cfxeM3+XWP
         CFoXJPpUBjdQMKnAwbF+pYZM1I63dQ4ulZzEVprZd+YeDQMi1gp8Fo4veHaC8PWPepV4
         gPGCR7r573jcykvGncoGfK7fJUAP40y/daNGM4m/MOLPfLAlxX273IQZHifd4Q+/T/ob
         lNY3a/44uboalu+lZjfimwfDFpMUNUvyWgldblp7dRr8OT5MqUUdm+F1RheNeHJHKlUJ
         iyNQ==
X-Gm-Message-State: AOJu0YxGthYcDqWQCunPeB/Sr6G+4doEySdl9/OjpAKtUnrXxr+UcMBJ
	qz25YMXhPLVCQWL6nEywxqjrUWD+0Em/54NEUPCGbIT+aQRCC7bnlQ/q8w==
X-Google-Smtp-Source: AGHT+IE5n+oRAknyBhk1mafDY9/ipv6y0rEy6+CEO0jSFRBa+6TX/a4U8oQbcL9+7pjjxpNgwys2bg==
X-Received: by 2002:a17:90b:3908:b0:2d8:e7db:9996 with SMTP id 98e67ed59e1d1-2e92ce50f8dmr708672a91.13.1730226475484;
        Tue, 29 Oct 2024 11:27:55 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:190a:1425:254d:1e7a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e920197e7bsm1370363a91.0.2024.10.29.11.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 11:27:54 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] usbutils: Update to version 018
Date: Tue, 29 Oct 2024 15:27:47 -0300
Message-Id: <20241029182747.353739-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 18:28:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206509

From: Fabio Estevam <festevam@denx.de>

Update to version 018, which has been converted to meson.

Patch 0001-usbutils.pc.in-Fix-Cflags-entry.patch is no longer needed
as usbutils now uses meson.

Patch 0001-usb-devices-Fix-usb-devices-with-busybox.patch has been
upstreamed.

Add CC0-1.0, LGPL-2.1-or-later, and MIT to the LICENSES entry
due to the following usbutils commits:

https://github.com/gregkh/usbutils/commit/32154d0dbea27fc1de8ad07da9110c5ec5f141d8

https://github.com/gregkh/usbutils/commit/d04e63e5517f89d508b3a206c6611edafc82ac8f

License-Update: Add CC0-1.0, LGPL-2.1-or-later, and MIT entries.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 ...devices-Fix-usb-devices-with-busybox.patch | 37 -------------------
 ...0001-usbutils.pc.in-Fix-Cflags-entry.patch | 34 -----------------
 .../{usbutils_017.bb => usbutils_018.bb}      | 20 +++++-----
 3 files changed, 10 insertions(+), 81 deletions(-)
 delete mode 100755 meta/recipes-bsp/usbutils/usbutils/0001-usb-devices-Fix-usb-devices-with-busybox.patch
 delete mode 100644 meta/recipes-bsp/usbutils/usbutils/0001-usbutils.pc.in-Fix-Cflags-entry.patch
 rename meta/recipes-bsp/usbutils/{usbutils_017.bb => usbutils_018.bb} (50%)

diff --git a/meta/recipes-bsp/usbutils/usbutils/0001-usb-devices-Fix-usb-devices-with-busybox.patch b/meta/recipes-bsp/usbutils/usbutils/0001-usb-devices-Fix-usb-devices-with-busybox.patch
deleted file mode 100755
index dbe5d7c18b6d..000000000000
--- a/meta/recipes-bsp/usbutils/usbutils/0001-usb-devices-Fix-usb-devices-with-busybox.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From da155d965a34b5c5770dc30fa52eb7ef405f3a30 Mon Sep 17 00:00:00 2001
-From: Teresa Remmet <t.remmet@phytec.de>
-Date: Thu, 5 Sep 2024 08:37:48 +0200
-Subject: [PATCH] usb-devices: Fix usb-devices with busybox
-
-The busybox find command is missing the -printf parameter leading to
-the error:
-
-find: unrecognized: -printf
-
-Replace the parameter with sed.
-
-This patch was originally created by Daniel Fancsali.
-
-Upstream-Status: Backport [https://github.com/gregkh/usbutils/commit/da155d965a34b5c5770dc30fa52eb7ef405f3a30]
-
-Signed-off-by: Teresa Remmet <t.remmet@phytec.de>
----
- usb-devices | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/usb-devices b/usb-devices
-index 5f60ad5a1ed0..51f48b4ad628 100755
---- a/usb-devices
-+++ b/usb-devices
-@@ -192,7 +192,7 @@ if [ ! -d /sys/bus ]; then
- 	exit 1
- fi
- 
--for device in $(find /sys/bus/usb/devices -name 'usb*' -printf '%f\n' | sort -V)
-+for device in $(find /sys/bus/usb/devices -name 'usb*' | sed -E 's#^.*/##g' | sort -V)
- do
- 	print_device "/sys/bus/usb/devices/$device" 0 0 0
- done
--- 
-2.34.1
-
diff --git a/meta/recipes-bsp/usbutils/usbutils/0001-usbutils.pc.in-Fix-Cflags-entry.patch b/meta/recipes-bsp/usbutils/usbutils/0001-usbutils.pc.in-Fix-Cflags-entry.patch
deleted file mode 100644
index 039dd5cd7235..000000000000
--- a/meta/recipes-bsp/usbutils/usbutils/0001-usbutils.pc.in-Fix-Cflags-entry.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From f558919e858453a31313a3df35906de2e036940c Mon Sep 17 00:00:00 2001
-From: Fabio Estevam <festevam@denx.de>
-Date: Thu, 4 Jan 2024 03:32:11 +0100
-Subject: [PATCH] usbutils.pc.in: Fix Cflags entry
-
-When updating the usbutils version in OpenEmbedded from 015 to 017,
-the following QA error is seen:
-
-QA Issue: File /usr/lib/pkgconfig/usbutils.pc in package usbutils-dev contains reference to TMPDIR [buildpaths]
-
-As this causes reproducibility problem due to the host PC path being
-leaked, it is treated as error.
-
-Fix it by using the standard Cflags entry.
-
-Upstream-Status: Submitted [https://github.com/gregkh/usbutils/pull/184/commits/3b3e5e1ebea7060bfa118d25a91b816dfa176b31]
-Signed-off-by: Fabio Estevam <festevam@denx.de>
----
- usbutils.pc.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/usbutils.pc.in b/usbutils.pc.in
-index e69778c3195c..0aa0005de951 100644
---- a/usbutils.pc.in
-+++ b/usbutils.pc.in
-@@ -15,4 +15,4 @@ Requires: libusb-1.0 >= 1.0.14  libudev >= 196
- Conflicts:
- Libs: -L${libdir}
- Libs.private: @LIBUSB_LIBS@ @UDEV_LIBS@
--Cflags: @CFLAGS@ @LIBUSB_CFLAGS@ @UDEV_CFLAGS@
-+Cflags: -I${includedir}
--- 
-2.34.1
-
diff --git a/meta/recipes-bsp/usbutils/usbutils_017.bb b/meta/recipes-bsp/usbutils/usbutils_018.bb
similarity index 50%
rename from meta/recipes-bsp/usbutils/usbutils_017.bb
rename to meta/recipes-bsp/usbutils/usbutils_018.bb
index 83d5c7287d44..b96a1b4f19c7 100644
--- a/meta/recipes-bsp/usbutils/usbutils_017.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_018.bb
@@ -3,21 +3,21 @@ DESCRIPTION = "Contains the lsusb utility for inspecting the devices connected t
 HOMEPAGE = "http://www.linux-usb.org"
 SECTION = "base"
 
-LICENSE = "GPL-2.0-or-later & (GPL-2.0-only | GPL-3.0-only)"
-# License files went missing in 010, when 011 is released add LICENSES/* back
-LIC_FILES_CHKSUM = "file://lsusb.c;endline=1;md5=7226e442a172bcf25807246d7ef1eba1 \
-                    file://lsusb.py.in;beginline=2;endline=2;md5=c443ada211d701156e42ea36d41625b3 \
-                    "
-
+LICENSE = "GPL-2.0-or-later & (GPL-2.0-only | GPL-3.0-only) & CC0-1.0 & LGPL-2.1-or-later & MIT"
+LIC_FILES_CHKSUM = "file://LICENSES/CC0-1.0.txt;md5=cf1af55fc6f5b9a23e12086005298dcd \
+		    file://LICENSES/GPL-2.0-only.txt;md5=c89d4ad08368966d8df5a90ea96bebe4 \
+		    file://LICENSES/GPL-2.0-or-later.txt;md5=c89d4ad08368966d8df5a90ea96bebe4 \
+		    file://LICENSES/GPL-3.0-only.txt;md5=050f496cfea7876fc13cdea643e041e0 \
+		    file://LICENSES/LGPL-2.1-or-later.txt;md5=8c6e7513c570546f65ae570dae278c17 \
+		    file://LICENSES/MIT.txt;md5=e8f57dd048e186199433be2c41bd3d6d \
+                   "
 DEPENDS = "libusb1 virtual/libiconv udev"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
-           file://0001-usbutils.pc.in-Fix-Cflags-entry.patch \
-           file://0001-usb-devices-Fix-usb-devices-with-busybox.patch \
           "
-SRC_URI[sha256sum] = "f704c4cb78a060db88b43aac6ebfd3d93c2c5cf1d6dd0e42936faaf00814ab00"
+SRC_URI[sha256sum] = "0048d2d8518fb0cc7c0516e16e52af023e52b55ddb3b2068a77041b5ef285768"
 
-inherit autotools pkgconfig update-alternatives
+inherit meson pkgconfig update-alternatives
 
 ALTERNATIVE:${PN} = "lsusb"
 ALTERNATIVE_PRIORITY = "100"
-- 
2.34.1


