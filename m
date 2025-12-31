Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14177EE644A
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 21:59:05 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.94396.1767218343463999111
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Dec 2025 13:59:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=On+ViMzx;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2025123121590191ecdc192e00020737-ej3fgx@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2025123121590191ecdc192e00020737
        for <openembedded-core@lists.openembedded.org>;
        Wed, 31 Dec 2025 22:59:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=5XJK17fe0FZ8aCgUeJ5hyEETTbN3JltPUajexqQjgvQ=;
 b=On+ViMzxymsggi7ka9gJlh2byRKHQoKICan+0Ty7GUnRhbAvHq4/6RiBNXm+6McMwoWyQa
 AK4yB9R8SwgInJ14+ba2e1YrjlXInARAYVGTQnn2D2NomUZ0dEiFktFtpx5hwAjZ16oJ59lk
 FTXv16ics587KsWt2RLQWxu2HmsOvvcICHG4V2x9Udh3fxPUyKlrLzGo+Z2ii84n+tuTkw1v
 UfeOaWpAgkxuHeScp1aQGh85NIeCKLpaVptf3lFfBaZCUfwpTFuZNG2Be7cGRXn7XcWJQhZK
 vuZ7yyPF1thLd4+b7fbGX4ciW2i3STOq9vzCX0RS4bK+SYtEVW2Q7kRw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] qemu: ignore CVE-2025-54566 and CVE-2025-54567
Date: Wed, 31 Dec 2025 22:58:51 +0100
Message-Id: <20251231215851.491588-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Dec 2025 21:59:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228750

From: Peter Marko <peter.marko@siemens.com>

These CVEs are not applicable to version 6.2.x as the vulnerable code
was introduced inly in 10.0.0.

Debian made the analysis, reuse their work.
* https://security-tracker.debian.org/tracker/CVE-2025-54566
* https://security-tracker.debian.org/tracker/CVE-2025-54567

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index fd1a8647df7..d7fb695e518 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -168,6 +168,9 @@ CVE_CHECK_IGNORE += "CVE-2023-1386"
 # virtio-snd was implemented in 8.2.0, so version 6.2.0 is not yet affected
 CVE_CHECK_IGNORE += "CVE-2024-7730"
 
+# These issues were introduced in v10.0.0-rc0
+CVE_CHECK_IGNORE += "CVE-2025-54566 CVE-2025-54567"
+
 COMPATIBLE_HOST:mipsarchn32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"

