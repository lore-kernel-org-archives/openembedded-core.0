Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA801C48BEB
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 16:39:48 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.18745.1708015186439112083
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 08:39:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout10.t-online.de (Postfix) with SMTP id 7EBA01D72B
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:39:44 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.224.161]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1raelx-1Pfqnh0; Thu, 15 Feb 2024 17:39:41 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] mesa: update 24.0.0 -> 24.0.1
Date: Thu, 15 Feb 2024 17:39:52 +0100
Message-ID: <20240215163952.41371-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1708015181-C8FF6DC7-652484E5/0/0 CLEAN NORMAL
X-TOI-MSGID: b8a67d86-56c8-4680-b079-d9bb5e78ff72
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 16:39:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195544

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../mesa/{mesa-gl_24.0.0.bb =3D> mesa-gl_24.0.1.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_24.0.0.bb =3D> mesa_24.0.1.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_24.0.0.bb =3D> mesa-gl_24.0.1=
.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_24.0.0.bb =3D> mesa_24.0.1.bb} (=
100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_24.0.0.bb b/meta/recipes-=
graphics/mesa/mesa-gl_24.0.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_24.0.0.bb
rename to meta/recipes-graphics/mesa/mesa-gl_24.0.1.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index fabc52f0e7..cdac01d3aa 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -20,7 +20,7 @@ SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-=
${PV}.tar.xz \
            file://0001-gallium-Fix-build-with-llvm-17.patch \
 "
=20
-SRC_URI[sha256sum] =3D "dc7e8c077bc5884df95478263b34bdebb7e88e600689cb56=
fb07be2b8c304c36"
+SRC_URI[sha256sum] =3D "f387192b08c471c545590dd12230a2a343244804b5fe866f=
ec6aea02eab57613"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
=20
diff --git a/meta/recipes-graphics/mesa/mesa_24.0.0.bb b/meta/recipes-gra=
phics/mesa/mesa_24.0.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_24.0.0.bb
rename to meta/recipes-graphics/mesa/mesa_24.0.1.bb
--=20
2.43.0


