Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E751C52D1E
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 01:10:31 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.46587.1722215420520138463
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 18:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=S9GFtxh+;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722215430; x=1753751430;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=OTaLrzp8Yb4B+FVxBJIIfFM5Gr1Rnul9Fc1OxtDue54=;
  b=S9GFtxh+RKZV+9+onqZbdQde+MzLAauBMVMBs8/IzwnP/ExcS9QkNfc+
   6KIAlM5y3BhnECE7UO7hqppaG+CW6MhTJKLcmWna3Edu3ZJr6vGRLSnhZ
   mbVdM36oswIfJgfvSZL7IWHK/m9BP4u+Thl32YuRNLT0HDwuZOXyZ2JQF
   atwKndn4+/zDEVhQAHgRJwTrJCx2w4WhyaP4OMtBMnRvknaH+h7QPh0oy
   wwHlXgpJzRFdtBhfvj1NSrlLpFZUWeImKpPdRsgWhIgi1A5J4ng2miBfl
   W4MEKZZXuVN8v5+Z2Ywe39mi98Ob4IAs+TJU2kghFedL7rJZeA9KM+Hgf
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="148298424"
X-IronPort-AV: E=Sophos;i="6.09,245,1716217200"; 
   d="scan'208";a="148298424"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 10:10:29 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id AF971C9442
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:25 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E82CBD5098
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7A4A9401E8
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:24 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0DE3E1A0002;
	Mon, 29 Jul 2024 09:10:23 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 15/33] python3-importlib-metadata: upgrade 8.0.0 -> 8.2.0
Date: Mon, 29 Jul 2024 09:09:50 +0800
Message-Id: <1722215408-27541-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
References: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28560.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28560.003
X-TMASE-Result: 10--0.858900-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqzWJ46n79OHuSxX
	wd9S2XGh4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat0549W0pkpPR1Da4nP
	T8jZv1NHi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFHG5kPD5ZZQcp3/D97lx2t3G1/
	0ZuXUxY6lHbYzrAYiX7VnVqy8o/8OrNIaG6ge22IyD++ka9zVAfJ2NV8WYsCg95muB7h60E+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 01:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202588

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add SimplePath to importlib_metadata.__all__.
- Prioritize valid dists to invalid dists when retrieving by name.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ib-metadata_8.0.0.bb => python3-importlib-metadata_8.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_8.0.0.bb => python3-importlib-metadata_8.2.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_8.0.0.bb b/meta/recipes-devtools/python/python3-importlib-metadata_8.2.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-importlib-metadata_8.0.0.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_8.2.0.bb
index 1e446c891f..3e1c7a7d6b 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_8.0.0.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_8.2.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "188bd24e4c346d3f0a933f275c2fec67050326a856b9a359881d7c2a697e8812"
+SRC_URI[sha256sum] = "72e8d4399996132204f9a16dcc751af254a48f8d1b20b9ff0f98d4a8f901e73d"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.34.1


