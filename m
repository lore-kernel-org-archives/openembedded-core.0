Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E83C54E71
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:09:29 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.10642.1710313765163038666
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:09:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RzvKz7qS;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710313765; x=1741849765;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=LBSyKSWGSENX1karzX8/mGW3mNVdt0lgD4qrhpr2Op0=;
  b=RzvKz7qSQXX2Mf5LG/9XswWQquL6uYY+Rxl9RBhBNmCFPFkoVvbe9ceW
   XwufKSKFhDppVlMeDaOPzzFb67Z0wtF0FpyPJBG8eQZyku0LXCjVGHmaZ
   E72icMCbIuEJ9SYrTiqnDAXm2jylr0KWiGXJ0EWn0osKrqa3xcNFJa7RX
   VlqLh+dZI4lr6ZbkrS2LtTYPjgE3/L1Bx8h4ZN46An01m9y9pfKMbhRWa
   F3VhEa5Z9O8M+4pG1PHmK3mlFGNf5cNCgsmUue5bI0I299TZYRnFBavfj
   N/ez7yCCh4z5uDe28ggqSIBpWMM+7h1Iv7ENx63yIS1wGJCiUgQlX9teh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="131429016"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="131429016"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:09:23 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D6459DD942
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:21 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0DF16FD837
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9538120097CD1
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:20 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 42AB01A006B;
	Wed, 13 Mar 2024 15:09:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 21/36] python3-importlib-metadata: upgrade 7.0.1 -> 7.0.2
Date: Wed, 13 Mar 2024 15:08:19 +0800
Message-Id: <1710313714-12541-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.004
X-TMASE-Result: 10--0.235500-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4BC5HdxA3MwScH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJogMWCgdCzp+adXu122+iJtpV4BnlVId1nZsoi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62SMcd/u87748I6pskFmnnatfphfcAkab1epHIj3VWkfm2xEb
	7xNnGsn3M4D2/DZ5DpQTmSJhoEKsrsfhXtXBPLgidaFWL+CKg5S7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197023

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ib-metadata_7.0.1.bb => python3-importlib-metadata_7.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_7.0.1.bb => python3-importlib-metadata_7.0.2.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_7.0.1.bb b/meta/recipes-devtools/python/python3-importlib-metadata_7.0.2.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_7.0.1.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_7.0.2.bb
index 0d3f0a5001..719d5f84f9 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_7.0.1.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_7.0.2.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "f238736bb06590ae52ac1fab06a3a9ef1d8dce2b7a35b5ab329371d6c8f5d2cc"
+SRC_URI[sha256sum] = "198f568f3230878cb1b44fbd7975f87906c22336dba2e4a7f05278c281fbd792"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.34.1


