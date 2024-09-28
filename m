Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E001CF6496
	for <webhook@archiver.kernel.org>; Sat, 28 Sep 2024 17:43:56 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.17948.1727545428175265203
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Sep 2024 10:43:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=oA/F9Y/s;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20240928174343e3cd1a00bad232c37d-o_3yos@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20240928174343e3cd1a00bad232c37d
        for <openembedded-core@lists.openembedded.org>;
        Sat, 28 Sep 2024 19:43:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=pGf7T1YlLqOQTWS/EK1K9dAMtdYP1S0la3/u3H0lvL0=;
 b=oA/F9Y/s4W7hZ7Wg6/0JzcXmRWRqxT2I3jkBK33p8iXf9E6mxvtidSS6mtTdHjOpKXZctN
 coKx3vpQ3lkw6NRoLgrQtKraz6hjNfToyw6P94xI0drdYuroaDVGvNoFOqI+DsOxcbhAiiBg
 h+H8YwYJZkMyQIVMy/UWod247JxHec9WWIMq2o+eom7+Ikxe457UL+/VGZ2+v6LQaWPjkNEJ
 oqVtin4ga+zkAajujRSnHRIDUTejltw/E+n73GaxJPm3KBEwsXwhkGf4kgCcLmVRHHLIrrhR
 87oosByZPjRRdrZOoHW/uAt6cWaQOdfxaXxFJCKwrrfd2JHhhhAtE1zA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 1/3] gnupg: Document CVE-2022-3219 and mark wontfix
Date: Sat, 28 Sep 2024 19:42:21 +0200
Message-Id: <20240928174223.3749001-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Sep 2024 17:43:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205045

From: Khem Raj <raj.khem@gmail.com>

(From OE-Core rev: f10f9c3a8d2c17d5a6c3f0b00749e5b34a66e090)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/gnupg/gnupg_2.4.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/gnupg/gnupg_2.4.4.bb b/meta/recipes-support/gnupg/gnupg_2.4.4.bb
index fff7d8c6da..ec75960235 100644
--- a/meta/recipes-support/gnupg/gnupg_2.4.4.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.4.4.bb
@@ -88,3 +88,4 @@ BBCLASSEXTEND = "native nativesdk"
 
 lcl_maybe_fortify:mipsarch = ""
 
+CVE_STATUS[CVE-2022-3219] = "upstream-wontfix: Upstream doesn't seem to be keen on merging the proposed commit - https://dev.gnupg.org/T5993"
-- 
2.30.2


