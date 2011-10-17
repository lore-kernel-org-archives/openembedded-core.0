Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RFvSx-0004xK-F1
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Oct 2011 00:15:27 +0200
Received: by bkat8 with SMTP id t8so10186bka.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 15:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Yk2FaFuy3VtCQ1Y+SImtfUvL3mX8fd+5oumj+gu26iM=;
	b=i9W6sdkp7e/gQdLaUEID7Ch0PB4W9d0/nuJPhE7hmg4TR7AltCXUxRi/A8uPsYK6fJ
	eyEEOrh6RErMZtkTJPVsLkyCBOGxmcoFDFF/m/5ZXPastcZzDBdcO2+L4Ke78Q7oTzLJ
	Vg1P/KSvFcKvWMsAffACoLl2Vm1Qs6Nz46ud8=
Received: by 10.204.151.217 with SMTP id d25mr15516823bkw.88.1318889369955;
	Mon, 17 Oct 2011 15:09:29 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k6sm18650088bkv.8.2011.10.17.15.09.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Oct 2011 15:09:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Oct 2011 00:09:20 +0200
Message-Id: <1318889360-23524-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
Subject: [PATCH] fontconfig: fix fix-pkgconfig.patch
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
X-List-Received-Date: Mon, 17 Oct 2011 22:15:27 -0000

* missing $ is causing problems ie when building webkit-efl
* see http://lists.linuxtogo.org/pipermail/openembedded-core/2011-June/003798.html
  for details

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../fontconfig-2.8.0/fix-pkgconfig.patch           |    2 +-
 .../fontconfig/fontconfig_2.8.0.bb                 |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig-2.8.0/fix-pkgconfig.patch b/meta/recipes-graphics/fontconfig/fontconfig-2.8.0/fix-pkgconfig.patch
index c8a3bf5..30415fc 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig-2.8.0/fix-pkgconfig.patch
+++ b/meta/recipes-graphics/fontconfig/fontconfig-2.8.0/fix-pkgconfig.patch
@@ -11,5 +11,5 @@ Upstream-Status: Inappropriate [configuration]
  Version: @VERSION@
  Libs: -L${libdir} -lfontconfig
 -Libs.private: @LIBXML2_LIBS@ @EXPAT_LIBS@ @FREETYPE_LIBS@ @ICONV_LIBS@
-+Libs.private: @LIBXML2_LIBS@ @EXPAT_LIBS@ -L{libdir} -lfreetype @ICONV_LIBS@
++Libs.private: @LIBXML2_LIBS@ @EXPAT_LIBS@ -L${libdir} -lfreetype @ICONV_LIBS@
  Cflags: -I${includedir}
diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.8.0.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.8.0.bb
index 5381065..55c04cc 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.8.0.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.8.0.bb
@@ -20,7 +20,7 @@ SECTION = "libs"
 
 DEPENDS = "expat freetype zlib"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://fontconfig.org/release/fontconfig-${PV}.tar.gz \
            file://fix-pkgconfig.patch \
-- 
1.7.7



