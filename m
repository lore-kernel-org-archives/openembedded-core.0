Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE42C433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 07:38:20 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web09.4810.1655883493711054607
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 00:38:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=L8X/qQK8;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655883491; i=@fujitsu.com;
	bh=r8fc6VdzxHjVasw5JP16zqVR5EeaBuivunJH5JNNtYI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=L8X/qQK8Z91vVz7U8H0C1DJ5TnNM1pNk8i/MaxvM3dyDcwBwyNIHFZOHWFxxEC17K
	 8qD83ZGGZtP16gRp/J2HjDoCsHrasaCFZFxcF97h5cfnV18dzU9r+yS+JvxACZldfb
	 CIkg808Pr6ECznWYpgnYZ6YXXwzo6C/gcmrfDUV1OHjgsQpQCtc/y5oKqPiu9WkLJH
	 AG4vazu+IjLVlrtfENEM39xYO6RVoIZ73cDN0uBfHeHcS+MkKmb2INYNuYyJcyjFg1
	 J9pcvY0gqQ8BRW8m3eHzNue2bR+IWVmtDgfnfG8rjcI4aiju93E1972le2uhlsoztk
	 1g5Xiznbo3+yA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8ORqPv42KY
  kg/kqFnd+vmN3YPQ4t3EFYwBjFGtmXlJ+RQJrRvukuawFJ7krfjfoNTB2cXUxcnEICTxmlNh5
  qJu5i5ETyLnDJNH71RoisYdR4vTCl2AJNgE1iem3brB2MXJwiAjoSVz9JwoSZhZQkXjxu4cdx
  BYWsJX4PeMjE4jNIqAq0fb9ISuIzSvgJPFm4gywuISAgsSUh++ZIeKCEidnPmGBmCMhcfDFC2
  aIGkWJ2ZebWSDsCokZM7axQdhqElfPbWKewMg/C0n7LCTtCxiZVjHaJBVlpmeU5CZm5ugaGhj
  oGhqa6lqa6RpaGuslVukm6qWW6ublF5Vk6BrqJZYX66UWF+sVV+Ym56To5aWWbGIEhmRKccLB
  HYwr9v3SO8QoycGkJMoreWBTkhBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3ubDQDnBotT01Iq0z
  BxgfMCkJTh4lER4VQ8BpXmLCxJzizPTIVKnGHU5Zn5tO8AsxJKXn5cqJc779SBQkQBIUUZpHt
  wIWKxeYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMe/co0BSezLwSuE2vgI5gAjriyfINIEe
  UJCKkpBqYKvb1zli1onnT99frd0/IzDkrHnWCV6N1wsOEHRG5G6R0K9Nk1tVO3JUpGniDY0t0
  I7e58Zwj7zfsluKvdTnPziafJ/W86uyF+f3Tbgf8NLXW4bnyOUn4/fMtvsedXr3jt2PYmJ+U9
  mxe31s9lW97fRcd+qaz2InZ4+xnlbmKe42X//lmv/BYgnid3mH21IaH6Q7uMrMP9H/+rFLLeq
  z5IOdvQR6D86yH9nJ79PGXzuDMn1d1SPTEG4mELXaeGy/tm60xd2dB9d5XIe7iNXeWBU8yj5z
  7e8YC0zMHVSLX511sXry7b07vHoPrwXK7537d/YUrw/sK+wSNwvyAT0KT7Xgif25p213Dwnjl
  fLGwpBJLcUaioRZzUXEiAKRdF2NQAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-728.messagelabs.com!1655883490!425382!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24655 invoked from network); 22 Jun 2022 07:38:10 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-14.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Jun 2022 07:38:10 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 6CD63100193
	for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 08:38:10 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown10-183-43-178
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 60D2E100191
	for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 08:38:10 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 22 Jun 2022 08:38:08 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] alsa-lib: upgrade 1.2.7 -> 1.2.7.1
Date: Wed, 22 Jun 2022 15:37:46 +0800
Message-ID: <1655883470-22765-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 07:38:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167212

Changelog:
=========
Core
 - Release v1.2.7.1
 - conf: Use ino64_t to save and compare inode numbers
Control API
 - control: eld - fix the decoding for older hw
I/O API
 - output: include stdarg.h
PCM API
 - pcm: dmix - Add error handler for `fgets`
Use Case Manager API
 - ucm: list also hardware configs (hw:X) in uc_mgr_scan_master_configs() fcn
Configuration
 - conf: Use ino64_t to save and compare inode numbers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../alsa/{alsa-lib_1.2.7.bb => alsa-lib_1.2.7.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.2.7.bb => alsa-lib_1.2.7.1.bb} (94%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb
similarity index 94%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.2.7.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb
index 1832ce71a4..7f7b955a7f 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     "
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "8814e61f7ec6812c76e23a85cab00e0b0d3bba40816af36b726beb1bc04c74a7"
+SRC_URI[sha256sum] = "046dc42dfcfad269217be05954686137e5e7397f3041372f8c6dcd7d79461e61"
 
 inherit autotools pkgconfig
 
-- 
2.25.1


