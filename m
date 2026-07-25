Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE11C531C9
	for <webhook@archiver.kernel.org>; Sat, 25 Jul 2026 08:46:26 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36508.1784969180205127968
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jul 2026 01:46:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=k2P96us+;
 spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout05.t-online.de (Postfix) with SMTP id F1A0CF4C
	for <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2026 10:46:17 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.160.57]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wnY1L-4ZTlxp0; Sat, 25 Jul 2026 10:46:11 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv2] appstream: update 1.1.3 -> 1.1.5
Date: Sat, 25 Jul 2026 10:46:07 +0200
Message-ID: <20260725084607.35983-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1784969171-777FDA0E-439CE176/0/0 CLEAN NORMAL
X-TOI-MSGID: 5a3dbebd-b99c-4c6b-8d9d-a98fdca408b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1784969177; i=f_l_k@t-online.de;
	bh=ERqd8Fa0bisIbHpEjkA0AAPVqIZ1en6ZfYztDBKsPKs=;
	h=From:To:Subject:Date;
	b=k2P96us+sqvKNtnkMCKGFczVJdiFeF+e7eUBDXWhbQFO2bSpcEOJOfWKklLpu5kK6
	 JqB7MVfP0LfDWlY/ytYHj3UCsr93STJt2ODPbM9s0JLHvtOX6EdKEjeNamRDcQwTlE
	 IvS44aCt8dsXdYPLceFWSDdIatZT51FGb9uNTQ/HFEQeNNh+mb+3EgUWyHJCAkxPG6
	 LZY9UNzRjCi1ZIeDSRqT9mukUnqGnHjbxuUVrzAEFbWnF2yIirLZakmGqBCJQ3eONt
	 kEEP6HAzeq8aclUNlpXUrudpO4Pm/ONjVsF0hFVJeefn68/yh5DBqNExLhvUl0MVss
	 PsTSJgLUM0fIw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2026 08:46:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241969

- add wayland dependency to fix:

| Run-time dependency wayland-client found: NO  (tried pkg-config and cma=
ke)
|
| ../sources/AppStream-1.1.5/meson.build:210:25: ERROR: Dependency "wayla=
nd-client" not found (tried pkg-config and cmake)

- add it conditionally to allow builds without wayland

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../appstream/{appstream_1.1.3.bb =3D> appstream_1.1.5.bb}     | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-support/appstream/{appstream_1.1.3.bb =3D> appstream=
_1.1.5.bb} (89%)

diff --git a/meta/recipes-support/appstream/appstream_1.1.3.bb b/meta/rec=
ipes-support/appstream/appstream_1.1.5.bb
similarity index 89%
rename from meta/recipes-support/appstream/appstream_1.1.3.bb
rename to meta/recipes-support/appstream/appstream_1.1.5.bb
index 06e4f7940a..e33359e5a1 100644
--- a/meta/recipes-support/appstream/appstream_1.1.3.bb
+++ b/meta/recipes-support/appstream/appstream_1.1.5.bb
@@ -24,17 +24,18 @@ SRC_URI =3D " \
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
-PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}=
"
+PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayla=
nd', d)}"
 PACKAGECONFIG:append:class-target =3D " bash-completion"
=20
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue,-Dsystemd=3Dfalse,systemd"
 PACKAGECONFIG[stemming] =3D "-Dstemming=3Dtrue,-Dstemming=3Dfalse,libste=
mmer"
 PACKAGECONFIG[qt6] =3D "-Dqt=3Dtrue,-Dqt=3Dfalse,qtbase"
 PACKAGECONFIG[bash-completion] =3D "-Dbash-completion=3Dtrue,-Dbash-comp=
letion=3Dfalse"
+PACKAGECONFIG[wayland] =3D "-Ddisplay-detection=3Dwayland,-Ddisplay-dete=
ction=3Dnone,wayland"
=20
 FILES:${PN} +=3D "${datadir}"
=20
--=20
2.55.0


