Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE057C3A5A7
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 06:08:52 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.6946.1670479728927015320
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Dec 2022 22:08:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=agMYPXs3;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670479727; i=@fujitsu.com;
	bh=rmMf1OASHNPE1MxG14etS9lBjvCDzra13h4uP3JZ1kE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=agMYPXs3rHCWeKdI7oKW4tN8MWaI/AIbOMBle26L1o4E4TaGKBdUKHfFVLw9H6KfH
	 evMA31FC1WdAbMbTURS7ctZRZLhYcS3ZdZNBbpBVxBpywjoZgY+7t4LmGukqemeobk
	 yfoT3tWQrWFfdHNaImeqJifokOW0PVqINfYA5nCpWY+he3H6QzG4qObbzXTuQKuins
	 jYy5kumrjb88UXd42U+aY/Z8wwZMVGhmfDTAZf5QvBl9IlPls7uzZQAZax6PPi9Oin
	 ZczzVGPL1zCgzEehkBBjQe5u4JZcmjtaOJVsPHx73FJs5w2XeKqRVCjrQ6mW4jJ5VQ
	 FIP/ua0o4HM4A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8OxWTenfmK
  ywd1XFhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8a7V59YCp5wVjy5e5ytgbGbs4uRi0NI4AGj
  xIN1bawQziUmiVWtW9ggnN2MEheP/wPKcHKwCUhJ3Lj/HyjBwSEioCdx9Z8oSJhZQEXixe8ed
  hBbWMBfovn/b0YQmwUofvDwBjCbV8BR4vvP12BjJAQUJKY8fM8MEReUODnzCQvEHAmJgy9eME
  PUKErMvtzMAmFXSMya1cYEYatJXD23iXkCI/8sJO2zkLQvYGRaxWhWnFpUllqka6iXVJSZnlG
  Sm5iZo5dYpZuol1qqm5dfVJIBlEosL9ZLLS7WK67MTc5J0ctLLdnECAzGlOJk9h2Mb5b80TvE
  KMnBpCTK+6K6P1mILyk/pTIjsTgjvqg0J7X4EKMMB4eSBO+FyonJQoJFqempFWmZOcDIgElLc
  PAoifD61gKleYsLEnOLM9MhUqcYdTlmfm07wCzEkpeflyolzrsbpEgApCijNA9uBCxKLzHKSg
  nzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5uWoA5rCk5lXArfpFdARTEBH3PvfC3JESSJCSqqBaYG
  UhlUeU8rmHyuU+b1F5hnMqJyhbK4yYYXvTm+TW5ZJvIbat+16En4793P/2JO17pxaGHvqJ5YF
  O/hf54Q+tu5QLD630V+qzUDR9mOw3f6N11u9fEQmXrM4cFVDI6RJ7viWAzeWnFvou+lP/Vv50
  Kgso5nuS7wqNt9YbvLyoMWm2j0PraW3fd2h5uJ0ZPpfVb8fMv9+ddr/DN+hv0pqIktK1YWqtf
  P2K+0UfxeStEU94Fbd+SgX4xXSBYGnJSeovSp9UOK8Z0HgJ9Xc9Q7HLqyR99FnkD9UuGOW8eo
  f4id2XN//ddnptY9S5zSaLPhxXquxJLRzcvQig/544b8/DR88uCTv94qfeenjdMcdq5RYijMS
  DbWYi4oTAaBanlRNAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-745.messagelabs.com!1670479724!174183!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6691 invoked from network); 8 Dec 2022 06:08:44 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-18.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Dec 2022 06:08:44 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 6AAB8155
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Dec 2022 06:08:44 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 5E5D17B
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Dec 2022 06:08:44 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 8 Dec 2022 06:08:42 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 4.21.9 -> 4.21.10
Date: Thu, 8 Dec 2022 14:08:11 +0800
Message-ID: <1670479695-1183-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 06:08:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174372

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-protobuf_4.21.9.bb => python3-protobuf_4.21.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.21.9.bb => python3-protobuf_4.21.10.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.21.9.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.21.10.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_4.21.9.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_4.21.10.bb
index 7970d0b90..0ddd49cfe 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.21.9.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.21.10.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "61f21493d96d2a77f9ca84fefa105872550ab5ef71d21c458eb80edcf4885a99"
+SRC_URI[sha256sum] = "4d97c16c0d11155b3714a29245461f0eb60cace294455077f3a3b8a629afa383"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.25.1


