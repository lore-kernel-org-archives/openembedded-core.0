Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.4215.1630675509551678859
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 06:25:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44575101E
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 06:25:09 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E3EF53F694
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 06:25:08 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/14] ppp: set precise BSD license
Date: Fri,  3 Sep 2021 14:24:56 +0100
Message-Id: <20210903132459.2560051-11-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903132459.2560051-1-ross.burton@arm.com>
References: <20210903132459.2560051-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

"BSD" is ambiguous, use the precise licenses BSD-3-Clause-Attribution
and BSD-3-Clause.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/ppp/ppp_2.4.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.9.bb b/meta/recipes-co=
nnectivity/ppp/ppp_2.4.9.bb
index 6e5cfc8f912..023d0feca99 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
@@ -5,7 +5,7 @@ SECTION =3D "console/network"
 HOMEPAGE =3D "http://samba.org/ppp/"
 BUGTRACKER =3D "http://ppp.samba.org/cgi-bin/ppp-bugs"
 DEPENDS =3D "libpcap openssl virtual/crypt"
-LICENSE =3D "BSD & GPLv2+ & LGPLv2+ & PD"
+LICENSE =3D "BSD-3-Clause & BSD-3-Clause-Attribution & GPLv2+ & LGPLv2+ =
& PD"
 LIC_FILES_CHKSUM =3D "file://pppd/ccp.c;beginline=3D1;endline=3D29;md5=3D=
e2c43fe6e81ff77d87dc9c290a424dea \
                     file://pppd/plugins/passprompt.c;beginline=3D1;endli=
ne=3D10;md5=3D3bcbcdbf0e369c9a3e0b8c8275b065d8 \
                     file://pppd/tdb.c;beginline=3D1;endline=3D27;md5=3D4=
ca3a9991b011038d085d6675ae7c4e6 \
--=20
2.25.1

