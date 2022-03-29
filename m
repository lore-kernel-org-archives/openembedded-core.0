Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA8AC433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 00:54:22 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web11.1245.1648515261034201758
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 17:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=eB2I5oPE;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648515259; i=@fujitsu.com;
	bh=CLDoCey6WbT4e0LC9BIuPO6BK9vYXyfflpO+9wM7qd8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=eB2I5oPESP4hdANNNIItl6Gtak+uZNw6jvkuGT8uJQvA32CtGbVmbk59u4FmWUie0
	 h7nTBlkmShWiuAwfGL9wZZ3y8ZU95vg7PYDFaFh03t/1ZZI0mdyacXiZmpmoA1Xlh9
	 HX5ckT/Ncqs04Y6oHGy3FojnZpjxNKrlkZlzJPg21thDZbXGjmAv7wQG1aZonhfPS5
	 w9igxvQT7Of+6JjBzpxFGEdgs3wbLNJ2p7ezwDbhBH7omRylD5rJxk0ZAHz4WUzLlT
	 zLRa4kG4IFKD7fHIFOCVzQKuK5Emo5jYZSB0E+s/ZOWKn+2IFyvGzny61duCfiIv7s
	 fB2bcGn/oeHpw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MRorsrwin
  JYP4CLos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePdwb/MBdM5K7Z1TGVqYNzB0cXIySEkMItJ
  4tRUZgh7D6NE64J8EJtNQE1i+q0brF2MHBwiAnoSV/+JgoSZBVQkXvzuYQexhQVcJE7N+8gEY
  rMIqEpse7qcBcTmFXCS2H7gESOILSGgIDHl4XtmiLigxMmZT1gg5khIHHzxghmiRlFi9uVmFg
  i7QmLWrDamCYy8s5C0zELSsoCRaRWjVVJRZnpGSW5iZo6uoYGBrqGhqa6JrpGxpV5ilW6iXmq
  pbnlqcYmuoV5iebFeanGxXnFlbnJOil5easkmRmB4pRSzvN/B2NT3U+8QoyQHk5Io7wVNpyQh
  vqT8lMqMxOKM+KLSnNTiQ4wyHBxKErwJoUA5waLU9NSKtMwcYKjDpCU4eJREeI+BpHmLCxJzi
  zPTIVKnGBWlxHmdwoESAiCJjNI8uDZYfF1ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMwrEQ
  Y0hSczrwRu+iugxUxAi+seO4IsLklESEk1ME1MvbzvQNm/Fv3WmTK/XXo+fDjRZbIkTJDxWun
  1Hee1JMzn3QgQs3dyq7EJOZj4UtJoQ2vs0T/db+Qeqsw90hqycOu1nuBnd39VPpx5VrlF197o
  zk7V51svvHbLe5i91eL5m7YqzVvGso8+e82xljbiaOxhs7K7eIijPGPJ2qNFz/RP1604n/938
  pufXL13DnSH2GdwnWrymidi9fpRmBOXUvzc4kdtUyTTbpsf7JstNWmSJNft9a3vPs//0su0Km
  F7RUL8x6fXu4osFnP2NMl0Xq67W5v3Tu9Q49saRfl3pVlP3lxblaM5tYbjeM9V3lNWixdNbW0
  r8pfZejZktfWp+tN8P7eeYU4xZDa4/UmJpTgj0VCLuag4EQCAbBruKgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-585.messagelabs.com!1648515257!3027!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21918 invoked from network); 29 Mar 2022 00:54:18 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-11.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Mar 2022 00:54:18 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 22T0sDcL026434
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 01:54:17 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 29 Mar 2022 01:54:11 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-imagesize: upgrade 1.2.0 -> 1.3.0
Date: Tue, 29 Mar 2022 08:54:00 +0800
Message-ID: <1648515240-20812-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Mar 2022 00:54:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163726

Add dependency python3-xml.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-imagesize_1.2.0.bb => python3-imagesize_1.3.0.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-imagesize_1.2.0.bb => python3-imagesize_1.3.0.bb} (71%)

diff --git a/meta/recipes-devtools/python/python3-imagesize_1.2.0.bb b/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb
similarity index 71%
rename from meta/recipes-devtools/python/python3-imagesize_1.2.0.bb
rename to meta/recipes-devtools/python/python3-imagesize_1.3.0.bb
index 62dc226e9d..7d8eb80cf3 100644
--- a/meta/recipes-devtools/python/python3-imagesize_1.2.0.bb
+++ b/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb
@@ -4,8 +4,10 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=0c128f0f7e8a02e1b83884c0b5a41cda"
 
-SRC_URI[sha256sum] = "b1f6b5a4eab1f73479a50fb79fcf729514a900c341d8503d62a62dbc4127a2b1"
+SRC_URI[sha256sum] = "cd1750d452385ca327479d45b64d9c7729ecf0b3969a58148298c77092261f9d"
 
 inherit setuptools3 pypi
 
 BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS:${PN} = "python3-xml"
-- 
2.25.1


