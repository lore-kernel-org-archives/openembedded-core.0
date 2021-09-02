Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.1695.1630599888839985682
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Sep 2021 09:24:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77EFC1063
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Sep 2021 09:24:48 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23C393F766
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Sep 2021 09:24:48 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/14] dtc: set precise BSD license
Date: Thu,  2 Sep 2021 17:24:26 +0100
Message-Id: <20210902162435.1375245-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210902162435.1375245-1-ross.burton@arm.com>
References: <20210902162435.1375245-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

"BSD" is ambiguous, use the precise license BSD-2-Clause.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-kernel/dtc/dtc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dt=
c.inc
index 12508b235d9..bfdc9f86399 100644
--- a/meta/recipes-kernel/dtc/dtc.inc
+++ b/meta/recipes-kernel/dtc/dtc.inc
@@ -2,7 +2,7 @@ SUMMARY =3D "Device Tree Compiler"
 HOMEPAGE =3D "https://devicetree.org/"
 DESCRIPTION =3D "The Device Tree Compiler is a tool used to manipulate t=
he Open-Firmware-like device tree used by PowerPC kernels."
 SECTION =3D "bootloader"
-LICENSE =3D "GPLv2 | BSD"
+LICENSE =3D "GPLv2 | BSD-2-Clause"
 DEPENDS =3D "flex-native bison-native"
=20
 SRC_URI =3D "git://git.kernel.org/pub/scm/utils/dtc/dtc.git \
--=20
2.25.1

