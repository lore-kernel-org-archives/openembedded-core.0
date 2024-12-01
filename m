Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C02D6D49788
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 18:54:33 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.156775.1733079271848830982
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 10:54:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=LIUu5t5I;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20241201185427f8efc4112100c1a753-qqr3dj@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20241201185427f8efc4112100c1a753
        for <openembedded-core@lists.openembedded.org>;
        Sun, 01 Dec 2024 19:54:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=DH+bKLP1YQiDF7R2Xt+Rneb05fFoLEvesXas/UT5czs=;
 b=LIUu5t5IAAxNZn2yl/IZh8OaVlT87NdVjtgL5CDN6uuo+gX24gUw8PsNb942D4AXZsExCH
 s74VNbZhpguHe5JfH/F4GZhOuqASq+YDywdNznQHV8R+Ir2/42Em38NBa+hC8rN9difalywY
 cYkYxvqq9ie3lBBy8SnDwhl+vuCQpzVaG2NJpJsLThvb3ajxlIpHOC1kxUX+KDvVc73ymmR6
 +zPBgi3Vev/aeXUuQC0uWardRpmUEen3YFVpO/TwCSUyWlG0OrYTDaG96giQhpa1UCS6UoNQ
 9rNaNrr1v1uoKtjfHGwoeA3K/2jkIsWgI9CyTgHSOnEt2FkvqHHq+o9g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 4/5] grub: ignore CVE-2024-1048 and CVE-2023-4001
Date: Sun,  1 Dec 2024 19:53:36 +0100
Message-Id: <20241201185337.2675566-5-peter.marko@siemens.com>
In-Reply-To: <20241201185337.2675566-1-peter.marko@siemens.com>
References: <20241201185337.2675566-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 18:54:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208117

From: Peter Marko <peter.marko@siemens.com>

Same was done in newer Yocto releases.
See commit: f99b25355133fe8f65a55737270e67ea10b79d52
See commit: 40cd768368167f81de5bb55e9ff0584035f4c1b4

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-bsp/grub/grub2.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 2718379474..3e96426b82 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -49,6 +49,8 @@ SRC_URI[sha256sum] = "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae
 CVE_CHECK_IGNORE += "CVE-2019-14865"
 # Applies only to SUSE
 CVE_CHECK_IGNORE += "CVE-2021-46705"
+# not-applicable-platform: Applies only to RHEL/Fedora
+CVE_CHECK_IGNORE += "CVE-2024-1048 CVE-2023-4001"
 
 DEPENDS = "flex-native bison-native gettext-native"
 
-- 
2.30.2


