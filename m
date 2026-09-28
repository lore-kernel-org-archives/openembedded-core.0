Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C159DCA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 19:45:11 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67522.1790624706184349889
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 12:45:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=DrRGBCiY;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202609281945046c687f643d000207b2-qe5_bs@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202609281945046c687f643d000207b2
        for <openembedded-core@lists.openembedded.org>;
        Mon, 28 Sep 2026 21:45:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=hMvZ5LY9/EZlPfTLsSkJSZqlfvzD/JuqM+OkobFEb08=;
 b=DrRGBCiYfuPO3YcpVR4rBQZlCvMbMF1nJlWdh4/fig0IDTRG6YAPvtcuc//BqnceTxcJ/n
 QjL4sk2Sh21gIKDtqt2+TPExgdylRdgNuK5F0GYjtVkmkd+NjBFZwZWP1lVHMDpGMC5cwQiB
 buBPH0LDoKRtdGZ1bnrhz2YMw9kYYZpab3J+ZjDx7aEE0DtZFd0la2nTvLpA4ki7yr4SWA2B
 5RL0g6vp7QSDk1yrKsWt4GNmUWqZQNe+n8Cg+aAWQIlbIs00VlcyzHjGNkCINxVk6l2u3faa
 i5m2HyQpJ6hZfLG3TknODyshdtfn/wjWDO5CqUlleh1YAIzgt3eX7S/A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 2/3] openssh: set status for CVE-2026-55655
Date: Mon, 28 Sep 2026 21:44:44 +0200
Message-ID: <20260928194445.38129-2-peter.marko@siemens.com>
In-Reply-To: <20260928194445.38129-1-peter.marko@siemens.com>
References: <20260928194445.38129-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 19:45:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246799

From: Peter Marko <peter.marko@siemens.com>

Per [1] and [2] this this is only problem in RedHet patches.

[1] https://security-tracker.debian.org/tracker/CVE-2026-55655
[2] https://ubuntu.com/security/CVE-2026-55655

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 9ea8649149e711668b85c7e35cb7c259437e8c0e)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/openssh/openssh_9.6p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index ac8b60049bb..d36d62e8f8b 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -59,6 +59,7 @@ CVE_STATUS[CVE-2023-51767] = "upstream-wontfix: It was demonstrated on modified
 CVE_STATUS[CVE-2026-3497] = "not-applicable-platform: Only affects GSSAPI Key Exchange patches used by some Linux distributions and does not exist in upstream openssh."
 CVE_STATUS[CVE-2026-59998] = "${@bb.utils.contains('PACKAGECONFIG', 'kerberos', 'unpatched', 'not-applicable-config: GSSAPI/Kerberos support is disabled in the default OpenSSH configuration', d)}"
 CVE_STATUS[CVE-2026-55653] = "not-applicable-platform: Only applies to RHEL FIPS patches."
+CVE_STATUS[CVE-2026-55655] = "not-applicable-platform: Only applies to RHEL patches."
 
 PAM_SRC_URI = "file://sshd"
 

