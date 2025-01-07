Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB11E7719C
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 09:01:45 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.16517.1736240494627017429
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 01:01:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kzjPj6s9;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736240495; x=1767776495;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=77EbID9o8VDV3inCqy/SB6cf2yIJxOsds38iXkk3/fw=;
  b=kzjPj6s9l2vhD+VBQ8n+MDVu89/GCOEqHH4O0vO1wgPyDZCwuzFg6NlC
   YfxqNEyKg3LXriGfU1wyc4Rgsu0VgGr0G44Mw8/HkeKhHWaaQoCzeqcOC
   DqX5WbgegoOl6OiOWIfmy+/jKxciP1QwIyb0IvqjVKQpY6cFEP3qFKGlk
   GqlCXViHVp3t6Z7Jdw8Vu5vIRfhSso9l0Rk3I16Ds179KvahAhlC/BmM2
   y0qTHpitTtpx/oIZSSsBVbB1zd4wQvNJ+i47Gz1FeXqlQryABMFPUgdaZ
   zzs4jrUfEwaRnHAcfrhQTC7pN8/xsxNNUqQKE0rem8cAWIILaQ03xTjzj
   Q==;
X-CSE-ConnectionGUID: b21k1rFsQkqMxxOEu/4kUA==
X-CSE-MsgGUID: GiIqA5gJTbmBHZAK5MpBtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="173804692"
X-IronPort-AV: E=Sophos;i="6.12,295,1728918000"; 
   d="scan'208";a="173804692"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 18:01:32 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id DE920C2262
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:30 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B6F04D8B73
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 51C62200930C2
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:30 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0C8971A0003;
	Tue,  7 Jan 2025 17:01:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/13] python3-pygments: upgrade 2.18.0 -> 2.19.0
Date: Tue,  7 Jan 2025 17:01:18 +0800
Message-Id: <1736240482-5243-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736240482-5243-1-git-send-email-wangmy@fujitsu.com>
References: <1736240482-5243-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28908.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28908.003
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZngIgpj8eDcBpkajQR5gb3mn0m688Eo38Kra
	uXd3MZDXPfXhUMXbUxrHerJdDMAR0fV0wYXgef3ZUPAt6A9SFcZDGlW4PeOfaZefmRjfjhFSxrg
	isUH4MESsyoobiglvDvtRPmICzxjQyLmVkJTlglFPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 09:01:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209443

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pygments_2.18.0.bb => python3-pygments_2.19.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.18.0.bb => python3-pygments_2.19.0.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.18.0.bb b/meta/recipes-devtools/python/python3-pygments_2.19.0.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pygments_2.18.0.bb
rename to meta/recipes-devtools/python/python3-pygments_2.19.0.bb
index 459490f824..f1bc845662 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.18.0.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.19.0.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592"
 
 inherit python_hatchling
-SRC_URI[sha256sum] = "786ff802f32e91311bff3889f6e9a86e81505fe99f2735bb6d60ae0c5004f199"
+SRC_URI[sha256sum] = "afc4146269910d4bdfabcd27c24923137a74d562a23a320a41a55ad303e19783"
 
 inherit pypi
 
-- 
2.43.0


