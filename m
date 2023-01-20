Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03848C38141
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:11:30 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.82055.1674238283036518314
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:11:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=2MlsmPRy;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id x4so4594339pfj.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OLoBqYPdwrrGyHorDjb6Dsbh6nV6Gy58nM83//E6f5g=;
        b=2MlsmPRyH8u+NOuVcCxn26lmtgqkpucIwxJ81OgDqW7+Wf3bK2anzosf01VGVNW30x
         NC2kN4m7496oBRkjF6i1wemBDrbgUevzdzyGx4wR0lV7gq+7Xowk2WHVDjpe5pMhEpkG
         vwNVu4XaCeVf9pYeVeTlvibqAWH/JZZbnn0NGDQlUEQTaN/r7vVTRdpiraxwqx+y9jGL
         oaCpfkdB3Y0ZAV4PrlojoGaNM2g5bLfn9rBwkY/x39yF/ccGhQjXShK0vrDfsVdZ4k1l
         dVVoevExJkb2cx8Z7/D8HKRbzdD0BA7OAnoW0k+faCVyhtLOYP2cCai6e9W8am5xNgPL
         b7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OLoBqYPdwrrGyHorDjb6Dsbh6nV6Gy58nM83//E6f5g=;
        b=lHaex5aS9wIS486WggD72z4mp+5tyj5ckRM70MCAJGIf99g7oV24kaKQo3knKA3BUS
         i68URXY2kTfcOuZq1L3rgmujrFXgHiuQHrC90Mqch4kWC0KlsFBUYeEhPzxrLkiy6YKj
         jA6SlLKWsL7ihE+CSNSvjDIzlChEiS8MOySDFQvj2i0tCdE/4Y5n6/VXFbu+6IAb0QlW
         E022n1L7OIRqwJqudDsb9qWc4UEyRbbgYv88yszwNDeCfQ27QZ1yagw4wMQ+1BSYOOIJ
         qt2L2j1FNcbDq4VXvEC2lrIzJTlVxfE4XBSK+oM5wjImAALIG6eUhzFomi68uYpc/iQw
         OU2w==
X-Gm-Message-State: AFqh2koP1tJdWf9aB0MHuvyfEnHwWVx8CxJfELruAF6lNnnGOUPOUt8z
	BwsimmyUoZP52SpcbWheSUvkWCnhEwnKoKbTLpg=
X-Google-Smtp-Source: AMrXdXu1nMfNoplHvA2X1hFOxJKQWgF26L3MyF5vgGd9pDclvIGLK1aTJzc0YPsgtECWOJrYDOU9dQ==
X-Received: by 2002:a05:6a00:70f:b0:581:1f4b:d1e5 with SMTP id 15-20020a056a00070f00b005811f4bd1e5mr16861422pfl.12.1674238282001;
        Fri, 20 Jan 2023 10:11:22 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.11.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:11:21 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 10/41] xserver-xorg: upgrade 21.1.4 -> 21.1.6
Date: Fri, 20 Jan 2023 08:10:27 -1000
Message-Id: <51e6efcc077138bb460d17cf1a00c4eb57b0d8aa.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:11:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176216

From: Alexander Kanavin <alex.kanavin@gmail.com>

Changelog:

https://fossies.org/linux/misc/xorg-server-21.1.6.tar.xz/xorg-server-21.1.6/ChangeLog

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 009e8d6a292690a0c355d12be2368a9677c701f5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...possible-memleaks-in-XkbGetKbdByName.patch | 63 -------------------
 ...ntedString-against-request-length-at.patch | 38 -----------
 ...-xorg_21.1.4.bb => xserver-xorg_21.1.6.bb} |  4 +-
 3 files changed, 1 insertion(+), 104 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-proof-GetCountedString-against-request-length-at.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.4.bb => xserver-xorg_21.1.6.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch
deleted file mode 100644
index 0e61ec5953..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-CVE: CVE-2022-3551
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 18f91b950e22c2a342a4fbc55e9ddf7534a707d2 Mon Sep 17 00:00:00 2001
-From: Peter Hutterer <peter.hutterer@who-t.net>
-Date: Wed, 13 Jul 2022 11:23:09 +1000
-Subject: [PATCH] xkb: fix some possible memleaks in XkbGetKbdByName
-
-GetComponentByName returns an allocated string, so let's free that if we
-fail somewhere.
-
-Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
----
- xkb/xkb.c | 26 ++++++++++++++++++++------
- 1 file changed, 20 insertions(+), 6 deletions(-)
-
-diff --git a/xkb/xkb.c b/xkb/xkb.c
-index 4692895db..b79a269e3 100644
---- a/xkb/xkb.c
-+++ b/xkb/xkb.c
-@@ -5935,18 +5935,32 @@ ProcXkbGetKbdByName(ClientPtr client)
-     xkb = dev->key->xkbInfo->desc;
-     status = Success;
-     str = (unsigned char *) &stuff[1];
--    if (GetComponentSpec(&str, TRUE, &status))  /* keymap, unsupported */
--        return BadMatch;
-+    {
-+        char *keymap = GetComponentSpec(&str, TRUE, &status);  /* keymap, unsupported */
-+        if (keymap) {
-+            free(keymap);
-+            return BadMatch;
-+        }
-+    }
-     names.keycodes = GetComponentSpec(&str, TRUE, &status);
-     names.types = GetComponentSpec(&str, TRUE, &status);
-     names.compat = GetComponentSpec(&str, TRUE, &status);
-     names.symbols = GetComponentSpec(&str, TRUE, &status);
-     names.geometry = GetComponentSpec(&str, TRUE, &status);
--    if (status != Success)
-+    if (status == Success) {
-+        len = str - ((unsigned char *) stuff);
-+        if ((XkbPaddedSize(len) / 4) != stuff->length)
-+            status = BadLength;
-+    }
-+
-+    if (status != Success) {
-+        free(names.keycodes);
-+        free(names.types);
-+        free(names.compat);
-+        free(names.symbols);
-+        free(names.geometry);
-         return status;
--    len = str - ((unsigned char *) stuff);
--    if ((XkbPaddedSize(len) / 4) != stuff->length)
--        return BadLength;
-+    }
- 
-     CHK_MASK_LEGAL(0x01, stuff->want, XkbGBN_AllComponentsMask);
-     CHK_MASK_LEGAL(0x02, stuff->need, XkbGBN_AllComponentsMask);
--- 
-2.34.1
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-proof-GetCountedString-against-request-length-at.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-proof-GetCountedString-against-request-length-at.patch
deleted file mode 100644
index 6f862e82f9..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-proof-GetCountedString-against-request-length-at.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-CVE: CVE-2022-3550
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 11beef0b7f1ed290348e45618e5fa0d2bffcb72e Mon Sep 17 00:00:00 2001
-From: Peter Hutterer <peter.hutterer@who-t.net>
-Date: Tue, 5 Jul 2022 12:06:20 +1000
-Subject: [PATCH] xkb: proof GetCountedString against request length attacks
-
-GetCountedString did a check for the whole string to be within the
-request buffer but not for the initial 2 bytes that contain the length
-field. A swapped client could send a malformed request to trigger a
-swaps() on those bytes, writing into random memory.
-
-Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
----
- xkb/xkb.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/xkb/xkb.c b/xkb/xkb.c
-index f42f59ef3..1841cff26 100644
---- a/xkb/xkb.c
-+++ b/xkb/xkb.c
-@@ -5137,6 +5137,11 @@ _GetCountedString(char **wire_inout, ClientPtr client, char **str)
-     CARD16 len;
- 
-     wire = *wire_inout;
-+
-+    if (client->req_len <
-+        bytes_to_int32(wire + 2 - (char *) client->requestBuffer))
-+        return BadValue;
-+
-     len = *(CARD16 *) wire;
-     if (client->swapped) {
-         swaps(&len);
--- 
-2.34.1
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.6.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.6.bb
index aba09afec3..256903ce5f 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.6.bb
@@ -2,10 +2,8 @@ require xserver-xorg.inc
 
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
-           file://0001-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch \
-           file://0001-xkb-proof-GetCountedString-against-request-length-at.patch \
            "
-SRC_URI[sha256sum] = "5cc4be8ee47edb58d4a90e603a59d56b40291ad38371b0bd2471fc3cbee1c587"
+SRC_URI[sha256sum] = "1eb86ed674d042b6c8b1f9135e59395cbbca35ed551b122f73a7d8bb3bb22484"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.25.1


