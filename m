Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 423DBC5B555
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 20:28:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2812.1748550495363949487
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 13:28:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E59E2574
	for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 13:27:58 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AF20B3F673
	for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 13:28:14 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/9] scripts/recipetool/licenses.csv: add more licenses
Date: Thu, 29 May 2025 21:27:57 +0100
Message-ID: <20250529202802.1198179-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250529202802.1198179-1-ross.burton@arm.com>
References: <20250529202802.1198179-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 20:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217441

Some more hashes for some Go modules that I found in the wild.

This method of license identification is not scaling...

Ross
---
 scripts/lib/recipetool/licenses.csv | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/lib/recipetool/licenses.csv b/scripts/lib/recipetool=
/licenses.csv
index ddc818f48c4..16397e85546 100644
--- a/scripts/lib/recipetool/licenses.csv
+++ b/scripts/lib/recipetool/licenses.csv
@@ -1,6 +1,9 @@
+02d4002e9171d41a8fad93aa7faf3956,BSD-3-Clause
 0636e73ff0215e8d672dc4c32c317bb3,GPL-2.0-only
+0dd48ae8103725bd7b401261520cdfbb,BSD-3-Clause
 12f884d2ae1ff87c09e5b7ccc2c4ca7e,GPL-2.0-only
 18810669f13b87348459e611d31ab760,GPL-2.0-only
+19cbd64715b51267a47bf3750cc6a8a5,Apache-2.0
 201414b6610203caed355323b1ab3116,BSD-3-Clause
 252890d9eee26aab7b432e8b8a616475,LGPL-2.0-only
 2d5025d4aa3495befef8f17206a5b0a1,LGPL-2.1-only
@@ -10,6 +13,7 @@
 3b83ef96387f14655fc854ddc3c6bd57,Apache-2.0
 3bf50002aefd002f49e7bb854063f7e7,LGPL-2.0-only
 4325afd396febcb659c36b49533135d4,GPL-2.0-only
+4ee4feb2b545c2231749e5c54ace343e,BSD-3-Clause
 4fbd65380cdd255951079008b364516c,LGPL-2.1-only
 54c7042be62e169199200bc6477f04d1,BSD-3-Clause
 55ca817ccb7d5b5b66355690e9abc605,LGPL-2.0-only
@@ -20,14 +24,17 @@
 751419260aa954499f7abaabaa882bbe,GPL-2.0-only
 7fbc338309ac38fefcd64b04bb903e34,LGPL-2.1-only
 8ca43cbc842c2336e835926c2166c28b,GPL-2.0-only
+939cce1ec101726fa754e698ac871622,BSD-3-Clause
 94d55d512a9ba36caa9b7df079bae19f,GPL-2.0-only
 9ac2e7cff1ddaf48b6eab6028f23ef88,GPL-2.0-only
 9f604d8a4f8e74f4f5140845a21b6674,LGPL-2.0-only
+a651bb3d8b1c412632e28823bb432b40,BSD-3-Clause
 a6f89e2100d9b6cdffcea4f398e37343,LGPL-2.1-only
 b234ee4d69f5fce4486a80fdaf4a4263,GPL-2.0-only
 bbb461211a33b134d42ed5ee802b37ff,LGPL-2.1-only
 bfe1f75d606912a4111c90743d6c7325,MPL-1.1-only
 c93c0550bd3173f4504b2cbd8991e50b,GPL-2.0-only
+d0b68be4a2dc957aaf09144970bc6696,MIT
 d32239bcb673463ab874e80d47fae504,GPL-3.0-only
 d7810fab7487fb0aad327b76f1be7cd7,GPL-2.0-only
 d8045f3b8f929c1cb29a1e3fd737b499,LGPL-2.1-only
--=20
2.43.0


