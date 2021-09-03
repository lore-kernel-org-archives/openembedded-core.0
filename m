Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.4213.1630675505153697244
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 06:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7584D6E
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 06:25:03 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 51B753F694
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 06:25:03 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/14] lsof: correct LICENSE
Date: Fri,  3 Sep 2021 14:24:46 +0100
Message-Id: <20210903132459.2560051-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The lsof LICENSE is superficially BSD-like, but it isn't BSD.  Now that
we have the full SPDX license set in oe-core, use Spencer-94.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/lsof/lsof_4.91.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/lsof/lsof_4.91.bb b/meta/recipes-exten=
ded/lsof/lsof_4.91.bb
index b3adfd57afa..7c85bf23fc3 100644
--- a/meta/recipes-extended/lsof/lsof_4.91.bb
+++ b/meta/recipes-extended/lsof/lsof_4.91.bb
@@ -3,7 +3,7 @@ DESCRIPTION =3D "Lsof is a Unix-specific diagnostic tool.=
 \
 Its name stands for LiSt Open Files, and it does just that."
 HOMEPAGE =3D "http://people.freebsd.org/~abe/"
 SECTION =3D "devel"
-LICENSE =3D "BSD"
+LICENSE =3D "Spencer-94"
 LIC_FILES_CHKSUM =3D "file://00README;beginline=3D645;endline=3D679;md5=3D=
964df275d26429ba3b39dbb9f205172a"
=20
 # Upstream lsof releases are hosted on an ftp server which times out dow=
nload
--=20
2.25.1

