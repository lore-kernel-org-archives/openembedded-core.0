Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70220C52D6D
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 01:10:31 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.46591.1722215426780874404
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 18:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VFBsilXZ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722215428; x=1753751428;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=+DbtFNM95mr/H/e/4buZuQQ82xIV+el3ULvslj2Klag=;
  b=VFBsilXZB86/ngSqbhrzjwiiCJ/1XZEZ6MGfuZXhcEd+yI7tIGK7iwFa
   VPBWTd1y4G1xbAQYHa9ubPw9PkexwpOzq3YEnsVSVHII7g3Kmq8iAS6oS
   Pf3JJogSv06fwNO1JcH3UIN9RzzUBeHRCdU3bGqACHaFmHhj3OO3FzuR5
   3vApwsFi1zCu7JPNa76N2+8OfChihNbFNgnAjW+45GaSKecUX8ht7y7De
   sqDPuAA8OMx5DzwmrFl11g/xEXywO0tA7dyc7H+LRYxB8at+lIauAKkKH
   U2wuKNbNGNiv4BYDQayemzOqsIsk5L0wC4xP3PJQ2IVVfkX6PklQztH8z
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="168832565"
X-IronPort-AV: E=Sophos;i="6.09,245,1716217200"; 
   d="scan'208";a="168832565"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 10:10:27 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id CC723D9224
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:25 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 11FD3D8B30
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id ABAB2E2060
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:24 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7DADE1A000D;
	Mon, 29 Jul 2024 09:10:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 17/33] python3-pytest-subtests: upgrade 0.13.0 -> 0.13.1
Date: Mon, 29 Jul 2024 09:09:52 +0800
Message-Id: <1722215408-27541-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
References: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28560.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28560.003
X-TMASE-Result: 10-2.361700-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwgGKrU/PL/UzEWY
	FvwCgnnKvAdlz3zxr6YNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt7Oki
	GGidO7I9AYdLFXr37Pnp5g9gYJWDLeBzEkCCpnRmeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNc9U3lWd/SOEhEARn2scklOxdapvDD2TdNhjWwC0ms6d0FKCaUZBNGT5uqUKQinxAgHFf
	cX8ZbvCqTyTIBHw6w/n9BDYincEvDIuZWQlOWCUU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 01:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202583

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fixed bug were an extra test would execute when -x/--exitfirst was used

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...est-subtests_0.13.0.bb => python3-pytest-subtests_0.13.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest-subtests_0.13.0.bb => python3-pytest-subtests_0.13.1.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-pytest-subtests_0.13.0.bb b/meta/recipes-devtools/python/python3-pytest-subtests_0.13.1.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-pytest-subtests_0.13.0.bb
rename to meta/recipes-devtools/python/python3-pytest-subtests_0.13.1.bb
index 7fe074425f..9163f9d3fd 100644
--- a/meta/recipes-devtools/python/python3-pytest-subtests_0.13.0.bb
+++ b/meta/recipes-devtools/python/python3-pytest-subtests_0.13.1.bb
@@ -7,7 +7,7 @@ BUGTRACKER = "https://github.com/pytest-dev/pytest-subtests/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=242b4e17fa287dcf7aef372f6bc3dcb1"
 
-SRC_URI[sha256sum] = "9e02b9d243c0379b02abf3e0887da122bcb2714b021c3608a37f17ce210adce5"
+SRC_URI[sha256sum] = "989e38f0f1c01bc7c6b2e04db7d9fd859db35d77c2c1a430c831a70cbf3fde2d"
 
 PYPI_PACKAGE = "pytest_subtests"
 
-- 
2.34.1


