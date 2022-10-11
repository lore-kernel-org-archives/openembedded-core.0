Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20701C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 08:39:59 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.4926.1665477593535466699
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 01:39:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TQptbHtM;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665477591; i=@fujitsu.com;
	bh=hiGntMZEFjK4V3FHkzQBey9h9ACBTbCDFE3znwhaXOo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=TQptbHtMuVpsQ3Dxu2P+xebtf9y8fJlt4kMVgTauka34IkZGl206m+Pm1Ye0xSp4t
	 wmDCTXVJPAxHHdhr7Nt8TZwyvn5mRc6DumrAbzaGHRXrZF0904WrnExbar0SAqaKJK
	 tLB3qyXsgvihpYm1qqImhuCY6VnfsHhtT2JQeEsrV0T6twyqBVK5s9DU3Lrmra5jlV
	 QeS/iXbsJ4h3jXHtVb7Y3cRIPqJvKHnqGrhmUs5I5g5FJlUbnriaEMZImzwiRU940M
	 LsPsVJfd/IkrCrTXfP9VdRPcYdm9cHIrp2jar4auZmLUulJWX8/DfyWmCvN/+L6dDy
	 AbZIlQweELYLQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRWlGSWpSXmKPExsViZ8ORpHtd2zX
  ZYOsMQYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaP15nr2ghaOivenJ7M0MM5l72Lk4hASeMAo
  cWb9CyYI5zKTxKdpbxi7GDmBnD2MEvO2ioHYbAJqEtNv3WDtYuTgEBHQk7j6TxQkzCygIvHid
  w87iC0sYCrRv3YVmM0ioCrRNHsmO0g5r4CTxKzLsSBhCQEFiSkP3zODhDkFnCUO7q+FWOQksX
  ZSBwuIzSsgKHFy5hMWiOkSEgdfvGCGaFWUmH25mQXCrpCYNauNCcJWk7h6bhPzBEbBWUjaZyF
  pX8DItIrRNqkoMz2jJDcxM0fX0MBA19DQFEgb6xqamOslVukm6qWW6ublF5Vk6BrqJZYX66UW
  F+sVV+Ym56To5aWWbGIEBnFKcfrkHYyX9v3SO8QoycGkJMrbpe6aLMSXlJ9SmZFYnBFfVJqTW
  nyIUYaDQ0mC11sLKCdYlJqeWpGWmQOMKJi0BAePkgjvUhWgNG9xQWJucWY6ROoUoyXH1Nn/9j
  NzLAeTM7+2HWAWYsnLz0uVEue1AMatkABIQ0ZpHtw4WNRfYpSVEuZlZGBgEOIpSC3KzSxBlX/
  FKM7BqCTMGwEyhSczrwRu6yugg5iADjp51QnkoJJEhJRUA5NLYYNVouPm+TPdb0yNUkg5r7HX
  1+PHO8/6nx4FwmsjH8+/X5/S+kPyQVqyw1yVG8evJ0RqLimamher76JdxjqRIS3V8OQmntzOv
  ol1uovllsoczP9RFLi0e/7EKw/9V72+tqV+23UG5saQxB83/fR7Wzy8J05QStgRWJB6NPCitm
  3cE24vrkwLS2YLRrvEg35rZF8qz+Kp/Rb6vzrzwvFrRa8u+ZcevfX6wIbms6Km001mSS9h2sb
  2dv3D7qQE5T9z42Qb5Y02H7t2dVv8ru1f55VtOi+h2nsiL+jAyctGqz7sPMj12j9LuUqJ12Pz
  LBGV6rW2GgkiCRleimKTjVjFJrMt/bKsqO8no0mckhJLcUaioRZzUXEiAPn8Ctd1AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-745.messagelabs.com!1665477590!5130!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30433 invoked from network); 11 Oct 2022 08:39:51 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-19.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Oct 2022 08:39:51 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id AF5551BA
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:39:50 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id ADCC01B3
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:39:50 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 11 Oct 2022 09:39:49 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] xz: upgrade 5.2.6 -> 5.2.7
Date: Tue, 11 Oct 2022 16:39:21 +0800
Message-ID: <1665477563-16679-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665477563-16679-1-git-send-email-wangmy@fujitsu.com>
References: <1665477563-16679-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 08:39:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171613

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/xz/{xz_5.2.6.bb => xz_5.2.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/xz/{xz_5.2.6.bb => xz_5.2.7.bb} (95%)

diff --git a/meta/recipes-extended/xz/xz_5.2.6.bb b/meta/recipes-extended/xz/xz_5.2.7.bb
similarity index 95%
rename from meta/recipes-extended/xz/xz_5.2.6.bb
rename to meta/recipes-extended/xz/xz_5.2.7.bb
index 3482622471..88ec847c15 100644
--- a/meta/recipes-extended/xz/xz_5.2.6.bb
+++ b/meta/recipes-extended/xz/xz_5.2.7.bb
@@ -25,7 +25,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=97d554a32881fee0aa283d96e47cb24a \
                     "
 
 SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz"
-SRC_URI[sha256sum] = "a2105abee17bcd2ebd15ced31b4f5eda6e17efd6b10f921a01cda4a44c91b3a0"
+SRC_URI[sha256sum] = "06327c2ddc81e126a6d9a78b0be5014b976a2c0832f492dcfc4755d7facf6d33"
 UPSTREAM_CHECK_REGEX = "xz-(?P<pver>\d+(\.\d+)+)\.tar"
 
 CACHED_CONFIGUREVARS += "gl_cv_posix_shell=/bin/sh"
-- 
2.25.1


