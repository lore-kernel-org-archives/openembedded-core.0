Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E15C433FE
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 06:23:38 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web08.33345.1653891808577807656
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 23:23:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kpVN7ly9;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653891806; i=@fujitsu.com;
	bh=qqieqQPGFKhRuG8cZTUA69f4/xmBCpCzMx6jk/+wjDU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=kpVN7ly9pzkDw4kqoGULFIMcNRtGrYg9TV8rQy/1Ach3uOv6TI+ysLorjcNOChlbW
	 wuE6Bz+QIzTqnSFJuPUbGTa8GkK/38C/b8s1exns/DzY8EYAXJHrkoQmrkr1JOdMP0
	 sOsJ9sm/MoZ6KgZ8VA7a5r8800/AN7VN6tqYIuAWSAoJ5q9MEH3uxrNwO1tOdH9Ki+
	 SoMW0Zh3/SHOF6MHKnpkhFlFo9+T9JKoWweQ7Njjh4rzPrOg+smF4+Y8K4qvemUlPY
	 GPZx6xqzuVVqepi38KWxOZZkEkG5oRFjaC20s/H2UL+AX2lTFU5OYjjbPrM1WnOQJT
	 UzqVh5UEuzOpg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORqHsvaUq
  Swd4DQhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aOHY0sBTe4Kh7f+8TSwPiGs4uRi0NI4DGj
  xNfet2xdjJxAznkmiTnHwiESe4AS+5pYQRJsAmoS02/dALI5OEQE9CSu/hMFCTMLqEi8+N3DD
  mILC7hIfO6ZywRSwiKgKnF4hwRImFfASeJ0xydmEFtCQEFiysP3zCAlnALOEk++p0NsdZLY1N
  TECFEuKHFy5hMWiOkSEgdfvIBqVZSYfbmZBcKukJgxYxsbhK0mcfXcJuYJjIKzkLTPQtK+gJF
  pFaNVUlFmekZJbmJmjq6hgYGuoaGpromukbGlXmKVbqJeaqlueWpxia6hXmJ5sV5qcbFecWVu
  ck6KXl5qySZGYPimFLO838HY1PdT7xCjJAeTkijvWdXJSUJ8SfkplRmJxRnxRaU5qcWHGGU4O
  JQkeD3jpyQJCRalpqdWpGXmAGMJJi3BwaMkwrskASjNW1yQmFucmQ6ROsWoKCXOez4RKCEAks
  gozYNrg8XvJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvHdApvBk5pXATX8FtJgJaDE300S
  QxSWJCCmpBqachM1+x4Tueh9j3vxg6vo/Vqa6cjUXnuwyFPWZeovl749CE5/EeeITd00uuMS3
  jHPyjl0sP152rGxyvKfJWWg6eWHzdZl1HM+cI2OfZDAnHa9N9k798SZ95oJjRuc1Tx3vu/j+Y
  zHLlR8nn7R2GaiUnmKt+J+3e12ogOrOdzyuma94Jy/aKmL1u07rcvbaxXcvcapFN26qZTXlmv
  lQwuc5w/dVL+38Fn0rW2AYXWPH1aLIdWn2r/c7FOXNzi9sD4udpjo5dVOsenOFdsYW0VyTlRz
  dx/rfahyLs/S6skjk/kyBYrHYr9tnvHmx590L0dV2FlERm/snCXWZT1691MWlijntZNGm0+xT
  JkWXzrBQYinOSDTUYi4qTgQAwuMM0FoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-585.messagelabs.com!1653891806!273803!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23895 invoked from network); 30 May 2022 06:23:26 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-18.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 May 2022 06:23:26 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id C0D2C100195
	for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 07:23:25 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id A735810018E
	for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 07:23:25 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 30 May 2022 07:23:09 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-webcolors: upgrade 1.11.1 -> 1.12
Date: Mon, 30 May 2022 14:22:52 +0800
Message-ID: <1653891773-23292-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653891773-23292-1-git-send-email-wangmy@fujitsu.com>
References: <1653891773-23292-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 06:23:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166257

License-Update: Copyright year updated to 2022

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...python3-webcolors_1.11.1.bb => python3-webcolors_1.12.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-webcolors_1.11.1.bb => python3-webcolors_1.12.bb} (69%)

diff --git a/meta/recipes-devtools/python/python3-webcolors_1.11.1.bb b/meta/recipes-devtools/python/python3-webcolors_1.12.bb
similarity index 69%
rename from meta/recipes-devtools/python/python3-webcolors_1.11.1.bb
rename to meta/recipes-devtools/python/python3-webcolors_1.12.bb
index 26dbe51767..39ff19c2b8 100644
--- a/meta/recipes-devtools/python/python3-webcolors_1.11.1.bb
+++ b/meta/recipes-devtools/python/python3-webcolors_1.12.bb
@@ -1,10 +1,9 @@
 SUMMARY = "Simple Python module for working with HTML/CSS color definitions."
 HOMEPAGE = "https://pypi.org/project/webcolors/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=25b90379a52351261c51272e7923d240"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bcf737478d2fa8af5bc954231df056c6"
 
-SRC_URI[md5sum] = "54d28a7c80b3e4d974ec2fee86768be9"
-SRC_URI[sha256sum] = "76f360636957d1c976db7466bc71dcb713bb95ac8911944dffc55c01cb516de6"
+SRC_URI[sha256sum] = "16d043d3a08fd6a1b1b7e3e9e62640d09790dce80d2bdd4792a175b35fe794a9"
 
 inherit pypi setuptools3 ptest
 
-- 
2.25.1


