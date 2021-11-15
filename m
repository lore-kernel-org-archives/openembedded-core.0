Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADCCFC433EF
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 15:04:54 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.23426.1636988693432539421
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 07:04:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=khRib0pq;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1636988686; i=@fujitsu.com;
	bh=44azR5d0U2NtM8pOTYqtNV0jTasgzYt6Vi1ofhNQKME=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=khRib0pq90Yhg7A+ogra4kewPd/3jfKq68akqy/OoJU5jl7tofbBhX6odXRoASPvY
	 iRd5ePCXhxBBQtO6VHjeeToC4j/ieKIBfZU9snTW2IIN852tSNNRsnd1en9QD+0yPs
	 0cRokx0o/hCD6KFq1JaYF+78wQ30gEAfHA6C+S8Uy4dTGGR90XDlpUvXOcPzVA16XB
	 tSNNw9UKGwcSSW9gLWfok/b2PavGZKpEhR/nBkGqfDeNgWLpIIQ0se/2uSWYfaYTk5
	 /OMN+LIeca8JSYsRKkCyCAi6MLqWxV7KD3pq6fWV9ZSww0muyoydkGaG+InW6JVZDM
	 PHBnNPyEE8Z/Q==
Received: from [100.115.36.91] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-2.aws.ess.symcld.net id 47/F8-01854-E0772916;
 Mon, 15 Nov 2021 15:04:46 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8ORqMtXPin
  RYGaTjMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnFx1wb2gud8FQfWHmRsYJzK28XIxSEk8JhR
  4kL/d3YI5zyTxI+WJYwQzglGiW2re5i7GDk52ATUJKbfusHaxcjBISKgJ3H1nyhImFlAReLF7
  x52EFtYwFGi79gVMJtFQFViS+s1VhCbV8BJ4s7ejSwgtoSAgsSUh++ZIeKCEidnPmGBmCMhcf
  DFC2aIGkWJ2ZeboeorJGbNamOCsNUkrp7bxDyBkX8WkvZZSNoXMDKtYrRKKspMzyjJTczM0TU
  0MNA1NDTVNTbRNTbUS6zSTdRLLdUtTy0u0TXSSywv1kstLtYrrsxNzknRy0st2cQIDMqUYiX5
  HYwTvv7QO8QoycGkJMr7R39SohBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3t2lQDnBotT01Iq0z
  BxghMCkJTh4lER4DYqB0rzFBYm5xZnpEKlTjIpS4rzTQPoEQBIZpXlwbbCovMQoKyXMy8jAwC
  DEU5BalJtZgir/ilGcg1FJmDcAZDxPZl4J3PRXQIuZgBbb3+sHWVySiJCSamDaWrfg4p6Mlc9
  v+W7zmHjhJ8/9do9XWxpPu/8uTi+bvOnw7Nhzd0/GeHy4kFa0Q7Vx+s/5xetUl+k5TuDYeKTz
  183d55M2dM1JyvqeE3naQSvuwtvosOUpmYtlPy3N6vNouKacI+xZkXAlWs/w7YRdyZu5Z7X/X
  7vkWvSq9AWMF56LXw+4qRzFJ//gicGNUzxtK1ta7jSrPNjOvqQlUWdVtcG5diPp2SoJYpfdf2
  c69yfVPuioOtz6/MXZn/eu5TUu+XfEobdgW2KLWXKF3xnP0hf2Xx4bc5s8DXu2RU65e7uTgM+
  b0By5bGc5H4sDa4L8TWY89/PmblfYm2e0dOWnsPivW/+ujsxfzmqWJmCtxFKckWioxVxUnAgA
  0dF2iEUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-565.messagelabs.com!1636988686!861762!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23519 invoked from network); 15 Nov 2021 15:04:46 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Nov 2021 15:04:46 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E9372100231
	for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 15:04:45 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id DDFB0100227
	for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 15:04:45 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Mon, 15 Nov 2021 15:04:24 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-jinja2: upgrade 3.0.2 -> 3.0.3
Date: Mon, 15 Nov 2021 23:04:13 +0800
Message-ID: <1636988654-78792-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 15 Nov 2021 15:04:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158301

What's Changed
update requirements by @davidism in #1524
test Python 3.10 by @davidism in #1530
test Python 3.11 by @davidism in #1531
Tests: Adapt expected traceback regexes for Python 3.11.0a1 by @hroncok in #1527
simplify CodeType rewriting by @davidism in #1536
native: keep same behavior on Python 3.10 by @mkrizek in #1537
Reduce async overhead due to auto_await by @mohd-akram in #1516
Use object.__hash__ for Node.__hash__ by @klette in #1522
Fix typos by @kianmeng in #1509
rewrite Template class doc by @davidism in #1538
remove reference to macro.defaults by @davidism in #1539
rewrite docs about extending template objects by @davidism in #1540
document chained pow order by @davidism in #1541
PackageLoader works with single module file by @davidism in #1542
release version 3.0.3 by @davidism in #1543

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-jinja2_3.0.2.bb => python3-jinja2_3.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jinja2_3.0.2.bb => python3-jinja2_3.0.3.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-jinja2_3.0.2.bb b/meta/recipes-devtools/python/python3-jinja2_3.0.3.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-jinja2_3.0.2.bb
rename to meta/recipes-devtools/python/python3-jinja2_3.0.3.bb
index 139fe663e6..c416acbf92 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.0.2.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.0.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/Jinja/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "827a0e32839ab1600d4eb1c4c33ec5a8edfbc5cb42dafa13b81f182f97784b45"
+SRC_URI[sha256sum] = "611bb273cd68f3b993fabdc4064fc858c5b47a973cb5aa7999ec1ba405c87cd7"
 
 PYPI_PACKAGE = "Jinja2"
 
-- 
2.25.1


