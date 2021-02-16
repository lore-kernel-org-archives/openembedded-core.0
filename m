Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.5170.1613463848543488864
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 99B5038C1262
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:14 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libcap: upgrading to 2.48 SUCCEEDED
Message-ID: <MADEUP.16642CD3D6735FD1.5617@lists.openembedded.org>
X-Groupsio-MsgNum: 148157
Content-Type: multipart/mixed; boundary="===============0948976096232982089=="

--===============0948976096232982089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libcap* to *2.48* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libcap-upgrade-2.47-2.48.patch
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

--===============0948976096232982089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libcap/libcap-bin: FILELIST: removed "/usr/lib/libpsx.so.2.47 /lib/libcap.so.2.47", added "/lib/libcap.so.2.48 /usr/lib/libpsx.so.2.48"
packages/core2-32-poky-linux/libcap/libcap-dev: FILELIST: removed "/usr/lib/libpsx.so.2.47 /lib/libcap.so.2.47", added "/lib/libcap.so.2.48 /usr/lib/libpsx.so.2.48"
packages/core2-32-poky-linux/libcap/libcap-doc: FILELIST: removed "/usr/lib/libpsx.so.2.47 /lib/libcap.so.2.47", added "/lib/libcap.so.2.48 /usr/lib/libpsx.so.2.48"
packages/core2-32-poky-linux/libcap/libcap-locale: FILELIST: removed "/usr/lib/libpsx.so.2.47 /lib/libcap.so.2.47", added "/lib/libcap.so.2.48 /usr/lib/libpsx.so.2.48"
packages/core2-32-poky-linux/libcap/libcap-staticdev: FILELIST: removed "/usr/lib/libpsx.so.2.47 /lib/libcap.so.2.47", added "/lib/libcap.so.2.48 /usr/lib/libpsx.so.2.48"
packages/core2-32-poky-linux/libcap/libcap: FILELIST: removed "/usr/lib/libpsx.so.2.47 /lib/libcap.so.2.47", added "/lib/libcap.so.2.48 /usr/lib/libpsx.so.2.48"
Changes to packages/core2-32-poky-linux/libcap (sysroot):
  /lib/libcap.so.2 changed symlink target from libcap.so.2.47 to libcap.so.2.48
  /usr/lib/libpsx.so.2 changed symlink target from libpsx.so.2.47 to libpsx.so.2.48
  /lib/libcap.so.2.47 moved to /lib/libcap.so.2.48
  /usr/lib/libpsx.so.2.47 moved to /usr/lib/libpsx.so.2.48
Changes to packages/x86_64-linux/libcap-native (sysroot):
  /usr/lib/libcap.so.2 changed symlink target from libcap.so.2.47 to libcap.so.2.48
  /usr/lib/libpsx.so.2 changed symlink target from libpsx.so.2.47 to libpsx.so.2.48
  /usr/lib/libcap.so.2.47 moved to /usr/lib/libcap.so.2.48
  /usr/lib/libpsx.so.2.47 moved to /usr/lib/libpsx.so.2.48

--===============0948976096232982089==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libcap-upgrade-2.47-2.48.patch"

From e4624b5d93ea936e0228d95ec42d76ddf7dfbb00 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Tue, 16 Feb 2021 07:46:25 +0000
Subject: [PATCH] libcap: upgrade 2.47 -> 2.48

---
 meta/recipes-support/libcap/{libcap_2.47.bb => libcap_2.48.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libcap/{libcap_2.47.bb => libcap_2.48.bb} (96%)

diff --git a/meta/recipes-support/libcap/libcap_2.47.bb b/meta/recipes-support/libcap/libcap_2.48.bb
similarity index 96%
rename from meta/recipes-support/libcap/libcap_2.47.bb
rename to meta/recipes-support/libcap/libcap_2.48.bb
index bc4754eab8..d8bbebdde1 100644
--- a/meta/recipes-support/libcap/libcap_2.47.bb
+++ b/meta/recipes-support/libcap/libcap_2.48.bb
@@ -12,7 +12,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
            file://0002-tests-do-not-run-target-executables.patch \
            file://0001-tests-do-not-statically-link-a-test.patch \
            "
-SRC_URI[sha256sum] = "af165df45f9fe8b315164ec7143740947489f36ccbe6999b6cdf86e7a8dca04b"
+SRC_URI[sha256sum] = "4de9590ee09a87c282d558737ffb5b6175ccbfd26d580add10df44d0f047f6c2"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.17.1


--===============0948976096232982089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libcap: PKGV changed from 2.47 [default] to 2.48 [default]
packages/core2-32-poky-linux/libcap: SRC_URI changed from "https://cdn.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.47.tar.xz file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch file://0002-tests-do-not-run-target-executables.patch file://0001-tests-do-not-statically-link-a-test.patch" to "https://cdn.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.48.tar.xz file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch file://0002-tests-do-not-run-target-executables.patch file://0001-tests-do-not-statically-link-a-test.patch"
packages/core2-32-poky-linux/libcap: PV changed from "2.47" to "2.48"
packages/core2-32-poky-linux/libcap/libcap-bin: FILELIST: removed "/usr/lib/libpsx.so.2.47 /lib/libcap.so.2.47", added "/lib/libcap.so.2.48 /usr/lib/libpsx.so.2.48"
packages/core2-32-poky-linux/libcap/libcap-bin: PKGV changed from 2.47 [default] to 2.48 [default]
packages/core2-32-poky-linux/libcap/libcap-bin: PV changed from "2.47" to "2.48"
packages/core2-32-poky-linux/libcap/libcap-dbg: FILELIST: removed "/usr/lib/libpsx.so.2.47 /lib/libcap.so.2.47", added "/lib/libcap.so.2.48 /usr/lib/libpsx.so.2.48"
packages/core2-32-poky-linux/libcap/libcap-dbg: PKGV changed from 2.47 [default] to 2.48 [default]
packages/core2-32-poky-linux/libcap/libcap-dbg: PV changed from "2.47" to "2.48"
packages/core2-32-poky-linux/libcap/libcap-dev: FILELIST: removed "/usr/lib/libpsx.so.2.47 /lib/libcap.so.2.47", added "/lib/libcap.so.2.48 /usr/lib/libpsx.so.2.48"
packages/core2-32-poky-linux/libcap/libcap-dev: PKGV changed from 2.47 [default] to 2.48 [default]
packages/core2-32-poky-linux/libcap/libcap-dev: PV changed from "2.47" to "2.48"
packages/core2-32-poky-linux/libcap/libcap-doc: FILELIST: removed "/usr/lib/libpsx.so.2.47 /lib/libcap.so.2.47", added "/lib/libcap.so.2.48 /usr/lib/libpsx.so.2.48"
packages/core2-32-poky-linux/libcap/libcap-doc: PKGV changed from 2.47 [default] to 2.48 [default]
packages/core2-32-poky-linux/libcap/libcap-doc: PV changed from "2.47" to "2.48"
packages/core2-32-poky-linux/libcap/libcap-doc: PKGSIZE changed from 50712 to 50940 (+0%)
packages/core2-32-poky-linux/libcap/libcap-locale: FILELIST: removed "/usr/lib/libpsx.so.2.47 /lib/libcap.so.2.47", added "/lib/libcap.so.2.48 /usr/lib/libpsx.so.2.48"
packages/core2-32-poky-linux/libcap/libcap-locale: PKGV changed from 2.47 [default] to 2.48 [default]
packages/core2-32-poky-linux/libcap/libcap-locale: PV changed from "2.47" to "2.48"
packages/core2-32-poky-linux/libcap/libcap-src: FILELIST: removed "/usr/lib/libpsx.so.2.47 /lib/libcap.so.2.47", added "/lib/libcap.so.2.48 /usr/lib/libpsx.so.2.48"
packages/core2-32-poky-linux/libcap/libcap-src: PKGV changed from 2.47 [default] to 2.48 [default]
packages/core2-32-poky-linux/libcap/libcap-src: PV changed from "2.47" to "2.48"
packages/core2-32-poky-linux/libcap/libcap-src: PKGSIZE changed from 160276 to 160332 (+0%)
packages/core2-32-poky-linux/libcap/libcap-staticdev: FILELIST: removed "/usr/lib/libpsx.so.2.47 /lib/libcap.so.2.47", added "/lib/libcap.so.2.48 /usr/lib/libpsx.so.2.48"
packages/core2-32-poky-linux/libcap/libcap-staticdev: PKGV changed from 2.47 [default] to 2.48 [default]
packages/core2-32-poky-linux/libcap/libcap-staticdev: PV changed from "2.47" to "2.48"
packages/core2-32-poky-linux/libcap/libcap-staticdev: PKGSIZE changed from 126252 to 126260 (+0%)
packages/core2-32-poky-linux/libcap/libcap: FILELIST: removed "/usr/lib/libpsx.so.2.47 /lib/libcap.so.2.47", added "/lib/libcap.so.2.48 /usr/lib/libpsx.so.2.48"
packages/core2-32-poky-linux/libcap/libcap: PKGV changed from 2.47 [default] to 2.48 [default]
packages/core2-32-poky-linux/libcap/libcap: PV changed from "2.47" to "2.48"
Changes to packages/core2-32-poky-linux/libcap (sysroot):
  /lib/libcap.so.2 changed symlink target from libcap.so.2.47 to libcap.so.2.48
  /usr/lib/libpsx.so.2 changed symlink target from libpsx.so.2.47 to libpsx.so.2.48
  /lib/libcap.so.2.47 moved to /lib/libcap.so.2.48
  /usr/lib/libpsx.so.2.47 moved to /usr/lib/libpsx.so.2.48
Changes to packages/x86_64-linux/libcap-native (sysroot):
  /usr/lib/libcap.so.2 changed symlink target from libcap.so.2.47 to libcap.so.2.48
  /usr/lib/libpsx.so.2 changed symlink target from libpsx.so.2.47 to libpsx.so.2.48
  /usr/lib/libcap.so.2.47 moved to /usr/lib/libcap.so.2.48
  /usr/lib/libpsx.so.2.47 moved to /usr/lib/libpsx.so.2.48

--===============0948976096232982089==--
