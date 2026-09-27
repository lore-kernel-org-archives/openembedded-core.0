Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70096C98338
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 19:37:00 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42535.1790537816004149145
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 12:36:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Cf6liCLG;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202609271936536cf6252b2d00020789-lzpa3h@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202609271936536cf6252b2d00020789
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Sep 2026 21:36:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=p/3bW7fbeirS9sex09NoioETcV/uzs5rSNiJnJj8mKs=;
 b=Cf6liCLGGicpMTLSOcike98AVApGi5OfJyKUY4SbdW42QudWFv0BZ9wvijY93OTf7GMQw9
 zz6+1SGL7UPmFRD43w37UO+lXH846PchcHCDasqiv6lxiWb1GNJyfrxk+f09zVRUKSNlJBYP
 Qi1Sn+AqTW3yokwMEEUXpTQS8xJBLjD1YVXY47P9Rzyubw53ly6cZmSeVOU9x3kj9gdZvWBW
 l2g+3K3vaqcYp4pTRYEv+wiGJT0eggoC5zl8ysqb92ByQZML3GajcRuY1tV8qzUP73xNiRhR
 KqDHAuZ4QN/zVwP0eVtKLkM4ua/9xy3ioAGUPyeNzWPna4TFiNDAzIXw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 2/9] glibc: set status for CVE-2026-19542
Date: Sun, 27 Sep 2026 21:36:02 +0200
Message-ID: <20260927193609.359250-2-peter.marko@siemens.com>
In-Reply-To: <20260927193609.359250-1-peter.marko@siemens.com>
References: <20260927193609.359250-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 19:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246708

From: Peter Marko <peter.marko@siemens.com>

This CVE is fixed via commit [1] included in current hash.
It is backported commit of [2] mentioned to fix this CVE in [3].

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=d6ff274313d79feb864cc10eb775b91c817a67e9
[2] https://sourceware.org/git/?p=glibc.git;a=commit;h=e2789c46e3bfdcd67a82bea9946b315c179e83d3
[3] https://security-tracker.debian.org/tracker/CVE-2026-19542

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/glibc/glibc_2.44.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.44.bb b/meta/recipes-core/glibc/glibc_2.44.bb
index b4a5fbf8c3..d547f595ab 100644
--- a/meta/recipes-core/glibc/glibc_2.44.bb
+++ b/meta/recipes-core/glibc/glibc_2.44.bb
@@ -22,7 +22,7 @@ CVE_STATUS[CVE-2025-0577] = "not-applicable-platform: specific to RHEL patches"
 # when upgrading, clear CVE list but keep the variables
 CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
 CVE_STATUS_STABLE_BACKPORTS = "\
-    CVE-2026-5435 \
+    CVE-2026-5435 CVE-2026-19542 \
 "
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 

