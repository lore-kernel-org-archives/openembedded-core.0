Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.24167.1608473714414042782
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id 81B4738C1428
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:15 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Victor Kamensky <kamensky@cisco.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemtap-uprobes: upgrading to 4.4 SUCCEEDED
Message-ID: <MADEUP.16527252DE11E4BE.28097@lists.openembedded.org>
X-Groupsio-MsgNum: 145982
Content-Type: multipart/mixed; boundary="===============6996744651354341095=="

--===============6996744651354341095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemtap-uprobes* to *4.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-systemtap-uprobes-upgrade-4.3-4.4.patch
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

--===============6996744651354341095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (0 cached, 807 parsed). 1416 targets, 41 skipped, 0 masked, 0 errors.
Removing 94 recipes from the core2-32 sysroot...done.
Removing 100 recipes from the qemux86 sysroot...done.
ERROR: Nothing PROVIDES 'systemtap-uprobes'
systemtap-uprobes was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============6996744651354341095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/systemtap: PV changed from "4.3" to "4.4"
packages/core2-32-poky-linux/systemtap: PKGV changed from 4.3 [default] to 4.4 [default]
Changes to packages/core2-32-poky-linux/systemtap (sysroot):
  /usr/share/systemtap/examples/general/floatingpoint.meta was added
  /usr/share/systemtap/examples/general/floatingpoint.stp was added
  /usr/share/systemtap/examples/general/floatingpoint.txt was added
  /usr/share/systemtap/runtime/linux/autoconf-atomic_fetch_add_unless.c was added
  /usr/share/systemtap/runtime/linux/autoconf-get_user_pages-notask_struct.c was added
  /usr/share/systemtap/runtime/linux/autoconf-get_user_pages_remote-notask_struct.c was added
  /usr/share/systemtap/runtime/linux/autoconf-kernel_read_file_from_path-offset.c was added
  /usr/share/systemtap/runtime/linux/autoconf-lockdown-debugfs.c was added
  /usr/share/systemtap/runtime/linux/autoconf-set_fs.c was added
  /usr/share/systemtap/runtime/linux/stp_tls.h was added
  /usr/share/systemtap/runtime/softfloat was added
  /usr/share/systemtap/runtime/softfloat.c was added
  /usr/share/systemtap/runtime/softfloat.h was added
  /usr/share/systemtap/runtime/softfloat/internals.h was added
  /usr/share/systemtap/runtime/softfloat/opt-GCC.h was added
  /usr/share/systemtap/runtime/softfloat/platform.h was added
  /usr/share/systemtap/runtime/softfloat/primitives.h was added
  /usr/share/systemtap/runtime/softfloat/primitiveTypes.h was added
  /usr/share/systemtap/runtime/softfloat/softfloat_types.h was added
  /usr/share/systemtap/runtime/softfloat/specialize.h was added
  /usr/share/systemtap/tapset/floatingpoint.stp was added
  /usr/share/systemtap/tapset/linux/errno.stpm was added
  /usr/share/systemtap/tapset/linux/tls.stp was added
  /usr/share/systemtap/tapset/sreg_arch.stpm was added
  /usr/share/systemtap/runtime/transport/relayfs.c was removed
  /usr/share/systemtap/runtime/transport/relayfs.h was removed
  /usr/share/systemtap/runtime/transport/ring_buffer.c was removed
packages/core2-32-poky-linux/systemtap/systemtap-dbg: PV changed from "4.3" to "4.4"
packages/core2-32-poky-linux/systemtap/systemtap-dbg: PKGV changed from 4.3 [default] to 4.4 [default]
packages/core2-32-poky-linux/systemtap/systemtap-dbg: PKGSIZE changed from 64079488 to 64266376 (+0%)
packages/core2-32-poky-linux/systemtap/systemtap-dev: PV changed from "4.3" to "4.4"
packages/core2-32-poky-linux/systemtap/systemtap-dev: PKGV changed from 4.3 [default] to 4.4 [default]
packages/core2-32-poky-linux/systemtap/systemtap-doc: PV changed from "4.3" to "4.4"
packages/core2-32-poky-linux/systemtap/systemtap-doc: PKGV changed from 4.3 [default] to 4.4 [default]
packages/core2-32-poky-linux/systemtap/systemtap-doc: PKGSIZE changed from 462049 to 465784 (+1%)
packages/core2-32-poky-linux/systemtap/systemtap-examples: PV changed from "4.3" to "4.4"
packages/core2-32-poky-linux/systemtap/systemtap-examples: PKGV changed from 4.3 [default] to 4.4 [default]
packages/core2-32-poky-linux/systemtap/systemtap-examples: PKGSIZE changed from 1481625 to 1486917 (+0%)
packages/core2-32-poky-linux/systemtap/systemtap-exporter: PV changed from "4.3" to "4.4"
packages/core2-32-poky-linux/systemtap/systemtap-exporter: PKGV changed from 4.3 [default] to 4.4 [default]
packages/core2-32-poky-linux/systemtap/systemtap-locale-cs: PV changed from "4.3" to "4.4"
packages/core2-32-poky-linux/systemtap/systemtap-locale-cs: PKGV changed from 4.3 [default] to 4.4 [default]
packages/core2-32-poky-linux/systemtap/systemtap-locale-cs: PKGSIZE changed from 85480 to 85339 (-0%)
packages/core2-32-poky-linux/systemtap/systemtap-locale-en: PV changed from "4.3" to "4.4"
packages/core2-32-poky-linux/systemtap/systemtap-locale-en: PKGV changed from 4.3 [default] to 4.4 [default]
packages/core2-32-poky-linux/systemtap/systemtap-locale-fr: PV changed from "4.3" to "4.4"
packages/core2-32-poky-linux/systemtap/systemtap-locale-fr: PKGV changed from 4.3 [default] to 4.4 [default]
packages/core2-32-poky-linux/systemtap/systemtap-locale-pl: PV changed from "4.3" to "4.4"
packages/core2-32-poky-linux/systemtap/systemtap-locale-pl: PKGV changed from 4.3 [default] to 4.4 [default]
packages/core2-32-poky-linux/systemtap/systemtap-python: PV changed from "4.3" to "4.4"
packages/core2-32-poky-linux/systemtap/systemtap-python: PKGV changed from 4.3 [default] to 4.4 [default]
packages/core2-32-poky-linux/systemtap/systemtap-runtime: PV changed from "4.3" to "4.4"
packages/core2-32-poky-linux/systemtap/systemtap-runtime: PKGV changed from 4.3 [default] to 4.4 [default]
packages/core2-32-poky-linux/systemtap/systemtap-runtime: PKGSIZE changed from 293256 to 280968 (-4%)
packages/core2-32-poky-linux/systemtap/systemtap-src: PV changed from "4.3" to "4.4"
packages/core2-32-poky-linux/systemtap/systemtap-src: PKGV changed from 4.3 [default] to 4.4 [default]
packages/core2-32-poky-linux/systemtap/systemtap-src: PKGSIZE changed from 2860603 to 2867440 (+0%)
packages/core2-32-poky-linux/systemtap/systemtap-staticdev: PV changed from "4.3" to "4.4"
packages/core2-32-poky-linux/systemtap/systemtap-staticdev: PKGV changed from 4.3 [default] to 4.4 [default]
packages/core2-32-poky-linux/systemtap/systemtap: PV changed from "4.3" to "4.4"
packages/core2-32-poky-linux/systemtap/systemtap: PKGV changed from 4.3 [default] to 4.4 [default]
packages/core2-32-poky-linux/systemtap/systemtap: PKGSIZE changed from 8561494 to 8864480 (+4%)
packages/qemux86-poky-linux/systemtap-uprobes: PV changed from "4.3" to "4.4"
packages/qemux86-poky-linux/systemtap-uprobes: PKGV changed from 4.3 [default] to 4.4 [default]
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-dbg: PV changed from "4.3" to "4.4"
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-dbg: PKGV changed from 4.3 [default] to 4.4 [default]
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-dev: PV changed from "4.3" to "4.4"
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-dev: PKGV changed from 4.3 [default] to 4.4 [default]
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-doc: PV changed from "4.3" to "4.4"
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-doc: PKGV changed from 4.3 [default] to 4.4 [default]
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-locale: PV changed from "4.3" to "4.4"
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-locale: PKGV changed from 4.3 [default] to 4.4 [default]
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-src: PV changed from "4.3" to "4.4"
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-src: PKGV changed from 4.3 [default] to 4.4 [default]
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-staticdev: PV changed from "4.3" to "4.4"
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-staticdev: PKGV changed from 4.3 [default] to 4.4 [default]
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes: PV changed from "4.3" to "4.4"
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes: PKGV changed from 4.3 [default] to 4.4 [default]

--===============6996744651354341095==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-systemtap-uprobes-upgrade-4.3-4.4.patch"

From 1852c2643b225101d0a763ee7dad4fdf41ff56e7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Dec 2020 10:13:05 +0000
Subject: [PATCH] systemtap-uprobes: upgrade 4.3 -> 4.4

---
 meta/recipes-kernel/systemtap/systemtap_git.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 56fa51d61e..ae735025b7 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,7 +1,7 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRCREV = "82b8e1a07a31bf37ed05d6ebc5162b054c0be9fd"
-PV = "4.3"
+SRCREV = "988f439af39a359b4387963ca4633649866d8275"
+PV = "4.4"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
-- 
2.20.1


--===============6996744651354341095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/systemtap (sysroot):
  /usr/share/systemtap/examples/general/floatingpoint.meta was added
  /usr/share/systemtap/examples/general/floatingpoint.stp was added
  /usr/share/systemtap/examples/general/floatingpoint.txt was added
  /usr/share/systemtap/runtime/linux/autoconf-atomic_fetch_add_unless.c was added
  /usr/share/systemtap/runtime/linux/autoconf-get_user_pages-notask_struct.c was added
  /usr/share/systemtap/runtime/linux/autoconf-get_user_pages_remote-notask_struct.c was added
  /usr/share/systemtap/runtime/linux/autoconf-kernel_read_file_from_path-offset.c was added
  /usr/share/systemtap/runtime/linux/autoconf-lockdown-debugfs.c was added
  /usr/share/systemtap/runtime/linux/autoconf-set_fs.c was added
  /usr/share/systemtap/runtime/linux/stp_tls.h was added
  /usr/share/systemtap/runtime/softfloat was added
  /usr/share/systemtap/runtime/softfloat.c was added
  /usr/share/systemtap/runtime/softfloat.h was added
  /usr/share/systemtap/runtime/softfloat/internals.h was added
  /usr/share/systemtap/runtime/softfloat/opt-GCC.h was added
  /usr/share/systemtap/runtime/softfloat/platform.h was added
  /usr/share/systemtap/runtime/softfloat/primitives.h was added
  /usr/share/systemtap/runtime/softfloat/primitiveTypes.h was added
  /usr/share/systemtap/runtime/softfloat/softfloat_types.h was added
  /usr/share/systemtap/runtime/softfloat/specialize.h was added
  /usr/share/systemtap/tapset/floatingpoint.stp was added
  /usr/share/systemtap/tapset/linux/errno.stpm was added
  /usr/share/systemtap/tapset/linux/tls.stp was added
  /usr/share/systemtap/tapset/sreg_arch.stpm was added
  /usr/share/systemtap/runtime/transport/relayfs.c was removed
  /usr/share/systemtap/runtime/transport/relayfs.h was removed
  /usr/share/systemtap/runtime/transport/ring_buffer.c was removed

--===============6996744651354341095==--
