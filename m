Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3729.1793405753647171297
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=ZhGprU6k;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so11378695e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405752; x=1794010552; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=woSSST5LOCghFpNyZ439dxnsEY2dgR2ZdUm9Qe1axn8=;
        b=ZhGprU6kxrC5yATi58cN6U3DeDyNN37Yp2fA8IlAi4ZE+YZz//ThvbDVJvHQUBGd9s
         S43Jysy87JQZf3aXzhJcz+B0RVXoaM5UptJ0ODAdHpQAUluX93PdmgjRZ5EdfbzGC4pf
         rans34hld0IpXEULEWOYvKO4DyQ4Ls1l1qO8ujD4AuMU0BF7zJJJEc/H+3wIKFrbtzzB
         poCO2747yjs6yrmyqwMiDDeMXzHpo3LL6jOJac4RaDhPlimir3ZnWPCbaYBplwAakrMO
         b14WLvlnB4a5PrtBxcgs50J9PLW6HVPBWMUANpjK5qvHrwETZ6gXfbrRTRnXlMte2/6U
         o/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405752; x=1794010552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=woSSST5LOCghFpNyZ439dxnsEY2dgR2ZdUm9Qe1axn8=;
        b=gIJhv6x/2JS7dQLjgWqOUAkYOTroV+S0tNz0PIbprfxp7zaisUtVzPAiy34+4bjFZG
         3iNWQSZ60uM8Dn6i4F5Sp6mGkwVF21wVkLgrWevBGsfaw0pdl6ZMd6Wn/YYzhfPLBi5q
         2YVR8u27bXYSPm5bqeafHcPG7xjWY0eER9MF5Fmn7EtbQW1UN9W44DkHcYh7UvlE1wi5
         fC8jNWd8yWsg2/BmBWMjJ28E+DPJIq0XorfMJK3ThTtxO1Ho+mxnM7gKcmzW0k2IPrRP
         NSb37Q5ENBGL1cVD8uPqz0UZEPViDsX/X5rexGg/FHrGhY9SGmTuwsdp/2QpRwMsQM8u
         i6Hg==
X-Gm-Message-State: AFq9FYKyvlGdlmy0jd0s/8HOAgUJR8IWlJY18t6+BLLE19ZmzIqKMXBF
	hq87gQ0+ub579A/pC4AiQRalDMfzggoU+zovb8+o50LYYz1eWBXZgpa3UWfl2FvHQfgTuh+o/X4
	DlLP5pt8=
X-Gm-Gg: AYBFou3aCOIChQtsPYd9x4YjExJ/SspZYgiuiktqoJ+hUo1fbghIE71GBAG+nUAx3ia
	YrtOJF+9j2Ug+g6QyLKomsEb72DtR0SlyylMYDp1UgDbp/seLVhOKgNSaZ/phq0E0/ZR4sRlXu/
	EOdI5hfbH1fMDD6Ve0GRhzE1udNnYtQf7KOJSXf5nBS5SxDiFUvGwV0XTK4+Tff1HuyB+KnobsX
	tAXTWuRpHSOXQOU5p7sm/f7lCZ1bGSQvxrceHYXQZnoWdASSmZqg3/+/Wi08lHCNnO9MfmQJMPS
	l92N+IKNA+2T3h1FNHM6sY9zvdu0vOUA65mi/5h9qDwWqiOY6RAp3vUfq9G9Tcqk9sX3Daugjis
	iZJm18kApC8WQSIB5PeXnh/6J+HLGN2iywhKJo/2hB/IXOyAN24rx9nBGiuExy8ew57/ls2a0YR
	prWV8Wk2Rh01aonEmrZcYZIitVD65RoN80tXT7llGExj5nJuGY7QyiEuve6+2tG/gkptHLR0NPu
	ZgWOmnIu5qV0+i2WIFW29hOqI12Sqnw+aaOBj5zNJaYQHQg4+NihGvE7yS3qWBdYz2p6ewRJ7xF
	vkcvkceO6FepExffdt7cCFbihgVU95ttTC9yQNKKYcv8V/xVnviReNrr4JdX1XIZQjKPJGer88B
	6xh/wa4FfjfQDyJiBEzICyZbcRag3
X-Received: by 2002:a05:600c:4ece:b0:4a2:40:8d2c with SMTP id 5b1f17b1804b1-4ac17b2c396mr84373325e9.26.1793405751908;
        Fri, 30 Oct 2026 17:15:51 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.15.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:15:51 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/55] glib-2.0: patch CVE-2026-16118
Date: Sat, 31 Oct 2026 01:14:36 +0100
Message-ID: <b395267ba122ae155198cee3fedcab6f75fd2caf.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249090
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../glib-2.0/glib-2.0/CVE-2026-16118.patch    | 48 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-16118.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-16118.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-16118.patch
new file mode 100644
index 00000000000..72a387079e0
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-16118.patch
@@ -0,0 +1,48 @@
+From ca75aff83af9875ea2ad2bfbe48a85dfd99c2ce5 Mon Sep 17 00:00:00 2001
+From: Kashyap Ekbote <kashyap.ekbote@gmail.com>
+Date: Wed, 5 Aug 2026 20:50:10 +0530
+Subject: [PATCH] Fix CVE-2026-16118: heap-buffer-overflow in xdgmimemagic.c
+
+Fix out-of-bounds write in the byte-swap routine of
+_xdg_mime_magic_parse_magic_line(). On little-endian systems, the
+write side of the swap casts the base pointer to a wider type before
+adding the byte offset, causing pointer arithmetic to scale by
+sizeof(type) instead of 1. With value_length=4 and word_size=2, the
+loop writes 2 bytes past the allocated matchlet->value buffer at i=2.
+
+Parenthesize (ptr + i) before the cast so both the read and write
+sides use byte offsets.
+
+Upstream: https://gitlab.freedesktop.org/xdg/xdgmime/-/work_items/41
+
+CVE: CVE-2026-16118
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/ca75aff83af9875ea2ad2bfbe48a85dfd99c2ce5]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gio/xdgmime/xdgmimemagic.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/gio/xdgmime/xdgmimemagic.c b/gio/xdgmime/xdgmimemagic.c
+index 98a1274c8..fe374eb4e 100644
+--- a/gio/xdgmime/xdgmimemagic.c
++++ b/gio/xdgmime/xdgmimemagic.c
+@@ -483,15 +483,15 @@ _xdg_mime_magic_parse_magic_line (FILE              *magic_file,
+ 	  for (i = 0; i < matchlet->value_length; i = i + matchlet->word_size)
+ 	    {
+ 	      if (matchlet->word_size == 2)
+-		*((xdg_uint16_t *) matchlet->value + i) = SWAP_BE16_TO_LE16 (*((xdg_uint16_t *) (matchlet->value + i)));
++		*((xdg_uint16_t *) (matchlet->value + i)) = SWAP_BE16_TO_LE16 (*((xdg_uint16_t *) (matchlet->value + i)));
+ 	      else if (matchlet->word_size == 4)
+-		*((xdg_uint32_t *) matchlet->value + i) = SWAP_BE32_TO_LE32 (*((xdg_uint32_t *) (matchlet->value + i)));
++		*((xdg_uint32_t *) (matchlet->value + i)) = SWAP_BE32_TO_LE32 (*((xdg_uint32_t *) (matchlet->value + i)));
+ 	      if (matchlet->mask)
+ 		{
+ 		  if (matchlet->word_size == 2)
+-		    *((xdg_uint16_t *) matchlet->mask + i) = SWAP_BE16_TO_LE16 (*((xdg_uint16_t *) (matchlet->mask + i)));
++		    *((xdg_uint16_t *) (matchlet->mask + i)) = SWAP_BE16_TO_LE16 (*((xdg_uint16_t *) (matchlet->mask + i)));
+ 		  else if (matchlet->word_size == 4)
+-		    *((xdg_uint32_t *) matchlet->mask + i) = SWAP_BE32_TO_LE32 (*((xdg_uint32_t *) (matchlet->mask + i)));
++		    *((xdg_uint32_t *) (matchlet->mask + i)) = SWAP_BE32_TO_LE32 (*((xdg_uint32_t *) (matchlet->mask + i)));
+ 
+ 		}
+ 	    }
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
index 62f173739cf..c63b276fd6b 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
@@ -59,6 +59,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2026-58015_p3.patch \
            file://CVE-2026-58015_p4.patch \
            file://CVE-2026-15588.patch \
+           file://CVE-2026-16118.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
