Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59AC4C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 12:21:04 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.25466.1646655662608364620
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 04:21:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XYuICkLd;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646655660; i=@fujitsu.com;
	bh=WbbG9mWbmDEK9wvevx4l+k/9zAeSXXoyeN5uQKvWgBo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=XYuICkLdMOCMbF5Hf1mYcaeGC4sc5Gb+M4UsvfI0TZfeTRktxfO/NyeYxJzOtV+Cg
	 osxc2qpSWDTxKcTeTJlb+EUc6WLoSHRKyx4r8CXzRe1h9Q1+0XfsKAYVnrG4Z6bnDH
	 rXfQ1TzVM5rbasiTeWg5RxliK0SDXwP8yXT9OOQ7TccjbogFHyKd31j0ipPfBdduXA
	 nfIorMChprfDg0CLwHU+thAWRCZDpSJHLMxFOpJIR7y2QKxfdpne+UddCAw6q9VIlG
	 fNyGPPIVGf67OS+2KM80DTa7vLHvVC75kaV8o/NgOZZCtDbiahZm0EHVF2Eo1BgJMi
	 gwntmDn+MPSkg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8ORqLvmh2q
  SQW8vq8Wdn+/YHRg9zm1cwRjAGMWamZeUX5HAmvH7+WT2gm9cFV+nf2FqYHzB2cXIxSEk8JhR
  YsKETSwQznkmiSUfuxghnOOMEu+7n7B1MXJysAmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3
  z3sILawgLtE78VeRhCbBSi+5HQXWJxXwEni8aY1rCC2hICCxJSH75kh4oISJ2c+YYGYIyFx8M
  ULZogaRYnZl5tZIOwKiVmz2pggbDWJq+c2MU9g5J+FpH0WkvYFjEyrGK2SijLTM0pyEzNzdA0
  NDHQNDU11DXSNDE31Eqt0E/VSS3XLU4tLdA31EsuL9VKLi/WKK3OTc1L08lJLNjECgzKlmOH6
  DsaJfT/1DjFKcjApifKmLFBNEuJLyk+pzEgszogvKs1JLT7EKMPBoSTB++4LUE6wKDU9tSItM
  wcYITBpCQ4eJRHeEJA0b3FBYm5xZjpE6hSjopQ4b8B3oIQASCKjNA+uDRaVlxhlpYR5GRkYGI
  R4ClKLcjNLUOVfMYpzMCoJ82qBTOHJzCuBm/4KaDET0OIqWyWQxSWJCCmpBqa+o2b525eybXY
  0/Zz/evOX9JjPsYqr0oUnfjgY/p/BK9rczMFVZorXjZiKl5umfuPo39zj/jzzsHTi8+NrN7C/
  +maTnSHQyDpb5Hn80Y1KygdOWPCy/r8ZFCDI7iZ67sCNN3Kx9w5X/znzf59Gp1J9+ca7cduvL
  VeWj0p4VZbEMXX+jMO+pu/nmp89G2ocUBl9Jy+D/9oaM9vAks3BFWHtPyx4pJvF9S8J6MacX2
  d2WXuHpN3ECf6NHUf+T7VVvHZ/40LboJh7vy+vXm/CvDjj+1KeZefeXX71acK3lVFzrvxv4XZ
  9HbBabp/ljW6lxHvPHJ18JvH/viVxtix848kte6c3yymuFWUMfpyr7fBQiaU4I9FQi7moOBEA
  VSMhgUUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-587.messagelabs.com!1646655659!21288!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11666 invoked from network); 7 Mar 2022 12:21:00 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-16.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Mar 2022 12:21:00 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 8E6AB1001A2
	for <openembedded-core@lists.openembedded.org>;
 Mon,  7 Mar 2022 12:20:59 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 7A5D7100183
	for <openembedded-core@lists.openembedded.org>;
 Mon,  7 Mar 2022 12:20:59 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 7 Mar 2022 12:20:44 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hypothesis: upgrade 6.39.0 -> 6.39.2
Date: Mon, 7 Mar 2022 20:20:33 +0800
Message-ID: <1646655633-56060-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 12:21:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162814

Changelog from 6.39.0 to 6.39.2
==============================
- fixes a regression where the bound inner function
("your_test.hypothesis.inner_test") would be invoked with positional
arguments rather than passing them by name, which broke pytest-asyncio
(issue #3245).

- clarifies rare error messages in "builds()" (issue #3225)
and "floats()" (issue #3207).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-hypothesis_6.39.0.bb => python3-hypothesis_6.39.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.39.0.bb => python3-hypothesis_6.39.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.39.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.39.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.39.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.39.2.bb
index 81bc26208d..01732d0087 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.39.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.39.2.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "1744b82251ce89173e9d5b3627c59723ec0b5130df1c1710e19b8e6f5f42399b"
+SRC_URI[sha256sum] = "7a16ba804baeebdcc5dc4638c32c5fc3fc552c1be30ae21a84c5d9c802b06e31"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.25.1


