Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C98BFCDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 09:04:58 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.34394.1697187894487602054
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 02:04:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="124033483"
X-IronPort-AV: E=Sophos;i="6.03,221,1694703600"; 
   d="scan'208";a="124033483"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 18:04:52 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 77751D29E5
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 18:04:50 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A2AF1D9A84
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 18:04:49 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id EEB90200501A4;
	Fri, 13 Oct 2023 18:04:48 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-cffi: upgrade 1.15.1 -> 1.16.0
Date: Fri, 13 Oct 2023 17:04:32 +0800
Message-Id: <1697187872-4568-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27932.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27932.006
X-TMASE-Result: 10-0.274400-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxCz3ENTRseZm40
	Np5pt6+ooIH9X1FkYDyVNwMoQ1vTAj9AwXUHipV9DDzmS9l9fYrS670hgVDrDpTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q25x7uAXGEprQFA6pSxaDHmgW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipcmx35GUmMCSN1TlWJ28pZHHAfpeTKEoE5YLdd
	ZK6pNqiq4eRZTQxxSt99yqBg0/P+9quvzLVR6IqB6rHqTdOfi6ztQUdDjKS0P6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 09:04:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189048

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Add support for Python 3.12.
-Drop support for end-of-life Python versions (2.7, 3.6, 3.7).
-Add support for PEP517 builds; setuptools is now a required build dependency.
-Declare python_requires metadata for Python 3.8+. This allows unsupported Pythons
 to continue using previously released sdists and wheels.
-Move project source under src/; a more standard layout that also enables CI to more easily
 catch packaging errors.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cffi_1.15.1.bb => python3-cffi_1.16.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cffi_1.15.1.bb => python3-cffi_1.16.0.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-cffi_1.15.1.bb b/meta/recipes-devtools/python/python3-cffi_1.16.0.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-cffi_1.15.1.bb
rename to meta/recipes-devtools/python/python3-cffi_1.16.0.bb
index daa290a54e..a351029ef2 100644
--- a/meta/recipes-devtools/python/python3-cffi_1.15.1.bb
+++ b/meta/recipes-devtools/python/python3-cffi_1.16.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
 DEPENDS += "libffi ${PYTHON_PN}-pycparser"
 
-SRC_URI[sha256sum] = "d400bfb9a37b1351253cb402671cea7e89bdecc294e8016a707f6d1d8ac934f9"
+SRC_URI[sha256sum] = "bcb3ef43e58665bbda2fb198698fcae6776483e0c4a631aa5647806c25e02cc0"
 
 inherit pypi setuptools3
 
-- 
2.34.1


