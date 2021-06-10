Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.4])
 by mx.groups.io with SMTP id smtpd.web09.7834.1623318679517036049
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jun 2021 02:51:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kRW0mbAW;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.4, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623318677; i=@fujitsu.com;
	bh=rj1HIlJkZN6vHWS7CVJ3hndQc9WCIN41Nra5cI+ckhs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=kRW0mbAW8tAgM1XIZxw8d/le+YzyZOej9YQ0AaMckUIuI6lV5kzjk+sccopASmB4s
	 AJjxDdnaepwW3fByqXujgGKKVHAvL9WIbNyYbQw99FrA5zxr4Yd79/uQ2x+g0ft4rp
	 QHYTZ5Qn6YecpDP7M/WPKveQuGJwHGDv9el4fwcVb2P64HK7W36nZaU+sfxZ6nA6+8
	 FIbOR07Gb9kqtU+ETuY6coh1jFsdq0UQ/JfvWxfmlIQk7GMHwpzYxwspp99Nui6xv5
	 zRg67bT85F+Q96v/n4eKj0UDayb59Vv98wCLFjJ8+19yfwqeeuHODkyM2g4IIGkgY+
	 VoR74lakFao2A==
Received: from [100.113.2.110] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id D2/00-52906-590E1C06; Thu, 10 Jun 2021 09:51:17 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYojvlwcE
  Eg1fHzSzu/HzH7sDocW7jCsYAxijWzLyk/IoE1owPrZ/ZC5ZzVrxtmczSwHiUo4uRi0NIYBaT
  xLxZ61ggnD2MEh86N7B3MXJysAnoSpx7vBbI5uAQEdCTuPpPFCQsLGAjse1+I1gJi4CqxKcZD
  5lBbF4Bd4nZZ7+D2RICChJTHr6HigtKnJz5hAXEZhaQkDj44gUzyEgJAUWJ2dPlIcorJGbM2M
  Y2gZFnFpKOWUg6FjAyrWK0TCrKTM8oyU3MzNE1NDDQNTQ01jXUNTQx0kus0k3USy3VTU7NKyl
  KBMrqJZYX6xVX5ibnpOjlpZZsYgSGUUohY98OxolvPugdYpTkYFIS5W2/ejBBiC8pP6UyI7E4
  I76oNCe1+BCjDAeHkgSv1T2gnGBRanpqRVpmDjCkYdISHDxKIrz8N4DSvMUFibnFmekQqVOMi
  lLivBwgfQIgiYzSPLg2WBxdYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMmwQyhSczrwRu+i
  ugxUxAix2N94EsLklESEk1MNV+sF7Fy9ds92rb9n8+755POVEo4aX4MWzjSn7x1ZKLG6acnfB
  l9dPzRbs/mW7/sKPS9MKziX0KnrszCsrtDBamM1X//+JyzTcn+bfdzwxhjXeRX39Gnua7FC1t
  VMbsor/juB9D54kzFS8ulWja3W8PUS0/LnnnZuOxlcvmXTxTvv13d9N9BdHPam655w46rGjLF
  77vNF3b7lHCn7+u2+/wKrSufb7rRsujd11/Oxm5TleK7ok68eawaOeboF/1xhPfXFDu/vg3bM
  ofC8448b/LTsTcCJt5do+O2+Pw/lup079NYKm8qV2yzDBONKJ6wQalTYlti72CD1rJd4b1fG+
  Mcj31g++AQea5K12PPM2VWIozEg21mIuKEwFGwZ3YHgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-226.messagelabs.com!1623318676!54577!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24449 invoked from network); 10 Jun 2021 09:51:16 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-4.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Jun 2021 09:51:16 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15A9pG4D015167
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Jun 2021 10:51:16 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 10 Jun 2021 10:51:14 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] liburcu: upgrade 0.12.2 -> 0.13.0
Date: Fri, 11 Jun 2021 02:51:05 +0800
Message-ID: <1623351065-4566-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../liburcu/{liburcu_0.12.2.bb => liburcu_0.13.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/liburcu/{liburcu_0.12.2.bb => liburcu_0.13.0.bb} (86%)

diff --git a/meta/recipes-support/liburcu/liburcu_0.12.2.bb b/meta/recipes-support/liburcu/liburcu_0.13.0.bb
similarity index 86%
rename from meta/recipes-support/liburcu/liburcu_0.12.2.bb
rename to meta/recipes-support/liburcu/liburcu_0.13.0.bb
index b493e939c9..c9fef89789 100644
--- a/meta/recipes-support/liburcu/liburcu_0.12.2.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.13.0.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e548d28737289d75a8f1e01ba2fd7825 \
 
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "d94347df78e3f1aa744745eb85787df5"
-SRC_URI[sha256sum] = "4eefc11e4f6c212fc7d84d871e1cc139da0669a46ff3fda557a6fdd4d74ca67b"
+SRC_URI[md5sum] = "8cb75dbb05774c03e66c63cb3186dd59"
+SRC_URI[sha256sum] = "cbb20dbe1a892c2a4d8898bac4316176e585392693d498766ccbbc68cf20ba20"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 inherit autotools multilib_header
-- 
2.25.1

