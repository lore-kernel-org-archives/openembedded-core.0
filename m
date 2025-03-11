Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04394C2BA1B
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 18:15:23 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.17559.1741716914841485370
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 11:15:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=CATsgWD/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20250311181512088d8ad160997bb6a9-_gibsc@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250311181512088d8ad160997bb6a9
        for <openembedded-core@lists.openembedded.org>;
        Tue, 11 Mar 2025 19:15:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=gj3TEaZkCIbT1+3phvQF7IXqNz77k4G42XbBtPsxHNo=;
 b=CATsgWD/TM98jlpSJaBBck2lsNUvb0v8hBLSP2lnGrNSk1+uld3p1DFlBbq/qBauucunuG
 zZdfREdqzkWdPXFaB/XeVOktovY2YT9+55p2WWvUwXSdPcMOAnhblFmpEGx9S6UJDhtFnca0
 8E2xRV9f86AtgwDIzg22zAH0k/0quFL+UPOuInBq64RBnzor1apMVqYUROF58NtOHiNkLoYU
 3D9TUxALzGpHiC2DlaV/dEQxI6ojY1He8rmlKgC3vFhHpN7jc3q2T4MGjbd/FxPcfEjNQmBC
 eYIISpA4pRkbEjaUyafL1YN/pWZiPb4GTNLxNC3fhuNfOJzdk4JUnftA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][styhead][PATCH 01/17] grub: drop obsolete CVE statuses
Date: Tue, 11 Mar 2025 19:14:08 +0100
Message-Id: <20250311181424.8837-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 18:15:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212595

From: Peter Marko <peter.marko@siemens.com>

CVE-2021-46705 was needed only with 2.06
CVE-2023-4692 and CVE-2023-4693 were fixed in NVD DB meanwhile

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-bsp/grub/grub2.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 07b4000e04..c93b9594c8 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -23,11 +23,8 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
 
 CVE_STATUS[CVE-2019-14865] = "not-applicable-platform: applies only to RHEL"
-CVE_STATUS[CVE-2021-46705] = "not-applicable-platform: Applies only to SUSE"
 CVE_STATUS[CVE-2023-4001]  = "not-applicable-platform: Applies only to RHEL/Fedora"
 CVE_STATUS[CVE-2024-1048]  = "not-applicable-platform: Applies only to RHEL/Fedora"
-CVE_STATUS[CVE-2023-4692]  = "cpe-incorrect: Fixed in version 2.12 already"
-CVE_STATUS[CVE-2023-4693]  = "cpe-incorrect: Fixed in version 2.12 already"
 
 DEPENDS = "flex-native bison-native gettext-native"
 

