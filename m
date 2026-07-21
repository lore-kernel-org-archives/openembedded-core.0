Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB3FCC4451C
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 19:00:41 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31080.1784660435309413599
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 12:00:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=NfXEpuOh;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20260721190032848dc3a701000207e7-5vgb7f@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260721190032848dc3a701000207e7
        for <openembedded-core@lists.openembedded.org>;
        Tue, 21 Jul 2026 21:00:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=0c4iSY5j8unDpWNEX2fQXCpERFn36Lr9Cm2QV6OMjzQ=;
 b=NfXEpuOh+1S3sTpd1QTMN2zYZ4kxq1pnFnIlvV18u51+pzCV3S8wg12PPztJYzcr8w033S
 plBo3WkACl5JAxJ5WsWRkOr5Z19CmWTFJydLEoTb/3rS8nWjAKubUcpL5v5gSKDqZr3ZVvMb
 sn5oXkxVYH9qMf7ljFMJXogWkSrTtwhAwlGQ5GkTFPxWz4f+Txh7BXu4NqUvDwmOpaDRoGsE
 kRLr7p86UlmwbxC5IVVsvDQ+0zfCag1qtNlkm+Q8R5e4WH3gtSN6KF8zqtnv6Aevia2uL2Za
 3HrbcLJxWhwfbP/HA8mRUINl5/j8xPSh/G0twQRPUNVSm4eqXqbLBdlw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 4/4] python3-ply: set status for CVE-2025-56005
Date: Tue, 21 Jul 2026 21:00:05 +0200
Message-ID: <20260721190005.49809-4-peter.marko@siemens.com>
In-Reply-To: <20260721190005.49809-1-peter.marko@siemens.com>
References: <20260721190005.49809-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 19:00:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241571

From: Peter Marko <peter.marko@siemens.com>

The CVE has tag disputed both in NVD [1] and cvelistV5 [2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-56005
[2] https://github.com/CVEProject/cvelistV5/blob/cve_2026-07-21_1700Z/cves/2025/56xxx/CVE-2025-56005.json#L63

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/python/python3-ply_3.11.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-ply_3.11.bb b/meta/recipes-devtools/python/python3-ply_3.11.bb
index 06393ac4fe..1058697fa3 100644
--- a/meta/recipes-devtools/python/python3-ply_3.11.bb
+++ b/meta/recipes-devtools/python/python3-ply_3.11.bb
@@ -16,4 +16,6 @@ RDEPENDS:${PN}:class-target += "\
 
 CVE_PRODUCT = "dabeaz:ply"
 
+CVE_STATUS[CVE-2025-56005] = "disputed: This CVE was disputed"
+
 BBCLASSEXTEND = "native nativesdk"

