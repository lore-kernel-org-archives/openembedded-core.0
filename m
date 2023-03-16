Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE8BC61DA4
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 00:29:03 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.1564.1678926542620611749
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 17:29:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=o9JOW7Wq;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678926540; i=@fujitsu.com;
	bh=j/+apgTiO3wYNg6buKcYYJ9ID52BZ6uaBRffGrJBoqE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=o9JOW7Wq0bMjFlygyLctzBKlixgYklniNqPatr5Lf2NZEWco6wzmY4NoLtoBZeLl7
	 gKF+Y4iaEpC853J3484e6R3V+sSnodHPZMjnjVep50yhqCRrwGEQD5WP7EtFZ0SYsd
	 X/f/h5DA/Ul/0D+gIJ54hblgbB5aqP1dLFumWY6xxekodLcBiQgIQfMACO+AYdkmvi
	 sqzB76zzlNMNSTAOFJBrOowZUDpMGjzBAbolWkoB6in8gW6alyGi9W/NwwWvpv0tTE
	 DnDnGxdULSzo6fKlmCfOVdZtJ/4oHV4dkYSIPmcK7ybZiGzUTmMKXX9AfeMuNLZOgk
	 aKzflp8+xUTCw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRWlGSWpSXmKPExsViZ8ORqHs6SSj
  FYNJvSYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePz13dMBd1cFfv2r2BrYPzP0cXIxSEk8JhR
  4mLHf7YuRk4g5xqTxKunRhD2HkaJt/stQWw2ASmJG/dBajg4RAT0JK7+EwUJMwuoSLz43cMOY
  gsL2Em8vDODEcRmEVCV+PzuAyuIzSvgJNG59x0TiC0hoCAx5eF7Zoi4oMTJmU9YIOZISBx88Y
  IZokZRYvblZhYIu0KicfohqF41iavnNjFPYOSfhaR9FpL2BYxMqxhNi1OLylKLdI31kooy0zN
  KchMzc/QSq3QT9VJLdctTi0t0DfUSy4v1UouL9Yorc5NzUvTyUks2MQLDMKWYuW8H49fev3qH
  GCU5mJREef+sEUgR4kvKT6nMSCzOiC8qzUktPsQow8GhJMH7PkEoRUiwKDU9tSItMwcYEzBpC
  Q4eJRFesQigNG9xQWJucWY6ROoUo6KUOO/2RKCEAEgiozQPrg0Wh5cYZaWEeRkZGBiEeApSi3
  IzS1DlXzGKczAqCfNOBdnOk5lXAjf9FdBiJqDFvPMEQBaXJCKkpBqYsleVJP2aL7op2v9FU7t
  yVIbg54s6j+0mtNdGyph4JB26ffSqmJwz06JvXba+00/u6r/vHrywrYRzi95Gb1vWlv3L1LIC
  F2mVL2owXLJru8m9llOrn3F9O39+wjPNVhnVjyt53if9+huxUOMy0yOrul1KgVNPz//34vEDF
  XXeazxyC11DV8/P1w29kxDpczdzUaWm2oe3YvZdkRlFBjaW95ad3vow4KxcYsjO0319DGZewc
  LBd9RNZ6acfqzfezZkttTPB1Y39npt8DzQK7woV3jV4vefs5LmPvh5rcannFfrjtfPi/dndMZ
  dY/c6/1nmz2KveXpes+8s9dTR+i4R3qsqVSXwtjJwuUwog9kcJZbijERDLeai4kQA0ssYFT4D
  AAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-587.messagelabs.com!1678926539!177954!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1111 invoked from network); 16 Mar 2023 00:28:59 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-18.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Mar 2023 00:28:59 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 0BF131001A5
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 00:28:59 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 003EB1001A4
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 00:28:59 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 16 Mar 2023 00:28:57 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] btrfs-tools: upgrade 6.1.3 -> 6.2.1
Date: Thu, 16 Mar 2023 08:28:44 +0800
Message-ID: <1678926524-24495-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 00:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178664

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
 * fix build with crypto libraries
 * CI images updated, build tests extended

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../btrfs-tools/{btrfs-tools_6.1.3.bb => btrfs-tools_6.2.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.1.3.bb => btrfs-tools_6.2.1.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb
index b4dfc5b3f3..a6ff87a90c 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;b
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            file://0001-Use-pread-pwrite-ftruncate-stat-instead-of-64bit-equ.patch \
            "
-SRCREV = "908b4b4450320e30fdef693f09b42f4eb93702c3"
+SRCREV = "366cd079bc43241b27e0838be0c5369aa00716f8"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.34.1


