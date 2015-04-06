Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1978B73D39
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 17:37:09 +0000 (UTC)
Received: by ignm3 with SMTP id m3so23417249ign.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Apr 2015 10:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=XeErWDEcYJByBZIJGuRiOklYkTk928FiPs/NpZSRlOg=;
	b=SPvxerVU8w4a1hnI7Al4Oha6JOnoBsMOCByyzFQyMmjS4NjsCPRleovmcI3jOd0omz
	oBPh7mHlzU/vO2CSJA4t6Vh8RSSa5hDzq8142xz2a2IM782sy5b5Xs3qkqnlujmQusq+
	ltb4E/UzbZM1gLo77TKOstICr8YuWJm2g7qjt325/EzGfeiuj2HbYeXhMmQhayAqfTDK
	7FLbPi9sbVlIVPiOPFQBO8UdGtPhnjCR/2T3/h0z6W23HZwZgA12N91TtYOk1GWDaEmH
	A7CiIzo3nPXs+1g8nPppIl6TNdT6taG/fEWOWRZPdckSWGKITwjds1TYhRboW3497qij
	05cA==
X-Received: by 10.107.12.93 with SMTP id w90mr17492874ioi.10.1428341830582;
	Mon, 06 Apr 2015 10:37:10 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id 7sm3063135iol.43.2015.04.06.10.37.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Apr 2015 10:37:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Apr 2015 17:36:40 +0000
Message-Id: <3fe52a814686504ff0b9fe44c36edebfe653ae81.1428341478.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
References: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
In-Reply-To: <cover.1428341477.git.raj.khem@gmail.com>
References: <cover.1428341477.git.raj.khem@gmail.com>
Subject: [PATCH 12/24] libusb-compat: Include sys/types.h in usb.h
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
X-List-Received-Date: Mon, 06 Apr 2015 17:37:09 -0000

Fixes compile errors when usb.h is included in
other packages, it expects sys/types.h to be
there, instead it should include it itself

Change-Id: Ib49477b7d3f3cd97d65c9578bdc33f2ee33f5a26
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-usb.h-Include-sys-types.h.patch           | 30 ++++++++++++++++++++++
 meta/recipes-support/libusb/libusb-compat_0.1.5.bb |  4 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libusb/libusb-compat/0001-usb.h-Include-sys-types.h.patch

diff --git a/meta/recipes-support/libusb/libusb-compat/0001-usb.h-Include-sys-types.h.patch b/meta/recipes-support/libusb/libusb-compat/0001-usb.h-Include-sys-types.h.patch
new file mode 100644
index 0000000..b88440d
--- /dev/null
+++ b/meta/recipes-support/libusb/libusb-compat/0001-usb.h-Include-sys-types.h.patch
@@ -0,0 +1,30 @@
+From 340f911f9e3f4ff6b01682c5341c959060782af2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 2 Apr 2015 19:18:45 -0700
+Subject: [PATCH] usb.h: Include sys/types.h
+
+We need the definitions for things like u_intX_t
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libusb/usb.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libusb/usb.h b/libusb/usb.h
+index 84e730f..caffae2 100644
+--- a/libusb/usb.h
++++ b/libusb/usb.h
+@@ -31,6 +31,8 @@
+ 
+ #include <dirent.h>
+ 
++#include <sys/types.h>
++
+ /*
+  * USB spec information
+  *
+-- 
+2.1.4
+
diff --git a/meta/recipes-support/libusb/libusb-compat_0.1.5.bb b/meta/recipes-support/libusb/libusb-compat_0.1.5.bb
index 74761d6..646872c 100644
--- a/meta/recipes-support/libusb/libusb-compat_0.1.5.bb
+++ b/meta/recipes-support/libusb/libusb-compat_0.1.5.bb
@@ -18,7 +18,9 @@ BBCLASSEXTEND = "native nativesdk"
 
 PE = "1"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-compat-${PV}.tar.bz2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-compat-${PV}.tar.bz2 \
+           file://0001-usb.h-Include-sys-types.h.patch \
+          "
 
 SRC_URI[md5sum] = "2780b6a758a1e2c2943bdbf7faf740e4"
 SRC_URI[sha256sum] = "404ef4b6b324be79ac1bfb3d839eac860fbc929e6acb1ef88793a6ea328bc55a"
-- 
2.1.4


