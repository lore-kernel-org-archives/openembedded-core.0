Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id C33717C34B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 21:28:53 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id h1so184974pfo.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 14:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=wFK6+8GIKN2EmMSTd9kwUzZ7rj8WlnRjbyV+B2JuM+c=;
	b=dzCjVo+lW8r5g8h05Yb9JEH8M/RhRtLTmx8H91WscdARPfhCxattZji29j4aHoKzTl
	SRAeRFYd7QrnmoxDTDWPKeh55keB4ZgP4oD6FImG0TrDWK4fzkDeOcEO+YI34jOotmL4
	wlcWN2bc55Hvtk029s14AAforHICBArz+eCM8xJsR3oiiwOsj9n64aiGJNxnHh8Le1Ef
	rfXgLMDRXpCTSEqG06MGYega0KOJnmkReTG12bOseG8SK59IiMCt1TgwFHeUVGT4No5P
	h59aroUwb4EmrK9VyvHFNRFngAXUy4fUbd8Z7wIoi1OLjnw0QNrF1ZTXcwp5EkxjJuGk
	yUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=wFK6+8GIKN2EmMSTd9kwUzZ7rj8WlnRjbyV+B2JuM+c=;
	b=fzSMyL/+/Tt3ECOZfY4lKEOrw67yqjYgH8FVaMSz+ZUUT2ZLLj0xgsTPxeaD9QN5e1
	2kD06vPaQoEu2oh0yudMkgVu957ATK6Ou4jcIHZIHR470gnYCoCLj1y+yj4nQG75M9TH
	0x7JHdGyKPALlMQeUpVf6CMnaLNFfg47vbz8u/8rHZ7k3femuR8i8Pp/XYUte9N70QO/
	0zkve6gqNi7g0dQbVKJVOowWi/ALEQ9z/9WCL25tv5ZJLluR56GcZZ23BHQYOOjjEqin
	jpZLk/Zm5IF1w3b3Q2Qk/28RDu4KBN2S+unyQMNIND20t+bG5ybVgTXMxRCbrJBEsyxP
	x1Sw==
X-Gm-Message-State: APjAAAUn/NamACbp0OKY9ZUDAYEfPYtKNezMJbax2IPD9KdtPgAUpLq5
	+Fa5bvOTPM0I3BqaD/Cf7BN333xo
X-Google-Smtp-Source: APXvYqyuektqIAJ2sTKkyjAFhZOwCewhmtoQezPP6DMHMBrHa4K9+0lkQbsN6fN5z8NJ/9gsVYuhPg==
X-Received: by 2002:a65:50cc:: with SMTP id s12mr31499954pgp.130.1552339734679;
	Mon, 11 Mar 2019 14:28:54 -0700 (PDT)
Received: from pahoa2.kama-aina.net (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	k74sm16750633pfb.172.2019.03.11.14.28.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Mar 2019 14:28:54 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2019 14:28:53 -0700
Message-Id: <20190311212853.18354-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [V2][PATCH] xev: update to 1.2.3
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
X-List-Received-Date: Mon, 11 Mar 2019 21:28:55 -0000

refactor diet-x11 patch

LIC_FILES_CHKSUM changed to do merging of copyright/license notices

Signed-off-by: Armin Kuster <akuster808@gmail.com>

V2] Fix musl build fix
---
 .../xorg-app/xev/diet-x11.patch               | 133 +++++++++++-------
 .../xorg-app/{xev_1.2.2.bb => xev_1.2.3.bb}   |   4 +-
 2 files changed, 82 insertions(+), 55 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xev_1.2.2.bb => xev_1.2.3.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-app/xev/diet-x11.patch b/meta/recipes-graphics/xorg-app/xev/diet-x11.patch
index 6130959f86..53c0ac2e61 100644
--- a/meta/recipes-graphics/xorg-app/xev/diet-x11.patch
+++ b/meta/recipes-graphics/xorg-app/xev/diet-x11.patch
@@ -4,79 +4,106 @@ Upstream-Status: Inappropriate [disable feature]
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
+@@ -125,17 +125,6 @@ do_KeyPress(XEvent *eventp)
+     nbytes = XLookupString(e, str, 256, &ks, NULL);
  
      /* not supposed to call XmbLookupString on a key release event */
 -    if (e->type == KeyPress && xic) {
-+    /*if (e->type == KeyPress && xic) {
-         do {
-             nmbbytes = XmbLookupString (xic, e, buf, bsize - 1, &ks, &status);
-             buf[nmbbytes] = '\0';
-@@ -126,7 +126,7 @@ do_KeyPress (XEvent *eventp)
-                 buf = realloc (buf, bsize);
-             }
-         } while (status == XBufferOverflow);
+-        do {
+-            nmbbytes = XmbLookupString(xic, e, buf, bsize - 1, &ks, &status);
+-            buf[nmbbytes] = '\0';
+-
+-            if (status == XBufferOverflow) {
+-                bsize = nmbbytes + 1;
+-                buf = realloc(buf, bsize);
+-            }
+-        } while (status == XBufferOverflow);
 -    }
-+    }*/
  
      if (ks == NoSymbol)
- 	ksname = "NoSymbol";
-@@ -156,7 +156,7 @@ do_KeyPress (XEvent *eventp)
+         ksname = "NoSymbol";
+@@ -168,16 +157,6 @@ do_KeyPress(XEvent *eventp)
      }
  
      /* not supposed to call XmbLookupString on a key release event */
 -    if (e->type == KeyPress && xic) {
-+    /*if (e->type == KeyPress && xic) {
-         printf ("    XmbLookupString gives %d bytes: ", nmbbytes);
-         if (nmbbytes > 0) {
-            dump (buf, nmbbytes);
-@@ -164,7 +164,7 @@ do_KeyPress (XEvent *eventp)
-         } else {
-     	   printf ("\n");
+-        printf("    XmbLookupString gives %d bytes: ", nmbbytes);
+-        if (nmbbytes > 0) {
+-            dump(buf, nmbbytes);
+-            printf(" \"%s\"\n", buf);
+-        }
+-        else {
+-            printf("\n");
+-        }
+-    }
+ 
+     printf("    XFilterEvent returns: %s\n",
+            XFilterEvent(eventp, e->window) ? "True" : "False");
+@@ -1141,7 +1120,7 @@ parse_event_mask(const char *s, long eve
+             if (s)
+                 return True;
          }
 -    }
-+    } */
++	}
  
-     printf ("    XFilterEvent returns: %s\n",
- 	    XFilterEvent (eventp, e->window) ? "True" : "False");
-@@ -1015,7 +1015,7 @@ main (int argc, char **argv)
-         fprintf (stderr, "%s:  XSetLocaleModifiers failed\n", ProgramName);
+     if (s != NULL)
+         fprintf(stderr, "%s: unrecognized event mask '%s'\n", ProgramName, s);
+@@ -1288,37 +1267,6 @@ main(int argc, char **argv)
+         fprintf(stderr, "%s:  XSetLocaleModifiers failed\n", ProgramName);
      }
  
--    xim = XOpenIM (dpy, NULL, NULL, NULL);
-+    /*xim = XOpenIM (dpy, NULL, NULL, NULL);
-     if (xim == NULL) {
-         fprintf (stderr, "%s:  XOpenIM failed\n", ProgramName);
-     }
-@@ -1042,7 +1042,7 @@ main (int argc, char **argv)
-             }
-             XFree (xim_styles);
-         }
+-    xim = XOpenIM(dpy, NULL, NULL, NULL);
+-    if (xim == NULL) {
+-        fprintf(stderr, "%s:  XOpenIM failed\n", ProgramName);
 -    }
-+	}*/
- 
-     screen = DefaultScreen (dpy);
+-
+-    if (xim) {
+-        imvalret = XGetIMValues(xim, XNQueryInputStyle, &xim_styles, NULL);
+-        if (imvalret != NULL || xim_styles == NULL) {
+-            fprintf(stderr, "%s:  input method doesn't support any styles\n",
+-                    ProgramName);
+-        }
+-
+-        if (xim_styles) {
+-            xim_style = 0;
+-            for (i = 0; i < xim_styles->count_styles; i++) {
+-                if (xim_styles->supported_styles[i] ==
+-                    (XIMPreeditNothing | XIMStatusNothing)) {
+-                    xim_style = xim_styles->supported_styles[i];
+-                    break;
+-                }
+-            }
+-
+-            if (xim_style == 0) {
+-                fprintf(stderr,
+-                        "%s: input method doesn't support the style we support\n",
+-                        ProgramName);
+-            }
+-            XFree(xim_styles);
+-        }
+-    }
+-
+     screen = DefaultScreen(dpy);
  
-@@ -1109,7 +1109,7 @@ main (int argc, char **argv)
- 	printf ("Outer window is 0x%lx, inner window is 0x%lx\n", w, subw);
+     attr.event_mask = event_masks[EVENT_MASK_INDEX_CORE];
+@@ -1373,16 +1321,6 @@ main(int argc, char **argv)
+         printf("Outer window is 0x%lx, inner window is 0x%lx\n", w, subw);
      }
  
 -    if (xim && xim_style) {
-+    /*if (xim && xim_style) {
-         xic = XCreateIC (xim,
-                          XNInputStyle, xim_style,
-                          XNClientWindow, w,
-@@ -1119,7 +1119,7 @@ main (int argc, char **argv)
-         if (xic == NULL) {
-             fprintf (stderr, "XCreateIC failed\n");
-         }
+-        xic = XCreateIC(xim,
+-                        XNInputStyle, xim_style,
+-                        XNClientWindow, w, XNFocusWindow, w, NULL);
+-
+-        if (xic == NULL) {
+-            fprintf(stderr, "XCreateIC failed\n");
+-        }
 -    }
-+    }*/
- 
-     have_rr = XRRQueryExtension (dpy, &rr_event_base, &rr_error_base);
+-
+     have_rr = XRRQueryExtension(dpy, &rr_event_base, &rr_error_base);
      if (have_rr) {
+         int rr_major, rr_minor;
diff --git a/meta/recipes-graphics/xorg-app/xev_1.2.2.bb b/meta/recipes-graphics/xorg-app/xev_1.2.3.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-app/xev_1.2.2.bb
rename to meta/recipes-graphics/xorg-app/xev_1.2.3.bb
index 0705b7f7f1..6a69e747a6 100644
--- a/meta/recipes-graphics/xorg-app/xev_1.2.2.bb
+++ b/meta/recipes-graphics/xorg-app/xev_1.2.3.bb
@@ -14,5 +14,5 @@ DEPENDS += "libxrandr xorgproto"
 
 SRC_URI += "file://diet-x11.patch"
 
-SRC_URI[md5sum] = "249bdde90f01c0d861af52dc8fec379e"
-SRC_URI[sha256sum] = "d94ae62a6c1af56c2961d71f5782076ac4116f0fa4e401420ac7e0db33dc314f"
+SRC_URI[md5sum] = "eec82a5d4b599736f0fa637e96136746"
+SRC_URI[sha256sum] = "66bc4f1cfa1946d62612737815c34164e4ce40fcebd2c9e1d7e7a1117ad3ad09"
-- 
2.17.1


