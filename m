Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id E1F956AC1E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 01:38:01 +0000 (UTC)
Received: by pdbci14 with SMTP id ci14so91356103pdb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jun 2015 18:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HHfLCTDKwba4P1L5LS8zhPCS5uXogysc70GJU5FViNk=;
	b=nU1H/mDbGSWG28237cLCxPp/46kbVzv1uyoaUo1ZCKnYafoPhMXzUtktc1qCKgSUZn
	LcKMpYZ6FPJoLG193R33zm5Uceyz0HAxK7Nkj4E3SbnOQgIulyCgiIskM4ClfMxReRJ6
	VDTunOiO1+5o2dc0L5JTamjG7az1uxxPqNg2OEAY/NzB4aEsrP2tUKTRB+wlC68xWwWz
	MyDS2Cy06ONdqHn/HlJFQh9lSrMVA+chQWV5Gf2zwaF/NZJV2z5ELD1pyQuYd8ZJWJsx
	scx9gsmbeUuibTHibve5iPwmNOrMaLG67gDE1nG1K2GUHT6d8qUuB4TfdfFhmpqqg7An
	M3OQ==
X-Received: by 10.68.135.36 with SMTP id pp4mr64888334pbb.134.1435023482627;
	Mon, 22 Jun 2015 18:38:02 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	i10sm21207162pdr.78.2015.06.22.18.38.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Jun 2015 18:38:01 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 881BAFC46EB; Mon, 22 Jun 2015 18:37:58 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jun 2015 18:37:54 -0700
Message-Id: <2bcc164faf8bbe473eb08c5046a636ca69e25dd1.1435022780.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1435022780.git.akuster808@gmail.com>
References: <cover.1435022780.git.akuster808@gmail.com>
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
X-List-Received-Date: Tue, 23 Jun 2015 01:38:04 -0000

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
1.9.1


