Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D13A0ECAAD1
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 04:12:21 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web08.7705.1661832738220439248
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 21:12:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=H5mN9DwG;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661832736; i=@fujitsu.com;
	bh=WfrC9Fr3f+cWSVco3k35hLMygYDrM29kBpWN51uo+Zs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=H5mN9DwGlz2UJi20Mjw3TOObmpCldg2iMxqLpXsaOpfsGXjK63btDcUzOcqsHCPqI
	 MJyJ9FKfd2LaaqaZYycsg/JaUgmYuiuDVSZAQOu+4vtlyEpRjoifhAzo6qtJz/YzNp
	 xzWarsZVCwOlzBITU3RIOOjbuikh/Fdxo7+sTqh1+VjPmkCJTATRCldZQULswN8P6t
	 Y3oSvmTFy+bVAgDkufoj3KpP0v/OhphxdVvEerjkWiBe5zbLtByQPHNIWT2Brb+v3m
	 gK2ZggW5d4N7bTwrmzC01VXDpEqBiegK69mec8ZJaxXpKg1kcqwPj2ypSG4kSaPF1m
	 2KUu/9sWWITjw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8OxWVe+jzf
  Z4FivjsWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrFl7z/mgr/sFWv7nzA3MPaxdzFycQgJPGCU
  2LX2PJRzmUmiffYFVghnL6PEoR2n2boYOTnYBNQkpt+6AZTg4BAR0JO4+k8UJMwsoCLx4ncPO
  4gtLGAnsebpFBYQm0VAVeLVrSdgrbwCThLzZt8Hi0sIKEhMefieGcTmFHCWmHz4G1ivEFDNxy
  9/oOoFJU7OfMICMV9C4uCLF8wQvYoSsy83Q82plNgzq58JwlaTuHpuE/MERsFZSNpnIWlfwMi
  0itE6qSgzPaMkNzEzR9fQwEDX0NBU19hI19DCUi+xSjdRL7VUtzy1uETXSC+xvFgvtbhYr7gy
  NzknRS8vtWQTIzCMU4oV9u5gvLzyp94hRkkOJiVR3oWtvMlCfEn5KZUZicUZ8UWlOanFhxhlO
  DiUJHgvdwPlBItS01Mr0jJzgDEFk5bg4FES4fXuAkrzFhck5hZnpkOkTjHqcsz82naAWYglLz
  8vVUqcd2ovUJEASFFGaR7cCFh8X2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzLuhB2gKT2Z
  eCdymV0BHMAEd8XAJN8gRJYkIKakGpjnFScekKs+FSd89YeQldu+HyZem0zLVfP3ZmnuyLp9y
  ZeNP7dTMObN5u/uMWQEXeZUjpQQkf330Of+G1XJmtcDBq6crjG9PfbB+zVPOHT0eelY3juw2k
  O4W+1G+9+g37jtP+pO7G1dvnxIUvTPLyF4rrFuEVfJr1tawE/6m9+7uTK12PlRx4ayVqhjnzk
  5O28+6bg0NzQp1zSFVZ5ctsNt5e0tzp0uN06lio/OLm25zqs4QUn6b0eWbpyy7wjKNW6Il6um
  FsM0KfLmbtaYfuNvyx8Vickio6ocMBvGXT40fffQ9bLdCrnnygan6r6ct/+hkbcrbmpkQmH6X
  xfpcwuFtb1s3aCq+2uq2IuyzEktxRqKhFnNRcSIAvIouEmoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-571.messagelabs.com!1661832735!400201!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31506 invoked from network); 30 Aug 2022 04:12:15 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-5.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Aug 2022 04:12:15 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 676B6142
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 05:12:15 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 5A1207B
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 05:12:15 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 30 Aug 2022 05:12:13 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] lttng-ust: upgrade 2.13.3 -> 2.13.4
Date: Tue, 30 Aug 2022 12:11:49 +0800
Message-ID: <1661832712-12546-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661832712-12546-1-git-send-email-wangmy@fujitsu.com>
References: <1661832712-12546-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 04:12:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170053

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lttng/{lttng-ust_2.13.3.bb => lttng-ust_2.13.4.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.13.3.bb => lttng-ust_2.13.4.bb} (95%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.13.3.bb b/meta/recipes-kernel/lttng/lttng-ust_2.13.4.bb
similarity index 95%
rename from meta/recipes-kernel/lttng/lttng-ust_2.13.3.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.13.4.bb
index cc88bf5b11..56200ac3e1 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.13.3.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.13.4.bb
@@ -34,7 +34,7 @@ SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-Makefile.am-update-rpath-link.patch \
            "
 
-SRC_URI[sha256sum] = "2cc42f51145050430ac4ab72b32d95fd78d5566ccbe44e14a8fcdd23c0ed8f6f"
+SRC_URI[sha256sum] = "698f82ec5dc56e981c0bb08c46ebabaf31c60e877c2e365b9fd6d3a9fff8b398"
 
 CVE_PRODUCT = "ust"
 
-- 
2.25.1


