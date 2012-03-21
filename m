Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SATMa-0002jI-KX
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 22:46:36 +0100
Received: by mail-wg0-f43.google.com with SMTP id dr12so823501wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 14:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=iULZvlk2axDPigkZZenaftXS2mw9rfmzkatAtBXDss4=;
	b=UOCkZI3FxqkTkTWSojE53EFIlfjP/mK9hC4iyQuq3usIy52umaTQPxz4RHku2YmsgA
	9F9TifYmutm0Ap6tGCaKjwVewdj/RHib9hZSqMGUs3B9qGDpRTUrjrYBSbk/saiyebXQ
	oCHGzoftfYURcOSELjM20jTBmclssJrJuhTbNpmKt7Au2CapkSOu/JbGvWWzwOlGtMni
	c/KZim0KqOVSyzorcz+k9n4/D/+4sUK2SkGi2pFapVd0GT10cg4w601rRvp1Ad/p1dbm
	3yr6O96GbxXwMXTrgHodnCVZ78t9aQpHaCIZ2wHFTS8Yj/o7owzRGs6UXvpAaO+rsqzw
	mEQQ==
Received: by 10.180.97.41 with SMTP id dx9mr41477025wib.9.1332365864493;
	Wed, 21 Mar 2012 14:37:44 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l5sm7654214wia.11.2012.03.21.14.37.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 14:37:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Mar 2012 22:36:17 +0100
Message-Id: <0f6900ab562377a776c8f149cfb898ca572ae4ff.1332365336.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <2ec6e0c134d708687c5d3d439b31607cda478dfc.1332365336.git.Martin.Jansa@gmail.com>
References: <2ec6e0c134d708687c5d3d439b31607cda478dfc.1332365336.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332365336.git.Martin.Jansa@gmail.com>
References: <cover.1332365336.git.Martin.Jansa@gmail.com>
Subject: [PATCH 12/13] pango: import native support and --disable-introspection from meta-oe
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
X-List-Received-Date: Wed, 21 Mar 2012 21:46:36 -0000

* see http://git.openembedded.org/meta-openembedded/commit/?id=3f4c8edc60b3426dd96f76504169d742a04c1ce1
  for details about --disable-introspection

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/pango/pango.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index a2d5dc3..e7681b6 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -15,6 +15,8 @@ DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv gtk-doc-native cai
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG[x11] = "--with-x,--without-x,${X11DEPENDS}"
 
+BBCLASSEXTEND = "native"
+DEPENDS_virtclass-native = "glib-2.0-native cairo-native"
 
 PACKAGES_DYNAMIC = "pango-module-*"
 
@@ -33,6 +35,7 @@ EXTRA_AUTORECONF = ""
 FULL_OPTIMIZATION_arm = "-O2"
 
 EXTRA_OECONF = "--disable-glibtest \
+		--disable-introspection \
 		--enable-explicit-deps=no \
 	        --disable-debug"
 
-- 
1.7.8.5



