Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id DA14878D4C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 15:33:02 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id s9-v6so5666630wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 08:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ixzgLjhtddNz7REb0FgrH981osJD5gzFOap4DDe8I6o=;
	b=ZKWjTtn3XrrqPXB3XtuP4c085aPs87HCKHSWW2dB3BQD7HA8F666XlZp7tDnw7Wwek
	Dl0QuEXkEGOm3Q+8QTvAZ6U6Wuq69T2h0vUTSh1uf+s+SayVacdRbK2oN9cMVvQZ9I94
	wfHiXlJe2+JH38MjhLSlku+0r5OhWa7euSKS7udKUwJKsTLC2h9LI+spKacmcGK/lLEC
	gAWG+tQ6gNdg50NM+yYXrY4iCS3LzY4i4TYulCX9nwNC+mqWSzGoPaJmYpsc6w1jjdbw
	pUjXEbaSMMIRw4rx16P2Txt0BeXfZuIeDD3MX5p8lVhYcLoArEClZu6V/AEaXv/TkoZy
	ch9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ixzgLjhtddNz7REb0FgrH981osJD5gzFOap4DDe8I6o=;
	b=E/OgEzDMRpvkaaV0W78hSPmWk+JicbIOZl47dklzORoAEXwjGIJJUP9WVWuPiMyRmy
	nM3619ORJTtjOWDVJ64I/sp/ZahNCe+hd5+vGk9TsK3qWPZMofNILEIdBj5ypm/X0Ffr
	4Oo84O31YQx0RFNY/qJvDXT5XWgNbK/IzAHpFIJZciDLHsP/jmUTVgWpS7Zff1M2s7/G
	4o4oFThXIDbxvR49HhaHxP0Pc9vy1Aj8vxU5sDKm7LvIDF71fZyN5sdKsX+MTDR7+bHA
	VOx/3J9dah8a/Ag3vqQW0iN0BpraYQRuia+jZnGI5vNpN9Pw8PnwOTQ11ObdJFQcDqtB
	gnYQ==
X-Gm-Message-State: AOUpUlGfuszr3v32R52Yhnn2xDuI0Cr8nJJNNi2KFiex36a+S++QctcF
	2AmlkvttBQmaFJZHP5HnA2xBDpXSyZ8=
X-Google-Smtp-Source: AAOMgpfdVkIYipo4waRQCamL8Gv4QG0E5/R5bU1KYrDQnR0q61PqdzxV4E85jFbxCWfTNTYAss7KmA==
X-Received: by 2002:a1c:7506:: with SMTP id o6-v6mr4682036wmc.60.1532705583267;
	Fri, 27 Jul 2018 08:33:03 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z62-v6sm3804916wmc.10.2018.07.27.08.33.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 08:33:02 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2018 16:32:42 +0100
Message-Id: <20180727153248.22838-10-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180727153248.22838-1-ross.burton@intel.com>
References: <20180727153248.22838-1-ross.burton@intel.com>
Subject: [PATCH 10/16] usbutils: upgrade to 010
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
X-List-Received-Date: Fri, 27 Jul 2018 15:33:03 -0000

Upgrade to 010.

usbutils uses libusb1 not the older libusb-compat library.

Refresh (and submit upstream) the bashism removal for usb-devices.

Fix LICENSE as lsusb.py is GPLv2 or v3, and set per-package LICENSE fields as
appropriate.  The actual license texts are missing from the 010 tarball (fixed
in git) so point at the SPDX statements in the source files instead.

Remove FILES_${PN}-dev as usbutils.pc doesn't exist anymore.

Remove lsusb.py hashbang change as this doesn't cause any problems now
(installed hashbang is /usr/bin/env python3).

Remove spurious zlib build dependency that isn't required.

Remove spurious RDEPENDS_${PN}-ptest, which doesn't exist.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../usb-devices-avoid-dependency-on-bash.patch     | 32 +++++++++++-----------
 .../usbutils/{usbutils_009.bb => usbutils_010.bb}  | 22 +++++++--------
 2 files changed, 26 insertions(+), 28 deletions(-)
 rename meta/recipes-bsp/usbutils/{usbutils_009.bb => usbutils_010.bb} (50%)

diff --git a/meta/recipes-bsp/usbutils/usbutils/usb-devices-avoid-dependency-on-bash.patch b/meta/recipes-bsp/usbutils/usbutils/usb-devices-avoid-dependency-on-bash.patch
index a6b241f8549..7edff2614a8 100644
--- a/meta/recipes-bsp/usbutils/usbutils/usb-devices-avoid-dependency-on-bash.patch
+++ b/meta/recipes-bsp/usbutils/usbutils/usb-devices-avoid-dependency-on-bash.patch
@@ -1,30 +1,30 @@
-From 333d5fbbc03481f1aa222bd68c2609db168ae3e0 Mon Sep 17 00:00:00 2001
-From: Paul Eggleton <paul.eggleton@linux.intel.com>
-Date: Thu, 26 Jul 2012 10:37:32 +0100
-Subject: [PATCH] usb-devices: avoid dependency on bash
+Upstream-Status: Backport (https://github.com/gregkh/usbutils/commit/508d1acf42e1bfd470c6bf1a188574c69c20aeed)
+Signed-off-by: Ross Burton <ross.burton@intel.com>
 
-By virtue of having #!/bin/bash this script declared that it requires
-bash, however manual examination, checkbashisms and tests with dash
-and busybox show that it doesn't contain any bashisms, so change the
-header to avoid the dependency.
+From 1c9162a5b30550aec8fa163906067bc179291b57 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Fri, 27 Jul 2018 15:28:34 +0100
+Subject: [PATCH] usb-devices: use /bin/sh
 
-Upstream-Status: Pending
+This script doesn't use any bashisms, so change the hashbang to /bin/sh.
 
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+Fixes #73.
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
 ---
- usb-devices |    2 +-
+ usb-devices | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/usb-devices b/usb-devices
-index b2052e2..14a5358 100755
+index afb4217..89d1b7d 100755
 --- a/usb-devices
 +++ b/usb-devices
 @@ -1,4 +1,4 @@
 -#!/bin/bash
 +#!/bin/sh
- 
- # Copyright: 2009 Greg Kroah-Hartman <greg@kroah.com>
- #            2009 Randy Dunlap <rdunlap@xenotime.net>
+ # SPDX-License-Identifier: GPL-2.0+
+ #
+ # Copyright (c) 2009 Greg Kroah-Hartman <greg@kroah.com>
 -- 
-1.7.9.5
+2.11.0
 
diff --git a/meta/recipes-bsp/usbutils/usbutils_009.bb b/meta/recipes-bsp/usbutils/usbutils_010.bb
similarity index 50%
rename from meta/recipes-bsp/usbutils/usbutils_009.bb
rename to meta/recipes-bsp/usbutils/usbutils_010.bb
index 3ffc0dd97a7..e6d05b8e87c 100644
--- a/meta/recipes-bsp/usbutils/usbutils_009.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_010.bb
@@ -3,32 +3,30 @@ DESCRIPTION = "Contains the lsusb utility for inspecting the devices connected t
 HOMEPAGE = "http://www.linux-usb.org"
 SECTION = "base"
 
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+LICENSE = "GPLv2+ & (GPLv2 | GPLv3)"
+# License files went missing in 010, when 011 is released add LICENSES/* back
+LIC_FILES_CHKSUM = "file://lsusb.c;endline=1;md5=7d4861d978ff5ba7cb2b319ed1d4afe3 \
+                    file://lsusb.py.in;beginline=2;endline=2;md5=194d6a0226bf90f4f683e8968878b6cd"
 
-DEPENDS = "libusb zlib virtual/libiconv udev"
+DEPENDS = "libusb1 virtual/libiconv udev"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
            file://usb-devices-avoid-dependency-on-bash.patch \
           "
-
-SRC_URI[md5sum] = "b5dbc498b2eb5058f7a57fc6532d0aad"
-SRC_URI[sha256sum] = "e73543293a17c7803994eac97a49e58b377e08e6299ba11aad09794b91340e8b"
+SRC_URI[md5sum] = "5eb2d2d68f9ed6dc3e9659a5988f7ed6"
+SRC_URI[sha256sum] = "881ba47fb2df10c3ba54a4cd6755a90377180890788e476f99d480ea9bc8bb58"
 
 inherit autotools pkgconfig distro_features_check update-alternatives
 
 ALTERNATIVE_${PN} = "lsusb"
 ALTERNATIVE_PRIORITY = "100"
 
-FILES_${PN}-dev += "${datadir}/pkgconfig"
+# The binaries are mostly GPLv2+ apart from lsusb.py which is GPLv2 or v3.
+LICENSE_${PN} = "GPLv2+"
+LICENSE_${PN}-python = "GPLv2 | GPLv3"
 
 RRECOMMENDS_${PN} = "udev-hwdb"
-RDEPENDS_${PN}-ptest = "libboost-system libboost-thread"
 
 PACKAGE_BEFORE_PN =+ "${PN}-python"
 FILES_${PN}-python += "${bindir}/lsusb.py"
 RDEPENDS_${PN}-python = "python3-core"
-
-do_install_append() {
-    sed -i -E '1s,#!.+python,#!${bindir}/python3,' ${D}${bindir}/lsusb.py
-}
-- 
2.11.0


