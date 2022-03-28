Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4849C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 09:50:10 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web08.9096.1648461009690004731
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 02:50:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=G9/QmaWy;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648461008; i=@fujitsu.com;
	bh=o8p0jg4adpPjXZcFh6tINb+m/D1B2HeW188PBld3Jm8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=G9/QmaWyHoYvAhEH5cP0qKjD7RVEA/LbTm2WJ7oiTKi0TbObUkNU6jPcIBnQ9jiRS
	 sguHiw//ckkaZVCvYQtBG+q/H8yCMEZVOL6RpmlSxP3SGp/ZTStfaT8hqNXUZNRDFi
	 MrM9ayD4ChI5eY5tHkALHmUOY7jrz06TwrsCguVdCHHIOBIiwCJ/XYmMfZbHV40RjA
	 V6NYeAS5JlMdKku1677CyAEqg47mx2QsdehDS0WfgzEZ6J8PqsdTLFiNlEk635vmSc
	 r+qbwlqzrIHiFX+Swarymcv6JGBWOe2H4E3gT9oabLdMKpWWIrcny0po/Hn918a9o9
	 nRzOnw6e9N66w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8MxSfdsi2O
  SwaFXShZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bzkyamgnaOisb1yxgbGFexdzFycQgJPGaU
  OLF0NguEc55JovdHLyuEs4dR4vzHs4xdjJwcbAJqEtNv3QBKcHCICOhJXP0nChJmFlCRePG7h
  x3EFhawlDh09SEziM0ioCpxuGUhK4jNK+AkcfTATRYQW0JAQWLKw/dgNZwCzhLnny4E6xUCqn
  m19yYTRL2gxMmZT1gg5ktIHHzxghmiV1Fi9uVmqDkVErNmtTFB2GoSV89tYp7AKDgLSfssJO0
  LGJlWMVolFWWmZ5TkJmbm6BoaGOgaGprqmuoamZrqJVbpJuqlluqWpxaX6BrqJZYX66UWF+sV
  V+Ym56To5aWWbGIEBnFKMev/HYzdfT/1DjFKcjApifIaZTomCfEl5adUZiQWZ8QXleakFh9il
  OHgUJLgvdUMlBMsSk1PrUjLzAFGFExagoNHSYTXtAkozVtckJhbnJkOkTrFqCglznsDpE8AJJ
  FRmgfXBoviS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeU+BTOHJzCuBm/4KaDET0OK172x
  BFpckIqSkGphWGIe1Rkzlq3qzYtW/6vatZvdTuL/8TOPcEPX7he5jjh5GM1WOCTflN239wymt
  3rpgfewySf4ti7mYgvO3ris4llXrXdM2LSJr/heRK3sd/XfMF1mkzGQ/44raxa44oTn3i28FL
  QtqLm15KHJjSTvnzb7ADhvH99P6Lthf3jn5jf77ld+i953/eD81xCujxp7lr42wyZcred7r5I
  89eaPUwsQxz+6zRuGzcKmNoV1B0sbOskznsz33LzspPfvRerZ4hQWvRB/tsLgXJT/zzqmY2MU
  8S29N4S80+CgW56dy83tmZIGRoq/G1VWu8/YbiGw+stAx00vkTyrf4TfMv5463hec+Wt5kV/6
  lOvTZ0YpsRRnJBpqMRcVJwIAiAUYFl0DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-591.messagelabs.com!1648461005!165618!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16066 invoked from network); 28 Mar 2022 09:50:05 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-20.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Mar 2022 09:50:05 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 0A93B100463
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:50:05 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id EF0B3100457
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:50:04 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Mar 2022 10:50:03 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] diffoscope: upgrade 207 -> 208
Date: Mon, 28 Mar 2022 17:49:40 +0800
Message-ID: <1648460981-15712-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648460981-15712-1-git-send-email-wangmy@fujitsu.com>
References: <1648460981-15712-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Mar 2022 09:50:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163693

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../diffoscope/{diffoscope_207.bb => diffoscope_208.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_207.bb => diffoscope_208.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_207.bb b/meta/recipes-support/diffoscope/diffoscope_208.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_207.bb
rename to meta/recipes-support/diffoscope/diffoscope_208.bb
index 004d4d1ee6..3c3b007d60 100644
--- a/meta/recipes-support/diffoscope/diffoscope_207.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_208.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "e670160911c8e465ab178f23bd1a2e6a827032b7bbec5f24eebf9215f1ae5f54"
+SRC_URI[sha256sum] = "2c5c0ac1159eefce158154849fe67f0f527dffc5295bfd3ca1aef14962ffcbcb"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.25.1


