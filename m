Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8BAFC021B1
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 07:41:38 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.14628.1739864485290970726
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 23:41:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=s5fap25S;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739864493; x=1771400493;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=lu20RGC64EdQx65DMTdJGmeqPW+sQPy4pH+sXv/qOaE=;
  b=s5fap25SetRw569bf/aYQ6vYjEd7aDCfkwyszmNmRtQxrpVF6pnyvpM9
   1jMuOopPi1GmqEJs2a7BN6UYSKpiN5vF6plcEzz3dIqKsH7tTSyJMFDRx
   uUS0Nx7MxWCK1N+OrgR3TmJJ//xTFhu6QC1DjcUnx1qu0tpt0dMdCdjVO
   bOwt3zYe+PGPAsq/8fn6oyejq26N0RJDwiSQQzIn56XMpSB1//rC6DkYt
   RQByJXWI3atqJaWQe7lLTDXSuNy4E4TkiWEg86UOnk8/eNo5SCJs8eTSB
   762fXCycnqzcdl47as+trs6UB0bYHzMF2JjhkbRabJ2zV86BbQ3DDtKIM
   w==;
X-CSE-ConnectionGUID: LzVfQya0RReOP54LH9HHZA==
X-CSE-MsgGUID: 17b8kNs5Qs+dYBfGzju4jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="169232671"
X-IronPort-AV: E=Sophos;i="6.13,295,1732546800"; 
   d="scan'208";a="169232671"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:41:32 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 46DE213F59
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0E4FDF313
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:30 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C78911A006C;
	Tue, 18 Feb 2025 15:41:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 29/32] xhost: upgrade 1.0.9 -> 1.0.10
Date: Tue, 18 Feb 2025 15:39:32 +0800
Message-Id: <1739864375-21394-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211590

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{xhost_1.0.9.bb => xhost_1.0.10.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{xhost_1.0.9.bb => xhost_1.0.10.bb} (89%)

diff --git a/meta/recipes-graphics/xorg-app/xhost_1.0.9.bb b/meta/recipes-graphics/xorg-app/xhost_1.0.10.bb
similarity index 89%
rename from meta/recipes-graphics/xorg-app/xhost_1.0.9.bb
rename to meta/recipes-graphics/xorg-app/xhost_1.0.10.bb
index d54e6cae65..0c112e6ea3 100644
--- a/meta/recipes-graphics/xorg-app/xhost_1.0.9.bb
+++ b/meta/recipes-graphics/xorg-app/xhost_1.0.10.bb
@@ -15,7 +15,7 @@ PE = "1"
 
 SRC_URI_EXT = "xz"
 
-SRC_URI[sha256sum] = "ea86b531462035b19a2e5e01ef3d9a35cca7d984086645e2fc844d8f0e346645"
+SRC_URI[sha256sum] = "a8afd70059479c712948b895e41c35a4a8bfcede3ba2d5a4b855c88bbb725be1"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.43.0


