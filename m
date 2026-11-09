Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4509.1794226197920811569
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 04:09:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Ft+pqb2Z;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B8181516
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Nov 2026 04:09:54 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D76623F632
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Nov 2026 04:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794226197; bh=/RyMHlgb98rUk/reDOo5AZIYn6jwikgoyFr5j6HZ3KA=;
	h=From:To:Subject:Date:From;
	b=Ft+pqb2ZW03N4e8TaDnr0UhkF1SE/b+nONUX0qbVJmCoRau/tc4+imXVq10kyD2VJ
	 tTPxtUODOMxM9Agq1xPgWAPW8T55pAmajxqfr1Do+O5cJQs7pmI4GNjihBOs+Btlou
	 1KSfhcqVMLg2o/fsA/B6KmHUUj5YRMw39tBxR/gk=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] automake: upgrade 1.19 -> 1.20
Date: Mon,  9 Nov 2026 12:09:52 +0000
Message-ID: <20261109120952.2698250-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 12:10:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249804
Content-Type: text/plain; charset="utf-8"

Upstream release announcement:

  Among new features is `--enable-jobserver' for compiler and linker
  access to GNU make's jobserver, the delete-on-error option, and a
  print-distfiles target.  distcheck no longer requires TeX by default.
  This release also fixes some long-standing bugs and limitations
  concerning dependency tracking, lex/yacc output in VPATH builds, Vala
  builds, distribution compression, and uninstall checks.  Furthermore,
  GNU automake has upgraded from the GNU GPLv2 (or later) license to the
  GNU GPL v3 (or later) license.

License-Update: relicensed to GPL-3.0-or-later.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../automake/{automake_1.19.bb =3D> automake_1.20.bb}         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/automake/{automake_1.19.bb =3D> automake_1.=
20.bb} (87%)

diff --git a/meta/recipes-devtools/automake/automake_1.19.bb b/meta/recip=
es-devtools/automake/automake_1.20.bb
similarity index 87%
rename from meta/recipes-devtools/automake/automake_1.19.bb
rename to meta/recipes-devtools/automake/automake_1.20.bb
index ac99268ab34..b0a3df01c59 100644
--- a/meta/recipes-devtools/automake/automake_1.19.bb
+++ b/meta/recipes-devtools/automake/automake_1.20.bb
@@ -1,20 +1,20 @@
 SUMMARY =3D "A GNU tool for automatically generating Makefiles"
 DESCRIPTION =3D "Automake is a tool for automatically generating `Makefi=
le.in' files compliant with the GNU Coding \
 Standards. Automake requires the use of Autoconf."
-LICENSE =3D "GPL-2.0-only"
+LICENSE =3D "GPL-3.0-or-later"
 HOMEPAGE =3D "http://www.gnu.org/software/automake/"
 SECTION =3D "devel"
=20
 DEPENDS =3D "autoconf-native"
=20
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e440=
464"
=20
 SRC_URI =3D "${GNU_MIRROR}/automake/automake-${PV}.tar.gz \
            file://0002-automake-Update-for-python.m4-to-respect-libdir.p=
atch \
            file://0004-Add-a-new-distro-feature-ptest.patch \
            "
=20
-SRC_URI[sha256sum] =3D "79e8b1f7a967e87ce8a9ded76bee7f793d0ce1886ab2002f=
eb1b0510f578b75a"
+SRC_URI[sha256sum] =3D "00c0e397a3c0096b1b9167eb4a5ecb87a66fe50888d939c4=
e02111e603936570"
=20
 inherit autotools texinfo
=20
--=20
2.43.0

