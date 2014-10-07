Return-Path: <o.mandel@menlosystems.com>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 05154714AE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Oct 2014 16:44:12 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3jC4JY0sKVz3hjDh;
	Tue,  7 Oct 2014 18:44:12 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3jC4JX3vLfzvh26;
	Tue,  7 Oct 2014 18:44:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id bGwYUhkJ1aDw; Tue,  7 Oct 2014 18:44:11 +0200 (CEST)
X-Auth-Info: rjJ98MwTydKSZqG9RyLSetrIGzNGC8r4yjiTIhcdq33EA2RI6SpJRkzB8PQo/RVZ
Received: from [10.0.0.72] (host-212-18-10-182.customer.m-online.net
	[212.18.10.182])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue,  7 Oct 2014 18:44:11 +0200 (CEST)
Message-ID: <5434185B.7050906@menlosystems.com>
Date: Tue, 07 Oct 2014 18:44:11 +0200
From: Olaf Mandel <o.mandel@menlosystems.com>
Organization: Menlo Systems
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <5433FBD2.9070503@menlosystems.com>
In-Reply-To: <5433FBD2.9070503@menlosystems.com>
X-Enigmail-Version: 1.6
X-Forwarded-Message-Id: <5433FBD2.9070503@menlosystems.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] Make appearance more configurable
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Oct 2014 16:44:15 -0000
X-Groupsio-MsgNum: 58404
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="xnfOMGt4wjRDLvwEl5ONPAXq8trgfOJhL"

--xnfOMGt4wjRDLvwEl5ONPAXq8trgfOJhL
Content-Type: multipart/mixed;
 boundary="------------050608090806070203090105"

--------------050608090806070203090105
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



--------------050608090806070203090105
Content-Type: text/plain; charset=windows-1252;
 name="0002-Make-appearance-more-configurable.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="0002-Make-appearance-more-configurable.patch"

From ca876147d839a33fb1a397cda682d307554cb1d7 Mon Sep 17 00:00:00 2001
From: Olaf Mandel <o.mandel@menlosystems.com>
Date: Tue, 7 Oct 2014 15:43:20 +0200
Subject: [PATCH 2/2] Make appearance more configurable

 * Allow not showing the startup message
 * Make the screen-split (between image and progress bar)
   configurable
 * Allow for fullscreen image (overlaid by progress bar)

Signed-off-by: Olaf Mandel <o.mandel@menlosystems.com>
---
 ChangeLog        |    9 +++++++++
 Makefile.am      |    2 +-
 psplash-config.h |   34 ++++++++++++++++++++++++++++++++++
 psplash.c        |   28 +++++++++++++++++++++-------
 psplash.h        |    1 -
 5 files changed, 65 insertions(+), 9 deletions(-)
 create mode 100644 psplash-config.h

diff --git a/ChangeLog b/ChangeLog
index f4fd0ec..42163db 100644
--- a/ChangeLog
+++ b/ChangeLog
@@ -5,6 +5,15 @@
 	* psplash.c:
 	Images: handle rowstride !=3D width*bytes_per_pixel
=20
+	* psplash-config.h:
+	* psplash.c:
+	* psplash.h:
+	Make appearance more configurable:
+	  - Allow not showing the startup message
+	  - Make the screen-split (between image and progress bar)
+	    configurable
+	  - Allow for fullscreen image (overlaid by progress bar)
+
 2009-05-28  Richard Purdie <rpurdie@linux.intel.com>
=20
 	* psplash-fb.c:
diff --git a/Makefile.am b/Makefile.am
index c90ebfa..a14152a 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -4,7 +4,7 @@ AM_CFLAGS =3D $(GCC_FLAGS) -D_GNU_SOURCE
=20
 psplash_SOURCES =3D psplash.c psplash.h psplash-fb.c psplash-fb.h \
                   psplash-console.c psplash-console.h           \
-		  psplash-colors.h				\
+		  psplash-colors.h psplash-config.h		\
 		  psplash-poky-img.h psplash-bar-img.h radeon-font.h
=20
 psplash_write_SOURCES =3D psplash-write.c psplash.h
diff --git a/psplash-config.h b/psplash-config.h
new file mode 100644
index 0000000..82bb76d
--- /dev/null
+++ b/psplash-config.h
@@ -0,0 +1,34 @@
+/*
+ *  pslash - a lightweight framebuffer splashscreen for embedded devices.
+ *
+ *  Copyright (c) 2014 MenloSystems GmbH
+ *  Author: Olaf Mandel <o.mandel@menlosystems.com>
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2, or (at your option)
+ *  any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ */
+
+#ifndef _HAVE_PSPLASH_CONFIG_H
+#define _HAVE_PSPLASH_CONFIG_H
+
+/* Text to output on program start; if undefined, output nothing */
+#define PSPLASH_STARTUP_MSG ""
+
+/* Bool indicating if the image is fullscreen, as opposed to split screen =
*/
+#define PSPLASH_IMG_FULLSCREEN 0
+
+/* Position of the image split from top edge, numerator of fraction */
+#define PSPLASH_IMG_SPLIT_NUMERATOR 5
+
+/* Position of the image split from top edge, denominator of fraction */
+#define PSPLASH_IMG_SPLIT_DENOMINATOR 6
+
+#endif
diff --git a/psplash.c b/psplash.c
index 543f67e..22af68d 100644
--- a/psplash.c
+++ b/psplash.c
@@ -19,11 +19,18 @@
  */
=20
 #include "psplash.h"
+#include "psplash-config.h"
+#include "psplash-colors.h"
 #include "psplash-poky-img.h"
 #include "psplash-bar-img.h"
 #include "radeon-font.h"
=20
-#define MSG ""
+#define SPLIT_LINE_POS(fb)                                  \
+	(  (fb)->height                                     \
+	 - ((  PSPLASH_IMG_SPLIT_DENOMINATOR                \
+	     - PSPLASH_IMG_SPLIT_NUMERATOR)                 \
+	    * (fb)->height / PSPLASH_IMG_SPLIT_DENOMINATOR) \
+	)
=20
 void
 psplash_exit (int signum)
@@ -46,14 +53,14 @@ psplash_draw_msg (PSplashFB *fb, const char *msg)
=20
   psplash_fb_draw_rect (fb,=20
 			0,=20
-			fb->height - (fb->height/6) - h,=20
+			SPLIT_LINE_POS(fb) - h,=20
 			fb->width,
 			h,
 			PSPLASH_BACKGROUND_COLOR);
=20
   psplash_fb_draw_text (fb,
 			(fb->width-w)/2,=20
-			fb->height - (fb->height/6) - h,
+			SPLIT_LINE_POS(fb) - h,
 			PSPLASH_TEXT_COLOR,
 			&radeon_font,
 			msg);
@@ -66,7 +73,7 @@ psplash_draw_progress (PSplashFB *fb, int value)
=20
   /* 4 pix border */
   x      =3D ((fb->width  - BAR_IMG_WIDTH)/2) + 4 ;
-  y      =3D fb->height - (fb->height/6) + 4;
+  y      =3D SPLIT_LINE_POS(fb) + 4;
   width  =3D BAR_IMG_WIDTH - 8;=20
   height =3D BAR_IMG_HEIGHT - 8;
=20
@@ -270,7 +277,12 @@ main (int argc, char** argv)
   /* Draw the Poky logo  */
   psplash_fb_draw_image (fb,=20
 			 (fb->width  - POKY_IMG_WIDTH)/2,=20
-			 ((fb->height * 5) / 6 - POKY_IMG_HEIGHT)/2,
+#if PSPLASH_IMG_FULLSCREEN
+			 (fb->height - POKY_IMG_HEIGHT)/2,
+#else
+			 (fb->height * PSPLASH_IMG_SPLIT_NUMERATOR
+			  / PSPLASH_IMG_SPLIT_DENOMINATOR - POKY_IMG_HEIGHT)/2,
+#endif
 			 POKY_IMG_WIDTH,
 			 POKY_IMG_HEIGHT,
 			 POKY_IMG_BYTES_PER_PIXEL,
@@ -280,7 +292,7 @@ main (int argc, char** argv)
   /* Draw progress bar border */
   psplash_fb_draw_image (fb,=20
 			 (fb->width  - BAR_IMG_WIDTH)/2,=20
-			 fb->height - (fb->height/6),=20
+			 SPLIT_LINE_POS(fb),
 			 BAR_IMG_WIDTH,
 			 BAR_IMG_HEIGHT,
 			 BAR_IMG_BYTES_PER_PIXEL,
@@ -289,7 +301,9 @@ main (int argc, char** argv)
=20
   psplash_draw_progress (fb, 0);
=20
-  psplash_draw_msg (fb, MSG);
+#ifdef PSPLASH_STARTUP_MSG
+  psplash_draw_msg (fb, PSPLASH_STARTUP_MSG);
+#endif
=20
   psplash_main (fb, pipe_fd, 0);
=20
diff --git a/psplash.h b/psplash.h
index f78c117..22d73a3 100644
--- a/psplash.h
+++ b/psplash.h
@@ -83,6 +83,5 @@ PSplashFont;
=20
 #include "psplash-fb.h"
 #include "psplash-console.h"
-#include "psplash-colors.h"
=20
 #endif
--=20
1.7.10.4



--------------050608090806070203090105--

--xnfOMGt4wjRDLvwEl5ONPAXq8trgfOJhL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (MingW32)

iQEcBAEBAgAGBQJUNBhbAAoJEFS9nbRiUh3/7FMIAJnxGMgmPqVXIldsAk6SZeiq
9mGRheKoCdU1c4hfIhEQPgbtOvXTB6NogvHVC06cEsrYMfEJJZ+KzDY+WkDMzMKD
Ak9xppiv645PCdoKkbhaCk3tl1QVHUBEfOXpntCSLURxdWqPjVxvgTMRvqdhCw/z
U7pwcC6CziG2Ird2IwrvyLjZTOMZLENlnG2Rvr0AOCviSVpjV8yWpC+LRFX0A0L1
26MatRf5mHE/8maA1v2Bq3ixlO/RSp3UrejvJVQfEjzd1BeaJDAzf5Pvpl9nbIve
0w4huLKJIJkFW2fiss20/FXpbSdThSTTlUKdMh/Ly6uYP8O0DfXhy7UpXcozC3s=
=kGSo
-----END PGP SIGNATURE-----

--xnfOMGt4wjRDLvwEl5ONPAXq8trgfOJhL--
