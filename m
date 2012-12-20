Received: from nat-lmt.mentorg.com ([139.181.28.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <noor_ahsan@mentor.com>) id 1Tlefx-0007oL-5o
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 12:52:37 +0100
Received: from pkl-ahsann-ubuntu.mgc.mentorg.com ([137.202.157.70])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id qBKBbiaF019723;
	Thu, 20 Dec 2012 05:37:45 -0600
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Dec 2012 16:37:24 +0500
Message-Id: <1356003444-22171-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] freetype: Update EXTRA_OECONF to use host gcc.
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
X-List-Received-Date: Thu, 20 Dec 2012 11:52:37 -0000

From: Noor Ahsan <noor_ahsan@mentor.com>

* It uses host gcc in its configure script. When IA32
toolchain is installed it starts using its binaries instead
of native gcc. Modified EXTRA_OECONF so that host gcc is used.

Signed-off-by: Noor Ahsa <noor_ahsan@mentor.com>
---
 meta/recipes-graphics/freetype/freetype_2.4.10.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/freetype/freetype_2.4.10.bb b/meta/recipes-graphics/freetype/freetype_2.4.10.bb
index 9365475..35d6d22 100644
--- a/meta/recipes-graphics/freetype/freetype_2.4.10.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.4.10.bb
@@ -28,7 +28,7 @@ inherit autotools pkgconfig binconfig
 LIBTOOL = "${S}/builds/unix/${HOST_SYS}-libtool"
 EXTRA_OEMAKE = "'LIBTOOL=${LIBTOOL}'"
 EXTRA_OEMAKE_class-native = ""
-EXTRA_OECONF = "--without-zlib --without-bzip2"
+EXTRA_OECONF = "--without-zlib --without-bzip2 CC_BUILD='${BUILD_CC}'"
 
 do_configure() {
 	cd builds/unix
-- 
1.7.9.5



