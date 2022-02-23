Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B057C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 07:45:26 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.4993.1645602324184202603
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 23:45:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=k+tBvtcv;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645602322; i=@fujitsu.com;
	bh=PyDfGygaC6gYy0i4FVb2d3bq0K3XCC3BS1Hm+OHW+Ig=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=k+tBvtcvDOwhh3ILuKCWf3uJeC11AdW87llkWF21s4Q/L0T9fb/1G+Tzmh9woJssb
	 /hi0rmgninwNnOxBCQ6vkMgp/ArcwS46FNGhiAfZTiPUaMN8TI9mj4SYoDWAS8bThF
	 1cuIBqnDfFHYuKECTDGyCz3ZIQuIQBmvT+4OpDRcpQFvAJBKRkFUhUEuosVsQcVj90
	 NTGf7WyLp0RLISwP6aBBy2IBKdaEOqrAM4bz3XZryWbYfXhlzvyLj85e45HCmzlFsi
	 23k9T2SElW9qHZqW0XxOyyb04vZql1SqZjfhJMLMsx5jLW1Wdhmt07SR9EXbC8zSye
	 TZQHoEHBiZaGg==
Received: from [100.115.69.48] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 63/4D-13301-216E5126; Wed, 23 Feb 2022 07:45:22 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRWlGSWpSXmKPExsViZ8MxSVfwmWi
  SweSvOhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bKA+vZCiZyVvy/d5y1gXEhRxcjF4eQwGNG
  if7Zz5ggnPNMEgsm/mSGcE4wSty6vIeli5GTg01ATWL6rRusXYwcHCICehJX/4mChJkFVCRe/
  O5hB7GFBRwkDp7bzwxSwiKgKnFmeR1ImFfASeLKvPdgJRICChJTHr5nhogLSpyc+YQFYoyExM
  EXL5ghahQlZl9uZoGwKyRmzWpjgrDVJK6e28Q8gZF/FpL2WUjaFzAyrWK0TSrKTM8oyU3MzNE
  1NDDQNTQ01TWzAFJ6iVW6iXqppbrJqXklRYlAWb3E8mK91OJiveLK3OScFL281JJNjMDATCl2
  4d7BeKfvp94hRkkOJiVR3sIjoklCfEn5KZUZicUZ8UWlOanFhxhlODiUJHj7ngDlBItS01Mr0
  jJzgFECk5bg4FES4RUBSfMWFyTmFmemQ6ROMSpKifN+vweUEABJZJTmwbXBIvMSo6yUMC8jAw
  ODEE9BalFuZgmq/CtGcQ5GJWHe2IdAU3gy80rgpr8CWswEtHhKlhDI4pJEhJRUA5Ps+b7/WX/
  X5rJLGEnILO2x7q/byP3qtF3tPc7vEZncleznZhdYRk5T38nU7fk4WVWp9rT39MOTb1j/ErwS
  vYo14LXH1ownWzS1X7H+2y4u5zv171/RtKfLH89ax2vy+1fwwb3OB1SEOVrumi7btmHm34azS
  rWTLNP/rkzXWP0xxMokZeGHtzGR0zcJH5/7r9Ypb5frwuILpS/Kf6+JP69/LVvosYqLeWXGRM
  d9KvZRngxll7Z4bI4V//nk8/PICWJHo9dFMOqdXKtbwcJivPHkxC8XGs4l/HF8YLBAzG0T0P4
  9y75c1VTOTN4r9e3E+WaF1cqMkrc2LmC/XvVVfN7781aLzyxj4TWqTIudGarEUpyRaKjFXFSc
  CACUY4moRwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-528.messagelabs.com!1645602321!3084!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3773 invoked from network); 23 Feb 2022 07:45:21 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Feb 2022 07:45:21 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 2111C100458
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 07:45:21 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 134D3100359
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 07:45:21 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 23 Feb 2022 07:45:07 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-git: upgrade 3.1.26 -> 3.1.27
Date: Wed, 23 Feb 2022 15:44:55 +0800
Message-ID: <1645602297-28300-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 07:45:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162244

Changelog:
=========
-Reduced startup time due to optimized imports.
-Fix a vulenerability that could cause great slowdowns when encountering long
 remote path names when pulling/fetching.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-git_3.1.26.bb => python3-git_3.1.27.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.26.bb => python3-git_3.1.27.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.26.bb b/meta/recipes-devtools/python/python3-git_3.1.27.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.26.bb
rename to meta/recipes-devtools/python/python3-git_3.1.27.bb
index b6171a0e4d..a09726d54a 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.26.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.27.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "fc8868f63a2e6d268fb25f481995ba185a85a66fcad126f039323ff6635669ee"
+SRC_URI[sha256sum] = "1c885ce809e8ba2d88a29befeb385fcea06338d3640712b59ca623c220bb5704"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.25.1


