Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF8AC4332F
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 14:50:17 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web08.10372.1653403810112880602
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 07:50:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22,
 mailfrom: f_l_k@t-online.de)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout12.t-online.de (Postfix) with SMTP id 51FA6ADBC
	for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 16:49:35 +0200 (CEST)
Received: from localhost.localdomain ([79.219.234.203]) by fwd89.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1ntVqo-0obY250; Tue, 24 May 2022 16:49:34 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH 1/2] nghttp2: unbreak do_populate_sdk
Date: Tue, 24 May 2022 16:49:23 +0200
Message-Id: <20220524144924.252281-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1653403774-0000F5B3-73BAC358/0/0 CLEAN NORMAL
X-TOI-MSGID: 45c03fab-4624-4ca2-9edd-4892e903aa0b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 May 2022 14:50:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166068

Error:
 Problem 1: package nghttp2-dev-1.47.0-r0.corei7_64 requires nghttp2 =3D =
1.47.0-r0, but none of the providers can be installed
  - conflicting requests
  - nothing provides nghttp2-client >=3D 1.47.0 needed by nghttp2-1.47.0-=
r0.corei7_64
  - nothing provides nghttp2-server >=3D 1.47.0 needed by nghttp2-1.47.0-=
r0.corei7_64

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-support/nghttp2/nghttp2_1.47.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb b/meta/recipe=
s-support/nghttp2/nghttp2_1.47.0.bb
index 58ce08084d..051a6e4ecb 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
@@ -21,7 +21,7 @@ EXTRA_OECMAKE =3D "-DENABLE_EXAMPLES=3DOFF -DENABLE_APP=
=3DOFF -DENABLE_HPACK_TOOLS=3DOFF
=20
 PACKAGES =3D+ "lib${BPN} ${PN}-client ${PN}-proxy ${PN}-server"
=20
-RDEPENDS:${PN} =3D "${PN}-client (>=3D ${PV}) ${PN}-proxy (>=3D ${PV}) $=
{PN}-server (>=3D ${PV})"
+RRECOMMENDS:${PN} =3D "${PN}-client (>=3D ${PV}) ${PN}-proxy (>=3D ${PV}=
) ${PN}-server (>=3D ${PV})"
 RDEPENDS:${PN}:class-native =3D ""
 RDEPENDS:${PN}-proxy =3D "openssl python3-core python3-io python3-shell"
=20
--=20
2.25.1


