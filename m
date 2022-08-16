Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F27F4C00140
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 00:06:04 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web12.9743.1660608360290764057
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 17:06:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JLgf1jKg;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660608358; i=@fujitsu.com;
	bh=ZcQ0nsysmakpybkn2017H3itr0Z9OqA4Wk2Y4gXq16E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=JLgf1jKgqoSUDcq/SZczgG92lkJBTbFuV5sDCY6U0MZiTfoSLNLEGirU8+mrrAclb
	 mYNcx3fOmmtLPkPY7iT4NGbKQRdjml8cZ04Syk14H4tAOwoHcAhTAv9no7LFNmoN7/
	 FyTLFwUmsM36f7RrBIcOGgF0XzaoqejYfUc4puMbV7oIz+AVytmLaoyRPFvSOfOdKN
	 ewQseX0ji+0uBCNAGH9Fx1JjG0cqptvZxXT96skg6Rq6VtcPRiDfJrV9hAnjJF3jrk
	 rItGT6Xue2+CvMg1XlP5LgvFV3SAC1CltzZwWoW956iZzOTvqQFjOBTpIk8YkC5nS7
	 3PnxnNZb3Arew==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRWlGSWpSXmKPExsViZ8MxSTf1/q8
  kg2dvpCzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oxHK18wFVznrmj+f4KlgXE3VxcjF4eQwGNG
  id69U9i7GDmBnGtMEsu7qiASexgl3j68A5ZgE1CTmH7rBmsXIweHiICexNV/oiBhZgEViRe/e
  8BKhAWsJJbuPsoMYrMIqErc3/wNzOYVcJQ4/3sGmC0hoCAx5eF7qLigxMmZT1gg5khIHHzxAq
  pGUWL25WYWCLtCYsaMbWwQtprE1XObmCcw8s9C0j4LSfsCRqZVjLZJRZnpGSW5iZk5uoYGBrq
  GhqYQ2tJcL7FKN1EvtVQ3L7+oJEPXUC+xvFgvtbhYr7gyNzknRS8vtWQTIzAwU4pTju5gPLbv
  l94hRkkOJiVR3msXfyYJ8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuBVvPQrSUiwKDU9tSItMwcYJ
  TBpCQ4eJRHe61eA0rzFBYm5xZnpEKlTjLocM7+2HWAWYsnLz0uVEud9fQ+oSACkKKM0D24ELG
  IvMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmXXALaApPZl4J3KZXQEcwAR2hd/c7yBEliQg
  pqQYm2fSJct0Xjp08cqS1VDxqrp699fbVWQybiqb+6mp+drf5por0zmNsGelRL94rc3itym04
  vHju1U9bNTcsyVkxPz/3xZOzFk3H+b6sqfe7JGZ8dX0yo2eoy5tIkRvTHebdiljg6Z/8c7lpZ
  JYBR4f59/zfb5bul7vDIrR19uEsnl1HLtexX1v8hkFytt+5wwffSf+zZ1jsYFpboSUQXfZyyx
  vN0/xK+7fG/JvwpdHuiuuEZ7r/zoeaLOtYOmX3lkmyK5e+e1jd6cC8hqll0upg6SUKbM0Pv3w
  sC3jD+mKPgfuqqJWtvvye8eZb9O9M210y88iZzp5nZxWEtwrzlfn9etVxYO5au43xK3wuFzEe
  3aTEUpyRaKjFXFScCACkqBXeUwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-732.messagelabs.com!1660608357!699630!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4954 invoked from network); 16 Aug 2022 00:05:57 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Aug 2022 00:05:57 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id D751A1000CE
	for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 01:05:56 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id CB0DF1000CD
	for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 01:05:56 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 16 Aug 2022 01:05:55 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] msmtp: upgrade 1.8.20 -> 1.8.22
Date: Tue, 16 Aug 2022 08:05:39 +0800
Message-ID: <1660608339-7791-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 00:06:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169414

Changelog:
==========
- The msmtpq script was updated.
- Added a new configuration command 'eval' to replace the current configuration
  file line with the output of a command (similar to passwordeval, but more
  general).
- Added a new configuration command 'set_msgid_header' with the default setting
  'auto'. This adds a Message-ID header to the mail if none is present.
- msmtpd now adds a Received header

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/msmtp/{msmtp_1.8.20.bb => msmtp_1.8.22.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.20.bb => msmtp_1.8.22.bb} (91%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.20.bb b/meta/recipes-extended/msmtp/msmtp_1.8.22.bb
similarity index 91%
rename from meta/recipes-extended/msmtp/msmtp_1.8.20.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.22.bb
index da3f70a163..d56af7346b 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.20.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.22.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "d93ae2aafc0f48af7dc9d0b394df1bb800588b8b4e8d096d8b3cf225344eb111"
+SRC_URI[sha256sum] = "1b04206286a5b82622335e4eb09e17074368b7288e53d134543cbbc6b79ea3e7"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.25.1


