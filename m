Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F6DBC77B7C
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 13:33:21 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.10031.1685194392699268001
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 May 2023 06:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout07.t-online.de (Postfix) with SMTP id 27FA61BF12
	for <openembedded-core@lists.openembedded.org>; Sat, 27 May 2023 15:33:11 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.35.82]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1q2u2c-2qD35f0; Sat, 27 May 2023 15:33:06 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH 3/4] ruby: add libxcrypt-native dependency
Date: Sat, 27 May 2023 15:32:51 +0200
Message-Id: <20230527133252.284132-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230527133252.284132-1-f_l_k@t-online.de>
References: <20230527133252.284132-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1685194387-327FBCD8-CB64C325/0/0 CLEAN NORMAL
X-TOI-MSGID: f8f716c7-fdcb-4cc1-9f38-f442fd9bb4db
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 May 2023 13:33:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181804

crypt.h is otherwise taken from the host machine

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-devtools/ruby/ruby_3.2.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/ruby/ruby_3.2.2.bb b/meta/recipes-devt=
ools/ruby/ruby_3.2.2.bb
index 481fe7c23d..d1900bfa4b 100644
--- a/meta/recipes-devtools/ruby/ruby_3.2.2.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.2.2.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5b8c87559868=
796979806100db3f3805 \
                     file://LEGAL;md5=3Dbcd74b47bbaf2051c5e49811a5faa97a =
\
                     "
=20
-DEPENDS =3D "zlib openssl libyaml gdbm readline libffi"
+DEPENDS =3D "zlib openssl libyaml gdbm readline libffi libxcrypt-native"
 DEPENDS:append:class-target =3D " ruby-native"
 DEPENDS:append:class-nativesdk =3D " ruby-native"
=20
--=20
2.34.1


