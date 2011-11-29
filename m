Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVNDC-00025L-OU
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 13:55:02 +0100
Received: by bkbzs2 with SMTP id zs2so9309171bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 04:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=tXN565N+NKMVa1IL1bosiNmYNq2vyTVHWMPFmyYbN/w=;
	b=wmzI/EipLhhgVWesGpNJKS0gQlFyFERXyRRTbF0gprwbw7ZgALl5bv/Xr5j628skmA
	c7cX/pp5hS3rfpAqSKqHU5OLTJvG+FvHgGkhpIVWAY1RXMa4R6rdH8Jje6+RSsmyvtBl
	EaG9wRnu3fiYiiL4dJbVdf+t4KQzSN9AJeZgE=
Received: by 10.204.15.75 with SMTP id j11mr27417926bka.25.1322570903455;
	Tue, 29 Nov 2011 04:48:23 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cc2sm36813196bkb.8.2011.11.29.04.48.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 04:48:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 13:48:10 +0100
Message-Id: <9550d0f84844e9a22bcb999f9d706db50fa66058.1322570605.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <cover.1322570605.git.Martin.Jansa@gmail.com>
References: <cover.1322570605.git.Martin.Jansa@gmail.com>
Subject: [oe-core 1/5] libsdl: drop unused files
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
X-List-Received-Date: Tue, 29 Nov 2011 12:55:02 -0000

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
1.7.8.rc4



