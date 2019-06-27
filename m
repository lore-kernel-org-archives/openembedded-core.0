Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8F3477E7D4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 15:40:57 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id z15so1854287lfh.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 08:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=yEboG8nC1nHEZINtD5r2dqG6qFvnSlP2WtyS0SsuMFs=;
	b=zsLGOmiwQihw+pR2+Qbu5LcJ90x+FNNxqGWWISqa+r2+/0/at/KC80AOsCvh+bS/vq
	tI9z+tzfYWhEVxqZagydHcGfuzOnpq3vUOGGGnx4mrPyZPAHGEKKt/rNP7lcO1e16rxv
	2hkNrxAW7tC+Jlaqic29OWo2biItkOrBUVfR3Qlh9NL3ANsSlTl1g6pLVpMDhtUrSmpI
	12gMGwldTfVPPFR+sDPAzbIB++6QAmEMvM8PaqpOe6yIv8WhT6ucfpgbaqW57tvZHnVU
	L9P4W9wi3si7zZfrBl95IBjTAiAGK9WbhbYNTPi0BwCh9Eyz7X+ZR/p6NS3+v//jK3f3
	D9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yEboG8nC1nHEZINtD5r2dqG6qFvnSlP2WtyS0SsuMFs=;
	b=XWTDPBGcKWHh8cQrQ9jVZ9goRn7KUD+d05K/oml8aOg1YZZH2tSysdcG+Z+Fz/TQfI
	2MrXg6/nyKdyVEwai/ble2SKt4GzF9CYFKTOJjo8brm3dFOSUZcsfqmG6jxbrNWpO3Ox
	VFxajM580c6WnRmD2SqQOoM90EqCuji3YQZuwFIGMQu60k0Z8vfdydwjaMcYT4BvoeTB
	Gei+APgX6egnwWPzFHj6eoeP/ZJDxln8H88lRgF5C+ZWg0U6at1TqLvpBTf4IIbSNhW2
	NXLhaTpN9lg0nzqZs2FECmjkh4ATSy1dj8EwHxYXERjmljom31CkJXe2adj2lCT1oNpx
	PMww==
X-Gm-Message-State: APjAAAVUI++gLBEVmftL/2ps1WP35j9+iSPWR9lu8RGP4+S6zwzHbT2c
	S0WJsGkABKqh8GjwSG2Gn+3oQZ9IvBA=
X-Google-Smtp-Source: APXvYqwwNUBVAZtIuixi4ukYg+K1EYYaq0vAw+5mYltMN0GYHC5vEH3WGUavVi5oT6Pnu1rgUlEVCw==
X-Received: by 2002:a19:6519:: with SMTP id z25mr2446798lfb.73.1561650057705; 
	Thu, 27 Jun 2019 08:40:57 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id d4sm436278lfi.91.2019.06.27.08.40.56
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 27 Jun 2019 08:40:57 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2019 17:40:54 +0200
Message-Id: <20190627154054.32686-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] libxt: update to 1.2.0
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
X-List-Received-Date: Thu, 27 Jun 2019 15:40:57 -0000

License checksum changed due to modified copyright year.

Removed patch was upstreamed.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...n-t-link-makestrs-with-target-cflags.patch | 33 -------------------
 .../xorg-lib/libxt/libxt_fix_for_x32.patch    | 16 +++++++--
 .../{libxt_1.1.5.bb => libxt_1.2.0.bb}        |  9 ++---
 3 files changed, 16 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxt/0001-libXt-util-don-t-link-makestrs-with-target-cflags.patch
 rename meta/recipes-graphics/xorg-lib/{libxt_1.1.5.bb => libxt_1.2.0.bb} (76%)

diff --git a/meta/recipes-graphics/xorg-lib/libxt/0001-libXt-util-don-t-link-makestrs-with-target-cflags.patch b/meta/recipes-graphics/xorg-lib/libxt/0001-libXt-util-don-t-link-makestrs-with-target-cflags.patch
deleted file mode 100644
index 1a691a3d5e..0000000000
--- a/meta/recipes-graphics/xorg-lib/libxt/0001-libXt-util-don-t-link-makestrs-with-target-cflags.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From b0c0e6d90bd99a699701c9542640adb218f5d536 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Mon, 10 Jul 2017 16:51:13 +0300
-Subject: [PATCH] libXt: util: don't link makestrs with target cflags
-
-The line: AM_CFLAGS = $(XT_CFLAGS)
-in util/Makefile.am is wrong because it adds target cflags to the
-compilation of makestrs, which is built for the build machine, which
-leads to build failures when cross-compiling.
-
-Upstream-Status: Pending
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- util/Makefile.am | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/util/Makefile.am b/util/Makefile.am
-index 800b35b..f2dd1f9 100644
---- a/util/Makefile.am
-+++ b/util/Makefile.am
-@@ -11,7 +11,6 @@ EXTRA_DIST = \
- 	StrDefs.ht \
- 	string.list
- 
--AM_CFLAGS = $(XT_CFLAGS)
- makestrs_SOURCES = makestrs.c
- 
- 
--- 
-2.4.0
-
diff --git a/meta/recipes-graphics/xorg-lib/libxt/libxt_fix_for_x32.patch b/meta/recipes-graphics/xorg-lib/libxt/libxt_fix_for_x32.patch
index ffc2c15d71..ff8c675dbd 100644
--- a/meta/recipes-graphics/xorg-lib/libxt/libxt_fix_for_x32.patch
+++ b/meta/recipes-graphics/xorg-lib/libxt/libxt_fix_for_x32.patch
@@ -1,3 +1,8 @@
+From f069b0a430fe96f3ece2106d34375008833599d3 Mon Sep 17 00:00:00 2001
+From: Nitin A Kamble <nitin.a.kamble@intel.com>
+Date: Fri, 2 Dec 2011 12:20:05 -0800
+Subject: [PATCH] libxt: fix compilatoin with x32 toolchain
+
 Upstream-Status: Pending
 
 This fixes compilation with x32 toolchain.
@@ -5,10 +10,15 @@ This fixes compilation with x32 toolchain.
 Received this patch from H.J. Lu <hjl.tools@gmail.com>
 Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/1
 
+---
+ include/X11/Xtos.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
---- libXt-1.1.1/include/X11/Xtos.h.x32	2011-02-08 07:56:40.000000000 -0800
-+++ libXt-1.1.1/include/X11/Xtos.h	2011-11-30 17:19:27.473349770 -0800
-@@ -62,7 +62,7 @@ SOFTWARE.
+diff --git a/include/X11/Xtos.h b/include/X11/Xtos.h
+index 64b2da8..44f52c2 100644
+--- a/include/X11/Xtos.h
++++ b/include/X11/Xtos.h
+@@ -59,7 +59,7 @@ SOFTWARE.
      defined(__sparc64__) || \
      defined(__s390x__) || \
      (defined(__hppa__) && defined(__LP64__)) || \
diff --git a/meta/recipes-graphics/xorg-lib/libxt_1.1.5.bb b/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb
similarity index 76%
rename from meta/recipes-graphics/xorg-lib/libxt_1.1.5.bb
rename to meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb
index 23d9db41c4..42df435052 100644
--- a/meta/recipes-graphics/xorg-lib/libxt_1.1.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb
@@ -13,8 +13,7 @@ independent of any particular user interface policy or style."
 require xorg-lib-common.inc
 
 LICENSE = "MIT & MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6565b1e0094ea1caae0971cc4035f343"
-
+LIC_FILES_CHKSUM = "file://COPYING;md5=73d55cea4d27ca1a09a5d23378b3ecf8"
 
 DEPENDS += "util-linux libxcb libsm virtual/libx11 xorgproto libxdmcp"
 PROVIDES = "xt"
@@ -24,12 +23,10 @@ PE = "1"
 XORG_PN = "libXt"
 
 SRC_URI +=  "file://libxt_fix_for_x32.patch \
-             file://0001-libXt-util-don-t-link-makestrs-with-target-cflags.patch \
             "
+SRC_URI[md5sum] = "a9019421d3ee8b4937b6afd9025f018a"
+SRC_URI[sha256sum] = "b31df531dabed9f4611fc8980bc51d7782967e2aff44c4105251a1acb5a77831"
 
 BBCLASSEXTEND = "native nativesdk"
 
 EXTRA_OECONF += "--disable-xkb"
-
-SRC_URI[md5sum] = "8f5b5576fbabba29a05f3ca2226f74d3"
-SRC_URI[sha256sum] = "46eeb6be780211fdd98c5109286618f6707712235fdd19df4ce1e6954f349f1a"
-- 
2.17.1


