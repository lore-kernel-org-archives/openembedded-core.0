Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.12224.1602843683507617570
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 6EA2238C1776
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:22 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go: upgrading to 1.15.3 SUCCEEDED
Message-ID: <MADEUP.163E71D68F8FEC53.19966@lists.openembedded.org>
X-Groupsio-MsgNum: 143432
Content-Type: multipart/mixed; boundary="===============4350457583245459490=="

--===============4350457583245459490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go* to *1.15.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-go-upgrade-1.15.2-1.15.3.patch
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

--===============4350457583245459490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86_64-linux/go-cross-core2-32 (sysroot):
  /usr/lib/i686-poky-linux/go/src/runtime/internal/atomic/asm_wasm.s was added

--===============4350457583245459490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 1391 entries from dependency cache.
Parsing recipes...done.
ERROR: Nothing PROVIDES 'go'
go was skipped: incompatible with host powerpc-poky-linux (not in COMPATIBLE_HOST)
Parsing of 785 .bb files complete (779 cached, 6 parsed). 1356 targets, 70 skipped, 0 masked, 0 errors.

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============4350457583245459490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/go-runtime/go-runtime-dbg: PKGV changed from 1.15.2 [default] to 1.15.3 [default]
packages/core2-32-poky-linux/go-runtime/go-runtime-dbg: PV changed from "1.15.2" to "1.15.3"
packages/core2-32-poky-linux/go-runtime/go-runtime-dev: PKGSIZE changed from 135620336 to 135582659 (-0%)
packages/core2-32-poky-linux/go-runtime/go-runtime-dev: PKGV changed from 1.15.2 [default] to 1.15.3 [default]
packages/core2-32-poky-linux/go-runtime/go-runtime-dev: PV changed from "1.15.2" to "1.15.3"
packages/core2-32-poky-linux/go-runtime/go-runtime-doc: PKGV changed from 1.15.2 [default] to 1.15.3 [default]
packages/core2-32-poky-linux/go-runtime/go-runtime-doc: PV changed from "1.15.2" to "1.15.3"
packages/core2-32-poky-linux/go-runtime/go-runtime-locale: PKGV changed from 1.15.2 [default] to 1.15.3 [default]
packages/core2-32-poky-linux/go-runtime/go-runtime-locale: PV changed from "1.15.2" to "1.15.3"
packages/core2-32-poky-linux/go-runtime/go-runtime-src: PKGV changed from 1.15.2 [default] to 1.15.3 [default]
packages/core2-32-poky-linux/go-runtime/go-runtime-src: PV changed from "1.15.2" to "1.15.3"
packages/core2-32-poky-linux/go-runtime/go-runtime-staticdev: PKGSIZE changed from 63180164 to 63133938 (-0%)
packages/core2-32-poky-linux/go-runtime/go-runtime-staticdev: PKGV changed from 1.15.2 [default] to 1.15.3 [default]
packages/core2-32-poky-linux/go-runtime/go-runtime-staticdev: PV changed from "1.15.2" to "1.15.3"
packages/core2-32-poky-linux/go-runtime/go-runtime: PKGSIZE changed from 28032888 to 28034192 (+0%)
packages/core2-32-poky-linux/go-runtime/go-runtime: PKGV changed from 1.15.2 [default] to 1.15.3 [default]
packages/core2-32-poky-linux/go-runtime/go-runtime: PV changed from "1.15.2" to "1.15.3"
packages/core2-32-poky-linux/go-runtime: PKGV changed from 1.15.2 [default] to 1.15.3 [default]
packages/core2-32-poky-linux/go-runtime: PV changed from "1.15.2" to "1.15.3"
packages/core2-32-poky-linux/go/go-dev: PKGV changed from 1.15.2 [default] to 1.15.3 [default]
packages/core2-32-poky-linux/go/go-dev: PV changed from "1.15.2" to "1.15.3"
packages/core2-32-poky-linux/go/go-src: PKGV changed from 1.15.2 [default] to 1.15.3 [default]
packages/core2-32-poky-linux/go/go-src: PV changed from "1.15.2" to "1.15.3"
packages/core2-32-poky-linux/go/go: PKGSIZE changed from 81336019 to 81319667 (-0%)
packages/core2-32-poky-linux/go/go: PKGV changed from 1.15.2 [default] to 1.15.3 [default]
packages/core2-32-poky-linux/go/go: PV changed from "1.15.2" to "1.15.3"
packages/core2-32-poky-linux/go: PKGV changed from 1.15.2 [default] to 1.15.3 [default]
packages/core2-32-poky-linux/go: PV changed from "1.15.2" to "1.15.3"
Changes to packages/x86_64-linux/go-cross-core2-32 (sysroot):
  /usr/lib/i686-poky-linux/go/src/runtime/internal/atomic/asm_wasm.s was added

--===============4350457583245459490==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-go-upgrade-1.15.2-1.15.3.patch"

From b4921a1e832f3e7d52d55118f2c9567e5deca246 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 03:07:29 +0000
Subject: [PATCH] go: upgrade 1.15.2 -> 1.15.3

---
 meta/recipes-devtools/go/go-1.15.inc | 4 +++-
 meta/recipes-devtools/go/go_1.15.bb  | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go-1.15.inc b/meta/recipes-devtools/go/go-1.15.inc
index 97d748b922..9987c8146f 100644
--- a/meta/recipes-devtools/go/go-1.15.inc
+++ b/meta/recipes-devtools/go/go-1.15.inc
@@ -17,4 +17,6 @@ SRC_URI += "\
     file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
 "
-SRC_URI[main.sha256sum] = "28bf9d0bcde251011caae230a4a05d917b172ea203f2a62f2c2f9533589d4b4d"
+SRC_URI[main.sha256sum] = "896a602570e54c8cdfc2c1348abd4ffd1016758d0bd086ccd9787dbfc9b64888"
+
+PV = "1.15.3"
diff --git a/meta/recipes-devtools/go/go_1.15.bb b/meta/recipes-devtools/go/go_1.15.bb
index 4bf9dd50b2..cc4c3fe45d 100644
--- a/meta/recipes-devtools/go/go_1.15.bb
+++ b/meta/recipes-devtools/go/go_1.15.bb
@@ -13,3 +13,4 @@ python() {
     if 'mips' in d.getVar('TARGET_ARCH',True) or 'riscv' in d.getVar('TARGET_ARCH',True):
         d.appendVar('INSANE_SKIP_%s' % d.getVar('PN',True), " textrel")
 }
+
-- 
2.18.4


--===============4350457583245459490==--
