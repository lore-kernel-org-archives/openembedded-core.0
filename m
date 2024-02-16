Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D87C48BEB
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 09:53:09 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.15479.1708077181195819504
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 01:53:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout06.t-online.de (Postfix) with SMTP id 6F1BE24938
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 10:52:59 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.34.102]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rautt-0afpPl0; Fri, 16 Feb 2024 10:52:57 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] libadwaita: update 1.4.2 -> 1.4.3
Date: Fri, 16 Feb 2024 10:53:03 +0100
Message-ID: <20240216095303.2869421-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1708077177-2D7F9C95-66718B3B/0/0 CLEAN NORMAL
X-TOI-MSGID: 5a775f15-4819-4ae8-b5a4-e977537406b9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 09:53:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195743

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 1.4.3
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- AdwAboutWindow
  - Don't pre-select the first section on the Legal page
- AdwHeaderBar
  - Fix visibility after changing :show-back-button
- AdwPreferencesWindow
  - Fix :visible-page and :visible-page-name docs
- AdwViewSwitcherBar
  - Fix a warning when empty
- Translation updates
  - French
  - Greek
  - Norwegian Bokm=C3=A5l

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libadwaita/{libadwaita_1.4.2.bb =3D> libadwaita_1.4.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.4.2.bb =3D> libadwait=
a_1.4.3.bb} (88%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb b/meta/rec=
ipes-gnome/libadwaita/libadwaita_1.4.3.bb
similarity index 88%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.4.3.bb
index edcfba54b6..e3f849ad6a 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.4.3.bb
@@ -11,7 +11,7 @@ DEPENDS =3D " \
=20
 inherit gnomebase gobject-introspection gi-docgen vala features_check
=20
-SRC_URI[archive.sha256sum] =3D "33fa16754e7370c841767298b3ff5f23003ee1d2=
515cc2ff255e65ef3d4e8713"
+SRC_URI[archive.sha256sum] =3D "ae9622222b0eb18e23675655ad2ba01741db4d86=
55a796f4cf077b093e2f5841"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES =3D "opengl"
--=20
2.43.0


