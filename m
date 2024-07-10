Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C0FC3DA56
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 09:44:29 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.10244.1720604657021339322
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 02:44:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Kzw+w7i7;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1720604664; x=1752140664;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=AGqbEq0z2hlO7emWJm4ECCT05APMkDcuq2bFR7bObxg=;
  b=Kzw+w7i7ol5XF3GDz5tfi0GfR+Jyxzul8MzQ45Nr6fPmL6k6L40kFWGE
   +qIsAR71ICU0Oc7gKo8r/nd8WjqCBQvVcvNCaR/thMolTNN8CzQGFYc/0
   /TDEW5w5c7qKpDCB/FTh7A8magBgLfHzPYQdSCDhNRPfq8wVMNDgB3pPZ
   qYeOAXPJH69F0KlMkQAMJkCNYaCBUQP+8EntoR/3Q81juyzdJEUFMn89Y
   uNJsUMeZB0/o5ayTDJ1JcCUusSljdmUneCawWB8RPbwbKXMEj1D6e567a
   B1+TkKkSvkSFkIFRUN3Ej2YJ1QL1FlDk9ySQxoebj+3rtwEXuklOvWG5+
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="166585678"
X-IronPort-AV: E=Sophos;i="6.09,197,1716217200"; 
   d="scan'208";a="166585678"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 18:44:22 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 06252C68E1
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:20 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 55D07D510E
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E38ED22002A
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:18 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 910F01A000D;
	Wed, 10 Jul 2024 17:44:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 27/30] python3-trove-classifiers: upgrade 2024.5.22 -> 2024.7.2
Date: Wed, 10 Jul 2024 17:43:51 +0800
Message-Id: <1720604634-23406-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
References: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28520.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28520.006
X-TMASE-Result: 10--1.146300-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mregIHHX2L4YwZFeXguNpWv0mY
	fhvEN/pW+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIOmHqf6ZGvCR1vZ
	7s3YIVDLYgCp6bjAgaoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzOmw6cF3lDQYGy0
	jPWohkkEOpAyi596U97o0OGdvgyd6sO2mefBkY1FPDDho7Jkciuq9nLHa+QvRZmqtam9pFAq7ZX
	Mf1CWgciB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 09:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201718

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Add CUDA 12.3-12.5 classifiers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...fiers_2024.5.22.bb => python3-trove-classifiers_2024.7.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2024.5.22.bb => python3-trove-classifiers_2024.7.2.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2024.7.2.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2024.7.2.bb
index 8876b63e7d..934c6d4be0 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2024.7.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "8a6242bbb5c9ae88d34cf665e816b287d2212973c8777dfaef5ec18d72ac1d03"
+SRC_URI[sha256sum] = "8328f2ac2ce3fd773cbb37c765a0ed7a83f89dc564c7d452f039b69249d0ac35"
 
 PYPI_PACKAGE = "trove_classifiers"
 
-- 
2.34.1


