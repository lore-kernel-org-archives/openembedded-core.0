Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A60AC282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 18:18:43 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.17671.1741717116911827360
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 11:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=U0reNzMh;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20250311181834c4d4666ef843cc01ad-tailal@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20250311181834c4d4666ef843cc01ad
        for <openembedded-core@lists.openembedded.org>;
        Tue, 11 Mar 2025 19:18:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Qu83peykJUOWSOAykrPnTnQ9wCG11E37QkEU0tpvIiw=;
 b=U0reNzMhVc/3i1038z03yj+YXBGs+Wy3apbn51L2KHsHA7H1ziywxPy0+DCFP5E7X31YMd
 x96XRMYpxq/Yp3khiMABfQTLatwedZPKRJt653mBvvq6hYk8YNunwPLv6uZ9/6hIN3E0clqV
 yrhyQHG21NfN1cOoyBhVrS3Wv0svQqsJrgrhTn7YM6xevNnvPtoIFfNAZfuBdaFfJRZZmFx6
 ZCCv5DYV+LoKvOfl7zuc5/WVw4JMqT12E2nnbYM8hGj2U0fvYEdzX26toQ47HBJZTCgJi+rU
 m1t5degx0EG5Z7pmKaUxlcmgEDFhzaow+fhl/oT2jgABcmJGk8Lf/l3w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 01/17] grub: drop obsolete CVE statuses
Date: Tue, 11 Mar 2025 19:17:09 +0100
Message-Id: <20250311181725.8986-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 18:18:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212613

From: Peter Marko <peter.marko@siemens.com>

CVE-2021-46705 was needed only with 2.06
CVE-2023-4692 and CVE-2023-4693 were fixed in NVD DB meanwhile

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-bsp/grub/grub2.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 54c0e9bdd5..c160d15717 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -24,11 +24,8 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
 
 CVE_STATUS[CVE-2019-14865] = "not-applicable-platform: applies only to RHEL"
-CVE_STATUS[CVE-2021-46705] = "not-applicable-platform: Applies only to SUSE"
 CVE_STATUS[CVE-2023-4001]  = "not-applicable-platform: Applies only to RHEL/Fedora"
 CVE_STATUS[CVE-2024-1048]  = "not-applicable-platform: Applies only to RHEL/Fedora"
-CVE_STATUS[CVE-2023-4692]  = "cpe-incorrect: Fixed in version 2.12 already"
-CVE_STATUS[CVE-2023-4693]  = "cpe-incorrect: Fixed in version 2.12 already"
 
 DEPENDS = "flex-native bison-native gettext-native"
 

