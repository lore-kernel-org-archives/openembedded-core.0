Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web12.1230.1622078787715970864
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 18:26:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FPX83Br5;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1622078785; i=@fujitsu.com;
	bh=tIURMuGcPVOZw8Xb/bmIzcTw+zec/kDT9Di5iuEGapM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=FPX83Br50WOP6h3iw0EG2MtMXn/GQXR9fFoo6jOyn4BpbKYe58QCXDIZmDg2WckN8
	 k9t08UaY3NX7sskSEE29+NdpCfvnntriCmqaD0VvzRx2/S6jav4GyVro5w8bM0QoRA
	 0fcPKFZCkByqKIdu66kBZrz3zeGL4xJhct7xnozhmPcXZPpc0SirPFw7yrwS+fbZ/R
	 31rVadlvw30zSkL5aHPnPuLXikLZl6remlT/H6pI1skJMrP5rat3xad1rfVms7PM7J
	 MnboDyJTwGm5vHOxbRSqILDFFkfRKVjgesyVlrltEHXt0uhq3E011jH7Kwrf27eNAi
	 R011+8UYpVXig==
Received: from [100.112.193.63] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.symcld.net id 60/D7-27560-045FEA06; Thu, 27 May 2021 01:26:24 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8MxVdfh67o
  Eg+8veS3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oz2+fEFd1grls/6ydLAOIW1i5GLQ0hgFpPE
  pQ3voZw9jBIT/p9m6WLk5GAT0JU493gtexcjB4eIgJ7E1X+iIGFhAWuJ/82XWEFsFgFVic+N9
  5lBbF4BT4lVy1aCtUoIKEhMefgeKi4ocXLmE7A4s4CExMEXL5hBRkoIKErMni4PUV4hMWPGNr
  YJjDyzkHTMQtKxgJFpFaNFUlFmekZJbmJmjq6hgYGuoaGRrqGlqa6RoaleYpVuol5qqW55anG
  JrqFeYnmxXnFlbnJOil5easkmRmAIpRQcvr6D8dbrD3qHGCU5mJREea+dWJcgxJeUn1KZkVic
  EV9UmpNafIhRhoNDSYL34xegnGBRanpqRVpmDjCcYdISHDxKIryNr4HSvMUFibnFmekQqVOM4
  Rxv1i5ZxMzxFky23bsLJNvB5MwFB1czc8wCk/fbDwHJByBSiCUvPy9VSpw3C2SbAMi4jNI8uG
  WweL3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZh3B8gUnsy8EribXgGdywR0rlAi2LkliQg
  pqQam0oCvN5685jbvEtxjpj3F5vGiizu+To9/G+m0UC541pqpzJG2944vuvStqEOkMb3B+53o
  24dJO8+qZFmev36yppTbOarQ0+vV8mcrOoXa3i8ttHu98N+M6df/bLReX7H/hfiNs3HJq/55m
  Gg9DJ6QlDpvZ4tM3AF2Lqugz7dzYm3i2o72LO7z3Da14M6V1uy1mTE1Wn84L/eJNBc9bf1U0q
  YTv+f/lgN6Tzfvawoud80uy7iX0rbO/Ff28Uuv9dSiDWoOvA5ri1Zac6om2Oq21NOf8tePSn8
  wYtr5PrF2ilX31Fcqpob31m6Y0ss3zXmp18XHyb8/Nvy9057/R0YwVWK73p976yfceiHj5ad/
  TomlOCPRUIu5qDgRABplfeBSAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-265.messagelabs.com!1622078783!247181!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23860 invoked from network); 27 May 2021 01:26:24 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-8.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 May 2021 01:26:24 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14R1QNc3001372
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 May 2021 02:26:23 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 27 May 2021 02:26:21 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libucontext: upgrade 0.10 -> 1.1
Date: Thu, 27 May 2021 09:26:12 +0800
Message-ID: <1622078772-116470-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta/recipes-core/musl/libucontext_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/musl/libucontext_git.bb b/meta/recipes-core/musl/libucontext_git.bb
index 11affebb49..0b64867ce0 100644
--- a/meta/recipes-core/musl/libucontext_git.bb
+++ b/meta/recipes-core/musl/libucontext_git.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6eed01fa0e673c76f5a5715438f65b1d"
 SECTION = "libs"
 DEPENDS = ""
 
-PV = "0.10+${SRCPV}"
-SRCREV = "19fa1bbfc26efb92147b5e85cc0ca02a0e837561"
+PV = "1.1+${SRCPV}"
+SRCREV = "335ee864ef6f4a5d4b525453fd9dbfb3507cfecc"
 SRC_URI = "git://github.com/kaniini/libucontext \
 "
 
-- 
2.25.1

