Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96EE5C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:26:14 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.31198.1654518373161028161
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:26:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RIWgqNJL;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654518371; i=@fujitsu.com;
	bh=HID0+rV4ZIO4qUfnvEsxtgJGbK3Rm8oTVdKCGOOHmEg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=RIWgqNJL5jdPIBJWVUbYx5KPbAFU1hobkBkaax/wk65s8cGJqoyjt1a6biFCf8Gqy
	 KLHjXF9FhW2F00N/Lcqn2B8OZoynNuuziFx88W9jq+9rRHeax/LmuJOCfHDnORTSoT
	 zFG/i5lGLMmx39Cp73V5ibT4mNzSmj6f1HYkHvgwngkopILQnwmUD3BRe8SIIc96MN
	 7+T7NM5ya6G2Mf6SAiijS9NFJ3Qv69M14krrawVE8NLlIBBZ20ZSfumsbjgj4RGZWx
	 sz2kiDnwl7RkopKFoh3WCNLdXf1Csqw4zEPOZ45cJQiUKl9RtNVHDaFNomoaXE7YdM
	 5ostsZLcVohrg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8ORqJv0aW6
  SwfJZlhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bXrBVsBY3cFTO617M3MN7m7GLk5BASeMwo
  sbxPrIuRC8g+zySxrHsnK0RiN6PEk7diIDabgJrE9Fs3gOIcHCICehJX/4mChJkFVCRe/O5hB
  7GFBewkLv1aCmazAMX7zu5iArF5BRwlfr6eBzZSQkBBYsrD98wgNqeAk8TRJd+ZIVY5SmxqPs
  MCUS8ocXLmExaI+RISB1+8YIboVZSYfbmZBcKukJgxYxsbhK0mcfXcJuYJjIKzkLTPQtK+gJF
  pFaN1UlFmekZJbmJmjq6hgYGuoaGprrGlrpGhsV5ilW6iXmqpbnlqcYmukV5iebFeanGxXnFl
  bnJOil5easkmRmAIpxSrX93BuHnVT71DjJIcTEqivPbX5iYJ8SXlp1RmJBZnxBeV5qQWH2KU4
  eBQkuCt+wCUEyxKTU+tSMvMAcYTTFqCg0dJhNf6HVCat7ggMbc4Mx0idYpRl2Pm17YDzEIsef
  l5qVLivMdBZgiAFGWU5sGNgMX2JUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvA9ApvBk5pX
  AbXoFdAQT0BE+D+aAHFGSiJCSamCq4f3D+fLBnn23TS4qO4VJnNMrrJrLYcNvJs/fb7T6vOVc
  HmGDHbPFC8wTdutsfSni1nf6VNB0eQNVFv3f93oZfi/wmnRw5ynRFV1Jqj/NUnyTFFZtj5Zx0
  95xeG7Zi7SzuTKlqTFrjwgc07l5+NI5yfUHMpVqqnKV9s7kcZw4sWvpuextK+e9KS6+9vVP2k
  7rrycVf5moz61/cPcir7uPwqEFpSmVvf3LHumw309f/zSxaHv4HG+ubn5rsZWFCYabX5gm395
  +iF3uKcvsPezVxzvZPRKU+7mDM0yn5/NppJ/f8SeeI3pXYrm7zrayXu8CtQ6XwnWN0QeLNF8c
  qF9+fu/6PZm53nY9KeXBS5RYijMSDbWYi4oTAZY2LYRoAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-565.messagelabs.com!1654518370!629432!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30848 invoked from network); 6 Jun 2022 12:26:10 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-18.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Jun 2022 12:26:10 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 881911001B2
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:26:10 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 7C75B100191
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:26:10 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 6 Jun 2022 13:25:59 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] lttng-ust: upgrade 2.13.2 -> 2.13.3
Date: Mon, 6 Jun 2022 20:25:35 +0800
Message-ID: <1654518337-9206-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1654518337-9206-1-git-send-email-wangmy@fujitsu.com>
References: <1654518337-9206-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 12:26:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166618

Changelog:
==========
* Document ust lock async-signal-safety
* Fix: don't use strerror() from ust lock nocheck
* Fix: remove non-async-signal-safe fflush from ERR()
* Fix: Pointers are rejected by integer element compile time assertion for array and sequence
* Fix: statedump: invalid read during iter_end
* Fix: bytecode interpreter context_get_index() leaves byte order uninitialized

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lttng/{lttng-ust_2.13.2.bb => lttng-ust_2.13.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.13.2.bb => lttng-ust_2.13.3.bb} (95%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb b/meta/recipes-kernel/lttng/lttng-ust_2.13.3.bb
similarity index 95%
rename from meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.13.3.bb
index 516d90a196..cc88bf5b11 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.13.3.bb
@@ -34,7 +34,7 @@ SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-Makefile.am-update-rpath-link.patch \
            "
 
-SRC_URI[sha256sum] = "08679a1dfc2c9428885273861628aa5d828972f389a38bb08fdce39adee589b7"
+SRC_URI[sha256sum] = "2cc42f51145050430ac4ab72b32d95fd78d5566ccbe44e14a8fcdd23c0ed8f6f"
 
 CVE_PRODUCT = "ust"
 
-- 
2.25.1


