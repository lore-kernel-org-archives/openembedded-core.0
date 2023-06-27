Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88371C001DF
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:19:45 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.7579.1687850375226719701
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:19:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="122336911"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="122336911"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:19:35 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 460BDD29E1
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:33 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 734ECD501E
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:32 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0067E6C833;
	Tue, 27 Jun 2023 16:19:31 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-importlib-metadata: upgrade 6.6.0 -> 6.7.0
Date: Tue, 27 Jun 2023 15:17:19 +0800
Message-Id: <1687850250-20040-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
References: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27716.005
X-TMASE-Result: 10--1.468900-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr2FA7wK9mP9fx/es4TBfOp9nq
	JQncEKKr7wJL2+8U4LH+kfjo+nx5BG0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl76S7Hfu9IUxA6J
	UWkXudIl/AGK4wInBMnk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5wWF
	AtgVIn8CLv7hwgZTH84U7K4+HxiHyNvMHQWpjBY/HE/ZvNmWk+vKTYRC7n0NmdFckJ91TyoXTpN
	QhKOXaIb7/MoHjLq+6CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183461

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
#453: When inferring top-level names that are importable for distributions in package_distributions, now symlinks to other directories are honored.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ib-metadata_6.6.0.bb => python3-importlib-metadata_6.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_6.6.0.bb => python3-importlib-metadata_6.7.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_6.6.0.bb b/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_6.6.0.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb
index 34bc55b0e1..5ad7ae81ad 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_6.6.0.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "92501cdf9cc66ebd3e612f1b4f0c0765dfa42f0fa38ffb319b6bd84dd675d705"
+SRC_URI[sha256sum] = "1aaf550d4f73e5d6783e7acb77aec43d49da8017410afae93822cc9cca98c4d4"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.34.1


