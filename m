Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.1347.1618510599283185887
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 6D76538C08EA
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:38 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnu-efi: upgrading to 3.0.13 SUCCEEDED
Message-ID: <MADEUP.16761AD09EAE9462.4047@lists.openembedded.org>
X-Groupsio-MsgNum: 150483
Content-Type: multipart/mixed; boundary="===============5458096692667988142=="

--===============5458096692667988142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnu-efi* to *3.0.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gnu-efi-upgrade-3.0.12-3.0.13.patch
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

--===============5458096692667988142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/gnu-efi (sysroot):
  /usr/include/efi/eficonex.h was added
  /usr/include/efi/lib.h was added

--===============5458096692667988142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
ERROR: Nothing PROVIDES 'gnu-efi'
gnu-efi was skipped: incompatible with host powerpc-poky-linux (not in COMPATIBLE_HOST)
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 66 skipped, 0 masked, 0 errors.

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============5458096692667988142==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-gnu-efi-upgrade-3.0.12-3.0.13.patch"

From 9a99cdec774cd989be760e94c14cecf769741a61 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 01:40:45 +0000
Subject: [PATCH] gnu-efi: upgrade 3.0.12 -> 3.0.13

---
 .../gnu-efi/{gnu-efi_3.0.12.bb => gnu-efi_3.0.13.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0.12.bb => gnu-efi_3.0.13.bb} (95%)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.13.bb
similarity index 95%
rename from meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb
rename to meta/recipes-bsp/gnu-efi/gnu-efi_3.0.13.bb
index d27126603f..fa9886037c 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.13.bb
@@ -19,8 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/files/${BP}.tar.bz2 \
            file://gnu-efi-3.0.9-fix-clang-build.patch \
            "
 
-SRC_URI[md5sum] = "926763ff37bc9db3a9035cec41eb2f45"
-SRC_URI[sha256sum] = "0196f2e1fd3c334b66e610a608a0e59233474c7a01bec7bc53989639aa327669"
+SRC_URI[sha256sum] = "2fccf715279c46ee69c4859186af8150d07a13f4d19876e5459cd65be82d3b7d"
 
 COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
 COMPATIBLE_HOST_armv4 = 'null'
-- 
2.27.0


--===============5458096692667988142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
ERROR: Nothing PROVIDES 'gnu-efi'
gnu-efi was skipped: incompatible with host mips-poky-linux (not in COMPATIBLE_HOST)
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 58 skipped, 0 masked, 0 errors.

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============5458096692667988142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gnu-efi/gnu-efi-dbg: PKGV changed from 3.0.12 [default] to 3.0.13 [default]
packages/core2-32-poky-linux/gnu-efi/gnu-efi-dbg: PV changed from "3.0.12" to "3.0.13"
packages/core2-32-poky-linux/gnu-efi/gnu-efi-dev: PKGSIZE changed from 358374 to 365662 (+2%)
packages/core2-32-poky-linux/gnu-efi/gnu-efi-dev: PKGV changed from 3.0.12 [default] to 3.0.13 [default]
packages/core2-32-poky-linux/gnu-efi/gnu-efi-dev: PV changed from "3.0.12" to "3.0.13"
packages/core2-32-poky-linux/gnu-efi/gnu-efi-doc: PKGV changed from 3.0.12 [default] to 3.0.13 [default]
packages/core2-32-poky-linux/gnu-efi/gnu-efi-doc: PV changed from "3.0.12" to "3.0.13"
packages/core2-32-poky-linux/gnu-efi/gnu-efi-locale: PKGV changed from 3.0.12 [default] to 3.0.13 [default]
packages/core2-32-poky-linux/gnu-efi/gnu-efi-locale: PV changed from "3.0.12" to "3.0.13"
packages/core2-32-poky-linux/gnu-efi/gnu-efi-src: PKGSIZE changed from 340060 to 343685 (+1%)
packages/core2-32-poky-linux/gnu-efi/gnu-efi-src: PKGV changed from 3.0.12 [default] to 3.0.13 [default]
packages/core2-32-poky-linux/gnu-efi/gnu-efi-src: PV changed from "3.0.12" to "3.0.13"
packages/core2-32-poky-linux/gnu-efi/gnu-efi-staticdev: PKGSIZE changed from 341348 to 353568 (+4%)
packages/core2-32-poky-linux/gnu-efi/gnu-efi-staticdev: PKGV changed from 3.0.12 [default] to 3.0.13 [default]
packages/core2-32-poky-linux/gnu-efi/gnu-efi-staticdev: PV changed from "3.0.12" to "3.0.13"
packages/core2-32-poky-linux/gnu-efi/gnu-efi: PKGV changed from 3.0.12 [default] to 3.0.13 [default]
packages/core2-32-poky-linux/gnu-efi/gnu-efi: PV changed from "3.0.12" to "3.0.13"
packages/core2-32-poky-linux/gnu-efi: PKGV changed from 3.0.12 [default] to 3.0.13 [default]
packages/core2-32-poky-linux/gnu-efi: PV changed from "3.0.12" to "3.0.13"
packages/core2-32-poky-linux/gnu-efi: SRC_URI changed from "https://downloads.sourceforge.net/gnu-efi/files/gnu-efi-3.0.12.tar.bz2 file://parallel-make-archives.patch file://lib-Makefile-fix-parallel-issue.patch file://gnu-efi-3.0.9-fix-clang-build.patch" to "https://downloads.sourceforge.net/gnu-efi/files/gnu-efi-3.0.13.tar.bz2 file://parallel-make-archives.patch file://lib-Makefile-fix-parallel-issue.patch file://gnu-efi-3.0.9-fix-clang-build.patch"
Changes to packages/core2-32-poky-linux/gnu-efi (sysroot):
  /usr/include/efi/eficonex.h was added
  /usr/include/efi/lib.h was added

--===============5458096692667988142==--
