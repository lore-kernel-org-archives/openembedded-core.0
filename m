Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A3D3C7115A
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:14:51 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.8862.1749993281716509569
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:14:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=RY/9N4VA;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ZuARPW2D;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019773ba5685-8e89f71f-36df-4708-9033-48fa9273ee9f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993281;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9HJjrAPeWr67aNpRIuIdWmFa+2RZv9FbYdrU5g7h8xA=;
	b=RY/9N4VAwu74OFp7yjDrcXFXZtu6mLQTK05s+XKn7fx04pSj+I5OBmDGcGjTUOaA
	fHw1Q01T7JFBZGaig7hZhWz7161EN036KH0CX9nrJNHKw3tbMgLAP5KmwE83AWhC6qc
	wWerWeJX3/MeuBpmxQXo1Ou0O5LAH5+KyRexZRck=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993281;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9HJjrAPeWr67aNpRIuIdWmFa+2RZv9FbYdrU5g7h8xA=;
	b=ZuARPW2D1rd3iz2EUaIDBmVY67X8bRZg9WqxHKiAeA88pqqDJ9Z/GM3BE+bDeoWE
	kSPa+JEEy22xqFn/gx+QgKR5WyQc8lxcAiyDrWFvaAItjsX4xtPSoObODyNfKE2FZ1o
	Xn3wvYFao2ers6n0lq7MdBaxT8Jhj2OXdXaq6mVk=
Content-Type: multipart/mixed; boundary="===============0506698394072962787=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-modules: upgrading to 2.13.19 SUCCEEDED
Message-ID: <0101019773ba5685-8e89f71f-36df-4708-9033-48fa9273ee9f-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:14:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:14:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218658

--===============0506698394072962787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *lttng-modules* to *2.13.19* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lttng-modules-upgrade-2.13.18-2.13.19.patch
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

-- >8 --
From 5437ef6c4fd3d661b297cafdd29aadc3aca269f2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 06:59:50 +0000
Subject: [PATCH] lttng-modules: upgrade 2.13.18 -> 2.13.19

---
 ...ttng-modules-fix-sigaction-build-without-CONFIG_COM.patch | 5 +----
 ...rc-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch | 2 +-
 .../{lttng-modules_2.13.18.bb => lttng-modules_2.13.19.bb}   | 2 +-
 3 files changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.18.bb => lttng-modules_2.13.19.bb} (94%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-lttng-modules-fix-sigaction-build-without-CONFIG_COM.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-lttng-modules-fix-sigaction-build-without-CONFIG_COM.patch
index eb43abbae2..cc4f461624 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-lttng-modules-fix-sigaction-build-without-CONFIG_COM.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-lttng-modules-fix-sigaction-build-without-CONFIG_COM.patch
@@ -1,4 +1,4 @@
-From 0e2095bcc50e7a07d3478f8d3c0ae5ad46575594 Mon Sep 17 00:00:00 2001
+From df6f8d128fe4630ba0b8a0acd9eae494dedb0698 Mon Sep 17 00:00:00 2001
 From: Mikko Rapeli <mikko.rapeli@linaro.org>
 Date: Mon, 28 Apr 2025 12:07:24 +0000
 Subject: [PATCH] lttng-modules: fix sigaction build without
@@ -30,6 +30,3 @@ index 5f4ca5b..1514cae 100644
  #ifndef OVERRIDE_TABLE_32_sigpending
  TRACE_SYSCALL_TABLE(sigpending, sigpending, 73, 1)
  #endif
--- 
-2.49.0
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch
index 4911982461..f3c175c6c9 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch
@@ -1,4 +1,4 @@
-From 60d423945bd4f4c4b7bfc6f29da9231152d05690 Mon Sep 17 00:00:00 2001
+From a873167d9c1f1d6c0ce96c235fb179a56152d01a Mon Sep 17 00:00:00 2001
 From: Bruce Ashfield <bruce.ashfield@gmail.com>
 Date: Sat, 15 May 2021 10:26:38 -0400
 Subject: [PATCH] src/Kbuild: change missing CONFIG_TRACEPOINTS to warning
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.18.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.19.bb
similarity index 94%
rename from meta/recipes-kernel/lttng/lttng-modules_2.13.18.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.13.19.bb
index 1b2327f609..63ba488515 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.18.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.19.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch \
                 "
 
-SRC_URI[sha256sum] = "a2f38e289817dbd1d2f12cfc1f20390230e16d56323cb58cc1db9874ced400ed"
+SRC_URI[sha256sum] = "06d704633749039f8fa72a954bec6486058386e2a0c3557b22c484698f9b34d5"
 
 export INSTALL_MOD_DIR = "kernel/lttng-modules"
 
-- 
2.47.1


--===============0506698394072962787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-clock-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-clock-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-clock-plugin-test-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-clock-plugin-test-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-counter-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-counter-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-counter-client-percpu-32-modular-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-counter-client-percpu-32-modular-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-counter-client-percpu-64-modular-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-counter-client-percpu-64-modular-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-kprobes-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-kprobes-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-kretprobes-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-kretprobes-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-lib-ring-buffer-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-lib-ring-buffer-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-block-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-block-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-btrfs-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-btrfs-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-compaction-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-compaction-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-ext4-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-ext4-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-gpio-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-gpio-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-i2c-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-i2c-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-irq-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-irq-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-jbd2-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-jbd2-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-kmem-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-kmem-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-module-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-module-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-napi-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-napi-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-net-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-net-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-power-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-power-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-printk-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-printk-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-rcu-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-rcu-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-regmap-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-regmap-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-sched-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-sched-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-scsi-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-scsi-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-signal-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-signal-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-skb-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-skb-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-sock-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-sock-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-statedump-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-statedump-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-sunrpc-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-sunrpc-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-timer-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-timer-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-udp-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-udp-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-vmscan-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-vmscan-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-workqueue-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-workqueue-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-x86-exceptions-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-x86-exceptions-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-x86-irq-vectors-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-probe-x86-irq-vectors-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-client-discard-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-client-discard-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-client-mmap-discard-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-client-mmap-discard-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-client-mmap-overwrite-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-client-mmap-overwrite-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-client-overwrite-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-client-overwrite-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-event-notifier-client-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-event-notifier-client-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-metadata-client-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-metadata-client-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-metadata-mmap-client-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-metadata-mmap-client-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-statedump-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-statedump-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-test-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-test-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-test-6.12.31-yocto-standard: PKGSIZE changed from 31488 to 31560 (+0%)
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-tracer-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-tracer-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-tracer-6.12.31-yocto-standard: PKGSIZE changed from 6476384 to 6476496 (+0%)
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-uprobes-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-uprobes-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-wrapper-6.12.31-yocto-standard: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/kernel-module-lttng-wrapper-6.12.31-yocto-standard: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules: SRC_URI changed from "https://lttng.org/files/lttng-modules/lttng-modules-2.13.18.tar.bz2 file://0001-lttng-modules-fix-sigaction-build-without-CONFIG_COM.patch file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch" to "https://lttng.org/files/lttng-modules/lttng-modules-2.13.19.tar.bz2 file://0001-lttng-modules-fix-sigaction-build-without-CONFIG_COM.patch file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch"
packages/qemux86_64-poky-linux/lttng-modules: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/lttng-modules-dbg: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/lttng-modules-dbg: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/lttng-modules-dbg: PKGSIZE changed from 69671440 to 69672584 (+0%)
packages/qemux86_64-poky-linux/lttng-modules/lttng-modules-dev: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/lttng-modules-dev: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/lttng-modules-doc: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/lttng-modules-doc: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/lttng-modules-locale: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/lttng-modules-locale: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/lttng-modules-src: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/lttng-modules-src: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/lttng-modules-src: FILELIST: directory renamed /usr/src/debug/lttng-modules/2.13.18/src/tests/clock-plugin -> /usr/src/debug/lttng-modules/2.13.19/src/tests/clock-plugin, directory renamed /usr/src/debug/lttng-modules/2.13.18/src/lib/prio_heap -> /usr/src/debug/lttng-modules/2.13.19/src/lib/prio_heap, directory renamed /usr/src/debug/lttng-modules/2.13.18/src/lib/msgpack -> /usr/src/debug/lttng-modules/2.13.19/src/lib/msgpack, directory renamed /usr/src/debug/lttng-modules/2.13.18/include/counter -> /usr/src/debug/lttng-modules/2.13.19/include/counter, directory renamed /usr/src/debug/lttng-modules/2.13.18/src/lib -> /usr/src/debug/lttng-modules/2.13.19/src/lib, directory renamed /usr/src/debug/lttng-modules/2.13.18/include/instrumentation/syscalls/headers -> /usr/src/debug/lttng-modules/2.13.19/include/instrumentation/syscalls/headers, directory renamed /usr/src/debug/lttng-modules/2.13.18/include/instrumentation/events -> /usr/src/debug/
 lttng-modules/2.13.19/include/instrumentation/events, directory renamed /usr/src/debug/lttng-modules/2.13.18/src/wrapper -> /usr/src/debug/lttng-modules/2.13.19/src/wrapper, directory renamed /usr/src/debug/lttng-modules/2.13.18/src/lib/ringbuffer -> /usr/src/debug/lttng-modules/2.13.19/src/lib/ringbuffer, directory renamed /usr/src/debug/lttng-modules/2.13.18/include/ringbuffer -> /usr/src/debug/lttng-modules/2.13.19/include/ringbuffer, directory renamed /usr/src/debug/lttng-modules/2.13.18/include/instrumentation/events/arch/x86 -> /usr/src/debug/lttng-modules/2.13.19/include/instrumentation/events/arch/x86, directory renamed /usr/src/debug/lttng-modules/2.13.18/src -> /usr/src/debug/lttng-modules/2.13.19/src, directory renamed /usr/src/debug/lttng-modules/2.13.18/src/tests -> /usr/src/debug/lttng-modules/2.13.19/src/tests, directory renamed /usr/src/debug/lttng-modules/2.13.18/src/tests/probes -> /usr/src/debug/lttng-modules/2.13.19/src/tests/probes, directory renamed /usr/src/de
 bug/lttng-modules/2.13.18/src/lib/counter -> /usr/src/debug/lttng-modules/2.13.19/src/lib/counter, directory renamed /usr/src/debug/lttng-modules/2.13.18/include/lttng -> /usr/src/debug/lttng-modules/2.13.19/include/lttng, directory renamed /usr/src/debug/lttng-modules/2.13.18/src/probes -> /usr/src/debug/lttng-modules/2.13.19/src/probes, removed "/usr/src/debug/lttng-modules/2.13.18/include/wrapper/uuid.h /usr/src/debug/lttng-modules/2.13.18/include/wrapper/trace-clock.h /usr/src/debug/lttng-modules/2.13.18/include/wrapper/kprobes.h /usr/src/debug/lttng-modules/2.13.18/include/wrapper/vmalloc.h /usr/src/debug/lttng-modules/2.13.18/include/wrapper/file.h /usr/src/debug/lttng-modules/2.13.18/include/wrapper/file_ref.h /usr/src/debug/lttng-modules/2.13.18/include/wrapper/fs.h /usr/src/debug/lttng-modules/2.13.18/include/wrapper/mm.h /usr/src/debug/lttng-modules/2.13.18/include/wrapper/irqdesc.h /usr/src/debug/lttng-modules/2.13.18/include/wrapper/kref.h /usr/src/debug/lttng-modules/2.
 13.18/include/wrapper/perf.h /usr/src/debug/lttng-modules/2.13.18/include/wrapper/genhd.h /usr/src/debug/lttng-modules/2.13.18/include/wrapper/atomic.h /usr/src/debug/lttng-modules/2.13.18/include/wrapper/splice.h /usr/src/debug/lttng-modules/2.13.18/include/wrapper/fdtable.h /usr/src/debug/lttng-modules/2.13.18/include/wrapper/kallsyms.h /usr/src/debug/lttng-modules/2.13.18/include/wrapper/user_namespace.h /usr/src/debug/lttng-modules/2.13.18/include/wrapper/cpu.h /usr/src/debug/lttng-modules/2.13.18/include/wrapper/ibt.h /usr/src/debug/lttng-modules/2.13.18/include/wrapper/tracepoint.h /usr/src/debug/lttng-modules/2.13.18/include/wrapper/irqflags.h /usr/src/debug/lttng-modules/2.13.18/include/wrapper/random.h /usr/src/debug/lttng-modules/2.13.18/include/wrapper/page_alloc.h", added "/usr/src/debug/lttng-modules/2.13.19/include/wrapper/uuid.h /usr/src/debug/lttng-modules/2.13.19/include/wrapper/trace-clock.h /usr/src/debug/lttng-modules/2.13.19/include/wrapper/kprobes.h /usr/src/de
 bug/lttng-modules/2.13.19/include/wrapper/vmalloc.h /usr/src/debug/lttng-modules/2.13.19/include/wrapper/file.h /usr/src/debug/lttng-modules/2.13.19/include/wrapper/file_ref.h /usr/src/debug/lttng-modules/2.13.19/include/wrapper/fs.h /usr/src/debug/lttng-modules/2.13.19/include/wrapper/mm.h /usr/src/debug/lttng-modules/2.13.19/include/wrapper/irqdesc.h /usr/src/debug/lttng-modules/2.13.19/include/wrapper/timer.h /usr/src/debug/lttng-modules/2.13.19/include/wrapper/kref.h /usr/src/debug/lttng-modules/2.13.19/include/wrapper/perf.h /usr/src/debug/lttng-modules/2.13.19/include/wrapper/genhd.h /usr/src/debug/lttng-modules/2.13.19/include/wrapper/atomic.h /usr/src/debug/lttng-modules/2.13.19/include/wrapper/splice.h /usr/src/debug/lttng-modules/2.13.19/include/wrapper/fdtable.h /usr/src/debug/lttng-modules/2.13.19/include/wrapper/kallsyms.h /usr/src/debug/lttng-modules/2.13.19/include/wrapper/user_namespace.h /usr/src/debug/lttng-modules/2.13.19/include/wrapper/cpu.h /usr/src/debug/lttng
 -modules/2.13.19/include/wrapper/ibt.h /usr/src/debug/lttng-modules/2.13.19/include/wrapper/tracepoint.h /usr/src/debug/lttng-modules/2.13.19/include/wrapper/irqflags.h /usr/src/debug/lttng-modules/2.13.19/include/wrapper/random.h /usr/src/debug/lttng-modules/2.13.19/include/wrapper/page_alloc.h"
packages/qemux86_64-poky-linux/lttng-modules/lttng-modules-src: PKGSIZE changed from 2126766 to 2129941 (+0%)
packages/qemux86_64-poky-linux/lttng-modules/lttng-modules-staticdev: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/lttng-modules-staticdev: PKGV changed from 2.13.18 [default] to 2.13.19 [default]
packages/qemux86_64-poky-linux/lttng-modules/lttng-modules: PV changed from "2.13.18" to "2.13.19"
packages/qemux86_64-poky-linux/lttng-modules/lttng-modules: PKGV changed from 2.13.18 [default] to 2.13.19 [default]

--===============0506698394072962787==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lttng-modules-upgrade-2.13.18-2.13.19.patch"

RnJvbSA1NDM3ZWY2YzRmZDNkNjYxYjI5N2NhZmRkMjlhYWRjM2FjYTI2OWYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMDY6NTk6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
dHRuZy1tb2R1bGVzOiB1cGdyYWRlIDIuMTMuMTggLT4gMi4xMy4xOQoKLS0tCiAuLi50dG5nLW1v
ZHVsZXMtZml4LXNpZ2FjdGlvbi1idWlsZC13aXRob3V0LUNPTkZJR19DT00ucGF0Y2ggfCA1ICst
LS0tCiAuLi5yYy1LYnVpbGQtY2hhbmdlLW1pc3NpbmctQ09ORklHX1RSQUNFUE9JTlRTLXRvLXdh
cm4ucGF0Y2ggfCAyICstCiAuLi4ve2x0dG5nLW1vZHVsZXNfMi4xMy4xOC5iYiA9PiBsdHRuZy1t
b2R1bGVzXzIuMTMuMTkuYmJ9ICAgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgNiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL3ts
dHRuZy1tb2R1bGVzXzIuMTMuMTguYmIgPT4gbHR0bmctbW9kdWxlc18yLjEzLjE5LmJifSAoOTQl
KQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0bmctbW9kdWxlcy8w
MDAxLWx0dG5nLW1vZHVsZXMtZml4LXNpZ2FjdGlvbi1idWlsZC13aXRob3V0LUNPTkZJR19DT00u
cGF0Y2ggYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5nLW1vZHVsZXMvMDAwMS1sdHRu
Zy1tb2R1bGVzLWZpeC1zaWdhY3Rpb24tYnVpbGQtd2l0aG91dC1DT05GSUdfQ09NLnBhdGNoCmlu
ZGV4IGViNDNhYmJhZTIuLmNjNGY0NjE2MjQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJu
ZWwvbHR0bmcvbHR0bmctbW9kdWxlcy8wMDAxLWx0dG5nLW1vZHVsZXMtZml4LXNpZ2FjdGlvbi1i
dWlsZC13aXRob3V0LUNPTkZJR19DT00ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9s
dHRuZy9sdHRuZy1tb2R1bGVzLzAwMDEtbHR0bmctbW9kdWxlcy1maXgtc2lnYWN0aW9uLWJ1aWxk
LXdpdGhvdXQtQ09ORklHX0NPTS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMGUyMDk1YmNj
NTBlN2EwN2QzNDc4ZjhkM2MwYWU1YWQ0NjU3NTU5NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gZGY2ZjhkMTI4ZmU0NjMwYmEwYjhhMGFjZDllYWU0OTRkZWRiMDY5OCBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IE1pa2tvIFJhcGVsaSA8bWlra28ucmFwZWxpQGxpbmFyby5v
cmc+CiBEYXRlOiBNb24sIDI4IEFwciAyMDI1IDEyOjA3OjI0ICswMDAwCiBTdWJqZWN0OiBbUEFU
Q0hdIGx0dG5nLW1vZHVsZXM6IGZpeCBzaWdhY3Rpb24gYnVpbGQgd2l0aG91dApAQCAtMzAsNiAr
MzAsMyBAQCBpbmRleCA1ZjRjYTViLi4xNTE0Y2FlIDEwMDY0NAogICNpZm5kZWYgT1ZFUlJJREVf
VEFCTEVfMzJfc2lncGVuZGluZwogIFRSQUNFX1NZU0NBTExfVEFCTEUoc2lncGVuZGluZywgc2ln
cGVuZGluZywgNzMsIDEpCiAgI2VuZGlmCi0tLSAKLTIuNDkuMAotCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5nLW1vZHVsZXMvMDAwMS1zcmMtS2J1aWxkLWNoYW5n
ZS1taXNzaW5nLUNPTkZJR19UUkFDRVBPSU5UUy10by13YXJuLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWtlcm5lbC9sdHRuZy9sdHRuZy1tb2R1bGVzLzAwMDEtc3JjLUtidWlsZC1jaGFuZ2UtbWlzc2lu
Zy1DT05GSUdfVFJBQ0VQT0lOVFMtdG8td2Fybi5wYXRjaAppbmRleCA0OTExOTgyNDYxLi5mM2Mx
NzVjNmM5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5nLW1vZHVs
ZXMvMDAwMS1zcmMtS2J1aWxkLWNoYW5nZS1taXNzaW5nLUNPTkZJR19UUkFDRVBPSU5UUy10by13
YXJuLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0bmctbW9kdWxlcy8w
MDAxLXNyYy1LYnVpbGQtY2hhbmdlLW1pc3NpbmctQ09ORklHX1RSQUNFUE9JTlRTLXRvLXdhcm4u
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDYwZDQyMzk0NWJkNGY0YzRiN2JmYzZmMjlkYTky
MzExNTJkMDU2OTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGE4NzMxNjdkOWMxZjFk
NmMwY2U5NmMyMzVmYjE3OWE1NjE1MmQwMWEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2UuYXNoZmllbGRAZ21haWwuY29tPgogRGF0ZTogU2F0LCAx
NSBNYXkgMjAyMSAxMDoyNjozOCAtMDQwMAogU3ViamVjdDogW1BBVENIXSBzcmMvS2J1aWxkOiBj
aGFuZ2UgbWlzc2luZyBDT05GSUdfVFJBQ0VQT0lOVFMgdG8gd2FybmluZwpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9sdHRuZy1tb2R1bGVzXzIuMTMuMTguYmIgYi9tZXRh
L3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5nLW1vZHVsZXNfMi4xMy4xOS5iYgpzaW1pbGFyaXR5
IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5nLW1v
ZHVsZXNfMi4xMy4xOC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9sdHRu
Zy1tb2R1bGVzXzIuMTMuMTkuYmIKaW5kZXggMWIyMzI3ZjYwOS4uNjNiYTQ4ODUxNSAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9sdHRuZy1tb2R1bGVzXzIuMTMuMTguYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9sdHRuZy1tb2R1bGVzXzIuMTMuMTkuYmIK
QEAgLTE3LDcgKzE3LDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2x0dG5nLm9yZy9maWxlcy8ke0JQ
Tn0vJHtCUE59LSR7UFZ9LnRhci5iejIgXAogU1JDX1VSSTphcHBlbmQgPSAiIGZpbGU6Ly8wMDAx
LXNyYy1LYnVpbGQtY2hhbmdlLW1pc3NpbmctQ09ORklHX1RSQUNFUE9JTlRTLXRvLXdhcm4ucGF0
Y2ggXAogICAgICAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImEyZjM4ZTI4
OTgxN2RiZDFkMmYxMmNmYzFmMjAzOTAyMzBlMTZkNTYzMjNjYjU4Y2MxZGI5ODc0Y2VkNDAwZWQi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDZkNzA0NjMzNzQ5MDM5ZjhmYTcyYTk1NGJlYzY0ODYw
NTgzODZlMmEwYzM1NTdiMjJjNDg0Njk4ZjliMzRkNSIKIAogZXhwb3J0IElOU1RBTExfTU9EX0RJ
UiA9ICJrZXJuZWwvbHR0bmctbW9kdWxlcyIKIAotLSAKMi40Ny4xCgo=

--===============0506698394072962787==--

