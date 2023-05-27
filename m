Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E6AC77B73
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 13:34:01 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.10287.1685194433576745537
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 May 2023 06:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout02.t-online.de (Postfix) with SMTP id D52B922570
	for <openembedded-core@lists.openembedded.org>; Sat, 27 May 2023 15:33:04 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.35.82]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1q2u2a-2qD35e0; Sat, 27 May 2023 15:33:04 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH 2/4] python3: add libxcrypt-native dependency
Date: Sat, 27 May 2023 15:32:50 +0200
Message-Id: <20230527133252.284132-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230527133252.284132-1-f_l_k@t-online.de>
References: <20230527133252.284132-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1685194384-337FDCD8-D4C79726/0/0 CLEAN NORMAL
X-TOI-MSGID: f78bc49e-cd3a-4e66-a5f4-a76d24ab634d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 May 2023 13:34:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181806

crypt.h is otherwise taken from the host machine

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-devtools/python/python3_3.11.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.11.2.bb b/meta/recipe=
s-devtools/python/python3_3.11.2.bb
index 421a305e22..1ca4ad35be 100644
--- a/meta/recipes-devtools/python/python3_3.11.2.bb
+++ b/meta/recipes-devtools/python/python3_3.11.2.bb
@@ -72,7 +72,7 @@ ALTERNATIVE_LINK_NAME[python3-config] =3D "${bindir}/py=
thon${PYTHON_MAJMIN}-config
 ALTERNATIVE_TARGET[python3-config] =3D "${bindir}/python${PYTHON_MAJMIN}=
-config-${MULTILIB_SUFFIX}"
=20
=20
-DEPENDS =3D "bzip2-replacement-native expat libffi bzip2 openssl sqlite3=
 zlib virtual/libintl xz virtual/crypt util-linux-libuuid libtirpc libnsl=
2 autoconf-archive-native ncurses"
+DEPENDS =3D "bzip2-replacement-native expat libffi bzip2 openssl sqlite3=
 zlib virtual/libintl xz virtual/crypt util-linux-libuuid libtirpc libnsl=
2 autoconf-archive-native ncurses libxcrypt-native"
 DEPENDS:append:class-target =3D " python3-native"
 DEPENDS:append:class-nativesdk =3D " python3-native"
=20
--=20
2.34.1


