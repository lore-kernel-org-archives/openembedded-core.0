Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f42.google.com (mail-pl0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0948460107
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 15:00:40 +0000 (UTC)
Received: by mail-pl0-f42.google.com with SMTP id i5-v6so15485670plt.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2018 08:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=AyDOCwMXq0PS6cXg4kw1gaDch/OC3qZfuYstaOgbVAM=;
	b=RGHtG3Pj95Ej8E0fx+9SjJLmbH6aVtVL328jNmR9Epls7dpxuW68EcRt3DiPkWVcym
	NQdDyAZt6nfq1s91owPh/ewfwDY5ZH0ybB5H79e5sBABTVDOnjdaL4KpmqiUokM06cqG
	tI+TWpl+f6yq+36QgDYRg8nHb2dtXHUJqsyhatKbAxqrGHN/iIVgHZmmHOLT5JQ9fh2u
	/dUHER5EzbmfEN7Bz+yb03E0ZrNo0j/h/WzvQiG0Km43JBOb+jFxElU4G/6MJfacYIyu
	iOeoNBzkej3eUTAjvpX8OZxKnBFRvE0sgXs7EmXRiRwV6nbAT1Me28EBbI4L2CVw4kVt
	R8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=AyDOCwMXq0PS6cXg4kw1gaDch/OC3qZfuYstaOgbVAM=;
	b=ITAfZ89eSgEPT+wnUETnoAUciba4/E0q8mXRDuFTCy0EoLu1qec2t0ZQiUviOwH8I8
	RxYfBNXE4H6TnO6OwCQtvq/xlySrgVf5e4wuC13Knjgal19DVagyB1/pCixPOLAVi416
	d7WWlHs4XxyJOGDBPX0QqI7xKDSPoqzAqqqGcgACzlIPyFzdNSxzJO43z0GzDVnEBigo
	GKMK2ohIW+nSFg5GS3H2yqHHQDQska3pOtAFD7w3GrMHwtm/g7jEzkAstFIAQsCU4Z/G
	Vi6/SqmvXocCb6QpKFYYZpK5XTDyMBeyQc049GauP2ocA6p6Uw5hrm3gyAs1suqn0yU7
	QkIw==
X-Gm-Message-State: ALKqPwf4c5u4oj/oS+VCgfTyexwEDnWDSZHFugcjppB9rWAKqYHaEXSB
	/ToQYAYgcDhexgUfun5NOvBi8A==
X-Google-Smtp-Source: ADUXVKLjZfSqm6A734ift/fZG+nBMUS+lKryHUcTNgKF7QalGUvqfa43Nr4vJD51O9nFzUartr4TkA==
X-Received: by 2002:a17:902:b60c:: with SMTP id
	b12-v6mr11778550pls.44.1527865242298; 
	Fri, 01 Jun 2018 08:00:42 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:cd69:7d4:a4bc:31b4])
	by smtp.gmail.com with ESMTPSA id
	z8-v6sm52371275pgc.13.2018.06.01.08.00.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Jun 2018 08:00:41 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  1 Jun 2018 08:00:39 -0700
Message-Id: <1527865239-8221-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527865239-8221-1-git-send-email-akuster808@gmail.com>
References: <1527865239-8221-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 2/2] xf86-input-mouse: add fix for buld fix do for 1.20 xorg-server update
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
X-List-Received-Date: Fri, 01 Jun 2018 15:00:42 -0000

 ../../xf86-input-mouse-1.9.2/src/mouse.c:824:5: error: implicit declaration of function 'xf86GetOS'; did you mean 'xf86SetDpi'? [-Werror=implicit-function-declaration]
|      xf86GetOS(&osname, NULL, NULL, NULL);
|      ^~~~~~~~~

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0001-Adapt-to-removal-of-xf86GetOS.patch       | 48 ++++++++++++++++++++++
 .../xorg-driver/xf86-input-mouse_1.9.2.bb          |  2 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-mouse/0001-Adapt-to-removal-of-xf86GetOS.patch

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-mouse/0001-Adapt-to-removal-of-xf86GetOS.patch b/meta/recipes-graphics/xorg-driver/xf86-input-mouse/0001-Adapt-to-removal-of-xf86GetOS.patch
new file mode 100644
index 0000000..4a082c0
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-mouse/0001-Adapt-to-removal-of-xf86GetOS.patch
@@ -0,0 +1,48 @@
+From 3c8f243b750a92d5837a449d344ff884dbd02b57 Mon Sep 17 00:00:00 2001
+From: Adam Jackson <ajax@redhat.com>
+Date: Thu, 16 Feb 2017 09:21:21 -0500
+Subject: [PATCH] Adapt to removal of xf86GetOS
+
+Signed-off-by: Adam Jackson <ajax@redhat.com>
+
+Upstream-Status: Backport
+Fixes build issue with updated xorg-server changes.
+
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
+---
+ src/mouse.c | 11 +++++------
+ 1 file changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/src/mouse.c b/src/mouse.c
+index dae98aa..40d97a9 100644
+--- a/src/mouse.c
++++ b/src/mouse.c
+@@ -794,7 +794,6 @@ InitProtocols(void)
+ {
+     int classes;
+     int i;
+-    const char *osname = NULL;
+ 
+     if (osInfo)
+         return TRUE;
+@@ -821,11 +820,11 @@ InitProtocols(void)
+                 mouseProtocols[i].id = PROT_UNSUP;
+ 
+     /* NetBSD uses PROT_BM for "PS/2". */
+-    xf86GetOS(&osname, NULL, NULL, NULL);
+-    if (osname && xf86NameCmp(osname, "netbsd") == 0)
+-        for (i = 0; mouseProtocols[i].name; i++)
+-            if (mouseProtocols[i].id == PROT_PS2)
+-                mouseProtocols[i].id = PROT_BM;
++#if defined(__NetBSD__)
++    for (i = 0; mouseProtocols[i].name; i++)
++        if (mouseProtocols[i].id == PROT_PS2)
++            mouseProtocols[i].id = PROT_BM;
++#endif
+ 
+     return TRUE;
+ }
+-- 
+2.7.4
+
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.2.bb b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.2.bb
index 0750476..8dea384 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.2.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.2.bb
@@ -10,5 +10,7 @@ driver."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=90ea9f90d72b6d9327dede5ffdb2a510"
 
+SRC_URI += "file://0001-Adapt-to-removal-of-xf86GetOS.patch"
+
 SRC_URI[md5sum] = "ce2d679283a22c8e0dccdd9248594845"
 SRC_URI[sha256sum] = "f425d5b05c6ab412a27e0a1106bb83f9e2662b307210abbe48270892387f4b2f"
-- 
2.7.4


