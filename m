Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC0DCCA47B
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 04:26:08 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web12.20989.1656563156349213124
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 21:25:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cj6kajEm;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656563158; i=@fujitsu.com;
	bh=eF3nz1PFxRYWn1o9EDnjxav2nOoP8dGVtswtAQZwDK0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=cj6kajEmsci7LF38HnmhqSx4g13oEvhC9oJXKAA2MQj+waJLdedmcOYEiMoZnzZ8m
	 3gYDRrA3MZXP7NWcuNIaCCuRgWwWoR/e+8P3EjyalB+D8K8PuMNt9LaeyeDMhYOzJn
	 o3eFqo17kABVhn1XRh7jcH06Dx9JQu5Fsl+562LCNss4/1FlAuAImjPYJ+MEKVSwav
	 mPp6gxnkdOaIhJWCJ5fsjxO3TeORXFxaiK0SL6hyb69BXRy0PiUA0TgnNI4mdt+4Oq
	 luSrTp7zR7jaAdxfsJ2RlqeUBPmVYH33HHpp4kG55zm/ilzUfgqO8ozX2Dz0SnI0Ll
	 Us14b9Pvh0Hyw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNIsWRWlGSWpSXmKPExsViZ8MxSfeq6t4
  kgxXrVCzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oz5c7ezF0znqHjzaQtjA+M69i5GTg4hgceM
  Epd7NLsYuYDsa0wSH/8eYINw9jBKbHo3kQmkik1ATWL6rRusXYwcHCICehJX/4mChJkFVCRe/
  O5hBwkLC5hK7NjBCBJmEVCV+HdlBTOIzSvgJDFzbT/YFAkBBYkpD9+DxTkFnCXW7mhlhLjBSe
  LWvAesEPWCEidnPmGBGC8hcfDFC2aIXkWJ2ZebWSDsCokZM7axQdhqElfPbWKewCg4C0n7LCT
  tCxiZVjFaJxVlpmeU5CZm5ugaGhjoGhqa6hpb6hoZGuslVukm6qWW6panFpfoGukllhfrpRYX
  6xVX5ibnpOjlpZZsYgSGcEqx+tUdjJtX/dQ7xCjJwaQkymvIvjdJiC8pP6UyI7E4I76oNCe1+
  BCjDAeHkgTvcSWgnGBRanpqRVpmDjCeYNISHDxKIryhIGne4oLE3OLMdIjUKUZjjqtXruxl5p
  j5te0AsxBLXn5eqpQ47xsVoFIBkNKM0jy4QbA4v8QoKyXMy8jAwCDEU5BalJtZgir/ilGcg1F
  JmFcbZCFPZl4J3L5XQKcwAZ2yc9oekFNKEhFSUg1M9eeMQt+Xn7dd8X+lfLmOlGKXsu/ZFJcv
  /0q6zQuFf+QxOF5Rar4jNedG/q2NMxx+hB9cHVx6VOTYMiFZx5g7ylXhLjWLLPyM6hVjHm2ye
  TFr5ZRzzS/rlqxosPLf8PRf9mvf+4tCs6f2TfolfcKjcOF7Y9blCrrp8k5f3pXPSihwPZCTIV
  5lPjPzuxZ7sHNV0bnYAu3E6S27pfeYfmJynnop7blXbpvjxB/BPU6zv6r8Mc+cXLDuyonAk7/
  5F+k2GwjI8x/4I7VB9K9tu7W5QITfmRDh3MwvG2fPK4wNq2W/sUOm/tWL1s4HK6uzHLIOeyZ7
  3+Z4Jzft/8HMTbmev59ejFkkHe46r2AHi48SS3FGoqEWc1FxIgBSBiFCbgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-565.messagelabs.com!1656563157!17256!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31667 invoked from network); 30 Jun 2022 04:25:57 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Jun 2022 04:25:57 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 4F7971000C1
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 05:25:57 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 427FD100078
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 05:25:57 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 30 Jun 2022 05:25:55 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] repo: upgrade 2.26 -> 2.27
Date: Thu, 30 Jun 2022 12:25:35 +0800
Message-ID: <1656563137-11471-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656563137-11471-1-git-send-email-wangmy@fujitsu.com>
References: <1656563137-11471-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 04:26:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167398

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/repo/{repo_2.26.bb => repo_2.27.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.26.bb => repo_2.27.bb} (95%)

diff --git a/meta/recipes-devtools/repo/repo_2.26.bb b/meta/recipes-devtools/repo/repo_2.27.bb
similarity index 95%
rename from meta/recipes-devtools/repo/repo_2.26.bb
rename to meta/recipes-devtools/repo/repo_2.27.bb
index ff5b7eb6aa..3c1e3acd7c 100644
--- a/meta/recipes-devtools/repo/repo_2.26.bb
+++ b/meta/recipes-devtools/repo/repo_2.27.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            file://0001-python3-shebang.patch \
            "
-SRCREV = "bdcba7dc36f1c8e6041681eb5b3b5229c93c7c5c"
+SRCREV = "68d69635c7bfef6ed8a5c7e29246265611471e0f"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.25.1


