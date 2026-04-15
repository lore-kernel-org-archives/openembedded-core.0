Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3802F428DB
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 20:15:11 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4475.1776284100851622871
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 13:15:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=LuXwAFbx;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20260415201457935ea56eb80002073d-xvqhjy@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260415201457935ea56eb80002073d
        for <openembedded-core@lists.openembedded.org>;
        Wed, 15 Apr 2026 22:14:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=V2Z/xVwJt6nIHXcdkcff/kJsMcP6LwtEpphuJ2BgD0M=;
 b=LuXwAFbxnI1I7nJ6UwUFa8wDDGqmtN76K5DfYlb/eZGlVm2z7Xhnkd1ONSNYNiaOILB2vx
 Zx4uSCRLQBSxZ4unimk6PR+Yj7MoWW/gWEu8hsikNFCpivewgPutsaNCxeyMZ3NBf5mZl1Ta
 tPJUV74C4sbthwezSkCtsO26jia93HMf/kHBsVSCeFr9YNMsEinlDfJr31makviRPDWyvtxP
 GukUW4unvf+1HODFoO3BNAW5IPrsUMhQ44676sywXDrhiuxamDq0WkvHRIbD221P1x3Ri06m
 GgB1wTf3Ob/vCs4n+sOo/GgMg8qh0/s26V2F6Ylh+QgZLHwJZOtJuYsw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 1/2] grub: set status for CVE-2024-49504
Date: Wed, 15 Apr 2026 22:14:41 +0200
Message-ID: <20260415201442.2172352-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 20:15:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235327

From: Peter Marko <peter.marko@siemens.com>

Per [1] this is SUSE specific problem.

[1] https://security-tracker.debian.org/tracker/CVE-2024-49504

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-bsp/grub/grub2.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 8c62315e69..da67975290 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -27,6 +27,7 @@ CVE_STATUS[CVE-2019-14865] = "not-applicable-platform: applies only to RHEL"
 CVE_STATUS[CVE-2023-4001]  = "not-applicable-platform: Applies only to RHEL/Fedora"
 CVE_STATUS[CVE-2024-1048]  = "not-applicable-platform: Applies only to RHEL/Fedora"
 CVE_STATUS[CVE-2024-2312]  = "not-applicable-platform: Applies only to Ubuntu"
+CVE_STATUS[CVE-2024-49504] = "not-applicable-platform: Applies only to SUSE"
 
 DEPENDS = "flex-native bison-native gettext-native gawk-replacement-native"
 

