Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E6BC38A04
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:54 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web09.11561.1650052686789761630
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=vF5gBDQv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 010101802ecde7d9-d09b997a-d90d-4289-a2cf-47d6e7a16768-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=THZj4ohfZdrgVsN2YccJP8Ftmojsnqp73kxm229K9f0=;
	b=vF5gBDQv7RQhqlTUe1uttHrbRcmymsrtFHwkQ5FGuaOvyyo+aVwa38WpXc6Up0ii
	kwYxsYiq+fP7oHqN1o4g4ybFDDlPP0b/uMy/ywKajjkXy1li758JhePbUDi8WdX8XSt
	x1tQJExs8hT8Q8sII9hqaMEjuRh1+SMuGCMuaUx0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=THZj4ohfZdrgVsN2YccJP8Ftmojsnqp73kxm229K9f0=;
	b=cu6MRL6DDFMzDFrbgvb9sESJR2xP18y0+duH3f8Pjk6Ia1oF+VZGPqmCdhPrlfS8
	zzZQSfsqsDGqk83qdvXq4TUn/5bKHlFzbtyw1z7hOl5mQGZplt9g1vmE1GNcPWM/wX7
	AAd5seKB3kokQBilL2FsYWGc5Lac7PYCJM+VUI+E=
Content-Type: multipart/mixed; boundary="===============9201065994937650538=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ethtool: upgrading to 5.17 SUCCEEDED
Message-ID: 
 <010101802ecde7d9-d09b997a-d90d-4289-a2cf-47d6e7a16768-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:07 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164467

--===============9201065994937650538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ethtool* to *5.17* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ethtool-upgrade-5.16-5.17.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============9201065994937650538==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-ethtool-upgrade-5.16-5.17.patch"

From d78474f4d4290fb4b48a5e4ec50bc435a97769ae Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Apr 2022 11:22:42 +0000
Subject: [PATCH] ethtool: upgrade 5.16 -> 5.17

---
 .../ethtool/ethtool/avoid_parallel_tests.patch              | 6 +++---
 .../ethtool/{ethtool_5.16.bb => ethtool_5.17.bb}            | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_5.16.bb => ethtool_5.17.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 034dc92444..6c3d1a1b39 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From d98b1e29b89962954690e6a8ddfdd80276407ce7 Mon Sep 17 00:00:00 2001
+From 6aa9f924c870faff0a881b4da73a0ceb52dc2ed6 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -15,11 +15,11 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 8fc93c8..94ee28d 100644
+index 7a9b5b9..dc8ae35 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 5.16, netdev@vger.kernel.org)
+ AC_INIT(ethtool, 5.17, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu subdir-objects])
diff --git a/meta/recipes-extended/ethtool/ethtool_5.16.bb b/meta/recipes-extended/ethtool/ethtool_5.17.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_5.16.bb
rename to meta/recipes-extended/ethtool/ethtool_5.17.bb
index 5dca03d082..61032d4836 100644
--- a/meta/recipes-extended/ethtool/ethtool_5.16.bb
+++ b/meta/recipes-extended/ethtool/ethtool_5.17.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "4160fa127d75d5a6ebd5e871118486ac730dea2f28b2f1ad40fd1ed3d0d369e0"
+SRC_URI[sha256sum] = "3e32735d13aa19e2be32d3528ef8a135fc99782950ab3fa602198e72992e9450"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.27.0


--===============9201065994937650538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ethtool/ethtool-bash-completion: PKGSIZE changed from 24075 to 24547 (+2%)
packages/core2-32-poky-linux/ethtool/ethtool-bash-completion: PV changed from "5.16" to "5.17"
packages/core2-32-poky-linux/ethtool/ethtool-bash-completion: PKGV changed from 5.16 [default] to 5.17 [default]
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PKGSIZE changed from 3351744 to 3383768 (+1%)
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PV changed from "5.16" to "5.17"
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PKGV changed from 5.16 [default] to 5.17 [default]
packages/core2-32-poky-linux/ethtool/ethtool-dev: PV changed from "5.16" to "5.17"
packages/core2-32-poky-linux/ethtool/ethtool-dev: PKGV changed from 5.16 [default] to 5.17 [default]
packages/core2-32-poky-linux/ethtool/ethtool-doc: PKGSIZE changed from 38516 to 39484 (+3%)
packages/core2-32-poky-linux/ethtool/ethtool-doc: PV changed from "5.16" to "5.17"
packages/core2-32-poky-linux/ethtool/ethtool-doc: PKGV changed from 5.16 [default] to 5.17 [default]
packages/core2-32-poky-linux/ethtool/ethtool-locale: PV changed from "5.16" to "5.17"
packages/core2-32-poky-linux/ethtool/ethtool-locale: PKGV changed from 5.16 [default] to 5.17 [default]
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PKGSIZE changed from 1450043 to 1454746 (+0%)
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PV changed from "5.16" to "5.17"
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PKGV changed from 5.16 [default] to 5.17 [default]
packages/core2-32-poky-linux/ethtool/ethtool-src: PKGSIZE changed from 1271055 to 1279795 (+1%)
packages/core2-32-poky-linux/ethtool/ethtool-src: PV changed from "5.16" to "5.17"
packages/core2-32-poky-linux/ethtool/ethtool-src: FILELIST: directory renamed /usr/src/debug/ethtool/5.16-r0/ethtool-5.16/uapi/linux -> /usr/src/debug/ethtool/5.17-r0/ethtool-5.17/uapi/linux, directory renamed /usr/src/debug/ethtool/5.16-r0/ethtool-5.16 -> /usr/src/debug/ethtool/5.17-r0/ethtool-5.17, removed "/usr/src/debug/ethtool/5.16-r0/ethtool-5.16/netlink/coalesce.c /usr/src/debug/ethtool/5.16-r0/ethtool-5.16/netlink/netlink.c /usr/src/debug/ethtool/5.16-r0/ethtool-5.16/netlink/settings.c /usr/src/debug/ethtool/5.16-r0/ethtool-5.16/netlink/permaddr.c /usr/src/debug/ethtool/5.16-r0/ethtool-5.16/netlink/eee.c /usr/src/debug/ethtool/5.16-r0/ethtool-5.16/netlink/monitor.c /usr/src/debug/ethtool/5.16-r0/ethtool-5.16/netlink/desc-ethtool.c /usr/src/debug/ethtool/5.16-r0/ethtool-5.16/netlink/module-eeprom.c /usr/src/debug/ethtool/5.16-r0/ethtool-5.16/netlink/prettymsg.h /usr/src/debug/ethtool/5.16-r0/ethtool-5.16/netlink/nlsock.c /usr/src/debug/ethtool/5.16-r0/ethtool-5.16/netlink/paus
 e.c /usr/src/debug/ethtool/5.16-r0/ethtool-5.16/netlink/parser.h /usr/src/debug/ethtool/5.16-r0/ethtool-5.16/netlink/features.c /usr/src/debug/ethtool/5.16-r0/ethtool-5.16/netlink/desc-genlctrl.c /usr/src/debug/ethtool/5.16-r0/ethtool-5.16/netlink/msgbuff.c /usr/src/debug/ethtool/5.16-r0/ethtool-5.16/netlink/tsinfo.c /usr/src/debug/ethtool/5.16-r0/ethtool-5.16/netlink/bitset.h /usr/src/debug/ethtool/5.16-r0/ethtool-5.16/netlink/channels.c /usr/src/debug/ethtool/5.16-r0/ethtool-5.16/netlink/bitset.c /usr/src/debug/ethtool/5.16-r0/ethtool-5.16/netlink/rings.c /usr/src/debug/ethtool/5.16-r0/ethtool-5.16/netlink/stats.c /usr/src/debug/ethtool/5.16-r0/ethtool-5.16/netlink/fec.c /usr/src/debug/ethtool/5.16-r0/ethtool-5.16/netlink/nlsock.h /usr/src/debug/ethtool/5.16-r0/ethtool-5.16/netlink/tunnels.c /usr/src/debug/ethtool/5.16-r0/ethtool-5.16/netlink/privflags.c /usr/src/debug/ethtool/5.16-r0/ethtool-5.16/netlink/cable_test.c /usr/src/debug/ethtool/5.16-r0/ethtool-5.16/netlink/msgbuff.h /
 usr/src/debug/ethtool/5.16-r0/ethtool-5.16/netlink/parser.c /usr/src/debug/ethtool/5.16-r0/ethtool-5.16/netlink/desc-rtnl.c /usr/src/debug/ethtool/5.16-r0/ethtool-5.16/netlink/strset.c /usr/src/debug/ethtool/5.16-r0/ethtool-5.16/netlink/strset.h /usr/src/debug/ethtool/5.16-r0/ethtool-5.16/netlink/prettymsg.c /usr/src/debug/ethtool/5.16-r0/ethtool-5.16/netlink/netlink.h /usr/src/debug/ethtool/5.16-r0/ethtool-5.16/netlink/extapi.h", added "/usr/src/debug/ethtool/5.17-r0/ethtool-5.17/netlink/parser.c /usr/src/debug/ethtool/5.17-r0/ethtool-5.17/netlink/permaddr.c /usr/src/debug/ethtool/5.17-r0/ethtool-5.17/netlink/tunnels.c /usr/src/debug/ethtool/5.17-r0/ethtool-5.17/netlink/prettymsg.h /usr/src/debug/ethtool/5.17-r0/ethtool-5.17/netlink/tsinfo.c /usr/src/debug/ethtool/5.17-r0/ethtool-5.17/netlink/settings.c /usr/src/debug/ethtool/5.17-r0/ethtool-5.17/netlink/prettymsg.c /usr/src/debug/ethtool/5.17-r0/ethtool-5.17/netlink/privflags.c /usr/src/debug/ethtool/5.17-r0/ethtool-5.17/netlink/d
 esc-ethtool.c /usr/src/debug/ethtool/5.17-r0/ethtool-5.17/netlink/fec.c /usr/src/debug/ethtool/5.17-r0/ethtool-5.17/netlink/rings.c /usr/src/debug/ethtool/5.17-r0/ethtool-5.17/netlink/desc-genlctrl.c /usr/src/debug/ethtool/5.17-r0/ethtool-5.17/netlink/pause.c /usr/src/debug/ethtool/5.17-r0/ethtool-5.17/netlink/nlsock.h /usr/src/debug/ethtool/5.17-r0/ethtool-5.17/netlink/module-eeprom.c /usr/src/debug/ethtool/5.17-r0/ethtool-5.17/netlink/msgbuff.h /usr/src/debug/ethtool/5.17-r0/ethtool-5.17/netlink/monitor.c /usr/src/debug/ethtool/5.17-r0/ethtool-5.17/netlink/parser.h /usr/src/debug/ethtool/5.17-r0/ethtool-5.17/netlink/msgbuff.c /usr/src/debug/ethtool/5.17-r0/ethtool-5.17/netlink/bitset.c /usr/src/debug/ethtool/5.17-r0/ethtool-5.17/netlink/desc-rtnl.c /usr/src/debug/ethtool/5.17-r0/ethtool-5.17/netlink/features.c /usr/src/debug/ethtool/5.17-r0/ethtool-5.17/netlink/netlink.h /usr/src/debug/ethtool/5.17-r0/ethtool-5.17/netlink/strset.h /usr/src/debug/ethtool/5.17-r0/ethtool-5.17/netlin
 k/stats.c /usr/src/debug/ethtool/5.17-r0/ethtool-5.17/netlink/strset.c /usr/src/debug/ethtool/5.17-r0/ethtool-5.17/netlink/channels.c /usr/src/debug/ethtool/5.17-r0/ethtool-5.17/netlink/eee.c /usr/src/debug/ethtool/5.17-r0/ethtool-5.17/netlink/bitset.h /usr/src/debug/ethtool/5.17-r0/ethtool-5.17/netlink/coalesce.c /usr/src/debug/ethtool/5.17-r0/ethtool-5.17/netlink/module.c /usr/src/debug/ethtool/5.17-r0/ethtool-5.17/netlink/cable_test.c /usr/src/debug/ethtool/5.17-r0/ethtool-5.17/netlink/extapi.h /usr/src/debug/ethtool/5.17-r0/ethtool-5.17/netlink/netlink.c /usr/src/debug/ethtool/5.17-r0/ethtool-5.17/netlink/nlsock.c"
packages/core2-32-poky-linux/ethtool/ethtool-src: PKGV changed from 5.16 [default] to 5.17 [default]
packages/core2-32-poky-linux/ethtool/ethtool-staticdev: PV changed from "5.16" to "5.17"
packages/core2-32-poky-linux/ethtool/ethtool-staticdev: PKGV changed from 5.16 [default] to 5.17 [default]
packages/core2-32-poky-linux/ethtool/ethtool: PKGSIZE changed from 563792 to 563856 (+0%)
packages/core2-32-poky-linux/ethtool/ethtool: PV changed from "5.16" to "5.17"
packages/core2-32-poky-linux/ethtool/ethtool: PKGV changed from 5.16 [default] to 5.17 [default]
packages/core2-32-poky-linux/ethtool: SRC_URI changed from "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-5.16.tar.gz file://run-ptest file://avoid_parallel_tests.patch" to "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-5.17.tar.gz file://run-ptest file://avoid_parallel_tests.patch"
packages/core2-32-poky-linux/ethtool: PV changed from "5.16" to "5.17"
packages/core2-32-poky-linux/ethtool: PKGV changed from 5.16 [default] to 5.17 [default]

--===============9201065994937650538==--

