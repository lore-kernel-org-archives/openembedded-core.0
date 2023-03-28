Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F7B9C761A6
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 10:32:45 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.62743.1679999554987920784
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 03:32:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout01.t-online.de (Postfix) with SMTP id D948511471
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 12:32:32 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.35.166]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ph6cx-17U9EQ0; Tue, 28 Mar 2023 12:32:31 +0200
From: Markus Volk <f_L_K@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCHv5 2/8] gtk4: update 4.10.0 -> 4.10.1
Date: Tue, 28 Mar 2023 12:31:38 +0200
Message-Id: <20230328103144.5757-2-f_L_K@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328103144.5757-1-f_L_K@t-online.de>
References: <20230328103144.5757-1-f_L_K@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679999551-8556AC08-8C7CA558/0/0 CLEAN NORMAL
X-TOI-MSGID: 3a3cd19b-9ff3-49f9-96c1-8d756aa8b03a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 10:32:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179221

From: Markus Volk <f_l_k@t-online.de>

Overview of Changes in 4.10.1, 14-03-2023
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* GtkFileChooser
 - Improve search performance
 - Be safe against pathless files
 - Fix memory leaks
 - Only show local files in recent files
 - Show most recent files first
 - Make files non-selectable in selet_folder mode

* GtkListView / GtkColumnView / GtkGridView
 - Fix scrolling problems
 - Support CSS border-spacing

* GtkComboBox
 - Fix a size allocation problem

* gtk
 - Size allocation fixes

* Accessibility
 - Miscellaneous property fixes and improvements

* Wayland
 - Fix an ordering problem in surface disposal

* Windows
 - Fix Visual Studio build with older GLib

* Translation updates
 Basque
 Bulgarian
 Catalan
 Czech
 Danish
 Finnish
 Friulian
 Galician
 Georgian
 Hungarian
 Lithuanian
 Polish
 Portuguese
 Swedish
 Turkish
 Ukrainian

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/gtk+/{gtk4_4.10.0.bb =3D> gtk4_4.10.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.10.0.bb =3D> gtk4_4.10.1.bb} (98%=
)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.10.0.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.10.1.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.10.0.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.10.1.bb
index d58fe149ec..d28630ad0b 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.10.0.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb
@@ -37,7 +37,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX =3D "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.=
xz"
=20
 SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-$=
{PV}.tar.xz"
-SRC_URI[sha256sum] =3D "8dc1e7c3b3a46772f0fa416a8ca3fd21d0d0b3b03fb307d2=
e7327ebee69626e4"
+SRC_URI[sha256sum] =3D "e8fcac04bc7715b9da667c911a5ee8f262e200d1d6a50adf=
23645ca8cfcd0311"
=20
 S =3D "${WORKDIR}/gtk-${PV}"
=20
--=20
2.34.1


