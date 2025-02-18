Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C358DC3DA4A
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 07:41:38 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.14684.1739864490887324136
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 23:41:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pIwn4hG1;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739864495; x=1771400495;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=93m9OWSKitY0E4mmvdu+GorFF8ariky3xmXmbojiKdc=;
  b=pIwn4hG1T2LGK1ctvN6FpUZBDJfwkTSk0jkx+/iMCuz3Kg6eiJgXhnsi
   9y/I1FYt4IYz/JmTxdJ7/me/Pdj+W65XVX6tM3t2a6GFGMZK7hgFXFyAu
   wJv0Aafx10yZPaIvhk16AfqTZD1yF8GQpBRm5ILTKnjBi4BPi6a6EixPL
   R+2XvG54Fdu72PxS2HGqievRdK2SzweahQAT/G/bncJVI1fRDtrTfCCT4
   swmQg/fbLOVvJD2y0+LI06m+HTkI5XSj8T57mBTe3Tbl1wLMwpyE+YFdV
   FCkQCbWdzKjqX5SEGrsN0M4XaI2seOOVU16BnR+EWmgSBbNSPYDkbSikQ
   A==;
X-CSE-ConnectionGUID: kPPk1ssRR4q1Ku0GiGdgwA==
X-CSE-MsgGUID: NqMubTb1SmGngYjhbZBd6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="189521034"
X-IronPort-AV: E=Sophos;i="6.13,295,1732546800"; 
   d="scan'208";a="189521034"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:41:33 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1D45DD5015
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D12FFD50AA
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:30 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 748081A000B;
	Tue, 18 Feb 2025 15:41:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 32/32] xz: upgrade 5.6.3 -> 5.6.4
Date: Tue, 18 Feb 2025 15:39:35 +0800
Message-Id: <1739864375-21394-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211594

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/xz/{xz_5.6.3.bb => xz_5.6.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/xz/{xz_5.6.3.bb => xz_5.6.4.bb} (97%)

diff --git a/meta/recipes-extended/xz/xz_5.6.3.bb b/meta/recipes-extended/xz/xz_5.6.4.bb
similarity index 97%
rename from meta/recipes-extended/xz/xz_5.6.3.bb
rename to meta/recipes-extended/xz/xz_5.6.4.bb
index 67070850ab..e48f4dbd7f 100644
--- a/meta/recipes-extended/xz/xz_5.6.3.bb
+++ b/meta/recipes-extended/xz/xz_5.6.4.bb
@@ -28,7 +28,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c02de712b028a5cc7e22472e8f2b3db1 \
 SRC_URI = "https://github.com/tukaani-project/xz/releases/download/v${PV}/xz-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "b1d45295d3f71f25a4c9101bd7c8d16cb56348bbef3bbc738da0351e17c73317"
+SRC_URI[sha256sum] = "269e3f2e512cbd3314849982014dc199a7b2148cf5c91cedc6db629acdf5e09b"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 UPSTREAM_CHECK_URI = "https://github.com/tukaani-project/xz/releases/"
 
-- 
2.43.0


