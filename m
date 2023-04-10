Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF510C76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:57:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.40572.1681117030911715662
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:57:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Tf399R9S;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681117029; i=@fujitsu.com;
	bh=Ns/MXXwni3xNrlwj2Bvkq9Tl3zHxPJVrfddMLzInLRk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Tf399R9SNbEJqHXgSIkaoobG6w7UqBJQOStAUfEyaHI9qsduNfXvhuQ4V8JSIbzeY
	 VWWNH8MQJbhGzxpajBi91BpgOOXT8oG7Q9rJ7VHefS0lvoGNxb0/aSTk3nrfQMUZkx
	 faepzYFYQYrzZXj/acegIhabkG5/JfUCUJPVDTAGf5tP29VsGAaZPGHTFEqGN2zL5R
	 CZ4zwd3PsiNDVfK0oYZESewuVRj7Bb3uqFjli+Xzb9UTw2Jmc+p4Uo0Kliofm85FtS
	 kRQSr2UA85ZqV8xGIzSFNddYp5lGDn0oTedx/3PofijQoa1L4m24SJtHYGe8slZUp3
	 uOsqaawmG+yCg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpJty3jj
  FYOt9TYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePpvK2sBS/YK1qnLGRpYPzD1sXIxSEk8IBR
  omFLA5RzmUni05o3jBDOHkaJm8u7mLoYOTnYBKQkbtz/D1TFwSEioCdx9Z8oSJhZQEXixe8ed
  hBbWMBCon3fSkYQm0VAVeLp9I9sIDavgJPExCmrwWokBBQkpjx8zwxicwo4S7R3dYHVCwHVtJ
  /vYIaoF5Q4OfMJC8R8CYmDL14wQ/QqSsy+3MwCYVdINE4/xARhq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaFacWlSWWqRraKCXVJSZnlGSm5iZo5dYpZuol1qqW55aXKJrpJdYXqyXWlysV1yZm5yT
  opeXWrKJERi8KcWKrDsYL/X91TvEKMnBpCTK28VlnCLEl5SfUpmRWJwRX1Sak1p8iFGGg0NJg
  tfgLFBOsCg1PbUiLTMHGEkwaQkOHiUR3opjQGne4oLE3OLMdIjUKUZFKXFeyXNACQGQREZpHl
  wbLHovMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLm3XYYaApPZl4J3PRXQIuZgBZzuRiALC5
  JREhJNTCtM/CdxPJh3oWNiVe+PRSdZ1wQlR7N5hicPl3rplhyC0fqdP7gZivW7rM8q/u9J5kL
  syVd8IlY/Fcx7A3HxJkq6ldiBN+m/t95k8X1/M6bqtoc5hrPLsdqSq8Ss3rFP53vefLlUu3WT
  JVpliuS3xUeXCCi9/pUFHto1Negl5czZvx5kZ7smmXvJp7BH/t2e0Sa2Sll/66//mGFNU2hO+
  VYq/27X//MbEg83HRGUcZn3q5TH+qTJx7ID1k7ZcEquwsz2p9FMOi0LpR9ElfAyvKwZd+ZroP
  znGYcW58eUO2hMMf0DXP0PZkP5Z09qx7+evnv+NFQ+7e1XzgvpfSk2aoeevztGa+wQ0Cf/5WP
  /5RYijMSDbWYi4oTAZ6mOaBZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-548.messagelabs.com!1681117028!351723!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12550 invoked from network); 10 Apr 2023 08:57:08 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-9.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 08:57:08 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 610361CD
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:57:08 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 55E651C7
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:57:08 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 09:57:06 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] dnf: upgrade 4.14.0 -> 4.15.0
Date: Mon, 10 Apr 2023 16:56:37 +0800
Message-ID: <1681116997-24685-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681116997-24685-1-git-send-email-wangmy@fujitsu.com>
References: <1681116997-24685-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 08:57:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179847

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/dnf/{dnf_4.14.0.bb => dnf_4.15.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dnf/{dnf_4.14.0.bb => dnf_4.15.0.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf_4.14.0.bb b/meta/recipes-devtools/dnf/dnf_4.15.0.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.14.0.bb
rename to meta/recipes-devtools/dnf/dnf_4.15.0.bb
index 62df8c4ace..7bf9547424 100644
--- a/meta/recipes-devtools/dnf/dnf_4.14.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.15.0.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
            file://0001-dnf-write-the-log-lock-to-root.patch \
            "
 
-SRCREV = "e50875b3f5790f70720bdb670e1dd2bf4d828744"
+SRCREV = "5306910d06631bc93fa3ece0e70ed27ee592b0aa"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


