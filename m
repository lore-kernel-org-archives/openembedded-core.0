Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3EE9CAC5A5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 14:06:20 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.12676.1758809179711039364
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 07:06:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=CLUpS33d;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202509251406171322dbb782000207cc-g2x7qb@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202509251406171322dbb782000207cc
        for <openembedded-core@lists.openembedded.org>;
        Thu, 25 Sep 2025 16:06:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=QctQrvhS6OA7DvYQeAIiZDkMTVV1LdcK7tztY4kSATA=;
 b=CLUpS33dIxbVaiM7Lu++atIIsK8piP6SYiTfvQOkWvGqqbTZI7p8ZfUF1GusT12P/xuV72
 4Jt9OIWmMKbLGs+mFYqUy+73sB9cejobYHd8xg6msHMxUe86SvVsJ450YJCCN76n9gh7pE8Z
 p7t7ehA/vKLoMYD8D8UkVNsbojs9WqUhr3m2LgJLpCziIm8X+VCfkPYm3jCuLllunbPmFHOv
 iEidKOw4/8TxajqqmjRro02+FD4wbfnvftmAOorZDHcVapsv2aJSQKOIIn946WmFZDeUACIj
 ZH7YSa1jxF4a9xXGlWmfDlS0aUpqAiPSfD5Qd4XW16Cn2DY1Qcy+2ydw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH 05/10] grub2: mark CVE-2024-2312 as not applicable
Date: Thu, 25 Sep 2025 16:05:09 +0200
Message-Id: <20250925140514.1103300-5-peter.marko@siemens.com>
In-Reply-To: <20250925140514.1103300-1-peter.marko@siemens.com>
References: <20250925140514.1103300-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 14:06:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224034

From: Ross Burton <ross.burton@arm.com>

This issue is specific to the peimage module that Ubuntu add, and is not
an upstream issue.

(From OE-Core rev: 8d2fe3f403e6435e1ffe122a6776381090752d8a)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-bsp/grub/grub2.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 1fe39a59d2d..0563e5f7616 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -43,6 +43,7 @@ SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154
 CVE_STATUS[CVE-2019-14865] = "not-applicable-platform: applies only to RHEL"
 CVE_STATUS[CVE-2023-4001]  = "not-applicable-platform: Applies only to RHEL/Fedora"
 CVE_STATUS[CVE-2024-1048]  = "not-applicable-platform: Applies only to RHEL/Fedora"
+CVE_STATUS[CVE-2024-2312]  = "not-applicable-platform: Applies only to Ubuntu"
 
 DEPENDS = "flex-native bison-native gettext-native"
 

