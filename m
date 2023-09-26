Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57002E7D25C
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 08:26:00 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.14144.1695716754166763812
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 01:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="113051480"
X-IronPort-AV: E=Sophos;i="6.03,177,1694703600"; 
   d="scan'208";a="113051480"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 17:25:52 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 34BC6E8520
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:25:49 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4FEEDD5E89
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:25:48 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5E09A2FC7ABE;
	Tue, 26 Sep 2023 17:25:47 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-subunit: upgrade 1.4.2 -> 1.4.3
Date: Tue, 26 Sep 2023 16:25:22 +0800
Message-Id: <1695716722-9223-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27898.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27898.006
X-TMASE-Result: 10--0.339800-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yZGA/MAGSrEgpxAd6mi1Ga0IiUrQM7y5AiVm
	CsIwjHGe+SSaqR6S8TQQDbmeVdPdBGJZXQNDzktSP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5fZPFUbFYJway8WrBDnbu7yNkakgF4d97TfU1/F+PbM67YaZ2V2aJQ6Yep/pka8JF1N6
	CkrtCdcW9Bm5Cn/KkMKI5/U0OcIj6tYv/FAmebjp4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyHEqm
	8QYBtMOinkxMOk66aJZNK6W5oKoP0kx+Xmr4VxES8s+rhTQkSG2RQsXYMjOWpzBhzujhjqMqDAN
	S/dxf19v62w6VlhmB1r8dDWEHExDgr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 08:26:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188230

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Rely on external copy of iso8601

Changelog:
==========
* Subunit now has a dependency on an external iso8601
  module rather than shipping its own.
* Drop various compatibility wrappers for Python < 3.6.
* Fix "subunit-filter --fixup-expected-failures"
  on Python 3.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-subunit_1.4.2.bb => python3-subunit_1.4.3.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-subunit_1.4.2.bb => python3-subunit_1.4.3.bb} (74%)

diff --git a/meta/recipes-devtools/python/python3-subunit_1.4.2.bb b/meta/recipes-devtools/python/python3-subunit_1.4.3.bb
similarity index 74%
rename from meta/recipes-devtools/python/python3-subunit_1.4.2.bb
rename to meta/recipes-devtools/python/python3-subunit_1.4.3.bb
index a018ef1dc8..9b231bbe37 100644
--- a/meta/recipes-devtools/python/python3-subunit_1.4.2.bb
+++ b/meta/recipes-devtools/python/python3-subunit_1.4.3.bb
@@ -2,11 +2,11 @@ SUMMARY = "Python implementation of subunit test streaming protocol"
 HOMEPAGE = "https://pypi.org/project/python-subunit/"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.rst;beginline=1;endline=20;md5=909c08e291647fd985fbe5d9836d51b6"
+LIC_FILES_CHKSUM = "file://README.rst;beginline=1;endline=20;md5=571e2d702e247b9d8a7745b3b54315ed"
 
 PYPI_PACKAGE = "python-subunit"
 
-SRC_URI[sha256sum] = "2988d324d55ec35dd037e502e3f74ac38f4e457bd44ee0edf5e898f7ee1134d4"
+SRC_URI[sha256sum] = "9ee76092d5b0a02055219763f1aa9e28835f2dd722f03ea9fd8d68e4066b3378"
 
 inherit pypi setuptools3
 
-- 
2.34.1


