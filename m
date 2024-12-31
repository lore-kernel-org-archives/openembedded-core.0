Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A8CE77194
	for <webhook@archiver.kernel.org>; Tue, 31 Dec 2024 21:26:21 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.3492.1735680378413751084
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Dec 2024 13:26:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=nYvfd0lT;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202412312126207f0a0e8a3ebfc21a4e-a4w7u4@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202412312126207f0a0e8a3ebfc21a4e
        for <openembedded-core@lists.openembedded.org>;
        Tue, 31 Dec 2024 22:26:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=VYK91UfnNid+pEf0tsRKOirmsUffqk0nrxv8vzzUCKk=;
 b=nYvfd0lTRnENiGEcx6J5rB6MX2YHHAPBmIyvaPLsuUA4OqjRwqZXawDK7Aajj4gqFbe+ue
 bHMrnURoV+0wvyey36t/qBMoN6mwomyScE88Ozr7RJiDLFhHZ2PUucMOPexK/ZFtb2NEg9Am
 dhoUSHM+QQQQ0Krnnvs4JNs+Qo7mRJ+d7UylWG+LYIutRNsw4NjsH1jRXjK1ZUyfHxszmf7H
 D7jN5D6reer0JbcKx6m7BHJcEc1ai1Qhl+ycUB2mMSQRPH19YpfdTwyeafYxH1g1Kzchtn9q
 jpSYkPpmlBfG3JaAtPc+dyJxneft3RGjnRIM0UF2hYjIK2PDDwAAvguQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 4/5] gstreame1.0: ignore CVEs from gstreamer1.0-plugins-bad
Date: Tue, 31 Dec 2024 22:25:10 +0100
Message-Id: <20241231212511.3649711-5-peter.marko@siemens.com>
In-Reply-To: <20241231212511.3649711-1-peter.marko@siemens.com>
References: <20241231212511.3649711-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Dec 2024 21:26:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209189

From: Peter Marko <peter.marko@siemens.com>

These CVEs are patched in gstreamer1.0-plugins-bad.
CPE for gstreamer-plugins-bad mostly hits original gstreamer recipe.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
index 2c9c6944b0..cf81620833 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
@@ -69,7 +69,7 @@ FILES:${PN}-dbg += "${datadir}/gdb ${datadir}/gstreamer-1.0/gdb"
 
 CVE_PRODUCT = "gstreamer"
 
-# this CVE is patched in gstreamer1.0-plugins-bad
-CVE_CHECK_IGNORE += "CVE-2024-0444"
+# these CVEs are patched in gstreamer1.0-plugins-bad
+CVE_CHECK_IGNORE += "CVE-2023-40474 CVE-2023-40475 CVE-2023-40476 CVE-2023-44429 CVE-2023-44446 CVE-2023-50186 CVE-2024-0444"
 
 PTEST_BUILD_HOST_FILES = ""
-- 
2.30.2


