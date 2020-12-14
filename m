Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.492.1607970715243173939
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 10:31:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1D891FB
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 10:31:54 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 74F8D3F718
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 10:31:54 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 6/7] systemd-boot: allow building for Arm targets
Date: Mon, 14 Dec 2020 18:31:47 +0000
Message-Id: <20201214183148.2673069-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214183148.2673069-1-ross.burton@arm.com>
References: <20201214183148.2673069-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

systemd-boot works on 32-bit and 64-bit Arm targets (assuming the
firmware does EFI, obviously), so allow it to be built.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/systemd/systemd-boot_246.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-boot_246.6.bb b/meta/recip=
es-core/systemd/systemd-boot_246.6.bb
index 97093e4bb2..249e620f4e 100644
--- a/meta/recipes-core/systemd/systemd-boot_246.6.bb
+++ b/meta/recipes-core/systemd/systemd-boot_246.6.bb
@@ -48,7 +48,7 @@ RDEPENDS_${PN} +=3D "virtual/systemd-bootconf"
 # Imported from the old gummiboot recipe
 TUNE_CCARGS_remove =3D "-mfpmath=3Dsse"
=20
-COMPATIBLE_HOST =3D "(x86_64.*|i.86.*)-linux"
+COMPATIBLE_HOST =3D "(aarch64.*|arm.*|x86_64.*|i.86.*)-linux"
 COMPATIBLE_HOST_x86-x32 =3D "null"
=20
 do_compile() {
--=20
2.25.1

