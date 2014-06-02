Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 105C26FA52
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jun 2014 20:06:57 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s52K655C021425 for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jun 2014 21:06:53 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jRD6kwdnYdKJ
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jun 2014 21:06:53 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s52K6neH021452
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jun 2014 21:06:50 +0100
Message-ID: <1401739601.12440.13.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 02 Jun 2014 21:06:41 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] libcroco/libfm/menu-cache: Add missing gtk-doc class dependencies
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
X-List-Received-Date: Mon, 02 Jun 2014 20:06:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

These recipes all use gtk-doc m4 macros but were missing dependencies
on the class.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-graphics/menu-cache/menu-cache_0.4.1.bb b/meta/recipes-graphics/menu-cache/menu-cache_0.4.1.bb
index 73a9c52..98bbe76 100644
--- a/meta/recipes-graphics/menu-cache/menu-cache_0.4.1.bb
+++ b/meta/recipes-graphics/menu-cache/menu-cache_0.4.1.bb
@@ -18,4 +18,4 @@ SRC_URI[md5sum] = "20fed982f5d8e6ec8a56a5b48894ecf0"
 SRC_URI[sha256sum] = "4fa9408e353fedba5b7314cbf6b6cd06d873a1424e281aa050d88bb9c0a0191e"
 
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig gtk-doc
diff --git a/meta/recipes-support/libcroco/libcroco_0.6.8.bb b/meta/recipes-support/libcroco/libcroco_0.6.8.bb
index 385665f..7d04265 100644
--- a/meta/recipes-support/libcroco/libcroco_0.6.8.bb
+++ b/meta/recipes-support/libcroco/libcroco_0.6.8.bb
@@ -13,7 +13,7 @@ BBCLASSEXTEND = "native"
 EXTRA_OECONF += "--enable-Bsymbolic=auto"
 PR = "r1"
 
-inherit autotools-brokensep pkgconfig gnomebase
+inherit autotools-brokensep pkgconfig gnomebase gtk-doc
 
 GNOME_COMPRESS_TYPE = "xz"
 
diff --git a/meta/recipes-support/libfm/libfm_1.1.2.2.bb b/meta/recipes-support/libfm/libfm_1.1.2.2.bb
index ea6323a..11ca9c1 100644
--- a/meta/recipes-support/libfm/libfm_1.1.2.2.bb
+++ b/meta/recipes-support/libfm/libfm_1.1.2.2.bb
@@ -17,7 +17,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.gz \
 SRC_URI[md5sum] = "ea3d09b23ef4c37cb84ae57ea16b8f08"
 SRC_URI[sha256sum] = "158e2b6974350d2dab15932b496bb4d448553e60bbf7cdfe4d6e9bd99d19d682"
 
-inherit autotools-brokensep pkgconfig
+inherit autotools-brokensep pkgconfig gtk-doc
 
 PACKAGES += "${PN}-mime"
 FILES_${PN}-mime = "${datadir}/mime/"



