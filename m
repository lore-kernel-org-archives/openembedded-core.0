Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15228.1794778888492900595
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 13:41:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=RuyiJ4GX;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202611152141261c4298282f000207f2-72j2u1@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202611152141261c4298282f000207f2
        for <openembedded-core@lists.openembedded.org>;
        Sun, 15 Nov 2026 22:41:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=ZaZMieZ3XjvKrDaJPlOu0QwWq5DUAH+TzGz51LIktDI=;
 b=RuyiJ4GXbIh8ZY4SpP62hpg9mubD+cBvAwGlMdPjEl+gmnPdT75rq2qrQTv3mVBJjkRKiJ
 6LsySePYo2b3jxzhsTKLfshiPPUeeGZUBzozKjDnng0F/2YaAp3CyN9qtKk6mf2Xp8joY7OV
 TLARUxY546n8RCbdh6bMYG8Fa+xbDC99O2EHYk3CVWtlg2e9Luk/qvuBRn5hSwQYtxiXKIAS
 3clEMwqZ4co4L03rdFXg1aiaZd0fnseFnkm/DfDCrFArYsS4NWLvdHeZf3BsA71wG2d3SkMY
 +SkcjWbY43PgAlG/liTiAnMJE0vuVpcTdyUK5y4YV15EP1FR8fU+8g5g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [blacksail][PATCH 3/7] libx11: upgrade 1.8.13 -> 1.8.14
Date: Sun, 15 Nov 2026 22:39:28 +0100
Message-ID: <20261115213932.1652076-3-peter.marko@siemens.com>
In-Reply-To: <20261115213932.1652076-1-peter.marko@siemens.com>
References: <20261115213932.1652076-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 21:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250285
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
index d2c5f5f1422..6d358b1f434 100644
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
index c06832e35e3..5e35bda3c59 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.14.bb
@@ -23,7 +23,7 @@ XORG_PN = "libX11"
 
 SRC_URI += "file://disable_tests.patch"
 
-SRC_URI[sha256sum] = "69606f485c2c07c14ef64f75b7bb326d48587af33795d9ab3e607c0b5f94f11c"
+SRC_URI[sha256sum] = "bbc78c46217174655c2b32b138ad119f3ac15f50808b4d0b3a2677a4b1afc950"
 
 inherit gettext
 
