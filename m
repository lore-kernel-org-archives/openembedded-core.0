Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6B47D2E9CA
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:25:15 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.82416.1731403512194934051
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NFfBPyXP;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403512; x=1762939512;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=hoshFLwMPEBQc0kVKu/2QcV4FNsJsN+3b/MiQyXR1oA=;
  b=NFfBPyXPk++cgwUYyKaUlgdYGl8oifSoagwKCnXu9Ef/8MVcdW+W2eYx
   jhDu44rr6Zs2YIhKencBXfQczFNdu3/QG5+t8fLd4HYezZxgMQ4rQeJNM
   PaikncLzB0vZxYKy0jdASnDzS15KT6cbCcWjfk9oSRBte21XYnrFfE0U9
   YXGEmMkTpFbPBdltuLASdMP4d24qQ4KWBNXTnOHUTd6xN3iQlj6569oqt
   1wsyBFYJQ1JuCCm0XrgCMa+h2/6v4Mi/n1VqvQjmLXe0cvwaf9Xpzi9Ed
   Ef16Bvdm9XpWxkVvkBQzXEXk4b84uze3U1sTHGQ8w/Jh9Auf83tFQC0RG
   g==;
X-CSE-ConnectionGUID: CtgkvDpcTMSFePvhW0iT5g==
X-CSE-MsgGUID: TIiXghIjQIecMYWUwOHQDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="179257939"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="179257939"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:10 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id E0DDAE3E19
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:07 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7D842A7D0E
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0A19C20071A35
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AC3D61A000A;
	Tue, 12 Nov 2024 17:25:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 18/47] libtirpc: upgrade 1.3.5 -> 1.3.6
Date: Tue, 12 Nov 2024 17:24:14 +0800
Message-Id: <1731403483-21399-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10--1.291200-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJwk5p7o69tnZE4FU2ZdQO4nVTWWiNp+v9lRzZAkKRGDZoM2VEm6bO5Yxa
	8wxTbhnuojj6sGnsr6bBkcxB01tpxHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w68xh
	qbbgjd7RNe9F+m09ui3vY04k/+acaWmSZlyCxBAvM67JM2byp5Bc42zctxFTqYPEiHMZK1U5zNK
	FFbJlelTg8TWfup2NOCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207005

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtirpc/{libtirpc_1.3.5.bb => libtirpc_1.3.6.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libtirpc/{libtirpc_1.3.5.bb => libtirpc_1.3.6.bb} (92%)

diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb b/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb
similarity index 92%
rename from meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb
rename to meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb
index d4cd24ec0c..6834e06c25 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb
@@ -12,7 +12,7 @@ PROVIDES = "virtual/librpc"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/libtirpc/files/libtirpc/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
-SRC_URI[sha256sum] = "9b31370e5a38d3391bf37edfa22498e28fe2142467ae6be7a17c9068ec0bf12f"
+SRC_URI[sha256sum] = "bbd26a8f0df5690a62a47f6aa30f797f3ef8d02560d1bc449a83066b5a1d3508"
 
 CVE_STATUS[CVE-2021-46828] = "fixed-version: fixed in 1.3.3rc1 so not present in 1.3.3"
 
-- 
2.34.1


