Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.12418.1602843682982633104
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 6878538C1773
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:22 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-runtime: upgrading to 1.15.3 SUCCEEDED
Message-ID: <MADEUP.163E71D687FABE92.13247@lists.openembedded.org>
X-Groupsio-MsgNum: 143424
Content-Type: multipart/mixed; boundary="===============7101721143428620159=="

--===============7101721143428620159==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go-runtime* to *1.15.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-go-runtime-upgrade-1.15.2-1.15.3.patch
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

--===============7101721143428620159==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/go-runtime (sysroot):
  /usr/lib/go/src/runtime/internal/atomic/asm_wasm.s was added
Changes to packages/x86_64-linux/go-cross-core2-32 (sysroot):
  /usr/lib/i686-poky-linux/go/src/runtime/internal/atomic/asm_wasm.s was added

--===============7101721143428620159==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 1391 entries from dependency cache.
Parsing recipes...done.
Parsing of 785 .bb files complete (778 cached, 7 parsed). 1356 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
ERROR: Nothing PROVIDES 'go-runtime'
go-runtime was skipped: incompatible with host powerpc-poky-linux (not in COMPATIBLE_HOST)

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============7101721143428620159==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-go-runtime-upgrade-1.15.2-1.15.3.patch"

From 09855d998c1758d3f82434a37e6eb6b6273e1dbf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 03:00:24 +0000
Subject: [PATCH] go-runtime: upgrade 1.15.2 -> 1.15.3

---
 meta/recipes-devtools/go/go-1.15.inc        | 4 +++-
 meta/recipes-devtools/go/go-runtime_1.15.bb | 1 +
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
diff --git a/meta/recipes-devtools/go/go-runtime_1.15.bb b/meta/recipes-devtools/go/go-runtime_1.15.bb
index 4eeee65e0c..d6ddb31ed4 100644
--- a/meta/recipes-devtools/go/go-runtime_1.15.bb
+++ b/meta/recipes-devtools/go/go-runtime_1.15.bb
@@ -1,3 +1,4 @@
 export CGO_ENABLED_riscv64 = ""
 require go-${PV}.inc
 require go-runtime.inc
+
-- 
2.18.4


--===============7101721143428620159==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/go-runtime/go-runtime-dbg: PV changed from "1.15.2" to "1.15.3"
packages/core2-32-poky-linux/go-runtime/go-runtime-dbg: PKGV changed from 1.15.2 [default] to 1.15.3 [default]
packages/core2-32-poky-linux/go-runtime/go-runtime-dev: PV changed from "1.15.2" to "1.15.3"
packages/core2-32-poky-linux/go-runtime/go-runtime-dev: PKGV changed from 1.15.2 [default] to 1.15.3 [default]
packages/core2-32-poky-linux/go-runtime/go-runtime-dev: PKGSIZE changed from 135620336 to 135582659 (-0%)
packages/core2-32-poky-linux/go-runtime/go-runtime-doc: PV changed from "1.15.2" to "1.15.3"
packages/core2-32-poky-linux/go-runtime/go-runtime-doc: PKGV changed from 1.15.2 [default] to 1.15.3 [default]
packages/core2-32-poky-linux/go-runtime/go-runtime-locale: PV changed from "1.15.2" to "1.15.3"
packages/core2-32-poky-linux/go-runtime/go-runtime-locale: PKGV changed from 1.15.2 [default] to 1.15.3 [default]
packages/core2-32-poky-linux/go-runtime/go-runtime-src: PV changed from "1.15.2" to "1.15.3"
packages/core2-32-poky-linux/go-runtime/go-runtime-src: PKGV changed from 1.15.2 [default] to 1.15.3 [default]
packages/core2-32-poky-linux/go-runtime/go-runtime-staticdev: PV changed from "1.15.2" to "1.15.3"
packages/core2-32-poky-linux/go-runtime/go-runtime-staticdev: PKGV changed from 1.15.2 [default] to 1.15.3 [default]
packages/core2-32-poky-linux/go-runtime/go-runtime-staticdev: PKGSIZE changed from 63180164 to 63133938 (-0%)
packages/core2-32-poky-linux/go-runtime/go-runtime: PV changed from "1.15.2" to "1.15.3"
packages/core2-32-poky-linux/go-runtime/go-runtime: PKGV changed from 1.15.2 [default] to 1.15.3 [default]
packages/core2-32-poky-linux/go-runtime/go-runtime: PKGSIZE changed from 28032888 to 28034192 (+0%)
packages/core2-32-poky-linux/go-runtime: PV changed from "1.15.2" to "1.15.3"
packages/core2-32-poky-linux/go-runtime: PKGV changed from 1.15.2 [default] to 1.15.3 [default]
Changes to packages/core2-32-poky-linux/go-runtime (sysroot):
  /usr/lib/go/src/runtime/internal/atomic/asm_wasm.s was added
Changes to packages/x86_64-linux/go-cross-core2-32 (sysroot):
  /usr/lib/i686-poky-linux/go/src/runtime/internal/atomic/asm_wasm.s was added

--===============7101721143428620159==--
