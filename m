Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9fRR-0004F2-8X
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 17:56:01 +0200
Received: by fxi1 with SMTP id 1so3208895fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 08:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=TyrxN5qFCVvWeb/oVSoGl7rxoHUC5opv4VbP0X/cXpo=;
	b=tn7xdc0YCo7djxCuZS3dfln4PikgkCnGlRUtsskldVE/GMA6OjqsCDN6H5z+soc+X/
	JEKmg/kSaU+NCpLE/82d75o4SYI1hGPCzBLsQGO2ThtdwxxYnfZ+Y8fwUfrHyBuQtOTs
	HDfRNyE9AfmPAUI/BiMWM07lyxLEfRo3M9DGk=
Received: by 10.223.55.16 with SMTP id s16mr6721677fag.95.1317397450528;
	Fri, 30 Sep 2011 08:44:10 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id m26sm7194277fac.6.2011.09.30.08.44.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 08:44:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 17:43:24 +0200
Message-Id: <3fbae7ba37129994dd21f35355b67985823a5275.1317397204.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <e89070827bd58e6b3e54d336dd179ad508a960ee.1317397204.git.Martin.Jansa@gmail.com>
References: <e89070827bd58e6b3e54d336dd179ad508a960ee.1317397204.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317397204.git.Martin.Jansa@gmail.com>
References: <cover.1317397204.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 5/9] gstreamer: upgrade to 0.10.35
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Sep 2011 15:56:01 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../check_fix.patch                                |    0
 .../gst-inspect-check-error.patch                  |    0
 .../gstregistrybinary.c                            |    0
 .../gstregistrybinary.h                            |    0
 .../{gstreamer_0.10.32.bb => gstreamer_0.10.35.bb} |    6 ++----
 5 files changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer-0.10.32 => gstreamer-0.10.35}/check_fix.patch (100%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer-0.10.32 => gstreamer-0.10.35}/gst-inspect-check-error.patch (100%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer-0.10.32 => gstreamer-0.10.35}/gstregistrybinary.c (100%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer-0.10.32 => gstreamer-0.10.35}/gstregistrybinary.h (100%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer_0.10.32.bb => gstreamer_0.10.35.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer-0.10.32/check_fix.patch b/meta/recipes-multimedia/gstreamer/gstreamer-0.10.35/check_fix.patch
similarity index 100%
rename from meta/recipes-multimedia/gstreamer/gstreamer-0.10.32/check_fix.patch
rename to meta/recipes-multimedia/gstreamer/gstreamer-0.10.35/check_fix.patch
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer-0.10.32/gst-inspect-check-error.patch b/meta/recipes-multimedia/gstreamer/gstreamer-0.10.35/gst-inspect-check-error.patch
similarity index 100%
rename from meta/recipes-multimedia/gstreamer/gstreamer-0.10.32/gst-inspect-check-error.patch
rename to meta/recipes-multimedia/gstreamer/gstreamer-0.10.35/gst-inspect-check-error.patch
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer-0.10.32/gstregistrybinary.c b/meta/recipes-multimedia/gstreamer/gstreamer-0.10.35/gstregistrybinary.c
similarity index 100%
rename from meta/recipes-multimedia/gstreamer/gstreamer-0.10.32/gstregistrybinary.c
rename to meta/recipes-multimedia/gstreamer/gstreamer-0.10.35/gstregistrybinary.c
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer-0.10.32/gstregistrybinary.h b/meta/recipes-multimedia/gstreamer/gstreamer-0.10.35/gstregistrybinary.h
similarity index 100%
rename from meta/recipes-multimedia/gstreamer/gstreamer-0.10.32/gstregistrybinary.h
rename to meta/recipes-multimedia/gstreamer/gstreamer-0.10.35/gstregistrybinary.h
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer_0.10.32.bb b/meta/recipes-multimedia/gstreamer/gstreamer_0.10.35.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer_0.10.32.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer_0.10.35.bb
index 1713755..50916e5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer_0.10.32.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer_0.10.35.bb
@@ -9,14 +9,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605 \
                     file://gst/gst.h;beginline=1;endline=21;md5=8e5fe5e87d33a04479fde862e238eaa4"
 DEPENDS = "glib-2.0 libxml2 bison-native flex-native"
 
-PR = "r1"
-
 SRC_URI = "http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.bz2 \
            file://check_fix.patch \
            file://gst-inspect-check-error.patch"
 
-SRC_URI[md5sum] = "442bc3d37b8511a73379143e7531d726"
-SRC_URI[sha256sum] = "3bf4e46a186ee9a1f5e212aaf651d67cffb4f5f05345a7c99ae71d5d992be133"
+SRC_URI[md5sum] = "4a0a00edad7a2c83de5211ca679dfaf9"
+SRC_URI[sha256sum] = "817bfea2cd46e2487b97e2ed9218f0299b32a3de1e5e80b4c7868d17e9089786"
 
 inherit autotools pkgconfig gettext
 
-- 
1.7.6.1



