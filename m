Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B7FC77B6F
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 09:40:19 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.41123.1681119616617483076
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 02:40:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WPZ2ibo1;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681119615; i=@fujitsu.com;
	bh=CDJrrjjT0FTk0BQI8oNyMioofMHFHoxgRD6N3kfabJU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=WPZ2ibo1/UtwpY2wBhFsyK3kGUG3PKgFuIyU/sLn/G5zMSR6jCZGm0MkJVzR28rzt
	 KVa7BVxpUnRomE9K4LLGq7bHZty6udXsehlxBmAoD4o4QdDcS88IV6DdXWGfRErBNX
	 +c6UVJO7HHUtx5gZ0X7SYUpZYCXmjndm+kvxyF6sh6oHBclOKLDMD0eo47wfvJLaZK
	 YlHkiwskjhnsVNoVAm617XWCs13QGrMUGA0QYXmgF786P0L0ycgqpk+EKiOqoB0jrn
	 JDQ7SB/cJMxO99MJEZkCyNbqcGHujxhgqF6WdZq4rnSgJhhULeQsQi6e0KMveFzhwh
	 bg/SLOacroRKQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRWlGSWpSXmKPExsViZ8ORpFt30zj
  FoHmWjsWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmvGuTb3gLlfF7ldbmBsY73F2MXJxCAk8YJQ4
  duQoM4RzmUli5+r5bBDOHkaJy0v3AGU4OdgEpCRu3P8PlODgEBHQk7j6TxQkzCygIvHidw87S
  FhYwFni0CsBkDCLgKrEqxvfmEBsXgEniV9vPrGB2BICChJTHr4Hm8gJVN60ezZYjRBQTdfLz6
  wQ9YISJ2c+YYEYLyFx8MULZoheRYnZl5tZIOwKicbph5ggbDWJq+c2MU9gFJyFpH0WkvYFjEy
  rGE2LU4vKUot0zfSSijLTM0pyEzNz9BKrdBP1Ukt1y1OLS3SN9BLLi/VSi4v1iitzk3NS9PJS
  SzYxAsM2pVj91w7GmX1/9Q4xSnIwKYnydnEZpwjxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4GW4D
  JQTLEpNT61Iy8wBxhBMWoKDR0mEV+IaUJq3uCAxtzgzHSJ1ilFRSpyX4zxQQgAkkVGaB9cGi9
  tLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5z1wEmsKTmVcCN/0V0GImoMVcLgYgi0sSEVJ
  SDUwRYlsX96jyX4ioX1j67jbn76alooG/DKQbfb+c1DA17P3Hl/bQ/OTV2et/vWQTmTvh/zqH
  7foWaxivBS4ykXj4IjO+PU2lcYtv3CeNHzvZvW7LsdrvvD5p96dPM1t+OUlKmOsc3pm/R5TbT
  9k2Z81j7nNvfvR/XBbLcfDQBT894wW+19c2enJ1dMjEMuQ9XMF8OEHkSyT3XtXanp3v1rzzcL
  z8uFaCyezoRNP162eJTWIwytswQ/aMW0ncrI9f2zwffZfTdLkmJp3pL/uT581qjwVzzFYbt7D
  Xz4hV0D9vYLK+nINl5mVViYcqthZ3xMT7r/xt96k8YDfpdq3EtviWi1vnMtXcsX2VsiHB5rYS
  S3FGoqEWc1FxIgD4/B6NVgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-548.messagelabs.com!1681119614!355071!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18870 invoked from network); 10 Apr 2023 09:40:14 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-20.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 09:40:14 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 703891C8
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:40:14 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 652F81B8
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:40:14 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 10:40:12 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-markdown: upgrade 3.4.1 -> 3.4.3
Date: Mon, 10 Apr 2023 17:39:52 +0800
Message-ID: <1681119595-25279-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681119595-25279-1-git-send-email-wangmy@fujitsu.com>
References: <1681119595-25279-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:40:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179879

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
 Restore console script (#1327).
 Improve standalone * and _ parsing (#1300).
 Consider <html> HTML tag a block-level element (#1309).
 Officially support Python 3.11.
 Switch from setup.py to pyproject.toml.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-markdown_3.4.1.bb => python3-markdown_3.4.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markdown_3.4.1.bb => python3-markdown_3.4.3.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-markdown_3.4.1.bb b/meta/recipes-devtools/python/python3-markdown_3.4.3.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-markdown_3.4.1.bb
rename to meta/recipes-devtools/python/python3-markdown_3.4.3.bb
index b398cd8bc4..1624e15f95 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.4.1.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.4.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed"
 inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "Markdown"
-SRC_URI[sha256sum] = "3b809086bb6efad416156e00a0da66fe47618a5d6918dd688f53f40c8e4cfeff"
+SRC_URI[sha256sum] = "8bf101198e004dc93e84a12a7395e31aac6a9c9942848ae1d99b9d72cf9b3520"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.34.1


