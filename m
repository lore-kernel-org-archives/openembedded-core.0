Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B6B4C5B553
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 20:28:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2811.1748550493985627702
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 13:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 28CF52454
	for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 13:27:57 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 408103F673
	for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 13:28:13 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/9] recipetool: licenses.csv: Add mapping for BSD licenses
Date: Thu, 29 May 2025 21:27:55 +0100
Message-ID: <20250529202802.1198179-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250529202802.1198179-1-ross.burton@arm.com>
References: <20250529202802.1198179-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 20:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217439

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Add mapping for BSD license used by crucible.
Add mapping for BSD license used by golang.org/x/crypto.

Change-Id: Iea4c3575bc4a5e33b4dbd65a34439684e504ba82
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/lib/recipetool/licenses.csv | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/lib/recipetool/licenses.csv b/scripts/lib/recipetool=
/licenses.csv
index 80851111b31..ddc818f48c4 100644
--- a/scripts/lib/recipetool/licenses.csv
+++ b/scripts/lib/recipetool/licenses.csv
@@ -1,6 +1,7 @@
 0636e73ff0215e8d672dc4c32c317bb3,GPL-2.0-only
 12f884d2ae1ff87c09e5b7ccc2c4ca7e,GPL-2.0-only
 18810669f13b87348459e611d31ab760,GPL-2.0-only
+201414b6610203caed355323b1ab3116,BSD-3-Clause
 252890d9eee26aab7b432e8b8a616475,LGPL-2.0-only
 2d5025d4aa3495befef8f17206a5b0a1,LGPL-2.1-only
 3214f080875748938ba060314b4f727d,LGPL-2.0-only
@@ -13,6 +14,7 @@
 54c7042be62e169199200bc6477f04d1,BSD-3-Clause
 55ca817ccb7d5b5b66355690e9abc605,LGPL-2.0-only
 59530bdf33659b29e73d4adb9f9f6552,GPL-2.0-only
+5d4950ecb7b26d2c5e4e7b4e0dd74707,BSD-3-Clause
 5f30f0716dfdd0d91eb439ebec522ec2,LGPL-2.0-only
 6a6a8e020838b23406c81b19c1d46df6,LGPL-3.0-only
 751419260aa954499f7abaabaa882bbe,GPL-2.0-only
--=20
2.43.0


