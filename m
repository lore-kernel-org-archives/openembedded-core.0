Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C4DC433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 01:02:56 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.1330.1648515775145230204
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 18:02:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xgQdz8cH;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648515773; i=@fujitsu.com;
	bh=qpDDVEDTLNAMUhMiPFIDoYmMQmrSW/TIEnJIr2oaH0Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=xgQdz8cHSBNRgXT7siMkKk+8DM8Xd275UCsum1Sb02F+SPARqBVF8J6WbnFwNW6Fk
	 aGlp6zf1sbAxLz3Wg9qmnD2TOSdUcD6Oos0DOOPIZP+VSTQIkZizrudeBRD50QO1XF
	 BShVtI8egVvkS50TZGnQV5Cn7X46PF5kEUqop0RqXsbjVyTUHuE3vHnGha8NXaLxW+
	 VY2x9FsjEF9WHWf9nuujnuQ92nasl4eFgQNBnep+qkRIkichVdTN+dgkn6nemQIeDi
	 40Cs/rKVZxiMkLS2n1n/kGgapOqXOFkKFClppDXfK322KFaE1B6I65NKgl3CEqGcub
	 xGJo+v5qCn8uQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8ORqLsnyin
  J4FOPnsWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmtG85CNTwTaOin0Pe1kbGJ+wdzFycQgJPGaU
  mD3lBiuEc55J4tHBvYwQzh5GiebZE4AcTg42ATWJ6bdAqjg4RAT0JK7+EwUJMwuoSLz43cMOY
  gsLOEo0XH/MAmKzCKhK/L08gRnE5hVwknh/Zz9YXEJAQWLKw/dQcUGJkzOfsEDMkZA4+OIFM0
  SNosTsy81Q9RUSs2a1MUHYahJXz21insDIPwtJ+ywk7QsYmVYxWiUVZaZnlOQmZuboGhoY6Bo
  amuoaG+uam+glVukm6qWW6panFpfoGukllhfrpRYX6xVX5ibnpOjlpZZsYgQGZUqxotcOxlcr
  fuodYpTkYFIS5b2g6ZQkxJeUn1KZkVicEV9UmpNafIhRhoNDSYLXNBIoJ1iUmp5akZaZA4wQm
  LQEB4+SCO+xUKA0b3FBYm5xZjpE6hSjopQ47xGQPgGQREZpHlwbLCovMcpKCfMyMjAwCPEUpB
  blZpagyr9iFOdgVBLmnQsyhSczrwRu+iugxUxAi+seO4IsLklESEk1MEl9ni+27v69DYvScw5
  oHnpytPDBprsnmBw7Gp9Hfs5S0513JfmD9VGXxv4wzQ0SJYV+5ueeVF1g5WMWjf12aOOMXmu+
  jXqWImJqjQs+fnf4VO79LlBl9aTbtVc/HniaeDx0SWYfc3qqk3/z2m0BOcV5wa8TFbyPv9Dnn
  aIQNqtw6wyvpw5PzBvWXI17O2+xI/+Kd8Us184+3FyX7SDbJLql6D1L5dM/V9Z92fXWzHKr5L
  l9sZfM1XSMT3Rn92yI2LWqNM9W8fnusltTeLe/dHJWm3n09Z2qT3oC2hppl/yzPPbNvvxHOfR
  d/nG9oz83P5swyd8y7YvI4tn3jpU0GPh8uX963+VHvO89ZjrKlhxUYinOSDTUYi4qTgQA/ttG
  9EUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-548.messagelabs.com!1648515772!15555!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22814 invoked from network); 29 Mar 2022 01:02:52 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-14.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Mar 2022 01:02:52 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 56D7F10018B
	for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 02:02:52 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 3C09510004D
	for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 02:02:52 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 29 Mar 2022 02:02:29 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-jinja2: upgrade 3.0.3 -> 3.1.1
Date: Tue, 29 Mar 2022 09:02:20 +0800
Message-ID: <1648515740-20907-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 29 Mar 2022 01:02:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163727

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-jinja2_3.0.3.bb => python3-jinja2_3.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jinja2_3.0.3.bb => python3-jinja2_3.1.1.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-jinja2_3.0.3.bb b/meta/recipes-devtools/python/python3-jinja2_3.1.1.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-jinja2_3.0.3.bb
rename to meta/recipes-devtools/python/python3-jinja2_3.1.1.bb
index c416acbf92..0a2bcd71f5 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.0.3.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.1.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/Jinja/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "611bb273cd68f3b993fabdc4064fc858c5b47a973cb5aa7999ec1ba405c87cd7"
+SRC_URI[sha256sum] = "640bed4bb501cbd17194b3cace1dc2126f5b619cf068a726b98192a0fde74ae9"
 
 PYPI_PACKAGE = "Jinja2"
 
-- 
2.25.1


