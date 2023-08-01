Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB31C001E0
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:41:58 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.7619.1690875717415805360
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="114849208"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="114849208"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:41:54 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1BADCC68E6
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Aug 2023 16:41:53 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6B180D9685
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Aug 2023 16:41:52 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7BE242FC84CD;
	Tue,  1 Aug 2023 16:41:51 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] sudo: upgrade 1.9.14p2 -> 1.9.14p3
Date: Tue,  1 Aug 2023 15:41:27 +0800
Message-Id: <1690875687-21573-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875687-21573-1-git-send-email-wangmy@fujitsu.com>
References: <1690875687-21573-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27786.005
X-TMASE-Result: 10-0.838400-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwhOed0Eey3YObOE
	dy34ZwwE8YMGIR6ZqjU7blYJVFl87+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0
	K7bkUDKJlFSORUVE4XjgELkIsyIqM5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2I3a
	djBtsMrI2SP9oYTdON9dIA8OElmj4YgSaWWkQ7jW5d0xTdAzjdGLkaa7ktJdKeSNzygp2oTrdQ3
	5VB3ghuH7HXmC6fSB82niVMrm2d7PIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 07:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185210

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 * Fixed a crash with Python 3.12 when the sudo Python python is
   unloaded.  This only affects "make check" for the Python plugin.
 * Adapted the sudo Python plugin test output to match Python 3.12.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sudo/{sudo_1.9.14p2.bb => sudo_1.9.14p3.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.14p2.bb => sudo_1.9.14p3.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.14p2.bb b/meta/recipes-extended/sudo/sudo_1.9.14p3.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.14p2.bb
rename to meta/recipes-extended/sudo/sudo_1.9.14p3.bb
index fa7939171f..d5c5718ea5 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.14p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.14p3.bb
@@ -7,7 +7,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "15f6308db0ed4265ec929f2c61e2e13492e551750c203ee001d1fcd8104c9514"
+SRC_URI[sha256sum] = "a08318b1c4bc8582c004d4cd9ae2903abc549e7e46ba815e41fe81d1c0782b62"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.34.1


