Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43702C4167B
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 03:01:50 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.10053.1671591701372984968
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 19:01:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=y30ZtaAO;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1671591708; i=@fujitsu.com;
	bh=Jpxecuz5dJnXAcc+iV7I625C+Ftl5Vsg8b6JpSW2ixE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=y30ZtaAOf7mHXO76kF3yMxJW16/dLv5lJ3eoz4XgfOIqiRmvgwDQsv1qXL8f3k5Y5
	 o3BpxoZO+wvKXwWMs3vG9ueqAhYcCKnh7c9rTNUY3h0jdRmXm4VhTzQz1JBOJwbwrV
	 qxSk0Fu1w7vIN+Bze2dlFe4Dx9QKylajC/JB8vFFg4o2y/8NZBsSq1qEw1T8nZF5dK
	 jYouGu+FxRq5sdcADxKWNiH/bnDpYGL3t986xzmfT8EvUwXcXn11h7aWiSF68eA2lP
	 2pKwCyZ/THO69grhSM96NVOH8KSKcplYWiGTmVVQxPVpMlPmWLFsLGaH864w5dUA6l
	 LLEVYn5X5tCWg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8OxWVe6fFG
  ywdZ3whZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bT8UamgjUcFYfvTmNvYDzA3sXIySEk8IBR
  4s3j0i5GLiD7EpNEd+tkVghnD6PE57v3wKrYBKQkbtz/z9bFyMEhIqAncfWfKEiYWUBF4sXvH
  naQsLCAqcSB29EgYRYBVYkfZ+4wgdi8Ak4S/zpPsYHYEgIKElMevmcGsTkFnCVWdTWwQtzgJL
  Ht52xWiHpBiZMzn7BAjJeQOPjiBTNEr6LE7MvNLBB2hcSsWW1MELaaxNVzm5gnMArOQtI+C0n
  7AkamVYxmxalFZalFuoaWeklFmekZJbmJmTl6iVW6iXqppbrlqcUlukZ6ieXFeqnFxXrFlbnJ
  OSl6eaklmxiBgZtSrLhuB+P0ZX/0DjFKcjApifL6MCxKFuJLyk+pzEgszogvKs1JLT7EKMPBo
  STBa1oKlBMsSk1PrUjLzAFGEUxagoNHSYTXrgQozVtckJhbnJkOkTrFqMsx82vbAWYhlrz8vF
  Qpcd7dIDMEQIoySvPgRsAi+hKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd4YkFU8mXklcJt
  eAR3BBHTEtJsLQY4oSURISTUwuUdt9uoqvHw0g8WzuvKQpW5RSk1+0pSJEqJL5lbE+VfO/BCh
  v+bDNytjTa9z6x48mLxsr0ir9cP5PIIxtz8rss3kzGv5erbo3rVVsjvfCijsvOjSrTxz+lr9S
  bn/FT/fKUzWL3pv1tNz4fArwT9fCk22yN8rEpJK+v9+DevJylsi/hf1GzdI2m2p/Tjx/NovF9
  lW2PU+fspbd3YXz5rnf1yO1pS++CYmt7bNPS215sCCJ7Ez/35OvfZa4VzRivviSoF2H2d8DfW
  z+Xg8SltTZoFoVn3NPuXlGwzOXDVN37yJvVziwvGHNekS/9vbtfWObYntF6j7vMjg2aPtFt+P
  LlMtUDDapaPylkd65otnx5VYijMSDbWYi4oTAUVkFMxjAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-571.messagelabs.com!1671591707!19913!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14169 invoked from network); 21 Dec 2022 03:01:47 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-15.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Dec 2022 03:01:47 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 0DEFF142
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 03:01:47 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 017A073
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 03:01:47 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 21 Dec 2022 03:01:45 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] xz: upgrade 5.2.9 -> 5.4.0
Date: Wed, 21 Dec 2022 11:01:02 +0800
Message-ID: <1671591662-12509-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1671591662-12509-1-git-send-email-wangmy@fujitsu.com>
References: <1671591662-12509-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 03:01:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174898

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/xz/{xz_5.2.9.bb => xz_5.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/xz/{xz_5.2.9.bb => xz_5.4.0.bb} (95%)

diff --git a/meta/recipes-extended/xz/xz_5.2.9.bb b/meta/recipes-extended/xz/xz_5.4.0.bb
similarity index 95%
rename from meta/recipes-extended/xz/xz_5.2.9.bb
rename to meta/recipes-extended/xz/xz_5.4.0.bb
index 7da7887b1c..75b763533f 100644
--- a/meta/recipes-extended/xz/xz_5.2.9.bb
+++ b/meta/recipes-extended/xz/xz_5.4.0.bb
@@ -25,7 +25,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=97d554a32881fee0aa283d96e47cb24a \
                     "
 
 SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz"
-SRC_URI[sha256sum] = "e982ea31b81543d7ee2b6fa34c2ad11760e1c50c6f4475add8ba0f2f005f07b4"
+SRC_URI[sha256sum] = "7471ef5991f690268a8f2be019acec2e0564b7b233ca40035f339fe9a07f830b"
 UPSTREAM_CHECK_REGEX = "xz-(?P<pver>\d+(\.\d+)+)\.tar"
 
 CACHED_CONFIGUREVARS += "gl_cv_posix_shell=/bin/sh"
-- 
2.25.1


