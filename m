Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F875C021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 17:41:45 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.28799.1739986897543570097
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 09:41:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=ZOCOeYLp;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20250219174133eabde381e83be26df7-9xxsuy@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250219174133eabde381e83be26df7
        for <openembedded-core@lists.openembedded.org>;
        Wed, 19 Feb 2025 18:41:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=iJSFyejQcKipb8joBPnOvw40GcZvNUmORhGmJq7f3gA=;
 b=ZOCOeYLpQ52lZFzFSZl4x9BfmNV0Z0J2R4ZGOToQO/0T65pvhba+d7OKmKiK9efB7QFwJS
 /ZhYJwh8e80wf2r3uq+LvfbewteY/BwtYTZIkfVv3239E6Dk7MOQQbm9AI+ufAZwPFPVQCbZ
 zwT6D4R5Y5qWLCriYs1HM27gpL3TDNB7Smqo1Z+yupTLd3dxtdo8Ar7FKfWh2XmHMIaUkMbc
 LiLhZpxdQo9+qW36qrlLicJ/T79mfSQ86h/gAXxpj8asHwEj7RGWDq4LywYwJHrmA+O3CFPd
 yFr4qejUeIq3jRxtE7uB9nQvzy1P3azSq24ucPDeGuhlahkJPWmzuexA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 1/2] sassc: set status of CVE-2022-43357
Date: Wed, 19 Feb 2025 18:40:27 +0100
Message-Id: <20250219174028.3486899-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 17:41:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211721

From: Peter Marko <peter.marko@siemens.com>

When this recipe was copied from oe, last commit was missing.
https://git.openembedded.org/meta-openembedded/commit/?id=576b84263bac4dda26d84d116a9e7628a126f866

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/sass/sassc_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/sass/sassc_git.bb b/meta/recipes-support/sass/sassc_git.bb
index b52fc9de75..b7f57ca244 100644
--- a/meta/recipes-support/sass/sassc_git.bb
+++ b/meta/recipes-support/sass/sassc_git.bb
@@ -12,4 +12,6 @@ SRCREV = "66f0ef37e7f0ad3a65d2f481eff09d09408f42d0"
 S = "${WORKDIR}/git"
 PV = "3.6.2"
 
+CVE_STATUS[CVE-2022-43357] = "cpe-incorrect: this is CVE for libsass, not sassc wrapper"
+
 BBCLASSEXTEND = "native"

