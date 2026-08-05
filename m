Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DBAC55ABA
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 17:29:34 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1113.1785950970095656161
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 10:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=BfYpluIb;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202608051729289b02c1f1a500020794-ul71ox@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202608051729289b02c1f1a500020794
        for <openembedded-core@lists.openembedded.org>;
        Wed, 05 Aug 2026 19:29:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=pYUmKjiZOvMLH6SWMFvoHxsvMAJykmP4rJ44xvIbth4=;
 b=BfYpluIb7o8oHepWzYKNcQjwid9ZamDFSNCQ1Ake5R9ESnxAVNt8852cKSwFqwkSl+k85m
 /lEtBAP8oP1zuhCt45ucSiafS2i6EzZNbBLeJfsOqg55D/Z6ML+fTEzTyJFQkP1pTif62ftE
 2fzgg+dWzH5n1tfi/8SbwpOiy1ICOA7T++Em+DmJ6kHT0ThOTasOt4CIXA5zzsxfAOVkRuUx
 90cN/G9IBZOgtVBhCyr9CqkONcDGovE3oVkxBw1GaODkhAvDLLaTjtbC8+qQUTHHOcnBc4T9
 j0I2Lbft4Wq08mojC2qrFVUB/sCrCEg24Qtqp50TQnU15Zl2+IA8uygg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 7/7] ppp: set status for CVE-2020-15704
Date: Wed,  5 Aug 2026 19:28:40 +0200
Message-ID: <20260805172840.202825-7-peter.marko@siemens.com>
In-Reply-To: <20260805172840.202825-1-peter.marko@siemens.com>
References: <20260805172840.202825-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 17:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242886

From: Peter Marko <peter.marko@siemens.com>

New version of sbom-cve-check makes more torough version validation
and version strings with distro specific suffix is no longer accepted,
thus leaving some CVEs without version to compare (no-version-ranges).

Per [1] this is Ubuntu-specific issue.

[1] https://security-tracker.debian.org/tracker/CVE-2020-15704

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/ppp/ppp_2.5.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.3.bb b/meta/recipes-connectivity/ppp/ppp_2.5.3.bb
index 3718fabbe8..1815782169 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.5.3.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.5.3.bb
@@ -78,3 +78,4 @@ SUMMARY:${PN}-l2tp     = "Plugin for PPP for l2tp support"
 SUMMARY:${PN}-dhcpv6relay     = "Plugin which can be used to provide IPv6 RAs to the remote side and relay the subsequent incoming DHCPv6 requests to a DHCPv6 server"
 SUMMARY:${PN}-tools    = "Additional tools for the PPP package"
 
+CVE_STATUS[CVE-2020-15704] = "not-applicable-platform: specific to Ubuntu"

