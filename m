Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBEF3E64AAB
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 13:56:34 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.19946.1733234192412332034
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 05:56:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout04.t-online.de (Postfix) with SMTP id 4640B147C
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Dec 2024 14:56:30 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.235.82]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tITO1-1f3UPZ0; Tue, 3 Dec 2024 14:56:21 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [RFC][oe-core][PATCHv2 1/2] libpam: add more PACKAGECONFIG options
Date: Tue,  3 Dec 2024 14:56:12 +0100
Message-ID: <20241203135613.1955725-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1733234181-EDFEB365-3715D597/0/0 CLEAN NORMAL
X-TOI-MSGID: f9e4fb53-1c0c-4324-9dff-6354518ccb2a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 13:56:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208210

Use ?=3D instead of ??=3D

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-extended/pam/libpam_1.7.0.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pam/libpam_1.7.0.bb b/meta/recipes-ext=
ended/pam/libpam_1.7.0.bb
index ec1c868d21..2c134c1378 100644
--- a/meta/recipes-extended/pam/libpam_1.7.0.bb
+++ b/meta/recipes-extended/pam/libpam_1.7.0.bb
@@ -35,9 +35,14 @@ S =3D "${WORKDIR}/Linux-PAM-${PV}"
=20
 inherit meson gettext pkgconfig systemd ptest github-releases
=20
-PACKAGECONFIG ??=3D ""
+PACKAGECONFIG ?=3D ""
 PACKAGECONFIG[audit] =3D "-Daudit=3Denabled,-Daudit=3Ddisabled,audit,"
+PACKAGECONFIG[examples] =3D "-Dexamples=3Dtrue,-Dexamples=3Dfalse"
+PACKAGECONFIG[openssl] =3D "-Dopenssl=3Denabled,-Dopenssl=3Ddisabled,ope=
nssl"
+PACKAGECONFIG[selinux] =3D "-Dselinux=3Denabled,-Dselinux=3Ddisabled,lib=
selinux"
+PACKAGECONFIG[systemd] =3D "-Dlogind=3Denabled,-Dlogind=3Ddisabled,syste=
md"
 PACKAGECONFIG[userdb] =3D "-Dpam_userdb=3Denabled -Ddb=3Dgdbm,-Dpam_user=
db=3Ddisabled,gdbm,"
+PACKAGECONFIG[xtests] =3D "-Dxtests=3Dtrue,-Dxtests=3Dfalse"
=20
 PACKAGES +=3D "${PN}-runtime ${PN}-xtests"
 FILES:${PN} =3D " \
--=20
2.47.0


