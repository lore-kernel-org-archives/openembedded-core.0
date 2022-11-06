Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB541C4332F
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 08:03:09 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web12.14293.1667721780625845816
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 01:03:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout04.t-online.de (Postfix) with SMTP id 4037588B5
	for <openembedded-core@lists.openembedded.org>; Sun,  6 Nov 2022 09:02:58 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.228.48]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oracL-2bdjQf0; Sun, 6 Nov 2022 09:02:57 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH 1/2] epiphany: use libsoup-3.0 by default
Date: Sun,  6 Nov 2022 09:02:48 +0100
Message-Id: <20221106080249.89929-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1667721777-0A697417-98F616C9/0/0 CLEAN NORMAL
X-TOI-MSGID: dba8c1e6-ff75-44bf-8a02-2dff3d7bef87
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 08:03:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172760

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/epiphany/epiphany_42.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/epiphany/epiphany_42.4.bb b/meta/recipes-=
gnome/epiphany/epiphany_42.4.bb
index 9efd2800da..afaaefc46f 100644
--- a/meta/recipes-gnome/epiphany/epiphany_42.4.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_42.4.bb
@@ -30,7 +30,7 @@ SRC_URI =3D "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.tri=
m_version("${PV}", 1)}/${GN
            "
 SRC_URI[archive.sha256sum] =3D "370938ad2920eeb28bc2435944776b7ba55a0e2e=
de65836f79818cfb7e8f0860"
=20
-PACKAGECONFIG_SOUP ?=3D "soup2"
+PACKAGECONFIG_SOUP ?=3D "soup3"
 PACKAGECONFIG ??=3D "${PACKAGECONFIG_SOUP}"
=20
 # Developer mode enables debugging
--=20
2.34.1


