Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D95BC5AD58
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 18:44:00 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4585.1771613036813307695
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 10:43:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=MwpE8Msi;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20260220184354f9f82d84030002070b-zaa1ex@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260220184354f9f82d84030002070b
        for <openembedded-core@lists.openembedded.org>;
        Fri, 20 Feb 2026 19:43:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=chzPfPTrdqueTtntf0W4Zobq9eIEbhYoxqjh9LJcyQQ=;
 b=MwpE8Msirf6gqm5STOKPCgh1+CX1BZfdOedO+V7KXt2LIIJbde2tTjo1hbYT6doEGDSWrO
 jbpMqtg+GOU+4bOx7imZdscRqCZR4qh2be00a/3JdGIJjoVssbMgNJP2cEAcSnJVfBMclbC3
 aM/kYPsackqnkHcInunfq5Amv2Qj6+Z+rnAIAvsemWDHV8xIapWpYxsXBWIae3+3BjHXbv+t
 S+EYdTLAoelIwmscyO9rK310z/Apa4uzOUEvn2Tjdc/b3S+2/5iXeLT71s1PWkvTAGNUTeke
 vtnJ0OZF/WaCGdyzMuOB8WC8kr7q4RKsqIi4At6hUVWGO9Lei5tgpAzA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] vim: ignore CVE-2025-66476
Date: Fri, 20 Feb 2026 19:43:52 +0100
Message-Id: <20260220184352.17464-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 18:44:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231543

From: Peter Marko <peter.marko@siemens.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2025-66476

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/vim/vim_9.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/vim/vim_9.1.bb b/meta/recipes-support/vim/vim_9.1.bb
index f358e61132b..e536d4ce4bd 100644
--- a/meta/recipes-support/vim/vim_9.1.bb
+++ b/meta/recipes-support/vim/vim_9.1.bb
@@ -17,3 +17,6 @@ ALTERNATIVE_LINK_NAME[xxd] = "${bindir}/xxd"
 # in many places for _FORTIFY_SOURCE=2.  Security flags become part of CC.
 #
 lcl_maybe_fortify = "${@oe.utils.conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE=1',d)}"
+
+# not-applicable-platform: Issue only applies on Windows
+CVE_CHECK_IGNORE += "CVE-2025-66476"

