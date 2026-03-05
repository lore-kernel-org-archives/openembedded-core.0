Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E5BAF47CB9
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 19:11:57 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52267.1772737907901101722
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 11:11:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=aSYuS/wc;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20260305191145ad7319d97f000207d0-ewmc6s@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260305191145ad7319d97f000207d0
        for <openembedded-core@lists.openembedded.org>;
        Thu, 05 Mar 2026 20:11:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=5m54dYuQh8w3FrhIyf2gRasSY6nwpWczDj66rXriZFY=;
 b=aSYuS/wcyor6dB8oQQeAkedjZ/mGHK1zx6qdKOuCmjxvL9rINk8OGrzap6CgubBsICYB1s
 QmDFSis+xv4KrMETh1d483l2e23TI/zZFEgFa8f+bIZE4cNZ8APJEg0Pt8f6RFRl0ypa7I7B
 Mlr/zczw1efCzVqb9WsLem3BKSQgHMpek8OJLdRXA8AoWmU/jsN2xC7nFI2OcPQCLMgwOgVU
 JJTEKvWDuhc4i3AZ9mOa1pSAakFmID4uszaI2da2G2II1cVX5gG0d6bVgmRu/PLdrM+O9u9V
 1MMJPy53uZAd28F69dwH83lJdA4S7IqEMKsoBOg38xsOc9t1rEz6hhlA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][whinlatter][PATCH] libpam: set status for CVE-2024-10041
Date: Thu,  5 Mar 2026 20:11:43 +0100
Message-Id: <20260305191143.1520531-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 19:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232513

From: Peter Marko <peter.marko@siemens.com>

This CVE was fixed in v1.6.1 (per [1]).
NVD tracks it as version-less CVE for RedHat.

[1] https://security-tracker.debian.org/tracker/CVE-2024-10041

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/pam/libpam_1.7.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/pam/libpam_1.7.1.bb b/meta/recipes-extended/pam/libpam_1.7.1.bb
index 8d9ea27028..cd8de7d3d7 100644
--- a/meta/recipes-extended/pam/libpam_1.7.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.7.1.bb
@@ -170,3 +170,5 @@ CONFFILES:${PN}-runtime += "${sysconfdir}/security/limits.conf"
 GITHUB_BASE_URI = "https://github.com/linux-pam/linux-pam/releases"
 
 CVE_PRODUCT = "linux-pam"
+
+CVE_STATUS[CVE-2024-10041] = "fixed-version: finxes since v1.6.1"

