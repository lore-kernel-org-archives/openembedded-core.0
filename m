Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC9B9C5472F
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 06:52:18 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.12773.1724136731786964808
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 23:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kpERnTUU;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724136731; x=1755672731;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=HCS5Pb1Gq1YZI3HeZpGKIn0UAvi7FcfKzAAm6mN1cGc=;
  b=kpERnTUU+RHuMt06fuvgacjPplxRV5Ns8bdjCd6co1Gp2tATYLpmoYEA
   xjFWc7PpbCRWlipwASfW/Rs35EV267sikZyoHPj/LCN8d47O1KqC7GLju
   f86nKQW3KIxNYEvSAdfiNuCwsseML+ik0ZzBrHgNDWEAdXlCmHC3yjJgy
   Z73wHcQ1sp9fOX9klW5bM4MK1BK8IMt7C8epbiMZDMjkzjgm4LH8pFP0T
   3hpxJG7KC18I8mOo8zlWC1oOHO24NQWrxem2y2arxatMESVM0wWZv3rax
   kpiRScLgCzlN0NzoMJmOAw9KSAwvutEHcqWO1AoJXt/r6IYif6khRM2oP
   Q==;
X-CSE-ConnectionGUID: Zl4XhzK/RdC4vURJzwd+aw==
X-CSE-MsgGUID: Y9DUSfXHSd+DDSVdHO6JGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="171120980"
X-IronPort-AV: E=Sophos;i="6.10,161,1719846000"; 
   d="scan'208";a="171120980"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 15:52:09 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F41BD4240
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:07 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id DD746D8B0F
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:06 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7750FE206E
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:06 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 21BBC1A0002;
	Tue, 20 Aug 2024 14:52:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/24] diffoscope: upgrade 272 -> 276
Date: Tue, 20 Aug 2024 14:51:23 +0800
Message-Id: <1724136703-20023-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
References: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28606.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28606.005
X-TMASE-Result: 10-0.126200-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mr2FA7wK9mP9cK5I+5JVbn7v6R
	OKSr3u5/wElAjDCZMkFJiK3ymB2wQe1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ6Po
	oNqqZn93i8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFPh/YxODlup3htGifY6JT7hxfj
	kMTIdg6/j481Ih9j5V9yIrDkWpgqGdnSndl2XmrV7FCBV6wiEjzB1GoxPkNgr0jl94a6nuLOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 06:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203526

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
* Also catch RuntimeError when importing PyPDF so that PyPDF or,
  crucially, its transitive dependencies do not cause diffoscope to traceback at
  runtime and build time.
* Factor out a method for stripping ANSI escapes.
* Strip ANSI escapes from the output of Procyon.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../diffoscope/{diffoscope_272.bb => diffoscope_276.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_272.bb => diffoscope_276.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_272.bb b/meta/recipes-support/diffoscope/diffoscope_276.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_272.bb
rename to meta/recipes-support/diffoscope/diffoscope_276.bb
index 55e4cc7832..ed8ae52d9a 100644
--- a/meta/recipes-support/diffoscope/diffoscope_272.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_276.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "f8983580efb8f4644719705590a43817d1159d4136836d7ce6dd4fec754c3943"
+SRC_URI[sha256sum] = "094d1f8c312ef9e776247c5f7653b7953dc9c41a037683a1a5937d63a232584a"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.34.1


