Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B3BD5E388
	for <webhook@archiver.kernel.org>; Sat,  9 Nov 2024 22:59:39 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.27086.1731193169958235007
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Nov 2024 14:59:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=UV+PE4JO;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202411092259264fe93018cc5d3c4999-vbgrpl@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202411092259264fe93018cc5d3c4999
        for <openembedded-core@lists.openembedded.org>;
        Sat, 09 Nov 2024 23:59:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=9en+/QyinTPm1t0GK7X47visxtbBSg9jv96BqF2FMik=;
 b=UV+PE4JOl7R/SdAqxGmg0ciCrR3m7jTZcgquqUKRWZ2PMRGiLuvp4LDmS/ErjpfU5L7MJe
 b36wf9rMkUJ3PPdOcOc9tAWHI/7iJHnRzLlt1nmArdRnXmKOl4NDevqcjROrTh0MpBet6b1f
 YPgke08oBH8X9T/hFcIGe60DPJyowO+pmY++kjHfh06BOWYcCQ243c1E1SRAEdnJTP5oLl9B
 B1oxFrMEyj9kSk7HwYObZmS5CIJ4L9syouzFRCK6RM5lnaDh29zOlPN8iZB/y+JOg0kUD8lM
 5Yi8C/U7AOGL0aVy7N/8RdcJKuw8dQUEi61jA1SMeNycWBZGIJ47M6rA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] gstreamer1.0: ignore CVE-2024-0444
Date: Sat,  9 Nov 2024 23:58:39 +0100
Message-Id: <20241109225839.1951358-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Nov 2024 22:59:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206910

From: Peter Marko <peter.marko@siemens.com>

This CVE is patched in gstreamer1.0-plugins-bad.
cpe product is set to gstreamer, they share source git repository.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
index 6d002198ae..2c9c6944b0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
@@ -69,4 +69,7 @@ FILES:${PN}-dbg += "${datadir}/gdb ${datadir}/gstreamer-1.0/gdb"
 
 CVE_PRODUCT = "gstreamer"
 
+# this CVE is patched in gstreamer1.0-plugins-bad
+CVE_CHECK_IGNORE += "CVE-2024-0444"
+
 PTEST_BUILD_HOST_FILES = ""
-- 
2.30.2


