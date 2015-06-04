Return-Path: <akuster808@gmail.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id B2066757F3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 19:37:15 +0000 (UTC)
Received: by qcxw10 with SMTP id w10so22010122qcx.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jun 2015 12:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=HHfLCTDKwba4P1L5LS8zhPCS5uXogysc70GJU5FViNk=;
	b=aDPd+jbR5TM2hRWNlt7BuvQfHuF9oZeGCXjfwla13kg1qUJLJSQi1Q6dV30rUX5jBL
	ENWR+hAJ3FjAjVq10kt0KI6x/GN5eA0bIOGxGAEbYr/iKNV85DYCfYSsRNPOzC+8TmlA
	CTSljFlPWLoayj08Eao7nkc9EAcZGCDIMiYY4siDl1nQilPUpMwv5qdpiR1vEVxNGmBS
	ien64/oX8SRk/D7s41uITz9HoKxRsjrCbYeCJDo+H1mKlBgBtNBOoIxDwNDVXIMq3OuC
	d9b89WdbUk28R55dJH93vGcZFcoPkw6rpySk7kgTkSn8IftLEh/EUMuPRDJk6aQeYs5r
	8WOg==
X-Received: by 10.140.48.171 with SMTP id o40mr44846795qga.0.1433446636633;
	Thu, 04 Jun 2015 12:37:16 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id i91sm2908758qgd.46.2015.06.04.12.37.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jun 2015 12:37:14 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id BD1AAFC91F0; Thu,  4 Jun 2015 12:37:09 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jun 2015 12:37:06 -0700
Message-Id: <60f0906f6e70b2468f7c629ff6f4ad1b3e2495aa.1433446500.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1433446500.git.akuster808@gmail.com>
References: <cover.1433446500.git.akuster808@gmail.com>
In-Reply-To: <cover.1433446500.git.akuster808@gmail.com>
References: <cover.1433446500.git.akuster808@gmail.com>
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
X-List-Received-Date: Thu, 04 Jun 2015 19:37:19 -0000

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


