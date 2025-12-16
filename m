Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A23D5E360
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 13:36:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22565.1765892169228752041
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 05:36:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80566FEC
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 05:36:01 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4FE083F73B
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 05:36:08 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] acpica: upgrade 20250807 -> 20251212
Date: Tue, 16 Dec 2025 13:35:54 +0000
Message-ID: <20251216133603.1003572-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 13:36:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227947

Upstream changes:

- Update many existing ACPI tables to follow the ACPI 6.6 Specification
  changes and/or newly approved ASWG ECRs
- Add a few new ACPI tables: IOVT, SWFT, KEYP
- Add many new UUIDs, Hardware/PnP/ACPI IDs
- Support a few new special methods (_xxx format) and modify few
  existing ones to stay compliant with the latest ACPI Specification
  changes
- Improve existing tools/utilities and fix/clean up some problematic
  usages along with patching certain vulnerabilities

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../acpica/{acpica_20250807.bb =3D> acpica_20251212.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/acpica/{acpica_20250807.bb =3D> acpica_2025=
1212.bb} (96%)

diff --git a/meta/recipes-extended/acpica/acpica_20250807.bb b/meta/recip=
es-extended/acpica/acpica_20251212.bb
similarity index 96%
rename from meta/recipes-extended/acpica/acpica_20250807.bb
rename to meta/recipes-extended/acpica/acpica_20251212.bb
index f6ee3285a1f..812a62547bb 100644
--- a/meta/recipes-extended/acpica/acpica_20250807.bb
+++ b/meta/recipes-extended/acpica/acpica_20251212.bb
@@ -17,7 +17,7 @@ COMPATIBLE_HOST =3D "(i.86|x86_64|arm|aarch64).*-linux"
 DEPENDS =3D "m4-native flex-native bison-native"
=20
 SRC_URI =3D "git://github.com/acpica/acpica;protocol=3Dhttps;branch=3Dma=
ster;tag=3D${PV}"
-SRCREV =3D "aa98db3bd149fc1f8d2a3017cb05b6b1982c3296"
+SRCREV =3D "446be438238e9d339eed5182b807ac5f82df56c9"
=20
 inherit update-alternatives
=20
--=20
2.43.0


