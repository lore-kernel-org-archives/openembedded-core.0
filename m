Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A582CC61DA3
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 06:24:27 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.12177.1677219863861968250
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 22:24:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=s1GGWJQ5;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677219862; i=@fujitsu.com;
	bh=Y1YFBCLQeF+wOLoFePwhlEA2te9hl6xUPmIhBKewasc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=s1GGWJQ5Foz8i8gSdOL7B5Y0XP6uoD2ErnICEBmWLxXGMp+T43QM6ADj5b1tHVDTy
	 QYwajkB2l+LMHG4GwQJj3ogVGRVEBV+Fz2gXW57+xTXV/b8ahugYGzPJ+akItRAIr8
	 W0iBnUSO5xscPGcFrUkXYNtsHo3t+E9AQ0NpzhM5TvH0QFT6NwM8WyhUzEUzhTS0+Z
	 kq5WJ8uznk364i9NFEs79HwiftS4uou8r+2ibPxKVYNpmjcBvna/GxhK93DjSLUI50
	 uz2Kx0o3B5gkazybXNdOYDsjBOJaNr2VWbyqkP1fTuja8c81ACA+G/LB/Pp1Sv4pqq
	 hpZOblm8vV77Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRWlGSWpSXmKPExsViZ8OxWVc04ke
  ywf/nshZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aJG0/YC7axVcz4fomxgfEVaxcjF4eQwANG
  iaOdM9kgnMtMEmc+XWGBcPYySty6PhOojJODTUBK4sb9/0BVHBwiAnoSV/+JgoSZBVQkXvzuY
  QcJCwsESixfrAkSZhFQlTh2eiojiM0r4CRx9E0bM4gtIaAgMeXhe2aIuKDEyZlPWCDGSEgcfP
  ECqkZRYvblZhYIu1Ki9cMvKFtN4uq5TcwTGPlnIWmfhaR9ASPTKkbT4tSistQiXUO9pKLM9Iy
  S3MTMHL3EKt1EvdRS3fLU4hJdI73E8mK91OJiveLK3OScFL281JJNjMBATClWnriDcUXvX71D
  jJIcTEqivLoyP5KF+JLyUyozEosz4otKc1KLDzHKcHAoSfDKhQLlBItS01Mr0jJzgFEBk5bg4
  FES4XXzA0rzFhck5hZnpkOkTjEqSonzNoUBJQRAEhmleXBtsEi8xCgrJczLyMDAIMRTkFqUm1
  mCKv+KUZyDUUmY90sI0BSezLwSuOmvgBYzAS3+/uYLyOKSRISUVAOTW8C589UCIV82sr55e8o
  r5ar21Fb9lIDsuzse2pvuPPt027IVhXFKC5/e2ncgrNKo5z/XQvXfDd8LnnbP2LwsXN73lbZp
  aqXpIbdtO1ief9+QfyBFNMTp0C/uH4rPfqVxT95z7cjqyC+Wti8y1h032rvT/dfhb5PDX5Red
  bpQndl/4+Q08Uu5m9aFvZzFbvF9kfK8xQKSMmnnzpWbsPatu7ZH9ueZ1nzLxGepS6c8vX7mXo
  G5iazXrb3b1V4bf1Rw8F/B/7fB1HLrNaWf/x+EXyvsmd11L2XKN5v97Azvvv3J6pfIK2ZIDPy
  1bn1s94ysz1F+p8RP9RVM95+1zStSsbDvscHe4Pfsr4RzDNUdzimxFGckGmoxFxUnAgD3DrPE
  PwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-571.messagelabs.com!1677219861!119563!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1761 invoked from network); 24 Feb 2023 06:24:21 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-23.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Feb 2023 06:24:21 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 387CC151
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 06:24:21 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 2C65C73
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 06:24:21 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 24 Feb 2023 06:24:19 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 1/2] dhcpcd: Fix install conflict when enable multilib.
Date: Fri, 24 Feb 2023 14:24:09 +0800
Message-ID: <1677219850-18169-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 06:24:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177657

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
   file /usr/share/man/man8/dhcpcd.8 conflicts between attempted installs of dhcpcd-doc-9.4.1-r0.cortexa57 and lib32-dhcpcd-doc-9.4.1-r0.armv7ahf_neon

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
index 39e689d2f6..03dbf31b35 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
@@ -62,3 +62,6 @@ do_install:append () {
 }
 
 FILES:${PN}-dbg += "${libdir}/dhcpcd/dev/.debug"
+
+inherit multilib_script
+MULTILIB_SCRIPTS = "${PN}-doc:${datadir}/man/man8/dhcpcd.8"
-- 
2.34.1


