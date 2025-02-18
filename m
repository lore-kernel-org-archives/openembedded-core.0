Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC3CC021B0
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 07:41:38 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.14686.1739864494034936429
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 23:41:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oP50xfpp;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739864494; x=1771400494;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ZPvYTOUdLLhWsX5qUSdBZiFImu7KZ2jhCK6LQLvm4RA=;
  b=oP50xfppJgiyCeWG/TyfApMaBPmWD+Hdi1MEcrgPLt463OwqdxDor0zz
   9bdqiAmKVU/mpG+V25wsh528k66WYdcjZP7QRvlbBj0uxyI3QQoBGuvjM
   jmLzUXEDs2ggMWGm8f2QDWRtaEhg1sL73kxTao5O+iwPjQ37phKLvuqI0
   WvkpZtz+wgS6nkaTeHWkKa9tjs5ecUe/d1E7npeyKllRBkr/t5oKtYYMa
   a9lHl2DXYueAuVpfdgsfbCMyqV4XlOpn5Vp8gpH/HsDa1BAp8yvaCi6/8
   O5Kp3n0htxfRbvoYT4IdZNKlrJVLMHYuPLqKAhxxU1hthTeYpooDHApgv
   w==;
X-CSE-ConnectionGUID: qrk3xRtHTwagWg+bCb20Sg==
X-CSE-MsgGUID: k9jQ2WdoRh+qRWZt2868UQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="190317087"
X-IronPort-AV: E=Sophos;i="6.13,295,1732546800"; 
   d="scan'208";a="190317087"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:41:32 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id CD8A2D501B
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 96769F313
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:29 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5B75B1A0071;
	Tue, 18 Feb 2025 15:41:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 27/32] stress-ng: upgrade 0.18.09 -> 0.18.10
Date: Tue, 18 Feb 2025 15:39:30 +0800
Message-Id: <1739864375-21394-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211592

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../stress-ng/{stress-ng_0.18.09.bb => stress-ng_0.18.10.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.18.09.bb => stress-ng_0.18.10.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.18.09.bb b/meta/recipes-extended/stress-ng/stress-ng_0.18.10.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.18.09.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.18.10.bb
index 25ac66517a..7fcb5af0ee 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.18.09.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.18.10.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
            "
-SRCREV = "c84c8d5f5edb1ca8961d3bd97816d24e90392895"
+SRCREV = "e00c355b8e9af3f7ce091e88ec6ddb5c439dc972"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native libbsd"
-- 
2.43.0


