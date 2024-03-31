Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7CF8CD128A
	for <webhook@archiver.kernel.org>; Sun, 31 Mar 2024 16:07:55 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.19600.1711901268723745280
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Mar 2024 09:07:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout08.t-online.de (Postfix) with SMTP id D9A4E1DBBD
	for <openembedded-core@lists.openembedded.org>; Sun, 31 Mar 2024 18:07:46 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.46.245]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rqxij-1L7AWX0; Sun, 31 Mar 2024 18:07:45 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] epiphany: update 45.3 -> 46.0
Date: Sun, 31 Mar 2024 18:07:57 +0200
Message-ID: <20240331160757.2455786-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1711901265-33FFC837-272F2DFB/0/0 CLEAN NORMAL
X-TOI-MSGID: e15db6f9-de20-493e-9193-f290414012bc
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Mar 2024 16:07:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197667

46.0 - March 15, 2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 * Improve keyboard navigation of address bar dropdown (#1726, Markus G=C3=
=B6llnitz)
 * Add "Send Link by Email..." to context menu for links (#2037, Leon Mar=
z)
 * Use selected text when middle clicking on New Tab button (#2159)

46.rc - February 29, 2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

 * Close security popover after selection (#2215)
 * Focus location entry on search hotkey (#2278)
 * Close page menu popover on print, search and fullscreen actions (#2283=
)
 * Forward key events directly to web view (#1915) (#2173)
 * Updated translations

46.beta - February 10, 2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

 * Fix a crash (#2021)
 * Allow closing pinned tabs (#2264)
 * Adjust labels to improve HIG compliance (!1431, Bart Gravendeel)
 * Support PKCS #11 smart card authentication (!1433)
 * Updated translations

46.alpha - January 5, 2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

 * Use web app manifest to get better app name and icon (#931)
 * Prevent websites from using certain Epiphany internal APIs (#1664)
 * Fix poor Firefox Sync error message when gnome-keyring is not installe=
d (#1755)
 * Reduce adblock filter update interval on metered connections (#2152)
 * Rename Firefox Account to Mozilla Account (#2231)
 * Hide various context menu items when text is selected (#2258)
 * Remove Google Safe Browsing support due to terms of service changes (!=
335)
 * Hide developer context menu actions by default (!1392, Vitaly Dyachkov=
)
 * Update to highlight.js 11.9.0 (!1394)
 * Use AdwSpinRow in preferences dialog (Pig, !1411)
 * Many improvements to appstream metainfo (Sabri =C3=9Cnal, !1398, !1399=
, !1414, !1422, !1425)
 * Updated translations

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../epiphany/{epiphany_45.3.bb =3D> epiphany_46.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_45.3.bb =3D> epiphany_46.0.=
bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_45.3.bb b/meta/recipes-=
gnome/epiphany/epiphany_46.0.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_45.3.bb
rename to meta/recipes-gnome/epiphany/epiphany_46.0.bb
index eec52e321a..9052fe170b 100644
--- a/meta/recipes-gnome/epiphany/epiphany_45.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_46.0.bb
@@ -31,7 +31,7 @@ SRC_URI =3D "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.tri=
m_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] =3D "6c302e9bdd66290cb0e26f62843cd4c435a4955a=
bdbb4f151f07dc80495d6730"
+SRC_URI[archive.sha256sum] =3D "f4348f2cf51c07c0c106d130172d4d23f2cd4068=
771e1de007b758ca2ade5660"
=20
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] =3D "-Ddeveloper_mode=3Dtrue,-Ddeveloper_m=
ode=3Dfalse"
--=20
2.44.0


