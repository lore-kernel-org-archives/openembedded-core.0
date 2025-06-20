Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEE8EC7EE31
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 15:14:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.2673.1750432477091485235
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jun 2025 08:14:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20D3F22FA;
	Fri, 20 Jun 2025 08:14:17 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2AC173F673;
	Fri, 20 Jun 2025 08:14:36 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: christian.lindeberg@axis.com
Subject: [PATCH 03/12] files/license-hashes.csv: add more hashes
Date: Fri, 20 Jun 2025 16:14:20 +0100
Message-ID: <20250620151429.3210879-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620151429.3210879-1-ross.burton@arm.com>
References: <20250620151429.3210879-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 15:14:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219130

Add a slew of license hashes harvested by building some Go recipes in
meta-oe.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/files/license-hashes.csv | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/meta/files/license-hashes.csv b/meta/files/license-hashes.cs=
v
index 906660b85df..5e81dbcdec7 100644
--- a/meta/files/license-hashes.csv
+++ b/meta/files/license-hashes.csv
@@ -3,7 +3,8 @@
 0636e73ff0215e8d672dc4c32c317bb3,GPL-2.0-only
 063b5c3ebb5f3aa4c85a2ed18a31fbe7,GPL-2.0-only
 0a97f8e4cbaf889d6fa51f84b89a79f6,ISC
-0ceb9ff3b27d3a8cf451ca3785d73c71,BSD-3-Clause & MIT
+0c241922fc69330e2e5590de114f3bf5,BSD-3-Clause
+0ceb9ff3b27d3a8cf451ca3785d73c71,MIT
 0dd48ae8103725bd7b401261520cdfbb,BSD-3-Clause
 0e46634a01bfef056892949acaea85b1,BSD-3-Clause
 1034431802e57486b393d00c5d262b8a,Apache-2.0
@@ -13,16 +14,22 @@
 201414b6610203caed355323b1ab3116,BSD-3-Clause
 252890d9eee26aab7b432e8b8a616475,LGPL-2.0-only
 2b8c039b2b9a25f0feb4410c4542d346,BSD-2-Clause
+2d1c30374313ae40df7772dc92ef9fd5,GPL-3.0-only
 2d5025d4aa3495befef8f17206a5b0a1,LGPL-2.1-only
 3214f080875748938ba060314b4f727d,LGPL-2.0-only
+37acb030ba070680be4a9fcb57f2735a,MIT
 385c55653886acac3821999a3ccd17b3,Artistic-1.0 | GPL-2.0-only
+38be95f95200434dc208e2ee3dab5081,BSD-3-Clause
 393a5ca445f6965873eca0259a17f833,GPL-2.0-only
 3b83ef96387f14655fc854ddc3c6bd57,Apache-2.0
 3bf50002aefd002f49e7bb854063f7e7,LGPL-2.0-only
+3c91c17266710e16afdbb2b6d15c761c,Apache-2.0
 3debde09238a8c8e1f6a847e1ec9055b,LGPL-2.1-only
 4325afd396febcb659c36b49533135d4,GPL-2.0-only
 4c641f2d995c47f5cb08bdb4b5b6ea05,BSD-2-Clause
+4e2a8d8f9935d6a766a5879a77ddc24d,Apache-2.0
 4ee4feb2b545c2231749e5c54ace343e,BSD-3-Clause
+4efd8bdbab9cff00dcd75f2c3ee4e190,BSD-2-Clause
 4fbd65380cdd255951079008b364516c,LGPL-2.1-only
 50fab24ce589d69af8964fdbfe414c60,BSD-2-Clause
 54c7042be62e169199200bc6477f04d1,BSD-3-Clause
@@ -30,6 +37,7 @@
 59530bdf33659b29e73d4adb9f9f6552,GPL-2.0-only
 5d4950ecb7b26d2c5e4e7b4e0dd74707,BSD-3-Clause
 5f30f0716dfdd0d91eb439ebec522ec2,LGPL-2.0-only
+6551d79bf661eed41a50157513ee4ad6,BSD-3-Clause
 6a6a8e020838b23406c81b19c1d46df6,LGPL-3.0-only
 721f23a96ff4161ca3a5f071bbe18108,MIT
 7364d1e4653d3584181e9d22d81f275f,CC0-1.0
@@ -41,8 +49,10 @@
 7fbc338309ac38fefcd64b04bb903e34,LGPL-2.1-only
 80fa7b56a28e8c902e6af194003220a5,BSD-2-Clause
 85d8a977ee9d7c5ab4ac03c9b95431c4,MIT-0
+88073b6dd8ec00fe09da59e0b6dfded1,BSD-3-Clause
 88a4355858a1433fea99fae34a44da88,GPL-2.0-only
 8bd23871802951c9ad63855151204c2c,BSD-2-Clause
+8c6127b79304a5e0a5756d03c7a58766,MIT
 8ca43cbc842c2336e835926c2166c28b,GPL-2.0-only
 939cce1ec101726fa754e698ac871622,BSD-3-Clause
 94d55d512a9ba36caa9b7df079bae19f,GPL-2.0-only
@@ -53,8 +63,10 @@ a54a1a6a39e7f9dbb4a23a42f5c7fd1c,Apache-2.0
 a651bb3d8b1c412632e28823bb432b40,BSD-3-Clause
 a6f89e2100d9b6cdffcea4f398e37343,LGPL-2.1-only
 ad4e9d34a2e966dfe9837f18de03266d,GFDL-1.1-only
+ae6de3dee02712a1e55b280671be53bf,BSD-3-Clause
 b234ee4d69f5fce4486a80fdaf4a4263,GPL-2.0-only
 b27575459e02221ccef97ec0bfd457ae,Apache-2.0
+b278a92d2c1509760384428817710378,MPL-2.0
 b376d29a53c9573006b9970709231431,MIT
 b5f72aef53d3b2b432702c30b0215666,BSD-3-Clause
 b66384e7137e41a9b1904ef4d39703b6,Apache-2.0
@@ -63,12 +75,16 @@ bfe1f75d606912a4111c90743d6c7325,MPL-1.1-only
 c93c0550bd3173f4504b2cbd8991e50b,GPL-2.0-only
 d014fb11a34eb67dc717fdcfc97e60ed,GFDL-1.2-only
 d0b68be4a2dc957aaf09144970bc6696,MIT
+d0fd9ebda39468b51ff4539c9fbb13a8,BSD-3-Clause
 d32239bcb673463ab874e80d47fae504,GPL-3.0-only
+d44fdeb607e2d2614db9464dbedd4094,MPL-2.0
+d4eb2084b3083d2c275ec52ef4ba9ac1,BSD-3-Clause
 d7810fab7487fb0aad327b76f1be7cd7,GPL-2.0-only
 d8045f3b8f929c1cb29a1e3fd737b499,LGPL-2.1-only
 db979804f025cf55aabec7129cb671ed,LGPL-2.0-only
 e020ca655b06c112def28e597ab844f1,GFDL-1.3-only
 e659f77bfd9002659e112d0d3d59b2c1,BSD-2-Clause
+eb1e647870add0502f8f010b19de32af,AGPL-3.0-or-later
 eb723b61539feef013de476e68b5c50a,GPL-2.0-only
 ebb5c50ab7cab4baeffba14977030c07,GPL-2.0-only
 efe2cb9a35826992b9df68224e3c2628,EPL-1.0
--=20
2.43.0


