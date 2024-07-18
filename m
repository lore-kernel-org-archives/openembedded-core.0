Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA5FBC3DA5D
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 03:29:47 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.7417.1721273380140618386
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jul 2024 20:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout08.t-online.de (Postfix) with SMTP id 400C511D46
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 05:29:38 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.40.87]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sUHpp-1NxhvF0; Thu, 18 Jul 2024 05:29:37 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] libdrm: update 2.4.120 -> 2.4.122
Date: Thu, 18 Jul 2024 05:30:48 +0200
Message-ID: <20240718033048.51090-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1721273377-ADFF9850-D3BBD3AA/0/0 CLEAN NORMAL
X-TOI-MSGID: 3c3295c5-dadc-440e-ab6e-eb08d9f30b98
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 03:29:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202183

This update is required for wlroots 0.18.0 release

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../drm/{libdrm_2.4.120.bb =3D> libdrm_2.4.122.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.120.bb =3D> libdrm_2.4.122.=
bb} (97%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.120.bb b/meta/recipes-g=
raphics/drm/libdrm_2.4.122.bb
similarity index 97%
rename from meta/recipes-graphics/drm/libdrm_2.4.120.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.122.bb
index 18b3256843..e295f64178 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.120.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.122.bb
@@ -13,7 +13,7 @@ DEPENDS =3D "libpthread-stubs"
 SRC_URI =3D "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
=20
-SRC_URI[sha256sum] =3D "3bf55363f76c7250946441ab51d3a6cc0ae518055c0ff017=
324ab76cdefb327a"
+SRC_URI[sha256sum] =3D "d9f5079b777dffca9300ccc56b10a93588cdfbc9dde2fae1=
11940dfb6292f251"
=20
 inherit meson pkgconfig manpages
=20
--=20
2.45.1


