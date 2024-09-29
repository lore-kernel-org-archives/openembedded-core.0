Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72F2CCF6499
	for <webhook@archiver.kernel.org>; Sun, 29 Sep 2024 14:01:52 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.32867.1727618503076596303
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Sep 2024 07:01:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout03.t-online.de (Postfix) with SMTP id 06C1C51533
	for <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 16:01:41 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.236.237]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1suuUW-0wfjzm0; Sun, 29 Sep 2024 16:01:40 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][master][PATCH 2/2] epiphany: update 46.3 -> 47.0
Date: Sun, 29 Sep 2024 16:03:28 +0200
Message-ID: <20240929140328.374391-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240929140328.374391-1-f_l_k@t-online.de>
References: <20240929140328.374391-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1727618500-577FC57C-AE8E7434/0/0 CLEAN NORMAL
X-TOI-MSGID: 76ac14a5-1423-4b98-ae49-c5ff7232fe90
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 14:01:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205056

47.0 - September 12, 2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 * Fix crash when using Ctrl+D or Ctrl+Alt+D (#2435)
 * Fix icon URL used for install web application dialog (#2436)
 * Remove tab overview shortcut in web apps (#2443, Arak)
 * Fix crashes in tab overview mode with no open tabs (#2448)
 * Fix pluralization in privacy report dialog (#2454)
 * Fix bookmark tag widget focus border (!1618, Arak)
 * Revert key event handling changes due to problems with non-Latin keybo=
ard layouts (!1620)

47.rc - August 30, 2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 * Extract .xpi during web app installation (#1818)
 * Show confirmation dialog when deleting web app (#2077, Arak)
 * Allow exporting passwords to CSV and improve CSV import (#2184, Harsha=
vardhan Navalli)
 * Improve count of trackers in privacy report (#2419)
 * Fix crash on close multiple tabs dialog (#2426)
 * Many improvements to bookmarks sidebar and dialog
   (#2406, #2416, #2420, !1589, !1592, !1594, !1595, !1596, !1597,
    !1598, !1599, !1600, !1602, !1605, !1606, !1607, !1608,
    Arak, Automeris naranja, Hari Rana)

47.beta - August 2, 2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 * Add autofill support (#199, based on work by Abdullah Alansari)
 * Add bookmarks search bar (#332, !1571)
 * Improve sorting of bookmarks (#390, #2359, #2378, Arak)
 * Restore set image as wallpaper functionality under flatpak (#1198, bas=
ed on work by Vanadiae)
 * New Window should always open a non-incognito window (#1758, Arak)
 * Prompt for confirmation when installing a WebExtension (#1817)
 * Add Ctrl+Shift+Delete shortcut for Clear Website Data (#1921, Arak)
 * Add Privacy Report feature (#1982) and improve its UI (!1546, Automeri=
s naranja)
 * Use GtkGraphicsOffload to maybe improve graphics performance in fullsc=
reen mode (#2274, #2417)
 * Replace bookmark properties popover with redesigned dialog (#2327, !15=
72)
 * Disable Firefox Sync (#2337)
 * Don't show reader mode button when page is loading (#2338)
 * Revert address bar UI changes due to pango bug (#2376)
 * Fix application mode when always start in incognito mode setting is en=
abled (#2380, Christopher Davis)
 * Don't warn about failure to download favicon when creating web app (#2=
383)
 * Fix crash when starting secondary instance (#2384)
 * Fix crash when web process becomes unresponsive (#2386)
 * Fix crash when closing window with context menu open (#2389)
 * Fix crash on exit (#2404)
 * Allow overriding fatal criticals using G_DEBUG=3D environment variable=
 (!1513, Christopher Davis)
 * Fix hiding of developer context menu actions (!1515, Vitaly Dyachkov)
 * Fix a different crash when destroying window (!1516)
 * Stop using various deprecated GTK APIs (!1519, !1532, !1533)
 * Support importing passwords from CSV files (!1521, Harshavardhan Naval=
li)
 * Reduce the size of the preferences dialog (!1529)
 * Use modern libadwaita spinners (!1537, Dexter Reed)
 * Fix yet another crash when destroying window (!1538)
 * Improve autofill dialog UI (!1539, Automeris naranja)
 * Update to highlight.js 11.10.0 (!1541)
 * Miscellaneous code robustness improvements (!1543)
 * Load only one web process extension rather than two (!1544, based on w=
ork by Patrick Griffis)
 * Add fallback web app icon (!1545)
 * Redesign the bookmarks UI to use sidebar instead of popover
   (!1547, !1565, !1573, !1578, !1580, !1581, #2401, #2405, #2408, #2410,=
 #2412)
 * Rearrange the window/hamburger menu (!1549, !1564, !1566)
 * Adopt new floating bar style from nautilus (!1552, lo)
 * Focus address bar after deleting URL (!1553)
 * Reenable search in preferences dialog (!1554)
 * Make address bar dropdown suggestions selectable (!1558)
 * WebExtensions: support runtime.getManifest() API (!1560)
 * Modernize encoding dialog (!1563)

47.alpha - June 29, 2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 * Add preference to toggle navigation gestures (#1784)
 * Fix about:overview improperly shown in address bar (#1918, Vitaly Dyac=
hkov)
 * Set brightness and contrast for dark reader mode (#2178)
 * Add Not Now option to save password popover (#2291)
 * Disable Home/End shortcuts in tab bar (#2296)
 * Add delete action to text box context menu (#2318, Harshavardhan Naval=
li)
 * Add additional debug info to about dialog (#2352, Harshavardhan Navall=
i)
 * Don't display placeholder text in address bar when unfocused (#2372)
 * Enable fatal criticals (!1377, !1488)
 * Add Clear button to location entry (!1446, !1483)
 * Fix set as default browser dialog in phosh (!1468, Guido G=C3=BCnther)
 * Improve UI of preferences dialog (#2325, kramo) (and !1472, Jamie Grav=
endeel)
 * Improve UI of about dialog (!1475, Jamie Gravendeel)
 * Improve UI of history dialog (!1476 and !1507, Jamie Gravendeel) (and =
!1490, Dexter Reed)
 * Improve UI of certificate dialog (!1490, Dexter Reed)
 * When not focused, display hostname centered in address bar (!1493, kra=
mo)
 * Always enable web inspector keyboard shortcut (!1494)
 * Update use of libadwaita dialogs (!1504)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../epiphany/{epiphany_46.3.bb =3D> epiphany_47.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_46.3.bb =3D> epiphany_47.0.=
bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_46.3.bb b/meta/recipes-=
gnome/epiphany/epiphany_47.0.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_46.3.bb
rename to meta/recipes-gnome/epiphany/epiphany_47.0.bb
index d9ad38d693..b3e295737d 100644
--- a/meta/recipes-gnome/epiphany/epiphany_46.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_47.0.bb
@@ -31,7 +31,7 @@ SRC_URI =3D "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.tri=
m_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] =3D "a9e1ad206449117fc5ebe4d0177c1d7a2ff503d6=
b55019072a068ff2ab278656"
+SRC_URI[archive.sha256sum] =3D "8e38ee7f90fd6054f8aef0e7f505d53c4520742f=
5acd1f008282a47b2764affa"
=20
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] =3D "-Ddeveloper_mode=3Dtrue,-Ddeveloper_m=
ode=3Dfalse"
--=20
2.46.0


