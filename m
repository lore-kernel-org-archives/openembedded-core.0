Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC34E706E7
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 08:02:24 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.11019.1695283337692456994
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 01:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout08.t-online.de (Postfix) with SMTP id CA4F033FC
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 10:02:15 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.174.95]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qjEdb-2mnaTp0; Thu, 21 Sep 2023 10:02:15 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH 1/2] gtk4: Upgrade 4.12.1 -> 4.12.2
Date: Thu, 21 Sep 2023 10:02:10 +0200
Message-ID: <20230921080211.2894163-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1695283335-17FFB0D9-30AD8577/0/0 CLEAN NORMAL
X-TOI-MSGID: 85542208-e88d-4605-bed4-e004a331624e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 08:02:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187976

Overview of Changes in 4.12.2, 20-09-2023
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* GtkTooltip:
 - Don't cross native boundaries when looking for tooltips

* GtkCenterLayout, GtkEntry, GtkSearchEntry:
 - Fix some issues with baseline handling

* GtkSwitch:
 - Respect text direction

* Theme:
 - Use relative font sizes

* GSK:
 - Make repeated gradients match between GL and cairo
 - Make rounded rect shrinking match between Vulkan, GL and cairo
 - Fix parsing of text nodes with color glyphs
 - Restrict an optimization to the cases where it is correct
 - Fix rendering of shadows with opacity

* macOS:
 - Clamp damage regions to the surface size

* Windows:
 - Fix missing minimize and maximize buttons

* Translation updates
 Basque
 Brazilian Portuguese
 Catalan
 Chinese (China)
 Czech
 Danish
 Dutch
 Finnish
 Galician
 German
 Hungarian
 Italian
 Kazakh
 Latvian
 Lithuanian
 Slovenian
 Spanish
 Turkish

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/gtk+/{gtk4_4.12.1.bb =3D> gtk4_4.12.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.12.1.bb =3D> gtk4_4.12.2.bb} (98%=
)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.12.2.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.12.1.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.12.2.bb
index aa7115b11e..8043ae6dc5 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.12.2.bb
@@ -37,7 +37,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX =3D "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.=
xz"
=20
 SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-$=
{PV}.tar.xz"
-SRC_URI[sha256sum] =3D "b8b61d6cf94fac64bf3a0bfc7af137c9dd2f8360033fdeb0=
cfe9612b77a99a72"
+SRC_URI[sha256sum] =3D "2f4f4d4f92e09f216d386cfdadd54d33d97f23a4555d67b9=
7decfa6f815b6b81"
=20
 S =3D "${WORKDIR}/gtk-${PV}"
=20
--=20
2.42.0


