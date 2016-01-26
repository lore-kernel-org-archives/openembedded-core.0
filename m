Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 78DB576A51
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 19:14:42 +0000 (UTC)
Received: by mail-ob0-f178.google.com with SMTP id is5so149966324obc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 11:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=L3f0zt96XEYNHjate6OYv5BqEPia8bV/wyWnOkCQDZ8=;
	b=T4jH1ahtOASk9zxvxrEpv+jVP2Niog8NQN7cWVz+/Hj1iwgEM7wOHfa5BojRyVMwPg
	yuOkQ+BiTaL/GZqhO5H5G1YUvLBvCzocRpNldGZ5yA5fF7NVvifv+vHgzQg8XEmNN9FI
	TkU9ABxhHxnb58QCGoNu5xgfN7DWinul+iGQN2PB6zpP0QtaIY2P19KIWn5YucF5+FYe
	f2j4nkxH+FH6hEaIMZ/OwPqDJNZiYu285OvGkiaZyiRWuURoVHEwAMWUGJA3XR5n8xmX
	k2sNetcdylz0VKp2kYMuG7zmGe5cQrwxIKn+dkfswbXlaEPDQz4I/ft3e/ZOmNrNMxPq
	/2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=L3f0zt96XEYNHjate6OYv5BqEPia8bV/wyWnOkCQDZ8=;
	b=ZFOoB/BoDbb5DkbwahiZ24l8cc8xpVc2h619rLUV+vy6Z4j6ROL4UbOKuSmyMcRNkt
	qRov3vCFXAQYpA6LtffWC7ooH6x1cyEPaFq5z1S7OwW/7cRIf9dy6bvfi7hV2YpM4ya8
	4VJ8bfmwpc1DVCTJutahX9Vh+Bl+XrE6/VJ8xcOusmY3Gz0HMB+fHMxCdFQDBVNIeY4i
	eElNNBbr88+FuJ3JF+UtXGGNQM32UYm8G7tVfAUXdRv2ushWQUx4aUyiR42cJFAPVGtf
	pOOlIqpQ1IhTQfwVv5R3em05y0M8x4irRPlAYJXvZ8eo5DkLDn5ukhrAihjg1Dm70/TT
	Wb7g==
X-Gm-Message-State: AG10YOQwAG12UBoMLhTJRfksVXZSlOMGoK4awIr9qMudMuZ8dBFuMQRnjU1EjPJVqhqVlQ==
X-Received: by 10.60.136.197 with SMTP id qc5mr19980197oeb.79.1453835682644;
	Tue, 26 Jan 2016 11:14:42 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id x142sm987730oix.8.2016.01.26.11.14.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Jan 2016 11:14:41 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jan 2016 11:14:34 -0800
Message-Id: <1453835674-14822-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] mtools: keep v3.9.9 recipe in sync with the v4.0.18 version
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
X-List-Received-Date: Tue, 26 Jan 2016 19:14:42 -0000

Changes are mostly cosmetic, but also include one important fix
to support builds using musl libc.

  http://git.openembedded.org/openembedded-core/commit/?id=9f5eb272784d3be17e7fe8e7cab511bd4086ba1e

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/mtools/mtools_3.9.9.bb | 36 +++++++++++++++-------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-devtools/mtools/mtools_3.9.9.bb b/meta/recipes-devtools/mtools/mtools_3.9.9.bb
index c284a71..26d52a9 100644
--- a/meta/recipes-devtools/mtools/mtools_3.9.9.bb
+++ b/meta/recipes-devtools/mtools/mtools_3.9.9.bb
@@ -1,16 +1,15 @@
-# mtools OE build file
-# Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
 SUMMARY = "Utilities to access MS-DOS disks without mounting them"
-DESCRIPTION = "Mtools is a collection of utilities for accessing MS-DOS disks from Unix without mounting them."
+DESCRIPTION = "Mtools is a collection of utilities to access MS-DOS disks from GNU and Unix without mounting them."
 HOMEPAGE = "http://www.gnu.org/software/mtools/"
+SECTION = "optional"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=92b58ec77696788ce278b044d2a8e9d3"
 PR = "r6"
 
-RDEPENDS_${PN} = "glibc-gconv-ibm850"
-RRECOMMENDS_${PN} = "\
+DEPENDS += "virtual/libiconv"
+
+RDEPENDS_${PN}_libc-glibc = "glibc-gconv-ibm850"
+RRECOMMENDS_${PN}_libc-glibc = "\
 	glibc-gconv-ibm437 \
 	glibc-gconv-ibm737 \
 	glibc-gconv-ibm775 \
@@ -26,24 +25,22 @@ RRECOMMENDS_${PN} = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-
-#http://mtools.linux.lu/mtools-${PV}.tar.gz 
-SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/mtools-${PV}.tar.gz \
-	file://mtools-makeinfo.patch \
-	file://mtools.patch \
-	file://no-x11.patch \
-	file://fix-broken-lz.patch \
-"
-
 SRC_URI[md5sum] = "3e68b857b4e1f3a6521d1dfefbd30a36"
 SRC_URI[sha256sum] = "af083a73425d664d4607ef6c6564fd9319a0e47ee7c105259a45356cb834690e"
 
-S = "${WORKDIR}/mtools-${PV}"
+#http://mtools.linux.lu/mtools-${PV}.tar.gz 
+SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/mtools-${PV}.tar.gz \
+           file://mtools-makeinfo.patch \
+           file://mtools.patch \
+           file://no-x11.patch \
+           file://fix-broken-lz.patch"
 
 inherit autotools texinfo
 
 EXTRA_OECONF = "--without-x"
 
+LDFLAGS_append_libc-uclibc = " -liconv "
+
 BBCLASSEXTEND = "native nativesdk"
 
 PACKAGECONFIG ??= ""
@@ -54,3 +51,8 @@ do_install_prepend () {
     mkdir -p ${D}/${bindir}
     mkdir -p ${D}/${datadir}
 }
+
+do_install_append_class-native () {
+    create_wrapper ${D}${bindir}/mcopy \
+        GCONV_PATH=${libdir}/gconv
+}
-- 
1.9.1


