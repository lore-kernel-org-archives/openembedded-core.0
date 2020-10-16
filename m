Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.12421.1602843683351804404
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 32A0738C16CA
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:22 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-boot: upgrading to 246.6 SUCCEEDED
Message-ID: <MADEUP.163E71D681FC64CB.24086@lists.openembedded.org>
X-Groupsio-MsgNum: 143426
Content-Type: multipart/mixed; boundary="===============6222971439326272417=="

--===============6222971439326272417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd-boot* to *246.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-systemd-boot-upgrade-246.2-246.6.patch
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

--===============6222971439326272417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 1375 entries from dependency cache.
Parsing recipes...done.
Parsing of 784 .bb files complete (781 cached, 3 parsed). 1353 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
ERROR: Nothing PROVIDES 'systemd-boot'
systemd-boot was skipped: incompatible with host powerpc-poky-linux (not in COMPATIBLE_HOST)

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============6222971439326272417==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-systemd-boot-upgrade-246.2-246.6.patch"

From 6934c6e9d6a2cf25e2257f4c576c074a48b489b2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 01:50:12 +0000
Subject: [PATCH] systemd-boot: upgrade 246.2 -> 246.6

---
 .../systemd/{systemd-boot_246.2.bb => systemd-boot_246.6.bb}      | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_246.2.bb => systemd-boot_246.6.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_246.2.bb b/meta/recipes-core/systemd/systemd-boot_246.6.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_246.2.bb
rename to meta/recipes-core/systemd/systemd-boot_246.6.bb
-- 
2.18.4


--===============6222971439326272417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 1375 entries from dependency cache.
Parsing recipes...done.
Parsing of 784 .bb files complete (781 cached, 3 parsed). 1353 targets, 61 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
ERROR: Nothing PROVIDES 'systemd-boot'
systemd-boot was skipped: incompatible with host mips-poky-linux (not in COMPATIBLE_HOST)

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============6222971439326272417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 1375 entries from dependency cache.
Parsing recipes...done.
Parsing of 784 .bb files complete (781 cached, 3 parsed). 1353 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the armv7vet2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
ERROR: Nothing PROVIDES 'systemd-boot'
systemd-boot was skipped: incompatible with host arm-poky-linux-gnueabi (not in COMPATIBLE_HOST)

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============6222971439326272417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/systemd-boot: PKGV changed from 246.2 [default] to 246.6 [default]
packages/core2-32-poky-linux/systemd-boot: PV changed from "246.2" to "246.6"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dbg: PKGV changed from 246.2 [default] to 246.6 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dbg: PV changed from "246.2" to "246.6"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dev: PKGV changed from 246.2 [default] to 246.6 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dev: PV changed from "246.2" to "246.6"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-doc: PKGV changed from 246.2 [default] to 246.6 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-doc: PV changed from "246.2" to "246.6"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-locale: PKGV changed from 246.2 [default] to 246.6 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-locale: PV changed from "246.2" to "246.6"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-src: PKGV changed from 246.2 [default] to 246.6 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-src: PV changed from "246.2" to "246.6"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-staticdev: PKGV changed from 246.2 [default] to 246.6 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-staticdev: PV changed from "246.2" to "246.6"
packages/core2-32-poky-linux/systemd-boot/systemd-boot: PKGV changed from 246.2 [default] to 246.6 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot: PV changed from "246.2" to "246.6"

--===============6222971439326272417==--
