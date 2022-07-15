Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7391ACCA485
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 15:57:53 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web12.981.1657900667956046784
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QuyrYxb5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 0101018202949973-c681676e-8eb9-4113-b313-bcf88b540444-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1657900669;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8WNoDuuJZcWDeQ+VRO0TZ+OcvJJEjFSmLU+Xqo/ShS4=;
	b=QuyrYxb5XCwLq1Ospvii8J4lY5Q39M7Lt3lEj1BnjFtDNY75GcvESgSx1XdOjLZ9
	EWm6ENi07UF8Z+4M7oFxUKKaOHly2SP73PIxZDOwDK43TSGlAG/FPLBRZHQnDjYLXQa
	PChnZNyn3Rh4NaUhpi6JdnxfE00Gvy67Rbt0wMdg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1657900669;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8WNoDuuJZcWDeQ+VRO0TZ+OcvJJEjFSmLU+Xqo/ShS4=;
	b=fRWB5fHOCv7iF0o9PVa4eRqloxckTRYsPKrD1qzrnustWm92ERCzI9rRIogcV+Nq
	STEXR1u4zweJDbl+KvaN3tUBal28Bc1V67KMfkeTYhbE2CxrEm0QG/kJmF8NVYRm4nA
	Xs1PxvBd3Ml1QYAWRlXofgiqMZG17qxYhYOnWhP8=
Content-Type: multipart/mixed; boundary="===============0436780956200741441=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libnl: upgrading to 3.7.0 SUCCEEDED
Message-ID: 
 <0101018202949973-c681676e-8eb9-4113-b313-bcf88b540444-000000@us-west-2.amazonses.com>
Date: Fri, 15 Jul 2022 15:57:49 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 15:57:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168116

--===============0436780956200741441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libnl* to *3.7.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libnl-upgrade-3.6.0-3.7.0.patch
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
--===============0436780956200741441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libnl: PV changed from "3.6.0" to "3.7.0"
packages/core2-32-poky-linux/libnl: PKGV changed from 3.6.0 [default] to 3.7.0 [default]
packages/core2-32-poky-linux/libnl: SRC_URI changed from "https://github.com/thom311/libnl/releases/download/libnl3_6_0/libnl-3.6.0.tar.gz file://enable-serial-tests.patch file://run-ptest file://fa7f97f8982544c4fcb403893bae6701230d5165.patch" to "https://github.com/thom311/libnl/releases/download/libnl3_7_0/libnl-3.7.0.tar.gz file://enable-serial-tests.patch file://run-ptest"
packages/core2-32-poky-linux/libnl/libnl-cli: PV changed from "3.6.0" to "3.7.0"
packages/core2-32-poky-linux/libnl/libnl-cli: PKGV changed from 3.6.0 [default] to 3.7.0 [default]
packages/core2-32-poky-linux/libnl/libnl-dbg: PV changed from "3.6.0" to "3.7.0"
packages/core2-32-poky-linux/libnl/libnl-dbg: PKGV changed from 3.6.0 [default] to 3.7.0 [default]
packages/core2-32-poky-linux/libnl/libnl-dbg: PKGSIZE changed from 4096748 to 4215168 (+3%)
packages/core2-32-poky-linux/libnl/libnl-dev: FILELIST: added "/usr/include/libnl3/netlink/route/act/nat.h"
packages/core2-32-poky-linux/libnl/libnl-dev: PV changed from "3.6.0" to "3.7.0"
packages/core2-32-poky-linux/libnl/libnl-dev: PKGV changed from 3.6.0 [default] to 3.7.0 [default]
packages/core2-32-poky-linux/libnl/libnl-dev: PKGSIZE changed from 284493 to 286366 (+1%)
packages/core2-32-poky-linux/libnl/libnl-doc: PV changed from "3.6.0" to "3.7.0"
packages/core2-32-poky-linux/libnl/libnl-doc: PKGV changed from 3.6.0 [default] to 3.7.0 [default]
packages/core2-32-poky-linux/libnl/libnl-genl: PV changed from "3.6.0" to "3.7.0"
packages/core2-32-poky-linux/libnl/libnl-genl: PKGV changed from 3.6.0 [default] to 3.7.0 [default]
packages/core2-32-poky-linux/libnl/libnl-idiag: PV changed from "3.6.0" to "3.7.0"
packages/core2-32-poky-linux/libnl/libnl-idiag: PKGV changed from 3.6.0 [default] to 3.7.0 [default]
packages/core2-32-poky-linux/libnl/libnl-locale: PV changed from "3.6.0" to "3.7.0"
packages/core2-32-poky-linux/libnl/libnl-locale: PKGV changed from 3.6.0 [default] to 3.7.0 [default]
packages/core2-32-poky-linux/libnl/libnl-nf: PV changed from "3.6.0" to "3.7.0"
packages/core2-32-poky-linux/libnl/libnl-nf: PKGV changed from 3.6.0 [default] to 3.7.0 [default]
packages/core2-32-poky-linux/libnl/libnl-ptest: PV changed from "3.6.0" to "3.7.0"
packages/core2-32-poky-linux/libnl/libnl-ptest: PKGV changed from 3.6.0 [default] to 3.7.0 [default]
packages/core2-32-poky-linux/libnl/libnl-ptest: PKGSIZE changed from 450127 to 539151 (+20%)
packages/core2-32-poky-linux/libnl/libnl-route: PV changed from "3.6.0" to "3.7.0"
packages/core2-32-poky-linux/libnl/libnl-route: PKGV changed from 3.6.0 [default] to 3.7.0 [default]
packages/core2-32-poky-linux/libnl/libnl-route: PKGSIZE changed from 640513 to 648801 (+1%)
packages/core2-32-poky-linux/libnl/libnl-src: FILELIST: directory renamed /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/lib/route -> /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/lib/route, directory renamed /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/include/netlink -> /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/include/netlink, directory renamed /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/include/netlink-private/route -> /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/include/netlink-private/route, directory renamed /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/include/netlink/idiag -> /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/include/netlink/idiag, directory renamed /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/include/linux-private/linux/tc_ematch -> /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/include/linux-private/linux/tc_ematch, directory renamed /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/src/lib -> /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/src/lib, directory renamed /usr/src/debug/l
 ibnl/1_3.6.0-r0/libnl-3.6.0/lib/route/cls -> /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/lib/route/cls, directory renamed /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/include/netlink/netfilter -> /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/include/netlink/netfilter, directory renamed /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/include/netlink/route/link -> /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/include/netlink/route/link, directory renamed /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/lib -> /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/lib, directory renamed /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/include/netlink/route/cls/ematch -> /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/include/netlink/route/cls/ematch, directory renamed /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/lib/route/cls/ematch -> /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/lib/route/cls/ematch, directory renamed /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/lib/route/qdisc -> /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.
 7.0/lib/route/qdisc, directory renamed /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/include/netlink/genl -> /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/include/netlink/genl, directory renamed /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/include/netlink/route -> /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/include/netlink/route, directory renamed /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/lib/idiag -> /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/lib/idiag, directory renamed /usr/src/debug/libnl/1_3.6.0-r0/build/lib/route/cls -> /usr/src/debug/libnl/1_3.7.0-r0/build/lib/route/cls, directory renamed /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/include/netlink/fib_lookup -> /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/include/netlink/fib_lookup, directory renamed /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/include/linux-private/linux -> /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/include/linux-private/linux, directory renamed /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/include/netlink/route/
 cls -> /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/include/netlink/route/cls, directory renamed /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/include/linux-private/linux/can -> /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/include/linux-private/linux/can, directory renamed /usr/src/debug/libnl/1_3.6.0-r0/build/lib/route -> /usr/src/debug/libnl/1_3.7.0-r0/build/lib/route, directory renamed /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/include/netlink/route/qdisc -> /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/include/netlink/route/qdisc, directory renamed /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/include/netlink/cli -> /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/include/netlink/cli, directory renamed /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/include/netlink/xfrm -> /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/include/netlink/xfrm, directory renamed /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/src -> /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/src, directory renamed /usr/src/debug/libnl/1_
 3.6.0-r0/libnl-3.6.0/include/linux-private/linux/netfilter -> /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/include/linux-private/linux/netfilter, directory renamed /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/include/netlink-private -> /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/include/netlink-private, directory renamed /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/lib/genl -> /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/lib/genl, directory renamed /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/tests -> /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/tests, directory renamed /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/lib/cli/qdisc -> /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/lib/cli/qdisc, directory renamed /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/include/netlink/route/act -> /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/include/netlink/route/act, directory renamed /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/lib/cli/cls -> /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/lib/cli/cls, directory 
 renamed /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/lib/netfilter -> /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/lib/netfilter, directory renamed /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/include/netlink-private/route/link -> /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/include/netlink-private/route/link, directory renamed /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/lib/fib_lookup -> /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/lib/fib_lookup, directory renamed /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/lib/xfrm -> /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/lib/xfrm, directory renamed /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/lib/route/link -> /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/lib/route/link, removed "/usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/include/linux-private/linux/tc_act/tc_gact.h /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/lib/route/act/mirred.c /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/lib/route/act/vlan.c /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/lib/rou
 te/act/gact.c /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/lib/route/act/skbedit.c /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/include/linux-private/linux/tc_act/tc_vlan.h /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/include/linux-private/linux/tc_act/tc_mirred.h /usr/src/debug/libnl/1_3.6.0-r0/libnl-3.6.0/include/linux-private/linux/tc_act/tc_skbedit.h", added "/usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/lib/route/act/skbedit.c /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/include/linux-private/linux/tc_act/tc_gact.h /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/include/linux-private/linux/tc_act/tc_mirred.h /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/include/linux-private/linux/tc_act/tc_vlan.h /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/include/linux-private/linux/tc_act/tc_skbedit.h /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/lib/route/act/nat.c /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/lib/route/act/gact.c /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/lib/route/act/vlan.c /usr/src/de
 bug/libnl/1_3.7.0-r0/libnl-3.7.0/lib/route/act/mirred.c /usr/src/debug/libnl/1_3.7.0-r0/libnl-3.7.0/include/linux-private/linux/tc_act/tc_nat.h"
packages/core2-32-poky-linux/libnl/libnl-src: PV changed from "3.6.0" to "3.7.0"
packages/core2-32-poky-linux/libnl/libnl-src: PKGV changed from 3.6.0 [default] to 3.7.0 [default]
packages/core2-32-poky-linux/libnl/libnl-src: PKGSIZE changed from 2842072 to 2888685 (+2%)
packages/core2-32-poky-linux/libnl/libnl-staticdev: PV changed from "3.6.0" to "3.7.0"
packages/core2-32-poky-linux/libnl/libnl-staticdev: PKGV changed from 3.6.0 [default] to 3.7.0 [default]
packages/core2-32-poky-linux/libnl/libnl-xfrm: PV changed from "3.6.0" to "3.7.0"
packages/core2-32-poky-linux/libnl/libnl-xfrm: PKGV changed from 3.6.0 [default] to 3.7.0 [default]
packages/core2-32-poky-linux/libnl/libnl: PV changed from "3.6.0" to "3.7.0"
packages/core2-32-poky-linux/libnl/libnl: PKGV changed from 3.6.0 [default] to 3.7.0 [default]
Changes to packages/core2-32-poky-linux/libnl (sysroot):
  /usr/include/libnl3/netlink/route/act/nat.h was added

--===============0436780956200741441==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libnl-upgrade-3.6.0-3.7.0.patch"

From 60dc0d8428ced0fdb5216a45109791b1d06aeebb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Jul 2022 15:26:26 +0000
Subject: [PATCH] libnl: upgrade 3.6.0 -> 3.7.0

---
 ...97f8982544c4fcb403893bae6701230d5165.patch | 48 -------------------
 .../libnl/{libnl_3.6.0.bb => libnl_3.7.0.bb}  |  8 ++--
 2 files changed, 3 insertions(+), 53 deletions(-)
 delete mode 100644 meta/recipes-support/libnl/files/fa7f97f8982544c4fcb403893bae6701230d5165.patch
 rename meta/recipes-support/libnl/{libnl_3.6.0.bb => libnl_3.7.0.bb} (91%)

diff --git a/meta/recipes-support/libnl/files/fa7f97f8982544c4fcb403893bae6701230d5165.patch b/meta/recipes-support/libnl/files/fa7f97f8982544c4fcb403893bae6701230d5165.patch
deleted file mode 100644
index 02662c939e..0000000000
--- a/meta/recipes-support/libnl/files/fa7f97f8982544c4fcb403893bae6701230d5165.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From fa7f97f8982544c4fcb403893bae6701230d5165 Mon Sep 17 00:00:00 2001
-From: Thomas Haller <thaller@redhat.com>
-Date: Fri, 15 Apr 2022 13:29:49 +0200
-Subject: [PATCH] build: avoid building check-direct with --disable-static
-
-"check-direct" needs to statically link with the libraries, because
-it wants to test internal ABI, which is hidden in the share libraries.
-When configuring with "--disable-static", static libs are not build
-and the test tool cannot be build.
-
-Just skip the test in that case.
-
-https://github.com/thom311/libnl/issues/306
-Upstream-Status: Backport [https://github.com/thom311/libnl/commit/fa7f97f8982544c4fcb403893bae6701230d5165]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- Makefile.am  | 2 ++
- configure.ac | 2 ++
- 2 files changed, 4 insertions(+)
-
-diff --git a/Makefile.am b/Makefile.am
-index a6bcf553..2f5e0dfc 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -984,8 +984,10 @@ tests_check_all_LDADD = \
- 	$(NULL)
- 
- if WITH_CHECK
-+if ENABLE_STATIC
- check_programs += tests/check-direct
- endif
-+endif
- 
- tests_check_direct_SOURCES = \
- 	tests/check-direct.c \
-diff --git a/configure.ac b/configure.ac
-index 1f9ad0eb..0fd1cc0f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -107,6 +107,8 @@ else
-     AC_CHECK_LIB([pthread], [pthread_mutex_lock], [], AC_MSG_ERROR([libpthread is required]))
- fi
- 
-+AM_CONDITIONAL([ENABLE_STATIC], [test "$enable_static" != "no"])
-+
- AC_ARG_ENABLE([debug],
- 	AS_HELP_STRING([--disable-debug], [Do not include debugging statements]),
- 	[enable_debug="$enableval"], [enable_debug="yes"])
diff --git a/meta/recipes-support/libnl/libnl_3.6.0.bb b/meta/recipes-support/libnl/libnl_3.7.0.bb
similarity index 91%
rename from meta/recipes-support/libnl/libnl_3.6.0.bb
rename to meta/recipes-support/libnl/libnl_3.7.0.bb
index af3aa41040..ddcc83a039 100644
--- a/meta/recipes-support/libnl/libnl_3.6.0.bb
+++ b/meta/recipes-support/libnl/libnl_3.7.0.bb
@@ -14,14 +14,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "flex-native bison-native"
 
-SRC_URI = " \
-           https://github.com/thom311/${BPN}/releases/download/${BPN}${@d.getVar('PV').replace('.','_')}/${BP}.tar.gz \
+SRC_URI = "https://github.com/thom311/${BPN}/releases/download/${BPN}${@d.getVar('PV').replace('.','_')}/${BP}.tar.gz \
            file://enable-serial-tests.patch \
            file://run-ptest \
-           file://fa7f97f8982544c4fcb403893bae6701230d5165.patch \
-          "
+           "
 
-SRC_URI[sha256sum] = "532155fd011e5a805bd67121b87a01c757e2bb24112ac17e69cb86013b970009"
+SRC_URI[sha256sum] = "9fe43ccbeeea72c653bdcf8c93332583135cda46a79507bfd0a483bb57f65939"
 
 
 UPSTREAM_CHECK_URI = "https://github.com/thom311/${BPN}/releases"
-- 
2.31.1


--===============0436780956200741441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libnl/libnl-dev: FILELIST: added "/usr/include/libnl3/netlink/route/act/nat.h"
packages/core2-32-poky-linux/libnl/libnl-ptest: PKGSIZE changed from 450127 to 539151 (+20%)
Changes to packages/core2-32-poky-linux/libnl (sysroot):
  /usr/include/libnl3/netlink/route/act/nat.h was added

--===============0436780956200741441==--

