Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1BFC67E031
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:12:30 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 15so3540844wmg.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=edUBYEJ31PBb44Kv/1inSR//w8LuDHLgET7+j3KgiGQ=;
	b=D0f7TTb+O4sQ/TZI16hmyG5j6+evEGzGoxiDo+rPsBXwF4rIWvrHTFrth4aScJJI6U
	NAq2CIe2HaaE94qTzBbl1JVy91WoJRZXDcaJ6FMx0rUPcNNUkIY0i08dlpAxfXtZZi9m
	P4cS+l/RIl1GmhlPCy66YpQeZMRN/Z2HAxupQaR+nJdg3+VzPjVZUwMorj2A3bjvVvBJ
	hZSYia8r52AIv7DHTqxqTz5sf3JIEdjEtYf0dVWBn/dVc2c/DFO7TC5Bp67psSFKi3yP
	OFuGRjXFeVS3GYkvRx9rXlCHhOeuVBO90wsfetyq3X8E1wjGhQzREAxUW+3Qh7dy8P3E
	3t+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=edUBYEJ31PBb44Kv/1inSR//w8LuDHLgET7+j3KgiGQ=;
	b=JXjPtGxJKBRn/CJYIMynJnxRKUG0jAH9CcMwikiOX629maRqY6QahTE9p3u11vFLsW
	BGOgZZkoH4SZwkDkCUjczndfw88QrG1kzYsjQBVFZ4rMhgclpSpji5mbuVyFF+M0VOwm
	c4r0+zF0TbF0jrR3aG+DXo80JTieto9C2KvJG3R3DQ/cKBKN4x+6eW7xFRx2Dz8YqT28
	s1z9N48P4UBdEPrKxlgoJCAuPkfz+Xd+scPALUdDqO9vg42ZIQ6BJdTkk5ACJuuuqE9L
	H2f7+d5BQ6sH7vG87aLDPJ+E7RWYmP5EpEDp5gAtDSmOiOCWICI+dEoLbSHj2YoakaSK
	7Mng==
X-Gm-Message-State: APjAAAXF92b/bZ+wQMXE7RyARoyIz7/lpCuWfcPdN3oGKRo+TspQG3ep
	oA8WQGWOWi76sa0cbkBN1O22/ftC
X-Google-Smtp-Source: APXvYqzZkX+D2u2YXphM01F7FYXE3NBTACJMFWPu2YPDIYvAmnPhPQ4FCunFdVNna4c7yglbgdlbOw==
X-Received: by 2002:a1c:4045:: with SMTP id n66mr3195476wma.142.1558116750690; 
	Fri, 17 May 2019 11:12:30 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c63sm10188093wma.29.2019.05.17.11.12.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:12:29 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 20:11:51 +0200
Message-Id: <20190517181151.44001-37-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517181151.44001-1-alex.kanavin@gmail.com>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
Subject: [PATCH 37/37] usbutils: upgrade 010->012
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
X-List-Received-Date: Fri, 17 May 2019 18:12:30 -0000

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


