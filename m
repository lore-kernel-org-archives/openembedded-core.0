Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F84C4828D
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 01:04:15 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.12752.1706835853716183786
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 17:04:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jHBASPOG;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706835854; x=1738371854;
  h=from:to:cc:subject:date:message-id;
  bh=5qnChMdPMw0kGO4nDtgYVJLoefw5YUeSJ/UG3vHb0GM=;
  b=jHBASPOGKDYWbJL3ff/19Whr0FZ6igrb5B+U5rjuJ7JeuKWW8bTyV36x
   2RmczN19M+1B7pfE9aZ1pHc67v7Hzy+kNMilL8jqoj4w8WCsGj78921WF
   ymgG5Qh892OVi4g0L8mwbz1FZldr6BFcuNnhLZHebmnJw/dp6AAM6n1/B
   K499tqtrG2HmlH+d5KzvhwBFJOoffdRapwy1WRQrJXsMU0qVw+MLbpLri
   Sk4hWCBffDmUucovx6cbuEk8PCXCPQtqFo8AYDEctQ031yftZ4nl2Zxz3
   OTW9uvVWAzZABjlvuFyfk4YR+2PwlUKy7nJjfF9GzI3q/oDU+CkExxyKa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="147563017"
X-IronPort-AV: E=Sophos;i="6.05,236,1701097200"; 
   d="scan'208";a="147563017"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 10:04:11 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C3BAFF2E83
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 10:04:08 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E35A1FDA9E
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 10:04:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 61E772007910A
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 10:04:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D1CEA1A00A0;
	Fri,  2 Feb 2024 09:04:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-sphinxcontrib-serializinghtml: upgrade 1.1.9 -> 1.1.10
Date: Fri,  2 Feb 2024 09:01:52 +0800
Message-Id: <1706835712-20564-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28158.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28158.003
X-TMASE-Result: 10-1.386100-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGOxl9HNVJWpcuce7gFxhKa0BQOqUsWgx5gIZ++dWnH7bnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFBdvGzOGVrF2M9nIwhFkewAt8k
	YG10+CQ1ESBIX4ekPh+iP+46jGCgJErTPx//fH4bTwq89Os3Q7kkUF7Z+hzZBSXbUjiV8Hyux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 01:04:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194779

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...1.1.9.bb => python3-sphinxcontrib-serializinghtml_1.1.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-serializinghtml_1.1.9.bb => python3-sphinxcontrib-serializinghtml_1.1.10.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.9.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.10.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.9.bb
rename to meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.10.bb
index fbf0c3c9b2..b13bc82977 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.9.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.10.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://www.sphinx-doc.org"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=32a84ac5cd3bbd10c4d479233ad588b6"
 
-SRC_URI[sha256sum] = "0c64ff898339e1fac29abd2bf5f11078f3ec413cfe9c046d3120d7ca65530b54"
+SRC_URI[sha256sum] = "93f3f5dc458b91b192fe10c397e324f262cf163d79f3282c158e8436a2c4511f"
 
 PYPI_PACKAGE = "sphinxcontrib-serializinghtml"
 
-- 
2.34.1


