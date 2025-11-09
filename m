Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD111CCFA1E
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 15:37:46 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26763.1762702660536426213
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Nov 2025 07:37:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=ID53u1pJ;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 63F64240027
	for <openembedded-core@lists.openembedded.org>; Sun,  9 Nov 2025 16:37:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.com; s=2017;
	t=1762702658; bh=IiKV4wEqGSeFwSW/gtbzfakJjOIOtf3G40mhgKVEDT0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=ID53u1pJotO73G27IJpHCsWDcvONeaQhcH3w21c0z2eAwcAg8cUyT8zcWP/1kA5t0
	 FmNZJHe00PRiggAog9ID9k0nmCsGx1lM80q5aZvuL2BRylKihLZwCP3DV3Oih8Wh8t
	 T9cKTm1jv2YfgvWVmtUYdQeloQsztdcWQozsMtxf5IxVeBqtm9Q+M/USr3DShHO8cp
	 K19OPJnSV6L9y/gBSt0g7gOgKJed7AZ61d5Gk3h4bBkjWKmrcjChXQ7idBmAvRh7YI
	 9lYCYK62ntRepLgeEcclJvaN2r4rhaSdvF/A3Jv/60VnH1EFnpRGLrPSZaTvwM9J1w
	 I5NOwX6sfoWLQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4d4H413k2cz9rxB;
	Sun,  9 Nov 2025 16:37:37 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>,
	=?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.net>
Subject: [PATCH 2/2] libadwaita: upgrade 1.7.6 -> 1.8.1
Date: Sun, 09 Nov 2025 15:37:37 +0000
Message-Id: <20251109153719.10026-3-simone.p.weiss@posteo.com>
In-Reply-To: <20251109153719.10026-1-simone.p.weiss@posteo.com>
References: <20251109153719.10026-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Nov 2025 15:37:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226094

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Changes: https://gitlab.gnome.org/GNOME/libadwaita/-/compare/1.8.1...1.7.=
6

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.net>
---
 .../libadwaita/{libadwaita_1.7.6.bb =3D> libadwaita_1.8.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.7.6.bb =3D> libadwait=
a_1.8.1.bb} (88%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.7.6.bb b/meta/rec=
ipes-gnome/libadwaita/libadwaita_1.8.1.bb
similarity index 88%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.7.6.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.8.1.bb
index 6e5eca38de..16ef1db38f 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.7.6.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.8.1.bb
@@ -11,7 +11,7 @@ DEPENDS =3D " \
=20
 inherit gnomebase gobject-introspection gi-docgen vala features_check
=20
-SRC_URI[archive.sha256sum] =3D "5eacc5550f0bdbba6a1568aebf25a3d88f5ee07d=
6b558becc6fd9487579c9a29"
+SRC_URI[archive.sha256sum] =3D "8b1d4d5f89373a5b6eea8d93ecdaee34cd26ad27=
a4dd396c06f5d9929fb313bc"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES =3D "opengl"
--=20
2.39.5


