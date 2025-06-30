Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D5BC8302D
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:37 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.35170.1751274803700367122
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QmfCmRxB;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274815; x=1782810815;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WFerl4AaQfUWZ4MmW0j72xacaxcuwm6S0liHm4aUBkE=;
  b=QmfCmRxBdBzMdOx4F81Sa2jbBJKJTqf6r1Ab/MYatCrfyLv1eyoX0CJR
   fgF+Uc14SNBlGK4LC8RlXetn2Jzop7PmCiKDvIB/7c9U9DjJuh9m7+1gk
   MMafNnaJtt3BbBzpUgRnrzZ+wzAUN718m3IGrv4s7+px4gkL8cJeqVWs2
   n9RuSzeX2HNrpoYx/c2o/qg0b6de6UmhcCfj2d8B8VqQhZ5YNxLcU1/CJ
   RSWpFXtC8pj9tarXWsu9DxL1fjFRVTKMWOWtTaavxwiRLCjdmoFD+s4Fy
   bEqUQKAGJ+IwC8sJWrI6c3RyC/TMMDvsTbFlaDCloPKAyUTWdmrJ2UytS
   w==;
X-CSE-ConnectionGUID: 5KKxQJ5HTCemrpSJ27p3hw==
X-CSE-MsgGUID: pN9bMRX/REK5VnHiGb2cpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="205056036"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="205056036"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:34 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 4088C100035A
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:34 +0000 (UTC)
Received: from oym-m1.gw.nic.fujitsu.com (oym-m1.gw.nic.fujitsu.com [10.85.9.161])
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTP id 7DD8610000F5
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:33 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E106BF8111
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:32 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9BC801A0073;
	Mon, 30 Jun 2025 17:13:32 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 36/37] sudo: upgrade 1.9.16p2 -> 1.9.17
Date: Mon, 30 Jun 2025 17:13:14 +0800
Message-ID: <20250630091315.1897-36-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250630091315.1897-1-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219497

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright updated to 2025

0001-sudo.conf.in-fix-conflict-with-multilib.patch
refreshed for 1.9.17

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-sudo.conf.in-fix-conflict-with-multilib.patch      | 6 +++---
 meta/recipes-extended/sudo/sudo.inc                         | 2 +-
 .../sudo/{sudo_1.9.16p2.bb => sudo_1.9.17.bb}               | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.16p2.bb => sudo_1.9.17.bb} (96%)

diff --git a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
index ec0384e257..1989c5abd7 100644
--- a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
+++ b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
@@ -1,4 +1,4 @@
-From 61ae82a2ba502492b6a78f248258abb71daeb227 Mon Sep 17 00:00:00 2001
+From 8c69192754ba73dd6e3273728a21aa73988f4bfb Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Tue, 17 Nov 2020 11:13:40 +0800
 Subject: [PATCH] sudo.conf.in: fix conflict with multilib
@@ -20,7 +20,7 @@ Upstream-Status: Inappropriate [OE configuration specific]
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/examples/sudo.conf.in b/examples/sudo.conf.in
-index 2187457..0908d24 100644
+index bdd676c..094341c 100644
 --- a/examples/sudo.conf.in
 +++ b/examples/sudo.conf.in
 @@ -4,7 +4,7 @@
@@ -52,7 +52,7 @@ index 2187457..0908d24 100644
  # Sudo plugin directory:
 @@ -74,7 +74,7 @@
  # The default directory to use when searching for plugins that are
- # specified without a fully qualified path name.
+ # specified without a fully-qualified path name.
  #
 -#Path plugin_dir @plugindir@
 +#Path plugin_dir $plugindir
diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 0afbf669f0..a23de1fcf7 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD-3-Clause & BSD-2-Clause & Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=0a6876cbeb2aa51837935ba3fd82ee87 \
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=2841c822e587db145364ca95e9be2ffa \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=03e35317699ba00b496251e0dfe9f109 \
                     file://lib/util/reallocarray.c;beginline=3;endline=15;md5=397dd45c7683e90b9f8bf24638cf03bf \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=004d7d2866ba1f5b41174906849d2e0f \
diff --git a/meta/recipes-extended/sudo/sudo_1.9.16p2.bb b/meta/recipes-extended/sudo/sudo_1.9.17.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.16p2.bb
rename to meta/recipes-extended/sudo/sudo_1.9.17.bb
index fbe507ad32..71d48f448d 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.16p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.17.bb
@@ -7,7 +7,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "976aa56d3e3b2a75593307864288addb748c9c136e25d95a9cc699aafa77239c"
+SRC_URI[sha256sum] = "3f212c69d534d5822b492d099abb02a593f91ca99f5afde5cb9bd3e1dcdad069"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.43.0


