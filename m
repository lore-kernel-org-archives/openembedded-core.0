Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D7EC25B73
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:14 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.11791.1713948189441937092
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XJCjgaYL;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948190; x=1745484190;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=AfavsUt1dIsDCdmze0bghNlK31Pk6/Fw82rlTqFdKHQ=;
  b=XJCjgaYLKaqRpON7vgDGxOpOA8na7RQQkWikjft/g/wciTvoxSUMkeei
   KbnJkjArELW0wv1JN5abuFH7+0WSq7OGFp9XGE1pI6+cEow63aOkGxqKf
   66spgeRj86poMcVnLzN8Cs11lKLWIH1ggK7NmOSfqPbMLBL40k8EQ8Fp9
   EbXyE9aYLbrgbZ78DsckUJHh60V0rVjOqukB2bXUogIkruyksooLlxbN5
   +MR3KBzOnPOIvXcLkjdNN+4RAzv2m92csQc93g+6yw98Oq3tomAB8ivr9
   VMAvQODamlLn5jc7M36AWRb0STSs5MUVchULirNLE2oTpvoJ4613PhlCe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="158512444"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="158512444"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:43:08 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1758BC2AA1
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:05 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5ADDDD9730
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:04 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id EC1EA202CE122
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:03 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 997341A000A;
	Wed, 24 Apr 2024 16:43:03 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 25/38] python3-idna: upgrade 3.6 -> 3.7
Date: Wed, 24 Apr 2024 16:42:19 +0800
Message-Id: <1713948152-13501-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10--1.416300-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yXg2y0j5vXZGlEDhvi2wR879wRnyxuPjhHw6
	H06bMgiv3c7SY8eZSi4Nyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2WhU
	u0KpE+I8NUccATRyd1AYUFsN5WfiFOwTo9ZXISSzdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtiuUf6P8+2DAp/FqsRpGR/vmc56Ij3G9a5sacWMgCJUUkuq22YpZUX8014
	pItywPUcAO6CH5X5N/xUGGeu63AYLT5iKGE4WGbHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198670

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2024.

Changelog:
 Fix issue where specially crafted inputs to encode() could take exceptionally long amount of time to process.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-idna_3.6.bb => python3-idna_3.7.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-idna_3.6.bb => python3-idna_3.7.bb} (62%)

diff --git a/meta/recipes-devtools/python/python3-idna_3.6.bb b/meta/recipes-devtools/python/python3-idna_3.7.bb
similarity index 62%
rename from meta/recipes-devtools/python/python3-idna_3.6.bb
rename to meta/recipes-devtools/python/python3-idna_3.7.bb
index 47c080cdf8..729aff1c46 100644
--- a/meta/recipes-devtools/python/python3-idna_3.6.bb
+++ b/meta/recipes-devtools/python/python3-idna_3.7.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Internationalised Domain Names in Applications"
 HOMEPAGE = "https://github.com/kjd/idna"
 LICENSE = "BSD-3-Clause & Python-2.0 & Unicode-TOU"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=dbec47b98e1469f6a104c82ff9698cee"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=204c0612e40a4dd46012a78d02c80fb1"
 
-SRC_URI[sha256sum] = "9ecdbbd083b06798ae1e86adcbfe8ab1479cf864e4ee30fe4e46a003d12491ca"
+SRC_URI[sha256sum] = "028ff3aadf0609c1fd278d8ea3089299412a7a8b9bd005dd08b9f8285bcb5cfc"
 
 inherit pypi python_flit_core
 
-- 
2.34.1


