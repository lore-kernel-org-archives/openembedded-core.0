Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAiiA-0005A2-LM
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 15:37:38 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so5356292bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=fludJ4hq/ExpXZYffgy08M+3yycjDndy5R3I/UN3fgw=;
	b=CsVk23OI/mOuDDobOOApBanMavvju957OmWShCUxq68lVINgOmo3pNKvw/WUoC35nT
	PeA6CtWUIogJZKyVg3wvNrkwKYokMrsLoumgKbIvmZRo+Fb6Z9BDu28vdk2+8l6lMCe4
	NANfUQYtkYBuiTBA9VnImzHvCnwAqGGiSI7+Q=
Received: by 10.204.6.206 with SMTP id a14mr7466948bka.345.1317648727929;
	Mon, 03 Oct 2011 06:32:07 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w3sm13223301bkp.10.2011.10.03.06.32.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:32:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:28:54 +0200
Message-Id: <4960d64bd4176b6e7b139867b2bb5071e206c3f6.1317648041.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
References: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648040.git.Martin.Jansa@gmail.com>
References: <cover.1317648040.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 23/30] libx11-diet: move old patches used only by libx11-diet-1.3 to separate directory
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
X-List-Received-Date: Mon, 03 Oct 2011 13:44:10 -0000

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
index 018a141..44e8765 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb
@@ -17,7 +17,6 @@ SRC_URI += "file://x11_disable_makekeys.patch \
 DEPENDS += "bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
             libxdmcp xf86bigfontproto kbproto inputproto xproto-native"
 
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libx11"
 
 EXTRA_OECONF += "--with-keysymdef=${STAGING_INCDIR}/X11/keysymdef.h --without-xcb --disable-udc --disable-xcms --disable-xlocale"
 CFLAGS += "-D_GNU_SOURCE"
-- 
1.7.7



