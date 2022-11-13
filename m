Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E94E6C4332F
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 02:58:55 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.165.1668308327130964318
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Nov 2022 18:58:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=roVEPe6M;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668308325; i=@fujitsu.com;
	bh=OoEv8KToRma8zH4gIxK3TO+l4sOAIcMnbAfH7W9CDO0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=roVEPe6Mw6y0/KSDdBV7YDFwAe2a/YxFrWq+w96PDYxkU0LLjTlZQoab7ujCq5NXt
	 3MiOOwqw3v1sh4jL9VEoWdB1hAe9b+QQgZRqbtFFsWZZQAhY1+JynWrDmDMJZahCzY
	 v5ZlxNK0MOuqsGKZF1hMwMFU/pai5wOnLSIIBTSLR+CxBpDLh2MvqrrRxQZOnFXiRg
	 YEehxvHh+ICmeA2t9f7uczhhVKE2H/Yza+VVrwT0LbjsurG7Fp63EVOVLqtvTDvWed
	 mFKROPgf2nbQVHLudTDrQKpntkaJHQU7zJVVbMVpCSrLOH+WI8cokeYklXoZsjLcdl
	 4juM18uYjvVSQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRWlGSWpSXmKPExsViZ8MxSTc5tiD
  ZYM4+HYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPS/00sBXM5Ku4sCGlg3M3excjFISTwmFHi
  6JVtTF2MnEDONSaJhvMREIk9jBJty7ezgyTYBKQkbtz/z9bFyMEhIqAncfWfKEiYWUBF4sXvH
  naQsLBAuETLdA6QMIuAqsSmg50sIGFeASeJU0eLQcISAgoSUx6+ZwaxeQUEJU7OfMICMUVC4u
  CLF8wQNYoSsy83s0DYFRKzZrUxQdhqElfPbWKewMg/C0n7LCTtCxiZVjGaFacWlaUW6RrpJRV
  lpmeU5CZm5uglVukm6qWW6ublF5Vk6BrqJZYX66UWF+sVV+Ym56To5aWWbGIEBmFKcXLYDsbe
  pX/0DjFKcjApifKmXc9PFuJLyk+pzEgszogvKs1JLT7EKMPBoSTB+zuyIFlIsCg1PbUiLTMHG
  BEwaQkOHiUR3go7oDRvcUFibnFmOkTqFKMux6bDV/YyC7Hk5eelSonz6kQDFQmAFGWU5sGNgE
  XnJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvGtBpvBk5pXAbXoFdAQT0BHfI/NAjihJREh
  JNTCt/763L2n+E8+NDluKTjz4YP3VQoH5/yMvmf0za+Y0m9dHav75aXJyZu+/H027Jd2sJZZ8
  uxlyP3tuxrWmOSzP/2pp7p24mFco6VD584YF7uu3ePq/6atLn84qrRDk8FvqdcpFn+/lG+0mX
  b8qbSXa1pB3+erVsx0+moezZrEnltv9aKkrslvHb3m5U+6oh9/UctFjFbc/mzXUbRH8rXzucn
  hg+509Ab9fc96yFPqkzaFRtlei7HzDAw71FPMOrq1dlsfrmc55b5/7W1ciZsGKLwszb6c9Oni
  fTY9bfKPOZY2/e62TJfyuRZ26uygg+PA383s/ksqV5AW/Xt/XnHtB9NTXw2L67IoHBeasTqtW
  YinOSDTUYi4qTgQAvQxKzUkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-745.messagelabs.com!1668308323!683686!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2528 invoked from network); 13 Nov 2022 02:58:43 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Nov 2022 02:58:43 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 392AB1000E9
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 02:58:43 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 2CBA91000D5
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 02:58:43 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 13 Nov 2022 02:58:41 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] mobile-broadband-provider-info: upgrade 20220725 -> 20221107
Date: Sun, 13 Nov 2022 10:58:26 +0800
Message-ID: <1668308306-14571-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 02:58:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173169

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mobile-broadband-provider-info_git.bb                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index 2cc92b7b47..e802bcee18 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -5,8 +5,8 @@ SECTION = "network"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
 
-SRCREV = "fe19892a8168bf19d81e3bc4ee319bf7f9f058f5"
-PV = "20220725"
+SRCREV = "22a5de3ef637990ce03141f786fbdb327e9c5a3f"
+PV = "20221107"
 PE = "1"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main"
-- 
2.25.1


