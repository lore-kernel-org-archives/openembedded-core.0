Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy714-00052M-F2
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 22:01:34 +0200
Received: by wibhm11 with SMTP id hm11so974243wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 12:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=ZYSVsUC+LBFEG+8+l/1S5Q1Rx5depqVfQuyKr1oVUkY=;
	b=OrcFjSm2Xrgco7sDY/jjVo/uzAXchCywSbVrp1gMmFTkNPqbKKU+3MVhX2zWLL4kjf
	gWWFjmt7k68RKj6CbhqoqeVJy4t/cL8XySL263qD2uUiDub8JMFfNKhyuiw1gbKpFzNW
	zlC4fXVABNijFwR3pl9k8CuK7H5mI842SqhLXyT1WhjfJI62RrHeLRRPAdWz+giXX6Ql
	mjpJRIH9TxjP5DxrX5zgUqC8dU4uJ7dofVE12BTbiNQw+AVx2ui6KRdd3YjqVmb13Us2
	GxLNSrfmt2aiI/eSF4kxftwEg5GaYO/HQ5X40Qwar+aBgjZsqODriDOTju47KRdW4M4J
	CKVw==
Received: by 10.180.97.135 with SMTP id ea7mr12366507wib.11.1344196190859;
	Sun, 05 Aug 2012 12:49:50 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id w7sm11500981wiz.0.2012.08.05.12.49.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 12:49:50 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 21:48:37 +0200
Message-Id: <1344196136-7643-10-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
References: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQmQwB/x8wLt3+5tT6Efl4OJz1X6owIQHqfqD5aeCFkmNKIogofJYMIiDSrf9ol9MF2XcI3M
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 09/28] xkeyboard-config: use ${datadir} instead of /usr/share for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 20:01:34 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 .../xorg-lib/xkeyboard-config_2.1.bb               |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.1.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.1.bb
index b077fa3..1b28208 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.1.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.1.bb
@@ -19,7 +19,7 @@ SRC_URI[sha256sum] = "e293aa4b0dd259dbb4f0e7f56fdd95db5047d052c7b3b80922fe566392
 SECTION = "x11/libs"
 DEPENDS = "intltool-native xkbcomp-native glib-2.0"
 
-PR = "r1"
+PR = "r2"
 
 EXTRA_OECONF = "--with-xkb-rules-symlink=xorg"
 
@@ -29,6 +29,6 @@ FILES_${PN} += "${datadir}/X11/xkb"
 inherit autotools pkgconfig
 
 do_install_append () {
-    install -d ${D}/usr/share/X11/xkb/compiled
+    install -d ${D}${datadir}/X11/xkb/compiled
     cd ${D}${datadir}/X11/xkb/rules && ln -sf base xorg
 }
-- 
1.7.7.6



