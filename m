Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7083C4707A
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 02:46:34 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.4555.1650332723363997529
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 18:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YMljdOxt;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650332721; i=@fujitsu.com;
	bh=RNlkk+XO4Z09tLLLvgyAgMKn7t2DJ+PRqzFe4QZKmPY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=YMljdOxtXn+YIwmGbh8xaPErxW4/zatw+fReO+95TX8f78lrk+0NDFsjqyGbQzkNH
	 honiSbyAVwVB/dxT+e1FV2+fwveY/hrq1aQOSCS8VsTN9MGS+cOdSDZ9ZAE2dveSzR
	 j6scNPBYAc0BJvTgaO1SsMc0t+A1Tg/dLU1rmDUjvRxMTQVZz4CeYGYnCf7RHUaSZT
	 FmSivycfaGlNKSa804bi5fWiJ0ls3DT9HQKTxUES4Rts98h8Q8g458UtVAKgUaMqsc
	 bvwQkEcDB9t7Rb+hhhn5DfR5+7LJlKARYT8ydKhuYaz+dOouzx+uSh4U0/gr4v80Tc
	 7A1aRfTRjNavw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8MRomsoEpd
  kcOG+lMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrGh9x9TwV6Oik1z57M3MD5l72Lk4hASmMUk
  sXfPSyYIZw+jxNdDRxm7GDk52ATUJKbfusHaxcjBISKgJ3H1nyhImFlAReLF7x52EFtYwEni/
  5bTrCA2i4CqxLUbK8HivEDxSatOsYHYEgIKElMevmcGGcMp4CyxaIEWSFgIpPVzKytEuaDEyZ
  lPWCDGS0gcfPGCGaJVUWL25WYWCLtCYtasNqYJjPyzkLTMQtKygJFpFaN1UlFmekZJbmJmjq6
  hgYGuoaGprrEFkDLUS6zSTdRLLdUtTy0u0TXSSywv1kstLtYrrsxNzknRy0st2cQIDMmUYrX8
  HYx/V/7UO8QoycGkJMr76GBskhBfUn5KZUZicUZ8UWlOavEhRhkODiUJXmmBuCQhwaLU9NSKt
  MwcYHzApCU4eJREeNcKAqV5iwsSc4sz0yFSpxgVpcR5VwgBJQRAEhmleXBtsJi8xCgrJczLyM
  DAIMRTkFqUm1mCKv+KUZyDUUmY9x3IeJ7MvBK46a+AFjMBLa6eEguyuCQRISXVwNS55O/PPRv
  WTzp40arkw4b7G6cICJ4T3KZ+l6t5l+AlffEHJ4Xmn/wzVTMyOVtfZvL5mRxPpkQcWcLccvNq
  dNpP8/jl7usqsrLKb/k7OHIbiHJcOJajuto/7J5KGBMDf+jiO+v0n/sw3oqy6JL6afdEnYP5Q
  cE6jrhbS5+uEQ/knsXWYR3A8bzvRo65qk/scg+NORozf8gnzekvXBJdFn3oad7idZoOsQqMtx
  PCKsU4z+8sEHW8//DAo5hMg9OHbOdxdcw7pHnt0tIZq3outnRKTvV4JPM8I9fr8Z/MfyuaPKZ
  wRaQHiRQdyxTrPFjYLirww4/Z99u3yOWnQosfnt1h5yR3SObFXZ3Jn3ha/ZRYijMSDbWYi4oT
  Ab+R5zNEAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-548.messagelabs.com!1650332721!235881!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27234 invoked from network); 19 Apr 2022 01:45:21 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-20.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Apr 2022 01:45:21 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23J1jFiO009699
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 02:45:21 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 19 Apr 2022 02:45:14 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-jsonpointer: upgrade 2.2 -> 2.3
Date: Tue, 19 Apr 2022 09:44:44 +0800
Message-ID: <1650332686-20457-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650332686-20457-1-git-send-email-wangmy@fujitsu.com>
References: <1650332686-20457-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Apr 2022 02:46:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164611

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-jsonpointer_2.2.bb => python3-jsonpointer_2.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonpointer_2.2.bb => python3-jsonpointer_2.3.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-jsonpointer_2.2.bb b/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-jsonpointer_2.2.bb
rename to meta/recipes-devtools/python/python3-jsonpointer_2.3.bb
index 225fde7556..16d5cab4cf 100644
--- a/meta/recipes-devtools/python/python3-jsonpointer_2.2.bb
+++ b/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3"
 
 inherit pypi ptest setuptools3
 
-SRC_URI[sha256sum] = "f09f8deecaaa5aea65b5eb4f67ca4e54e1a61f7a11c75085e360fe6feb6a48bf"
+SRC_URI[sha256sum] = "97cba51526c829282218feb99dab1b1e6bdf8efd1c43dc9d57be093c0d69c99a"
 
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-json \
-- 
2.25.1


