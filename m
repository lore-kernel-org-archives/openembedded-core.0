Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5604.1794387812356130871
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 01:03:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=TvFdyUGA;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so24060855e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 01:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794387810; x=1794992610; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yjAxNga6EO4mmrQl2psT2pClfH4VGNw8u11BFyCc9tc=;
        b=TvFdyUGAZkQPMjuba+8SomR03XbCen5VUDEta4/fqNkq5Jp/YJ9ljc5rhBIyXmD3dj
         NuYPfUu01jCAUinlELesaGhTU+9oOlyvyAuOK3mkU+pJz3aAzagpgiGyARUejfv3xydj
         izqQY+7n8G+VqCnegIn4ojiqJxnrAqzJ9RGUgO7u3OOTLBmdR6inQLwGcr/fJbKQPC+9
         TvBttOEDMDUb0g7mO2358+9aw7hYPl5wBXDrR3z2xNAm4ipXmSUaGVAj8XiIynQot1ID
         Fm3p2IzP5yaov8TQ6eAiy/4T2tyz3Bk99EQsXwyQ5mCQIS4qDBUso5tXEC3PFhVYzKJJ
         CFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387810; x=1794992610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yjAxNga6EO4mmrQl2psT2pClfH4VGNw8u11BFyCc9tc=;
        b=S4Yo+iIq3e/iXyCg1Mfc8NREzU2UgB6CZHG/jzvrz0kh+z2+GNwrqGw27997HQWq37
         VK3kj3J9/O8e0q+l61yZJW97Ck+TSvuPLw7KfsgDThLvVB7cPNps5dQMg+F3JQsURRVi
         3JRk3pdfGDphdk4vFHNnHkhRmhlVREh97Tw0oeyv7z6rP1nnDr1EHgLe14y5CV6NyPEI
         EN62r4WMCqXpzEdc/aOIbRgRhaGqDnAS/guAKg/SXoj9Ex+WZM+GAy/VnxG6xAjm8ZA7
         dq6X7WdSbg5Ic+9voImWCEd2MLNmc9zlSFdwb7mHzPNuKuZ0aMtMgkANpDTXZDswWcxd
         FsPQ==
X-Gm-Message-State: APuU4Z/QdlLHMAgkp6CoQeOxxzqDllzfGjKXZpGXlKiWgXhCjqpTErOv
	Dy7U6V10agZlwypck/UlSJrkeRWRKD83BRAgl5lZAtrFo4yGyr8YywnC/zN02p1STmixMi9kjix
	x1iLZ/z8=
X-Gm-Gg: AYBFou1BtcZjf2if49SAVNJ7sd5BsVDY1FFP1JM6RjQhtbW9VJ9Wxg5t1Bs9M0c8SUN
	CDIIVXRDpPyNP0292vSX1xawvjmYVr7QI2eVf4OphOOix4R4vigY5EQeu9PI2nFKdwBCyFH/0Dp
	76gBdUEdlnYvv/VUkNSUT8x6kT6AmFSOnWpsKnI2679fyu3FkHX4dfhisbF/Jhf9bRtGdC73v9l
	DvMNvIjV0RJ+w/WZyV0I7n+NgjzdAbOwekWWEhYqvWfa1O6uGU/G5bhX7fdZi+CNb8w4gpMs6Vi
	5TKktlsM+zcEjv+EgE675RhK8QuHAZ8pSiTqPOzq3YXjQiIaTb+UKjs9TYGePMhC9NrCI5dtz78
	Lkght4ULI+Gt47b11TZ+YNjfs07sedtcvc/hx1ZGPIHR7gfUJVJpjmgShZR1spTHbGXxdNKQdHY
	oQFR2HvAucIPVVE/fFNj0NhOcp3pPnVBdmNDUd2d3M2iVwJNr4/mxtlGoRZ/rwmmtqc/sjSBN30
	cSr3KK1s5/5PG7IhPXw4oVgQR7pWqlbavWg7//mOYbQbCSJFQJsHJPBG3hvzPwRyFV4n0g5sb/t
	MLyONoJpIpMEzseZDc0v4IfSk2uAJ5fDdA4X34MR/h72Ok18Shpg/sOhsuapno0s8GLrTJnLqQM
	5qlSxpXf52Wi/tyR7toH8MXTlWd6DBsrkEM+DqxfSjU8tPmpLWw==
X-Received: by 2002:a05:600c:4e87:b0:4b2:61e5:b2f4 with SMTP id 5b1f17b1804b1-4ba09358157mr28021885e9.11.1794387810583;
        Wed, 11 Nov 2026 01:03:30 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm147623675e9.9.2026.11.11.01.03.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:03:30 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 15/35] glib-2.0: patch CVE-2026-16118
Date: Wed, 11 Nov 2026 10:02:41 +0100
Message-ID: <d50bf01b08fdc6efddedff671fd4cbb589300c2f.1794387482.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794387482.git.yoann.congal@smile.fr>
References: <cover.1794387482.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:03:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249987
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../glib-2.0/files/CVE-2026-16118.patch       | 48 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib.inc           |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/files/CVE-2026-16118.patch

diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-16118.patch b/meta/recipes-core/glib-2.0/files/CVE-2026-16118.patch
new file mode 100644
index 00000000000..72a387079e0
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/CVE-2026-16118.patch
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
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 7e7725f9bd3..aec875a3dff 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -237,6 +237,7 @@ SRC_URI += "\
            file://skip-timeout.patch \
            file://CVE-2026-58016-1.patch \
            file://CVE-2026-58016-2.patch \
+           file://CVE-2026-16118.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
