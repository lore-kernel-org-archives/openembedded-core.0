Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED22AC3ABD6
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:01 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.45913.1747040637212932732
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=H1PNwiEV;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040640; x=1778576640;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=298h1Xj2fYf/OwM1zaJMefzDd8TWqUJ936xOvSF7NZA=;
  b=H1PNwiEVVjay/TqxSuSWIZuamayS+17HaLLqDd3d0s3BzoxaxmRK0WTo
   MeYS1SCbCPMDGFVZ7g720Huimvbhx70Bh7L0RPIvc/yf8bgMOq5uTOB/N
   Kpc7onFLmwo5ReanIYa2+aL4FTnJbHl/qvOPhCTVbLfgrccc/OhQb2Bo+
   B2XCuiIWAQYnoEgDn1k/bODLxGFBb/zEta+n0lNkGkaGOTrMZopHKgWY2
   V0uEyWJ8lQbnlHupJTfdE2VYfYgXXIP2JEcGWp/b9XX/8C6Fg2QMnLB2d
   G2bxva2CLtBwyBuNx3dIL53d7uwTob/MQ7E4TMtTWRxkH46tMHX+MDsWR
   A==;
X-CSE-ConnectionGUID: cQgagFVGTeiE3sVY4EAe1A==
X-CSE-MsgGUID: E3WXLProTMOdNucdfGgr6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="199193690"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="199193690"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:03:59 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4720FC68A5
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0593ED5040
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:56 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B851B1A009B;
	Mon, 12 May 2025 17:03:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 16/56] grep: upgrade 3.11 -> 3.12
Date: Mon, 12 May 2025 17:02:59 +0800
Message-Id: <1747040619-7566-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216310

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/grep/{grep_3.11.bb => grep_3.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/grep/{grep_3.11.bb => grep_3.12.bb} (93%)

diff --git a/meta/recipes-extended/grep/grep_3.11.bb b/meta/recipes-extended/grep/grep_3.12.bb
similarity index 93%
rename from meta/recipes-extended/grep/grep_3.11.bb
rename to meta/recipes-extended/grep/grep_3.12.bb
index 0d36eba3b2..2678d2d41e 100644
--- a/meta/recipes-extended/grep/grep_3.11.bb
+++ b/meta/recipes-extended/grep/grep_3.12.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "1db2aedde89d0dea42b16d9528f894c8d15dae4e190b59aecc78f5a951276eab"
+SRC_URI[sha256sum] = "2649b27c0e90e632eadcd757be06c6e9a4f48d941de51e7c0f83ff76408a07b9"
 
 inherit autotools gettext texinfo pkgconfig
 
-- 
2.43.0


