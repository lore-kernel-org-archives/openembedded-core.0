Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14002C47422
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 09:27:05 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.74527.1705310821280419982
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 01:27:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="146154366"
X-IronPort-AV: E=Sophos;i="6.04,196,1695654000"; 
   d="scan'208";a="146154366"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 18:27:00 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 385A67FBAC
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:26:57 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2C56DD4BC0
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:26:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id BEDF16B4F5
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:26:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 588321A0070;
	Mon, 15 Jan 2024 17:26:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-wcwidth: upgrade 0.2.12 -> 0.2.13
Date: Mon, 15 Jan 2024 17:26:40 +0800
Message-Id: <1705310800-24766-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28120.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28120.006
X-TMASE-Result: 10-2.273700-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrAGI6Im+Cxj+U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v8QhNjZQYyI3Cl6ppmExqcYlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSz831tWdP/r3Loqd
	tqo8cQC5hrrVlHjBtOOjTzMtCurC/pkeNHERORd5BjRUtt0lWeJqedV4AOfOrluSVT+ob7jUsb4
	Fz/2x8fiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 09:27:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193662

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Bugfix zero-width support for Hangul Jamo

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-wcwidth_0.2.12.bb => python3-wcwidth_0.2.13.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wcwidth_0.2.12.bb => python3-wcwidth_0.2.13.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.2.12.bb b/meta/recipes-devtools/python/python3-wcwidth_0.2.13.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-wcwidth_0.2.12.bb
rename to meta/recipes-devtools/python/python3-wcwidth_0.2.13.bb
index ae845a39a7..320a34a5f5 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.2.12.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.2.13.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
 
-SRC_URI[sha256sum] = "f01c104efdf57971bcb756f054dd58ddec5204dd15fa31d6503ea57947d97c02"
+SRC_URI[sha256sum] = "72ea0c06399eb286d978fdedb6923a9eb47e1c486ce63e9b4e64fc18303972b5"
 
 inherit pypi setuptools3 ptest
 
-- 
2.34.1


