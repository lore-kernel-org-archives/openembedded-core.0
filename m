Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5353C77B72
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 06:47:10 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.47717.1681714029189412627
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Apr 2023 23:47:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Dq9F2WIb;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681714027; i=@fujitsu.com;
	bh=pdOj3atlumGUrsHdJejPQ6x1tLwJV+QWywzb4tbqnZQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Dq9F2WIbXuGOUuPN01Q6EuWLZPZ8GGO3AJrJlFdMy3VAGYkslowdKZKPmuRdQllRp
	 1wfhdPvON0pNJqaIIx9GldYW3OWJvmkoUjnqcZsr73mHeDXFu8LklzEz6Pd0Yl7/kG
	 1OUq4WG49wippDlACIfhr65uEJP6NXeeHensOvDpiOJJEMF8M6lxMN5RSeHPrXEQgI
	 QI3q67PrR6ppDt1H5uoUONPmOWKIYvwhvHc8uluFZBw6KHLY82c7zAgrh6/q7ToRii
	 plfE5sG+G5A8KgVWwGvKsZR3ZZ6i+MbmgApSDE1W1rBiyv6hqqejADmWtVLqBNIwAu
	 x5Kvit4XtTFQw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqJv12ib
  F4PEPA4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaPr+RL2goncFTO39bA0MG7n6mLk4hASeMwo
  0fv+DDuEc51J4uCWFsYuRk4gZy+jxPUudxCbTUBK4sb9/2xdjBwcIgJ6Elf/iYKEmQVUJF787
  mEHsYUF4iTeflsJZrMIqErc2NYEZvMKOElcXXsIzJYQUJCY8vA9M4jNKeAssf/kDyaIVU4Sd2
  9/YoKoF5Q4OfMJC8R8CYmDL14wQ/QqSsy+3MwCYVdKtH74BWWrSVw9t4l5AqPgLCTts5C0L2B
  kWsVoXpxaVJZapGtoqJdUlJmeUZKbmJmjl1ilm6iXWqqbl19UkqFrqJdYXqyXWlysV1yZm5yT
  opeXWrKJERi8KcVpx3cwvuz7q3eIUZKDSUmU90WqdYoQX1J+SmVGYnFGfFFpTmrxIUYZDg4lC
  d6A5zYpQoJFqempFWmZOcBIgklLcPAoifAaPwNK8xYXJOYWZ6ZDpE4xKkqJ80q8AkoIgCQySv
  Pg2mDRe4lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO+1F0BTeDLzSuCmvwJazAS0WE4JbHF
  JIkJKqoFJRtEuj12w2iQyeFb2Vt7H1RdvRR+bayv4VmwhmxqbYPkFpSVnH/D+mlZ7TPvnYvaF
  8U/zs69/clxx/8aOPdzCevu0BGRDbvjM7TKc/frE+xDZG79PNkoG1zRrnpkxu+7spXfJfzrOp
  c9N3mzbFCB689WvsJU7Hd8JeZznX2nw0oUrYXLEknP7Sx63xrJWrjYOi5M7dG7BUjPRp357Gk
  6c9Z75JffBwvtqUsy9bR+ELq7d/8sp/zSXlcyFT9ae0hXN+q9Ntnfcr/tSpXFh0qNJi70vpoS
  2LdNMKDq/hJ+5SPviNFFbzse+f0vX5vsf7RN2XMWSzHRRf8XpvifzNq1kfST97J/vxaqOhF0X
  Gow+KbEUZyQaajEXFScCAHbjvMlZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-728.messagelabs.com!1681714026!211585!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13438 invoked from network); 17 Apr 2023 06:47:06 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 06:47:06 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 3E3831001A5
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:47:06 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 30EBB1001A1
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:47:06 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 07:47:04 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade 2.84.0 -> 2.85.0
Date: Mon, 17 Apr 2023 14:46:33 +0800
Message-ID: <1681713993-18603-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681713993-18603-1-git-send-email-wangmy@fujitsu.com>
References: <1681713993-18603-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 06:47:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180130

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://github.com/googleapis/google-api-python-client/blob/main/CHANGELOG.md

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ent_2.84.0.bb => python3-google-api-python-client_2.85.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.84.0.bb => python3-google-api-python-client_2.85.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.84.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.85.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.84.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.85.0.bb
index f22c52702..6acac0647 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.84.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.85.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "c398fd6f9ead0be23aade3b2704c72c5146df0e3352d8ff9101286077e1b010a"
+SRC_URI[sha256sum] = "07b21ef21a542dd69cd7c09817a6079b2769cc2a791981402e8f0fcdb2d47f90"
 
 inherit pypi setuptools3
 
-- 
2.34.1


