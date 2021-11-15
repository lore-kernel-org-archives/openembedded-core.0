Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C018C433EF
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 15:03:12 +0000 (UTC)
Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com
 [195.245.230.85])
 by mx.groups.io with SMTP id smtpd.web11.23401.1636988588324508965
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 07:03:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=D82bZ+v+;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.85,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1636988585; i=@fujitsu.com;
	bh=pAfDlnRv6BnVlgulk6SxZNWFvUPSBBYt/F5haeglShA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=D82bZ+v+CtOimsgzoyBAVUwXdLKPb3XOfbY5pYY0tjzNHJuE5Vh5J4KkClf8zbzAV
	 cP2nVf/znIxOjn+gc/ju/ykansa4TspatGCCAuAv7FWyFDznnUlhvDJ/1kokKGPI8L
	 ZdP5U/TAVS6PR8tJT3P7hQbREVVI1pWfDQrs8RMLRNhQbuyV/XlFpyBTLhv5rD/fd3
	 M3Nejy84gxq2vI5Thf1X/U3n4tceeDXYI+U7QXsf8QGFhsUke905bD3IWgkI4bDI0a
	 YqhwQlnA9CE8WDjugEArdiYIiFY/B0cQWISa5fr7/odtpCCQS2981y0kb9cWBTdBbo
	 p/Kka70PIwofA==
Received: from [100.112.196.154] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-west-1.aws.symcld.net id 84/FB-05453-9A672916;
 Mon, 15 Nov 2021 15:03:05 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRWlGSWpSXmKPExsViZ8ORqLuybFK
  iwc2VohZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bvyWWMBdukK753PWFsYLwn3sXIxSEk8JhR
  YtGCJ8wQznkmiffP3rNDOCcYJX7P2MfUxcjJwSagJjH91g3WLkYODhEBPYmr/0RBwswCKhIvf
  vewg9jCArYS79tWsIDYLAKqEkf+PwGzeQWcJN6+WMsIYksIKEhMefieGcTmFHCW+DbpPViNEF
  DNh2lbmCDqBSVOzoToZRaQkDj44gUzRK+ixOzLzSwQdoXErFltTBC2msTVc5uYJzAKzkLSPgt
  J+wJGplWMFklFmekZJbmJmTm6hgYGuoaGRrqGlha6hubGeolVukl6qaW65anFJbqGeonlxXrF
  lbnJOSl6eaklmxiBAZxScGztDsaeNx/0DjFKcjApifL+0Z+UKMSXlJ9SmZFYnBFfVJqTWnyIU
  YaDQ0mCd3cpUE6wKDU9tSItMwcYTTBpCQ4eJRFeg2KgNG9xQWJucWY6ROoUoy7Hu5+LFzELse
  Tl56VKifNOA5khAFKUUZoHNwIW2ZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfMGgKziycw
  rgdv0CugIJqAj7O/1gxxRkoiQkmpgKtugcMFVourkidd2/wpYPyVwlHC+n+OnmzzDcNW/Fa8k
  DqrkvrDhOn7u0CvzOeL3L1/aMF+Ia7XuVaeSZiHu/T881zkyz1rg1tHwuMPU6HlvQYPsYunXT
  67LPzeuTjW1dd77kHFb9Ykd/1Z03mhpl1h8MevF10/81ydOzmM+1fCbWfzwMbZZN+V3cshuaX
  gQn8UVrP+fccL/o9wNp+73cNwwL7dZOKv7SeeDgmNT3/r8Mlm892SfT6mPo13ynoksVREGSYF
  5/H+D9fl8l7vocUU8Orv+7/a79860sNmmWZxkPO6W9697w7PLLvL8HlWxlmpW+vM+bohNkWDc
  JW0qs4O71lrx7ulltwOvX635r8RSnJFoqMVcVJwIAIZN3p5nAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-285.messagelabs.com!1636988585!500397!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29368 invoked from network); 15 Nov 2021 15:03:05 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Nov 2021 15:03:05 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id D4DA710023C
	for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 15:03:04 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C81AF100229
	for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 15:03:04 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Mon, 15 Nov 2021 15:02:55 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libevdev: upgrade 1.11.0 -> 1.12.0
Date: Mon, 15 Nov 2021 23:02:35 +0800
Message-ID: <1636988556-78653-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636988556-78653-1-git-send-email-wangmy@fujitsu.com>
References: <1636988556-78653-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Nov 2021 15:03:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158296

determinism.patch removed since it is included in 1.12.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libevdev/libevdev/determinism.patch       | 44 -------------------
 ...{libevdev_1.11.0.bb => libevdev_1.12.0.bb} |  5 +--
 2 files changed, 2 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-support/libevdev/libevdev/determinism.patch
 rename meta/recipes-support/libevdev/{libevdev_1.11.0.bb => libevdev_1.12.0.bb} (81%)

diff --git a/meta/recipes-support/libevdev/libevdev/determinism.patch b/meta/recipes-support/libevdev/libevdev/determinism.patch
deleted file mode 100644
index 71cbd876eb..0000000000
--- a/meta/recipes-support/libevdev/libevdev/determinism.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 4f196323aba5b0f49979826533c65633b8a9b6a2 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Fri, 7 Feb 2020 12:29:56 +0000
-Subject: [PATCH] libevdev: Fix determinism issue
-
-The order of dict values is not deterministic leading to differing header file generation.
-Sort to remove this inconsistency.
-
-RP 2020/2/7
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Submitted: https://lists.freedesktop.org/archives/input-tools/2021-February/001560.html
-Upstream-Status: Backport [https://gitlab.freedesktop.org/libevdev/libevdev/-/commit/8d70f449892c6f7659e07bb0f06b8347677bb7d8]
-
----
- libevdev/make-event-names.py | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/libevdev/make-event-names.py b/libevdev/make-event-names.py
-index 88addd7..c973e2a 100755
---- a/libevdev/make-event-names.py
-+++ b/libevdev/make-event-names.py
-@@ -70,10 +70,10 @@ def print_bits(bits, prefix):
-     if not hasattr(bits, prefix):
-         return
-     print("static const char * const %s_map[%s_MAX + 1] = {" % (prefix, prefix.upper()))
--    for val, name in list(getattr(bits, prefix).items()):
-+    for val, name in sorted(list(getattr(bits, prefix).items())):
-         print("    [%s] = \"%s\"," % (name, name))
-     if prefix == "key":
--        for val, name in list(getattr(bits, "btn").items()):
-+        for val, name in sorted(list(getattr(bits, "btn").items())):
-             print("    [%s] = \"%s\"," % (name, name))
-     print("};")
-     print("")
-@@ -118,7 +118,7 @@ def print_lookup(bits, prefix):
-     if not hasattr(bits, prefix):
-         return
- 
--    names = list(getattr(bits, prefix).items())
-+    names = sorted(list(getattr(bits, prefix).items()))
-     if prefix == "btn":
-         names = names + btn_additional
- 
diff --git a/meta/recipes-support/libevdev/libevdev_1.11.0.bb b/meta/recipes-support/libevdev/libevdev_1.12.0.bb
similarity index 81%
rename from meta/recipes-support/libevdev/libevdev_1.11.0.bb
rename to meta/recipes-support/libevdev/libevdev_1.12.0.bb
index 5aca76dbd7..38f2bad606 100644
--- a/meta/recipes-support/libevdev/libevdev_1.11.0.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.12.0.bb
@@ -9,9 +9,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=80c550b3197bcb8da7d7557ebcc3fc46 \
                     "
 
-SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz \
-           file://determinism.patch"
-SRC_URI[sha256sum] = "63f4ea1489858a109080e0b40bd43e4e0903a1e12ea888d581db8c495747c2d0"
+SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
+SRC_URI[sha256sum] = "2f729e3480695791f9482e8388bd723402b89f0eaf118057bbdea3cecee9b237"
 
 inherit autotools pkgconfig
 
-- 
2.25.1


