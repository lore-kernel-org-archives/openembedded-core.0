Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.5151.1630679144417575204
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 07:25:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40E58D6E
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 07:25:43 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD8523F694
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 07:25:42 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] xinetd: correct LICENSE
Date: Fri,  3 Sep 2021 15:25:38 +0100
Message-Id: <20210903142538.2732853-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
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
index e6ef5cf8b9a..ec90de830d0 100644
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
+LICENSE =3D "xinetd"
 LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D55c5fdf02cfcca3fc9621b6f2ce=
ae10f"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+(\.\d+)+)"
--=20
2.25.1

