Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81EB8C433F5
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 06:23:38 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web10.33339.1653891808492316261
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 23:23:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Z0pTv/tC;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653891806; i=@fujitsu.com;
	bh=s4KMoTjRZN6BDS3GPo5d3pn52tlzLN+rTIJWxhwyVh4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Z0pTv/tCTy98SlyOr0/OPYKFWGsdFeATh8/l3HziUHEw2t2xHBdzRcfESB31Iw4t+
	 KK+4ZPOB/HLgObE1b+OQxGsCNnBJW38rOzIVehcG56O9oY/2JVYSlxkUMLDoteTOTM
	 3dLdfG5s/L6CQbniFEP1kXh5PiKJ4jUTGYfobvT6o4hmE6yU0YNcqUpl3c2flE+7+b
	 DBvDxOEdyYkUdsR+nd1Y2Iwll09yOfzQMaMSRpnnnr/J4NNGRFld31TCXzLKk+5rtI
	 ckYNgKYWlcns0+IIqpnIvpMGMiwA8y84LHytXcgk5tOgqXNNLbNhmaFJPDIot1ECmi
	 3YXGyGk72mIxA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORqHsvaUq
  SwelfvBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aziXuYC/5wVzSfvc3awPiLq4uRk0NI4DGj
  xPLbVl2MXED2eSaJLTOPs0Ak9jBKLJppDGKzCahJTL91g7WLkYNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAj8Slr9tZQWwWAVWJNRu/s4HYvAJOEu3t18HiEgIKElMevmcGGcMp4Czx5Hs6xCYniU
  1NTYwQ5YISJ2c+YYEYLyFx8MULZohWRYnZl5tZIOwKiRkztrFB2GoSV89tYp7AKDgLSfssJO0
  LGJlWMVolFWWmZ5TkJmbm6BoaGOgaGprqGuoaGRjrJVbpJuqlluqWpxaX6BrqJZYX66UWF+sV
  V+Ym56To5aWWbGIEhm9KMePpHYyb+n7qHWKU5GBSEuU9qzo5SYgvKT+lMiOxOCO+qDQntfgQo
  wwHh5IEr2f8lCQhwaLU9NSKtMwcYCzBpCU4eJREeJckAKV5iwsSc4sz0yFSpxgVpcR5zycCJQ
  RAEhmleXBtsPi9xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY9w7IFJ7MvBK46a+AFjMBLeZ
  mmgiyuCQRISXVwJR/mXnHLftf6+/WLn32YuF3ld+r6zycvsfPumoqc6VUhe2a5IZ3XxZwFeo+
  i0jYbNu5WmrK9KJgiwsyrS/rzHg1z14PnuNjavjyfvTDhvtPWgsfT11ea7TN6seNe1vDbNZUB
  Fzf21SevTVjQWeBUuGn2+8Kw5xWu6n53vHe8HqpyLfnxVvrVNim7J1TonQlh+f4kxZF3e/7mN
  /GL7H7vexrys5dX3qZmZYczuLjW96lpf3MVsvd5UmFw/XH0+WFJ5/kLdtcpdwcbS6w+FVQyqW
  jAnsP1n1evHLtzEs6VeEem9MPeelaOFvqfa94+szSR+WzrV8cm+LUYzlGjXocYiemTIpp9xDK
  +Hz+7849e9crsRRnJBpqMRcVJwIAojprxFoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-585.messagelabs.com!1653891805!210808!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4030 invoked from network); 30 May 2022 06:23:26 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 May 2022 06:23:26 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id BE452100180
	for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 07:23:25 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id A414510018D
	for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 07:23:25 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 30 May 2022 07:23:07 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-semantic-version: upgrade 2.9.0 -> 2.10.0
Date: Mon, 30 May 2022 14:22:51 +0800
Message-ID: <1653891773-23292-2-git-send-email-wangmy@fujitsu.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/166258

Add dependence python3-pkg-resources

Changelog:
==========
 Ensure sorting a collection of versions is always stable, even with build metadata.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-version_2.9.0.bb => python3-semantic-version_2.10.0.bb} | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-semantic-version_2.9.0.bb => python3-semantic-version_2.10.0.bb} (76%)

diff --git a/meta/recipes-devtools/python/python3-semantic-version_2.9.0.bb b/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb
similarity index 76%
rename from meta/recipes-devtools/python/python3-semantic-version_2.9.0.bb
rename to meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb
index 4101f48043..0a24ca9ebc 100644
--- a/meta/recipes-devtools/python/python3-semantic-version_2.9.0.bb
+++ b/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb
@@ -4,11 +4,15 @@ HOMEPAGE = "https://github.com/rbarrois/python-semanticversion"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4fb31e3c1c7eeb8b5e8c07657cdd54e2"
 
-SRC_URI[sha256sum] = "abf54873553e5e07a6fd4d5f653b781f5ae41297a493666b59dcf214006a12b2"
+SRC_URI[sha256sum] = "bdabb6d336998cbb378d4b9db3a4b56a1e3235701dc05ea2690d9a997ed5041c"
 
 PYPI_PACKAGE = "semantic_version"
 inherit pypi setuptools3
 
+RDEPENDS:${PN} += " \
+    ${PYTHON_PN}-pkg-resources \
+"
+
 BBCLASSEXTEND = "native nativesdk"
 
 UPSTREAM_CHECK_REGEX = "/semantic-version/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.25.1


