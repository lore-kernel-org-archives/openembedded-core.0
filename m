Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E806CCA47C
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 07:45:28 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.6388.1657611922208219574
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 00:45:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UhVOKZLu;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657611925; i=@fujitsu.com;
	bh=FgBD5LP6BBC1BipYQ3eYcywGyzrxy6r1lvBLucWrnvA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=UhVOKZLuW/6R5d5H50+jjAP+n/EnMQ3XbJglkSaINJLDwOQMiBn0cRTCdZ0Ksuo+c
	 C8OWvfb7yvaKGdaTynRlOiMK9UaNLG3+5Zi+/h3qFzsGHwcr8JrmYrW+ALl87HSpyf
	 0JNhRBmaFtvoCCMXzs+RGEezpJqgAeM5kpb7NywOcXlHOnY9wxjUhbvch4HUBdbgnM
	 96nblkds+1TbyGhEWB9N4sey1LyQd2GOTlKOdJaWMxxCMPqp+zkhfHSQRnq0wSrnA0
	 0oexW6z6M8yBT920ojJRmrrlaSjt43rqda9EjhT7zhGvXYOidJRgjAwMpbXkKUtvbE
	 L5CmkQyYw7znw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRWlGSWpSXmKPExsViZ8ORqDtV7Wy
  Swev7qhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bLv09ZCzZxVHSfXsjcwHifvYuRi0NI4DGj
  xIaHS6Gca0wS65ZMZ4Fw9jBKzHz0CMjh5GATUJOYfusGaxcjB4eIgJ7E1X+iIGFmARWJF7972
  EFsYQEXidWHHoKVswioStycc4oVxOYVcJLY+mUCWFxCQEFiysP3zCA2p4CzROPvQ0wgthBQTd
  ePr+wQ9YISJ2c+YYGYLyFx8MULZoheRYnZl5uh5lRIzJixjQ3CVpO4em4T8wRGwVlI2mchaV/
  AyLSK0TqpKDM9oyQ3MTNH19DAQNfQ0FTX2AjINNFLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuu
  zE3OSdHLSy3ZxAgM45RihYwdjN9X/tQ7xCjJwaQkypsnfTZJiC8pP6UyI7E4I76oNCe1+BCjD
  AeHkgSvjQpQTrAoNT21Ii0zBxhTMGkJDh4lEV4TZaA0b3FBYm5xZjpE6hSjJcfU2f/2M3MsB5
  Mzv7YdYBZiycvPS5US5xVQBWoQAGnIKM2DGweL+0uMslLCvIwMDAxCPAWpRbmZJajyrxjFORi
  VhHmngUzhycwrgdv6CuggJqCD5CLPgBxUkoiQkmpg2ikT+2VZXuTF7y2sH570SjNOXvxfgf+g
  5Du5VDuOrHm8TJfjVn/pO7uicHmvhnGx+dOLb3jSgxWYIvYJnlrQt5brePTi2wcrHpxsfFp90
  8qopeaAX+YhRi7/fztW6f0uCN293qF8cV2xpDVD0e81F7f6vPzi+FLBaPPOZ9u6krp/nnZVer
  Tm7lR211vZHzmmyUXe1A2ecPh/qhL7ii5z9skK4tYBXbPC/66uCt2T4bw3Kdvlu1trvqfuDok
  zzG3pc3z19vnOFPL3KLA+pF4/53mvwNJD06sb7WWWFE4ODgr+F2PXsGh+ioFiTcmry3Y28o0n
  AzN49n7Z+ENaRsu3/6LcQxaPMP5UlikbGX4rsRRnJBpqMRcVJwIAf5PPEXYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-548.messagelabs.com!1657611925!27692!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4611 invoked from network); 12 Jul 2022 07:45:25 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-16.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Jul 2022 07:45:25 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 50E9A100043
	for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 08:45:25 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 44E46100193
	for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 08:45:25 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 12 Jul 2022 08:45:23 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-imagesize: upgrade 1.3.0 -> 1.4.1
Date: Tue, 12 Jul 2022 15:44:58 +0800
Message-ID: <1657611899-30825-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657611899-30825-1-git-send-email-wangmy@fujitsu.com>
References: <1657611899-30825-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 07:45:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167902

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-imagesize_1.3.0.bb => python3-imagesize_1.4.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-imagesize_1.3.0.bb => python3-imagesize_1.4.1.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb b/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-imagesize_1.3.0.bb
rename to meta/recipes-devtools/python/python3-imagesize_1.4.1.bb
index 7d8eb80cf3..34c5a43028 100644
--- a/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb
+++ b/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=0c128f0f7e8a02e1b83884c0b5a41cda"
 
-SRC_URI[sha256sum] = "cd1750d452385ca327479d45b64d9c7729ecf0b3969a58148298c77092261f9d"
+SRC_URI[sha256sum] = "69150444affb9cb0d5cc5a92b3676f0b2fb7cd9ae39e947a5e11a36b4497cd4a"
 
 inherit setuptools3 pypi
 
-- 
2.25.1


