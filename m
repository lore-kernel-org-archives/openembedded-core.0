Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52BFFCED606
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 05:49:47 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.9173.1728452976699233839
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 22:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AL7StyRL;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728452976; x=1759988976;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Gqso2jJHTm/qYN6iKQN52qM6S3P/Gxd+GGk3FklWexM=;
  b=AL7StyRLJmiRVokUmYl2pNUHj/haQWT0+YWesSPG10/f9T/MnFTMELpy
   KhnzzVkEIQm2egkfoOUtweU2gE1H73XoeYxrWCc4Cj11DYYmn+R3jJ8mx
   tt8d1X3k4Ir5JGagtY6Rex9h/fK/u0WuggFxF+x2C1uLhT4mm3bYxGo4o
   3+8naqK/rkC5bIjGqI9mEg/jJ4cglHyRfpZ4M848dykFuV5YS8VRYXEXF
   e+2ueyudSHms1TTCFALes8P2q350S6nesGrEyWBAZ1vZjxXkEE+gkBtwE
   aRoyApvwR93yI9Fnfs3p3hfMDAOP2CKuvpLopPTPc1wqSx4Cvum3UgfJK
   w==;
X-CSE-ConnectionGUID: levMk4NaR9OnLFQu0UxV5g==
X-CSE-MsgGUID: T5ArtypCSzm+DDhn54fWJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="163622115"
X-IronPort-AV: E=Sophos;i="6.11,189,1725289200"; 
   d="scan'208";a="163622115"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 14:49:34 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A518DD8012
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:32 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id E2D6BD5412
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C9CC2007AA9F
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1928A1A000A;
	Wed,  9 Oct 2024 13:49:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/26] fribidi: upgrade 1.0.15 -> 1.0.16
Date: Wed,  9 Oct 2024 13:48:53 +0800
Message-Id: <1728452955-25051-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
References: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28718.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28718.005
X-TMASE-Result: 10--3.730600-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSOwpfLMeBwRsCtGYG0znilLxrAG2Om7p2Kxm
	yEhBMOEzi8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFLvNazdL9tqmKs//H3iR12yWce
	Qp276K0iCtev58xaVLyU1cvYsmlBYYIcXUztLBFAvbslwOJys2LZ9+0+B3DTgEpeXQSZl+mOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 05:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205315

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Update Unicode character databases to v16.0.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../fribidi/{fribidi_1.0.15.bb => fribidi_1.0.16.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/fribidi/{fribidi_1.0.15.bb => fribidi_1.0.16.bb} (89%)

diff --git a/meta/recipes-support/fribidi/fribidi_1.0.15.bb b/meta/recipes-support/fribidi/fribidi_1.0.16.bb
similarity index 89%
rename from meta/recipes-support/fribidi/fribidi_1.0.15.bb
rename to meta/recipes-support/fribidi/fribidi_1.0.16.bb
index 14d901a530..9f75446da2 100644
--- a/meta/recipes-support/fribidi/fribidi_1.0.15.bb
+++ b/meta/recipes-support/fribidi/fribidi_1.0.16.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.xz \
            "
-SRC_URI[sha256sum] = "0bbc7ff633bfa208ae32d7e369cf5a7d20d5d2557a0b067c9aa98bcbf9967587"
+SRC_URI[sha256sum] = "1b1cde5b235d40479e91be2f0e88a309e3214c8ab470ec8a2744d82a5a9ea05c"
 
 inherit meson lib_package pkgconfig github-releases
 
-- 
2.34.1


