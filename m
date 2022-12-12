Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D507C4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:30:38 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.37540.1670830235477488290
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Dec 2022 23:30:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=F+Ch3VpP;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670830233; i=@fujitsu.com;
	bh=z12KYuqnNll/56uxyNI/2zsrFq+wGMbu/18DbRvyDjs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=F+Ch3VpPfIytqJUpq6sJRN93tATzMA6T5HjhAq6lmEkwv+C+8foCAFpxItbF1zvpa
	 uKAOgAGxEw7ao8afGMmPlm/P3I2ULx2GiZU8q4EBjYHs0+7i4qep5ZAL0hQML+6R5y
	 P5BdHtzp/qbxIUwJWLlgGwusXIu9BJWtHZFDCUPzCjmcrHIOKrbsebx2fIwL19UKlT
	 aPu5I/3nGRuPCk85fO11HSErTja3cYnYtomAIfGai0ak9+PhLqf7q6wF2E2PBVDHZa
	 jxaVIk/Sb3FTV2OtsXqu9yp/OQOUGzyTUuKccLgS2NJk7aSTroCEM0o8tr/Yq4hPSj
	 NsqOpKD/2+4eg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRWlGSWpSXmKPExsViZ8OxWXfGjWn
  JBrevWFnc+fmO3YHR49zGFYwBjFGsmXlJ+RUJrBnf1n5gK1jIUbFy127WBsZ97F2MXBxCAg8Y
  JQ62T4NyLjNJNB/4D+XsYZRYfWg7SxcjJwebgJTEjfv/2boYOThEBPQkrv4TBQkzC6hIvPjdw
  w5iCwvYSjRdv8MEYrMIqEpM2joVLM4r4Chxq3s6K4gtIaAgMeXhe2aIuKDEyZlPWCDmSEgcfP
  GCGaJGUWL25WYWCLtCYtasNiYIW03i6rlNzBMY+WchaZ+FpH0BI9MqRrPi1KKy1CJdQ72kosz
  0jJLcxMwcvcQq3US91FLdvPyikgygVGJ5sV5qcbFecWVuck6KXl5qySZGYDCmFCez72B8s+SP
  3iFGSQ4mJVHeyivTkoX4kvJTKjMSizPii0pzUosPMcpwcChJ8G64BpQTLEpNT61Iy8wBRgZMW
  oKDR0mE1w2klbe4IDG3ODMdInWK0ZhjbcOBvcwcM7+2HWAWYsnLz0uVEueVvg5UKgBSmlGaBz
  cIFrGXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnz2oBM4cnMK4Hb9wroFCagU6JeTgU5pSQ
  RISXVwBTvv7HOwV/r+UufY2uluk6e32Q776HOzTvnS9dfmnaK4YWWnfdHWbf+mddWpcY5pbIv
  XPDg6HIpj2KLsp57e9KP7EmM09R/e06sLVLm5f4ft98/viJlsXLJzBNMDh2GJr6XJnLciX6c8
  fnh26CVD6/9nfnN6Vjk54eGJl8Vd3f0NWU1eD2/N6MjlCPUOjiXs1dy+vJfc30u6ZbHXD4ub6
  TQM23/yk19NXosqrs7jNfMN3t4v+1A9vnMC0F92x2MoiuTHjYulGkvn5/9//W+I9HmR79uqNm
  qpH/h76kDcRsUlmpGyX3exWL+/PI57bmRYUuLHny1LFHbdONG/3wfb6PQSXXBO6bw8erf+9ic
  9jFViaU4I9FQi7moOBEA4hYrtlMDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-745.messagelabs.com!1670830232!138286!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20578 invoked from network); 12 Dec 2022 07:30:32 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-8.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Dec 2022 07:30:32 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 6970A158
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 07:30:32 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 5D372153
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 07:30:32 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 12 Dec 2022 07:30:30 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libfontenc: upgrade 1.1.6 -> 1.1.7
Date: Mon, 12 Dec 2022 15:29:52 +0800
Message-ID: <1670830196-2900-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 07:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174481

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
configure: Use AC_SYS_LARGEFILE to enable large file support

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libfontenc_1.1.6.bb => libfontenc_1.1.7.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libfontenc_1.1.6.bb => libfontenc_1.1.7.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb b/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb
rename to meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb
index 8f9602d3ae..297bfbe4e6 100644
--- a/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb
@@ -13,6 +13,6 @@ PE = "1"
 
 XORG_EXT = "tar.xz"
 
-SRC_URI[sha256sum] = "ea8606ed5255dda8f570b7d1a74d59ee8d198675b2f114d07807431e6ba1d111"
+SRC_URI[sha256sum] = "c0d36991faee06551ddbaf5d99266e97becdc05edfae87a833c3ff7bf73cfec2"
 
 BBCLASSEXTEND = "native"
-- 
2.25.1


