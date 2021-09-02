Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.1618.1630599888277276065
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Sep 2021 09:24:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5A3F101E
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Sep 2021 09:24:47 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 918DF3F766
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Sep 2021 09:24:47 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/14] nfs-utils: set precise BSD license
Date: Thu,  2 Sep 2021 17:24:25 +0100
Message-Id: <20210902162435.1375245-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210902162435.1375245-1-ross.burton@arm.com>
References: <20210902162435.1375245-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

"BSD" is ambiguous, use the precise license BSD-3-Clause.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.4.bb b/met=
a/recipes-connectivity/nfs-utils/nfs-utils_2.5.4.bb
index 495ce4e542c..a655de2aca7 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.4.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.4.bb
@@ -4,7 +4,7 @@ NFS server and related tools."
 HOMEPAGE =3D "http://nfs.sourceforge.net/"
 SECTION =3D "console/network"
=20
-LICENSE =3D "MIT & GPLv2+ & BSD"
+LICENSE =3D "MIT & GPLv2+ & BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D95f3a93a5c3c7888de623b46ea085=
a84"
=20
 # util-linux for libblkid
--=20
2.25.1

