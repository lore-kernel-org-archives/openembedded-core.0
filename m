Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E87C47DB3
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 03:28:48 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.7622.1706758121606768956
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 19:28:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pmm3zjkE;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706758121; x=1738294121;
  h=from:to:cc:subject:date:message-id;
  bh=eDIrEyo5lMglAoeR58BV4rgHHPqK1ozHjQWbhR94CIQ=;
  b=pmm3zjkEoVsD65SALj12wJAZoenBKdpRlO3eUiCMnzcuNqM8EAfO/KSm
   IUNY3qUxutCigF1dcumcGX5ROLWGeJfHZFh37mJk2ZqkuEwKkdkmiz0T0
   /79OEU2ga9qOsRN88r2M9puK+3ZcPsBzsOkue31s2Ay7YDZrhzVmGfJv5
   pYf2qFJtnI4GSVT7/7MyE3Bpjm0wOC1/82GIiobriGcbYavxZb3DALH8S
   kkHaKxc9s63pyggqtc450o1mARkIDetNLV8pk9Pn/SQ32QYiMtp6I18we
   mr42s6G8jwHLvSxAa02yT55jeVhggfVODXuxkDdZy1XaLvQo4tnQA+bBr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="135995749"
X-IronPort-AV: E=Sophos;i="6.05,234,1701097200"; 
   d="scan'208";a="135995749"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 12:28:38 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id BB49A229911
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 12:28:36 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0D524F34C4
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 12:28:36 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F30D20097E5C
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 12:28:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0FBF81A006A;
	Thu,  1 Feb 2024 11:28:35 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] iso-codes: upgrade 4.15.0 -> 4.16.0
Date: Thu,  1 Feb 2024 11:22:43 +0800
Message-Id: <1706757763-11505-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28152.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28152.007
X-TMASE-Result: 10-2.900400-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZSXIxnjwYrBSC7C2rJeUToWFHVj+6F+rICaL
	QXTkWrnFbJcQH3furV3k48PxckV+kHxPMjOKY7A/+HHE8LDNSg8RB0bsfrpPIcSqbxBgG0w75iP
	MvG8Jys0wdBumheboy++3LUEKwIX7/7ghANZnLS3wgG4io7rtkVTeYXpXcnw8oRApgUd7phCGLI
	p3LJoMckgWiV1fhYuqCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 03:28:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194553

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../iso-codes/{iso-codes_4.15.0.bb => iso-codes_4.16.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/iso-codes/{iso-codes_4.15.0.bb => iso-codes_4.16.0.bb} (94%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb b/meta/recipes-support/iso-codes/iso-codes_4.16.0.bb
similarity index 94%
rename from meta/recipes-support/iso-codes/iso-codes_4.15.0.bb
rename to meta/recipes-support/iso-codes/iso-codes_4.16.0.bb
index 6ae6fdf8cb..f33cce1a9d 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.16.0.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=https;branch=main;"
-SRCREV = "69ba16daef3c5c5e3c18f2d919e25296a4b946be"
+SRCREV = "c2fcaadc832ed9f858950a43994973442d85ef4f"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.34.1


