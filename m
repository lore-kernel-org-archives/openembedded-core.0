Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C33CDC63708
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 06:09:02 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.6878.1670479733135520857
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Dec 2022 22:08:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=byZ2kf0/;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670479730; i=@fujitsu.com;
	bh=aXP/qb0rYUHoKaDzxr1CrO41EVHrrvLnFss7OdVXzjM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=byZ2kf0/hpF2jteRO10bB3q+83Lz2b6E+U155HnvKcMQwnyYsCy6px02ZpbMxqSVo
	 /qzlLliwpNbJ/gHHb+xT1qlzr5dzo5fSerUcxXxISuN7fpIsrHat9frq0cAWbcGlE8
	 K1d4Gg+MZ6SxiVCBv5y2zTfxYFzrH4MxW+xEu7hmWNdy/FM9GwMRpKi9tR3GUkTlen
	 xG6WbNNM2ViZVYCl+RC9skz44IMPxJyHWW+AAKMnJaZMODDRvW4IwsIic6wwptNuHf
	 UKEuufoZuSBNc69LjuK/zxRMJKFMab0VTzF4VfxAyLBAwTaBbeE7GJyOxN7VvmSrSV
	 29s72eE++7J5Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORqFtUPzH
  Z4OIsQYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePU9qusBfd4Kj5ffMnYwLiDu4uRi0NI4DGj
  xOqJkxkhnGtMErOvXGWFcHYzSmxsnQTkcHKwCUhJ3Lj/n62LkYNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAr8SMUxMZQWwWoPjKV1vZQGxeAUeJB71bmUFsCQEFiSkP34PZnAJOEgfvzmcCsYWAar
  Zf2csEUS8ocXLmExaI+RISB1+8gOpVlJh9uZkFwq6QmDWrjQnCVpO4em4T8wRGwVlI2mchaV/
  AyLSK0bQ4tagstUjXQi+pKDM9oyQ3MTNHL7FKN1EvtVS3PLW4RNdIL7G8WC+1uFivuDI3OSdF
  Ly+1ZBMjMHRTitW37mA8vOyP3iFGSQ4mJVHeF9X9yUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQke
  C9UTkwWEixKTU+tSMvMAcYRTFqCg0dJhNe3FijNW1yQmFucmQ6ROsWoKCXOuxskIQCSyCjNg2
  uDxe4lRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8HHVAU3gy80rgpr8CWswEtPje/16QxSW
  JCCmpBqb8OSEH3WMFF1dH5muUJu695KRxcPOzjqhti8wudVStF3jEdltEbPo+l8Q0g0LFs1M3
  RaZy+Z/buyhA/L5UgJVHWd6Uz1enB23e7sE++QnjDb/QRvulB6RCYibOtTrl4fybqeBVYDNT/
  NILr9mNrSzSFunzzDg9oS2qivXrGs/Vs7TWLV1f/4rzx7e9wc9fWmnbi7SW69y+0+1nMTFUVi
  vZuHBaDKNE1a+DInaRVn/4ZF2XczwtLmzLF+S6lWKnqLvJ1EIy5DrXnXdZjRlCXxa+1KtU9ut
  PqGz43fu/pzeBNeH+vobrxf5Ff6YLHiu958zxc8u6uPUvvj9wKHtWUPV/02SOVL342okrd0ey
  K7EUZyQaajEXFScCAI8THSRYAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-565.messagelabs.com!1670479730!133511!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9159 invoked from network); 8 Dec 2022 06:08:50 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Dec 2022 06:08:50 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 0197710019C
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Dec 2022 06:08:50 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E9937100192
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Dec 2022 06:08:49 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 8 Dec 2022 06:08:48 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-traitlets: upgrade 5.5.0 -> 5.6.0
Date: Thu, 8 Dec 2022 14:08:12 +0800
Message-ID: <1670479695-1183-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670479695-1183-1-git-send-email-wangmy@fujitsu.com>
References: <1670479695-1183-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 06:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174373

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
 Adopt jupyter releaser #806
 Use base setup dependency type #805
 More CI Cleanup #803
 More maintenance cleanup #802
 Add project description #801
 Bump actions/setup-python from 2 to 4 #798
 Bump actions/checkout from 2 to 3 #797
 Bump pre-commit/action from 2.0.0 to 3.0.0 #796
 Bump actions/upload-artifact from 2 to 3 #795
 Add dependabot #794
 Add more typings #791
 Format changelog #789

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-traitlets_5.5.0.bb => python3-traitlets_5.6.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-traitlets_5.5.0.bb => python3-traitlets_5.6.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.5.0.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.6.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-traitlets_5.5.0.bb
rename to meta-python/recipes-devtools/python/python3-traitlets_5.6.0.bb
index 6ac17f5ec..1e82dd341 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.6.0.bb
@@ -4,7 +4,7 @@ AUTHOR = "IPython Development Team <ipython-dev@scipy.org>"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.md;md5=f17a3ba4cd59794dd6e005c8e150aef0"
 
-SRC_URI[sha256sum] = "b122f9ff2f2f6c1709dab289a05555be011c87828e911c0cf4074b85cb780a79"
+SRC_URI[sha256sum] = "10b6ed1c9cedee83e795db70a8b9c2db157bb3778ec4587a349ecb7ef3b1033b"
 
 inherit pypi python_hatchling
 
-- 
2.25.1


