Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C494C7EE2E
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 09:17:03 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.26268.1750065413647293025
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 02:16:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Lng8xE5s;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750065413; x=1781601413;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0Uj3TXfrA7Ke5+1WWNE4RXL02HNCRYz9iaAQoFg6hk8=;
  b=Lng8xE5s3B/QW8cG51lbdTROAtxfKXGvNJLc2VgzrgjgjWTRMR0Kogdh
   VST498HsI9juhQSJdsIQYmgIIb8IfJD690iWB+0rfQkPiZvcIcGmLwhf0
   BhhIaQfp7WDlpe51zUv3qraGPQA5AHTRRBqilxtdpLx5uGy5Ceqd9K/+f
   HQcwE3h1MSYjdbAye6fhQ7PRNPJ6agsrpOzSjiD29m/9iZzxwXLCmiq+s
   kVDQEyMz5S1gClmuCsgFrF0mWIXjLtW4y8V27/IgVsKnszpPU/g14YMEc
   uo0eqP5yKgUL3irAutOD5wznouWERLMUGJ2F+cUTNNRMbXlY6lSl+jzXn
   g==;
X-CSE-ConnectionGUID: W+PTabygRyuQ6FHJfUblEg==
X-CSE-MsgGUID: BdXAKjiGQbmiZopt4+766w==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="202102157"
X-IronPort-AV: E=Sophos;i="6.16,240,1744038000"; 
   d="scan'208";a="202102157"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:16:51 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7C1A0D4C24
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 18DFFBF3C1
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:47 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 01DF51A000B;
	Mon, 16 Jun 2025 17:16:45 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/24] debianutils: upgrade 5.22 -> 5.23.1
Date: Mon, 16 Jun 2025 17:16:19 +0800
Message-ID: <20250616091643.918-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218775

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../debianutils/{debianutils_5.22.bb => debianutils_5.23.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/debianutils/{debianutils_5.22.bb => debianutils_5.23.1.bb} (97%)

diff --git a/meta/recipes-support/debianutils/debianutils_5.22.bb b/meta/recipes-support/debianutils/debianutils_5.23.1.bb
similarity index 97%
rename from meta/recipes-support/debianutils/debianutils_5.22.bb
rename to meta/recipes-support/debianutils/debianutils_5.23.1.bb
index f5deead51a..85955883a4 100644
--- a/meta/recipes-support/debianutils/debianutils_5.22.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.23.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=4b667f30411d21bc8fd7db85d502a8e9
 SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master;tag=debian/${PV} \
            "
 
-SRCREV = "528fac5c7448989f33c54599ae6e4c2b84d41e21"
+SRCREV = "ab0eaf33b783ba578773af2557753d2b973ba5bb"
 
 inherit autotools update-alternatives
 
-- 
2.43.0


