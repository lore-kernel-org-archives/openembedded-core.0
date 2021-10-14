Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF4DEC433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 01:23:06 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web10.3491.1634174580068824238
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 18:23:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Kh87ro11;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634174577; i=@fujitsu.com;
	bh=FaXDvXzvGA13ireOwFH7VQyh0fG+rku8wxR3noXRwHE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Kh87ro11nna5NuO2XWCKusmz1n/gDpQmcj5KEs7zefiUMxKHxmm2Eg11m2zGavgCd
	 FHjrx+AgjhpCu1gpzbG8rirmq/ybMR3f/0DOAF1yM61UpgElQz7oH9fQD9P3bgzFC2
	 N1ljUPzkFKUsOVPwVsAromeZGYlZv01Qh9/2QOOCkY+Pc1jhL4O2VM0lhF7c9TL7iV
	 0meKntumIuZkxWQW1KZKoZz7eCkwJgZyarf5NaUwGvtAlFEaAWpO/XPlNnnV8a1aBy
	 7zh7+2iQ/eprHpxsVW5fPH5UWW1I8lfbklCE+lX0L3WQsx2n2YmAlNDnPUhaNqpUyk
	 e5GEi6S5BW0fw==
Received: from [100.113.4.206] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id FA/2A-07495-17687616;
 Thu, 14 Oct 2021 01:22:57 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRWlGSWpSXmKPExsViZ8MxSbewLT3
  R4Oo5Jos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePxnTb2giXsFR8Xf2FrYDzO1sXIySEk8JhR
  Yvr5lC5GLiD7PJPEj+5eFghnD6NEw/07jCBVbAK6Eucer2XvYuTgEBHQk7j6TxQkLCxgI7H22
  jFWEJtFQFWi++1ysKG8Au4Sa/atBotLCChITHn4nhkiLihxcuYTFhCbWUBC4uCLF8wgIyUEFC
  VmT5eHKK+QeH34EjOErSZx9dwm5gmMfLOQdM9C0r2AkWkVo2VSUWZ6RkluYmaOrqGBga6hobG
  uqa6RiaFeYpVukl5qqW5yal5JUSJQVi+xvFivuDI3OSdFLy+1ZBMjMOxSClk/7mA89PqD3iFG
  SQ4mJVFe9aL0RCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvO4tQDnBotT01Iq0zBxgDMCkJTh4l
  ER4vUHSvMUFibnFmekQqVOMsRxXVi1ZxMzxZi2IfAsm2+7dBZLtYHLmgoOrmTlmgcn77YeA5A
  MQKcSSl5+XKiXOm9EKNFQAZGhGaR7cSli8X2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzMs
  HMoUnM68E7rJXQEczAR0dGJUCcnRJIkJKqoFpUY6b4g3BqQe/9S5caHTy/+vt16OqONPqnpke
  DV+4oNnjzatPGTIzFy7leO++qPPS2srdvw/wrPkdmWO0YWe2GutUMQ6V9P/TTHWqllkeCv9Wp
  K832WTuGS1ZRbVpqi2fd7ns0lnSufR/BmOwvv1ONZkjH8K+KKozKsi+CGc7USTou663jvOrxR
  F1DpkMT282z+5boWZx2/0lDtZtK/biPm2Vbb+v7pKTT39rSUZGtgCrTe/XRLeS9HCHPSpN6UL
  3TJ+LJKUqSeqt/N30/sDCNp0zOdc0lJ8t6OdsMORkseN8VGjbP735KavdnCXGr4w7ueP/Pe89
  M+XI3dWKS121tQ47Xw1gm8X5OzdRX4mlOCPRUIu5qDgRALl3iwxyAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-238.messagelabs.com!1634174576!1876382!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14438 invoked from network); 14 Oct 2021 01:22:57 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Oct 2021 01:22:57 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 943A71012C5
	for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 02:22:56 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 878AA100A3D
	for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 02:22:56 +0100 (BST)
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 14 Oct 2021 02:22:35 +0100
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libsolv: upgrade 0.7.19 -> 0.7.20
Date: Thu, 14 Oct 2021 18:22:25 +0800
Message-ID: <1634206945-7677-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 01:23:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156925

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../libsolv/{libsolv_0.7.19.bb => libsolv_0.7.20.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.19.bb => libsolv_0.7.20.bb} (94%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.19.bb b/meta/recipes-extended/libsolv/libsolv_0.7.20.bb
similarity index 94%
rename from meta/recipes-extended/libsolv/libsolv_0.7.19.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.20.bb
index d30e61e9d9..d4d6538965 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.19.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.20.bb
@@ -11,7 +11,7 @@ DEPENDS = "expat zlib"
 SRC_URI = "git://github.com/openSUSE/libsolv.git \
 "
 
-SRCREV = "c773294be6b0a2425f344a8999f173fb00cfd16f"
+SRCREV = "f618e6aae1d44be633b2ab91d4fd4f4f974f4d40"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.25.1


