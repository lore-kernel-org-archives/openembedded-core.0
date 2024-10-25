Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED72D11708
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 05:40:05 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.5578.1729834800186431819
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 22:40:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DpZi/YRC;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1729834800; x=1761370800;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=zbsDYxRrvvAqAvmbmPrnb/57hvGerb1Pmvmjw6xd7QY=;
  b=DpZi/YRCchKExuuWE77N5bdBu3D6bjFTP1QBrRyHy3uRpojAlYLVHdCn
   6AqUnNdHLjsvhbX56Wf/RZAZdAuSpfitvYNXh0WACrig88tPypKa32mew
   vDwCCmGiufSLqgNX8E44bg2UIaSAm1crVUjnC7ZqHm3qxSx57nnqVGyS7
   OIHoXWfbcECD8q/IyQ7R1GmzJC0fDYGc/Uq5jsdLA4pSeXS3nIlUDTja8
   J5E/nJUxn/CkAE9y9PzYrQJCkhj+koYM0GhN0ZvUhSdrX7XIJl9mS1yhj
   hEpNHTrXafIXPPWlH9ybKO7L9WXvx6Y8RbniYfh5kTPI8cOUghhDtmMtq
   Q==;
X-CSE-ConnectionGUID: ZUTs+SupRcSe8coHOc2n+w==
X-CSE-MsgGUID: 4cS2VVUDSAm2FksjdW05Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="178163938"
X-IronPort-AV: E=Sophos;i="6.11,231,1725289200"; 
   d="scan'208";a="178163938"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 14:39:58 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5EC9BD8012
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:56 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 93311BF49D
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E259E5A29
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CFD411A000B;
	Fri, 25 Oct 2024 13:39:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 17/22] python3-psutil: upgrade 6.0.0 -> 6.1.0
Date: Fri, 25 Oct 2024 13:39:24 +0800
Message-Id: <1729834769-4717-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
References: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28752.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28752.005
X-TMASE-Result: 10-3.825100-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZnVTWWiNp+v9ZD5CwN3C0B5soi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62S1MG9HoqbIvCd8nrr038QnzZQCjIGSj4BKFufNcldandIg/
	25t2xH1zhfPvdAxIV0BqtS17RROO2+ZzcVbMKEggbzYwwK9O6BS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 05:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206328

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-psutil_6.0.0.bb => python3-psutil_6.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-psutil_6.0.0.bb => python3-psutil_6.1.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-psutil_6.0.0.bb b/meta/recipes-devtools/python/python3-psutil_6.1.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-psutil_6.0.0.bb
rename to meta/recipes-devtools/python/python3-psutil_6.1.0.bb
index 787bc61e89..bbff7f3fe5 100644
--- a/meta/recipes-devtools/python/python3-psutil_6.0.0.bb
+++ b/meta/recipes-devtools/python/python3-psutil_6.1.0.bb
@@ -3,7 +3,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a9c72113a843d0d732a0ac1c200d81b1"
 HOMEPAGE = "https://pypi.org/project/psutil/"
 
-SRC_URI[sha256sum] = "8faae4f310b6d969fa26ca0545338b21f73c6b15db7c4a8d934a5482faa818f2"
+SRC_URI[sha256sum] = "353815f59a7f64cdaca1c0307ee13558a0512f6db064e92fe833784f08539c7a"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


