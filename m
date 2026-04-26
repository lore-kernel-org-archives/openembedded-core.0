Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6CD3FF885E
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 18:51:14 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25128.1777229472257009533
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2026 11:51:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=EHEsGgis;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202604261851104bc62d4a06000207ba-aalzib@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202604261851104bc62d4a06000207ba
        for <openembedded-core@lists.openembedded.org>;
        Sun, 26 Apr 2026 20:51:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=eHbpNeYHOmemGxfaYrMIwISxHXTwMHA3Wy5nh08VjgA=;
 b=EHEsGgisHswkeFa+5EZsnhzzqUf10bkpxLB7xXXP0FVzTZN+Gni0070je8HvzSz4B4BGw4
 bVZ6H16eFS1gw9TGIMIYsaxe1HTq0ORhD08v+H4F39YVSIwhHyBvTjRsUsLzNPc2auG0p8HE
 MWhgZaxXo4BTGS13vYEoh7pvDSJG6e5pb0t0WWk/pxvQVUkQkWYBSKMgcpgzk+HKwz5ebMZs
 PPhTRsPjKnV0jHUeF0H/0hLQsg1r7vELlGEimcZ452K4fVVOL03LKDlonmH1TLSPYj0jLlA9
 C1d8DNZMDU3GNtxNnVPkLDfVQEE+99P+r1MRQ8zUuIX/RishCRTpQvSg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 5/6] ovmf: set status for 7 CVEs
Date: Sun, 26 Apr 2026 20:50:24 +0200
Message-ID: <20260426185025.13217-5-peter.marko@siemens.com>
In-Reply-To: <20260426185025.13217-1-peter.marko@siemens.com>
References: <20260426185025.13217-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2026 18:51:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235965

From: Peter Marko <peter.marko@siemens.com>

These reappeared after last update of sbom-cve-check tooling.
"fixed-in" release was determined by following links in Debian CVE
reports except CVE-2025-2295 which was taken from Yocto master CVE
patch.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index d731bca7f2..19bcc4a96f 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -48,6 +48,13 @@ CVE_STATUS[CVE-2019-14575] = "fixed-version: The CPE in the NVD database doesn't
 CVE_STATUS[CVE-2019-14586] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
 CVE_STATUS[CVE-2019-14587] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
 CVE_STATUS[CVE-2024-1298] = "fixed-version: fixed since edk2-stable202405"
+CVE_STATUS[CVE-2024-38796] = "fixed-version: fixed since edk2-stable202411"
+CVE_STATUS[CVE-2024-38797] = "fixed-version: fixed since edk2-stable202502"
+CVE_STATUS[CVE-2024-38798] = "fixed-version: fixed since edk2-stable202511"
+CVE_STATUS[CVE-2024-38805] = "fixed-version: fixed since edk2-stabe202508"
+CVE_STATUS[CVE-2025-2295] = "fixed-version: fixed since edk2-stable202505"
+CVE_STATUS[CVE-2025-2296] = "fixed-version: fixed since edk2-stable202505"
+CVE_STATUS[CVE-2025-3770] = "fixed-version: fixed since edk2-stable202508"
 
 inherit deploy
 

