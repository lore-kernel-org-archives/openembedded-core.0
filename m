Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4417DCAC587
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:18:00 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.13240.1757495870992538970
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 02:17:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sUWlYjlf;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757495872; x=1789031872;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2Ags90bL5yjktTrxZLtS7nvNr8Jk28x7w2ndGSMXkoY=;
  b=sUWlYjlfQxbSxviRYi4ht5OdZmB3zKRMyoMhRpMWNCrwRKphAYiuhU9l
   m15qV+x+5Sq0KROM+VTZ22feJ0rx43aCKmamt/wZj3Muk5/HTHo2Z3cmX
   QrOmOO0TbAA33gKryo5lbKxPB+yYJyyYKmxPFoDu0RhxIpPA8oOPvMrMv
   Tk7NZ7NIv4ogbh0t8vO5DOyxuBeMLaWqhSjkUI+z55SiZ60rc1rWZ9Ysp
   JSZM8ReT+RcO49rK11Vwo5wDOw99c+q42WdizRfwN/3N/ms3kFiQGi2nU
   LeOKyqs0ZEnwx6YGYGdi61nfJ1s10UTIt1RB+IjgftovicZk/A8VUUvTV
   g==;
X-CSE-ConnectionGUID: SPpxnjagSuqNhR/IkbFaaQ==
X-CSE-MsgGUID: FhRwKVFdSzO++BWr4yX/8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="211787034"
X-IronPort-AV: E=Sophos;i="6.18,253,1751209200"; 
   d="scan'208";a="211787034"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:17:51 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 234AB1000353
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:50 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id D347310001DC
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:49 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 441F9140C301
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:48 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 582D41A0073;
	Wed, 10 Sep 2025 17:17:45 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 37/40] stress-ng: upgrade 0.19.03 -> 0.19.04
Date: Wed, 10 Sep 2025 17:16:43 +0800
Message-ID: <20250910091646.998-37-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250910091646.998-1-wangmy@fujitsu.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223188

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../stress-ng/{stress-ng_0.19.03.bb => stress-ng_0.19.04.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.19.03.bb => stress-ng_0.19.04.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.19.03.bb b/meta/recipes-extended/stress-ng/stress-ng_0.19.04.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.19.03.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.19.04.bb
index 96b68f4653..88d3ee3f4a 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.19.03.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.19.04.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master;tag=V${PV}"
-SRCREV = "20e0f48cf0ca9cc96ed150c3dfa96f8e8a2f964b"
+SRCREV = "6e977ddae4b66bc0e5c3f993e3b5ff0bc06915fd"
 
 DEPENDS = "coreutils-native libbsd"
 
-- 
2.43.0


