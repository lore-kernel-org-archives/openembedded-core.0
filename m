Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.21647.1629104939634276369
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 02:09:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 480B86D
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 02:08:59 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E73DD3F40C
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 02:08:58 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell] ovmf: build natively everywhere
Date: Mon, 16 Aug 2021 10:08:55 +0100
Message-Id: <20210816090855.3990825-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The OVMF target binaries are (currently) x86-specific, but the native
tools to build them are not.

Make the COMPATIBLE_HOST assignment target-specific, so that the native
tools can be built on an arm64 build server.

(From OE-Core rev: 58ebb47688fc98fdaeb78b4033bd31100218d5d6)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/=
ovmf_git.bb
index a73bb916b03..b00119313be 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -38,7 +38,7 @@ EDK_TOOLS_DIR=3D"edk2_basetools"
 BUILD_OPTIMIZATION=3D"-pipe"
=20
 # OVMF supports IA only, although it could conceivably support ARM somed=
ay.
-COMPATIBLE_HOST=3D'(i.86|x86_64).*'
+COMPATIBLE_HOST_class-target=3D'(i.86|x86_64).*'
=20
 # Additional build flags for OVMF with Secure Boot.
 # Fedora also uses "-D SMM_REQUIRE -D EXCLUDE_SHELL_FROM_FD".
--=20
2.32.0

