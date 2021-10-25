Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B70C433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 14:27:35 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web09.32953.1635172054656473741
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 07:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JCUvA0kF;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1635172052; i=@fujitsu.com;
	bh=ZoBFKuq8T5ey9ihBS4kEpwk9d0Sev2O46Flc7tJ3DLg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=JCUvA0kF2AVu0cFHPbxwBtPtv/9QFjNahLCIV0XL3LVk2i4deFvqUiTfNxtbM0SiU
	 Tg2EUsQp/epXUI61rXE8dtlk5oOh/bQnzLOrN5GPdKUYV6f5snRjCxm3FwrypApqOT
	 ZObWsq2XYzbib95mreFTCLetw52tN2D9171pAdJgjymGyrFgH1u/UrW2HxK3U6Oi5y
	 fgzyEY1Z+KwYDBfQWOB75gcjG5cRZITFAbp4dRp8gz6TQiMT6rcExsiwDqF29XH8Ln
	 NJnFV03qMAZKGj1/khaMjazAZzDG6KZfpnoM0X1/6v0SXQEeIb7kmjCvpxpJCilMLu
	 bhGO5iHjjrBvA==
Received: from [100.112.195.149] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.symcld.net id 8E/30-23860-4DEB6716;
 Mon, 25 Oct 2021 14:27:32 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRWlGSWpSXmKPExsViZ8MxSffKvrJ
  Eg56b3BZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bCD1dYClawVzRMvsfewHiArYuRi0NI4DGj
  ROvfx+wQznkmib0v3zFCOCcYJdb0XGbuYuTkYBNQk5h+6wZrFyMHh4iAnsTVf6IgYWYBFYkXv
  3vYQWxhAXOJDY8/MILYLAKqEvOmHABr5RVwkpj6+SFYXEJAQWLKw/dgcU4BZ4lfFx6ygNhCQD
  XXbu9hhKgXlDg58wkLxHwJiYMvXjBD9CpKzL7czAJhV0jMmtXGBGGrSVw9t4l5AqPgLCTts5C
  0L2BkWsVonlSUmZ5RkpuYmaNraGCga2hopGtoaaJrZqaXWKWbqJdaqlueWlyia6iXWF6sV1yZ
  m5yTopeXWrKJERi+KQWHnHYwvn/9Qe8QoyQHk5Io75n5ZYlCfEn5KZUZicUZ8UWlOanFhxhlO
  DiUJHi37QXKCRalpqdWpGXmAGMJJi3BwaMkwntqD1Cat7ggMbc4Mx0idYrRnuPN2iWLmDna7t
  0FkjMXHFzNzHG//dBqZiGWvPy8VClx3liQqQIgbRmleXBDYbF/iVFWSpiXkYGBQYinILUoN7M
  EVf4VozgHo5IwrzQwkQjxZOaVwO1+BXQWE9BZfrolIGeVJCKkpBqYtMormb9x6Amrs17WN9g/
  b1YHR57z+bNRMxsM93xqeZG0J0VHb5VDspdgV+vqf2c48iruaNVP1ld+7ixWsCrrQPDP/PvGB
  7Pmr/4Zxfd+tv2CyDna+mv37ehztWi4JmZQ1KV9+JCEVbpGp6in7s7T+5wD+yuFnpquuHanKK
  dU+U7/9o9CKxeFH66r/xjnrdUkl235wPbmKxXJU92zvza6S1Q22S2pDhZh0Xz3Vir2ufzqRoY
  fWx/+C2ecemVj18kOdpsu5Um+N7nfeT0UL/16Z64W+8X4Fazy97l2WyTPtZkuWMy3YFYYfzDL
  geWuYjuMJu04d+bV3v+5RaFLGPT1eDSS+BZZzgx8VHry50QlluKMREMt5qLiRAC0T5NZeAMAA
  A==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-265.messagelabs.com!1635172051!679634!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11739 invoked from network); 25 Oct 2021 14:27:32 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Oct 2021 14:27:32 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A0246100461
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 15:27:31 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 9039310044F
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 15:27:31 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Mon, 25 Oct 2021 15:27:13 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] dnf: upgrade 4.9.0 -> 4.10.0
Date: Mon, 25 Oct 2021 22:26:53 +0800
Message-ID: <1635172017-18309-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1635172017-18309-1-git-send-email-wangmy@fujitsu.com>
References: <1635172017-18309-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 14:27:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157345

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/dnf/{dnf_4.9.0.bb => dnf_4.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dnf/{dnf_4.9.0.bb => dnf_4.10.0.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf_4.9.0.bb b/meta/recipes-devtools/dnf/dnf_4.10.0.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.9.0.bb
rename to meta/recipes-devtools/dnf/dnf_4.10.0.bb
index 27df88342e..b7273d4051 100644
--- a/meta/recipes-devtools/dnf/dnf_4.9.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.10.0.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git \
            file://0001-dnf-write-the-log-lock-to-root.patch \
            "
 
-SRCREV = "f85cf31395156a2aa5d75e894e5794a771054fe4"
+SRCREV = "bd691b784f2158e633072d368579898d740e4347"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


