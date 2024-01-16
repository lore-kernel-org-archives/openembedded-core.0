Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD4D4C47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 06:26:52 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.6643.1705386404564311206
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 22:26:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from DL-ARCH01.lan (173-175-175-024.res.spectrum.com [173.175.175.24])
	by linux.microsoft.com (Postfix) with ESMTPSA id AC79B20DEE9C;
	Mon, 15 Jan 2024 22:26:43 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com AC79B20DEE9C
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH] newlib: Upgrade 4.3.0 -> 4.4.0
Date: Mon, 15 Jan 2024 23:27:23 -0700
Message-ID: <20240116062723.461306-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 06:26:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193819

- COPYING.LICENSE: Added Apache-2.0-with-LLVM-exception from newlibs comm=
it
  96ec8f868e1a0f5a75badfe4627a41f12cce742d
  applicable to newlib/libc/machine/aarch64.
- Also switch libgloss to use PV from newlib.inc instead to align with th=
e
  newlib recipe behavior.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 .../newlib/{libgloss_4.3.0.bb =3D> libgloss_git.bb}         | 0
 meta/recipes-core/newlib/newlib.inc                       | 8 ++++----
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-core/newlib/{libgloss_4.3.0.bb =3D> libgloss_git.bb}=
 (100%)

diff --git a/meta/recipes-core/newlib/libgloss_4.3.0.bb b/meta/recipes-co=
re/newlib/libgloss_git.bb
similarity index 100%
rename from meta/recipes-core/newlib/libgloss_4.3.0.bb
rename to meta/recipes-core/newlib/libgloss_git.bb
diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newl=
ib/newlib.inc
index da753f11ad..6113f5e831 100644
--- a/meta/recipes-core/newlib/newlib.inc
+++ b/meta/recipes-core/newlib/newlib.inc
@@ -3,21 +3,21 @@ HOMEPAGE =3D "https://sourceware.org/newlib/"
 DESCRIPTION =3D "C library intended for use on embedded systems. It is a=
 conglomeration of several library parts, all under free software license=
s that make them easily usable on embedded products."
 SECTION =3D "libs"
=20
-LICENSE =3D "GPL-2.0-only & LGPL-3.0-only & GPL-3.0-only & LGPL-2.0-only=
 & BSD-2-Clause & BSD-3-Clause & TCL"
+LICENSE =3D "GPL-2.0-only & LGPL-3.0-only & GPL-3.0-only & LGPL-2.0-only=
 & BSD-2-Clause & BSD-3-Clause & TCL & Apache-2.0-with-LLVM-exception"
 LIC_FILES_CHKSUM =3D " \
 		file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552 \
 		file://COPYING3.LIB;md5=3D6a6a8e020838b23406c81b19c1d46df6 \
 		file://COPYING3;md5=3Dd32239bcb673463ab874e80d47fae504 \
 		file://COPYING.LIBGLOSS;md5=3Dc0469b6ebb847a75781066be515f032d \
 		file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
-		file://COPYING.NEWLIB;md5=3D5a9d477b5f4eab20dccf655a77107a6e \
+		file://COPYING.NEWLIB;md5=3D4f1a15846ffee91e352418563e1bce27 \
 		file://newlib/libc/posix/COPYRIGHT;md5=3D103468ff1982be840fdf4ee9f8b51=
bbf \
 		"
=20
-BASEVER =3D "4.3.0"
+BASEVER =3D "4.4.0"
 PV =3D "${BASEVER}+git"
 SRC_URI =3D "git://sourceware.org/git/newlib-cygwin.git;protocol=3Dhttps=
;branch=3Dmain"
-SRCREV=3D"9e09d6ed83cce4777a5950412647ccc603040409"
+SRCREV=3D"ad11e2587f83d61357a32c61c36d72ea4f39315e"
=20
 INHIBIT_DEFAULT_DEPS =3D "1"
 DEPENDS =3D "virtual/${TARGET_PREFIX}gcc"
--=20
2.43.0


