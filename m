Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1F1EC88E5C
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 05:53:48 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8457.1789538020727480902
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 22:53:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=tVNlzhX/;
 spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout10.t-online.de (Postfix) with SMTP id 5A30E3830B
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 07:53:38 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.32.21]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6iaO-3iV6lW0; Wed, 16 Sep 2026 07:53:36 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH 3/3] adwaita-icon-theme: upgrade 50.0 -> 51.0
Date: Wed, 16 Sep 2026 07:53:25 +0200
Message-ID: <20260916055325.3396270-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916055325.3396270-1-f_l_k@t-online.de>
References: <20260916055325.3396270-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789538016-71FF89F0-23CFAD66/0/0 CLEAN NORMAL
X-TOI-MSGID: b739ffdd-a65a-4aa5-894e-614948f40e47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789538018; i=f_l_k@t-online.de;
	bh=HngF+qn0qjQdIAnyLjzGe5qFVNgUY+mhyvwjSwd0Wao=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=tVNlzhX/7GMG/UGPdHyy+JKybW7uku6LzME/kuRhApayOz24l3vfy15d9CIzbok4B
	 f+aKnGTIKRs2BMJmgxZt94pBVwA2Ho7gBKmMlE71R/dwq0Du9JvySJnAGdh7TU2CAx
	 gfWvWhF3SAXHHbgQv1g9VAX/IT6CxJFC/srgZm3izz27M8q+ezuFEZt23GIq9UmAbv
	 t/kRtgp2/2YjL1pMuDkACs886oE79nzlE3f3hYNMkPuaLok/rwmdnyKXFLKdoSC17k
	 i95sZAHPwGYtzuIsQj61vc17aEHr8nPTClsvC5MNbNtsvs8A22Pno5zf6WAuiJ7XEC
	 bxo5nsblxABag==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 05:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245922

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{adwaita-icon-theme_50.0.bb =3D> adwaita-icon-theme_51.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_50.0.bb =3D> adwaita=
-icon-theme_51.0.bb} (91%)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_50.0.bb b/meta/r=
ecipes-gnome/gnome/adwaita-icon-theme_51.0.bb
similarity index 91%
rename from meta/recipes-gnome/gnome/adwaita-icon-theme_50.0.bb
rename to meta/recipes-gnome/gnome/adwaita-icon-theme_51.0.bb
index b0dc59353d..78dbe000ee 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_50.0.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_51.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc84cac88e46f=
c07647ea07e6c24eeb7c \
=20
 inherit gnomebase allarch gtk-icon-cache
=20
-SRC_URI[archive.sha256sum] =3D "fac6e0401fca714780561a081b8f7e27c3bc1db3=
4ebda4da175081f26b24d460"
+SRC_URI[archive.sha256sum] =3D "ba561cf3c96305a47179fa5605856ad695c9238e=
a07f7093aebd9ba80c4e323b"
=20
 DEPENDS +=3D "librsvg-native"
=20
--=20
2.55.0


