Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.671.1610713822567044692
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 7FED938C13E2
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] kmod: upgrading to 28 SUCCEEDED
Message-ID: <MADEUP.165A67B075E30F96.4055@lists.openembedded.org>
X-Groupsio-MsgNum: 146791
Content-Type: multipart/mixed; boundary="===============2149964642019255327=="

--===============2149964642019255327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *kmod* to *28* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kmod-upgrade-27-28.patch
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

--===============2149964642019255327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/kmod (sysroot):
  /usr/lib/libkmod.so.2 changed symlink target from libkmod.so.2.3.5 to libkmod.so.2.3.6
  /usr/lib/libkmod.so changed symlink target from libkmod.so.2.3.5 to libkmod.so.2.3.6
  /usr/lib/libkmod.so.2.3.5 moved to /usr/lib/libkmod.so.2.3.6
Changes to packages/x86_64-linux/kmod-native (sysroot):
  /usr/lib/libkmod.so.2 changed symlink target from libkmod.so.2.3.5 to libkmod.so.2.3.6
  /usr/lib/libkmod.so changed symlink target from libkmod.so.2.3.5 to libkmod.so.2.3.6
  /usr/lib/libkmod.so.2.3.5 moved to /usr/lib/libkmod.so.2.3.6

--===============2149964642019255327==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment; filename="0001-kmod-upgrade-27-28.patch"

From c2e063be825436f82d5956cdbb861975f16fb313 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 09:37:59 +0000
Subject: [PATCH] kmod: upgrade 27 -> 28

---
 meta/recipes-kernel/kmod/kmod.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index dabda2d57e..ccda9f2b73 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -15,9 +15,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                    "
 inherit autotools gtk-doc pkgconfig manpages
 
-SRCREV = "819a125ca756003dce2d11624035b7fb605a8e99"
+SRCREV = "1ccfe994287119cc6cef37a7ca4c529d89de4b95"
 # Lookout for PV bump too when SRCREV is changed
-PV = "27"
+PV = "28"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git \
            file://depmod-search.conf \
-- 
2.27.0


--===============2149964642019255327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/kmod/kmod-bash-completion: PV changed from "27" to "28"
packages/core2-32-poky-linux/kmod/kmod-bash-completion: PKGV changed from 27 [default] to 28 [default]
packages/core2-32-poky-linux/kmod/kmod-dbg: PV changed from "27" to "28"
packages/core2-32-poky-linux/kmod/kmod-dbg: PKGV changed from 27 [default] to 28 [default]
packages/core2-32-poky-linux/kmod/kmod-dbg: PKGSIZE changed from 825808 to 826760 (+0%)
packages/core2-32-poky-linux/kmod/kmod-dev: PV changed from "27" to "28"
packages/core2-32-poky-linux/kmod/kmod-dev: PKGV changed from 27 [default] to 28 [default]
packages/core2-32-poky-linux/kmod/kmod-dev: PKGSIZE changed from 9697 to 9698 (+0%)
packages/core2-32-poky-linux/kmod/kmod-doc: PV changed from "27" to "28"
packages/core2-32-poky-linux/kmod/kmod-doc: PKGV changed from 27 [default] to 28 [default]
packages/core2-32-poky-linux/kmod/kmod-locale: PV changed from "27" to "28"
packages/core2-32-poky-linux/kmod/kmod-locale: PKGV changed from 27 [default] to 28 [default]
packages/core2-32-poky-linux/kmod/kmod-src: PV changed from "27" to "28"
packages/core2-32-poky-linux/kmod/kmod-src: PKGV changed from 27 [default] to 28 [default]
packages/core2-32-poky-linux/kmod/kmod-src: PKGSIZE changed from 388393 to 391848 (+1%)
packages/core2-32-poky-linux/kmod/kmod-staticdev: PV changed from "27" to "28"
packages/core2-32-poky-linux/kmod/kmod-staticdev: PKGV changed from 27 [default] to 28 [default]
packages/core2-32-poky-linux/kmod/kmod: PV changed from "27" to "28"
packages/core2-32-poky-linux/kmod/kmod: PKGV changed from 27 [default] to 28 [default]
packages/core2-32-poky-linux/kmod: PV changed from "27" to "28"
packages/core2-32-poky-linux/kmod: PKGV changed from 27 [default] to 28 [default]
packages/core2-32-poky-linux/kmod/libkmod: PV changed from "27" to "28"
packages/core2-32-poky-linux/kmod/libkmod: PKGV changed from 27 [default] to 28 [default]
Changes to packages/core2-32-poky-linux/kmod (sysroot):
  /usr/lib/libkmod.so.2 changed symlink target from libkmod.so.2.3.5 to libkmod.so.2.3.6
  /usr/lib/libkmod.so changed symlink target from libkmod.so.2.3.5 to libkmod.so.2.3.6
  /usr/lib/libkmod.so.2.3.5 moved to /usr/lib/libkmod.so.2.3.6
Changes to packages/x86_64-linux/kmod-native (sysroot):
  /usr/lib/libkmod.so.2 changed symlink target from libkmod.so.2.3.5 to libkmod.so.2.3.6
  /usr/lib/libkmod.so changed symlink target from libkmod.so.2.3.5 to libkmod.so.2.3.6
  /usr/lib/libkmod.so.2.3.5 moved to /usr/lib/libkmod.so.2.3.6

--===============2149964642019255327==--
