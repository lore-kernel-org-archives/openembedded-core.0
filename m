Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 690EDC25B7C
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:15 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.11789.1713948185480832297
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:43:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bLBAUmMb;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948186; x=1745484186;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=wQ85CjxuP7gpCrbZFArzFPj60E26S04nGAx7GIqbfSk=;
  b=bLBAUmMbuKkbRZfObWs3bwvu64yXD7Ic0F1rq/XjmsxSG3A0iKRBRjgl
   3faBmMyMKMRNw2w1Y1LciMVKcdJ972nzAjmxan2yjHQQ2hUG9NqBGfGXA
   2EsPqskP6ksUnysdU4JyvKiOo3EScLXkzfcLJNEkB446vR6Ps4+g5+Mi8
   MwLA34Px+Ci94+n8pEfGYF0vFZBgGt7AC3bSOXb6MW9/Gj32url47rzTM
   W7/7mNA2X3RAe7AgjX+URQjXvGaEYH6iNHGdZc9r5fQTwtm1HVtIfRclA
   dD5jfKjhfd8bO3M+EToW+YHtLQvuhvvvoYT3wI0tMF/myH0FEI7TGW9uB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="156433041"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="156433041"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:43:03 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 14411D500E
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:01 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5CA60D7B8F
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D10EF1EA822
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:59 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7D0691A000A;
	Wed, 24 Apr 2024 16:42:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 16/38] mesa: upgrade 24.0.3 -> 24.0.5
Date: Wed, 24 Apr 2024 16:42:10 +0800
Message-Id: <1713948152-13501-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10--1.466600-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSCysPB8dBBorQec
	3JTmkn8uJMPD8FR5f58boCivyaDEErVQ6XPWwtdyEXjPIvKd74BMkOX0UoduufuzwJAEkzruHqx
	sBjV0bTaESVL06fzYOxP6uxGv2vDH5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2eVW
	/ZdL52jyEkjBg4+biT0VxsCEkobooIj/DYzlaN6AOgBuV4+j0PniJ1RE4eDWqpOmD118sBWpAzx
	ZQ+RyoiyxXYzxZUK8NvFG7M1x0EwvIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198661

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://docs.mesa3d.org/relnotes/24.0.5.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-graphics/mesa/mesa.inc                           | 2 +-
 meta/recipes-graphics/mesa/{mesa_24.0.3.bb => mesa_24.0.5.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa_24.0.3.bb => mesa_24.0.5.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 1c9fa66c72..77e9c80fcb 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,7 +22,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch \
 "
 
-SRC_URI[sha256sum] = "77aec9a2a37b7d3596ea1640b3cc53d0b5d9b3b52abed89de07e3717e91bfdbe"
+SRC_URI[sha256sum] = "38cc245ca8faa3c69da6d2687f8906377001f63365348a62cc6f7fafb1e8c018"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_24.0.3.bb b/meta/recipes-graphics/mesa/mesa_24.0.5.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_24.0.3.bb
rename to meta/recipes-graphics/mesa/mesa_24.0.5.bb
-- 
2.34.1


