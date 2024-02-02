Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B71C48286
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 00:21:04 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.11798.1706833258773319426
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 16:20:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ixj7Kbm1;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706833258; x=1738369258;
  h=from:to:cc:subject:date:message-id;
  bh=if62c1p2++zBC4pW8t4cJpK9vxtfllGCdR0MTXNojLg=;
  b=Ixj7Kbm1HJ/86i7zv5xnjn3iQywB9wxPFhYI/4/4F5Kvpu9PyMIxHbtm
   qqGlv054nI92gqGQdEl/25oxwq6O6nS0SNTIHqb+eZkY3cukRowj8clkW
   j7OHfE169oH6gqpL6dv1nmmPiK66g9c7l/G2wXDiVSrChCEs16XpNcTqV
   8Ik/gosq2r6QIEOhzRa4LWywaBOT/ejWPe6gT7apYRRlZYwWhgXQRnebE
   hSdsLpKQLx7/s52JJvzBSMXcYNuez42cfKpgeBCBQG4yOZ/h5olngws9f
   RxI9twaw3Jqmmrhfvneq3bD1Kif6I4EbFkiWfaEyGzmCIxtnsyH7TBQ7i
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="148362970"
X-IronPort-AV: E=Sophos;i="6.05,236,1701097200"; 
   d="scan'208";a="148362970"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 09:20:55 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 57EEBD6273
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 09:20:54 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 876B3257264
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 09:20:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1534F2008FF88
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 09:20:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 97C0E1A009A;
	Fri,  2 Feb 2024 08:20:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-psutil: upgrade 5.9.7 -> 5.9.8
Date: Fri,  2 Feb 2024 08:20:28 +0800
Message-Id: <1706833228-20040-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28158.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28158.003
X-TMASE-Result: 10-3.825100-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZnVTWWiNp+v/W9E3d/hIMTwIZ++dWnH7bnpt
	r8PnHpyni8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFLZ+KpC14YDSiZu1iANL5E4Gau
	j0LLw2yfeJnbCuho8MXZvX8Sip9409Gn98nCPxCsTFDPIskLe+cFn+Vk7DTqo8R8qROalaZux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 00:21:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194771

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-psutil_5.9.7.bb => python3-psutil_5.9.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-psutil_5.9.7.bb => python3-psutil_5.9.8.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-psutil_5.9.7.bb b/meta/recipes-devtools/python/python3-psutil_5.9.8.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-psutil_5.9.7.bb
rename to meta/recipes-devtools/python/python3-psutil_5.9.8.bb
index 9a8c3e11f8..f07f1131a6 100644
--- a/meta/recipes-devtools/python/python3-psutil_5.9.7.bb
+++ b/meta/recipes-devtools/python/python3-psutil_5.9.8.bb
@@ -3,7 +3,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a9c72113a843d0d732a0ac1c200d81b1"
 HOMEPAGE = "https://pypi.org/project/psutil/"
 
-SRC_URI[sha256sum] = "3f02134e82cfb5d089fddf20bb2e03fd5cd52395321d1c8458a9e58500ff417c"
+SRC_URI[sha256sum] = "6be126e3225486dff286a8fb9a06246a5253f4c7c53b475ea5f5ac934e64194c"
 
 inherit pypi setuptools3
 
-- 
2.34.1


