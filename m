Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6213CAC5A7
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 14:06:40 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.12463.1758809195173551091
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 07:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=srek1AKS;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20250925140633113a40fcb90002076d-myeoxl@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250925140633113a40fcb90002076d
        for <openembedded-core@lists.openembedded.org>;
        Thu, 25 Sep 2025 16:06:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=nAaVm0o/nY9ugs2PjFHFQ2mh51ld/ZFZwJye6IxZeck=;
 b=srek1AKSBYrg+3lzIdojQvJ+C55jBlkm3AkwBeIslc3AGnoe8rDHTXIq80BJnnUfisO9rY
 ElB5aTGna9/+fUPDAOEB4y2s5Vt6Vm+1toHHPPh6ci4jmDSe8XOz1xglt+8AgmSxzh5osYcB
 GJ4tHQYRuA9dG4zL+A5+p4FtILNAmRjF1PbPuTRBLK8Fu27RGff3c/2ikNaARYqiUlH2wMoc
 n8IFvMW5iW9BcLnMcuAwT0qS0MXnQnc+Ngjf7Nu9i6GnGU0dwtwdsLULlAc33uCBytDZxmiV
 HKSiD0jpYK48PR2d5NJV/ClVvQk+JopXhjGlp2abHH/N7tU9Hy/gAzRw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH 08/10] tiff: ignore CVE-2025-8851
Date: Thu, 25 Sep 2025 16:05:12 +0200
Message-Id: <20250925140514.1103300-8-peter.marko@siemens.com>
In-Reply-To: <20250925140514.1103300-1-peter.marko@siemens.com>
References: <20250925140514.1103300-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 14:06:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224037

From: Peter Marko <peter.marko@siemens.com>

This is fixed in v4.7.0, however cve_check cannot match it as NVD says
"Up to (excluding) 2024-08-11".

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/libtiff/tiff_4.7.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
index 2155ac8df45..fd383e3d6a3 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
@@ -28,6 +28,7 @@ CVE_STATUS[CVE-2015-7313] = "fixed-version: Tested with check from https://secur
 CVE_STATUS[CVE-2023-52356] = "fixed-version: Fixed since 4.7.0, NVD tracks this as version-less vulnerability"
 CVE_STATUS[CVE-2023-6228] = "fixed-version: Fixed since 4.7.0, NVD tracks this as version-less vulnerability"
 CVE_STATUS[CVE-2023-6277] = "fixed-version: Fixed since 4.7.0, NVD tracks this as version-less vulnerability"
+CVE_STATUS[CVE-2025-8851] = "fixed-version: Fixed since 4.7.0, NVD tracks this as fixed in 2024-08-11 vulnerability"
 
 inherit autotools multilib_header
 

