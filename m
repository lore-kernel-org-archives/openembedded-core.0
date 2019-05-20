Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 680617DF46
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:12:08 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id r4so14765962wro.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=edUBYEJ31PBb44Kv/1inSR//w8LuDHLgET7+j3KgiGQ=;
	b=PcINA3zX8/r86etOS52jJoA7d8DhWlXlbvj3MUlFf24fwZr1me4anPQnR7ytV/A1XS
	ABJYcUEqJCIeVTp1WJiyXCN2U+9Dox44GmLJHCC4STypEU4/GHqWg9om7r9zA3BytCWS
	XvoAecfu1wPx1RL84kcSAmnRewNb3Ju58cK09BDuWt9Tg2+8H3ds889B02LrEEQzW5b0
	M9adLPZE6oKZYOypsiFCK1MnJDtk/drb6I2v8r9UAqshyVrdv5NbWT1ubeLfjmz5rtcL
	pa9uCc/D43gY6KzqIl7tMkQgXtAjVW76Xi9kiUoyWuatgLRBv1Qj5Xg6SzsmggDtkjie
	d37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=edUBYEJ31PBb44Kv/1inSR//w8LuDHLgET7+j3KgiGQ=;
	b=YHNQSS4iGvqXw+cfOFYsJ5gJrUNG44rxLiJEg05kp9fy/9hrTEJ9xnOo0Uqvo8ut/s
	xmBjvg2OppiMeVyYKH7N7pYtkSJ/vRJR+azfFqspySu9S+n17Ot5zuPreGq6F+wG7tk2
	8goXwOWwMo0hMk7NmftV2SWdDwMvvf61YSlo4iaeWDTVRiH1rdiZm5SPWXf8qzWMrkdT
	6ByB3uoebm1g2Tqfd/q8U3m7AZlmWYNyxsg2yMBW+26p2tHIqh0xTkTAOlo+P5zNFI96
	D8M5AE0OP5nwBlpt2zNkNEB5Z9djilijJ261jC2EfxA3B6hYB/scIc0AhV3nJtR46RpY
	c1Tw==
X-Gm-Message-State: APjAAAUK3pBLRn5Q3PS+5VOCW4actNtky9cZLdCTpOXtCMhes49FOthR
	XmMTiMcAf9QF2L/ZoCp9kUU7TsWd
X-Google-Smtp-Source: APXvYqxRp1HvrASllfmlHZw2SINqfjixe5EFB7qFPJYHRFKebXZOFA1ZwbYiYhLoiyoD6X/98S39RA==
X-Received: by 2002:a5d:6703:: with SMTP id o3mr716105wru.183.1558361529017;
	Mon, 20 May 2019 07:12:09 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.12.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:12:08 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:11:20 +0200
Message-Id: <20190520141125.10805-37-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 37/42] usbutils: upgrade 010->012
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 May 2019 14:12:08 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...usb-devices-avoid-dependency-on-bash.patch | 30 -------------------
 .../{usbutils_010.bb => usbutils_012.bb}      |  5 ++--
 2 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-bsp/usbutils/usbutils/usb-devices-avoid-dependency-on-bash.patch
 rename meta/recipes-bsp/usbutils/{usbutils_010.bb => usbutils_012.bb} (83%)

diff --git a/meta/recipes-bsp/usbutils/usbutils/usb-devices-avoid-dependency-on-bash.patch b/meta/recipes-bsp/usbutils/usbutils/usb-devices-avoid-dependency-on-bash.patch
deleted file mode 100644
index 7edff2614a8..00000000000
--- a/meta/recipes-bsp/usbutils/usbutils/usb-devices-avoid-dependency-on-bash.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Upstream-Status: Backport (https://github.com/gregkh/usbutils/commit/508d1acf42e1bfd470c6bf1a188574c69c20aeed)
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 1c9162a5b30550aec8fa163906067bc179291b57 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Fri, 27 Jul 2018 15:28:34 +0100
-Subject: [PATCH] usb-devices: use /bin/sh
-
-This script doesn't use any bashisms, so change the hashbang to /bin/sh.
-
-Fixes #73.
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
----
- usb-devices | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/usb-devices b/usb-devices
-index afb4217..89d1b7d 100755
---- a/usb-devices
-+++ b/usb-devices
-@@ -1,4 +1,4 @@
--#!/bin/bash
-+#!/bin/sh
- # SPDX-License-Identifier: GPL-2.0+
- #
- # Copyright (c) 2009 Greg Kroah-Hartman <greg@kroah.com>
--- 
-2.11.0
-
diff --git a/meta/recipes-bsp/usbutils/usbutils_010.bb b/meta/recipes-bsp/usbutils/usbutils_012.bb
similarity index 83%
rename from meta/recipes-bsp/usbutils/usbutils_010.bb
rename to meta/recipes-bsp/usbutils/usbutils_012.bb
index e6d05b8e87c..0213e7af63d 100644
--- a/meta/recipes-bsp/usbutils/usbutils_010.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_012.bb
@@ -11,10 +11,9 @@ LIC_FILES_CHKSUM = "file://lsusb.c;endline=1;md5=7d4861d978ff5ba7cb2b319ed1d4afe
 DEPENDS = "libusb1 virtual/libiconv udev"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
-           file://usb-devices-avoid-dependency-on-bash.patch \
           "
-SRC_URI[md5sum] = "5eb2d2d68f9ed6dc3e9659a5988f7ed6"
-SRC_URI[sha256sum] = "881ba47fb2df10c3ba54a4cd6755a90377180890788e476f99d480ea9bc8bb58"
+SRC_URI[md5sum] = "7484445cbcf04b3eacac892fe58f8d9f"
+SRC_URI[sha256sum] = "ae2e10aad530d95839b6f4d46cd41715eae6f0f1789310d793e9be21b3e7ae20"
 
 inherit autotools pkgconfig distro_features_check update-alternatives
 
-- 
2.17.1


