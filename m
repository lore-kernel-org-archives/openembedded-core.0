Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROCIF-0007uS-2w
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 18:50:35 +0100
Received: by mail-fx0-f47.google.com with SMTP id t2so2005273faa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2011 09:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=r6OB0qjySzn40Wh+Z8qWg4qp+vqdg2q88sINNcB/XXg=;
	b=jSTxxEMpdCKqOfBnOw9Ai1ZCtIdlLqMQv7SD1eK9+MaS7CHFu1nnjtPMwsgwNHAmM1
	MJeJFvCtrn7G1Ve/rG/OUaHe7v5mG9DERqfJ5nF1+B6/fbYGtjnIEc3i6AhTpBn/S0Ws
	7FGS4QcfNzy9Iu7BrtA6wELp/1w8AusHu4grU=
Received: by 10.223.77.71 with SMTP id f7mr6121755fak.33.1320860661685;
	Wed, 09 Nov 2011 09:44:21 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j5sm7419050faf.14.2011.11.09.09.44.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Nov 2011 09:44:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 18:43:27 +0100
Message-Id: <6f667e3f22d175115a4044a47cc3b49327b0314a.1320860288.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
In-Reply-To: <9eb3a8573af150cb4bf27b0b4404e527c9cfe931.1320860288.git.Martin.Jansa@gmail.com>
References: <9eb3a8573af150cb4bf27b0b4404e527c9cfe931.1320860288.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1320860288.git.Martin.Jansa@gmail.com>
References: <cover.1320860288.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2][oe-core 06/10] libsdl: drop unused files
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
X-List-Received-Date: Wed, 09 Nov 2011 17:50:35 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libsdl/files/directfb_obsolete_calls.patch     |   35 ------------
 .../recipes-graphics/libsdl/files/extra-keys.patch |   55 --------------------
 2 files changed, 0 insertions(+), 90 deletions(-)
 delete mode 100644 meta/recipes-graphics/libsdl/files/directfb_obsolete_calls.patch
 delete mode 100644 meta/recipes-graphics/libsdl/files/extra-keys.patch

diff --git a/meta/recipes-graphics/libsdl/files/directfb_obsolete_calls.patch b/meta/recipes-graphics/libsdl/files/directfb_obsolete_calls.patch
deleted file mode 100644
index 3c526a6..0000000
--- a/meta/recipes-graphics/libsdl/files/directfb_obsolete_calls.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Upstream-Status: Pending
-
---- tmp/work/armv5te-angstrom-linux-gnueabi/libsdl-directfb-1.2.9-r1/SDL-1.2.9/src/video/directfb/SDL_DirectFB_video.c	2007-02-18 11:40:38.000000000 -0500
-+++ SDL/src/video/directfb/SDL_DirectFB_video.c	2007-02-18 11:00:07.000000000 -0500
-@@ -376,7 +376,7 @@
- {
-   int                      i;
-   DFBResult                ret;
--  DFBCardCapabilities      caps;
-+  DFBGraphicsDeviceDescription      caps;
-   DFBDisplayLayerConfig    dlc;
-   struct DirectFBEnumRect *rect;
-   IDirectFB               *dfb    = NULL;
-@@ -448,7 +448,7 @@
- 
- 
-   /* Query card capabilities to get the video memory size */
--  dfb->GetCardCapabilities (dfb, &caps);
-+  dfb->GetDeviceDescription (dfb, &caps);
- 
-   this->info.wm_available = 1;
-   this->info.hw_available = 1;
-diff -u'rNF^function' tmp/work/armv5te-angstrom-linux-gnueabi/libsdl-directfb-1.2.9-r1/SDL-1.2.9/src/video/directfb/SDL_Direct
-/SDL_DirectFB_events.c
---- tmp/work/armv5te-angstrom-linux-gnueabi/libsdl-directfb-1.2.9-r1/SDL-1.2.9/src/video/directfb/SDL_DirectFB_events.c 2004-0
-+++ SDL/src/video/directfb/SDL_DirectFB_events.c        2007-02-18 11:00:07.000000000 -0500
-@@ -161,7 +161,7 @@
-   keymap[DIKI_SHIFT_L - DIKI_UNKNOWN] = SDLK_LSHIFT;
-   keymap[DIKI_SHIFT_R - DIKI_UNKNOWN] = SDLK_RSHIFT;
-   keymap[DIKI_ALT_L - DIKI_UNKNOWN] = SDLK_LALT;
--  keymap[DIKI_ALTGR - DIKI_UNKNOWN] = SDLK_RALT;
-+  keymap[DIKI_ALT_R - DIKI_UNKNOWN] = SDLK_RALT;
-   keymap[DIKI_TAB - DIKI_UNKNOWN] = SDLK_TAB;
-   keymap[DIKI_ENTER - DIKI_UNKNOWN] = SDLK_RETURN;
-   keymap[DIKI_SPACE - DIKI_UNKNOWN] = SDLK_SPACE;
diff --git a/meta/recipes-graphics/libsdl/files/extra-keys.patch b/meta/recipes-graphics/libsdl/files/extra-keys.patch
deleted file mode 100644
index 745b04e..0000000
--- a/meta/recipes-graphics/libsdl/files/extra-keys.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-Upstream-Status: Pending
-
-diff -upr --exclude=configure --exclude=Makefile --exclude=Makefile.in libsdl1.2-1.2.4/include/SDL_keysym.h libsdl1.2-1.2.4-arm/include/SDL_keysym.h
---- libsdl1.2-1.2.4/include/SDL_keysym.h	2002-03-06 11:23:01.000000000 +0000
-+++ libsdl1.2-1.2.4-arm/include/SDL_keysym.h	2002-11-08 20:43:09.000000000 +0000
-@@ -286,6 +286,12 @@ typedef enum {
- 	SDLK_EURO		= 321,		/* Some european keyboards */
- 	SDLK_UNDO		= 322,		/* Atari keyboard has Undo */
- 
-+	SDLK_RECORD		= 322,
-+	SDLK_CALENDAR		= 323,
-+	SDLK_TELEPHONE		= 324,
-+	SDLK_MAIL		= 325,
-+	SDLK_START		= 326,
-+
- 	/* Add any other keys here */
- 
- 	SDLK_LAST
-diff -upr --exclude=configure --exclude=Makefile --exclude=Makefile.in libsdl1.2-1.2.4/src/video/x11/SDL_x11events.c libsdl1.2-1.2.4-arm/src/video/x11/SDL_x11events.c
---- libsdl1.2-1.2.4/src/video/x11/SDL_x11events.c	2002-03-06 11:23:08.000000000 +0000
-+++ libsdl1.2-1.2.4-arm/src/video/x11/SDL_x11events.c	2002-11-08 21:01:41.000000000 +0000
-@@ -34,6 +34,7 @@ static char rcsid =
- #include <X11/Xlib.h>
- #include <X11/Xutil.h>
- #include <X11/keysym.h>
-+#include <X11/XF86keysym.h>
- #ifdef __SVR4
- #include <X11/Sunkeysym.h>
- #endif
-@@ -655,6 +656,25 @@ SDL_keysym *X11_TranslateKey(Display *di
- 			case 0xFF:
- 				keysym->sym = MISC_keymap[xsym&0xFF];
- 				break;
-+			case 0x1008ff:
-+				switch (xsym) {
-+				case XF86XK_AudioRecord:
-+					keysym->sym = SDLK_RECORD;
-+					break;
-+				case XF86XK_PowerDown:
-+					keysym->sym = SDLK_POWER;
-+					break;
-+				case XF86XK_Calendar:
-+					keysym->sym = SDLK_CALENDAR;
-+					break;
-+				case XF86XK_Mail:
-+					keysym->sym = SDLK_MAIL;
-+					break;
-+				case XF86XK_Start:
-+					keysym->sym = SDLK_START;
-+					break;
-+				}
-+				break;
- 			default:
- 				fprintf(stderr,
- 					"X11: Unknown xsym, sym = 0x%04x\n",
-- 
1.7.8.rc1



