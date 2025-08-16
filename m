Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 495E6CA0EE6
	for <webhook@archiver.kernel.org>; Sat, 16 Aug 2025 20:24:15 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web10.41275.1755375848818998283
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Aug 2025 13:24:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=G2nDJw3B;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 0A6A3240027
	for <openembedded-core@lists.openembedded.org>; Sat, 16 Aug 2025 22:24:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.com; s=2017;
	t=1755375847; bh=gI1BTCzHST6KhwsOoWQUi+ZBbL3kG+TfCVfJvlXFjC0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=G2nDJw3Bk14GtgfqJuLk6ke/tHUslYu6QehB1+J/q0anFOqlO+oGnzNpRZvbKKDRG
	 UyNit50F3MFNocHwypg24Q2InHI6lhRX17+yEQ4dPxZfWMBng6AlOwicjPMYH/m2G1
	 qEsJ+lsed40E66xAy1yImt+O5SUriG2KGwIgbsdaJ7GpwoPCnnCfFQCgQ5xT+3bGXN
	 vjE5hAIYpNf+WHNAldg1T1vLeAwx+BTGrwxOamFgdx+wGhbSKNtEXdoYpLhpY9Mmgk
	 a0YcCLIBTPy7u3HBSOZuCjLMxtZz2b7wzN/uXHPha3oGGEEuGNrcgd53BaBVhpwYC2
	 M5+VahrPSs3nw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4c49Rp12KCz6tsg;
	Sat, 16 Aug 2025 22:24:05 +0200 (CEST)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] libadwaita: upgrade 1.7.5 -> 1.7.6
Date: Sat, 16 Aug 2025 20:24:06 +0000
Message-Id: <20250816202358.2700355-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Aug 2025 20:24:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221999

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Changes:
- AdwAlertDialog/AdwMessageDialog
  - Emit ::response when cancelled after calling choose()
- AdwDialog
  - Fix widget activation in window-backed dialogs
  - Fix set_focus() in window-backed dialogs
- AdwLayoutSlot
  - Error out if ID is not set
- AdwNavigationView
 - Defer swipe start to ::begin-swipe
- AdwTabOverview
  - Make button hitboxes larger
- AdwWrapLayout
  - Fix a memory leak
- Various fixes

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 .../libadwaita/{libadwaita_1.7.5.bb =3D> libadwaita_1.7.6.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.7.5.bb =3D> libadwait=
a_1.7.6.bb} (88%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.7.5.bb b/meta/rec=
ipes-gnome/libadwaita/libadwaita_1.7.6.bb
similarity index 88%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.7.5.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.7.6.bb
index e8a8d21f02..6e5eca38de 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.7.5.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.7.6.bb
@@ -11,7 +11,7 @@ DEPENDS =3D " \
=20
 inherit gnomebase gobject-introspection gi-docgen vala features_check
=20
-SRC_URI[archive.sha256sum] =3D "c2c1813c967d45c0f49e907f8c26e66f68fe49de=
c6436e2d3349350ac9efbd2e"
+SRC_URI[archive.sha256sum] =3D "5eacc5550f0bdbba6a1568aebf25a3d88f5ee07d=
6b558becc6fd9487579c9a29"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES =3D "opengl"
--=20
2.39.5


