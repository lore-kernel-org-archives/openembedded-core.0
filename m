Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 82C717CE79
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 18:07:49 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id i20so1973476pfo.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 11:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=0wXgyce9yyL3Q8bsAU0GpklfEI9Wh9hrCLmZC9E2A4M=;
	b=uS3yvCDMoEP86uHd2TvAo/gqPCcQWqscZkwD7QgmrK+fZrFNqUaEMgCNZqMVtCjL2Y
	IlYmjCDNu0qdKxGt9kZ5NxNUPR8/SDLx2PKP0zI1z6oWQDEigiXCyvzXUAMxlHVHTWes
	OwIQvVu1j1VGK2ubjoTCF0oj3G7y0qrPjJkTTibdspLPB+tskssofs48SwpkpZ1xgt5q
	WAonhgFN3h1zSokvDtYL78LCs/qcsIb5prMtBvHx555hooSGIlW+H/NQuXWcV06+0PFp
	xckvJHcPAK8MvKUvWBnSrKfPtN1XSD6UqFDj0/YV3Ve9E0M4V4xZ/3DDZQXPbQEbLOqu
	6fKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=0wXgyce9yyL3Q8bsAU0GpklfEI9Wh9hrCLmZC9E2A4M=;
	b=t1QWjjSaBxHbNkJbAgvoXTEcmNS9p+LQDGONVKKx0tApqLr32mj5vxVG0wuMZ4zZpZ
	veNUQR9cOuYpliKxMUIT4hE/uhGOznYbBFQJP5Ig7umzxNkaPETWyvqoXUzZdGyHhEPJ
	XgXz5NF3+uB4XpZeu4KB9qykX5S3ZaYC6NbVhHef3lpz2Ln7ZuZWzoEUMlpu/OQGQwdf
	abhIvDihEvv4HYKAahChVe202mt1f+aFyBR8Sv9SsmeM3Kgc9C+C+Fjxx/s+ZJlqz/EK
	/R36IwPqKYipZO1BrvtO87VtBVOkMBnU+x4CAWaOnFdia9rMqWfNJRskfh44jd0+hkIC
	NMWw==
X-Gm-Message-State: APjAAAWtPRabMvhLGJgymMkLsOKQCjo0zNlzJ1Gg/B3wk2xbTjoChtbg
	pIieQoWj2yNnIVK+bCB46eaAaHuP
X-Google-Smtp-Source: APXvYqz2TlQ2vf83MRytSD5l3VzOvw9G88X5kXFtG/X18rLtpOj0Yrzx9eOAeObToQqVwixctfjS5A==
X-Received: by 2002:a65:64c4:: with SMTP id t4mr26544609pgv.152.1552241270218; 
	Sun, 10 Mar 2019 11:07:50 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:18fc:c150:6496:1a0d])
	by smtp.gmail.com with ESMTPSA id y6sm5999607pfy.87.2019.03.10.11.07.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 Mar 2019 11:07:49 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Mar 2019 11:07:38 -0700
Message-Id: <1552241263-26116-7-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552241263-26116-1-git-send-email-akuster808@gmail.com>
References: <1552241263-26116-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 07/12] xev: update to 1.2.3
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
X-List-Received-Date: Sun, 10 Mar 2019 18:07:49 -0000

refactor diet-x11 patch

LIC_FILES_CHKSUM changed to do merging of copyright/license notices
https://gitlab.freedesktop.org/xorg/app/mkfontscale/commit/8609ad731b9c9c670a815c915055ae416d2396d8

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-graphics/xorg-app/xev/diet-x11.patch  | 79 ++++++++++++----------
 .../xorg-app/{xev_1.2.2.bb => xev_1.2.3.bb}        |  4 +-
 2 files changed, 46 insertions(+), 37 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xev_1.2.2.bb => xev_1.2.3.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-app/xev/diet-x11.patch b/meta/recipes-graphics/xorg-app/xev/diet-x11.patch
index 6130959..b4415e3 100644
--- a/meta/recipes-graphics/xorg-app/xev/diet-x11.patch
+++ b/meta/recipes-graphics/xorg-app/xev/diet-x11.patch
@@ -4,79 +4,88 @@ Upstream-Status: Inappropriate [disable feature]
  xev.c |   16 ++++++++--------
  1 file changed, 8 insertions(+), 8 deletions(-)
 
-Index: xev-1.2.0/xev.c
+Index: xev-1.2.3/xev.c
 ===================================================================
---- xev-1.2.0.orig/xev.c
-+++ xev-1.2.0/xev.c
-@@ -116,7 +116,7 @@ do_KeyPress (XEvent *eventp)
-     nbytes = XLookupString (e, str, 256, &ks, NULL);
+--- xev-1.2.3.orig/xev.c
++++ xev-1.2.3/xev.c
+@@ -125,7 +125,7 @@ do_KeyPress(XEvent *eventp)
+     nbytes = XLookupString(e, str, 256, &ks, NULL);
  
      /* not supposed to call XmbLookupString on a key release event */
 -    if (e->type == KeyPress && xic) {
 +    /*if (e->type == KeyPress && xic) {
          do {
-             nmbbytes = XmbLookupString (xic, e, buf, bsize - 1, &ks, &status);
+             nmbbytes = XmbLookupString(xic, e, buf, bsize - 1, &ks, &status);
              buf[nmbbytes] = '\0';
-@@ -126,7 +126,7 @@ do_KeyPress (XEvent *eventp)
-                 buf = realloc (buf, bsize);
+@@ -135,7 +135,7 @@ do_KeyPress(XEvent *eventp)
+                 buf = realloc(buf, bsize);
              }
          } while (status == XBufferOverflow);
 -    }
 +    }*/
  
      if (ks == NoSymbol)
- 	ksname = "NoSymbol";
-@@ -156,7 +156,7 @@ do_KeyPress (XEvent *eventp)
+         ksname = "NoSymbol";
+@@ -168,7 +168,7 @@ do_KeyPress(XEvent *eventp)
      }
  
      /* not supposed to call XmbLookupString on a key release event */
 -    if (e->type == KeyPress && xic) {
-+    /*if (e->type == KeyPress && xic) {
-         printf ("    XmbLookupString gives %d bytes: ", nmbbytes);
++    /* if (e->type == KeyPress && xic) {
+         printf("    XmbLookupString gives %d bytes: ", nmbbytes);
          if (nmbbytes > 0) {
-            dump (buf, nmbbytes);
-@@ -164,7 +164,7 @@ do_KeyPress (XEvent *eventp)
-         } else {
-     	   printf ("\n");
+             dump(buf, nmbbytes);
+@@ -177,7 +177,7 @@ do_KeyPress(XEvent *eventp)
+         else {
+             printf("\n");
          }
 -    }
 +    } */
  
-     printf ("    XFilterEvent returns: %s\n",
- 	    XFilterEvent (eventp, e->window) ? "True" : "False");
-@@ -1015,7 +1015,7 @@ main (int argc, char **argv)
-         fprintf (stderr, "%s:  XSetLocaleModifiers failed\n", ProgramName);
+     printf("    XFilterEvent returns: %s\n",
+            XFilterEvent(eventp, e->window) ? "True" : "False");
+@@ -1141,7 +1141,7 @@ parse_event_mask(const char *s, long eve
+             if (s)
+                 return True;
+         }
+-    }
++	}*/
+ 
+     if (s != NULL)
+         fprintf(stderr, "%s: unrecognized event mask '%s'\n", ProgramName, s);
+@@ -1288,7 +1288,7 @@ main(int argc, char **argv)
+         fprintf(stderr, "%s:  XSetLocaleModifiers failed\n", ProgramName);
      }
  
--    xim = XOpenIM (dpy, NULL, NULL, NULL);
-+    /*xim = XOpenIM (dpy, NULL, NULL, NULL);
+-    xim = XOpenIM(dpy, NULL, NULL, NULL);
++    /*xim = XOpenIM(dpy, NULL, NULL, NULL);
      if (xim == NULL) {
-         fprintf (stderr, "%s:  XOpenIM failed\n", ProgramName);
+         fprintf(stderr, "%s:  XOpenIM failed\n", ProgramName);
      }
-@@ -1042,7 +1042,7 @@ main (int argc, char **argv)
+@@ -1317,7 +1317,7 @@ main(int argc, char **argv)
              }
-             XFree (xim_styles);
+             XFree(xim_styles);
          }
 -    }
-+	}*/
++    }*/
  
-     screen = DefaultScreen (dpy);
+     screen = DefaultScreen(dpy);
  
-@@ -1109,7 +1109,7 @@ main (int argc, char **argv)
- 	printf ("Outer window is 0x%lx, inner window is 0x%lx\n", w, subw);
+@@ -1373,7 +1373,7 @@ main(int argc, char **argv)
+         printf("Outer window is 0x%lx, inner window is 0x%lx\n", w, subw);
      }
  
 -    if (xim && xim_style) {
 +    /*if (xim && xim_style) {
-         xic = XCreateIC (xim,
-                          XNInputStyle, xim_style,
-                          XNClientWindow, w,
-@@ -1119,7 +1119,7 @@ main (int argc, char **argv)
+         xic = XCreateIC(xim,
+                         XNInputStyle, xim_style,
+                         XNClientWindow, w, XNFocusWindow, w, NULL);
+@@ -1381,7 +1381,7 @@ main(int argc, char **argv)
          if (xic == NULL) {
-             fprintf (stderr, "XCreateIC failed\n");
+             fprintf(stderr, "XCreateIC failed\n");
          }
 -    }
 +    }*/
  
-     have_rr = XRRQueryExtension (dpy, &rr_event_base, &rr_error_base);
+     have_rr = XRRQueryExtension(dpy, &rr_event_base, &rr_error_base);
      if (have_rr) {
diff --git a/meta/recipes-graphics/xorg-app/xev_1.2.2.bb b/meta/recipes-graphics/xorg-app/xev_1.2.3.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-app/xev_1.2.2.bb
rename to meta/recipes-graphics/xorg-app/xev_1.2.3.bb
index 0705b7f..6a69e74 100644
--- a/meta/recipes-graphics/xorg-app/xev_1.2.2.bb
+++ b/meta/recipes-graphics/xorg-app/xev_1.2.3.bb
@@ -14,5 +14,5 @@ DEPENDS += "libxrandr xorgproto"
 
 SRC_URI += "file://diet-x11.patch"
 
-SRC_URI[md5sum] = "249bdde90f01c0d861af52dc8fec379e"
-SRC_URI[sha256sum] = "d94ae62a6c1af56c2961d71f5782076ac4116f0fa4e401420ac7e0db33dc314f"
+SRC_URI[md5sum] = "eec82a5d4b599736f0fa637e96136746"
+SRC_URI[sha256sum] = "66bc4f1cfa1946d62612737815c34164e4ce40fcebd2c9e1d7e7a1117ad3ad09"
-- 
2.7.4


