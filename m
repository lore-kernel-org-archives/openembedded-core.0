Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E7AC531C9
	for <webhook@archiver.kernel.org>; Sat, 25 Jul 2026 08:27:26 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36244.1784968040588879619
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jul 2026 01:27:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=J3QII4IS;
 spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout08.t-online.de (Postfix) with SMTP id 35985EF0D
	for <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2026 10:27:18 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.160.57]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wnXj4-4Jxssz0; Sat, 25 Jul 2026 10:27:18 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] appstream: update 1.1.3 -> 1.1.5
Date: Sat, 25 Jul 2026 10:27:12 +0200
Message-ID: <20260725082712.15593-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1784968038-9D7F9A71-53E3A3E5/0/0 CLEAN NORMAL
X-TOI-MSGID: b704bfd0-8293-4329-8a67-f0fc6f331356
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1784968038; i=f_l_k@t-online.de;
	bh=WILSttyDn6ftfWOFPfIJCFy/MBgViZNyjpT93SWXanw=;
	h=From:To:Subject:Date;
	b=J3QII4ISnGIgZU0OkMgJ6o/b364RnCoTaB+DBn35A2ESKxDvcsYjnRI1C74c4cPij
	 ZHHC1ehPBjQWmEdls6whkQXXjJfGFyc3nk3pBCFj3f7fZu3tAbnvIlbbcneYMXRSTH
	 1RVOiDgWfUKIK+wXlMb1scl3zgy4jq93TdOwMzySPeB75GWPwsR6itjsb5avq97hma
	 o8eiWuE0TYOHn/lygkAzqzO+oWCeuEZBJ4tcNstO6xdpo8jRvd5k7QRYumsOi54x2A
	 T/xiG/CaBZFUBocs+DV+dZOkk8aF6/x4kNRAGINlu4saL3slLlYuCydPwMxO1RLA3W
	 Y/o1oIAO88kIw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2026 08:27:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241968

- add wayland dependency to fix:

| Run-time dependency wayland-client found: NO  (tried pkg-config and cma=
ke)
|
| ../sources/AppStream-1.1.5/meson.build:210:25: ERROR: Dependency "wayla=
nd-client" not found (tried pkg-config and cmake)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../appstream/{appstream_1.1.3.bb =3D> appstream_1.1.5.bb}       | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-support/appstream/{appstream_1.1.3.bb =3D> appstream=
_1.1.5.bb} (94%)

diff --git a/meta/recipes-support/appstream/appstream_1.1.3.bb b/meta/rec=
ipes-support/appstream/appstream_1.1.5.bb
similarity index 94%
rename from meta/recipes-support/appstream/appstream_1.1.3.bb
rename to meta/recipes-support/appstream/appstream_1.1.5.bb
index 06e4f7940a..545c67a557 100644
--- a/meta/recipes-support/appstream/appstream_1.1.3.bb
+++ b/meta/recipes-support/appstream/appstream_1.1.5.bb
@@ -11,6 +11,7 @@ DEPENDS =3D " \
     libfyaml \
     libxml2 \
     libxmlb \
+    wayland \
 "
=20
 inherit meson gobject-introspection gettext gi-docgen pkgconfig vala bas=
h-completion
@@ -24,7 +25,7 @@ SRC_URI =3D " \
 	file://0002-Do-not-build-qt-tests.patch \
 	file://0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch =
\
 "
-SRC_URI[sha256sum] =3D "2624f967068427edc94f3979edae3571bb077063f5bc231f=
737776da527bf467"
+SRC_URI[sha256sum] =3D "fc57337e250b0d27e75ac4216cc69a76d03c54011a5da5c7=
a2c57711a3d0cdf9"
=20
 S =3D "${UNPACKDIR}/AppStream-${PV}"
=20
--=20
2.55.0


