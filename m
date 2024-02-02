Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DDAAC48286
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 00:58:05 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.12562.1706835482268489689
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 16:58:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VjC4aEy6;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706835482; x=1738371482;
  h=from:to:cc:subject:date:message-id;
  bh=z0KTAWfeCFCeLXQGetOPc85OcGlf5htwExfBSvLmXEA=;
  b=VjC4aEy6fCTZNwAftAYS40vcLpOJ0yDY40TDXHcG9HzKCu5+WQmtA9+H
   8BqlnRgqFXKTCccI7JynYmo8ePyakoTLTVuH1umieSpV2phCmu1YArBRR
   wfJhJ/BLkb4ldJu1CmZWT6y/Znd3PjRbf1Rd17/ybfy8eCg0NgtnVlK11
   9sJJEf/KUP636/AWUiv+7bFDOi+OoxnHQItu3wdM8qpLzPQShTbt+jozj
   L+AI6iGCpJ1vpARMM/oBxBjvrtQUTaRKKe4VeDcMdPxYiuYzX017m9E41
   nIuT+2VVHqL90vZs8tDQZ5a7WAxBgEBETfDla+7kJDst8SvcRHnyqMGKR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="127482785"
X-IronPort-AV: E=Sophos;i="6.05,236,1701097200"; 
   d="scan'208";a="127482785"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 09:58:00 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id BF0D9CA24F
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 09:57:57 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id F3CC7417BC
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 09:57:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8528870B38
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 09:57:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F0C261A009A;
	Fri,  2 Feb 2024 08:57:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-sphinxcontrib-devhelp: upgrade 1.0.5 -> 1.0.6
Date: Fri,  2 Feb 2024 08:53:12 +0800
Message-Id: <1706835192-20396-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28158.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28158.003
X-TMASE-Result: 10-1.386100-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGOxl9HNVJWpcuce7gFxhKa0BQOqUsWgx5gIZ++dWnH7bnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFGp/tiztWKRAyRQ15i3gNopFyB
	R8xv+MnjYwfkVhAdZ7njaYSWC1WG79vNwmUmWFkOxlWB6gqyQNroTYKY2kbg8sec/au93Oqux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 00:58:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194776

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-devhelp_1.0.5.bb => python3-sphinxcontrib-devhelp_1.0.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-devhelp_1.0.5.bb => python3-sphinxcontrib-devhelp_1.0.6.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.5.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.6.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.5.bb
rename to meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.6.bb
index 47934bd6f5..dd7ba3dc95 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.5.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://www.sphinx-doc.org"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fd30d9972a142c857a80c9f312e92b93"
 
-SRC_URI[sha256sum] = "63b41e0d38207ca40ebbeabcf4d8e51f76c03e78cd61abe118cf4435c73d4212"
+SRC_URI[sha256sum] = "9893fd3f90506bc4b97bdb977ceb8fbd823989f4316b28c3841ec128544372d3"
 
 PYPI_PACKAGE = "sphinxcontrib-devhelp"
 
-- 
2.34.1


