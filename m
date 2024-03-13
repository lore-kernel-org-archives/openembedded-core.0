Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 189C1C54E68
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:09:40 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.10805.1710313777904567644
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:09:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jUW3bRdN;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710313777; x=1741849777;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=JAFtLy9Mhz7QIywwbhPEcmPG9ca8IDyI/3KU8zLFK5Y=;
  b=jUW3bRdNx7C0xyCjjmCyne+lgkjK3KVo5PMKJF9lKgAZMjZK3TXVBNYA
   Wf0w4yGeikaaojKe+bHQwpRIpC/Gv6eDbUACT9yxbQzTpqos1NPecvJE0
   JjyIzplhO3h0tNVhC641OSbB683XDNfjWqL2gWvzIORhN9F3Tbp//c8XF
   tssGiWNIP86FK/IXunWOkgRUabX7ney2nUjdgp3frTBt4A/mNpmwnCjCC
   XOIkoAzcm5g358ps4XYAs06Rcj31Y9wkxKZb1+zIaIH/bXuG0uYrxIQBZ
   rJpS2kA6LaONghosAAn/CeP7ucNrSoBt/PY294PRhICX+gZ3cRq0fjhTr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="139727654"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="139727654"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:09:35 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5A0ACE6006
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:33 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9177CD3F1E
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2AFC12235C4
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CDAA61A006B;
	Wed, 13 Mar 2024 15:09:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 29/36] python3-trove-classifiers: upgrade 2024.2.23 -> 2024.3.3
Date: Wed, 13 Mar 2024 15:08:27 +0800
Message-Id: <1710313714-12541-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.004
X-TMASE-Result: 10--1.655300-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqzRJq3/nCaAjBWz
	3jZitQjNTdTS6BwKrm0F1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbedlNc
	WZ7137CiBkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNTaTRt4U4U8zJePOpmu/44I2B5MrFUIPjDFNUaGYnl5oWE8ek1i8J6OTGJULfgYc/ZgNS
	pqzZOXvEz4Q0Y7v3i3MupS6A/iTDzKgHg/t0KH2U8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:09:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197031

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
*add  "License :: OSI Approved :: NASA Open Source Agreement (NOSA)"
* added NOSA
* Update src/trove_classifiers/__init__.py

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...fiers_2024.2.23.bb => python3-trove-classifiers_2024.3.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2024.2.23.bb => python3-trove-classifiers_2024.3.3.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2024.2.23.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2024.2.23.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb
index 8514a52616..b912efcf55 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2024.2.23.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "8385160a12aac69c93fff058fb613472ed773a24a27eb3cd4b144cfbdd79f38c"
+SRC_URI[sha256sum] = "df7edff9c67ff86b733628998330b180e81d125b1e096536d83ac0fd79673fdc"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


