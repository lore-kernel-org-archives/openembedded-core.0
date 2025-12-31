Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1505BEEB571
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 21:59:05 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.94395.1767218342116776835
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Dec 2025 13:59:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=mXC7VnbU;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-2025123121585834c4e356150002076d-r5plhu@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2025123121585834c4e356150002076d
        for <openembedded-core@lists.openembedded.org>;
        Wed, 31 Dec 2025 22:58:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=9fQ2/KNJLz+la1mpQ0A+XNHQGqbOl7MWqzLjSDFgB30=;
 b=mXC7VnbUGDb1IbIOfgc2+LEsQ3i3JiIGIbj3nVjkARqygLHrdx+MyXKvRDwyz4OAnH6NOR
 OdoTJWqzCyQOe7rISaawSu1BG7P6zkmGkXi2Qh1QVHxaaLGX0LNCC5RJhLCxyh9XywTG6wTW
 4YvMqer+sMHS6kgghzodopOYtVgDU9yZqX8jsCYAvMG8UXaQVHgv3TBhAMCKo17QkIIpik8s
 J0HKh7K9dr/SnV+LWUarp7FwSBZPRUv2UWzCWKaCJ3XQ5jPds0vCRWKJ246uAzOux/CPQnTt
 3B8TodpQOWxPIXkp+foq1KHz5mrhYHKhDfqX/wK8EVFDhy1GJfjbcn7g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] qemu: ignore CVE-2025-54566 and CVE-2025-54567
Date: Wed, 31 Dec 2025 22:58:43 +0100
Message-Id: <20251231215843.487608-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Dec 2025 21:59:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228749

From: Peter Marko <peter.marko@siemens.com>

These CVEs are not applicable to version 8.2.x as the vulnerable code
was introduced inly in 10.0.0.

Debian made the analysis, reuse their work.
* https://security-tracker.debian.org/tracker/CVE-2025-54566
* https://security-tracker.debian.org/tracker/CVE-2025-54567

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index dde3b0be139..748a32215e0 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -88,6 +88,9 @@ CVE_STATUS[CVE-2023-1386] = "disputed: not an issue as per https://bugzilla.redh
 
 CVE_STATUS[CVE-2024-7730] = "fixed-version: this is fixed in v8.2.7"
 
+CVE_STATUS[CVE-2025-54566] = "cpe-incorrect: This issue was introduced in v10.0.0-rc0"
+CVE_STATUS[CVE-2025-54567] = "cpe-incorrect: This issue was introduced in v10.0.0-rc0"
+
 COMPATIBLE_HOST:mipsarchn32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"

