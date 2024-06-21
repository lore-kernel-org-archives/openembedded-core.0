Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5EF6C30659
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 02:17:25 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.64032.1718936238182412693
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 19:17:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ng5pmH4o;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718936239; x=1750472239;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=DzuUC3YDs545kvbhyfuhLTzjVHyAU5s4PQgcESCM4v0=;
  b=Ng5pmH4oIH9UF7v0LjvG4/coNjddm3/DOLCMLDMxajwqjrPd7HT72mG0
   6e9vd9Kkg3oWfyHImSInvrI4an/zaW8bH4ECdbcMy1brzAaWbA6jjH0kl
   i0euQ6F1ZNVjrLoog9E+FhBX1XqUROmjpzG4A3iLvjc3TKETkt40JpvR5
   PUc3R9GP7Lc5vYOiM5X7qCsGAJ8ih5+Uc6ljaOfhqeqOav1PGBr70poqj
   k7x0+3SXabODg99p63ZmuVsojr2M790j9dVS6/t0Dl9Qsjbt5hg3KwEQ9
   JMlHLLxNBU4Qqh5COBKyv5N1S0Cos7bo7MMWWM0FM0gUyEsMWR//PLSgm
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="164424719"
X-IronPort-AV: E=Sophos;i="6.08,253,1712588400"; 
   d="scan'208";a="164424719"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 11:17:16 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C149DCA1EC
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:13 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C54FD73C9
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8DEB0E4A9D
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:12 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 401B41A0002;
	Fri, 21 Jun 2024 10:17:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/22] git: upgrade 2.45.1 -> 2.45.2
Date: Fri, 21 Jun 2024 10:16:34 +0800
Message-Id: <1718936206-8080-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
References: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28468.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28468.003
X-TMASE-Result: 10-3.035200-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yfrNPkGWAHDfA81piVnI+HUQS4VCDDktpwSD
	CUdk18WiYBvXPbiTXr6VpEc4XqysTVaJYTHKc+QOPKN38CLPK0FSuvtBzlaEqLs3Yh2IOCYzKYU
	5gkls+qlCNUJM5cx7jcYoh/qEF/tVATh1ufKMwlpO5y1KmK5bJRSLgSFq3Tnj31GU/N5W5BBb6/
	SbnJwGrwElUk6B2fEvgDLqnrRlXrZ8nn9tnqel2MZW5ai5WKlyV2atRArgHLtYZKBTDp+VQwY4t
	dETfCvnDGj/HqKMGlqnT+Uw5ahiLUfbpby0EBV77qZ+1Q1pXBJBSmuFZ02vfqG//xzOKxNZ/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 02:17:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200974

From: Wang Mingyu <wangmy@fujitsu.com>

Changeglog:
============
- send-email: drop FakeTerm hack
- send-email: avoid creating more than one Term::ReadLine object
- ci: drop mention of BREW_INSTALL_PACKAGES variable
- ci: avoid bare "gcc" for osx-gcc job
- ci: stop installing "gcc-13" for osx-gcc
- hook: plug a new memory leak
- init: use the correct path of the templates directory again
- Revert "core.hooksPath: add some protection while cloning"
- tests: verify that `clone -c core.hooksPath=/dev/null` works again
- clone: drop the protections where hooks aren't run
- Revert "Add a helper function to compare file contents"
- Revert "fsck: warn about symlink pointing inside a gitdir"

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/git/{git_2.45.1.bb => git_2.45.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.45.1.bb => git_2.45.2.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.45.1.bb b/meta/recipes-devtools/git/git_2.45.2.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.45.1.bb
rename to meta/recipes-devtools/git/git_2.45.2.bb
index d1b3e6ad40..6393c976e6 100644
--- a/meta/recipes-devtools/git/git_2.45.1.bb
+++ b/meta/recipes-devtools/git/git_2.45.2.bb
@@ -164,4 +164,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "10acb581993061e616be9c5674469335922025a666318e0748cb8306079fef24"
+SRC_URI[tarball.sha256sum] = "98b26090ed667099a3691b93698d1e213e1ded73d36a2fde7e9125fce28ba234"
-- 
2.34.1


