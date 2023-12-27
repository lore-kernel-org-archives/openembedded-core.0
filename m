Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FBE7C46CD2
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 13:11:21 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.101167.1703682680587151651
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 05:11:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="144237033"
X-IronPort-AV: E=Sophos;i="6.04,309,1695654000"; 
   d="scan'208";a="144237033"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 22:11:18 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2B6AACC17A
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 22:11:16 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5A4B4BF4B2
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 22:11:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E7546202DFF70
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 22:11:14 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A5C4C1A006F;
	Wed, 27 Dec 2023 21:11:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-importlib-metadata: upgrade 7.0.0 -> 7.0.1
Date: Wed, 27 Dec 2023 21:10:53 +0800
Message-Id: <1703682653-24236-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28082.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28082.007
X-TMASE-Result: 10-1.599800-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrvHbgjngdqvAtorPLNYrwZOos
	efa/wFTIIL2JuJBXib1527+BW5DJ4KJEq6b8z4ap/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ9v/
	ESKTjvdCESVL06fzYOxP6uxGv2vDH5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2I3a
	djBtsMrKGEsl5uc9wdsWZ/iSyWwb2MH2usmwiTkp9s1cb+fJqXr9vlxITK2U5cTs3O599u4Ul7I
	95qNonIkBk5m0uAFeL4ijnHqOIZPfIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 13:11:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192951

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Corrected the interface for SimplePath to encompass the expectations of
 locate_file and PackagePath.
-Fixed type annotations to allow strings.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ib-metadata_7.0.0.bb => python3-importlib-metadata_7.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_7.0.0.bb => python3-importlib-metadata_7.0.1.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_7.0.0.bb b/meta/recipes-devtools/python/python3-importlib-metadata_7.0.1.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_7.0.0.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_7.0.1.bb
index 2f4f5b8728..c7c6e3b264 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_7.0.0.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_7.0.1.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "7fc841f8b8332803464e5dc1c63a2e59121f46ca186c0e2e182e80bf8c1319f7"
+SRC_URI[sha256sum] = "f238736bb06590ae52ac1fab06a3a9ef1d8dce2b7a35b5ab329371d6c8f5d2cc"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.34.1


