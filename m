Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6877C7EE33
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 09:17:03 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.26248.1750065413679155080
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 02:16:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EmFOBJ46;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750065413; x=1781601413;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+9bRfp0kdUs5rUS2ApAwNoA8nsf9V6GdQe8Olc60/ps=;
  b=EmFOBJ46gyJWV1Cx3A5PYEoHVXCYOqAcgQ27hVhjMIDV0nSQk1ygEBG3
   zh265TAFBpyOOLrwS4d0Q9o/zgQH31qcMPxpT+kpwbvq6GV4wiuHJUkQt
   FCV2tHVcuqNWgX/nhy319OPNTUeZX/8wLEVNn2U8H07uykihgHtTdfu9x
   Y3Sqadqkz44TY6SqIRP99YBkkz6GFCs7JIXyZ/0mPypPEyCFnoz31IGDw
   iA+AR3hg4cOloxVgY2dRIf0KApwFUr7et95rLMVItP2DrYCEL1baeODpF
   19Kspww6hYepwwy4JbxNstssYhovfL5FEi58W1/Jghb58hh5ewKOzOfs8
   Q==;
X-CSE-ConnectionGUID: 3gfN5i1SRmyqUCi/t/AVfA==
X-CSE-MsgGUID: I0IKihy5R7aOOFXoXr+lHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="181755383"
X-IronPort-AV: E=Sophos;i="6.16,240,1744038000"; 
   d="scan'208";a="181755383"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:16:50 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E9453D8E1B
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9249ED7624
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:48 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CE4671A000B;
	Mon, 16 Jun 2025 17:16:47 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/24] gtk4: upgrade 4.18.5 -> 4.18.6
Date: Mon, 16 Jun 2025 17:16:21 +0800
Message-ID: <20250616091643.918-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250616091643.918-1-wangmy@fujitsu.com>
References: <20250616091643.918-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218776

From: Wang Mingyu <wangmy@fujitsu.com>

Bugs fixed:
- Wrong behavior of GdkKeymap on macOS
- cups: NULL-terminate array of choices
- Fix the android build
- icontheme: Load the missing image icon from the theme

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-gnome/gtk+/{gtk4_4.18.5.bb => gtk4_4.18.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.18.5.bb => gtk4_4.18.6.bb} (98%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.18.5.bb b/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.18.5.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.18.6.bb
index 85773b1174..092f8d309f 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.18.5.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb
@@ -38,7 +38,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX = "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
-SRC_URI[sha256sum] = "bb5267a062f5936947d34c9999390a674b0b2b0d8aa3472fe0d05e2064955abc"
+SRC_URI[sha256sum] = "e1817c650ddc3261f9a8345b3b22a26a5d80af154630dedc03cc7becefffd0fa"
 
 S = "${WORKDIR}/gtk-${PV}"
 
-- 
2.43.0


