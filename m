Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7181B605B3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Jun 2015 05:37:22 +0000 (UTC)
Received: by pacgb13 with SMTP id gb13so15106942pac.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Jun 2015 22:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=0d0MYmm5MKI1jIWYLgINYVm5p3sj9IvRqPy6ZtjGTUM=;
	b=L8P1062izZkD5TWN6rCkUkhxDCPfnYUJL0irtsxXo5XQHWPhvwHT+Oswda79XZ/o9t
	ZX6FBDCLxYtGLWkFTgTl7ztLkwuJGlWD8rHhkYXirOJKZrOOUrbn8syYxloJddIZpXJZ
	Fy1r+8pW/axTMf5Di+41NF5pgi7M1EUZ0SkoOm2k93Z9TKiOVmgXjtZeDwA+Jo5KVB8l
	bjz2OLuHb6zOxFXF3K1tidTI08jgnPp/OOkggBpegTmiP0Wpetuw8hnwIgCXgLZiOhqW
	SOpCg1ylpuo+Y2cqYPpM+Zd/ikJguX7ro72sVN/Ej/cfEhTii3L4WvfgT8wAL2OYWz+d
	czSg==
X-Received: by 10.68.205.33 with SMTP id ld1mr37590097pbc.22.1434260243036;
	Sat, 13 Jun 2015 22:37:23 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id g2sm8253328pdh.11.2015.06.13.22.37.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 13 Jun 2015 22:37:22 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Jun 2015 22:37:12 -0700
Message-Id: <8ca9bd71b111710ee28668c983b549a720b7b4ae.1434259784.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1434259784.git.akuster808@gmail.com>
References: <cover.1434259784.git.akuster808@gmail.com>
In-Reply-To: <cover.1434259784.git.akuster808@gmail.com>
References: <cover.1434259784.git.akuster808@gmail.com>
Subject: [PATCH 1/3] nettle: update package to 3.1.1 version.
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
X-List-Received-Date: Sun, 14 Jun 2015 05:37:22 -0000

this requires the gnutls 3.4.1  update or the current gnutils build will break.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../nettle/{nettle_2.7.1.bb => nettle_3.1.1.bb}              | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-support/nettle/{nettle_2.7.1.bb => nettle_3.1.1.bb} (48%)

diff --git a/meta/recipes-support/nettle/nettle_2.7.1.bb b/meta/recipes-support/nettle/nettle_3.1.1.bb
similarity index 48%
rename from meta/recipes-support/nettle/nettle_2.7.1.bb
rename to meta/recipes-support/nettle/nettle_3.1.1.bb
index f53afcc..ce5e756 100644
--- a/meta/recipes-support/nettle/nettle_2.7.1.bb
+++ b/meta/recipes-support/nettle/nettle_3.1.1.bb
@@ -1,17 +1,17 @@
 SUMMARY = "A low level cryptographic library"
 HOMEPAGE = "http://www.lysator.liu.se/~nisse/nettle/"
 SECTION = "libs"
-LICENSE = "LGPLv2.1 & GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://serpent-decrypt.c;beginline=53;endline=67;md5=bcfd4745d53ca57f82907089898e390d \
-                    file://serpent-set-key.c;beginline=56;endline=70;md5=bcfd4745d53ca57f82907089898e390d"
+LICENSE = "GPLv2+ & GPLv3 & LGPLv3+"
+LIC_FILES_CHKSUM = "file://COPYINGv2;beginline=1;endline=2;md5=c70d8d3310941dcdfcd1e02800a1f548 \
+                    file://COPYINGv3;beginline=1;endline=2;md5=d1c727712ceba52db52e0ee449cadf43  \
+                    file://COPYING.LESSERv3;beginline=1;endline=2;md5=ff44a06d461487fb65f84ad672a1d1c8"
 
 DEPENDS += "gmp"
 
 SRC_URI = "http://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "003d5147911317931dd453520eb234a5"
-SRC_URI[sha256sum] = "bc71ebd43435537d767799e414fce88e521b7278d48c860651216e1fc6555b40"
+SRC_URI[md5sum] = "b40fa88dc32f37a182b6b42092ebb144"
+SRC_URI[sha256sum] = "5fd4d25d64d8ddcb85d0d897572af73b05b4d163c6cc49438a5bfbb8ff293d4c"
 
 EXTRA_OECONF = "--disable-openssl"
 
-- 
2.3.5


