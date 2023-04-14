Return-Path: <qiutt@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B981C77B70
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 08:53:40 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.4636.1681462417020349015
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Apr 2023 01:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uPORLAjW;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: qiutt@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681462415; i=@fujitsu.com;
	bh=Jmhb4NvUwwODE7OryB5q1GkPJKMsuHTrkfCNvdswoYc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=uPORLAjWtJIlTxexBIV6XuYtoRszveRbUhZg6exIjrgr26NaQPviHClAuvMts4sYY
	 St2Sdh7Pg5F4ZkC2KRf4y/tI58vhQ9enEPaQN0lcT17Gxb57c5S/092p9B252Q7/bu
	 6aqJjTKwOxXpP/XGrbsIYvT/q3u/dsGsYQldKIiZLmXTAhqAIR6CiDh3LsaiK9zSjw
	 mOWwpvAAMfI67y50kUqay+xGH90j4oRM9aWl841qoO1tebPsTAvsc46lUE8Mo0mV0z
	 LDINGuxAsayElt5tbPjyPz9wQmXPWrm1YWN4tjXYL0WB+wT9hxoxPY9lvFXSZYKIFr
	 Mk9tZxbGAuYfQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8ORqNsnYpl
  i0Dxb3OLOz3fsDowe5zauYAxgjGLNzEvKr0hgzWg5/JWxYDFvxYFNc5kbGCdxdzFycQgJPGaU
  eLmigxXCuc4kMeXtWXYIZy+jxLvWLuYuRk4ONgFJieXNq5i6GDk4RAT0JK7+EwUJMwu4Sux6c
  I4RJCwsYCXx6k0tSJhFQFXiw6NdYJ28Ag4SF7bdA7MlBOQkdqx+wgQRF5Q4OfMJC8QYCYmDL1
  5A1ShKTO1YygJhV0q0fvgFZatJXD23iXkCI/8sJO2zkLQvYGRaxWhWnFpUllqka6iXVJSZnlG
  Sm5iZo5dYpZuol1qqm5dfVJIBlEosL9ZLLS7WK67MTc5J0ctLLdnECAzFlOLE2zsYl/f+1TvE
  KMnBpCTKW3zEIkWILyk/pTIjsTgjvqg0J7X4EKMMB4eSBG8it2WKkGBRanpqRVpmDjAuYNISH
  DxKIrzCfEBp3uKCxNzizHSI1ClGRSlx3nhhoIQASCKjNA+uDRaLlxhlpYR5GRkYGIR4ClKLcj
  NLUOVfMYpzMCoJ86YKAE3hycwrgZv+CmgxE9Dial0LkMUliQgpqQamrpMMJueK1jQvCWdLZT2
  S9kjuQVJz9L+HCmwmAT8Yd9osFrnr/Xiu29zj22dUfNok9cQs78YvJVHGizObWFqfzloTnF31
  b99K23aJtAeLlW4clzrw2FTITmVR4sHwKTs59ZYdqLv+9Ur9u8W82xpkeS4W/zz9ziIxYsbFa
  vbJ8c0zphY571U9bHNA8WtUtIj/Z27e9bqXtxzJzWtgfj2zKLKnSvryyXSnd/1GqgnCB3Pa18
  97+OVvxOdFjR8fz/L8dFvOobl60U6hqtNcF1St55YFfzI7FfAvPedXlRGLt7ii/oUjf/b8fr3
  2auGnmgYD+7eJHWc45J7X90b80qhrXBj7KWfHHONqnqe+s6U2KbEUZyQaajEXFScCANdbVV5A
  AwAA
X-Env-Sender: qiutt@fujitsu.com
X-Msg-Ref: server-18.tower-728.messagelabs.com!1681462414!37735!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24365 invoked from network); 14 Apr 2023 08:53:34 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-18.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 Apr 2023 08:53:34 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id C5B2F100225
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 09:53:33 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B733C1001BF
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 09:53:33 +0100 (BST)
Received: from localhost.localdomain (10.167.219.96) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 14 Apr 2023 09:53:31 +0100
From: <qiutt@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: <fnstml-fujitsuten@fujitsu.com>, Qiu Tingting <qiutt@fujitsu.com>
Subject: [PATCH V1] coreutils: Add gcc parameter for ptest
Date: Fri, 14 Apr 2023 16:53:20 +0800
Message-ID: <1681462400-3660-1-git-send-email-qiutt@fujitsu.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.219.96]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 08:53:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179993

From: Qiu Tingting <qiutt@fujitsu.com>

If gcc is installed in image, ptest result has 4 ERROR.
  ERROR: tests/rm/r-root.sh
  ERROR: tests/rm/rm-readdir-fail.sh
  ERROR: tests/cp/nfs-removal-race.sh
  ERROR: tests/ls/getxattr-speedup.sh

r-root.log as an example:
  --------------------------
  k.c:1:10: fatal error: stdio.h: No such file or directory
      1 | #include <stdio.h>
        |          ^~~~~~~~~
  compilation terminated.
  r-root.sh: set-up failure: failed to build shared library
  ERROR tests/rm/r-root.sh (exit status: 99)
  --------------------------

reason:
  In these cases, k.c file is created and compiled by gcc before run.
  There is a stdio.h file in /usr/include/ directory,
  but gcc parameter is not set it.

solution:
  Add "-l /usr/include/" in gcc parameter.

other:
  If gcc is not installed in image, these cases will be skipped.

Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
---
 meta/recipes-core/coreutils/coreutils_9.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/coreutils/coreutils_9.1.bb b/meta/recipes-core/coreutils/coreutils_9.1.bb
index 4807eefd04..fe785b673d 100644
--- a/meta/recipes-core/coreutils/coreutils_9.1.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.1.bb
@@ -184,6 +184,7 @@ do_install_ptest () {
     install ${S}/build-aux/test-driver ${D}${PTEST_PATH}/build-aux/
     cp ${B}/Makefile ${D}${PTEST_PATH}/
     cp ${S}/init.cfg ${D}${PTEST_PATH}/
+    sed -i 's/CC -Wall -shared/CC -Wall -shared -l \/usr\/include\//g' ${D}${PTEST_PATH}/init.cfg
     cp -r ${B}/src ${D}${PTEST_PATH}/
     cp -r ${S}/src/*.c ${D}${PTEST_PATH}/src
     sed -i '/^VPATH/s/= .*$/= ./g' ${D}${PTEST_PATH}/Makefile
-- 
2.25.1


