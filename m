Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RCE0X-0006Im-8l
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 19:14:49 +0200
Received: by eyx24 with SMTP id 24so2131966eyx.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 10:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=qvswVmwIToYNXm4WDRmZDaVk5/VjyebxdHDERxZcJeM=;
	b=oBCRkBhXBbC1jY/QsDejRq3kQ2HiYSvyvPKDeEnM8yOYlMaMdj8Jj6FoBNczs90ZIl
	Z3pcQ/nj4DCe4vDwx4YVlmLg5hwiiZO+eEMGdHaY4sM0N7C33jJLn4GLXIvhe1kzVs7B
	QEOr5jKJCAQEPwbeTaBnKbaL5O5SPOkphbCJk=
Received: by 10.223.77.69 with SMTP id f5mr11943128fak.3.1318007349137;
	Fri, 07 Oct 2011 10:09:09 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k26sm13616615fab.12.2011.10.07.10.09.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 10:09:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2011 19:05:22 +0200
Message-Id: <c5ee70a215000fdee6bf03797d766b9ea20fa5e6.1318007055.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
References: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318007055.git.Martin.Jansa@gmail.com>
References: <cover.1318007055.git.Martin.Jansa@gmail.com>
Subject: [PATCHv3 27/31] libx11-diet: move old patches used only by libx11-diet-1.3 to separate directory
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
X-List-Received-Date: Fri, 07 Oct 2011 17:14:49 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{libx11 => libx11-diet-1.3}/include_fix.patch  |    0
 .../{libx11 => libx11-diet-1.3}/nodolt.patch       |    0
 .../x11_disable_makekeys.patch                     |    0
 meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb  |    1 -
 4 files changed, 0 insertions(+), 1 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libx11 => libx11-diet-1.3}/include_fix.patch (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11 => libx11-diet-1.3}/nodolt.patch (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11 => libx11-diet-1.3}/x11_disable_makekeys.patch (100%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11/include_fix.patch b/meta/recipes-graphics/xorg-lib/libx11-diet-1.3/include_fix.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-lib/libx11/include_fix.patch
rename to meta/recipes-graphics/xorg-lib/libx11-diet-1.3/include_fix.patch
diff --git a/meta/recipes-graphics/xorg-lib/libx11/nodolt.patch b/meta/recipes-graphics/xorg-lib/libx11-diet-1.3/nodolt.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-lib/libx11/nodolt.patch
rename to meta/recipes-graphics/xorg-lib/libx11-diet-1.3/nodolt.patch
diff --git a/meta/recipes-graphics/xorg-lib/libx11/x11_disable_makekeys.patch b/meta/recipes-graphics/xorg-lib/libx11-diet-1.3/x11_disable_makekeys.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-lib/libx11/x11_disable_makekeys.patch
rename to meta/recipes-graphics/xorg-lib/libx11-diet-1.3/x11_disable_makekeys.patch
diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb
index d97a5b8..de7edf1 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb
@@ -20,7 +20,6 @@ SRC_URI[sha256sum] = "34656d022ff2f94430b534612821428fe15ade028d86a42907958167f2
 DEPENDS += "bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
             libxdmcp xf86bigfontproto kbproto inputproto xproto-native"
 
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libx11"
 
 EXTRA_OECONF += "--with-keysymdef=${STAGING_INCDIR}/X11/keysymdef.h --without-xcb --disable-udc --disable-xcms --disable-xlocale"
 CFLAGS += "-D_GNU_SOURCE"
-- 
1.7.7



