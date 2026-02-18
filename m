Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 149DEE9A05E
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:47 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1420.1771440098325640533
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=vQ1Ko2jn;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Z9zg8++Q;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019c720ec958-2397828f-7c04-4eb4-ac3e-ef4cd75579b1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440097;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Un3qpK5oyjCrdwiTEa4QQPMS4h7jvKV2icpFVkFvIis=;
	b=vQ1Ko2jnj3zeC5cIg6uTVglYUa/ZpI6DnqxCJTtriXSY2pljrmZoT0nvcMXFYp2G
	7JC6D/0E9DUSVQaYBpTz4WCpjQ6ul7BBpjn2wrDiq8dePZjehud21Tv50jcb1dDQ3Dj
	CF16XbQOEF7OrshHwVK7p+cSCJheiKax1RalZJMk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440097;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Un3qpK5oyjCrdwiTEa4QQPMS4h7jvKV2icpFVkFvIis=;
	b=Z9zg8++Qcb79digeVwULYxILyKq51f9zhOtdiv2+DrY4u52xrfNWge9MkvAACrwp
	3cMnHwMnfqVGiSr2wSThrSS+KiBIDQqiEDzvq03iEI6FZN4CzASAhJYNRLxoLzODpP0
	OpNHnG0mcSzzlDz13yPw/XVMBGx7vS3O+so+ybVc=
Content-Type: multipart/mixed; boundary="===============2407477074250917592=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] connman: upgrading to 2.0 SUCCEEDED
Message-ID: <0101019c720ec958-2397828f-7c04-4eb4-ac3e-ef4cd75579b1-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231336

--===============2407477074250917592==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *connman* to *2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-connman-upgrade-1.45-2.0.patch
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
From 391e453a205afe210e265d766226be52b56c76c1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 11:36:59 +0000
Subject: [PATCH] connman: upgrade 1.45 -> 2.0

---
 ...man-vpn-avoid-hiding-implementation-reserved-sym.patch | 5 +----
 .../0002-resolve-musl-does-not-implement-res_ninit.patch  | 2 +-
 .../connman/connman/no-version-scripts.patch              | 8 ++++----
 .../connman/{connman_1.45.bb => connman_2.0.bb}           | 2 +-
 4 files changed, 7 insertions(+), 10 deletions(-)
 mode change 100755 => 100644 meta/recipes-connectivity/connman/connman/0001-connman-vpn-avoid-hiding-implementation-reserved-sym.patch
 rename meta/recipes-connectivity/connman/{connman_1.45.bb => connman_2.0.bb} (99%)

diff --git a/meta/recipes-connectivity/connman/connman/0001-connman-vpn-avoid-hiding-implementation-reserved-sym.patch b/meta/recipes-connectivity/connman/connman/0001-connman-vpn-avoid-hiding-implementation-reserved-sym.patch
old mode 100755
new mode 100644
index 3b7b5a096e..6940e81006
--- a/meta/recipes-connectivity/connman/connman/0001-connman-vpn-avoid-hiding-implementation-reserved-sym.patch
+++ b/meta/recipes-connectivity/connman/connman/0001-connman-vpn-avoid-hiding-implementation-reserved-sym.patch
@@ -1,4 +1,4 @@
-From eac489c872c775c88bbd85b4cec6c1d47ad9e6a6 Mon Sep 17 00:00:00 2001
+From 37ccc55f9493bdcd31bcca29ac35347ca156da2d Mon Sep 17 00:00:00 2001
 From: Peter Tatrai <peter.tatrai.ext@siemens.com>
 Date: Sun, 7 Sep 2025 09:25:20 +0200
 Subject: [PATCH] connman, vpn: avoid hiding implementation-reserved symbols
@@ -45,6 +45,3 @@ index b887706..5cad344 100644
 -		*;
 +		[!_]*;
  };
--- 
-2.47.2
-
diff --git a/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch b/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
index 2c612039ee..a75b55d6e7 100644
--- a/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
+++ b/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
@@ -1,4 +1,4 @@
-From 4e726a5aaa75d60fab6a56bc37dbec48be53ff79 Mon Sep 17 00:00:00 2001
+From 16caa22ca9ec9ccd735cf9743dfb70b59b87ef66 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 6 Apr 2015 23:02:21 -0700
 Subject: [PATCH] gweb/gresolv.c: make use of res_ninit optional and subject to
diff --git a/meta/recipes-connectivity/connman/connman/no-version-scripts.patch b/meta/recipes-connectivity/connman/connman/no-version-scripts.patch
index c96ab311e5..54d1fe2c58 100644
--- a/meta/recipes-connectivity/connman/connman/no-version-scripts.patch
+++ b/meta/recipes-connectivity/connman/connman/no-version-scripts.patch
@@ -1,4 +1,4 @@
-From 67f37aafcc8ef5d2eb006387e7bec21f74518727 Mon Sep 17 00:00:00 2001
+From 6a5ac5476207fa745f9a2890042cc98dd892b999 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 9 Aug 2016 12:12:02 +0100
 Subject: [PATCH] connman: disable version-scripts to fix crashes at startup
@@ -23,10 +23,10 @@ Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
  1 file changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 3dc3bb5..3be5ccb 100644
+index 1e44314..f5366ad 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -143,8 +143,7 @@ src_connmand_LDADD = gdbus/libgdbus-internal.la $(builtin_libadd) \
+@@ -142,8 +142,7 @@ src_connmand_LDADD = gdbus/libgdbus-internal.la $(builtin_libadd) \
  			@GIO_LIBS@ @GLIB_LIBS@ @DBUS_LIBS@ @GNUTLS_LIBS@ \
  			-lresolv -ldl -lrt
  
@@ -36,7 +36,7 @@ index 3dc3bb5..3be5ccb 100644
  
  src_connmand_wait_online_SOURCES = src/connmand-wait-online.c
  
-@@ -187,8 +186,7 @@ vpn_connman_vpnd_LDADD = gdbus/libgdbus-internal.la $(builtin_vpn_libadd) \
+@@ -186,8 +185,7 @@ vpn_connman_vpnd_LDADD = gdbus/libgdbus-internal.la $(builtin_vpn_libadd) \
  				@GIO_LIBS@ @GLIB_LIBS@ @DBUS_LIBS@ @GNUTLS_LIBS@ \
  				-lresolv -ldl
  
diff --git a/meta/recipes-connectivity/connman/connman_1.45.bb b/meta/recipes-connectivity/connman/connman_2.0.bb
similarity index 99%
rename from meta/recipes-connectivity/connman/connman_1.45.bb
rename to meta/recipes-connectivity/connman/connman_2.0.bb
index ca0337b4d3..6f7093301b 100644
--- a/meta/recipes-connectivity/connman/connman_1.45.bb
+++ b/meta/recipes-connectivity/connman/connman_2.0.bb
@@ -25,7 +25,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://0002-resolve-musl-does-not-implement-res_ninit.patch \
            "
 
-SRC_URI[sha256sum] = "77128cce80865455c4f106b5901a575e2dfdb35a7d2e2e2996f16e85cba10913"
+SRC_URI[sha256sum] = "d25c2ddc0b5ad13e986ec35ad765ae8d2f4b7acb47c958a05616c943cd082527"
 
 RRECOMMENDS:${PN} = "connman-conf"
 RCONFLICTS:${PN} = "networkmanager"
-- 
2.47.1


--===============2407477074250917592==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/connman/connman-dev: FILELIST: removed "/usr/include/connman/device.h /usr/include/connman/notifier.h /usr/include/connman/agent.h /usr/include/connman/ipconfig.h /usr/include/connman/provision.h /usr/include/connman/inet.h /usr/include/connman/plugin.h /usr/include/connman/storage.h /usr/include/connman/session.h /usr/include/connman/resolver.h /usr/include/connman/inotify.h /usr/include/connman/peer.h /usr/include/connman/network.h /usr/include/connman/tethering.h /usr/include/connman/ipaddress.h /usr/include/connman/acd.h /usr/include/connman/log.h /usr/include/connman/version.h /usr/include/connman/service.h /usr/include/connman/machine.h"
packages/x86-64-v3-poky-linux/connman/connman-dev: PKGSIZE changed from 57457 to 324 (-99%)
Changes to packages/x86-64-v3-poky-linux/connman (sysroot):
  /usr/include was removed
  /usr/include/connman was removed
  /usr/include/connman/acd.h was removed
  /usr/include/connman/agent.h was removed
  /usr/include/connman/device.h was removed
  /usr/include/connman/inet.h was removed
  /usr/include/connman/inotify.h was removed
  /usr/include/connman/ipaddress.h was removed
  /usr/include/connman/ipconfig.h was removed
  /usr/include/connman/log.h was removed
  /usr/include/connman/machine.h was removed
  /usr/include/connman/network.h was removed
  /usr/include/connman/notifier.h was removed
  /usr/include/connman/peer.h was removed
  /usr/include/connman/plugin.h was removed
  /usr/include/connman/provision.h was removed
  /usr/include/connman/resolver.h was removed
  /usr/include/connman/service.h was removed
  /usr/include/connman/session.h was removed
  /usr/include/connman/storage.h was removed
  /usr/include/connman/tethering.h was removed
  /usr/include/connman/version.h was removed

--===============2407477074250917592==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/connman/connman-client: PKGV changed from 1.45 [default] to 2.0 [default]
packages/x86-64-v3-poky-linux/connman/connman-client: PV changed from "1.45" to "2.0"
packages/x86-64-v3-poky-linux/connman/connman-dbg: PKGV changed from 1.45 [default] to 2.0 [default]
packages/x86-64-v3-poky-linux/connman/connman-dbg: PKGSIZE changed from 6039616 to 6040520 (+0%)
packages/x86-64-v3-poky-linux/connman/connman-dbg: PV changed from "1.45" to "2.0"
packages/x86-64-v3-poky-linux/connman/connman-dev: PKGV changed from 1.45 [default] to 2.0 [default]
packages/x86-64-v3-poky-linux/connman/connman-dev: PKGSIZE changed from 57457 to 324 (-99%)
packages/x86-64-v3-poky-linux/connman/connman-dev: PV changed from "1.45" to "2.0"
packages/x86-64-v3-poky-linux/connman/connman-dev: FILELIST: removed "/usr/include/connman/service.h /usr/include/connman/provision.h /usr/include/connman/storage.h /usr/include/connman/tethering.h /usr/include/connman/version.h /usr/include/connman/network.h /usr/include/connman/notifier.h /usr/include/connman/plugin.h /usr/include/connman/inotify.h /usr/include/connman/log.h /usr/include/connman/acd.h /usr/include/connman/device.h /usr/include/connman/inet.h /usr/include/connman/ipconfig.h /usr/include/connman/agent.h /usr/include/connman/machine.h /usr/include/connman/resolver.h /usr/include/connman/peer.h /usr/include/connman/session.h /usr/include/connman/ipaddress.h"
packages/x86-64-v3-poky-linux/connman/connman-doc: PKGV changed from 1.45 [default] to 2.0 [default]
packages/x86-64-v3-poky-linux/connman/connman-doc: PKGSIZE changed from 51962 to 52174 (+0%)
packages/x86-64-v3-poky-linux/connman/connman-doc: PV changed from "1.45" to "2.0"
packages/x86-64-v3-poky-linux/connman/connman-locale: PKGV changed from 1.45 [default] to 2.0 [default]
packages/x86-64-v3-poky-linux/connman/connman-locale: PV changed from "1.45" to "2.0"
packages/x86-64-v3-poky-linux/connman/connman-src: PKGV changed from 1.45 [default] to 2.0 [default]
packages/x86-64-v3-poky-linux/connman/connman-src: PKGSIZE changed from 2936879 to 2938007 (+0%)
packages/x86-64-v3-poky-linux/connman/connman-src: PV changed from "1.45" to "2.0"
packages/x86-64-v3-poky-linux/connman/connman-src: FILELIST: directory renamed /usr/src/debug/connman/1.45/gsupplicant -> /usr/src/debug/connman/2.0/gsupplicant, directory renamed /usr/src/debug/connman/1.45/src/shared -> /usr/src/debug/connman/2.0/src/shared, directory renamed /usr/src/debug/connman/1.45/plugins -> /usr/src/debug/connman/2.0/plugins, directory renamed /usr/src/debug/connman/1.45/src -> /usr/src/debug/connman/2.0/src, directory renamed /usr/src/debug/connman/1.45/gdbus -> /usr/src/debug/connman/2.0/gdbus, directory renamed /usr/src/debug/connman/1.45/client -> /usr/src/debug/connman/2.0/client, directory renamed /usr/src/debug/connman/1.45/gweb -> /usr/src/debug/connman/2.0/gweb, directory renamed /usr/src/debug/connman/1.45/include -> /usr/src/debug/connman/2.0/include, directory renamed /usr/src/debug/connman/1.45/gdhcp -> /usr/src/debug/connman/2.0/gdhcp, directory renamed /usr/src/debug/connman/1.45/tools -> /usr/src/debug/connman/2.0/tools
packages/x86-64-v3-poky-linux/connman/connman-staticdev: PKGV changed from 1.45 [default] to 2.0 [default]
packages/x86-64-v3-poky-linux/connman/connman-staticdev: PV changed from "1.45" to "2.0"
packages/x86-64-v3-poky-linux/connman/connman-tests: PKGV changed from 1.45 [default] to 2.0 [default]
packages/x86-64-v3-poky-linux/connman/connman-tests: PV changed from "1.45" to "2.0"
packages/x86-64-v3-poky-linux/connman/connman-tools: PKGV changed from 1.45 [default] to 2.0 [default]
packages/x86-64-v3-poky-linux/connman/connman-tools: PV changed from "1.45" to "2.0"
packages/x86-64-v3-poky-linux/connman/connman-vpn: PKGV changed from 1.45 [default] to 2.0 [default]
packages/x86-64-v3-poky-linux/connman/connman-vpn: PV changed from "1.45" to "2.0"
packages/x86-64-v3-poky-linux/connman/connman-wait-online: PKGV changed from 1.45 [default] to 2.0 [default]
packages/x86-64-v3-poky-linux/connman/connman-wait-online: PV changed from "1.45" to "2.0"
packages/x86-64-v3-poky-linux/connman/connman: PKGV changed from 1.45 [default] to 2.0 [default]
packages/x86-64-v3-poky-linux/connman/connman: PKGSIZE changed from 1085096 to 1085160 (+0%)
packages/x86-64-v3-poky-linux/connman/connman: PV changed from "1.45" to "2.0"
packages/x86-64-v3-poky-linux/connman: PKGV changed from 1.45 [default] to 2.0 [default]
packages/x86-64-v3-poky-linux/connman: SRC_URI changed from "https://cdn.kernel.org/pub/linux/network/connman/connman-1.45.tar.xz file://connman file://no-version-scripts.patch file://0001-connman-vpn-avoid-hiding-implementation-reserved-sym.patch file://0002-resolve-musl-does-not-implement-res_ninit.patch" to "https://cdn.kernel.org/pub/linux/network/connman/connman-2.0.tar.xz file://connman file://no-version-scripts.patch file://0001-connman-vpn-avoid-hiding-implementation-reserved-sym.patch file://0002-resolve-musl-does-not-implement-res_ninit.patch"
packages/x86-64-v3-poky-linux/connman: PV changed from "1.45" to "2.0"
Changes to packages/x86-64-v3-poky-linux/connman (sysroot):
  /usr/include was removed
  /usr/include/connman was removed
  /usr/include/connman/acd.h was removed
  /usr/include/connman/agent.h was removed
  /usr/include/connman/device.h was removed
  /usr/include/connman/inet.h was removed
  /usr/include/connman/inotify.h was removed
  /usr/include/connman/ipaddress.h was removed
  /usr/include/connman/ipconfig.h was removed
  /usr/include/connman/log.h was removed
  /usr/include/connman/machine.h was removed
  /usr/include/connman/network.h was removed
  /usr/include/connman/notifier.h was removed
  /usr/include/connman/peer.h was removed
  /usr/include/connman/plugin.h was removed
  /usr/include/connman/provision.h was removed
  /usr/include/connman/resolver.h was removed
  /usr/include/connman/service.h was removed
  /usr/include/connman/session.h was removed
  /usr/include/connman/storage.h was removed
  /usr/include/connman/tethering.h was removed
  /usr/include/connman/version.h was removed

--===============2407477074250917592==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1953 targets, 64 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-476ed557443a4fdd807e74fce04fb8ddd59ea862"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:476ed557443a4fdd807e74fce04fb8ddd59ea862"
meta-yocto-bsp       
meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 660 Local 502 Mirrors 0 Missed 158 Current 236 (76% match, 82% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 340 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 359 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 896 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pigz/pigz_2.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 391 of 896 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 395 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 396 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 397 of 896 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 400 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbus_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 402 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 403 of 896 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bc/bc_1.08.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 406 of 896 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 407 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 409 of 896 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_create_spdx_setscene)
NOTE: Running setscene task 411 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 412 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 413 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pigz-native-2.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-dbus-1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pygobject-3.54.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmpc-native-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-native-34.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe bc-native-1.08.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libical-native-3.0.20-r0: task do_create_spdx_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-native-2.41.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 415 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-dbus-1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 423 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 428 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_create_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 429 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-pygobject-3.54.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 430 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 436 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 438 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbus_1.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-native-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 439 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_spdx_setscene)
NOTE: recipe kmod-native-34.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 462 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_create_spdx_setscene)
NOTE: recipe bc-native-1.08.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 464 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 466 of 896 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: recipe libical-native-3.0.20-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 468 of 896 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bc/bc_1.08.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-native-2.41.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 469 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_create_spdx_setscene)
NOTE: recipe pigz-native-2.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 477 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnutls-3.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 479 of 896 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-dbus-1.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe iptables-1.8.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pygobject-3.54.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-native-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bc-native-1.08.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 483 of 896 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pigz/pigz_2.8.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 484 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-dbus-1.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 488 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/ofono/ofono_2.19.bb:do_recipe_qa_setscene)
NOTE: recipe iptables-1.8.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 497 of 896 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 507 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 508 of 896 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.15.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 513 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ell/ell_0.81.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-native-3.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pygobject-3.54.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 518 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-native-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 519 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 522 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 523 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 528 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe kern-tools-native-0.3+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-native-3.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pigz-native-2.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ofono-2.19-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 529 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 530 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe bc-native-1.08.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe ell-0.81-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 532 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_create_spdx_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20251101-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-native-5.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-native-78.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pigz-native-2.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 533 of 896 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bc/bc_1.08.2.bb:do_recipe_qa_setscene)
NOTE: recipe ofono-2.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 534 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe ell-0.81-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 538 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kern-tools-native-0.3+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20251101-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 541 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 542 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_spdx_setscene)
NOTE: recipe xz-native-5.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 543 of 896 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.53.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 547 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_recipe_qa_setscene)
NOTE: recipe icu-native-78.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 548 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 553 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 555 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 556 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 558 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_packagedata_setscene)
NOTE: recipe bc-native-1.08.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 559 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.4.bb:do_create_spdx_setscene)
NOTE: recipe kern-tools-native-0.3+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 564 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_create_spdx_setscene)
NOTE: recipe git-native-2.53.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 566 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bc-native-1.08.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 567 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 569 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_package_setscene)
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kern-tools-native-0.3+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.7.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.7.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 570 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 573 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 575 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 580 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 582 of 896 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 584 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 585 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 586 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_package_setscene)
NOTE: Running setscene task 587 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 588 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 590 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 594 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 596 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe freetype-2.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libical-native-3.0.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.3-r0: task do_package_setscene: Started
NOTE: recipe gnutls-3.8.12-r0: task do_package_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 599 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 600 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 601 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 604 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 605 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 609 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 610 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 611 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 614 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 615 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_packagedata_setscene)
NOTE: recipe git-native-2.53.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 616 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 620 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-native-3.0.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 621 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 624 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 625 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 628 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 629 of 896 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 630 of 896 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.53.0.bb:do_recipe_qa_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libx11/1.8.12/temp/log.do_packagedata_setscene.1619613
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 633 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 634 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 635 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 636 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 638 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 641 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 643 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.54-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-native-78.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe git-native-2.53.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 644 of 896 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 645 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.14.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe git-native-2.53.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 646 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_package_setscene)
NOTE: recipe libpng-1.6.54-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 647 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 650 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe freetype-2.14.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 651 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 652 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.3-r0: task do_package_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 654 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libical-native-3.0.20-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 655 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.54-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 657 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_package_setscene: Started
NOTE: Running setscene task 660 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-native-3.0.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 661 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.54-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 663 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 665 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 666 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 667 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 668 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 669 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 671 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_package_setscene)
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 674 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 675 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 676 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-native-78.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 679 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 681 of 896 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 683 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 684 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.54-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_package_setscene: Started
NOTE: Running setscene task 686 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 688 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 689 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 690 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 691 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.54-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 694 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 695 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-native-78.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-native-78.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libcap-ng/0.9/temp/log.do_packagedata_setscene.1620725
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 701 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.bb:do_package_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 703 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: Running task 679 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb:do_fetch)
NOTE: Running task 796 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb:do_write_config)
NOTE: Running task 848 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_fetch)
NOTE: Running task 850 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_fetch)
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 705 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 706 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 707 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 708 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 709 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 710 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.9-r0: task do_package_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 711 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.2.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_write_config: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 712 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_fetch: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 713 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_fetch: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 714 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_write_config: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 715 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 716 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.51.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 717 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 718 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 720 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 721 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.4.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 723 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.51.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 725 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 726 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 728 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 730 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 731 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_package_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 732 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 736 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.51.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.9-r0: task do_package_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 737 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 738 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 739 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 740 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 747 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 750 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 755 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 757 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.2.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 758 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 760 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 761 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 762 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 763 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.4.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 764 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 767 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 771 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 772 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 773 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 775 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 777 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 779 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 780 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 781 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 782 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 784 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 785 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 786 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 787 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 788 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 947 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb:do_unpack)
NOTE: Running task 959 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_unpack)
NOTE: Running task 960 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_unpack)
NOTE: Running task 966 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_write_config)
NOTE: Running task 967 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_write_config)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 792 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 793 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1010 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_recipe_qa)
NOTE: Running task 1034 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1046 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_fetch)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 796 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_unpack: Started
NOTE: recipe shadow-4.18.0-r0: task do_package_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 797 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_write_config: Started
NOTE: Running setscene task 798 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 800 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_write_config: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.12-r0: task do_package_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 801 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe icu-78.2-r0: task do_recipe_qa: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_write_config: Succeeded
NOTE: Running setscene task 802 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 803 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_write_config: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 804 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_fetch: Started
NOTE: Running setscene task 806 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 807 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 810 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 811 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 812 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-78.2-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 813 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 814 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 815 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 816 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 817 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 818 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 819 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 822 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 823 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 827 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 828 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_package_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 829 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 830 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 831 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 832 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_package_setscene)
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_unpack: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1047 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb:do_patch)
NOTE: Running setscene task 833 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_package_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 834 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_package_setscene)
NOTE: Running task 1048 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_patch)
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1050 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 835 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_package_setscene)
NOTE: Running task 1070 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_fetch)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1096 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1107 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_unpack)
NOTE: recipe libidn2-2.3.8-r0: task do_package_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_patch: Started
NOTE: recipe gnutls-3.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_package_setscene: Started
NOTE: Running task 1114 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: recipe icu-78.2-r0: task do_fetch: Started
NOTE: Running setscene task 838 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe shadow-4.18.0-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_package_setscene: Started
NOTE: Running task 1158 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1178 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_write_config)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_unpack: Started
NOTE: Running task 1181 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_unpack)
NOTE: Running task 1195 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1196 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_patch)
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1197 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 841 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_unpack: Started
NOTE: recipe dbus-1.16.2-r0: task do_write_config: Started
NOTE: recipe libical-3.0.20-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1209 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_patch: Started
NOTE: Running task 1211 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_fetch)
NOTE: recipe dbus-1.16.2-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_write_config: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: Running task 1212 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_patch)
NOTE: Running task 1214 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_fetch)
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1216 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe kmod-34.2-r0: task do_fetch: Started
NOTE: recipe kmod-34.2-r0: task do_fetch: Succeeded
NOTE: Running task 1224 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_fetch)
NOTE: recipe vala-0.56.18-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 842 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_patch: Started
NOTE: Running task 1236 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_recipe_qa)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe dbus-1.16.2-r0: task do_patch: Succeeded
NOTE: Running task 1240 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_6.18.bb:do_recipe_qa)
NOTE: recipe readline-8.3-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1241 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe bluez5-5.86-r0: task do_recipe_qa: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 843 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_patch: Succeeded
NOTE: Running task 1242 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1243 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 844 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1246 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_unpack)
NOTE: recipe linux-yocto-6.18.8+git-r0: task do_recipe_qa: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_patch: Succeeded
NOTE: Running task 1247 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.20-r0: task do_fetch: Succeeded
NOTE: Running task 1248 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_unpack)
NOTE: recipe bluez5-5.86-r0: task do_recipe_qa: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1249 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_fetch)
NOTE: Running setscene task 845 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb:do_deploy_source_date_epoch unihash changed to 2ab6796b33806801b84dcf5666cfaac6c33fe43240c036f5a9e5f6885ab39147
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_unpack: Succeeded
NOTE: recipe bluez5-5.86-r0: task do_fetch: Started
NOTE: recipe shadow-4.18.0-r0: task do_unpack: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_fetch: Succeeded
NOTE: recipe linux-yocto-6.18.8+git-r0: task do_recipe_qa: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_unpack: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_package_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_package_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running setscene task 781 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 789 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 795 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 800 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 805 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 807 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1251 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: Running task 1253 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1255 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_fetch)
NOTE: Running task 1256 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_patch)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1257 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_6.18.bb:do_fetch)
NOTE: Running task 1258 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_patch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_deploy_source_date_epoch unihash changed to 1ede75d16ddb3d1d6000cd708d7461696ab2715d3cb8b0deeb854344975836ff
NOTE: recipe bluez5-5.86-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Started
NOTE: recipe libical-3.0.20-r0: task do_patch: Started
NOTE: recipe kmod-34.2-r0: task do_patch: Started
NOTE: recipe nettle-3.10.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1259 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_unpack)
NOTE: Running setscene task 852 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 853 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1260 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_unpack)
NOTE: recipe kmod-34.2-r0: task do_patch: Succeeded
NOTE: Running task 1261 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_unpack)
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: Running task 1262 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 854 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_package_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1264 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 857 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1284 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_unpack: Started
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Started
NOTE: recipe bluez5-5.86-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: recipe libunistring-1.4.1-r0: task do_package_setscene: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_fetch: Started
NOTE: recipe linux-yocto-6.18.8+git-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1285 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_write_config)
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1287 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_fetch)
NOTE: Running task 1296 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_generate_toolchain_file)
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1302 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_patch)
NOTE: Running task 1305 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_fetch)
NOTE: recipe nettle-3.10.2-r0: task do_fetch: Started
NOTE: recipe kmod-34.2-r0: task do_write_config: Started
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Started
NOTE: recipe eudev-3.2.14-r0: task do_patch: Started
NOTE: recipe bluez5-5.86-r0: task do_unpack: Succeeded
NOTE: Running task 1306 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe kmod-34.2-r0: task do_write_config: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 56f86136d7a4cf1994dc4410aea1740546a49f4519d7112a9e473f8c6a2f81f4
NOTE: Running task 1307 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_fetch)
NOTE: Running task 1309 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_fetch)
NOTE: Running task 1339 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb:do_fetch)
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: Running task 1340 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.86-r0: task do_patch: Started
NOTE: recipe vala-0.56.18-r0: task do_unpack: Succeeded
NOTE: Running task 1341 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_generate_toolchain_file)
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.12-r0: task do_fetch: Started
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20251101-r0: task do_fetch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_deploy_source_date_epoch unihash changed to 3fd4a896fda0a1ee68a8eb24ebf2892c7ac55e8f43dfb6a5df1901c00bf29e16
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe eudev-3.2.14-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.86-r0: task do_patch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1342 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_patch)
NOTE: Running task 1344 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_deploy_source_date_epoch)
NOTE: Running task 1346 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ell/ell_0.81.bb:do_fetch)
NOTE: recipe libcheck-0.15.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1347 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libnl-1_3.12.0-r0: task do_fetch: Succeeded
NOTE: Running task 1348 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_unpack)
NOTE: recipe ell-0.81-r0: task do_fetch: Started
NOTE: recipe vala-0.56.18-r0: task do_patch: Started
NOTE: recipe bluez5-5.86-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_patch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch unihash changed to 516c9a3dfa902eb14c771acc25c646f98867f72e64c954523d65665050cffbe7
NOTE: recipe libnl-1_3.12.0-r0: task do_unpack: Started
NOTE: Running task 1349 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_deploy_source_date_epoch)
NOTE: recipe libnl-1_3.12.0-r0: task do_unpack: Succeeded
NOTE: Running task 1361 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_fetch)
NOTE: Running task 1362 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_patch)
NOTE: recipe bluez5-5.86-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1364 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_fetch)
NOTE: recipe libunistring-1.4.1-r0: task do_package_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 858 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_fetch: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_patch: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 859 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 860 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_fetch: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1365 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_unpack)
NOTE: recipe libunistring-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 861 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.3-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 863 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 864 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.12-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 866 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running task 1366 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_deploy_source_date_epoch)
NOTE: recipe readline-8.3-r0: task do_unpack: Succeeded
NOTE: Running task 1369 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_unpack)
NOTE: recipe libunistring-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1371 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_fetch)
NOTE: recipe vala-0.56.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_deploy_source_date_epoch unihash changed to bb1ba8e913f38953c8512d41b8ddf04bef8b64cb33950078fa49075fbce4713a
NOTE: recipe libnl-1_3.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.8.12-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.4.1-r0: task do_fetch: Started
NOTE: Running setscene task 868 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running task 1378 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb:do_recipe_qa)
NOTE: Running task 1380 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/ofono/ofono_2.19.bb:do_fetch)
NOTE: recipe ell-0.81-r0: task do_fetch: Succeeded
NOTE: Running task 1381 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ell/ell_0.81.bb:do_unpack)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe wpa-supplicant-2.11-r0: task do_recipe_qa: Started
NOTE: recipe ofono-2.19-r0: task do_fetch: Started
NOTE: recipe ell-0.81-r0: task do_unpack: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_deploy_source_date_epoch unihash changed to c82b1341050bf5b7a2169d03073d856e32c3b87f29063993764881fe041f7241
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 856 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 858 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 860 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe ell-0.81-r0: task do_unpack: Succeeded
NOTE: Running setscene task 863 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe wpa-supplicant-2.11-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 864 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 1382 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_unpack)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1385 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ell/ell_0.81.bb:do_patch)
NOTE: recipe gnutls-3.8.12-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1386 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb:do_fetch)
NOTE: Running task 1389 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_fetch)
NOTE: recipe ofono-2.19-r0: task do_fetch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1402 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_fetch)
NOTE: Running task 1404 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_unpack)
NOTE: Running setscene task 878 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 879 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Started
NOTE: recipe ell-0.81-r0: task do_patch: Started
NOTE: recipe wpa-supplicant-2.11-r0: task do_fetch: Started
NOTE: recipe nettle-3.10.2-r0: task do_fetch: Succeeded
NOTE: recipe iptables-1.8.11-r0: task do_fetch: Started
NOTE: Running task 1405 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_unpack)
NOTE: recipe ell-0.81-r0: task do_patch: Succeeded
NOTE: Running task 1407 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_unpack)
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_unpack: Started
NOTE: recipe cairo-1.18.4-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Succeeded
NOTE: Running task 1410 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/ofono/ofono_2.19.bb:do_unpack)
NOTE: Running task 1411 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_unpack)
NOTE: recipe nettle-3.10.2-r0: task do_unpack: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1422 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ell/ell_0.81.bb:do_deploy_source_date_epoch)
NOTE: recipe pixman-1_0.46.4-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20251101-r0: task do_fetch: Succeeded
NOTE: Running task 1423 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb:do_unpack)
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Succeeded
NOTE: recipe ofono-2.19-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Started
NOTE: Running task 1424 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_unpack)
NOTE: Running task 1425 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_patch)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 882 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 883 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe ell-0.81-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_unpack: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20251101-r0: task do_unpack: Started
NOTE: Running setscene task 884 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Succeeded
NOTE: Running setscene task 888 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ofono-2.19-r0: task do_unpack: Succeeded
NOTE: Running task 1441 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_patch)
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 1444 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/ofono/ofono_2.19.bb:do_patch)
NOTE: recipe pixman-1_0.46.4-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1445 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb:do_write_config)
NOTE: Running task 1450 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_unpack)
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 892 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe icu-78.2-r0: task do_fetch: Succeeded
NOTE: recipe ell-0.81-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1451 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_unpack)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 894 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ell/ell_0.81.bb:do_deploy_source_date_epoch unihash changed to 472115c88e41de9d2fcc743144ca26162c6ad5f48b6211abf0a252dd5dfcfa56
NOTE: recipe fontconfig-2.17.1-r0: task do_patch: Started
NOTE: recipe ofono-2.19-r0: task do_patch: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20251101-r0: task do_write_config: Started
NOTE: recipe cairo-1.18.4-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1460 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_write_config)
NOTE: Running task 1462 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_write_config)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20251101-r0: task do_write_config: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-78.2-r0: task do_unpack: Started
NOTE: Running setscene task 896 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: Running task 1464 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/connman/connman_2.0.bb:do_recipe_qa)
NOTE: recipe ofono-2.19-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1479 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/ofono/ofono_2.19.bb:do_deploy_source_date_epoch)
NOTE: Running task 1480 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/connman/connman-conf.bb:do_recipe_qa)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1487 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_fetch)
NOTE: recipe pixman-1_0.46.4-r0: task do_write_config: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_write_config: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe connman-2.0-r0: task do_recipe_qa: Started
NOTE: recipe wpa-supplicant-2.11-r0: task do_fetch: Succeeded
NOTE: Running task 1488 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb:do_unpack)
NOTE: recipe fontconfig-2.17.1-r0: task do_patch: Succeeded
NOTE: recipe connman-conf-1.0-r0: task do_recipe_qa: Started
NOTE: Running task 1492 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_write_config)
NOTE: recipe fontconfig-2.17.1-r0: task do_write_config: Succeeded
NOTE: recipe iptables-1.8.11-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_write_config: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20251101-r0: task do_unpack: Succeeded
NOTE: Running task 1493 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_unpack)
NOTE: recipe ofono-2.19-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1494 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb:do_patch)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1506 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbus_1.4.0.bb:do_fetch)
NOTE: Running task 1507 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-pycairo-1.29.0-r0: task do_fetch: Succeeded
NOTE: Running task 1659 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe wpa-supplicant-2.11-r0: task do_unpack: Started
NOTE: recipe cairo-1.18.4-r0: task do_write_config: Started
NOTE: Running task 1734 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe iptables-1.8.11-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20251101-r0: task do_patch: Started
NOTE: recipe python3-dbus-1.4.0-r0: task do_fetch: Started
NOTE: recipe python3-pygobject-3.54.5-r0: task do_fetch: Started
NOTE: Running task 1796 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-dbus-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygobject-3.54.5-r0: task do_fetch: Succeeded
NOTE: recipe connman-2.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1843 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.18.4-r0: task do_write_config: Succeeded
NOTE: Running task 1864 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.bb:do_packagedata)
NOTE: recipe connman-conf-1.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1902 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata)
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1910 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe ofono-2.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/ofono/ofono_2.19.bb:do_deploy_source_date_epoch unihash changed to 42bad2b4f2ea6d1ec6ead8a5126e623d1ad057ea71c6c5717bf3b11597618db0
NOTE: recipe mobile-broadband-provider-info-1_20251101-r0: task do_patch: Succeeded
NOTE: recipe icu-78.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpa-supplicant-2.11-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.9-r0: task do_packagedata: Started
NOTE: recipe kmod-34.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iptables-1.8.11-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: Running task 1947 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb:do_patch)
NOTE: Running task 1948 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_patch)
NOTE: Running task 1952 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb:do_collect_spdx_deps)
NOTE: Running task 1953 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb:do_deploy_source_date_epoch)
NOTE: Running task 1955 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb:do_prepare_recipe_sysroot)
NOTE: recipe wpa-supplicant-2.11-r0: task do_patch: Started
NOTE: recipe iptables-1.8.11-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20251101-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe mobile-broadband-provider-info-1_20251101-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iptables-1.8.11-r0: task do_patch: Succeeded
NOTE: Running task 1960 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe icu-78.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1961 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: recipe fontconfig-2.17.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1963 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.9-r0: task do_packagedata: Succeeded
NOTE: Running task 1964 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_patch)
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata: Succeeded
NOTE: Running task 1975 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 1976 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/connman/connman_2.0.bb:do_fetch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: recipe mobile-broadband-provider-info-1_20251101-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb:do_deploy_source_date_epoch unihash changed to b1296d592685369c09dbf3b321059d2447529ab729c89ae785ad4f91da5c2024
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.18.4-r0: task do_patch: Started
NOTE: recipe iptables-1.8.11-r0: task do_deploy_source_date_epoch: Started
NOTE: Setscene tasks completed
NOTE: Running task 1978 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb:do_configure)
NOTE: recipe connman-2.0-r0: task do_fetch: Started
NOTE: Running task 1985 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/connman/connman-conf.bb:do_fetch)
NOTE: Running task 1986 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1994 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_unpack)
NOTE: recipe connman-2.0-r0: task do_fetch: Succeeded
NOTE: recipe kmod-34.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1995 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/connman/connman_2.0.bb:do_unpack)
NOTE: Running task 1996 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_configure)
NOTE: recipe libunistring-1.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 1997 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_unpack)
NOTE: recipe cairo-1.18.4-r0: task do_patch: Succeeded
NOTE: recipe connman-conf-1.0-r0: task do_fetch: Started
NOTE: recipe connman-conf-1.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_configure: Started
NOTE: Running task 2034 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/connman/connman-conf.bb:do_unpack)
NOTE: Running task 2035 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe iptables-1.8.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_unpack: Started
NOTE: recipe connman-2.0-r0: task do_unpack: Started
NOTE: recipe wpa-supplicant-2.11-r0: task do_patch: Succeeded
NOTE: recipe python3-pycairo-1.29.0-r0: task do_unpack: Succeeded
NOTE: Running task 2036 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 2037 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_patch)
NOTE: recipe libunistring-1.4.1-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20251101-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe kmod-34.2-r0: task do_configure: Started
NOTE: Running task 2038 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb:do_configure)
NOTE: recipe connman-conf-1.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe connman-conf-1.0-r0: task do_unpack: Succeeded
NOTE: recipe iptables-1.8.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2039 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/connman/connman-conf.bb:do_patch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_deploy_source_date_epoch unihash changed to 31c87b257e2e7dabc8888108ab00a8bc6c0c308de4bc93f5c38735b4c627037f
NOTE: recipe wpa-supplicant-2.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_patch: Started
NOTE: Setscene tasks completed
NOTE: Running task 2041 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_collect_spdx_deps)
NOTE: recipe mobile-broadband-provider-info-1_20251101-r0: task do_configure: Started
NOTE: recipe connman-2.0-r0: task do_unpack: Succeeded
NOTE: recipe connman-conf-1.0-r0: task do_patch: Started
NOTE: Setscene tasks completed
NOTE: Running task 2042 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/connman/connman_2.0.bb:do_patch)
NOTE: Running task 2046 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe fontconfig-2.17.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2047 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_configure)
NOTE: recipe iptables-1.8.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycairo-1.29.0-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2048 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_configure)
NOTE: Running task 2055 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_write_config)
NOTE: recipe libunistring-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2084 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbus_1.4.0.bb:do_unpack)
NOTE: Running task 2085 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_configure)
NOTE: recipe connman-conf-1.0-r0: task do_patch: Succeeded
NOTE: Running task 2086 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/connman/connman-conf.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-4.18.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe connman-2.0-r0: task do_patch: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_configure: Started
NOTE: recipe iptables-1.8.11-r0: task do_configure: Started
NOTE: recipe wpa-supplicant-2.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycairo-1.29.0-r0: task do_write_config: Started
NOTE: Running task 2087 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_unpack)
NOTE: recipe python3-dbus-1.4.0-r0: task do_unpack: Started
NOTE: recipe connman-conf-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_configure: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_write_config: Succeeded
NOTE: Running task 2092 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/connman/connman-conf.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.18.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2093 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx)
NOTE: recipe python3-pygobject-3.54.5-r0: task do_unpack: Started
NOTE: recipe python3-dbus-1.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2094 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbus_1.4.0.bb:do_patch)
NOTE: recipe connman-conf-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe connman-2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pygobject-3.54.5-r0: task do_unpack: Succeeded
NOTE: Running task 2095 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/connman/connman_2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2096 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_patch)
NOTE: recipe icu-78.2-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_create_spdx: Started
NOTE: Running task 2097 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_patch)
NOTE: recipe python3-dbus-1.4.0-r0: task do_patch: Started
NOTE: recipe connman-conf-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe connman-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygobject-3.54.5-r0: task do_patch: Started
NOTE: recipe python3-dbus-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe connman-conf-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2110 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_collect_spdx_deps)
NOTE: Running task 2111 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/connman/connman-conf.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: Running task 2114 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_collect_spdx_deps)
NOTE: recipe icu-78.2-r0: task do_patch: Started
NOTE: Running task 2116 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbus_1.4.0.bb:do_write_config)
NOTE: recipe connman-conf-1.0-r0: task do_configure: Started
NOTE: recipe kmod-34.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe readline-8.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pygobject-3.54.5-r0: task do_patch: Succeeded
NOTE: recipe python3-dbus-1.4.0-r0: task do_write_config: Started
NOTE: Running task 2118 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_write_config)
NOTE: recipe connman-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-dbus-1.4.0-r0: task do_write_config: Succeeded
NOTE: recipe kmod-34.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe connman-conf-1.0-r0: task do_configure: Succeeded
NOTE: Running task 2122 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_collect_spdx_deps)
NOTE: Running task 2123 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/connman/connman-conf.bb:do_compile)
NOTE: Running task 2134 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_collect_spdx_deps)
NOTE: Running task 2139 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: recipe python3-pygobject-3.54.5-r0: task do_write_config: Started
NOTE: recipe readline-8.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2140 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_create_spdx)
NOTE: recipe python3-pygobject-3.54.5-r0: task do_write_config: Succeeded
NOTE: recipe connman-conf-1.0-r0: task do_compile: Started
NOTE: Running task 2151 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_collect_spdx_deps)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe icu-78.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libunistring-1.4.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2154 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb:do_collect_spdx_deps)
NOTE: recipe icu-78.2-r0: task do_patch: Succeeded
NOTE: recipe readline-8.3-r0: task do_create_spdx: Started
NOTE: recipe connman-conf-1.0-r0: task do_compile: Succeeded
NOTE: Running task 2155 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/connman/connman-conf.bb:do_install)
NOTE: recipe icu-78.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2156 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2157 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_make_icudata)
NOTE: recipe libcheck-0.15.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe mobile-broadband-provider-info-1_20251101-r0: task do_collect_spdx_deps: Started
NOTE: recipe libunistring-1.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2158 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_create_spdx)
NOTE: recipe libcheck-0.15.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe icu-78.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe connman-conf-1.0-r0: task do_install: Started
NOTE: recipe shadow-4.18.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2159 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_collect_spdx_deps)
NOTE: recipe icu-78.2-r0: task do_make_icudata: Started
NOTE: Running task 2161 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: recipe mobile-broadband-provider-info-1_20251101-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2163 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_collect_spdx_deps)
NOTE: recipe libunistring-1.4.1-r0: task do_create_spdx: Started
NOTE: recipe icu-78.2-r0: task do_make_icudata: Succeeded
NOTE: Running task 2164 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_collect_spdx_deps)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 2165 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe iptables-1.8.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe connman-conf-1.0-r0: task do_install: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe readline-8.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 2166 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/connman/connman-conf.bb:do_package)
NOTE: Running task 2167 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_collect_spdx_deps)
NOTE: recipe iptables-1.8.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: Running task 2176 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libseccomp-2.6.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe icu-78.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2177 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_configure)
NOTE: recipe connman-conf-1.0-r0: task do_package: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: Running task 2178 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe nettle-3.10.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2179 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_create_spdx)
NOTE: recipe libseccomp-2.6.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe icu-78.2-r0: task do_configure: Started
NOTE: Running task 2180 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_create_spdx)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20251101-r0: task do_configure: Succeeded
NOTE: Running task 2181 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb:do_compile)
NOTE: recipe nettle-3.10.2-r0: task do_create_spdx: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2182 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_create_spdx)
NOTE: recipe libseccomp-2.6.0-r0: task do_create_spdx: Started
NOTE: recipe mobile-broadband-provider-info-1_20251101-r0: task do_compile: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_create_spdx: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2190 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/connman/connman-conf.bb:do_collect_spdx_deps)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch unihash changed to a0484708eb001900d19425dc3bed35dac89d2e174e0571795572be71dc0365b8
NOTE: Setscene tasks completed
NOTE: Running task 2191 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe connman-conf-1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libunistring-1.4.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2192 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_collect_spdx_deps)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: Running task 2193 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe libtasn1-4.21.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2194 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/connman/connman-conf.bb:do_populate_sysroot)
NOTE: recipe mobile-broadband-provider-info-1_20251101-r0: task do_compile: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_create_spdx: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: Running task 2196 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/connman/connman_2.0.bb:do_populate_lic)
NOTE: Running task 2197 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb:do_install)
NOTE: recipe connman-conf-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2198 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_create_spdx)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: Running task 2199 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe connman-2.0-r0: task do_populate_lic: Started
NOTE: recipe mobile-broadband-provider-info-1_20251101-r0: task do_install: Started
NOTE: recipe libidn2-2.3.8-r0: task do_create_spdx: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe nettle-3.10.2-r0: task do_create_spdx: Succeeded
NOTE: recipe connman-2.0-r0: task do_populate_lic: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: Running task 2200 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe connman-conf-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 2201 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_collect_spdx_deps)
NOTE: recipe mobile-broadband-provider-info-1_20251101-r0: task do_install: Succeeded
NOTE: recipe gnutls-3.8.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe kmod-34.2-r0: task do_configure: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_configure: Succeeded
NOTE: Running task 2202 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_compile)
NOTE: Running task 2203 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb:do_populate_sysroot)
NOTE: Running task 2204 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb:do_package)
NOTE: Running task 2205 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_compile)
NOTE: recipe gnutls-3.8.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2206 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_create_spdx)
NOTE: recipe connman-conf-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20251101-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-34.2-r0: task do_compile: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20251101-r0: task do_package: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot unihash changed to 5c90e954979beff6dcc7f1f5332a55b69722f3fdfd52e66ef1748424f65e190a
NOTE: recipe pixman-1_0.46.4-r0: task do_compile: Started
NOTE: recipe gnutls-3.8.12-r0: task do_create_spdx: Started
NOTE: recipe mobile-broadband-provider-info-1_20251101-r0: task do_populate_sysroot: Succeeded
NOTE: recipe connman-conf-1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb:do_populate_sysroot unihash changed to 502b7088f745eeee0fa5e95bec72d8855a7e72e9201e59c3eea67d83d980d00b
NOTE: Setscene tasks completed
NOTE: Running task 2207 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/connman/connman-conf.bb:do_packagedata)
NOTE: recipe connman-conf-1.0-r0: task do_packagedata: Started
NOTE: recipe connman-conf-1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2208 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/connman/connman-conf.bb:do_create_spdx)
NOTE: Running task 2209 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/connman/connman-conf.bb:do_package_write_ipk)
NOTE: Running task 2210 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/connman/connman-conf.bb:do_package_write_deb)
NOTE: Running task 2211 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/connman/connman-conf.bb:do_package_write_rpm)
NOTE: Running task 2212 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/connman/connman-conf.bb:do_package_qa)
NOTE: recipe connman-conf-1.0-r0: task do_create_spdx: Started
NOTE: recipe connman-conf-1.0-r0: task do_package_write_ipk: Started
NOTE: recipe mobile-broadband-provider-info-1_20251101-r0: task do_package: Succeeded
NOTE: recipe connman-conf-1.0-r0: task do_package_write_deb: Started
NOTE: recipe connman-conf-1.0-r0: task do_package_write_rpm: Started
NOTE: recipe connman-conf-1.0-r0: task do_package_qa: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb:do_package unihash changed to 87391d818b9e9cd222397994411b44001797f9422ded1b346aedf152776044e0
NOTE: Setscene tasks completed
NOTE: Running task 2213 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb:do_packagedata)
NOTE: recipe connman-conf-1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20251101-r0: task do_packagedata: Started
NOTE: recipe kmod-34.2-r0: task do_compile: Succeeded
NOTE: Running task 2214 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_install)
NOTE: recipe connman-conf-1.0-r0: task do_package_qa: Succeeded
NOTE: recipe connman-conf-1.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20251101-r0: task do_packagedata: Succeeded
NOTE: recipe kmod-34.2-r0: task do_install: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_configure: Succeeded
NOTE: recipe connman-conf-1.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb:do_packagedata unihash changed to 2c8a942449f7ae9fc955d1f207f492d162cc1935591645d73c43ea7408ba5879
NOTE: recipe connman-conf-1.0-r0: task do_package_write_rpm: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2215 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_compile)
NOTE: Running task 2216 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb:do_create_spdx)
NOTE: recipe fontconfig-2.17.1-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20251101-r0: task do_create_spdx: Started
NOTE: recipe gnutls-3.8.12-r0: task do_create_spdx: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: Running task 2217 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure_ptest_base)
NOTE: recipe mobile-broadband-provider-info-1_20251101-r0: task do_create_spdx: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libcheck-0.15.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2218 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile)
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Started
NOTE: recipe kmod-34.2-r0: task do_install: Succeeded
NOTE: Running task 2219 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot)
NOTE: Running task 2220 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_package)
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-34.2-r0: task do_package: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2221 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe eudev-3.2.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe eudev-3.2.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2222 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_configure)
NOTE: recipe eudev-3.2.14-r0: task do_configure: Started
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Succeeded
NOTE: Running task 2223 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile_ptest_base)
NOTE: recipe libcheck-0.15.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libcheck-0.15.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2224 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install)
NOTE: recipe libcheck-0.15.2-r0: task do_install: Started
NOTE: recipe libcheck-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 2225 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install_ptest_base)
NOTE: recipe icu-78.2-r0: task do_configure: Succeeded
NOTE: Running task 2226 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_configure_ptest_base)
NOTE: recipe kmod-34.2-r0: task do_package: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_install_ptest_base: Started
NOTE: Running task 2227 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata)
NOTE: recipe icu-78.2-r0: task do_configure_ptest_base: Started
NOTE: recipe icu-78.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2228 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_compile)
NOTE: recipe kmod-34.2-r0: task do_packagedata: Started
NOTE: recipe libcheck-0.15.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2229 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot)
NOTE: Running task 2230 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package)
NOTE: recipe icu-78.2-r0: task do_compile: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_compile: Succeeded
NOTE: Running task 2231 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_create_spdx)
NOTE: Running task 2232 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_install)
NOTE: recipe kmod-34.2-r0: task do_create_spdx: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_install: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2233 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pixman-1_0.46.4-r0: task do_compile: Succeeded
NOTE: recipe iptables-1.8.11-r0: task do_configure: Succeeded
NOTE: Running task 2234 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_install)
NOTE: Running task 2235 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_compile)
NOTE: recipe libnl-1_3.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iptables-1.8.11-r0: task do_compile: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_install: Started
NOTE: recipe kmod-34.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2236 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_collect_spdx_deps)
NOTE: recipe eudev-3.2.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2237 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_configure)
NOTE: recipe eudev-3.2.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libnl-1_3.12.0-r0: task do_configure: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_install: Succeeded
NOTE: Running task 2238 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_populate_sysroot)
NOTE: Running task 2239 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_package)
NOTE: recipe pixman-1_0.46.4-r0: task do_install: Succeeded
NOTE: Running task 2240 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot)
NOTE: Running task 2241 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_package)
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_package: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_package: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_populate_sysroot unihash changed to b46a011731f01a440d242bfdb3e9e249512ad22aefe901ed8f4397fb7eb97166
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot unihash changed to 7f75e7431ee4ad5b4b5083bf59cf2741447f9bef6a5f8391df2e91b8069b483a
NOTE: Setscene tasks completed
NOTE: recipe libcheck-0.15.2-r0: task do_package: Succeeded
NOTE: Running task 2242 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata unihash changed to 0eedf9226aac1f9bbbd302e98f77f850388e5c784c9985bd37eaf1c62a943960
NOTE: Running task 2243 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_create_spdx)
NOTE: recipe pixman-1_0.46.4-r0: task do_package: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_package unihash changed to 876785db86b90fbcf0eeabbd8e0bf2c45503b15e5c6b3517b816842b6edad731
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata became valid
NOTE: Running setscene task 896 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2244 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_collect_spdx_deps)
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libnl-1_3.12.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_package unihash changed to 0680afd53beea7533c197cdda4eb724e8b37492940d91474b742018c8c74dbf1
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_packagedata became valid
NOTE: Running setscene task 896 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe iptables-1.8.11-r0: task do_compile: Succeeded
NOTE: Running task 2247 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_install)
NOTE: recipe iptables-1.8.11-r0: task do_install: Started
NOTE: recipe iptables-1.8.11-r0: task do_install: Succeeded
NOTE: Running task 2248 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_package)
NOTE: Running task 2249 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_populate_sysroot)
NOTE: recipe iptables-1.8.11-r0: task do_populate_sysroot: Started
NOTE: recipe iptables-1.8.11-r0: task do_package: Started
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_configure: Succeeded
NOTE: Running task 2250 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb:do_configure_ptest_base)
NOTE: recipe iptables-1.8.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2251 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb:do_compile)
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_compile: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2252 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_configure_ptest_base)
NOTE: recipe libnl-1_3.12.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2253 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_compile)
NOTE: recipe libnl-1_3.12.0-r0: task do_compile: Started
NOTE: recipe eudev-3.2.14-r0: task do_configure: Succeeded
NOTE: Running task 2254 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_compile)
NOTE: recipe eudev-3.2.14-r0: task do_compile: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_compile: Succeeded
NOTE: Running task 2255 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_compile_ptest_base)
NOTE: recipe libnl-1_3.12.0-r0: task do_compile_ptest_base: Started
NOTE: recipe iptables-1.8.11-r0: task do_package: Succeeded
NOTE: Running task 2256 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_packagedata)
NOTE: recipe iptables-1.8.11-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_compile: Succeeded
NOTE: Running task 2257 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2258 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb:do_install)
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_install: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2259 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_install)
NOTE: recipe iptables-1.8.11-r0: task do_packagedata: Succeeded
NOTE: Running task 2260 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_create_spdx)
NOTE: recipe libnl-1_3.12.0-r0: task do_install: Started
NOTE: recipe iptables-1.8.11-r0: task do_create_spdx: Started
NOTE: recipe iptables-1.8.11-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_install: Succeeded
NOTE: Running task 2261 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2262 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb:do_populate_sysroot)
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_populate_sysroot: Started
NOTE: recipe eudev-3.2.14-r0: task do_compile: Succeeded
NOTE: Running task 2263 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_install)
NOTE: recipe eudev-3.2.14-r0: task do_install: Started
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb:do_populate_sysroot unihash changed to 507b4e1d27ca9031f8b9a2d72d9bf15e76a33afff3a57e61b7674bde50b05ccb
NOTE: Setscene tasks completed
NOTE: Running task 2264 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2265 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 2266 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_collect_spdx_deps)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_install: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2267 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_configure)
NOTE: Running task 2268 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot)
NOTE: Running task 2269 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_package)
NOTE: recipe eudev-3.2.14-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_configure: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libnl-1_3.12.0-r0: task do_install: Succeeded
NOTE: Running task 2270 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_install_ptest_base)
NOTE: recipe libnl-1_3.12.0-r0: task do_install_ptest_base: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_package: Succeeded
NOTE: Running task 2271 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_populate_sysroot)
NOTE: Running task 2272 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_package)
NOTE: Running task 2273 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata)
NOTE: recipe libnl-1_3.12.0-r0: task do_populate_sysroot: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_package: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_configure: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_packagedata: Succeeded
NOTE: Running task 2274 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_compile)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata unihash changed to 807878cc940da567db5a94c33a8dc00e7bd1f98fbb4144082bd23b24e65aa6cf
NOTE: Setscene tasks completed
NOTE: Running task 2275 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_compile: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx: Succeeded
NOTE: recipe libnl-1_3.12.0-r0: task do_package: Succeeded
NOTE: Running task 2276 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_packagedata)
NOTE: recipe libnl-1_3.12.0-r0: task do_packagedata: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2277 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libnl/libnl_3.12.0.bb:do_create_spdx)
NOTE: recipe libnl-1_3.12.0-r0: task do_create_spdx: Started
NOTE: recipe libnl-1_3.12.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_compile: Succeeded
NOTE: Running task 2278 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_install)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_install: Succeeded
NOTE: Running task 2279 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot)
NOTE: Running task 2280 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_package)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot unihash changed to 3e31dc7c4fe5436d57382f029609dfb9928fa9e5b0ed636c59d7c5c32b561541
NOTE: Setscene tasks completed
NOTE: Running task 2281 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2282 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_configure)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_package unihash changed to 360dd78c8b2fc7d11a1f908390b0c7a41730f18c9a4f87f769019c2ee8a9d98e
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata became valid
NOTE: Running setscene task 896 of 896 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2284 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2285 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe icu-78.2-r0: task do_compile: Succeeded
NOTE: Running task 2286 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_compile_ptest_base)
NOTE: recipe icu-78.2-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2287 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2288 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_compile)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_compile: Started
NOTE: recipe icu-78.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2289 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_install)
NOTE: recipe icu-78.2-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_compile: Succeeded
NOTE: Running task 2290 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2291 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_install)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_install: Started
NOTE: recipe icu-78.2-r0: task do_install: Succeeded
NOTE: Running task 2292 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_install_ptest_base)
NOTE: recipe icu-78.2-r0: task do_install_ptest_base: Started
NOTE: recipe icu-78.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2293 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_populate_sysroot)
NOTE: Running task 2294 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_package)
NOTE: recipe icu-78.2-r0: task do_populate_sysroot: Started
NOTE: recipe icu-78.2-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_install: Succeeded
NOTE: Running task 2295 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2296 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_populate_sysroot)
NOTE: Running task 2297 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_package)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_package: Started
NOTE: recipe icu-78.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2298 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2299 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2300 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.16.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.18.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.18.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2301 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_configure)
NOTE: recipe vala-0.56.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2302 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_configure)
NOTE: recipe cairo-1.18.4-r0: task do_configure: Started
NOTE: recipe vala-0.56.18-r0: task do_configure: Started
NOTE: recipe dbus-1.16.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2303 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_configure)
NOTE: recipe dbus-1.16.2-r0: task do_configure: Started
NOTE: recipe cairo-1.18.4-r0: task do_configure: Succeeded
NOTE: Running task 2304 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_compile)
NOTE: recipe cairo-1.18.4-r0: task do_compile: Started
NOTE: recipe dbus-1.16.2-r0: task do_configure: Succeeded
NOTE: Running task 2305 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_configure_ptest_base)
NOTE: recipe dbus-1.16.2-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.16.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2306 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_compile)
NOTE: recipe dbus-1.16.2-r0: task do_compile: Started
NOTE: recipe icu-78.2-r0: task do_package: Succeeded
NOTE: Running task 2307 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_packagedata)
NOTE: recipe icu-78.2-r0: task do_packagedata: Started
NOTE: recipe icu-78.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2308 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_create_spdx)
NOTE: recipe icu-78.2-r0: task do_create_spdx: Started
NOTE: recipe icu-78.2-r0: task do_create_spdx: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_compile: Succeeded
NOTE: Running task 2309 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_compile_ptest_base)
NOTE: recipe vala-0.56.18-r0: task do_configure: Succeeded
NOTE: Running task 2310 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_compile)
NOTE: recipe dbus-1.16.2-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.16.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2311 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_install)
NOTE: recipe vala-0.56.18-r0: task do_compile: Started
NOTE: recipe dbus-1.16.2-r0: task do_install: Started
NOTE: recipe cairo-1.18.4-r0: task do_compile: Succeeded
NOTE: Running task 2312 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_install)
NOTE: recipe cairo-1.18.4-r0: task do_install: Started
NOTE: recipe cairo-1.18.4-r0: task do_install: Succeeded
NOTE: Running task 2313 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot)
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.16.2-r0: task do_install: Succeeded
NOTE: Running task 2314 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_install_ptest_base)
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2315 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.16.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.16.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2316 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot)
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2317 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_configure)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_configure: Started
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2318 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ell/ell_0.81.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2319 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2320 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbus_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe ell-0.81-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpa-supplicant-2.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-dbus-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpa-supplicant-2.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2321 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb:do_configure)
NOTE: recipe ell-0.81-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2322 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ell/ell_0.81.bb:do_configure)
NOTE: recipe wpa-supplicant-2.11-r0: task do_configure: Started
NOTE: recipe ell-0.81-r0: task do_configure: Started
NOTE: recipe python3-dbus-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2323 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbus_1.4.0.bb:do_configure)
NOTE: recipe python3-dbus-1.4.0-r0: task do_configure: Started
NOTE: recipe wpa-supplicant-2.11-r0: task do_configure: Succeeded
NOTE: Running task 2324 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb:do_compile)
NOTE: recipe wpa-supplicant-2.11-r0: task do_compile: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_configure: Succeeded
NOTE: Running task 2325 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_compile)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_package: Succeeded
NOTE: recipe python3-pycairo-1.29.0-r0: task do_compile: Started
NOTE: Running task 2326 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_packagedata: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_compile: Succeeded
NOTE: Running task 2327 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_install)
NOTE: recipe python3-dbus-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2328 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbus_1.4.0.bb:do_compile)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_install: Started
NOTE: recipe python3-dbus-1.4.0-r0: task do_compile: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_install: Succeeded
NOTE: Running task 2329 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_populate_sysroot)
NOTE: recipe python3-dbus-1.4.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pycairo-1.29.0-r0: task do_populate_sysroot: Started
NOTE: Running task 2330 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbus_1.4.0.bb:do_install)
NOTE: recipe python3-dbus-1.4.0-r0: task do_install: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2331 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pygobject-3.54.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-dbus-1.4.0-r0: task do_install: Succeeded
NOTE: recipe python3-pygobject-3.54.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2332 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_configure)
NOTE: recipe python3-pygobject-3.54.5-r0: task do_configure: Started
NOTE: recipe ell-0.81-r0: task do_configure: Succeeded
NOTE: Running task 2333 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ell/ell_0.81.bb:do_compile)
NOTE: recipe ell-0.81-r0: task do_compile: Started
NOTE: recipe wpa-supplicant-2.11-r0: task do_compile: Succeeded
NOTE: Running task 2334 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb:do_install)
NOTE: recipe python3-pygobject-3.54.5-r0: task do_configure: Succeeded
NOTE: Running task 2335 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_compile)
NOTE: recipe wpa-supplicant-2.11-r0: task do_install: Started
NOTE: recipe python3-pygobject-3.54.5-r0: task do_compile: Started
NOTE: recipe wpa-supplicant-2.11-r0: task do_install: Succeeded
NOTE: Running task 2336 of 2455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb:do_populate_sysroot)
NOTE: recipe wpa-supplicant-2.11-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_packagedata: Failed
NOTE: recipe ell-0.81-r0: task do_compile: Succeeded
NOTE: recipe wpa-supplicant-2.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pygobject-3.54.5-r0: task do_compile: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_compile: Succeeded
NOTE: recipe linux-yocto-6.18.8+git-r0: task do_fetch: Succeeded
NOTE: Tasks Summary: Attempted 2336 tasks of which 2006 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260218112324.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260218112324.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/glib-2.0/2.86.3/temp/log.do_packagedata.1730422
Summary: There were 130 ERROR messages, returning a non-zero exit code.
ERROR: libx11-1_1.8.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.8.13-r0 to 1:1.8.12-r0) [version-going-backwards]
ERROR: libx11-1_1.8.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.8.13-r0 to 1:1.8.12-r0) [version-going-backwards]
ERROR: libx11-1_1.8.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.8.13-r0 to 1:1.8.12-r0) [version-going-backwards]
ERROR: libx11-1_1.8.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.8.13-r0 to 1:1.8.12-r0) [version-going-backwards]
ERROR: libx11-1_1.8.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.8.13-r0 to 1:1.8.12-r0) [version-going-backwards]
ERROR: libx11-1_1.8.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.8.13-r0 to 1:1.8.12-r0) [version-going-backwards]
ERROR: libx11-1_1.8.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.8.13-r0 to 1:1.8.12-r0) [version-going-backwards]
ERROR: libx11-1_1.8.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.8.13-r0 to 1:1.8.12-r0) [version-going-backwards]
ERROR: libx11-1_1.8.12-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libcap-ng-0.9-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-src went backwards which would break package feeds (from 0:0.9.1-r0 to 0:0.9-r0) [version-going-backwards]
ERROR: libcap-ng-0.9-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-dbg went backwards which would break package feeds (from 0:0.9.1-r0 to 0:0.9-r0) [version-going-backwards]
ERROR: libcap-ng-0.9-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-staticdev went backwards which would break package feeds (from 0:0.9.1-r0 to 0:0.9-r0) [version-going-backwards]
ERROR: libcap-ng-0.9-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-dev went backwards which would break package feeds (from 0:0.9.1-r0 to 0:0.9-r0) [version-going-backwards]
ERROR: libcap-ng-0.9-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-doc went backwards which would break package feeds (from 0:0.9.1-r0 to 0:0.9-r0) [version-going-backwards]
ERROR: libcap-ng-0.9-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-locale went backwards which would break package feeds (from 0:0.9.1-r0 to 0:0.9-r0) [version-going-backwards]
ERROR: libcap-ng-0.9-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-bin went backwards which would break package feeds (from 0:0.9.1-r0 to 0:0.9-r0) [version-going-backwards]
ERROR: libcap-ng-0.9-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng went backwards which would break package feeds (from 0:0.9.1-r0 to 0:0.9-r0) [version-going-backwards]
ERROR: libcap-ng-0.9-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ab went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ie went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kab went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.86.4-r0 to 1:2.86.3-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/glib-2.0/2.86.3/temp/log.do_packagedata.1730422
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_packagedata) failed with exit code '1'

--===============2407477074250917592==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-connman-upgrade-1.45-2.0.patch"

RnJvbSAzOTFlNDUzYTIwNWFmZTIxMGUyNjVkNzY2MjI2YmU1MmI1NmM3NmMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTE6MzY6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
b25ubWFuOiB1cGdyYWRlIDEuNDUgLT4gMi4wCgotLS0KIC4uLm1hbi12cG4tYXZvaWQtaGlkaW5n
LWltcGxlbWVudGF0aW9uLXJlc2VydmVkLXN5bS5wYXRjaCB8IDUgKy0tLS0KIC4uLi8wMDAyLXJl
c29sdmUtbXVzbC1kb2VzLW5vdC1pbXBsZW1lbnQtcmVzX25pbml0LnBhdGNoICB8IDIgKy0KIC4u
Li9jb25ubWFuL2Nvbm5tYW4vbm8tdmVyc2lvbi1zY3JpcHRzLnBhdGNoICAgICAgICAgICAgICB8
IDggKysrKy0tLS0KIC4uLi9jb25ubWFuL3tjb25ubWFuXzEuNDUuYmIgPT4gY29ubm1hbl8yLjAu
YmJ9ICAgICAgICAgICB8IDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAx
MCBkZWxldGlvbnMoLSkKIG1vZGUgY2hhbmdlIDEwMDc1NSA9PiAxMDA2NDQgbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9jb25ubWFuL2Nvbm5tYW4vMDAwMS1jb25ubWFuLXZwbi1hdm9pZC1oaWRp
bmctaW1wbGVtZW50YXRpb24tcmVzZXJ2ZWQtc3ltLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9jb25ubWFuL3tjb25ubWFuXzEuNDUuYmIgPT4gY29ubm1hbl8yLjAuYmJ9
ICg5OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9jb25ubWFuL2Nv
bm5tYW4vMDAwMS1jb25ubWFuLXZwbi1hdm9pZC1oaWRpbmctaW1wbGVtZW50YXRpb24tcmVzZXJ2
ZWQtc3ltLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9jb25ubWFuL2Nvbm5tYW4v
MDAwMS1jb25ubWFuLXZwbi1hdm9pZC1oaWRpbmctaW1wbGVtZW50YXRpb24tcmVzZXJ2ZWQtc3lt
LnBhdGNoCm9sZCBtb2RlIDEwMDc1NQpuZXcgbW9kZSAxMDA2NDQKaW5kZXggM2I3YjVhMDk2ZS4u
Njk0MGU4MTAwNgotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Nvbm5tYW4vY29ubm1h
bi8wMDAxLWNvbm5tYW4tdnBuLWF2b2lkLWhpZGluZy1pbXBsZW1lbnRhdGlvbi1yZXNlcnZlZC1z
eW0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9jb25ubWFuL2Nvbm5tYW4v
MDAwMS1jb25ubWFuLXZwbi1hdm9pZC1oaWRpbmctaW1wbGVtZW50YXRpb24tcmVzZXJ2ZWQtc3lt
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlYWM0ODljODcyYzc3NWM4OGJiZDg1YjRjZWM2
YzFkNDdhZDllNmE2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzN2NjYzU1Zjk0OTNi
ZGNkMzFiY2NhMjlhYzM1MzQ3Y2ExNTZkYTJkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogUGV0ZXIgVGF0cmFpIDxwZXRlci50YXRyYWkuZXh0QHNpZW1lbnMuY29tPgogRGF0ZTogU3Vu
LCA3IFNlcCAyMDI1IDA5OjI1OjIwICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNvbm5tYW4sIHZw
bjogYXZvaWQgaGlkaW5nIGltcGxlbWVudGF0aW9uLXJlc2VydmVkIHN5bWJvbHMKQEAgLTQ1LDYg
KzQ1LDMgQEAgaW5kZXggYjg4NzcwNi4uNWNhZDM0NCAxMDA2NDQKIC0JCSo7CiArCQlbIV9dKjsK
ICB9OwotLS0gCi0yLjQ3LjIKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9jb25ubWFuL2Nvbm5tYW4vMDAwMi1yZXNvbHZlLW11c2wtZG9lcy1ub3QtaW1wbGVtZW50LXJl
c19uaW5pdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvY29ubm1hbi9jb25ubWFu
LzAwMDItcmVzb2x2ZS1tdXNsLWRvZXMtbm90LWltcGxlbWVudC1yZXNfbmluaXQucGF0Y2gKaW5k
ZXggMmM2MTIwMzllZS4uYTc1YjU1ZDZlNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9jb25ubWFuL2Nvbm5tYW4vMDAwMi1yZXNvbHZlLW11c2wtZG9lcy1ub3QtaW1wbGVt
ZW50LXJlc19uaW5pdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Nvbm5t
YW4vY29ubm1hbi8wMDAyLXJlc29sdmUtbXVzbC1kb2VzLW5vdC1pbXBsZW1lbnQtcmVzX25pbml0
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0ZTcyNmE1YWFhNzVkNjBmYWI2YTU2YmMzN2Ri
ZWM0OGJlNTNmZjc5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxNmNhYTIyY2E5ZWM5
Y2NkNzM1Y2Y5NzQzZGZiNzBiNTliODdlZjY2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IE1vbiwgNiBBcHIgMjAxNSAy
MzowMjoyMSAtMDcwMAogU3ViamVjdDogW1BBVENIXSBnd2ViL2dyZXNvbHYuYzogbWFrZSB1c2Ug
b2YgcmVzX25pbml0IG9wdGlvbmFsIGFuZCBzdWJqZWN0IHRvCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2Nvbm5tYW4vY29ubm1hbi9uby12ZXJzaW9uLXNjcmlwdHMucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Nvbm5tYW4vY29ubm1hbi9uby12ZXJzaW9u
LXNjcmlwdHMucGF0Y2gKaW5kZXggYzk2YWIzMTFlNS4uNTRkMWZlMmM1OCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9jb25ubWFuL2Nvbm5tYW4vbm8tdmVyc2lvbi1zY3Jp
cHRzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvY29ubm1hbi9jb25ubWFu
L25vLXZlcnNpb24tc2NyaXB0cy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNjdmMzdhYWZj
YzhlZjVkMmViMDA2Mzg3ZTdiZWMyMWY3NDUxODcyNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gNmE1YWM1NDc2MjA3ZmE3NDVmOWEyODkwMDQyY2M5OGRkODkyYjk5OSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+
CiBEYXRlOiBUdWUsIDkgQXVnIDIwMTYgMTI6MTI6MDIgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0g
Y29ubm1hbjogZGlzYWJsZSB2ZXJzaW9uLXNjcmlwdHMgdG8gZml4IGNyYXNoZXMgYXQgc3RhcnR1
cApAQCAtMjMsMTAgKzIzLDEwIEBAIFNpZ25lZC1vZmYtYnk6IFBldGVyIFRhdHJhaSA8cGV0ZXIu
dGF0cmFpLmV4dEBzaWVtZW5zLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUuYW0gYi9NYWtlZmlsZS5h
bQotaW5kZXggM2RjM2JiNS4uM2JlNWNjYiAxMDA2NDQKK2luZGV4IDFlNDQzMTQuLmY1MzY2YWQg
MTAwNjQ0CiAtLS0gYS9NYWtlZmlsZS5hbQogKysrIGIvTWFrZWZpbGUuYW0KLUBAIC0xNDMsOCAr
MTQzLDcgQEAgc3JjX2Nvbm5tYW5kX0xEQUREID0gZ2RidXMvbGliZ2RidXMtaW50ZXJuYWwubGEg
JChidWlsdGluX2xpYmFkZCkgXAorQEAgLTE0Miw4ICsxNDIsNyBAQCBzcmNfY29ubm1hbmRfTERB
REQgPSBnZGJ1cy9saWJnZGJ1cy1pbnRlcm5hbC5sYSAkKGJ1aWx0aW5fbGliYWRkKSBcCiAgCQkJ
QEdJT19MSUJTQCBAR0xJQl9MSUJTQCBAREJVU19MSUJTQCBAR05VVExTX0xJQlNAIFwKICAJCQkt
bHJlc29sdiAtbGRsIC1scnQKICAKQEAgLTM2LDcgKzM2LDcgQEAgaW5kZXggM2RjM2JiNS4uM2Jl
NWNjYiAxMDA2NDQKICAKICBzcmNfY29ubm1hbmRfd2FpdF9vbmxpbmVfU09VUkNFUyA9IHNyYy9j
b25ubWFuZC13YWl0LW9ubGluZS5jCiAgCi1AQCAtMTg3LDggKzE4Niw3IEBAIHZwbl9jb25ubWFu
X3ZwbmRfTERBREQgPSBnZGJ1cy9saWJnZGJ1cy1pbnRlcm5hbC5sYSAkKGJ1aWx0aW5fdnBuX2xp
YmFkZCkgXAorQEAgLTE4Niw4ICsxODUsNyBAQCB2cG5fY29ubm1hbl92cG5kX0xEQUREID0gZ2Ri
dXMvbGliZ2RidXMtaW50ZXJuYWwubGEgJChidWlsdGluX3Zwbl9saWJhZGQpIFwKICAJCQkJQEdJ
T19MSUJTQCBAR0xJQl9MSUJTQCBAREJVU19MSUJTQCBAR05VVExTX0xJQlNAIFwKICAJCQkJLWxy
ZXNvbHYgLWxkbAogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9jb25u
bWFuL2Nvbm5tYW5fMS40NS5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvY29ubm1hbi9j
b25ubWFuXzIuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2Nvbm5tYW4vY29ubm1hbl8xLjQ1LmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2Nvbm5tYW4vY29ubm1hbl8yLjAuYmIKaW5kZXggY2EwMzM3YjRk
My4uNmY3MDkzMzAxYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9jb25u
bWFuL2Nvbm5tYW5fMS40NS5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Nvbm5t
YW4vY29ubm1hbl8yLjAuYmIKQEAgLTI1LDcgKzI1LDcgQEAgU1JDX1VSSSA9ICIke0tFUk5FTE9S
R19NSVJST1J9L2xpbnV4L25ldHdvcmsvJHtCUE59LyR7QlB9LnRhci54eiBcCiAgICAgICAgICAg
IGZpbGU6Ly8wMDAyLXJlc29sdmUtbXVzbC1kb2VzLW5vdC1pbXBsZW1lbnQtcmVzX25pbml0LnBh
dGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzcxMjhjY2U4MDg2
NTQ1NWM0ZjEwNmI1OTAxYTU3NWUyZGZkYjM1YTdkMmUyZTI5OTZmMTZlODVjYmExMDkxMyIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICJkMjVjMmRkYzBiNWFkMTNlOTg2ZWMzNWFkNzY1YWU4ZDJmNGI3
YWNiNDdjOTU4YTA1NjE2Yzk0M2NkMDgyNTI3IgogCiBSUkVDT01NRU5EUzoke1BOfSA9ICJjb25u
bWFuLWNvbmYiCiBSQ09ORkxJQ1RTOiR7UE59ID0gIm5ldHdvcmttYW5hZ2VyIgotLSAKMi40Ny4x
Cgo=

--===============2407477074250917592==--

