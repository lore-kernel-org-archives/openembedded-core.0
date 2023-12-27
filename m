Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 307AAC46CD4
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 13:08:01 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.100683.1703682475777727932
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 05:07:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="132774849"
X-IronPort-AV: E=Sophos;i="6.04,309,1695654000"; 
   d="scan'208";a="132774849"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 22:07:53 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id BD592D6186
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 22:07:50 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id F31FFD39C8
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 22:07:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 89B95202C337C
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 22:07:49 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2B5301A006F;
	Wed, 27 Dec 2023 21:07:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] dhcpcd: upgrade 10.0.5 -> 10.0.6
Date: Wed, 27 Dec 2023 21:07:30 +0800
Message-Id: <1703682450-24034-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28082.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28082.007
X-TMASE-Result: 10-6.046600-10.000000
X-TMASE-MatchedRID: 6IstDyeExSCjz0nOeth/ySrLqyE6Ur/j2FA7wK9mP9d/iZ1aNsYG7m8q
	nFk+BWUXyYhAKlqylvjzslOXY3oDJPRr52i2NSUskCThXPqsqiuLDKUcym61JMj0QMA/92m2Pj2
	LYYvxFKYqqtDuUtwyfIrxadHfzoJWbRev5+PfDD/y3h9RQZ4StME5XPQnBzGXtLALfOrPJxTGD0
	/NuzV8C3Lk6Fcpgn/HVe3suVjBA+cMeUy96gk4BBMxKDqgAFSzNte7AWpKXSuZug0ObbHqj6/WP
	/YvvE/WQ5x/L79ZrMe1Yo1HZ6kAVpH0YXYnbGozFEUknJ/kEl7dB/CxWTRRu4as+d5/8j56Z46g
	pNc1J7jeZNOEgoQ5X0QEgQ4hqNHw06hKNQsObLuy06pKTR4+Gr1N9rozILo/p/EvRvDMn+z7Ttk
	1HO3SUR+ra7Ry0xNC
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 13:08:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192946

From: Wang Mingyu <wangmy@fujitsu.com>

0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
refreshed for 10.0.6

Changelog:
==========
-privsep: Stop proxying stderr to console and fix some detachment issues
-non-privsep: Fix launcher hangup
-DHCP6: Allow the invalid interface name - to mean don't assign an address from a delegated prefix
-DHCP6: Load the configuration for the interface being activated from prefix delegation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dhcpcd/{dhcpcd_10.0.5.bb => dhcpcd_10.0.6.bb}  |  2 +-
 ...8-Fix-conflict-error-when-enable-multilib.patch | 10 ++++------
 ...remove-INCLUDEDIR-to-prevent-build-issues.patch | 14 ++++++--------
 3 files changed, 11 insertions(+), 15 deletions(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.0.5.bb => dhcpcd_10.0.6.bb} (97%)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.5.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
similarity index 97%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.5.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
index c2dee267ba..6bde9b1f51 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.5.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            "
 
-SRCREV = "6baf4df467aaae89b026a089122d155c6eec3f19"
+SRCREV = "1c8ae59836fa87b4c63c598087f0460ec20ed862"
 S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools-brokensep systemd useradd
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
index 12998aada4..461d04bd1d 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
@@ -1,4 +1,4 @@
-From 4915a7e52fcea8fe283a842890a1e726b1e26b10 Mon Sep 17 00:00:00 2001
+From 5d5ba8a2b8010db6bee68bd712f829cb737c9ac1 Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@fujitsu.com>
 Date: Fri, 10 Mar 2023 03:48:46 +0000
 Subject: [PATCH] dhcpcd.8: Fix conflict error when enable multilib.
@@ -24,15 +24,16 @@ versions.
 
 Upstream-Status: Inappropriate [oe specific]
 Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
+
 ---
  src/dhcpcd.8.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/dhcpcd.8.in b/src/dhcpcd.8.in
-index bc6b3b5..791f2ba 100644
+index 93232840..09930a31 100644
 --- a/src/dhcpcd.8.in
 +++ b/src/dhcpcd.8.in
-@@ -821,7 +821,7 @@ Configuration file for dhcpcd.
+@@ -824,7 +824,7 @@ Configuration file for dhcpcd.
  If you always use the same options, put them here.
  .It Pa @SCRIPT@
  Bourne shell script that is run to configure or de-configure an interface.
@@ -41,6 +42,3 @@ index bc6b3b5..791f2ba 100644
  Linux
  .Pa /dev
  management modules.
--- 
-2.34.1
-
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
index 37d2344438..c54942be4b 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
@@ -1,4 +1,4 @@
-From aa9e3982c1e75ad49945a62f5e262279c7a905a4 Mon Sep 17 00:00:00 2001
+From ec9fc4e6086e1dbe0ac2f94a8a088a571596a581 Mon Sep 17 00:00:00 2001
 From: Stefano Cappa <stefano.cappa.ks89@gmail.com>
 Date: Sun, 13 Jan 2019 01:50:52 +0100
 Subject: [PATCH] remove INCLUDEDIR to prevent build issues
@@ -6,15 +6,16 @@ Subject: [PATCH] remove INCLUDEDIR to prevent build issues
 Upstream-Status: Pending
 
 Signed-off-by: Stefano Cappa <stefano.cappa.ks89@gmail.com>
+
 ---
  configure | 5 -----
  1 file changed, 5 deletions(-)
 
 diff --git a/configure b/configure
-index 6c81e0db..32dea2b4 100755
+index 5237b0e2..7220718b 100755
 --- a/configure
 +++ b/configure
-@@ -20,7 +20,6 @@ BUILD=
+@@ -26,7 +26,6 @@ BUILD=
  HOST=
  HOSTCC=
  TARGET=
@@ -22,7 +23,7 @@ index 6c81e0db..32dea2b4 100755
  DEBUG=
  FORK=
  STATIC=
-@@ -72,7 +71,6 @@ for x do
+@@ -86,7 +85,6 @@ for x do
  	--mandir) MANDIR=$var;;
  	--datadir) DATADIR=$var;;
  	--with-ccopts|CFLAGS) CFLAGS=$var;;
@@ -30,7 +31,7 @@ index 6c81e0db..32dea2b4 100755
  	CC) CC=$var;;
  	CPPFLAGS) CPPFLAGS=$var;;
  	PKG_CONFIG) PKG_CONFIG=$var;;
-@@ -309,9 +307,6 @@ if [ -n "$CPPFLAGS" ]; then
+@@ -343,9 +341,6 @@ if [ -n "$CPPFLAGS" ]; then
  	echo "CPPFLAGS=" >>$CONFIG_MK
  	echo "CPPFLAGS+=	$CPPFLAGS" >>$CONFIG_MK
  fi
@@ -40,6 +41,3 @@ index 6c81e0db..32dea2b4 100755
  if [ -n "$LDFLAGS" ]; then
  	echo "LDFLAGS=" >>$CONFIG_MK
  	echo "LDFLAGS+=	$LDFLAGS" >>$CONFIG_MK
--- 
-2.17.2 (Apple Git-113)
-
-- 
2.34.1


