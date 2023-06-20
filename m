Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D129EB64D8
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 12:34:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9137.1687264447470528956
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 05:34:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2E841063;
	Tue, 20 Jun 2023 05:34:50 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7A97B3F71E;
	Tue, 20 Jun 2023 05:34:06 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/3] sysfsutils: fetch a supported fork from github
Date: Tue, 20 Jun 2023 13:34:02 +0100
Message-Id: <20230620123404.3854578-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 12:34:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183133

From: Alexander Kanavin <alex.kanavin@gmail.com>

Debian does the same:
https://packages.debian.org/source/sid/sysfsutils

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb b/meta/reci=
pes-core/sysfsutils/sysfsutils_2.1.0.bb
index c90a02f1319..fd72cf41659 100644
--- a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
+++ b/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
@@ -10,18 +10,14 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3d06403ea5=
4c7574a9e581c6478cc393 \
                     file://lib/LGPL;md5=3Db75d069791103ffe1c0d6435deeff7=
2e"
 PR =3D "r5"
=20
-SRC_URI =3D "${SOURCEFORGE_MIRROR}/linux-diag/sysfsutils-${PV}.tar.gz \
+SRC_URI =3D "git://github.com/linux-ras/sysfsutils.git;protocol=3Dhttps;=
branch=3Dmaster \
            file://sysfsutils-2.0.0-class-dup.patch \
            file://obsolete_automake_macros.patch \
            file://separatebuild.patch"
=20
-SRC_URI[md5sum] =3D "14e7dcd0436d2f49aa403f67e1ef7ddc"
-SRC_URI[sha256sum] =3D "e865de2c1f559fff0d3fc936e660c0efaf7afe662064f2fb=
97ccad1ec28d208a"
+SRCREV =3D "0d5456e1c9d969cdad6accef2ae2d4881d5db085"
=20
-UPSTREAM_CHECK_URI =3D "http://sourceforge.net/projects/linux-diag/files=
/sysfsutils/"
-UPSTREAM_CHECK_REGEX =3D "/sysfsutils/(?P<pver>(\d+[\.\-_]*)+)/"
-
-S =3D "${WORKDIR}/sysfsutils-${PV}"
+S =3D "${WORKDIR}/git"
=20
 inherit autotools
=20
--=20
2.34.1


