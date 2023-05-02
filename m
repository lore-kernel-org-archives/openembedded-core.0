Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F42C77B7E
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 15:20:28 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.934.1683040821064907390
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 08:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout08.t-online.de (Postfix) with SMTP id 76BAB3855
	for <openembedded-core@lists.openembedded.org>; Tue,  2 May 2023 17:20:19 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.42.41]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ptrne-0KPC1R0; Tue, 2 May 2023 17:20:19 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH 1/2] gtk4: update 4.10.0 -> 4.10.3
Date: Tue,  2 May 2023 17:20:07 +0200
Message-Id: <20230502152008.113566-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683040819-977FDC52-AA4B3BC5/0/0 CLEAN NORMAL
X-TOI-MSGID: a1403996-b2ca-43c9-ae8e-a10c90106695
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 15:20:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180744

Overview of Changes in 4.10.3, 22-04-2023
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Fix a popover positioning regression in 4.10.2

* Fix issues with slow loading files in the file chooser

Overview of Changes in 4.10.2, 21-04-2023
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Fixed issues:
 - Holding control to select multiple files broken in filechooser (#5669)
 - Inspector crash (#5681)
 - Listbase doesn't account for bottom padding in size_allocate_child (#5=
380)
 - Leaking AT contexts (#5690)
 - OpenGL / Windows: Crash when closing gtk4-widget-factory (#5685)
 - GTK apps crash on startup when setting cursor-size to 0 on Wayland (#5=
700)
 - Segmentation fault: gdk_wayland_toplevel_set_startup_id() needs to nul=
l-check
   display->xdg_activation before using it (#5701)
 - Possible use-after-free under gtk_scrolled_window_update_use_indicator=
s() (#5684)
 - Wrong error message in `gtk_init` (#5704)
 - Segfault when scrolling after changing ListView model (#5763)
 - Bluetooth panel from the Settings app: clicking in the "Downloads" lin=
k
   no longer opens Nautilus (#5671)
 - Broadway docs or code is broken (#5662)
 - Disabled GtkPicture's are not properly themed (#5683)
 - Setting CSS padding to a GtkTextView gives the context menu an offset =
(#5695)
 - A11y: the Showing state is used only for windows (#5194)
 - Gtk4 expander: CSS nodes mismatch code vs. documentation (#5723)
 - Invoking gtk inspector on a folder results in a crash (#5729)
 - Double tap requires very precise touch input (#5580)
 - Name autocompletion dropdown in the GTK4 FileChooser's Save dialog get=
s
   stuck, creates artifacts, jumps around (#5743)
 - Links are not opened when xdg-desktop-portal OpenURI is not available =
(#5733)
 - GtkSnapshot generates no nodes appending whitespace-only layouts (#574=
7)

* Translation updates
 British English
 Bulgarian
 Chinese (China)
 French
 Indonesian
 Korean
 Russian
 Serbian
 Slovenian
 Turkish

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
---
 meta/recipes-gnome/gtk+/{gtk4_4.10.0.bb =3D> gtk4_4.10.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.10.0.bb =3D> gtk4_4.10.3.bb} (98%=
)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.10.0.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.10.3.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.10.0.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.10.3.bb
index d58fe149ec..9aa33e6851 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.10.0.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.10.3.bb
@@ -37,7 +37,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX =3D "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.=
xz"
=20
 SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-$=
{PV}.tar.xz"
-SRC_URI[sha256sum] =3D "8dc1e7c3b3a46772f0fa416a8ca3fd21d0d0b3b03fb307d2=
e7327ebee69626e4"
+SRC_URI[sha256sum] =3D "4545441ad79e377eb6e0a705026dc7a46886e46a1b034db4=
0912909da801cea9"
=20
 S =3D "${WORKDIR}/gtk-${PV}"
=20
--=20
2.34.1


