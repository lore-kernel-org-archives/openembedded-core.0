Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15447.1794778957785781760
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 13:42:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=SrfJQr3n;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-2026111521423693f0c24c8800020745-fcgcjh@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 2026111521423693f0c24c8800020745
        for <openembedded-core@lists.openembedded.org>;
        Sun, 15 Nov 2026 22:42:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Pnk2avSwDL6HWxt89cDmloa39wtrx1EqiRKt64pbUPA=;
 b=SrfJQr3n2mFLM6sUkjuzW1KtAbJoD0FFcviWEhSlfkf6zEvEaH032EAEDNl5Tg8aJLzx2V
 MBnk+5eIroW7fAZWUqzAio3kDOspb8lAxTq5pmjwLbmaXRwpEQVdLQLPK6sLW9c2zw4R4Dce
 yt/pSNusLvDgqyy25KjFwNath4RCGRJUucQPGuvEzHtTfI2rUDzC3AmMjSxaOTj9v5DImqPZ
 heoSnwt5lYFwFfg2F9m2LMpjhtalYZGu7Oc83RKfCcTNhpZvH+0D45nU8qOSwcQ34evvHon2
 GVWxQ28cF2v9ZZ5nmYdysd1qBObmUZ7HKCG3nu4adomLEESjopL8AMwQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 3/9] libx11: upgrade 1.8.13 -> 1.8.14
Date: Sun, 15 Nov 2026 22:39:37 +0100
Message-ID: <20261115213944.1653468-3-peter.marko@siemens.com>
In-Reply-To: <20261115213944.1653468-1-peter.marko@siemens.com>
References: <20261115213944.1653468-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 21:42:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250292
Content-Type: text/plain; charset="utf-8"

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

ReleaseNotes: https://gitlab.freedesktop.org/xorg/lib/libx11#release-1814

CVE fixed: CVE-2026-94283, CVE-2026-94284, CVE-2026-94285, CVE-2026-88806

Complete Notes:

ximcp: bound XIM_OPEN_REPLY attribute lengths (CVE-2026-94283) (!310 (merged))
ximcp: bound XIM_REGISTER_TRIGGERKEYS keylist lengths (CVE-2026-94284) (!310 (merged))
lcGenConv: bound byteM_parse_codeset() reads (CVE-2026-94285) (!310 (merged))
xkb: Check the keysym range in _XkbReadKeyActions (CVE-2026-88806) (!309 (closed))
OpenDisplay: avoid NULL dereference in out-of-memory error path (!307 (merged))
XSetFontPath: zero-initialize packed font path buffer (#248 (closed), !306 (merged))
_XSend: treat xcb_writev returning 0 as failure (!305 (merged))
_XSend: discard the output buffer after an I/O error (!305 (merged))
XkbSetIndicatorMap: avoid undefined behavior due to left shift (#246 (closed), !304 (merged))
nls: Add ca_ES.UTF-8@valencia locale (#234 (closed), !303 (merged))
Xutil.h: add include of Xresource.h (#242 (closed), !302 (merged))
xkb: fix incorrect size check when growing doodads in a section (!300 (merged))
XlibInt.c: use correct type for Win32 in SocketBytesReadable() (!299 (merged))
XlibInt.h: prevent Win32 CreateWindow macro from leaking into our code (!299 (merged))

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: d4160aec45136aba65407ce0d8f152c0f3f847db)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch       | 2 +-
 .../xorg-lib/{libx11_1.8.13.bb => libx11_1.8.14.bb}             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.8.13.bb => libx11_1.8.14.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch b/meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch
index d2c5f5f142..6d358b1f43 100644
--- a/meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch
@@ -1,4 +1,4 @@
-From 37debe301336cfb61e7f81e9e47e5e1019177d8c Mon Sep 17 00:00:00 2001
+From 26c415e836439d2212cea437e11cfb6396436fbc Mon Sep 17 00:00:00 2001
 From: Marko Lindqvist <cazfi74@gmail.com>
 Date: Tue, 8 Jan 2013 09:16:37 +0200
 Subject: [PATCH] libx11: disable tests
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb b/meta/recipes-graphics/xorg-lib/libx11_1.8.14.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.8.14.bb
index f5c27e0102..5dc7467145 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.14.bb
@@ -23,7 +23,7 @@ XORG_PN = "libX11"
 
 SRC_URI += "file://disable_tests.patch"
 
-SRC_URI[sha256sum] = "69606f485c2c07c14ef64f75b7bb326d48587af33795d9ab3e607c0b5f94f11c"
+SRC_URI[sha256sum] = "bbc78c46217174655c2b32b138ad119f3ac15f50808b4d0b3a2677a4b1afc950"
 
 inherit gettext
 
