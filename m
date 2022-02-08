Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B17C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 11:56:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.10103.1644321395357713174
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 03:56:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3580BED1
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Feb 2022 03:56:33 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA7BB3F70D
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Feb 2022 03:56:32 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] newlib: fix license checksums
Date: Tue,  8 Feb 2022 11:56:29 +0000
Message-Id: <20220208115629.2867610-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 11:56:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161498

COPYING.LIBGLOSS simply had the FSF street address change.

COPYING.NEWLIB now includes BSD-3-Clause.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/newlib/newlib.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newl=
ib/newlib.inc
index 5e488d08483..bfecfe086ef 100644
--- a/meta/recipes-core/newlib/newlib.inc
+++ b/meta/recipes-core/newlib/newlib.inc
@@ -3,14 +3,14 @@ HOMEPAGE =3D "https://sourceware.org/newlib/"
 DESCRIPTION =3D "C library intended for use on embedded systems. It is a=
 conglomeration of several library parts, all under free software license=
s that make them easily usable on embedded products."
 SECTION =3D "libs"
=20
-LICENSE =3D "GPLv2 & LGPLv3 & GPLv3 & LGPLv2 & BSD-2-Clause & tcl"
+LICENSE =3D "GPLv2 & LGPLv3 & GPLv3 & LGPLv2 & BSD-2-Clause & BSD-3-Clau=
se & tcl"
 LIC_FILES_CHKSUM =3D " \
 		file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552 \
 		file://COPYING3.LIB;md5=3D6a6a8e020838b23406c81b19c1d46df6 \
 		file://COPYING3;md5=3Dd32239bcb673463ab874e80d47fae504 \
-		file://COPYING.LIBGLOSS;md5=3D7b7615de0ecda0ff8d705966ac3b8950 \
+		file://COPYING.LIBGLOSS;md5=3Dc0469b6ebb847a75781066be515f032d \
 		file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
-		file://COPYING.NEWLIB;md5=3Db8dda70da54e0efb49b1074f349d7749 \
+		file://COPYING.NEWLIB;md5=3D8bb75595dbcc7d45e5c0d116d7bdf6ce \
 		file://newlib/libc/posix/COPYRIGHT;md5=3D103468ff1982be840fdf4ee9f8b51=
bbf \
 		file://newlib/libc/sys/linux/linuxthreads/LICENSE;md5=3D73640207fbc79b=
198c7ffd4ad4d97aa0 \
 		"
--=20
2.25.1


