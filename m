Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RCDyC-0005tt-QB
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 19:12:27 +0200
Received: by gyg8 with SMTP id 8so3931090gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 10:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=YB1nygyZRhedUCjJ/qjUGvVtVQwGxNYWtjGFawXZChA=;
	b=vY1zxAWerzJq+Y+aaBX1joxnqFx5zj511oA1AMSvkthPh5l38kB6N6z/18+L+IqYoP
	TvZWFB2Dw0Pg7Pt4Yyy6MIkU7/nH+kncGpFi9I3DzrFQ80ozO5PaYyRjqDbyhEsF2tgK
	+df3bVHR99dZfmUyGLhBT6or7F+Jh5fBLMYNY=
Received: by 10.223.88.71 with SMTP id z7mr11925531fal.26.1318007207173;
	Fri, 07 Oct 2011 10:06:47 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id g19sm13617018fai.8.2011.10.07.10.06.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 10:06:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2011 19:05:05 +0200
Message-Id: <4681e02fdd2b9e4d899041c3eb17f6137a88fc0c.1318007055.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
References: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318007055.git.Martin.Jansa@gmail.com>
References: <cover.1318007055.git.Martin.Jansa@gmail.com>
Subject: [PATCHv3 10/31] xserver-xorg-common: move RDEPENDS_${PN} += xorg-minimal-fonts to shared .inc
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
X-List-Received-Date: Fri, 07 Oct 2011 17:12:27 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-xserver/xserver-xorg-common.inc           |    1 +
 .../xorg-xserver/xserver-xorg-lite.inc             |    2 --
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    2 --
 3 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
index 099d240..77c3761 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
@@ -60,6 +60,7 @@ PACKAGES =+ "${PN}-security-policy \
              ${PN}-module-libxf1bpp \
              ${PN}-module-libxf4bpp"
 
+RDEPENDS_${PN} += "xorg-minimal-fonts"
 RRECOMMENDS_${PN} += "${PN}-security-policy xkeyboard-config rgb xserver-xf86-config"
 RDEPENDS_${PN}-xvfb += "xkeyboard-config"
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
index a942a11..2483553 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
@@ -1,7 +1,5 @@
 require xserver-xorg-common.inc
 
-RDEPENDS_${PN} += "xorg-minimal-fonts"
-
 FILES_${PN} += "${bindir}/Xorg "
 
 EXTRA_OECONF += "--disable-static \
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 71754f7..6a4f978 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -3,8 +3,6 @@ require xserver-xorg-common.inc
 PROTO_DEPS += "xf86driproto dri2proto"
 LIB_DEPS += "virtual/libgl"
 
-RDEPENDS_${PN} += "xorg-minimal-fonts"
-
 FILES_${PN} += "${bindir}/Xorg "
 
 EXTRA_OECONF += "--disable-static \
-- 
1.7.7



