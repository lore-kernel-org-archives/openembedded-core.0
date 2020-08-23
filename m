Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.181514.1598214094873990240
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uY/G7cEx;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id o23so9322344ejr.1
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L3Sz13C7t/rh7TN8DJL3ELSMIm8RV/T5jdtqKO7a6t8=;
        b=uY/G7cExZHBb4WV7LYRdfuEHg2KTr89gE9WIHaYd6q83U4kEDUbhmSO91vlMIm3oiZ
         cNbDz+PUMOWsGAheFLuKIzWXrzU8PRzgrLuK4U1MYc9dGcRdAx187J8l1xxQIoMBdj//
         eihnDR3VLvRJ5pAj1oZtSCoHboMpzF8UdVWIsf2cAtcK44mO8x1+GJzggDZDwa1qyOGN
         UEL1iKfGtYmp5BFrMisiGCH9nESizT7ifA8lwVY2bP2WfLkJsFjbz9e6zy5LzxkcO1re
         eiENzjlN3noPkXFC5odNuT1wBKGw7yTVC6YX2iYjz+DfsQVDGvt0ejeEsO2WLrQ+wBo7
         dOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L3Sz13C7t/rh7TN8DJL3ELSMIm8RV/T5jdtqKO7a6t8=;
        b=ZWm6wsMsxVaygQTLvs+P6iVo0RxQHzqQXMzsV9tX1ePT9iyFVZ2wUZh09DbUFk8krk
         C46ykfCyssuzmrBq+B4Qai08Gu07Nqioj6RBErhoOj3jjY0tgxU7qKwlUU3uuAjT+Xt7
         CEmvkM95WS3k8VRerC40vg4Fxk0BofFN3g5UY9nJZjZawdIwwg80GPo+9JwHZTxbYxHD
         LAeHNQLiUVcbRh3K5qZo0cib5ob+t5YM+AL1+z1alJz355ggMtkj/LdZW/V2/dQs/0vU
         VrBNp/5XQJSbHtkHhI55YTM4dZyYgQTsufjkoc14P4ynWqfZm5Ta2fiDTtwLmnhP+dJz
         EkjA==
X-Gm-Message-State: AOAM530ZVEfgYCQOCwgY+euxRl2HL5R1y2R1io6V5pJpTsxVWaTxxxmc
	NXBGJsU/yeljB1jmcHr7pnBYNrN5JsA=
X-Google-Smtp-Source: ABdhPJzjwDexrp+0rIJ86RYCC9oJGgAP3fo3dyJq/WkNMrv7BqL8YWLs6Zv6xX7FMqZvyZyK3IPKiA==
X-Received: by 2002:a17:906:add7:: with SMTP id lb23mr2806325ejb.335.1598214092979;
        Sun, 23 Aug 2020 13:21:32 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:32 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 30/37] xev: update 1.2.3 -> 1.2.4
Date: Sun, 23 Aug 2020 22:20:24 +0200
Message-Id: <20200823202031.24686-30-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823202031.24686-1-alex.kanavin@gmail.com>
References: <20200823202031.24686-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../xorg-app/xev/diet-x11.patch               | 35 +++++++++++--------
 .../xorg-app/{xev_1.2.3.bb => xev_1.2.4.bb}   |  3 +-
 2 files changed, 21 insertions(+), 17 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xev_1.2.3.bb => xev_1.2.4.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-app/xev/diet-x11.patch b/meta/recipes-graphics/xorg-app/xev/diet-x11.patch
index 53c0ac2e61..361369b291 100644
--- a/meta/recipes-graphics/xorg-app/xev/diet-x11.patch
+++ b/meta/recipes-graphics/xorg-app/xev/diet-x11.patch
@@ -1,14 +1,19 @@
+From b9b2b8d1af283a13cdccea55562cf332de48dcb9 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross@openedhand.com>
+Date: Wed, 28 Mar 2007 16:10:50 +0000
+Subject: [PATCH] Add xev
+
 Upstream-Status: Inappropriate [disable feature]
 
 ---
- xev.c |   16 ++++++++--------
- 1 file changed, 8 insertions(+), 8 deletions(-)
+ xev.c | 64 +----------------------------------------------------------
+ 1 file changed, 1 insertion(+), 63 deletions(-)
 
-Index: xev-1.2.3/xev.c
-===================================================================
---- xev-1.2.3.orig/xev.c
-+++ xev-1.2.3/xev.c
-@@ -125,17 +125,6 @@ do_KeyPress(XEvent *eventp)
+diff --git a/xev.c b/xev.c
+index ea69234..6d5eb30 100644
+--- a/xev.c
++++ b/xev.c
+@@ -175,17 +175,6 @@ do_KeyPress(XEvent *eventp)
      nbytes = XLookupString(e, str, 256, &ks, NULL);
  
      /* not supposed to call XmbLookupString on a key release event */
@@ -26,24 +31,24 @@ Index: xev-1.2.3/xev.c
  
      if (ks == NoSymbol)
          ksname = "NoSymbol";
-@@ -168,16 +157,6 @@ do_KeyPress(XEvent *eventp)
+@@ -220,16 +209,6 @@ do_KeyPress(XEvent *eventp)
      }
  
      /* not supposed to call XmbLookupString on a key release event */
 -    if (e->type == KeyPress && xic) {
--        printf("    XmbLookupString gives %d bytes: ", nmbbytes);
+-        output(Indent, "XmbLookupString gives %d bytes: ", nmbbytes);
 -        if (nmbbytes > 0) {
 -            dump(buf, nmbbytes);
--            printf(" \"%s\"\n", buf);
+-            output(NewLine, " \"%s\"", buf);
 -        }
 -        else {
--            printf("\n");
+-            output_new_line();
 -        }
 -    }
  
-     printf("    XFilterEvent returns: %s\n",
+     output(Indent | NewLine, "XFilterEvent returns: %s",
             XFilterEvent(eventp, e->window) ? "True" : "False");
-@@ -1141,7 +1120,7 @@ parse_event_mask(const char *s, long eve
+@@ -1211,7 +1190,7 @@ parse_event_mask(const char *s, long event_masks[])
              if (s)
                  return True;
          }
@@ -52,7 +57,7 @@ Index: xev-1.2.3/xev.c
  
      if (s != NULL)
          fprintf(stderr, "%s: unrecognized event mask '%s'\n", ProgramName, s);
-@@ -1288,37 +1267,6 @@ main(int argc, char **argv)
+@@ -1361,37 +1340,6 @@ main(int argc, char **argv)
          fprintf(stderr, "%s:  XSetLocaleModifiers failed\n", ProgramName);
      }
  
@@ -90,7 +95,7 @@ Index: xev-1.2.3/xev.c
      screen = DefaultScreen(dpy);
  
      attr.event_mask = event_masks[EVENT_MASK_INDEX_CORE];
-@@ -1373,16 +1321,6 @@ main(int argc, char **argv)
+@@ -1446,16 +1394,6 @@ main(int argc, char **argv)
          printf("Outer window is 0x%lx, inner window is 0x%lx\n", w, subw);
      }
  
diff --git a/meta/recipes-graphics/xorg-app/xev_1.2.3.bb b/meta/recipes-graphics/xorg-app/xev_1.2.4.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-app/xev_1.2.3.bb
rename to meta/recipes-graphics/xorg-app/xev_1.2.4.bb
index 6a69e747a6..9407fa65f1 100644
--- a/meta/recipes-graphics/xorg-app/xev_1.2.3.bb
+++ b/meta/recipes-graphics/xorg-app/xev_1.2.4.bb
@@ -14,5 +14,4 @@ DEPENDS += "libxrandr xorgproto"
 
 SRC_URI += "file://diet-x11.patch"
 
-SRC_URI[md5sum] = "eec82a5d4b599736f0fa637e96136746"
-SRC_URI[sha256sum] = "66bc4f1cfa1946d62612737815c34164e4ce40fcebd2c9e1d7e7a1117ad3ad09"
+SRC_URI[sha256sum] = "d700e08bfe751ed2dbf802baa204b056d0e49348b6eb3c6f9cb035d8ae4885e2"
-- 
2.28.0

