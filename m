Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A417C78859
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:54 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.9328.1727246991269165170
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hhr6YCnA;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246992; x=1758782992;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=9ASJjamKYDx1tcfH+sPNC9Qwye8+NCeUWBTkaSmBPEQ=;
  b=hhr6YCnALIaekNZ8Yxo/ZohqkGgOwgujThN1+9JvPfzI1uyP6j3NWZru
   pIKmI3ovltzHyD1vZPMczQUw6zjEn1wQiwSydg3/GKXfa48Hz2SwPm9Yb
   Hqpem0d6q+DrWtu6sMHWQ56UL2s2NMSJNdQCmP03MWgK8oaECqN70tEmo
   C8zEYfJrdP1KNie912+GRpQoWrQEeqdae6GjDYR4fhJzzojw4MpYJSS45
   jk77Bx6hzpPODq92adJfpbnroHRNLG/dLFoC60loRehQYUICNWWjsIg7+
   4BPsnJ1sitb04qdGhD61/hvZtpWn1S4GbmsY7L8wdhkTMBwMLpShVYstI
   g==;
X-CSE-ConnectionGUID: 8HI8tYJHTcONwz+vkc+5Ng==
X-CSE-MsgGUID: ueqyODE8TUSsm8kgFDt+kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="162724304"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="162724304"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:49 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E7A8AD8017
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:47 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4986FD8CB6
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D5D7720086326
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 844E11A000A;
	Wed, 25 Sep 2024 14:49:45 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 34/47] python3-pytz: upgrade 2024.1 -> 2024.2
Date: Wed, 25 Sep 2024 14:49:07 +0800
Message-Id: <1727246960-20665-34-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10--1.610000-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrVBDQSDMig9Gen0qBdy7fjOHJ
	isOYwBZyIJcLfZeUug+zBLhPkP1mQZOnCfpxfJrO/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4qI1Q85Nw6wpr78SC5iivxwURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO0JC+
	VZi2gQEe82nnC2lZx70GC7xxUxXm0z+A/+KBPWNcYzJKde0gco49fFIoJD7w29oglupMvuYCQnZ
	5qhV/pa+aIA7mi3/GXDxh4l/A8UDfIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204931

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- IANA 2024b
- Squashed 'tz/' changes from 380c07cef..923e54bae
- Stop testing unavailable and EOL Python 3.5
- Add support for Python 3.13
- Run other jobs if one fails

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pytz_2024.1.bb => python3-pytz_2024.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytz_2024.1.bb => python3-pytz_2024.2.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-pytz_2024.1.bb b/meta/recipes-devtools/python/python3-pytz_2024.2.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-pytz_2024.1.bb
rename to meta/recipes-devtools/python/python3-pytz_2024.2.bb
index 158e800fed..04bd1d632d 100644
--- a/meta/recipes-devtools/python/python3-pytz_2024.1.bb
+++ b/meta/recipes-devtools/python/python3-pytz_2024.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1a67fc46c1b596cce5d21209bbe75999"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI[sha256sum] = "2a29735ea9c18baf14b448846bde5a48030ed267578472d8955cd0e7443a9812"
+SRC_URI[sha256sum] = "2aa355083c50a0f93fa581709deac0c9ad65cca8a9e9beac660adcbd493c798a"
 
 RDEPENDS:${PN}:class-target += "\
     python3-datetime \
-- 
2.34.1


