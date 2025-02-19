Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 256C7C021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 02:40:00 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.13767.1739932794099619821
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 18:39:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NEPMVhD4;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739932793; x=1771468793;
  h=from:to:cc:subject:date:message-id;
  bh=+nvv+l7Stz4zDbnQT/D4yD7k3K9CDPzLsuSLzlep5PU=;
  b=NEPMVhD44BnSgZB136MwnZh23UuLDbVH2kKJrPIUF7rhO51QgmhcY4zq
   LweCBJKsqbupmANVVHhlEhbepfMmFJV+ntzbcjS2gCeSHYp99leuIcMEH
   XV3utQu2eRq5b+k1TX5Nr/F3qU+Yn1NQvO4RrgtEOn8gQWpGutiKCPXSr
   zU5gT8GlsFK9yyn4VhvUhr6gB+HtTvSq6Pl/TfWpyrV4y9DJnQ0y6+vHk
   3cfEGVKJZJO7EwJL7WoVDy31u9MavlBhfjAzPizlqTdwCtCIvTtudj+uy
   siHyeGQ+tCR4Ypekg9r0VL3SpS05cy5rD18cihs55Hcdo0VOCIrrwkNvb
   Q==;
X-CSE-ConnectionGUID: eHEkG/yiTbag+11AAP4cSA==
X-CSE-MsgGUID: p+Sqg7xlTLm6Mc+6Is1F+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="169322421"
X-IronPort-AV: E=Sophos;i="6.13,296,1732546800"; 
   d="scan'208";a="169322421"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 11:39:50 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A052BD480A
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 11:39:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 60116BDB61
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 11:39:49 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D277B1A0003;
	Wed, 19 Feb 2025 10:39:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] libpcre2: upgrade 10.44 -> 10.45
Date: Wed, 19 Feb 2025 10:39:43 +0800
Message-Id: <1739932783-28121-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 02:40:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211662

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
- LICENCE renamed to LICENCE.md
- format changed
- add "SPDX-License-Identifier:	BSD-3-Clause WITH PCRE2-exception" to the top of LICENCE file
- add contribution information

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libpcre/{libpcre2_10.44.bb => libpcre2_10.45.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre2_10.44.bb => libpcre2_10.45.bb} (91%)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.44.bb b/meta/recipes-support/libpcre/libpcre2_10.45.bb
similarity index 91%
rename from meta/recipes-support/libpcre/libpcre2_10.44.bb
rename to meta/recipes-support/libpcre/libpcre2_10.45.bb
index 36f58e4612..e82de0fa5b 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.44.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.45.bb
@@ -8,14 +8,14 @@ SUMMARY = "Perl Compatible Regular Expressions version 2"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=321a5eb46acae6b6c1ff2c7a866d836a"
+LIC_FILES_CHKSUM = "file://LICENCE.md;md5=8446a1fd12e40d9d64c79234fbb1f812"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2"
 
 GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/pcre2-(?P<pver>\d+(\.\d+)+)$"
 
-SRC_URI[sha256sum] = "d34f02e113cf7193a1ebf2770d3ac527088d485d4e047ed10e5d217c6ef5de96"
+SRC_URI[sha256sum] = "21547f3516120c75597e5b30a992e27a592a31950b5140e7b8bfde3f192033c4"
 
 CVE_PRODUCT = "pcre2"
 
-- 
2.43.0


