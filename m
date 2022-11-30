Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD970C433FE
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 05:35:20 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.3817.1669786512142255268
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Nov 2022 21:35:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout11.t-online.de (Postfix) with SMTP id 2E959C1F0
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 06:35:10 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.245]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p0FkQ-0QHosE0; Wed, 30 Nov 2022 06:35:06 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCHv8 2/4] sass: import from meta-oe
Date: Wed, 30 Nov 2022 06:34:48 +0100
Message-Id: <20221130053450.95655-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221130053450.95655-1-f_l_k@t-online.de>
References: <20221130053450.95655-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669786506-E77DC07E-8045620E/0/0 CLEAN NORMAL
X-TOI-MSGID: b509580d-62f7-429a-94c9-696c2014cac3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 05:35:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173994

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-support/sass/libsass_git.bb | 14 ++++++++++++++
 meta/recipes-support/sass/sassc_git.bb   | 14 ++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-support/sass/libsass_git.bb
 create mode 100644 meta/recipes-support/sass/sassc_git.bb

diff --git a/meta/recipes-support/sass/libsass_git.bb b/meta/recipes-supp=
ort/sass/libsass_git.bb
new file mode 100644
index 0000000000..4d709fc526
--- /dev/null
+++ b/meta/recipes-support/sass/libsass_git.bb
@@ -0,0 +1,14 @@
+SUMMARY =3D "C/C++ port of the Sass CSS precompiler"
+HOMEPAGE =3D "http://sass-lang.com/libsass"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8f34396ca205f5e119ee77aae91fa=
27d"
+
+inherit autotools
+
+SRC_URI =3D "git://github.com/sass/libsass.git;branch=3Dmaster;protocol=3D=
https"
+SRCREV =3D "f6afdbb9288d20d1257122e71d88e53348a53af3"
+PV =3D "3.6.5"
+
+S =3D "${WORKDIR}/git"
+
+BBCLASSEXTEND =3D "native"
diff --git a/meta/recipes-support/sass/sassc_git.bb b/meta/recipes-suppor=
t/sass/sassc_git.bb
new file mode 100644
index 0000000000..9bb8c76e87
--- /dev/null
+++ b/meta/recipes-support/sass/sassc_git.bb
@@ -0,0 +1,14 @@
+SUMMARY =3D "libsass command line driver "
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2f8a76980411a3f1f1480b141ce06=
744"
+
+DEPENDS =3D "libsass"
+
+inherit autotools pkgconfig
+
+SRC_URI =3D "git://github.com/sass/sassc.git;branch=3Dmaster;protocol=3D=
https"
+SRCREV =3D "66f0ef37e7f0ad3a65d2f481eff09d09408f42d0"
+S =3D "${WORKDIR}/git"
+PV =3D "3.6.2"
+
+BBCLASSEXTEND =3D "native"
--=20
2.34.1


