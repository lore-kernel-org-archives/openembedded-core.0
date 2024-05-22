Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F4B1C27C52
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:16:01 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.5652.1716369347554514157
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Sj1ahv1g;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369348; x=1747905348;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=FupK2X9P1DtdIPIfBUz3e3IRLOi1DWA8l4dmVkvSEIw=;
  b=Sj1ahv1g/EUzcnoc2y1z49tEFn45YBzLLPHPsmZmm/fRPtqvmH6Lxdgz
   Tc2IC1HfF5g+vWBCDfbBgmFXm9YIj6t2lVBQS4V1/Frl/Izm3pXmlVJNc
   WM/ylb4n2C39wStQKRqShAqOidJqfIZmAJQrxR/nP2Wd4dwhniVyn14QY
   65e+Lb6lV7OxFku8hAM3Eh4IkYEolLgrsnVWMH/6H/l0MKJwTGEraR7i0
   JIVpcDXaHeDTgLa/Af4bakpYnFLKxOmtCQ/zfIwfFPfcmq0I1m0n9UElk
   t2fZi0MyjQq7WcUmYsUtTWh+DHl1F+Kda94L+YEgI/NvRIAnhL/eYFq2U
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="161119271"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="161119271"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:46 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5F67EDBD91
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:43 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 96B6AD5007
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 23E0E20097E68
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:42 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C4A6C1A000B;
	Wed, 22 May 2024 17:15:41 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 36/42] python3-pygments: upgrade 2.17.2 -> 2.18.0
Date: Wed, 22 May 2024 17:14:43 +0800
Message-Id: <1716369289-22526-36-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10-2.245600-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrBgA+oehWZhGU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa2YkAyCbA7KVz64b06vmARflIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSz4P1ae1STk+5H1R
	itf7as2NFVhKOcxW4744roQr9mNQ6vOobLeJOO5juhLcvAFf8xVilDXMCsA1wqclsq8mJh3uZ5q
	Y+Q8/MCiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199730

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/pygments/pygments/blob/master/CHANGES

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pygments_2.17.2.bb => python3-pygments_2.18.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.17.2.bb => python3-pygments_2.18.0.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.17.2.bb b/meta/recipes-devtools/python/python3-pygments_2.18.0.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-pygments_2.17.2.bb
rename to meta/recipes-devtools/python/python3-pygments_2.18.0.bb
index 8b98064b78..fd37365681 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.17.2.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.18.0.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592"
 
 inherit python_hatchling
-SRC_URI[sha256sum] = "da46cec9fd2de5be3a8a784f434e4c4ab670b4ff54d605c4c2717e9d49c4c367"
+SRC_URI[sha256sum] = "786ff802f32e91311bff3889f6e9a86e81505fe99f2735bb6d60ae0c5004f199"
 
 UPSTREAM_CHECK_PYPI_PACKAGE = "Pygments"
 inherit pypi
-- 
2.34.1


