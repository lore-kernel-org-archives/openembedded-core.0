Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2445D116FB
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 05:40:04 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.5577.1729834800084248981
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 22:40:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Dq8h3Fey;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1729834802; x=1761370802;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Gh0PfocIzpJ9km8CpmIgwqQzYDO+HSHLkaWZENNMO6o=;
  b=Dq8h3FeywHWTIGIsL/DIfFBSzlfz6Izq8BpM+IXjHzse2rtjZWnDhC8j
   J7qTMS/6zEmkxQQiW/9S/SsHV/lxd+RSzL/dmaD3QM5lqPYnt7s2wgKXG
   Sspy9m5S3c8SbaQms4wtyBvyeBIJE4o38A1fKh7mYdGEQXTDc09xBIdgh
   Cu2QpDvdOKLX9vDUKmaaNs/FuP5NzDNDWoIpNJG5CVtB1rXfF7+r58FzH
   3TZf1hYbfTar3CMQ/HGE02Kbh5T2cztkCFNJV273ft1q0yBw79AFYn12/
   5NPxxgZnbdMbuPwhcv0GOdhKvBFTogEzcraQEUmDuV3JcqQGn9B4xmd+7
   Q==;
X-CSE-ConnectionGUID: qQJ1YVhaRiCL9jKdBBra0g==
X-CSE-MsgGUID: FUkzEeMLSiiNlAf2f2WuFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="177944738"
X-IronPort-AV: E=Sophos;i="6.11,231,1725289200"; 
   d="scan'208";a="177944738"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 14:39:59 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A377916B902
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:56 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id CE07CD3F1A
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6769920071A0D
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 14D5E1A01E9;
	Fri, 25 Oct 2024 13:39:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 18/22] python3-rdflib: upgrade 7.0.0 -> 7.1.0
Date: Fri, 25 Oct 2024 13:39:25 +0800
Message-Id: <1729834769-4717-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
References: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28752.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28752.005
X-TMASE-Result: 10-1.251000-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yXg2y0j5vXZGlEDhvi2wR87QarzCEH4/6oRM
	yN/ppM4nscy9L7UrjrsNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2h+t
	oLLKXwRGBkESMI05d4lzjFhM9hn+YXHEPHmpuRH0URSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2i5u
	/VvsFaHcTouGOd18ICWWOPAqsL+k/ODb5bVsvnTf3pQI8NYqKthY8fraY2660r7xnSm6lZu4St1
	8rwfYb8/mJaua7v6wSBFFmpy+4M4fIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 05:40:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206331

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2024.

Changelog:
 https://github.com/RDFLib/rdflib/blob/main/CHANGELOG.md#2024-10-17-release-710

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-rdflib_7.0.0.bb => python3-rdflib_7.1.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-rdflib_7.0.0.bb => python3-rdflib_7.1.0.bb} (71%)

diff --git a/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb b/meta/recipes-devtools/python/python3-rdflib_7.1.0.bb
similarity index 71%
rename from meta/recipes-devtools/python/python3-rdflib_7.0.0.bb
rename to meta/recipes-devtools/python/python3-rdflib_7.1.0.bb
index 4057c1dbbc..2715c36810 100644
--- a/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb
+++ b/meta/recipes-devtools/python/python3-rdflib_7.1.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "RDFLib is a pure Python package for working with RDF"
 HOMEPAGE = "https://github.com/RDFLib/rdflib"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=37d489c0cefe52a17e1d5007e196464a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e1efde25e459057a815649b18cbefa5e"
 
-SRC_URI[sha256sum] = "9995eb8569428059b8c1affd26b25eac510d64f5043d9ce8c84e0d0036e995ae"
+SRC_URI[sha256sum] = "a29a8fccebd3d3a5f1b7e88d92dace1c89829018c7d29a6114fff4449c188b3b"
 
 inherit pypi python_poetry_core
 
-- 
2.34.1


