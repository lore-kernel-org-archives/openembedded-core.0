Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E66C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 18:11:12 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.17447.1741716662957727677
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 11:11:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=NI0T9wHe;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20250311181059424fe6a58490ef7ee3-gkjjn_@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250311181059424fe6a58490ef7ee3
        for <openembedded-core@lists.openembedded.org>;
        Tue, 11 Mar 2025 19:11:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=nHxhH8JiKDpXJ592XF5wO1uYrwOrmfeSW4jXdSLKb9s=;
 b=NI0T9wHeGvyyWDxAM7St7vQpBysjRfWBIBSGWA6tJSd615VfWrBM6nAIpzcceyfIVwYrMB
 5og3FaTMqCArNV2N53he9v2Imod7/IXodqLwyTuNxE/5f95H1Gph2mrdBsifHxUvhvL2Hdoq
 DsvIA4Pk2G4fv0bV5+RZKGEnW54L5y9OBj3G8O4C8AlVHRJu5+BFvHPyo3MNZWEHjgudTXgK
 0roxOe7ZbwfJgDHmvO7rs7b3vCzb276if+30ieb7/vvMjXynq/XTMTN1OiYAHkBA7wNj/9fC
 BxFLkgpZCuQE1JCxjlwR/QAMbnWs1TIPA+s679914W/j5SD05tT3Xa9w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 01/17] grub: drop obsolete CVE statuses
Date: Tue, 11 Mar 2025 19:09:44 +0100
Message-Id: <20250311181000.8582-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 18:11:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212578

From: Peter Marko <peter.marko@siemens.com>

CVE-2021-46705 was needed only with 2.06
CVE-2023-4692 and CVE-2023-4693 were fixed in NVD DB meanwhile

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-bsp/grub/grub2.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 26bcb5197e..a327e7ebdf 100644
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
 

