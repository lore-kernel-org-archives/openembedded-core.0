Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01094C54E5C
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:42 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.8426.1709105619869024469
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Hkug8n/i;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105620; x=1740641620;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=tCBEcNWAkFu/dpbi1gGWYH+Dt9X2emO0MYprzTJ2Ev4=;
  b=Hkug8n/i71ke3PjheObsih5O4+a44uAZ4yejOLGRQNF1kYJrw5M94G9l
   pl4k5LT8PP2PPXFx6BA2RURk6U5rZmnkePC0GsQMiIuhFYpSgZwdKGTVp
   KyBMG3ZBS5A4HVsD68/acKXnuM7qxoCNCGcxXQ59tN71QWVPJH8eCOIir
   DB7+VU59xHa7aaHenO2c/8BMKgshhc+4ZsNr8vCcP/J95bqjJGiL+l7k7
   FFmF8NKl07Suw2tyfw++PvbAtcA0Bh4mt7IXdSQAF2W4Fsvw79jQXIoPR
   V9dJxwalEM8QYq2dC0QYN6OGjveRH0ZsMHN53VnEgngzptHbHCJBhjelU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="129959048"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="129959048"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:38 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C21A8D4800
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:36 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id F25F2D6210
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9582D347BF
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 454021A006A;
	Wed, 28 Feb 2024 15:33:35 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 37/48] python3-pytz: upgrade 2023.4 -> 2024.1
Date: Wed, 28 Feb 2024 15:32:44 +0800
Message-Id: <1709105575-24259-37-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10--0.169200-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0Zs0T0PE+KHuWuLG21Eb4T84Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXJIholbu6ROz8xPl0TTXR+oAzZeWeQVMmkDJ1
	evDeNwS6ZcRRsH3kjVkqAQMgU9K7bKKmr30AaK5driTLknIWKFokUiraKbEjb+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196361

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pytz_2023.4.bb => python3-pytz_2024.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytz_2023.4.bb => python3-pytz_2024.1.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-pytz_2023.4.bb b/meta/recipes-devtools/python/python3-pytz_2024.1.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-pytz_2023.4.bb
rename to meta/recipes-devtools/python/python3-pytz_2024.1.bb
index 78d2b323de..158e800fed 100644
--- a/meta/recipes-devtools/python/python3-pytz_2023.4.bb
+++ b/meta/recipes-devtools/python/python3-pytz_2024.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1a67fc46c1b596cce5d21209bbe75999"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI[sha256sum] = "31d4583c4ed539cd037956140d695e42c033a19e984bfce9964a3f7d59bc2b40"
+SRC_URI[sha256sum] = "2a29735ea9c18baf14b448846bde5a48030ed267578472d8955cd0e7443a9812"
 
 RDEPENDS:${PN}:class-target += "\
     python3-datetime \
-- 
2.34.1


