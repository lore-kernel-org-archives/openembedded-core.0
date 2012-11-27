Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TdBuQ-0005J2-7U
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Nov 2012 04:32:30 +0100
Received: by mail-lb0-f175.google.com with SMTP id gg13so6067081lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2012 19:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=mfpxzEbEAwX90jWY+6Pwa8bveGch+TLvIMraBJKU9hg=;
	b=UuA0/vSSTa4b5P489kS0w+uOlgQq3EZj4G3j0dyc+vF0v+wwTqb1cAffhcNifNp8d4
	KPKq/L1BP5ClonRJ0dT43am8BE9k1Ex0XUbYYIWi4BaQaR7emBBAOSvkr9+cc4VLTOmI
	cx4fwkcbR1/QCGfanJOWU5kdPi+GYyT0ZwyIl6cp54FvKvAf0gW2tcIv++w6z9XeB3iv
	m4MnAVD5M4KOZFWuykuk6uv5mzRTUapIu6NQ7UNMiYT7vJEXzqvPeKnAeTauIkiPsCZu
	hAPGcvxxnFDZ9fEJM8WWZPj1qy+5mRN2RgODobHs4SnruYgMW7Siz1RJnByilae0cS0B
	+eEg==
Received: by 10.152.110.42 with SMTP id hx10mr13215081lab.0.1353986297585;
	Mon, 26 Nov 2012 19:18:17 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id y10sm6420643lbg.4.2012.11.26.19.18.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Nov 2012 19:18:16 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TdBgc-0002O2-7I; Tue, 27 Nov 2012 05:18:14 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Nov 2012 05:18:10 +0200
Message-Id: <1353986291-9144-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] libpng: update to upstream version 1.2.50
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Nov 2012 03:32:30 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../libpng/{libpng_1.2.49.bb => libpng_1.2.50.bb}          |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.2.49.bb => libpng_1.2.50.bb} (52%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.2.49.bb b/meta/recipes-multimedia/libpng/libpng_1.2.50.bb
similarity index 52%
rename from meta/recipes-multimedia/libpng/libpng_1.2.49.bb
rename to meta/recipes-multimedia/libpng/libpng_1.2.50.bb
index d33a9f5..211e357 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.2.49.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.2.50.bb
@@ -3,15 +3,15 @@ DESCRIPTION = "PNG Library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=20110633230abd47fe8680afa75f1492 \
-                    file://png.h;startline=308;endline=422;md5=edd1c552386a8c3773d90e278ae30891"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c3d807a85c09ebdff087f18b4969ff96 \
+                    file://png.h;startline=310;endline=424;md5=62968b88b0425ceeb919de3fd21b03e5"
 DEPENDS = "zlib"
-PR = "r1"
+PR = "r0"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/${PV}/libpng-${PV}.tar.bz2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/${PV}/libpng-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "d5106b70b4f8b464a7da66bffe4565fb"
-SRC_URI[sha256sum] = "fbf8faa70ebca2ed2ee6df6f2249f4722517b581af5b6c3c71bbdaf925d5954e"
+SRC_URI[md5sum] = "a3e00fccbfe356174ab515b5c00641c7"
+SRC_URI[sha256sum] = "4724f81f8c92ac7f360ad1fbf173396ea7c535923424db9fbaff07bfd9d8e8e7"
 
 inherit autotools binconfig pkgconfig
 
-- 
1.7.10.4



