Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C9ECA0EFC
	for <webhook@archiver.kernel.org>; Sun, 24 Aug 2025 14:05:41 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.17313.1756044337267275871
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 07:05:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=RltGtnWB;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20250824140533f6362b9cdf8aac51cc-gdl8l8@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20250824140533f6362b9cdf8aac51cc
        for <openembedded-core@lists.openembedded.org>;
        Sun, 24 Aug 2025 16:05:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=EtFOA+fq1cOiRcfeSpVojzznF7INmuS+yByq1I5xTfY=;
 b=RltGtnWBWj3Rr9r/crvYyfBWUh/UAHBSPFqyZF7SBn17QZ9oSPBHP9hRDtZ9SoUJHBt48c
 d7Vl7g3zqNFmq3c12Y2cZjosTM4mcXDTGmeMyS1pYT9NzOuhXbA3tuAWfQzWFzS9gNJrrwqW
 BI2FPQfIR1KZv7ficoeKUIRAwe+wjhA5n4jyx/RdY0Q4/oHKXMHpRx5M/OW4a0mhqPVvnvJ0
 Iu1ypaGNTlePcjAPpilVHk4GnGYNLqIyQZel0ZSjizXie/ty0ql/SAj1u5poK5mZ6PCC/4vZ
 C0gzXQOOnikHz9QkfGQRqirmKuxkJyMTBQYYZCPVUf+qHTu2qlSWpHSw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] qemu: set ststus of CVE-2024-7730 to fixed
Date: Sun, 24 Aug 2025 16:04:45 +0200
Message-Id: <20250824140445.1095253-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 14:05:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222378

From: Peter Marko <peter.marko@siemens.com>

This was backported to v8.2.7 and also it is mentioned in commit
upgrading qemu in oe-core.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 38ed637b93..220f0a161c 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -84,6 +84,8 @@ CVE_STATUS[CVE-2024-6505] = "fixed-version: this CVE is fixed since 9.1.0"
 
 CVE_STATUS[CVE-2023-1386] = "disputed: not an issue as per https://bugzilla.redhat.com/show_bug.cgi?id=2223985"
 
+CVE_STATUS[CVE-2024-7730] = "fixed-version: this is fixed in v8.2.7"
+
 COMPATIBLE_HOST:mipsarchn32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"

