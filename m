Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5494C43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 10:40:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.23289.1656585596793703119
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 03:39:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92BF61042;
	Thu, 30 Jun 2022 03:39:56 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E0D273F5A1;
	Thu, 30 Jun 2022 03:39:55 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] ncurses: use GitHub mirror, not Debian's packaging
Date: Thu, 30 Jun 2022 11:39:54 +0100
Message-Id: <20220630103954.1183831-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 10:40:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167409

The GitHub mirror of ncurses is updated daily, whereas the Debian
packaging repository is only updated when they do an upgrade.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/ncurses/ncurses.inc             | 2 +-
 meta/recipes-core/ncurses/ncurses_6.3+20220423.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/nc=
urses/ncurses.inc
index 1abcfae1fef..367f3b19f48 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -13,7 +13,7 @@ BINCONFIG =3D "${bindir}/ncurses5-config ${bindir}/ncur=
sesw5-config \
 inherit autotools binconfig-disabled multilib_header pkgconfig
=20
 # Upstream has useful patches at times at ftp://invisible-island.net/ncu=
rses/
-SRC_URI =3D "git://salsa.debian.org/debian/ncurses.git;protocol=3Dhttps;=
branch=3Dmaster"
+SRC_URI =3D "git://github.com/mirror/ncurses.git;protocol=3Dhttps;branch=
=3Dmaster"
=20
 EXTRA_AUTORECONF =3D "-I m4"
=20
diff --git a/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb b/meta/rec=
ipes-core/ncurses/ncurses_6.3+20220423.bb
index 6cd143774c8..1c46e79b308 100644
--- a/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
@@ -5,7 +5,7 @@ SRC_URI +=3D "file://0001-tic-hang.patch \
            file://0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-genera=
ted.patch \
            "
 # commit id corresponds to the revision in package version
-SRCREV =3D "23b32732ccd779bae8731f2d4a611bfcae45974e"
+SRCREV =3D "20db1fb41ec91cd8a1f528e770362092c5403378"
 S =3D "${WORKDIR}/git"
 EXTRA_OECONF +=3D "--with-abi-version=3D5"
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+(\.\d+)+)$"
--=20
2.25.1


