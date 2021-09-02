Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1770.1630599893246077304
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Sep 2021 09:24:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF531101E
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Sep 2021 09:24:52 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B24C3F766
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Sep 2021 09:24:52 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/14] libwpe: set precise BSD license
Date: Thu,  2 Sep 2021 17:24:34 +0100
Message-Id: <20210902162435.1375245-13-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210902162435.1375245-1-ross.burton@arm.com>
References: <20210902162435.1375245-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

"BSD" is ambiguous, use the precise license BSD-2-Clause.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-sato/webkit/libwpe_1.10.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/libwpe_1.10.1.bb b/meta/recipes-sat=
o/webkit/libwpe_1.10.1.bb
index 6f2fe1df423..4e77481bc8f 100644
--- a/meta/recipes-sato/webkit/libwpe_1.10.1.bb
+++ b/meta/recipes-sato/webkit/libwpe_1.10.1.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "General-purpose library specifically develop=
ed for the WPE-flavored p
 HOMEPAGE =3D "https://github.com/WebPlatformForEmbedded/libwpe"
 BUGTRACKER =3D "https://github.com/WebPlatformForEmbedded/libwpe/issues"
=20
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D371a616eb4903c6cb79e9893a5f61=
5cc"
 DEPENDS =3D "virtual/egl libxkbcommon"
=20
--=20
2.25.1

