Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95097C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 07:11:13 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.37006.1698995472704030601
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 00:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="138277099"
X-IronPort-AV: E=Sophos;i="6.03,273,1694703600"; 
   d="scan'208";a="138277099"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 16:11:10 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4657ADF06F
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:11:08 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 824CED88CF
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:11:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 656E886346;
	Fri,  3 Nov 2023 16:11:06 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libdnf: upgrade 0.71.0 -> 0.72.0
Date: Fri,  3 Nov 2023 15:10:30 +0800
Message-Id: <1698995430-30154-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27974.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27974.005
X-TMASE-Result: 10-0.504900-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ0nRdgVDNL3Q8rYO92b9NmSHCU59h5KrGxZOddVMlEZw9r3iN/4cJv1+0
	KsXaxWz7i8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFIAh8rd2nOOrKmEnjku3j3Uqbu
	619mmSEVn1jC6+2o5DIxDMq/oNtWXkdlE23tMDu9taBb69jdqLhYpbnmO61w8KdDj9G+ZhiOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 07:11:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190111

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libdnf/{libdnf_0.71.0.bb => libdnf_0.72.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.71.0.bb => libdnf_0.72.0.bb} (97%)

diff --git a/meta/recipes-devtools/libdnf/libdnf_0.71.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb
similarity index 97%
rename from meta/recipes-devtools/libdnf/libdnf_0.71.0.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.72.0.bb
index 396a6664bc..d58ad0353f 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.71.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;p
            file://0001-drop-FindPythonInstDir.cmake.patch \
            "
 
-SRCREV = "39098f39806becdc87cf93e03a49ae89a33e7ede"
+SRCREV = "908dba63c9e18c86a2d81166ce7523559e65338c"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


