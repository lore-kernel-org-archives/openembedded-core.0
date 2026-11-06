Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5259.1793969243859904766
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 04:47:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=cK3VTanQ;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0527A1682
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 04:47:20 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A581B3F673
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 04:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793969243; bh=UslsH8Bw7gCLAZ+IucXWADwYeIAJORzhGjsvaHKRi9o=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cK3VTanQZOdR0RpXmRAdiEwCy48gSncTnBa0qRew9uE9Ve0tpudlyWjQmkFZyyUAM
	 b4/Tw6Nrp7SugnMgyfbUP5W+DnR7gXXoM+icU4Q8nQYz406f7bcHHB40bIczhYBC66
	 B0zn9f4WopxPrxObZFTKLgqIuRZvP8tTsRhCiZRI=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] python3-dbus: fetch sources from PyPI
Date: Fri,  6 Nov 2026 12:47:16 +0000
Message-ID: <20261106124717.564830-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106124717.564830-1-ross.burton@arm.com>
References: <20261106124717.564830-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 12:47:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249643
Content-Type: text/plain; charset="utf-8"

This is a python package, so fetch the sources from PyPI. This gives us
reliable upstream release checking and a slightly neater recipe.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-dbus_1.5.1.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-dbus_1.5.1.bb b/meta/re=
cipes-devtools/python/python3-dbus_1.5.1.bb
index 4126c4639a0..ccd39d46a23 100644
--- a/meta/recipes-devtools/python/python3-dbus_1.5.1.bb
+++ b/meta/recipes-devtools/python/python3-dbus_1.5.1.bb
@@ -9,13 +9,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D97f58951300a=
a52a9f9e3a62bd5c846c \
                     "
 DEPENDS =3D "expat dbus glib-2.0 virtual/libintl"
=20
-SRC_URI =3D "http://dbus.freedesktop.org/releases/dbus-python/dbus_pytho=
n-${PV}.tar.gz"
+PYPI_PACKAGE =3D "dbus-python"
=20
 SRC_URI[sha256sum] =3D "57423cf87d09b7d084f420b55b737fe654c33339b06df779=
45620d97795c6ac4"
=20
-S =3D "${UNPACKDIR}/dbus_python-${PV}"
-
-inherit setuptools3-base meson pkgconfig
+inherit pypi setuptools3-base meson pkgconfig
=20
 # requires dbus-run-session
 EXTRA_OEMESON +=3D "-Dtests=3Ddisabled"
--=20
2.43.0

