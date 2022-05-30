Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7850BC433FE
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 06:41:28 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.33673.1653892883868729365
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 23:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=aIVe2fNE;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653892882; i=@fujitsu.com;
	bh=O85Ymzv8dfeRYLezhHF5nOS2CSSzpgF9kFrUWDPuCo0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=aIVe2fNE9S16moEBD4b2G/vEBeEXIIO1NpDMSV+3s28pf9qsfRb6FCWq+PBH8iXP1
	 jf7fQC40U6Wu5PMkyX3lI3aGITuSZUDYRCZKSrtCgUn+/1DLPl4c28sF0Un4LrlTHv
	 rAm2zF1smrCPMLSCN2FRDreO9yGHGc7rtkoEqLYdIvYVagCyQgVH0XLsvPT5xc1ald
	 yVgLy5+p9K7azr2F4AL9167ZXGSZf88Syqs+DTUvQ5e8bCCweuMiMIUL5I5cRUO3AP
	 7ZieWz2n0xsFmpvVpfueg82yM6IPXFaRKta+fWGWWooKxzOEFAtEDd4fJKjlVVUQo4
	 d13m47//mvn4A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8OxWVcwfUq
  SwYQOBYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePMyc9sBR+4K94ss29gvMnVxcjFISTwgFFi
  Rl8zG4Rzhkni79UvzBDOHkaJ7ZtmM3YxcnKwCahJTL91g7WLkYNDREBP4uo/UZAws4CKxIvfP
  ewgYWEBO4nn2/VAwiwCqhILH65gBrF5BZwkGi68ZAWxJQQUJKY8fA8VF5Q4OfMJC8QYCYmDL1
  4wQ9QoSsy+3MwCYVdIzJixjQ3CVpO4em4T8wRG/llI2mchaV/AyLSK0SKpKDM9oyQ3MTNH19D
  AQNfQ0FTXUNdIL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFivuDI3OSdFLy+1ZBMjMBhTihmZdjAu
  6/upd4hRkoNJSZT3rOrkJCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvPHJU5KEBItS01Mr0jJzg
  JEBk5bg4FES4V2SAJTmLS5IzC3OTIdInWJUlBLnPZ8IlBAASWSU5sG1waLxEqOslDAvIwMDgx
  BPQWpRbmYJqvwrRnEORiVh3lupQFN4MvNK4Ka/AlrMBLSYm2kiyOKSRISUVAPT5HSR3KIAHoH
  VzOIN5UdkPdifcJRNjyra+ONAp1r1LPU338LzWf7Gdmk9un/jzUamZUU81yZNun7SQm/5rpj5
  Jx+d5Fc4qyq6QO654T6HyzZ7wwI8n6nITT10xfFq4n45twMZJzOiS/Tdqo6GXpsT/0ri1VVed
  8OyzdYLPy26oXG8eF//wtsRusU7nh1YuGDxkSkp7/1jjs5wuHFn75btgQ8zrf+skNofs2Cpll
  7vzvT6uNeVU7UX3NVJ7GESi29Rzz7wMv7kgq4V7LqHb4jviBF/4K5kEvZo1cfAKzITVrKtPbG
  o9VFExf2Jm56UnvKcKLKsqHyq6g+fKQqsNjuOMDyf3RC3OSDzFv9Oy8/cLkosxRmJhlrMRcWJ
  ANeLJKtBAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-587.messagelabs.com!1653892881!15242!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25948 invoked from network); 30 May 2022 06:41:21 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-17.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 May 2022 06:41:21 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 08AA280D
	for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 07:41:21 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id EFE6D7FE
	for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 07:41:20 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 30 May 2022 07:40:59 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] logrotate: upgrade 3.19.0 -> 3.20.1
Date: Mon, 30 May 2022 14:40:47 +0800
Message-ID: <1653892850-23554-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 06:41:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166268

Changelog:
=========
drop world-readable permission on state file even when ACLs are enabled (#446)
fix potential DoS from unprivileged users via the state file (CVE-2022-1348)
fix a misleading debug message with copytruncate and rotate 0 (#443)
add support for unsigned time_t (#438)
do not lock state file /dev/null (#433)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../logrotate/{logrotate_3.19.0.bb => logrotate_3.20.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/logrotate/{logrotate_3.19.0.bb => logrotate_3.20.1.bb} (97%)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.19.0.bb b/meta/recipes-extended/logrotate/logrotate_3.20.1.bb
similarity index 97%
rename from meta/recipes-extended/logrotate/logrotate_3.19.0.bb
rename to meta/recipes-extended/logrotate/logrotate_3.20.1.bb
index 2a60d9b31f..35977535aa 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.19.0.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.20.1.bb
@@ -15,7 +15,7 @@ UPSTREAM_CHECK_REGEX = "logrotate-(?P<pver>\d+(\.\d+)+).tar"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz"
 
-SRC_URI[sha256sum] = "ddd5274d684c5c99ca724e8069329f343ebe376e07493d537d9effdc501214ba"
+SRC_URI[sha256sum] = "742f6d6e18eceffa49a4bacd933686d3e42931cfccfb694d7f6369b704e5d094"
 
 # These CVEs are debian, gentoo or SUSE specific on the way logrotate was installed/used
 CVE_CHECK_IGNORE += "CVE-2011-1548 CVE-2011-1549 CVE-2011-1550"
-- 
2.25.1


