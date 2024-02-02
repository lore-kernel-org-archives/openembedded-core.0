Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCFDEC4828D
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 00:08:14 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.11557.1706832491967621572
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 16:08:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XXZImgOo;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706832492; x=1738368492;
  h=from:to:cc:subject:date:message-id;
  bh=FRpUE36WMN8DzAcblHNf/z20Gb0MTL2CvEAxAU+ug20=;
  b=XXZImgOo3QK+BKfcMpfHmxWgpdzOtQEmms+WFPxLQuzxAP8BBN6kKNeZ
   WxmlZDOILmZQjhGHDrosN47hkT9mFZ58myunRTuP1DqMq1g9u0AMhEboX
   kmuSj/bz0kkkU56DRTbszQ429vRGrtHuynx8EOzUAl899oxhFG911qHIh
   ibetSC3jVSr20AFApxoLuCQhtxxtESyfZESe0SuL3jmKitjkHlpRB2/3t
   cC0YPpc3F8DLNgUpyYrcyR/maelko1M778vHyRRGG5T3laYqKnU6F/TAx
   8s1VU2N1gPEcCOsh59RXlyn4HGOq1TYAjBKM4WI21b41+skNdM5xNJayu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="148097325"
X-IronPort-AV: E=Sophos;i="6.05,236,1701097200"; 
   d="scan'208";a="148097325"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 09:08:09 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 41A9DD4805
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 09:08:07 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 739AA742C46
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 09:08:06 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 063CD6B4DB
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 09:08:06 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 69C3E1A009A;
	Fri,  2 Feb 2024 08:08:05 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-beartype: upgrade 0.16.4 -> 0.17.0
Date: Fri,  2 Feb 2024 08:07:57 +0800
Message-Id: <1706832477-19710-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28158.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28158.003
X-TMASE-Result: 10-2.926100-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yXg2y0j5vXZGSc4iQ7VD4M2U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNL2JUO7sQ9/z4qCLIu0mtIGAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w4UF1
	72GA+0c3Da3Wn8t2hXrgm0z5NUuPPiOK5ORVRZPqTY4jidSDQ2IqAivCgqZbqtYkbKCvyu4apE9
	H2WbpNXRBb/ZswplQiCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 00:08:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194764

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2024.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-beartype_0.16.4.bb => python3-beartype_0.17.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-beartype_0.16.4.bb => python3-beartype_0.17.0.bb} (54%)

diff --git a/meta/recipes-devtools/python/python3-beartype_0.16.4.bb b/meta/recipes-devtools/python/python3-beartype_0.17.0.bb
similarity index 54%
rename from meta/recipes-devtools/python/python3-beartype_0.16.4.bb
rename to meta/recipes-devtools/python/python3-beartype_0.17.0.bb
index ad4462e0e2..7b14a3794b 100644
--- a/meta/recipes-devtools/python/python3-beartype_0.16.4.bb
+++ b/meta/recipes-devtools/python/python3-beartype_0.17.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "Unbearably fast runtime type checking in pure Python."
 HOMEPAGE = "https://beartype.readthedocs.io"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e40b52d8eb5553aa8f705cdd3f979d69"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e71f94261c1b39896cacacfeaf60560e"
 
-SRC_URI[sha256sum] = "1ada89cf2d6eb30eb6e156eed2eb5493357782937910d74380918e53c2eae0bf"
+SRC_URI[sha256sum] = "3226fbba8c53b4e698acdb47dcaf3c0640151c4d405618c281e6631f4112947d"
 
 inherit setuptools3 pypi
 
-- 
2.34.1


