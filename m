Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA92EC05027
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 02:41:14 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.5708.1676256065371277070
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 18:41:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=L6/3egqt;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676256063; i=@fujitsu.com;
	bh=obGrMmUIxx4df+aok4728+r0wK1n5XF2j/EMl8SZLJw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=L6/3egqtFBQV5fiQJkKvRYmSRZ5+YFGRPh3k2sxsxe+q1OWMC/4eeNvVsAKfzoXeH
	 fvqQrshbd+uik9ZzXkB/vRgTetPGxO+yzVZhTs2iuuu5a+Yp/JZhfWFRyjPcnR24Iu
	 IvPPzdmXxykD1SbkRBCQnz0qxntc9wSsiJ9cizaFNOuj0wTRYSpRrpx0MeRxqYiE90
	 DJhzL7hUd1cV+UdaMzFd6/yYZNYekl8V5AyQIN2AM+HGYb8QtZc0lM9QvQ8QJk23WJ
	 GnkWH35U0dvRjTSXrfgDwjIXUaa4yZza1erNCtVNPUbRmAke7uEhzMVgPgUlnhxaxv
	 DEiVLlAZvNXrQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORqGu3+GW
  ywfr/ZhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8axpmksBRO4Ki7fe8XYwDiXs4uRi0NI4DGj
  xM22e6wQznUmiYMfD7FBOHsZJS7PeAXkcHKwCUhJ3Lj/H8jm4BAR0JO4+k8UJMwsoCLx4ncPO
  4gtLOAo8bhvFzNICYuAqsSC7YEgYV4BJ4lvG3rBSiQEFCSmPHzPDGJzCjhLbD36HcwWAqrpOr
  CMDaJeUOLkzCcsEOMlJA6+eMEM0asoMftyMwuEXSnR+uEXlK0mcfXcJuYJjIKzkLTPQtK+gJF
  pFaNpcWpRWWqRroVeUlFmekZJbmJmjl5ilW6iXmqpbnlqcYmuoV5iebFeanGxXnFlbnJOil5e
  askmRmDgphSzvtnBuK3vr94hRkkOJiVR3j6Ol8lCfEn5KZUZicUZ8UWlOanFhxhlODiUJHilF
  gDlBItS01Mr0jJzgFEEk5bg4FES4bWYAJTmLS5IzC3OTIdInWJUlBLn5V8IlBAASWSU5sG1wS
  L3EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3t2zgKbwZOaVwE1/BbSYCWjxYz6wxSWJCCm
  pBqbGQw58d0pOJsWXb1rkrvrAgHf6rbVSFbOdxIKzd7lkb9lp/Mhg46THPfO5lSNtc39kL8sM
  mhzxX/BDh7Lpyq+xRp/jJ800+l1RtCOC+zbb4k+F9lOWZp7tO6bJKPF17eMCDYMDxw/ZS52cc
  UZiQfyz174s7BsWHtrJLyWlc/5fis7PZWENU47uDq/fL2KpsMD51KnweSuVF3XarVr7Ntf2vV
  +htXy6i/+Eze+eeG/rej7ny3X1lyvd7i7dsv6CdecFzf1n9txw8jzEyXZa51lLwIFnzMb/Ljw
  yc3QyZ1gc9WFG/qmAU41GG2eHZBxndOWvu6XSdOqugN+GT2ZfzhlkTV10U/3xQ4XNLzuudvHf
  UmIpzkg01GIuKk4EAHlo4EFXAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-587.messagelabs.com!1676256062!519385!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14455 invoked from network); 13 Feb 2023 02:41:02 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Feb 2023 02:41:02 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 7AAFF100197
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 02:41:02 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 6D5E9100194
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 02:41:02 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 13 Feb 2023 02:41:01 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-zipp: upgrade 3.12.0 -> 3.13.0
Date: Mon, 13 Feb 2023 10:40:43 +0800
Message-ID: <1676256044-19550-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676256044-19550-1-git-send-email-wangmy@fujitsu.com>
References: <1676256044-19550-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 02:41:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177079

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 In tests, add a fallback when func_timeout isn't available.
 gh-101566: In CompleteDirs, override ZipFile.getinfo to supply a ZipInfo for implied dirs.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-zipp_3.12.0.bb => python3-zipp_3.13.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.12.0.bb => python3-zipp_3.13.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.12.0.bb b/meta/recipes-devtools/python/python3-zipp_3.13.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-zipp_3.12.0.bb
rename to meta/recipes-devtools/python/python3-zipp_3.13.0.bb
index 1b36e42543..8df5d4637b 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.12.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.13.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
-SRC_URI[sha256sum] = "73efd63936398aac78fd92b6f4865190119d6c91b531532e798977ea8dd402eb"
+SRC_URI[sha256sum] = "23f70e964bc11a34cef175bc90ba2914e1e4545ea1e3e2f67c079671883f9cb6"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.34.1


