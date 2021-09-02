Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.1735.1630599890557696973
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Sep 2021 09:24:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 247EA1063
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Sep 2021 09:24:50 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C32413F766
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Sep 2021 09:24:49 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/14] openssh: remove redundant BSD license
Date: Thu,  2 Sep 2021 17:24:29 +0100
Message-Id: <20210902162435.1375245-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210902162435.1375245-1-ross.burton@arm.com>
References: <20210902162435.1375245-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The license statement already includes BSD-2-Clause and BSD-3-Clause, so
remove the redundant and ambiguous BSD license.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/openssh/openssh_8.7p1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.7p1.bb b/meta/re=
cipes-connectivity/openssh/openssh_8.7p1.bb
index c4a08f71d63..8a2e7611af8 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.7p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.7p1.bb
@@ -5,7 +5,7 @@ Ssh (Secure Shell) is a program for logging into a remote=
 machine \
 and for executing commands on a remote machine."
 HOMEPAGE =3D "http://www.openssh.com/"
 SECTION =3D "console/network"
-LICENSE =3D "BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & BSD & ISC & MI=
T"
+LICENSE =3D "BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & ISC & MIT"
 LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3Dd9d2753bdef9f19466dc7bc959114=
b11"
=20
 DEPENDS =3D "zlib openssl virtual/crypt"
--=20
2.25.1

