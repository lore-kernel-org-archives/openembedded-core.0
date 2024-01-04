Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F409C47074
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 12:55:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.52971.1704372948037733889
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jan 2024 04:55:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02E37C15
	for <openembedded-core@lists.openembedded.org>; Thu,  4 Jan 2024 04:56:33 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D2ED73F64C
	for <openembedded-core@lists.openembedded.org>; Thu,  4 Jan 2024 04:55:46 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] oeqa/parselogs-ignores-qemuarmv5: add comments and organise
Date: Thu,  4 Jan 2024 12:55:44 +0000
Message-Id: <20240104125545.2022935-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 12:55:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193321

From: Ross Burton <ross.burton@arm.com>

Add a comment explaining why we need the jitterentropy ignore.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../oeqa/runtime/cases/parselogs-ignores-qemuarmv5.txt    | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuarmv5.txt =
b/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuarmv5.txt
index e5d526be21d..ed91107b7da 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuarmv5.txt
+++ b/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuarmv5.txt
@@ -1,6 +1,10 @@
+# Code is 2 JENT_ECOARSETIME: Timer too coarse for RNG.
+jitterentropy: Initialization failed with host not compliant with requir=
ements: 2
+
 # These should be reviewed to see if they are still needed
 mmci-pl18x: probe of fpga:05 failed with error -22
 mmci-pl18x: probe of fpga:0b failed with error -22
+
 OF: amba_device_add() failed (-19) for /amba/smc@10100000
 OF: amba_device_add() failed (-19) for /amba/mpmc@10110000
 OF: amba_device_add() failed (-19) for /amba/sctl@101e0000
@@ -10,6 +14,6 @@ OF: amba_device_add() failed (-19) for /amba/spi@101f40=
00
 OF: amba_device_add() failed (-19) for /amba/ssp@101f4000
 OF: amba_device_add() failed (-19) for /amba/fpga/sci@a000
 Failed to initialize '/amba/timer@101e3000': -22
-jitterentropy: Initialization failed with host not compliant with requir=
ements: 2
+
 clcd-pl11x: probe of 10120000.display failed with error -2
-arm-charlcd 10008000.lcd: error -ENXIO: IRQ index 0 not found
\ No newline at end of file
+arm-charlcd 10008000.lcd: error -ENXIO: IRQ index 0 not found
--=20
2.34.1


