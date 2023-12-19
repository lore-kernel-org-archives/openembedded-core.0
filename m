Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E49C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 09:42:28 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.8779.1702978940637468864
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 01:42:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="123234242"
X-IronPort-AV: E=Sophos;i="6.04,287,1695654000"; 
   d="scan'208";a="123234242"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 18:42:18 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6B37FD64A0
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:42:16 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A458ABF3C8
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:42:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 37272202CA3C1
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:42:15 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D36881A006F;
	Tue, 19 Dec 2023 17:42:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-importlib-metadata: upgrade 6.8.0 -> 7.0.0
Date: Tue, 19 Dec 2023 17:42:09 +0800
Message-Id: <1702978929-8125-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28066.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28066.006
X-TMASE-Result: 10-1.018300-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrMVx/3ZYby7/n3ZLCt3rRSUQY
	OtZEiuA4Frsxch4D5W5JiK3ymB2wQdDCM5b2Q+i0P0HVIeixJdA3l2plwgrtWCD1HdXyqDnEsrf
	Z8eErR+CESVL06fzYOxP6uxGv2vDH5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2i5u
	/VvsFaHXpy57T0e/unRrHbLt1XDNOGLCHTbbVm25Vf9wvFvUHjgUeAshzQlSnkRAQtWWpTfYZAo
	cDhdLhNGZ1zwLI+jvGVwwl+5Hd7F/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 09:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192712

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Removed EntryPoint access by numeric index
-Added Distribution.origin supplying the direct_url.json in a SimpleNamespace.
-Added diagnose script.
-Added EntryPoints.__repr__

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ib-metadata_6.8.0.bb => python3-importlib-metadata_7.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_6.8.0.bb => python3-importlib-metadata_7.0.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb b/meta/recipes-devtools/python/python3-importlib-metadata_7.0.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_7.0.0.bb
index b8dd4bb701..2f4f5b8728 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_7.0.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "dbace7892d8c0c4ac1ad096662232f831d4e64f4c4545bd53016a3e9d4654743"
+SRC_URI[sha256sum] = "7fc841f8b8332803464e5dc1c63a2e59121f46ca186c0e2e182e80bf8c1319f7"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.34.1


