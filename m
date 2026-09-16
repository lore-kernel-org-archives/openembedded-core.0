Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD54C88E5C
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 05:54:08 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8490.1789538038687330490
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 22:53:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=QUCaIT+5;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout01.t-online.de (Postfix) with SMTP id 4E4381C5F4
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 07:53:38 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.32.21]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6iaO-3iV6lV0; Wed, 16 Sep 2026 07:53:36 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH 2/3] libadwaita: upgrade 1.9.3 -> 1.10.0
Date: Wed, 16 Sep 2026 07:53:24 +0200
Message-ID: <20260916055325.3396270-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916055325.3396270-1-f_l_k@t-online.de>
References: <20260916055325.3396270-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789538016-717F99F0-97D66B74/0/0 CLEAN NORMAL
X-TOI-MSGID: a75a85a9-2630-4039-8efc-b4b4440a72b3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789538018; i=f_l_k@t-online.de;
	bh=p+vOulhFRhBW5EgDtm1qhO5HQibRcmSSLbvaentZuWE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=QUCaIT+5zZOZTLsRloe+7sJCPvM0UgiltLI63/jRdnJ3N9Tf3En3rx91unxBR/hMl
	 GAe9REeICzgFGvEzciuyQQXyhFglCTPq2cmThFAhiurriUGopWuSp0gk/Xa25lWR/o
	 fJAtMfvCY7pn4Nbbqd+OwanoOrGu/VFl9OGXvgb2onZfLuHa9FAfUrKwgayRediRtW
	 KSQclqQL2JFbWjtYyHwGaKoNWRioqFnL58X1Krs257r3JHl5TY1Co6h5QYZZdEV6x5
	 1m2CPTNROMywmyT4AXqCJWcDQ3h9/QUnN1neXAbAYlcQIaIZzzfGugsuRS2tPg9Tav
	 K0DZYwVRNMJug==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 05:54:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245923

Needs gtk4 >=3D 4.23.1 and glib-2.0 >=3D 2.89.3.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libadwaita/{libadwaita_1.9.3.bb =3D> libadwaita_1.10.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.9.3.bb =3D> libadwait=
a_1.10.0.bb} (89%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.9.3.bb b/meta/rec=
ipes-gnome/libadwaita/libadwaita_1.10.0.bb
similarity index 89%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.9.3.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.10.0.bb
index 4752147402..21c0395b84 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.9.3.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.10.0.bb
@@ -12,7 +12,7 @@ DEPENDS =3D " \
=20
 inherit gnomebase gobject-introspection gi-docgen vala features_check
=20
-SRC_URI[archive.sha256sum] =3D "fc59b37028fe0126308e7b805d2f6e4e80227080=
a1797715e5e6286b8111e723"
+SRC_URI[archive.sha256sum] =3D "b1bf56239269d101a6391ad4553c910eff9cc617=
0b803916405477ef60a66c84"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES =3D "opengl"
--=20
2.55.0


