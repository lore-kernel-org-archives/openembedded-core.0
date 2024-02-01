Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DAABC47DDB
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 05:03:49 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.8862.1706763821783034325
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 21:03:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZrNmRwYW;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706763821; x=1738299821;
  h=from:to:cc:subject:date:message-id;
  bh=OGYlnmkEuwOSVN5MF8QahhNcHESEAIeBi/mEtwz4zDc=;
  b=ZrNmRwYWdBOk9hiZEo2tTy9/bzJTBDJuo549xJ5/SjiMPX1WuRVYmUv2
   K2FhsStBGjUr7USKwmCZcLYx8GV9eqPhs8fOHW/pGsauoslXkJaWwlhgY
   gZPjSNLFbpjz9zBkEh/pbhN+iK4yN3YzSSK8tle8J2pC5DT/IjMFCHfw1
   oMZCwq8GtFH+Nhx60XKil+63wqnH7mpXSGjj3K29VHT8UKdRAgmjIZgKp
   8kVK5VRRiVQFwCTwRJYKSVz7lyjOeoSSq1TDgBBYa+CB5XLZY/jMxEatx
   dPf1zNNB6tKCE7RLZkR2hkUpCEJ3ICTrad2hPXxxX15d/dPljpOiew7gV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="127308868"
X-IronPort-AV: E=Sophos;i="6.05,234,1701097200"; 
   d="scan'208";a="127308868"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 14:03:38 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D628C176C9C
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:03:36 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1514FC7267
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:03:36 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8ED2865FEA
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:03:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0EF481A006A;
	Thu,  1 Feb 2024 13:03:35 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] createrepo-c: upgrade 1.0.2 -> 1.0.3
Date: Thu,  1 Feb 2024 12:26:03 +0800
Message-Id: <1706761563-12060-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28156.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28156.000
X-TMASE-Result: 10--0.267000-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ0nRdgVDNL3Q8rYO92b9Nm3QqJN4m15UFOdKnCeVjjIZsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62SrlLSgMFnafxHAluEqHmaYQ4SKKLhMecp3D9CeYnReXeWz6
	N9N01a/Gnnkt/VyzMXyIZtPF4TeivWNe2bJHaDIKY/yvp0qtnbS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 05:03:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194560

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{createrepo-c_1.0.2.bb => createrepo-c_1.0.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_1.0.2.bb => createrepo-c_1.0.3.bb} (96%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.2.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.3.bb
similarity index 96%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_1.0.2.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_1.0.3.bb
index 49d29bcfb4..cfd406650c 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.2.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.3.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;p
            file://0001-include-rpm-rpmstring.h.patch \
            "
 
-SRCREV = "e87636334a3bc5d6ddfdb6c0b34042e96987efb1"
+SRCREV = "f5b5cb3d7389da979b9f05d72ab13979a8c2dccf"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


