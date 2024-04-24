Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CEFBC10F15
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:14 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.11729.1713948191684990253
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=n6wO+wd3;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948192; x=1745484192;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=kMinu7iDC78FbcFaBoBxAgsEBYV03fd8BwHZ5oiOBvU=;
  b=n6wO+wd3l2y87rH4it00zDU3hK/1dlR3hJoziMgvhtgQJ7Sq5V7VCxNf
   crOKar5k4v8tfM9tYDKoq1qfuiXsK/ibfyrqSVoTR/LKkKKJrw4P05xvw
   wH++UIYbxr9U2WyPqN9eDZF36VP+Lh/BIAkEbqLnixtURXY524UB88L6g
   2uF5IxYkeumG00eu5bnVfPaqytIsOJlTJvrBfewlkq3vfsYCbmpmH1NMC
   FtsI/THkv7Umw6+9wgKjq0vFko2G+DEYl4srywqCRsw34hG7MHY1D/udi
   WI5vPCTKMyL/jskJIDvKoeb706BTmqsFAY6rWxIlmo7aV1Sd8CzvtFtUN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="156433057"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="156433057"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:43:09 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 614DFD4C24
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:07 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6A7159837C
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:06 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 10967299652
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:06 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AF9D81A000B;
	Wed, 24 Apr 2024 16:43:05 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 30/38] python3-setuptools: upgrade 69.2.0 -> 69.5.1
Date: Wed, 24 Apr 2024 16:42:24 +0800
Message-Id: <1713948152-13501-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10--5.532600-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrScHI0MnRcnQ1a43ksVK2hfCY
	Kqf93u4XJx/+k1q845ElcFRSTOc/28RBLZ5x+SkXP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW68MEz9q9cihqC33GyXduU38plQwfMmRJSeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNRaQyZ3aSRdtFBwThuFkw75+c/18WFz2DHBEgZ6UozlkAx5nuFi4ALk=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198677

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Merged bugfix for pypa/distutils
- Refresh unpinned vendored dependencies.
- Updated vendored packaging to version 24.0.
- Remove attempt to canonicalize the version. It's already canonical enough.
- Support PEP 625 by canonicalizing package name and version in filenames.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-setuptools_69.2.0.bb => python3-setuptools_69.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools_69.2.0.bb => python3-setuptools_69.5.1.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-setuptools_69.2.0.bb b/meta/recipes-devtools/python/python3-setuptools_69.5.1.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_69.2.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_69.5.1.bb
index 897398afc5..8261b09d16 100644
--- a/meta/recipes-devtools/python/python3-setuptools_69.2.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_69.5.1.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "0ff4183f8f42cd8fa3acea16c45205521a4ef28f73c6391d8a25e92893134f2e"
+SRC_URI[sha256sum] = "6c1fccdac05a97e598fb0ae3bbed5904ccb317337a51139dcd51453611bbb987"
 
 DEPENDS += "python3"
 
-- 
2.34.1


