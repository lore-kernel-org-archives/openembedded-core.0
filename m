Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD422CA0ECA
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 11:02:36 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.22322.1694516548458279901
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 04:02:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout02.t-online.de (Postfix) with SMTP id E90D61F998
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 13:02:25 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.234.133]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qg1A0-3GIDiL0; Tue, 12 Sep 2023 13:02:24 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] mesa: upgrade 23.1.3 -> 23.1.7
Date: Tue, 12 Sep 2023 13:02:18 +0200
Message-ID: <20230912110218.103643-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1694516544-727FB980-5896C0DF/0/0 CLEAN NORMAL
X-TOI-MSGID: 162f687b-0dfc-496b-af56-95fb99f341ed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 11:02:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187500

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../mesa/{mesa-gl_23.1.3.bb =3D> mesa-gl_23.1.7.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_23.1.3.bb =3D> mesa_23.1.7.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_23.1.3.bb =3D> mesa-gl_23.1.7=
.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_23.1.3.bb =3D> mesa_23.1.7.bb} (=
100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_23.1.3.bb b/meta/recipes-=
graphics/mesa/mesa-gl_23.1.7.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_23.1.3.bb
rename to meta/recipes-graphics/mesa/mesa-gl_23.1.7.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 83535eb472..a451d06ce9 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -21,7 +21,7 @@ SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-=
${PV}.tar.xz \
            file://0001-intel-Allow-using-intel_clc-from-the-system.patch=
 \
            "
=20
-SRC_URI[sha256sum] =3D "2f6d7381bc10fbd2d6263ad1022785b8b511046c1a904162=
f8f7da18eea8aed9"
+SRC_URI[sha256sum] =3D "409641eadf0ed1c7794797a6f5a0b0195b5580b282166e5e=
c5629c6bcda6acd3"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
=20
diff --git a/meta/recipes-graphics/mesa/mesa_23.1.3.bb b/meta/recipes-gra=
phics/mesa/mesa_23.1.7.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_23.1.3.bb
rename to meta/recipes-graphics/mesa/mesa_23.1.7.bb
--=20
2.41.0


