Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E98FF483F2
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 20:07:48 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4411.1774296462563851899
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 13:07:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=FuRg3Yjk;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20260323200740b7ab6fa5d10002076e-zn_esf@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260323200740b7ab6fa5d10002076e
        for <openembedded-core@lists.openembedded.org>;
        Mon, 23 Mar 2026 21:07:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=IyBgq8EU09lJLpGJVQlB3l8YOQLke/TTIBFKIJRFue4=;
 b=FuRg3Yjk+OhumSgdUN9eSaqTFi92od9T4ZiSPGQ56B1NNdQ4//Jgono+8klD265YTrqofc
 nfexHXvkCbPua0jwg4r+kcikg1UgckabBemyC98BIWKB3qEZW6UzGbobMp21j2PyOmc2509O
 JgtN2xqqFxatTSVaPuhZqLSh6ak7R9TZZ6EwRaBj4NCH2KFvlAyEQNDoeUjHCUypyqtG1TEH
 qSvx/IFuk2UGVXkqr0VxKjk1lWYF7cjTE7CT0EIheRpj3BxPSQAznDBv3ZF1x48uN0rr8yeB
 Dit3X4BKqY1u4IW/ntl0A8BmfqpMyCuyH0bWA0nN9f4DUV0E+fSC0QLg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-python][PATCH v2 2/3] python3-protobuf: upgrade 6.33.5 -> 6.33.6
Date: Mon, 23 Mar 2026 21:07:14 +0100
Message-Id: <20260323200715.11652-2-peter.marko@siemens.com>
In-Reply-To: <20260323200715.11652-1-peter.marko@siemens.com>
References: <20260323200715.11652-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 20:07:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233758

From: Peter Marko <peter.marko@siemens.com>

Release information [1] does not list python changes, but we should
match protobuf (C++) recipe version.

[1] https://github.com/protocolbuffers/protobuf/releases/tag/v33.6

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../{python3-protobuf_6.33.5.bb => python3-protobuf_6.33.6.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_6.33.5.bb => python3-protobuf_6.33.6.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb b/meta-python/recipes-devtools/python/python3-protobuf_6.33.6.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_6.33.6.bb
index af9ff85f20..bbc713442b 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_6.33.6.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "6ddcac2a081f8b7b9642c09406bc6a4290128fce5f471cddd165960bb9119e5c"
+SRC_URI[sha256sum] = "a6768d25248312c297558af96a9f9c929e8c4cee0659cb07e780731095f38135"
 
 CVE_PRODUCT += "google:protobuf protobuf:protobuf google-protobuf protobuf-python"
 CVE_STATUS[CVE-2026-0994] = "fixed-version: it is fixed in 6.33.5"

