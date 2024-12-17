Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8248DE7716A
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 08:58:35 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.77344.1734425911630428124
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 00:58:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GV3OnMLg;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734425912; x=1765961912;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ahKCFoO6VtGJlCPavzWr6e985D1JLaxCUY9bYUfrR0c=;
  b=GV3OnMLgNlQiiXCMKas5FJIMcCQCjTdx2XHRcQmfSPV6hpv636JHSbuM
   aMRXnVPY3GFyrV7ogwX7VWhM19qw+EttStPMfJwiYAYONFGxqowFBl3uh
   YM5V2BDpdwDYNaNpZnmNHryVE0i2pcya3qsVV3XFI+Wcy8Htve5kZ3t8T
   siKptugUoxFkDjwanoY2pCrpDA/gkvqqdJxmRrG0nvKy7QVMr8ofcld/V
   OSSlnH/OAMZdWYvMjYOzGE3oFZPcA36gASRSRvJK9Akupv5IZ86kvl/Qp
   QKpuWzxVLw6SaIjuLGxCln2lbCD/fAESyTP1arSEjJzv6BF+GnbQ0NcPF
   Q==;
X-CSE-ConnectionGUID: rt/WDWn2R+a8m9mNrX15jQ==
X-CSE-MsgGUID: vTUclpVoQDW8Po8t0shBEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="184028846"
X-IronPort-AV: E=Sophos;i="6.12,241,1728918000"; 
   d="scan'208";a="184028846"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 17:58:30 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 626B5D5076
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:27 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3972BCFF89
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C9F502007CDE4
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:26 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 676B21A000B;
	Tue, 17 Dec 2024 16:58:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 06/21] json-glib: upgrade 1.10.0 -> 1.10.6
Date: Tue, 17 Dec 2024 16:57:52 +0800
Message-Id: <1734425887-18069-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
References: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28864.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28864.006
X-TMASE-Result: 10--6.525100-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrXs5nqGvDCfP5nlJilS5UkbWO
	DdZ1PDmEngbuGWpoKqRtV04Bl6mC0paxrsTDa6znA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYoXX0y6oAIj5HForOVdsRaVmPsTq8ee41oGzTdEevOMz+7PAkASTOu68Rk
	6Df1Dw4+LzNWBegCW24nmFeyfGnuMLbigRnpKlKSPzRlrdFGDw7Ct9mmHBexkwH54DccV10tRFT
	Q7LQdnapqTWWDEz2KKIkDMlUcR7Ig==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 08:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208810

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Allow single quoted strings when running in non-strict mode
- Allow escaped characters when running in non-strict mode
- Add missing nullable annotation

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../json-glib/{json-glib_1.10.0.bb => json-glib_1.10.6.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/json-glib/{json-glib_1.10.0.bb => json-glib_1.10.6.bb} (93%)

diff --git a/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb b/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb
similarity index 93%
rename from meta/recipes-gnome/json-glib/json-glib_1.10.0.bb
rename to meta/recipes-gnome/json-glib/json-glib_1.10.6.bb
index 332e8b65c3..8b009bc17b 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb
@@ -19,7 +19,7 @@ GIDOCGEN_MESON_ENABLE_FLAG = 'enabled'
 GIDOCGEN_MESON_DISABLE_FLAG = 'disabled'
 
 SRC_URI += " file://run-ptest"
-SRC_URI[archive.sha256sum] = "1bca8d66d96106ecc147df3133b95a5bb784f1fa6f15d06dd7c1a8fb4a10af7b"
+SRC_URI[archive.sha256sum] = "77f4bcbf9339528f166b8073458693f0a20b77b7059dbc2db61746a1928b0293"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native xmlto-native python3-docutils-native"
-- 
2.43.0


