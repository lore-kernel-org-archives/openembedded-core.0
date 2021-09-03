Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.4331.1630675506440442120
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 06:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF82E1063
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 06:25:04 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B4443F694
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 06:25:04 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/14] xinetd: correct LICENSE
Date: Fri,  3 Sep 2021 14:24:48 +0100
Message-Id: <20210903132459.2560051-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903132459.2560051-1-ross.burton@arm.com>
References: <20210903132459.2560051-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The xinetd license is superficially BSD-like, but it isn't BSD. Now that
we have the full SPDX license set in oe-core, use the specific xinetd
license.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb b/meta/recip=
es-extended/xinetd/xinetd_2.3.15.4.bb
index e6ef5cf8b9a..30eec9c2734 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
@@ -2,9 +2,7 @@ SUMMARY =3D "Socket-based service activation daemon"
 HOMEPAGE =3D "https://github.com/xinetd-org/xinetd"
 DESCRIPTION =3D "xinetd is a powerful replacement for inetd, xinetd has =
access control mechanisms, extensive logging capabilities, the ability to=
 make services available based on time, can place limits on the number of=
 servers that can be started, and has deployable defence mechanisms to pr=
otect against port scanners, among other things."
=20
-# xinetd is a BSD-like license
-# Apple and Gentoo say BSD here.
-LICENSE =3D "BSD"
+LICENSE =3D "xinet"
 LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D55c5fdf02cfcca3fc9621b6f2ce=
ae10f"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+(\.\d+)+)"
--=20
2.25.1

