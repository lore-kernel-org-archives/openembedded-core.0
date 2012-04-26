Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SNOkn-0007OI-M6
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Apr 2012 15:29:01 +0200
Received: by wibhj13 with SMTP id hj13so5337020wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2012 06:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Upck+96my4M+TvmVtKCoY97IkRKj8hnOQtYpGvH+1UY=;
	b=RNDx/0ZCuqCc61y4xEcJAltrNbnkO+8Gal6xQqN25lOZaIHJrDH188zOBiKg2GMTqy
	aJXihXEAtlJjNKQexGRA5TeAML6aNsTQOMjTLAJQ8mGYbZmL8+sE3c/qBEwiUPROs/TL
	2qEnrnxGtJYOZG7v/CcTJKmz372mYqqqSNMJ/AvzwoPOOCXXTtiQHS4ZYOObsNT1YtFI
	Qd/Zp5BHE/5rXse5lDGCpkGB5MvHpACvDH5t0JjVlnTpVu4cNor/cAn/hq4Vq05Cc1JN
	hjR1LwFD4nziGN0kQEv88GS7Rs7V1kb3g4FWgD5cEK/snyIYXR+OaS/0eZzwfH37wlxU
	rOgw==
Received: by 10.180.83.198 with SMTP id s6mr16578555wiy.8.1335446364822;
	Thu, 26 Apr 2012 06:19:24 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l5sm44761442wia.11.2012.04.26.06.19.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Apr 2012 06:19:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Apr 2012 15:19:07 +0200
Message-Id: <561f04be900f136c4670ccc788c439d79c6ca378.1335439784.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1335439784.git.Martin.Jansa@gmail.com>
References: <cover.1335439784.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335439784.git.Martin.Jansa@gmail.com>
References: <cover.1335439784.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/2] xorg: add more native BBCLASSEXTENDs from meta-oe
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
X-List-Received-Date: Thu, 26 Apr 2012 13:29:01 -0000

* We have now .bbappends in meta-oe, but adding native BBCLASSEXTEND
  doesn't add any maintenance cost to oe-core and makes recipe upgrades
  easier (no need to wait for .bbappend renames ready for meta-oe).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-lib/libxcomposite_0.4.3.bb                |    1 +
 .../recipes-graphics/xorg-lib/libxcursor_1.1.13.bb |    1 +
 meta/recipes-graphics/xorg-lib/libxdamage_1.1.3.bb |    1 +
 meta/recipes-graphics/xorg-lib/libxfixes_5.0.bb    |    2 +-
 meta/recipes-graphics/xorg-lib/libxrandr_1.3.2.bb  |    2 +-
 .../xorg-proto/compositeproto_0.4.2.bb             |    1 +
 .../xorg-proto/damageproto_1.2.1.bb                |    1 +
 meta/recipes-graphics/xorg-proto/fixesproto_5.0.bb |    2 +-
 .../xorg-proto/randrproto_1.3.2.bb                 |    2 +-
 9 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.3.bb b/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.3.bb
index deaa366..7377711 100644
--- a/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.3.bb
@@ -16,6 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3f2907aad541f6f226fbc58cc1b3cdf1"
 
 DEPENDS += " compositeproto virtual/libx11 libxfixes libxext"
 PROVIDES = "xcomposite"
+BBCLASSEXTEND = "native"
 
 PE = "1"
 PR = "r0"
diff --git a/meta/recipes-graphics/xorg-lib/libxcursor_1.1.13.bb b/meta/recipes-graphics/xorg-lib/libxcursor_1.1.13.bb
index c0f1a0f..4388596 100644
--- a/meta/recipes-graphics/xorg-lib/libxcursor_1.1.13.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcursor_1.1.13.bb
@@ -12,6 +12,7 @@ LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8902e6643f7bcd7793b23dcd5d8031a4"
 
 DEPENDS += "libxrender libxfixes"
+BBCLASSEXTEND = "native"
 
 PR = "r0"
 PE = "1"
diff --git a/meta/recipes-graphics/xorg-lib/libxdamage_1.1.3.bb b/meta/recipes-graphics/xorg-lib/libxdamage_1.1.3.bb
index f2b4eac..dfc2425 100644
--- a/meta/recipes-graphics/xorg-lib/libxdamage_1.1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxdamage_1.1.3.bb
@@ -18,6 +18,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9fe101f30dd24134cf43146863241868"
 
 DEPENDS += "virtual/libx11 damageproto libxfixes"
 PROVIDES = "xdamage"
+BBCLASSEXTEND = "native"
 
 PR = "r1"
 PE = "1"
diff --git a/meta/recipes-graphics/xorg-lib/libxfixes_5.0.bb b/meta/recipes-graphics/xorg-lib/libxfixes_5.0.bb
index 0883cd1..1bdc3c0 100644
--- a/meta/recipes-graphics/xorg-lib/libxfixes_5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfixes_5.0.bb
@@ -17,7 +17,7 @@ PE = "1"
 
 XORG_PN = "libXfixes"
 
-BBCLASSEXTEND = "nativesdk"
+BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI[md5sum] = "678071bd7f9f7467e2fc712d81022318"
 SRC_URI[sha256sum] = "537a2446129242737a35db40081be4bbcc126e56c03bf5f2b142b10a79cda2e3"
diff --git a/meta/recipes-graphics/xorg-lib/libxrandr_1.3.2.bb b/meta/recipes-graphics/xorg-lib/libxrandr_1.3.2.bb
index 7bc805f..6fc3cf5 100644
--- a/meta/recipes-graphics/xorg-lib/libxrandr_1.3.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxrandr_1.3.2.bb
@@ -18,7 +18,7 @@ PE = "1"
 
 XORG_PN = "libXrandr"
 
-BBCLASSEXTEND = "nativesdk"
+BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI[md5sum] = "92473da2fccf5fac665be4fa4f2037fa"
 SRC_URI[sha256sum] = "7eaca216ab5233d7396119eb87c1989d350a3efead104d54b55f22cdd1d99b81"
diff --git a/meta/recipes-graphics/xorg-proto/compositeproto_0.4.2.bb b/meta/recipes-graphics/xorg-proto/compositeproto_0.4.2.bb
index 5917f20..093ee99 100644
--- a/meta/recipes-graphics/xorg-proto/compositeproto_0.4.2.bb
+++ b/meta/recipes-graphics/xorg-proto/compositeproto_0.4.2.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2c4bfe136f4a4418ea2f2a96b7c8f3c5 \
                     file://composite.h;endline=43;md5=cbd44d4079053aa75930ed2f02b92926"
 
 CONFLICTS = "compositeext"
+BBCLASSEXTEND = "native"
 
 PR = "r0"
 PE = "1"
diff --git a/meta/recipes-graphics/xorg-proto/damageproto_1.2.1.bb b/meta/recipes-graphics/xorg-proto/damageproto_1.2.1.bb
index 6bfa1b2..de2d69c 100644
--- a/meta/recipes-graphics/xorg-proto/damageproto_1.2.1.bb
+++ b/meta/recipes-graphics/xorg-proto/damageproto_1.2.1.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d5f5a2de65c3a84cbde769f07a769608 \
                     file://damagewire.h;endline=23;md5=4a4501a592dbc7de5ce89255e50d0296"
 
 CONFLICTS = "damageext"
+BBCLASSEXTEND = "native"
 PR = "r0"
 PE = "1"
 
diff --git a/meta/recipes-graphics/xorg-proto/fixesproto_5.0.bb b/meta/recipes-graphics/xorg-proto/fixesproto_5.0.bb
index d65922b..2c05cf7 100644
--- a/meta/recipes-graphics/xorg-proto/fixesproto_5.0.bb
+++ b/meta/recipes-graphics/xorg-proto/fixesproto_5.0.bb
@@ -16,7 +16,7 @@ CONFLICTS = "fixesext"
 PR = "r0"
 PE = "1"
 
-BBCLASSEXTEND = "nativesdk"
+BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI[md5sum] = "e7431ab84d37b2678af71e29355e101d"
 SRC_URI[sha256sum] = "ba2f3f31246bdd3f2a0acf8bd3b09ba99cab965c7fb2c2c92b7dc72870e424ce"
diff --git a/meta/recipes-graphics/xorg-proto/randrproto_1.3.2.bb b/meta/recipes-graphics/xorg-proto/randrproto_1.3.2.bb
index f0f81bc..e4fe37b 100644
--- a/meta/recipes-graphics/xorg-proto/randrproto_1.3.2.bb
+++ b/meta/recipes-graphics/xorg-proto/randrproto_1.3.2.bb
@@ -14,7 +14,7 @@ CONFLICTS = "randrext"
 PR = "r0"
 PE = "1"
 
-BBCLASSEXTEND = "nativesdk"
+BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI[md5sum] = "597491c0d8055e2a66f11350c4985775"
 SRC_URI[sha256sum] = "d90d00612cc49292bd8d9dc19efb1c9187385fbe87590d7279a02e5e1066dc71"
-- 
1.7.8.5



