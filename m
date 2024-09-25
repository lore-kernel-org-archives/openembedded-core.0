Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71802C7882B
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:54 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.9324.1727246990065401154
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VNmnd6Jv;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246992; x=1758782992;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=SCDIwJQ5I5ENgte8wWb7V6QXIgHCx77Zj7lyGMa1VTM=;
  b=VNmnd6JvGiAoE1Lel+gx6bTJ9uuIkCYQyIYL9SSuJU/htczOmtDNY3ji
   rni9RlxaCO7dOGRuIhxyr9AGFH2994ZwRHX+ARxgnzroi3ajOfGY6LcOO
   NxfldZCHFQa3S/HWME1BdifspHTH2rY/2oArsGc3YNMVxlmh8YVoKxYWI
   KyFMB1gHehqOSdHbXhpUwNoilWEX0uOUoi6BbWAkLaHNqMiomRD4eHSyj
   ReqmHci6dOBZj/bb0nT+cF6OKBmZn1WLx21zYLsXkiZ2IlAsWOxeBWFqN
   LW86Qf1JILODUSSIzbaKd3Tapjylg1J0C6LjbU5U60sGGtupSUj8GfLc2
   Q==;
X-CSE-ConnectionGUID: SSmGV6bkR3uFORV5mcreJQ==
X-CSE-MsgGUID: hzSEAiA/QOas8Ggksddbsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="153715155"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="153715155"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:48 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id D5300DF10F
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:45 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 12452BF3D6
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8948220086326
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:44 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 395521A000A;
	Wed, 25 Sep 2024 14:49:44 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 30/47] python3-pyasn1: upgrade 0.6.0 -> 0.6.1
Date: Wed, 25 Sep 2024 14:49:03 +0800
Message-Id: <1727246960-20665-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10-1.649100-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrMVx/3ZYby7/TQqRbCv7WC76p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74Br9+Kgn2XgeNzONa1Rspx31vZ
	7s3YIVDLYgCp6bjAgaoAy6p60ZV62yA7duzCw6dIBpRCTkRk5SfoLR4+zsDTtfUeErNKFJickZv
	anQrYRr/Ot9Ik6YjY+KMAUcOoPJiDPFdxUaPMjahRAcz0e/U0FWDZbzumTbxtVDF+AbfliTgZq5
	EigU4DuxfQU+MbtCE7yDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204929

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Added support for Python 3.13.
- Cleaned Python 2-related code.
- Removed bdist_wheel universal flag from setup.cfg.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyasn1_0.6.0.bb => python3-pyasn1_0.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyasn1_0.6.0.bb => python3-pyasn1_0.6.1.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb b/meta/recipes-devtools/python/python3-pyasn1_0.6.1.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb
rename to meta/recipes-devtools/python/python3-pyasn1_0.6.1.bb
index 7237557f44..3913cb51d2 100644
--- a/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb
+++ b/meta/recipes-devtools/python/python3-pyasn1_0.6.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=190f79253908c986e6cacf380c3a5f6d"
 
-SRC_URI[sha256sum] = "3a35ab2c4b5ef98e17dfdec8ab074046fbda76e281c5a706ccd82328cfc8f64c"
+SRC_URI[sha256sum] = "6f580d2bdd84365380830acf45550f2511469f673cb4a5ae3857a3170128b034"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


