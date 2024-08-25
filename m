Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C1EC5321E
	for <webhook@archiver.kernel.org>; Sun, 25 Aug 2024 21:44:06 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.40508.1724622235942855772
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Aug 2024 14:43:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=eD+/B436;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20240825214353012690a4a6bdacb3e2-d5y9m3@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20240825214353012690a4a6bdacb3e2
        for <openembedded-core@lists.openembedded.org>;
        Sun, 25 Aug 2024 23:43:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=BBGhwmheMQDQ5yr1yV1kI/QTLmpWCjKvZAPuIKmAo2E=;
 b=eD+/B436B0s64f6NYBcPf+m0KwmYq8D4oMfxRH9grGcy5Z05MZG96U3pslgafScSk3cfRE
 VOcTVzMImsJrGKZRxN2C4mvzLKRtpRQhZO6F0CyV32Z3lND2qeYxsD4y96yyi1q8/1/+/ngn
 k912w+HMD+19SilzDdLUvOPnJdJX74uZr5Hm+MyZGD2IQ0bYai1gAp+nzv0VMjFkCH235BNH
 9nU1Jf1Pa3WfE5vvihTlPaKNvsZdpWN8kqCqIpXorNXWRf0wORbiKEnX9ozCJvl3QeiN7U9y
 bhbPcM7DSsow4otJZJpiG22thCVJ8Z3Ysd8QW+o95hxVL3RNxY/nNtRw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] libyaml: Ignore CVE-2024-35325
Date: Sun, 25 Aug 2024 23:43:14 +0200
Message-Id: <20240825214314.2479295-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Aug 2024 21:44:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203733

This is similar CVE as the previous ones from the same author.
https://github.com/yaml/libyaml/issues/303 explain why this is misuse
(or wrong use) of libyaml.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/libyaml/libyaml_0.2.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libyaml/libyaml_0.2.5.bb b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
index 334d9113d2..aa7fc5e914 100644
--- a/meta/recipes-support/libyaml/libyaml_0.2.5.bb
+++ b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
@@ -18,6 +18,7 @@ inherit autotools
 DISABLE_STATIC:class-nativesdk = ""
 DISABLE_STATIC:class-native = ""
 
+CVE_STATUS[CVE-2024-35325] = "upstream-wontfix: Upstream thinks this is a misuse (or wrong use) of the libyaml API - https://github.com/yaml/libyaml/issues/303"
 CVE_STATUS[CVE-2024-35326] = "upstream-wontfix: Upstream thinks there is no working code that is exploitable - https://github.com/yaml/libyaml/issues/302"
 CVE_STATUS[CVE-2024-35328] = "upstream-wontfix: Upstream thinks there is no working code that is exploitable - https://github.com/yaml/libyaml/issues/302"
 
-- 
2.30.2


