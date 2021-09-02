Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1767.1630599889941025773
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Sep 2021 09:24:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90DA3101E
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Sep 2021 09:24:49 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C7023F766
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Sep 2021 09:24:49 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/14] libevent: set precise BSD license
Date: Thu,  2 Sep 2021 17:24:28 +0100
Message-Id: <20210902162435.1375245-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210902162435.1375245-1-ross.burton@arm.com>
References: <20210902162435.1375245-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

"BSD" is ambiguous, use the precise license BSD-3-Clause.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/libevent/libevent_2.1.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libevent/libevent_2.1.12.bb b/meta/reci=
pes-support/libevent/libevent_2.1.12.bb
index 2a562fe2e96..4b419eab226 100644
--- a/meta/recipes-support/libevent/libevent_2.1.12.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.12.bb
@@ -8,7 +8,7 @@ HOMEPAGE =3D "http://libevent.org/"
 BUGTRACKER =3D "https://github.com/libevent/libevent/issues"
 SECTION =3D "libs"
=20
-LICENSE =3D "BSD & MIT"
+LICENSE =3D "BSD-3-Clause & MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D17f20574c0b154d12236d5fbe964f=
549"
=20
 SRC_URI =3D "https://github.com/libevent/libevent/releases/download/rele=
ase-${PV}-stable/${BP}-stable.tar.gz \
--=20
2.25.1

