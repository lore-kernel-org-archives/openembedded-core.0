Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.1697.1630599892147464236
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Sep 2021 09:24:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D63EB1063
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Sep 2021 09:24:51 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 801DF3F766
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Sep 2021 09:24:51 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/14] libx11-compose-data: set precise BSD license
Date: Thu,  2 Sep 2021 17:24:32 +0100
Message-Id: <20210902162435.1375245-11-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210902162435.1375245-1-ross.burton@arm.com>
References: <20210902162435.1375245-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

"BSD" is ambiguous, use the precise licenses BSD-2-Clause BSD-4-Clause.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb =
b/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
index 7519b4c018d..e53ccc6aea8 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
@@ -8,7 +8,7 @@ python () {
=20
 require xorg-lib-common.inc
=20
-LICENSE =3D "MIT & MIT-style & BSD"
+LICENSE =3D "MIT & MIT-style & BSD-4-Clause & BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D172255dee66bb0151435b2d5d709f=
cf7"
=20
 SRC_URI[md5sum] =3D "c5fa5a86a20e3591bed6c046498d4b8f"
--=20
2.25.1

