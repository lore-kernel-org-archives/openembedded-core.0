Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F69C433FE
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 03:01:45 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web12.193.1668308497870040876
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Nov 2022 19:01:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=etgz1cQY;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668308496; i=@fujitsu.com;
	bh=hKasWnJdkwcjnowiPWQmKyV50buDCsn6Htzhb9RgDcw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=etgz1cQYvPCJ7S15I5R507iMNPcHx1+HXaoLcY6VD9XGM2M/hAkHxUVCVgfilAVGr
	 Ka8KOgnwCFIr8AckQVrsZ1oA+oJ1/s8BdVC6I4vSmP6pVj+pF/J17hcmh7YT8Su2P6
	 gth2DXusCcBn1mZ1CELo07f1tZUPtp7aebnTnmtchwAfH6LoRVlEPTNczvT6kj4IMM
	 juwziuk2RodFQhg19oWgSTwOyvmdDU3GcapDCobKMM6AB5Cfys82iBYByDRNVyUQEW
	 HC4NUNE3uMHa4WqTvUADzspWXBgriKXIosoKzKgN8Jp705a48BIYiQwxmQdk+ZwJD+
	 PaiDjrWOR+NEA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpMsfV5B
  scPgij8Wdn+/YHRg9zm1cwRjAGMWamZeUX5HAmjH38Dymgn8cFe9nvmRsYFzG0cXIxSEk8IBR
  YsX7bYwQzmUmid8/Z7NDOHsYJTZNvczUxcjJwSYgJXHj/n+2LkYODhEBPYmr/0RBwswCKhIvf
  vewg9jCAi4Se3beZwWxWQRUJRpuvGQDsXkFnCSaNywHGyMhoCAx5eF7Zoi4oMTJmU9YIOZISB
  x88YIZokZRYvblZhYIu0Ji1qw2qF41iavnNjFPYOSfhaR9FpL2BYxMqxjNilOLylKLdA1N9ZK
  KMtMzSnITM3P0Eqt0E/VSS3XLU4tLdA31EsuL9VKLi/WKK3OTc1L08lJLNjECgzGlmL14B+OD
  ZX/0DjFKcjApifKmXc9PFuJLyk+pzEgszogvKs1JLT7EKMPBoSTB+zuyIFlIsCg1PbUiLTMHG
  BkwaQkOHiUR3go7oDRvcUFibnFmOkTqFKMlx9TZ//YzcywHkzO/th1gFmLJy89LlRLnlYgBah
  AAacgozYMbB4veS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeddGA03hycwrgdv6CuggJqC
  DvkfmgRxUkoiQkmpg4jKd3+ZtI5fOffDNir+ql2ddeMU1YeV8jzlzazye6+Y7qP367xTwiNvk
  /UXjAL+Z4a5Gzo9mWv3fefBQbufFP+eqnrEpTHVX0//w4ktf9Z1zMySP3Hmw5MmDH81TOw4c3
  e0UF3pXRlzJNe7LyvkWJxtfmuz8VvZ19yN//o92j0oELXa+vrB93WSTSXfL571zZ8t/+f/VrL
  bv0hlXasOeXPj56YRGB/s+9s/Ta++nqylMfsOlfm+BIU/6PYUDXyVarrrqsT18yMURXKI4Yct
  Jzf+Pj6eZen1n1Lt4LmPRwmxP+X4J5olTL/P9zfE//sy3e57u6Z6Erc097z2Y9su3+9urRTCW
  1L9cKnTHOqluxTUlluKMREMt5qLiRACJbPKyWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-585.messagelabs.com!1668308495!281947!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28303 invoked from network); 13 Nov 2022 03:01:35 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-3.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Nov 2022 03:01:35 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id D40731B3
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 03:01:34 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id C8B8E1B1
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 03:01:34 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 13 Nov 2022 03:01:33 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-flit-core: upgrade 3.7.1 -> 3.8.0
Date: Sun, 13 Nov 2022 11:01:18 +0800
Message-ID: <1668308478-14795-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 03:01:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173173

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-flit-core_3.7.1.bb => python3-flit-core_3.8.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-flit-core_3.7.1.bb => python3-flit-core_3.8.0.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb b/meta/recipes-devtools/python/python3-flit-core_3.8.0.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-flit-core_3.7.1.bb
rename to meta/recipes-devtools/python/python3-flit-core_3.8.0.bb
index fe6b16ac54..3d815d5316 100644
--- a/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb
+++ b/meta/recipes-devtools/python/python3-flit-core_3.8.0.bb
@@ -8,7 +8,7 @@ BUGTRACKER = "https://github.com/pypa/flit/issues"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=41eb78fa8a872983a882c694a8305f08"
 
-SRC_URI[sha256sum] = "3c9bd9c140515bfe62dd938c6610d10d6efb9e35cc647fc614fe5fb3a5036682"
+SRC_URI[sha256sum] = "d0f2a8f4bd45dc794befbf5839ecc0fd3830d65a57bd52b5997542fac5d5e937"
 
 inherit pypi python_flit_core
 
-- 
2.25.1


