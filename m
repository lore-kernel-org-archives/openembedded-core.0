Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 899DBC25B78
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 21:38:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.2760.1716413922260998796
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 14:38:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCDDCDA7
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 14:39:05 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8361C3F641
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 14:38:41 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] pciutils: upgrade to 3.12.0
Date: Wed, 22 May 2024 21:38:39 +0000
Message-Id: <20240522213839.4133583-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240522213839.4133583-1-ross.burton@arm.com>
References: <20240522213839.4133583-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 21:38:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199773

b5d2388 Update pci.ids to today's snapshot
9f3d614 libpci: hwdb: Remove ID_SUBSYSTEM and ID_GEN_SUBSYSTEM usage from=
 pci_id_hwdb_lookup()
1836a2d libpci: ecam: Fix scanning of Extended BIOS Data Area for ACPI RS=
DP
a34006f Makefile: Pass CFLAGS also when linking executable
4c392dc pci.h: Document PCI_FILL_xxx flags
f305bfe lspci.man: update the path used to store the cached files.
9b31027 sysfs: Avoid close() potentially clobbering errno
651a352 lspci: Add TEE-IO extended capability bit
42fc426 ls-ecaps: Add decode support for IDE Extended Capability

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../pciutils/{pciutils_3.11.1.bb =3D> pciutils_3.12.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/pciutils/{pciutils_3.11.1.bb =3D> pciutils_3.12.=
0.bb} (95%)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.11.1.bb b/meta/recipes-=
bsp/pciutils/pciutils_3.12.0.bb
similarity index 95%
rename from meta/recipes-bsp/pciutils/pciutils_3.11.1.bb
rename to meta/recipes-bsp/pciutils/pciutils_3.12.0.bb
index 5a9d72af3a2..7e474a3f338 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.11.1.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.12.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa9=
54499f7abaabaa882bbe"
 DEPENDS =3D "make-native"
=20
 SRC_URI =3D "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.=
tar.xz"
-SRC_URI[sha256sum] =3D "3f472ad864473de5ba17f765cc96ef5f33e1b730918d3add=
a6f945a2a9290df4"
+SRC_URI[sha256sum] =3D "f185d116d5ff99b797497efce8f19f1ee8ccc5a668b97a15=
9e3d13472f674154"
=20
 inherit multilib_header pkgconfig update-alternatives
=20
--=20
2.34.1


