Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.12012.1604491942343550511
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2020 04:12:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCF061474
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Nov 2020 04:12:21 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7021F3F719
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Nov 2020 04:12:21 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] setuptools3: use DEPENDS_append instead of +=
Date: Wed,  4 Nov 2020 12:12:17 +0000
Message-Id: <20201104121217.4013924-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201104121217.4013924-1-ross.burton@arm.com>
References: <20201104121217.4013924-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

To help people who inherit setuptools3 and then assign DEPENDS with =3D.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/setuptools3.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/setuptools3.bbclass b/meta/classes/setuptools3.=
bbclass
index 8ca66ee708e..4e6a9343d77 100644
--- a/meta/classes/setuptools3.bbclass
+++ b/meta/classes/setuptools3.bbclass
@@ -1,4 +1,3 @@
 inherit distutils3
=20
-DEPENDS +=3D "python3-setuptools-native"
-
+DEPENDS_append =3D " python3-setuptools-native"
--=20
2.25.1

