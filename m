Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CBFDC369AC
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 00:52:16 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.64297.1744073526713324137
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 17:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jozbJQBx;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744073526; x=1775609526;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=bo1th2JIJz4Kgchuob3hTi6oUcSTCKy9yEJ2EiPA6kk=;
  b=jozbJQBx8JhgqYukVYheNcZprm8LTOJwIy9BTivfZYUtPRDhfDb8B6+i
   XyzfQXBTA5ZRN0IckDLTk+bJY49Lk136YNBRfcFrfy2zJVPtIP+EEXv+W
   90fjy7QON7aUAzCJ0UZGJPOnUhbdUy6ytjmdYDG595Q2lbEKdcvBtGlIx
   wTt4y/LmW67xgt7iapfCX3h7Y2EOAzbKaqSrzhAPWPZamwpFBKlQVqVdP
   CU3APrX6uH6OvcxL6QYHxHvC2TMAufJNrVKarvgb1XCOerPy8t5o0hAP3
   wZL8qfzmn4Mp2wwYxPt54APbkEsavs46TiQWYRKDfrW4rkx376RlMzWyr
   A==;
X-CSE-ConnectionGUID: MreXMDHKRBqiYoVsGgyL+A==
X-CSE-MsgGUID: 0BBF5Bp7RqmgRYSp0BwiHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="174619206"
X-IronPort-AV: E=Sophos;i="6.15,196,1739804400"; 
   d="scan'208";a="174619206"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 09:52:00 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id B2D01C226C
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Apr 2025 09:51:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7817BD73AB
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Apr 2025 09:51:58 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6F5701A00AF;
	Tue,  8 Apr 2025 08:51:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/15] libsolv: upgrade 0.7.31 -> 0.7.32
Date: Tue,  8 Apr 2025 08:51:33 +0800
Message-Id: <1744073502-27695-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744073502-27695-1-git-send-email-wangmy@fujitsu.com>
References: <1744073502-27695-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 00:52:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214487

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- build both static and dynamic libraries on new suse distros
- require cmake >= 3.5
- new features:
  * support the apk package and repository format (both v2 and v3)
  * new dataiterator_final_{repo,solvable} functions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsolv/{libsolv_0.7.31.bb => libsolv_0.7.32.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.31.bb => libsolv_0.7.32.bb} (95%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.31.bb b/meta/recipes-extended/libsolv/libsolv_0.7.32.bb
similarity index 95%
rename from meta/recipes-extended/libsolv/libsolv_0.7.31.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.32.bb
index b395ff972d..419036458a 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.31.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.32.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https \
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
 "
 
-SRCREV = "95aef5cc57d0f51782e55b6903b30ec93afbfa15"
+SRCREV = "95f64952e3270deb6be30ae4b786cae5c114c807"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


