Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D91CF9C73
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:43 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.9308.1727246976891620255
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QvR+Siel;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246976; x=1758782976;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=q7JtY/TNe+yllIEeEJrP8XDu5xD6R+SPhcx4cnEuWnA=;
  b=QvR+SielDyOiDx4vA8hAyRNeXVSMp55aOj6XBl4XwEVbLdooT8o7Cleh
   DZnMTr7V3p7Q8prpV4xDq1y+prM33z4pwHQDwx4R0z/Sfucm1OnGYtPt2
   OIEdJLjJA3DCIc6TdLKm6rxMrmU5zj2UQDmMEZDA7WQcmtnye+N36ti3y
   0afpdn6+9S/vmJvYtVE728e/j3SN0QRuI+o+zqgK0VdZdbMPU1BMgsJeT
   5q9oK5vFzc0GmLgBUUAKMUqSYxGvJeCxWUuw6VCu1jlgKBcDA2JlKX/Sh
   QnKq2q9xrT8K3cnaEhFrLFCEGoG0nm0Jfzw/WrI3VEzdw8EwMF5vztG0J
   g==;
X-CSE-ConnectionGUID: TkjhCst2Raaz0xFnsh2JQA==
X-CSE-MsgGUID: PF5gWDwiSJS0caTIdqy9Rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="162724246"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="162724246"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:34 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4FCE3C68E6
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:32 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 94DB2CF7C0
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2C7AA20086326
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CF3D91A000A;
	Wed, 25 Sep 2024 14:49:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/47] at-spi2-core: upgrade 2.52.0 -> 2.54.0
Date: Wed, 25 Sep 2024 14:48:35 +0800
Message-Id: <1727246960-20665-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10--5.940300-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrNkknTRICN7Bs1Ir4NZzFmnQi
	GZe0jWAMvnCllUJsUcuiJ2MOXLRcry01VXlcjcCUjoyKzEmtrEdF5qVUCGhwT10d6Qm0CxZti1R
	bZN1JuSh/V9RZw8/UQ0xDwYhMY4Mt/XZOypEyd8cD2WXLXdz+ATeXamXCCu1YIPUd1fKoOcS/BR
	68O365btzLHm+krpKKT7nJZMroD1QYB2fOueQzjxRFJJyf5BJeGEkIgdGU7nX6C0ePs7A07cNbT
	FVOzjU8wy00pJ84cgN6D3x1D61iK0EHZCrV8tffw2r+i4lOOq0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204896

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Make ATSPI_ROLE_PUSH_BUTTON an enum value again.
* atk: Align button role with AT-SPI one.
* Fix warning when atspi_event_quit is called multiple times.
* tests: Clean up test application on SIGABRT/SIGSEGV.
* Set (allow-none) for nullable parameters to atspi_match_rule_new.
* collection: Allow specifying specific action names in match rules.
* atk-adaptor: For collections, don't return objects with 0 actions as
  supporting AtkAction.
* Rename ATSPI_ROLE_PUSH_BUTTON to ATSPI_ROLE_BUTTON.
* Replace disable_p2p with an ATSPI_DISABLE_P2P environment variable.
* Drop use of deprecated eaves-dropping option in dbus configuration
* Notify about HelpText attribute change.
* Fix possible double unref in add_accessible_from_iter.
* tests: Fix missing declaration for getpid().

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../atk/{at-spi2-core_2.52.0.bb => at-spi2-core_2.54.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.52.0.bb => at-spi2-core_2.54.0.bb} (95%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.52.0.bb b/meta/recipes-support/atk/at-spi2-core_2.54.0.bb
similarity index 95%
rename from meta/recipes-support/atk/at-spi2-core_2.52.0.bb
rename to meta/recipes-support/atk/at-spi2-core_2.54.0.bb
index 913b408403..975dc9b959 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.52.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.54.0.bb
@@ -13,7 +13,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "0ac3fc8320c8d01fa147c272ba7fa03806389c6b03d3c406d0823e30e35ff5ab"
+SRC_URI[sha256sum] = "d7eee7e75beddcc272cedc2b60535600f3aae6e481589ebc667afc437c0a6079"
 
 DEPENDS = " \
 	dbus \
-- 
2.34.1


