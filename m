Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44CBEE706E5
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 08:02:24 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.11020.1695283339733807965
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 01:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout10.t-online.de (Postfix) with SMTP id 02CD91FD48
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 10:02:17 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.174.95]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qjEdb-2mnaTq0; Thu, 21 Sep 2023 10:02:16 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH 2/2] mesa: Upgrade 23.1.7 -> 23.1.8
Date: Thu, 21 Sep 2023 10:02:11 +0200
Message-ID: <20230921080211.2894163-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230921080211.2894163-1-f_l_k@t-online.de>
References: <20230921080211.2894163-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1695283336-17FFB0D9-7E923A15/0/0 CLEAN NORMAL
X-TOI-MSGID: 628ba6b1-0c7d-41f8-9c00-60db36980c27
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 08:02:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187977

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../mesa/{mesa-gl_23.1.7.bb =3D> mesa-gl_23.1.8.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_23.1.7.bb =3D> mesa_23.1.8.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_23.1.7.bb =3D> mesa-gl_23.1.8=
.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_23.1.7.bb =3D> mesa_23.1.8.bb} (=
100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_23.1.7.bb b/meta/recipes-=
graphics/mesa/mesa-gl_23.1.8.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_23.1.7.bb
rename to meta/recipes-graphics/mesa/mesa-gl_23.1.8.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index a451d06ce9..559d445ae5 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -21,7 +21,7 @@ SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-=
${PV}.tar.xz \
            file://0001-intel-Allow-using-intel_clc-from-the-system.patch=
 \
            "
=20
-SRC_URI[sha256sum] =3D "409641eadf0ed1c7794797a6f5a0b0195b5580b282166e5e=
c5629c6bcda6acd3"
+SRC_URI[sha256sum] =3D "45434ff91a709844130a3174d9c0ef39c6b50725b2bb0c13=
e736f36134db14ad"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
=20
diff --git a/meta/recipes-graphics/mesa/mesa_23.1.7.bb b/meta/recipes-gra=
phics/mesa/mesa_23.1.8.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_23.1.7.bb
rename to meta/recipes-graphics/mesa/mesa_23.1.8.bb
--=20
2.42.0


