Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 976D7C3DA50
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 09:44:29 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.10244.1720604657021339322
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 02:44:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AWgrKdLk;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1720604662; x=1752140662;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=6arSEiXqJHk5rXcayMN9OP1k6TWkos0JZdk8IoqOBnk=;
  b=AWgrKdLkMVz++9R05BpxOWQlCiyrcXoo30PJAiLSQyv5JNh4mIHjLDvL
   KuuN53MoSXWfnD7wgBtTPKiZlRhX7PTKFzaCt2V21lho5Y1fQXGsZONF5
   lMOX++uDNWwKEgXXSSa/Y8fq1Wn+2D05gLNcMR8+3kSFkSiEYaoVx+UZ0
   7RqddGel53eeWJvUVtoSQGlliaZbHOjmp0LEl+SshB7HAnCZv31mPvKcX
   UaviVXMPXCQyp4JxWKrTCoP4CJaQ5OTBpVgv5G2COeoQegIqBITvmtfDT
   wx1m3mYBkCTIeLZTvVacnkAfWWMX4lkNBNcV8RZSJ0s4yfAKzso48NzWx
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="166585674"
X-IronPort-AV: E=Sophos;i="6.09,197,1716217200"; 
   d="scan'208";a="166585674"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 18:44:21 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5B0B6D6EF1
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:18 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id AA594D510E
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 457552005018E
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:17 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EA3DB1A0002;
	Wed, 10 Jul 2024 17:44:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 22/30] python3-certifi: upgrade 2024.6.2 -> 2024.7.4
Date: Wed, 10 Jul 2024 17:43:46 +0800
Message-Id: <1720604634-23406-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
References: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28520.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28520.006
X-TMASE-Result: 10-0.325700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr/1vXbkGjWeWdvIILGGRj1b6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74DfVqwz+CynaV42zm1Zi+MJ1vZ
	7s3YIVDLYgCp6bjAgaoAy6p60ZV62yA7duzCw6dIBpRCTkRk5SfoLR4+zsDTtoubv1b7BWh3Upz
	SS9EgOtm9sk71Wkz/1B1KhGFpvfrx20Mx7Xgdap7e4o5gciHB+myMb2iIeIk3UbuKCWESLxJ4Dv
	CNjeIqZy/aMbUL/Ms/yDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 09:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201715

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Bump peter-evans/create-pull-request from 6.0.5 to 6.1.0
- Bump actions/checkout from 4.1.6 to 4.1.7
- Bump pypa/gh-action-pypi-publish from 1.8.14 to 1.9.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-certifi_2024.6.2.bb => python3-certifi_2024.7.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2024.6.2.bb => python3-certifi_2024.7.4.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2024.6.2.bb b/meta/recipes-devtools/python/python3-certifi_2024.7.4.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-certifi_2024.6.2.bb
rename to meta/recipes-devtools/python/python3-certifi_2024.7.4.bb
index 504fda4124..781e04213d 100644
--- a/meta/recipes-devtools/python/python3-certifi_2024.6.2.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2024.7.4.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "3cd43f1c6fa7dedc5899d69d3ad0398fd018ad1a17fba83ddaf78aa46c747516"
+SRC_URI[sha256sum] = "5a1e7645bc0ec61a09e26c36f6106dd4cf40c6db3a1fb6352b0244e7fb057c7b"
 
 inherit pypi setuptools3
 
-- 
2.34.1


