Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f50.google.com (mail-pl0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9484B745D4
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Jul 2018 14:45:39 +0000 (UTC)
Received: by mail-pl0-f50.google.com with SMTP id m16-v6so4874040pls.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Jul 2018 07:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=JxCQW8e3cMbNZzXOTMivUvgNsjwbTkzJx1xU4JKgrak=;
	b=seHV3R8i4FV7ABwoYYMWPooI30Uy09OIszzmDSdmlbrmhJuDrw7v+wTDDlCoTF39E6
	50CfwRTDmxkl+WwF9N0xw/GTLS3xBTIaYSjNfNz35UommWmWkHzmlwMBHRmwBOVcrIFf
	CulugToaW0eows1RZaQlcHLG7CUPIaZggzDb5JfKO42eqE7xeXuei/dLbN48mMdaOsJy
	Dsr87FJL7a3M1G1Nqa06Zx3vJk5oLhRlaTyqyw8mJ2H/wFbzga6p/YWBzIHSIJMZPP/O
	UpP/D7OeO0cEye5HH4kD09mFmfng7fxeuwPkFeGar2L2l299JGGka38hoARaH+JOD0is
	Juog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=JxCQW8e3cMbNZzXOTMivUvgNsjwbTkzJx1xU4JKgrak=;
	b=owbq+TI11dJKuEIRbsgUzTOyixIKpLldHdARBpvslRlpqxFshxRbOyVMSM+RUiP5oi
	VIIvWK+pXOU3WThNjHJiKFFvogjXTX0Y6NU4neY/rqe5zc8griOWbdMkSdnPF9UO7RHA
	2LGaPAVwLxaaqum7ZT9BvfiBRnabMJjF0MP5EIDPWbDB9qUsJNp95+3LasEMLiaEnFcR
	/v4QZrgHvP5+PcF/NRXdI6CUU5+Lr+G2rV6HsYDI2twDNIWhkSacxbyS0tXxvZVDDW3a
	Eofp6wnjJMZ0ulLj4m0MvA0JDMMQP+DbV5GOPmN1aiyGh3sj3mhRuLuXAOM7ZYo4++PT
	f7eg==
X-Gm-Message-State: APt69E1ym+t41sJTGJusvJb1XOyH/VfRXZQuTw7qgKY4QbEFDscsheRW
	+9QTntBlb9QqTwLfCqfkKdA=
X-Google-Smtp-Source: AAOMgpdHoN9jzbDe8/ECEFDYOVmpUIpbzBhKu0WGaopZJE9bC4Ug6P97ksTW3BCuIRLfVDv8ANwT8Q==
X-Received: by 2002:a17:902:988f:: with SMTP id
	s15-v6mr17195393plp.95.1531061140728; 
	Sun, 08 Jul 2018 07:45:40 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:3c1b:9cfb:14ee:ef7a])
	by smtp.gmail.com with ESMTPSA id
	e186-v6sm25076064pfc.13.2018.07.08.07.45.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Jul 2018 07:45:40 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Sun,  8 Jul 2018 07:45:36 -0700
Message-Id: <1531061139-14602-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/4] xf86-input-mouse: update to 1.9.3
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
X-List-Received-Date: Sun, 08 Jul 2018 14:45:39 -0000

drop patch now included in update

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0001-Adapt-to-removal-of-xf86GetOS.patch       | 48 ----------------------
 ...ut-mouse_1.9.2.bb => xf86-input-mouse_1.9.3.bb} |  6 +--
 2 files changed, 2 insertions(+), 52 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-mouse/0001-Adapt-to-removal-of-xf86GetOS.patch
 rename meta/recipes-graphics/xorg-driver/{xf86-input-mouse_1.9.2.bb => xf86-input-mouse_1.9.3.bb} (69%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-mouse/0001-Adapt-to-removal-of-xf86GetOS.patch b/meta/recipes-graphics/xorg-driver/xf86-input-mouse/0001-Adapt-to-removal-of-xf86GetOS.patch
deleted file mode 100644
index 4a082c0..0000000
--- a/meta/recipes-graphics/xorg-driver/xf86-input-mouse/0001-Adapt-to-removal-of-xf86GetOS.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 3c8f243b750a92d5837a449d344ff884dbd02b57 Mon Sep 17 00:00:00 2001
-From: Adam Jackson <ajax@redhat.com>
-Date: Thu, 16 Feb 2017 09:21:21 -0500
-Subject: [PATCH] Adapt to removal of xf86GetOS
-
-Signed-off-by: Adam Jackson <ajax@redhat.com>
-
-Upstream-Status: Backport
-Fixes build issue with updated xorg-server changes.
-
-Signed-off-by: Armin Kuster <akuster808@gmail.com>
-
----
- src/mouse.c | 11 +++++------
- 1 file changed, 5 insertions(+), 6 deletions(-)
-
-diff --git a/src/mouse.c b/src/mouse.c
-index dae98aa..40d97a9 100644
---- a/src/mouse.c
-+++ b/src/mouse.c
-@@ -794,7 +794,6 @@ InitProtocols(void)
- {
-     int classes;
-     int i;
--    const char *osname = NULL;
- 
-     if (osInfo)
-         return TRUE;
-@@ -821,11 +820,11 @@ InitProtocols(void)
-                 mouseProtocols[i].id = PROT_UNSUP;
- 
-     /* NetBSD uses PROT_BM for "PS/2". */
--    xf86GetOS(&osname, NULL, NULL, NULL);
--    if (osname && xf86NameCmp(osname, "netbsd") == 0)
--        for (i = 0; mouseProtocols[i].name; i++)
--            if (mouseProtocols[i].id == PROT_PS2)
--                mouseProtocols[i].id = PROT_BM;
-+#if defined(__NetBSD__)
-+    for (i = 0; mouseProtocols[i].name; i++)
-+        if (mouseProtocols[i].id == PROT_PS2)
-+            mouseProtocols[i].id = PROT_BM;
-+#endif
- 
-     return TRUE;
- }
--- 
-2.7.4
-
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.2.bb b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.3.bb
similarity index 69%
rename from meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.2.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.3.bb
index 8dea384..c38dab5 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.2.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.3.bb
@@ -10,7 +10,5 @@ driver."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=90ea9f90d72b6d9327dede5ffdb2a510"
 
-SRC_URI += "file://0001-Adapt-to-removal-of-xf86GetOS.patch"
-
-SRC_URI[md5sum] = "ce2d679283a22c8e0dccdd9248594845"
-SRC_URI[sha256sum] = "f425d5b05c6ab412a27e0a1106bb83f9e2662b307210abbe48270892387f4b2f"
+SRC_URI[md5sum] = "a2104693bbcfe1413397f7905eecd3dc"
+SRC_URI[sha256sum] = "93ecb350604d05be98b7d4e5db3b8155a44890069a7d8d6b800c0bea79c85cc5"
-- 
2.7.4


