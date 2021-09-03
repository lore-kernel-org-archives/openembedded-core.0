Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.4289.1630675509156866299
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 06:25:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B18E7D6E
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 06:25:08 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C76B3F694
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 06:25:08 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/14] ovmf: set precise BSD license
Date: Fri,  3 Sep 2021 14:24:55 +0100
Message-Id: <20210903132459.2560051-10-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903132459.2560051-1-ross.burton@arm.com>
References: <20210903132459.2560051-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

"BSD" is ambiguous, use the precise license BSD-2-Clause-Patent.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/=
ovmf_git.bb
index 145240e77e8..4caf258e39f 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -2,8 +2,8 @@ SUMMARY =3D "OVMF - UEFI firmware for Qemu and KVM"
 DESCRIPTION =3D "OVMF is an EDK II based project to enable UEFI support =
for \
 Virtual Machines. OVMF contains sample UEFI firmware for QEMU and KVM"
 HOMEPAGE =3D "https://github.com/tianocore/tianocore.github.io/wiki/OVMF=
"
-LICENSE =3D "BSD-2-Clause"
-LICENSE:class-target =3D "${@bb.utils.contains('PACKAGECONFIG', 'secureb=
oot', 'BSD & OpenSSL', 'BSD', d)}"
+LICENSE =3D "BSD-2-Clause-Patent"
+LICENSE:class-target =3D "${@bb.utils.contains('PACKAGECONFIG', 'secureb=
oot', 'BSD-2-Clause-Patent & OpenSSL', 'BSD-2-Clause-Patent', d)}"
 LIC_FILES_CHKSUM =3D "file://OvmfPkg/License.txt;md5=3D06357ddc23f46577c=
2aeaeaf7b776d65"
=20
 # Enabling Secure Boot adds a dependency on OpenSSL and implies
--=20
2.25.1

