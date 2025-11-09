Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB7CCCFA1A
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 15:37:46 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26762.1762702658107056653
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Nov 2025 07:37:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=iRtHacR9;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 7D97B240101
	for <openembedded-core@lists.openembedded.org>; Sun,  9 Nov 2025 16:37:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.com; s=2017;
	t=1762702656; bh=ES2kLs8fceeBEAFEHWS/AZgKNXLVRbL6StctW9DcUrc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=iRtHacR9/3AQkg9/Ny2BTv4Uq1osYXXoip2JbZP2iWmQxanXRk/32wsp0VOmW+vAO
	 iaiprs4SZzr6r2GyDq3kWA2mliFPauOs9FxFBSiyJzm9WKpz3ito8po/zPQQCh6tog
	 R+lenDLDVHK3wFR7Isp8Su7XKvt194PNED4wZIGxcSdceHoedU0Cf+zjJxWObJxUMC
	 0Vo1A/xzHsu86OrNrz//wLJyDW4YKL59JevhM8IQ6ZTZYl19iX4EZWiGcXfwJiNMLj
	 vb22ewiSwt278rMNGJca4veXdDUCLI46gurrtKy5+AlqhFbQVTyApGDw7CXfJoEF4L
	 zTxIzCM0PeoBA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4d4H3z6y0Xz9rxB;
	Sun,  9 Nov 2025 16:37:35 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>,
	=?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.net>
Subject: [PATCH 1/2] gtk4: upgrade 4.18.6 -> 4.20.2
Date: Sun, 09 Nov 2025 15:37:36 +0000
Message-Id: <20251109153719.10026-2-simone.p.weiss@posteo.com>
In-Reply-To: <20251109153719.10026-1-simone.p.weiss@posteo.com>
References: <20251109153719.10026-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Nov 2025 15:37:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226093

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Inherit bash-completion now to account for the fact that gtk4 now provide=
s the
files.

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.net>
---
 meta/recipes-gnome/gtk+/{gtk4_4.18.6.bb =3D> gtk4_4.20.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.18.6.bb =3D> gtk4_4.20.2.bb} (97%=
)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.20.2.bb
similarity index 97%
rename from meta/recipes-gnome/gtk+/gtk4_4.18.6.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.20.2.bb
index 2d24468dcc..11ec24ba25 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.20.2.bb
@@ -38,13 +38,13 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX =3D "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.=
xz"
=20
 SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-$=
{PV}.tar.xz"
-SRC_URI[sha256sum] =3D "e1817c650ddc3261f9a8345b3b22a26a5d80af154630dedc=
03cc7becefffd0fa"
+SRC_URI[sha256sum] =3D "5e8240edecafaff2b8baf4663bdceaa668ef10a207bee4d7=
f90e010e10bddc5c"
=20
 S =3D "${UNPACKDIR}/gtk-${PV}"
=20
 CVE_PRODUCT =3D "gnome:gtk"
=20
-inherit meson gettext pkgconfig gi-docgen update-alternatives gsettings =
features_check gobject-introspection
+inherit meson gettext pkgconfig gi-docgen update-alternatives gsettings =
features_check gobject-introspection bash-completion
=20
 # TBD: nativesdk
 # gobject-introspection.bbclass pins introspection off for nativesk. As =
long as
--=20
2.39.5


