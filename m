Return-Path: <yanxk.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90679C433FE
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 09:24:22 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web08.3629.1668158657967267493
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Nov 2022 01:24:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=oFJ0Wall;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: yanxk.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668158656; i=@fujitsu.com;
	bh=Rpx1EqZFhi+LFy9pJ6926F5TIyrW7gnTxlqapK2VWeg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=oFJ0WallJuOSYLLtiHcjZAbBIBWVdZka5MEwtB+OUI8SJmPZg/mQh5JJlt9NBAN4B
	 NjHzSO9wTVGl6Jag127EGP1+s9CI+upYR/PXE8lj14j4DpAlmDQJn5hgjRNPAiDOuS
	 TGJ42DAupybqWDOimW9n7ezKdvEdWKwIxARL05/DhsjQQtilGhHGh44xByeZ+TF27K
	 jO+RWv7TogoGDaQGsF0d+2O+NbLAEdAomX6K7uv9m6/5H688XyhSYTSOiKDnrSB1XG
	 8Svymrm1v2iMcpRmjWbaesQD0niau+tXF90YzJ4vYb/ytHf1BSHC4jaHp5Xh2cSVoN
	 0/X4qRNNE5mRQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRWlGSWpSXmKPExsViZ8ORpLtfJC/
  ZYOUhLYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeP/lffsBZPYKq7sXszcwDibtYuRi0NI4AGj
  xJJ7G6CcS0wSb948ZIJw9jJKfFx3m72LkZODTUBOYvHjqUBVHBwiAnoSV/+JgoSZBTwluubNZ
  AGxhQWcJZY++wtmswioSOzbuooJxOYVcJWY1rIMLC4BNGbH6idQcUGJkzOfsEDM0ZRo3f6bHc
  KWl2jeOpsZol5J4s6vy4wQdoXErFltTBC2msTVc5uYJzAKzEIyahaSUbOQjFrAyLyK0aw4tag
  stUjX0EIvqSgzPaMkNzEzRy+xSjdRL7VUtzy1uETXSC+xvFgvtbhYr7gyNzknRS8vtWQTIzB4
  U4rVT+5g3LDsj94hRkkOJiVR3sl8eclCfEn5KZUZicUZ8UWlOanFhxhlODiUJHgdgPEgJFiUm
  p5akZaZA4wkmLQEB4+SCK+/AFCat7ggMbc4Mx0idYrRkuPuwr17mTk+/rkIJKfO/refWYglLz
  8vVUqc9xTILgGQhozSPLhxsGi/xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYN10YaApPZl4
  J3NZXQAcxAR1kl5oFclBJIkJKqoHJb2YHx/xtM/MNbH+tXyKy5GblA/M96mkaG07+ncCzZd3P
  vR9t/szReWfPk9LjsGVX7a/gtinLxQ3LjCtaF+3+fsMoM2S9SC2vmXSF3KIYr7Uln7r8nshWh
  T1/I8kQbMTp2zO3zcA1Rtf9+u2J/xftf8wbJMYXc89n0/aqxZlb/JbfjmPJv9S2p/JDmumzjq
  pFzF8cfU9uL/9RvfBJRm3QWxHbW1P3eDscq4te/VHkvRp/1vLLG1y3L5y5qz3tUq1n4fPdBf+
  fNejVPTvCuD/qsZn/BIfQ1z9557zxkzpfe5D905yZ9z4FGZ3Km3b45bfsxf43OkXDeWZUN/b/
  CrVeqF9pWnqeZYn/gdsMCxMWKLEUZyQaajEXFScCAD+rDJlxAwAA
X-Env-Sender: yanxk.fnst@fujitsu.com
X-Msg-Ref: server-17.tower-571.messagelabs.com!1668158655!710182!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1868 invoked from network); 11 Nov 2022 09:24:15 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-17.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Nov 2022 09:24:15 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 6A8481AE
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 09:24:15 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 5FAD57B
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 09:24:15 +0000 (GMT)
Received: from localhost.localdomain (10.167.218.229) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 11 Nov 2022 09:24:13 +0000
From: <yanxk.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: <fnstml-fujitsuten@fujitsu.com>, Yan Xinkuan <yanxk.fnst@fujitsu.com>
Subject: [meta-oe][PATCH] bc ptest: fix bugs caused by input method
Date: Wed, 2 Nov 2022 08:31:33 +0800
Message-ID: <1667349093-8754-1-git-send-email-yanxk.fnst@fujitsu.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.218.229]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 09:24:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173124

From: Yan Xinkuan <yanxk.fnst@fujitsu.com>

fix some bugs related to echo function caused by input method.

echo would work fine now, difference as below:

before:		=E2=80=9CPASS: bc/*.b=E2=80=9D

now:	 	PASS: bc/*.b

Signed-off-by: Yan Xinkuan <yanxk.fnst@fujitsu.com>
---
 meta/recipes-extended/bc/bc/run-ptest | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/bc/bc/run-ptest b/meta/recipes-extended/bc/bc/run-ptest
index 66a1b9d708..ba5abe6805 100644
--- a/meta/recipes-extended/bc/bc/run-ptest
+++ b/meta/recipes-extended/bc/bc/run-ptest
@@ -2,8 +2,8 @@
 
 for TEST in *.b; do
 	if bc -l $TEST </dev/null; then
-		echo =E2=80=9CPASS: bc/$TEST=E2=80=9D
+		echo "PASS: bc/$TEST"
 	else
-		echo =E2=80=9CFAIL: bc/$TEST=E2=80=9D
+		echo "FAIL: bc/$TEST"
 	fi
 done
-- 
2.25.1


