Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0566AC54E7C
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:09:30 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.10644.1710313768973737197
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:09:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ia2swYS4;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710313769; x=1741849769;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Qy6yP44sRUWkPwgmR2X7CfuFmzGIwUTIzV0Dyt451cs=;
  b=ia2swYS4ADz8uhrjx62Lrx9Vg3Uf2FtVJtXbCKKQFmexSDaW/gwiHzbA
   s2xwjHWx3NO3rTgyNYohIZcRjkvCkzOlR4BEiVfvxaX1FW3okH3DkBM1l
   9AOiO5eKuqaM3O1V+47n/PP4rmFf3TAluSyZWWVkMQBXRiw0oXlb6Ym2O
   Vb7/W1AfE28I/KteAsA68BVBp9qmaYH90c2TWTnWjQZxjRmavm4sTAOjv
   0COVOvMRksvAVC+v2TGZ3s3ub3AKvaGKIrLm9J5i5eL67N1bGR6M75PFy
   Gl+++ad4O+ZL5TzXZe19Uw/31TZukx4Bit2jGJFKS58dDkZinvubTHcpu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="130911006"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="130911006"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:09:26 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 47506232A6
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:24 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 875DB26BCF
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:23 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1F7CD2C666B
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:23 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C09F91A006B;
	Wed, 13 Mar 2024 15:09:22 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 26/36] python3-pyparsing: upgrade 3.1.1 -> 3.1.2
Date: Wed, 13 Mar 2024 15:08:24 +0800
Message-Id: <1710313714-12541-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.004
X-TMASE-Result: 10--7.005400-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yUIIxwDaU5mr+ZfOn+32vrDVbZFdXapsKRv7
	0+kip7+HqI4+rBp7K+nMau1T20usrtY0aLR3ltrWGqSG/c50XgMxVUWGXs3C844QQ2CxQC5itMd
	GzZAls9YQIRzoTL90t/4snQvA+qD7MfSVIQJRzw3G+nS24MzHeVQQ0EgzIoPRB/FMznsE8cPu/Q
	yUVIt+aU0NCZDxtvO/5p98cjyQCaKzVFZ6osYjDp+stJjZFtGkmJAMgmwOylc+uG9Or5gEX56ba
	/D5x6cp4vM1YF6AJbbCCfuIMF6xLSAHAopEd76vvwVxf8SNLYb4cEFfB4CPSWpzwKRawZ6GrF8r
	g3Rp+Hwu9quSvvMDvg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:09:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197029

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Added 'ieee_float' expression to 'pyparsing.common', which parses float values,
  plus "NaN", "Inf", "Infinity".
- Updated pep8 synonym wrappers for better type checking compatibility.
- Fixed empty error message bug. This _should_ return pyparsing's exception
  messages to a former, more helpful form. If you have code that parses the
  exception messages returned by pyparsing, this may require some code changes.
- Added unit tests to test for exception message contents, with enhancement to
  'pyparsing.testing.assertRaisesParseException' to accept an expected exception message.
- Updated example 'select_parser.py' to use PEP8 names and added Groups for better retrieval
  of parsed values from multiple SELECT clauses.
- Added example 'email_address_parser.py'
- Added example 'directx_x_file_parser.py' to parse DirectX template definitions, and
  generate a Pyparsing parser from a template to parse .x files.
- Some code refactoring to reduce code nesting
- All internal string expressions using '%' string interpolation and 'str.format()'
  converted to f-strings.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyparsing_3.1.1.bb => python3-pyparsing_3.1.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyparsing_3.1.1.bb => python3-pyparsing_3.1.2.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pyparsing_3.1.1.bb b/meta/recipes-devtools/python/python3-pyparsing_3.1.2.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pyparsing_3.1.1.bb
rename to meta/recipes-devtools/python/python3-pyparsing_3.1.2.bb
index 6f34091c86..64210ade53 100644
--- a/meta/recipes-devtools/python/python3-pyparsing_3.1.1.bb
+++ b/meta/recipes-devtools/python/python3-pyparsing_3.1.2.bb
@@ -10,7 +10,7 @@ BUGTRACKER = "https://github.com/pyparsing/pyparsing/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
 
-SRC_URI[sha256sum] = "ede28a1a32462f5a9705e07aea48001a08f7cf81a021585011deba701581a0db"
+SRC_URI[sha256sum] = "a1bac0ce561155ecc3ed78ca94d3c9378656ad4c94c1270de543f621420f94ad"
 
 UPSTREAM_CHECK_REGEX = "pyparsing-(?P<pver>.*)\.tar"
 
-- 
2.34.1


