Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E3B2C369A2
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 16:41:25 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.335.1744130483682751328
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 09:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=VInHRjcC;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2025040816412026766cfb03116ca115-ltymlw@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2025040816412026766cfb03116ca115
        for <openembedded-core@lists.openembedded.org>;
        Tue, 08 Apr 2025 18:41:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=CbP+pkuPOGAipsizx9J/h+Yx/fblnAIc/uGmFDxNsuM=;
 b=VInHRjcCmpKvGk29xIpvwRV0f7ZGv2bG+Y35LAadXE5PCU+MCPHEnwTcgJD/Qu8/PM7evG
 m023KXjF52TXkUkOuLIWkCnhM+wCLRqwNGeVhCCLLCFWNrV/8YJqkUyctBW5eXFWhcplnEXv
 e0YJO73TDf/4bRpYG34LcwHz+anNH0MMygXqcTwHSyK9hNdIwyX2O2Uc7IaE0lXIBkucpwH/
 RTTq3UimCeJuPw7ldZKpCG1IH6HIsoDjZQroPR4xB+qN16zSDg/o8+3pQW0aVkAeG/mQgswF
 H3JtV9OwHVA7z5pzlCEhCVCxCimxr0rNp9pztshwQmpzsoQQ5HXm3BaA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Madhu Marri <madmarri@cisco.com>,
	Steve Sakoman <steve@sakoman.com>
Subject: [OE-core][kirkstone][PATCH] qemu 8.2.7: ignore CVE-2023-1386
Date: Tue,  8 Apr 2025 18:40:30 +0200
Message-Id: <20250408164030.56024-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 16:41:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214548

From: Peter Marko <peter.marko@siemens.com>

Upstream Repository: https://gitlab.com/qemu-project/qemu.git

Bug Details:  https://nvd.nist.gov/vuln/detail/CVE-2023-1386
Type: Security Advisory
CVE: CVE-2023-1386
Score: 3.3

Analysis:
- According to redhat[1] this CVE has closed as not a bug.

Reference:
[1] https://bugzilla.redhat.com/show_bug.cgi?id=2223985

(From OE-Core rev: 6a5d9e3821246c39ec57fa483802e1bb74fca724)

Signed-off-by: Madhu Marri <madmarri@cisco.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>

(Converted to old CVE_CHECK_IGNORE syntax)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index bee30cd56f..cae33459e6 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -161,6 +161,9 @@ CVE_CHECK_IGNORE += "CVE-2023-2680"
 #       due to the rocker device not falling within the virtualization use case.
 CVE_CHECK_IGNORE += "CVE-2022-36648"
 
+# disputed: not an issue as per https://bugzilla.redhat.com/show_bug.cgi?id=2223985
+CVE_CHECK_IGNORE += "CVE-2023-1386"
+
 COMPATIBLE_HOST:mipsarchn32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"

