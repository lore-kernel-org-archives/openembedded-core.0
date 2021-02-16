Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.5218.1613463848513890660
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id BA42538C124A
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:08 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go: upgrading to 1.15.8 SUCCEEDED
Message-ID: <MADEUP.16642CD279CF7387.7752@lists.openembedded.org>
X-Groupsio-MsgNum: 148104
Content-Type: multipart/mixed; boundary="===============2636834385316123644=="

--===============2636834385316123644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go* to *1.15.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-go-upgrade-1.15.6-1.15.8.patch
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

--===============2636834385316123644==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-go-upgrade-1.15.6-1.15.8.patch"

From e6fb4ab7092d91e4f99dd1aaa31d5e64135a76e1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Feb 2021 20:26:10 +0000
Subject: [PATCH] go: upgrade 1.15.6 -> 1.15.8

---
 meta/recipes-devtools/go/go-1.15.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.15.inc b/meta/recipes-devtools/go/go-1.15.inc
index abe74e5eb7..7c8190f68c 100644
--- a/meta/recipes-devtools/go/go-1.15.inc
+++ b/meta/recipes-devtools/go/go-1.15.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.15"
-PV = "1.15.6"
+PV = "1.15.8"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
@@ -16,4 +16,4 @@ SRC_URI += "\
     file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
 "
-SRC_URI[main.sha256sum] = "890bba73c5e2b19ffb1180e385ea225059eb008eb91b694875dd86ea48675817"
+SRC_URI[main.sha256sum] = "540c0ab7781084d124991321ed1458e479982de94454a98afab6acadf38497c2"
-- 
2.17.1


--===============2636834385316123644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86_64-linux/go-cross-core2-32 (sysroot):
  /usr/lib/i686-poky-linux/go/pkg/linux_amd64/internal/execabs.a was added
  /usr/lib/i686-poky-linux/go/src/internal/execabs was added
  /usr/lib/i686-poky-linux/go/src/internal/execabs/execabs.go was added
  /usr/lib/i686-poky-linux/go/src/internal/execabs/execabs_test.go was added

--===============2636834385316123644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
ERROR: Nothing PROVIDES 'go'
go was skipped: incompatible with host powerpc-poky-linux (not in COMPATIBLE_HOST)
Parsing of 810 .bb files complete (0 cached, 810 parsed). 1428 targets, 67 skipped, 0 masked, 0 errors.

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============2636834385316123644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/go-runtime/go-runtime-dbg: PV changed from "1.15.6" to "1.15.8"
packages/core2-32-poky-linux/go-runtime/go-runtime-dbg: PKGV changed from 1.15.6 [default] to 1.15.8 [default]
packages/core2-32-poky-linux/go-runtime/go-runtime-dev: PV changed from "1.15.6" to "1.15.8"
packages/core2-32-poky-linux/go-runtime/go-runtime-dev: PKGV changed from 1.15.6 [default] to 1.15.8 [default]
packages/core2-32-poky-linux/go-runtime/go-runtime-dev: PKGSIZE changed from 135714812 to 135823210 (+0%)
packages/core2-32-poky-linux/go-runtime/go-runtime-doc: PV changed from "1.15.6" to "1.15.8"
packages/core2-32-poky-linux/go-runtime/go-runtime-doc: PKGV changed from 1.15.6 [default] to 1.15.8 [default]
packages/core2-32-poky-linux/go-runtime/go-runtime-locale: PV changed from "1.15.6" to "1.15.8"
packages/core2-32-poky-linux/go-runtime/go-runtime-locale: PKGV changed from 1.15.6 [default] to 1.15.8 [default]
packages/core2-32-poky-linux/go-runtime/go-runtime-src: PV changed from "1.15.6" to "1.15.8"
packages/core2-32-poky-linux/go-runtime/go-runtime-src: PKGV changed from 1.15.6 [default] to 1.15.8 [default]
packages/core2-32-poky-linux/go-runtime/go-runtime-staticdev: PV changed from "1.15.6" to "1.15.8"
packages/core2-32-poky-linux/go-runtime/go-runtime-staticdev: PKGV changed from 1.15.6 [default] to 1.15.8 [default]
packages/core2-32-poky-linux/go-runtime/go-runtime-staticdev: PKGSIZE changed from 63220182 to 63288608 (+0%)
packages/core2-32-poky-linux/go-runtime/go-runtime: PV changed from "1.15.6" to "1.15.8"
packages/core2-32-poky-linux/go-runtime/go-runtime: PKGV changed from 1.15.6 [default] to 1.15.8 [default]
packages/core2-32-poky-linux/go-runtime/go-runtime: PKGSIZE changed from 28086992 to 28108828 (+0%)
packages/core2-32-poky-linux/go-runtime: PV changed from "1.15.6" to "1.15.8"
packages/core2-32-poky-linux/go-runtime: PKGV changed from 1.15.6 [default] to 1.15.8 [default]
packages/core2-32-poky-linux/go-runtime: SRC_URI changed from "http://golang.org/dl/go1.15.6.src.tar.gz;name=main file://0001-allow-CC-and-CXX-to-have-multiple-words.patch file://0002-cmd-go-make-content-based-hash-generation-less-pedan.patch file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch file://0004-ld-add-soname-to-shareable-objects.patch file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch file://0006-cmd-dist-separate-host-and-target-builds.patch file://0007-cmd-go-make-GOROOT-precious-by-default.patch file://0008-use-GOBUILDMODE-to-set-buildmode.patch" to "http://golang.org/dl/go1.15.8.src.tar.gz;name=main file://0001-allow-CC-and-CXX-to-have-multiple-words.patch file://0002-cmd-go-make-content-based-hash-generation-less-pedan.patch file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch file://0004-ld-add-soname-to-shareable-objects.patch file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch file://0006-cmd
 -dist-separate-host-and-target-builds.patch file://0007-cmd-go-make-GOROOT-precious-by-default.patch file://0008-use-GOBUILDMODE-to-set-buildmode.patch"
packages/core2-32-poky-linux/go/go-dev: PV changed from "1.15.6" to "1.15.8"
packages/core2-32-poky-linux/go/go-dev: PKGV changed from 1.15.6 [default] to 1.15.8 [default]
packages/core2-32-poky-linux/go/go-src: PV changed from "1.15.6" to "1.15.8"
packages/core2-32-poky-linux/go/go-src: PKGV changed from 1.15.6 [default] to 1.15.8 [default]
packages/core2-32-poky-linux/go/go: PV changed from "1.15.6" to "1.15.8"
packages/core2-32-poky-linux/go/go: PKGV changed from 1.15.6 [default] to 1.15.8 [default]
packages/core2-32-poky-linux/go/go: PKGSIZE changed from 81373139 to 81451859 (+0%)
packages/core2-32-poky-linux/go: PV changed from "1.15.6" to "1.15.8"
packages/core2-32-poky-linux/go: PKGV changed from 1.15.6 [default] to 1.15.8 [default]
packages/core2-32-poky-linux/go: SRC_URI changed from "http://golang.org/dl/go1.15.6.src.tar.gz;name=main file://0001-allow-CC-and-CXX-to-have-multiple-words.patch file://0002-cmd-go-make-content-based-hash-generation-less-pedan.patch file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch file://0004-ld-add-soname-to-shareable-objects.patch file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch file://0006-cmd-dist-separate-host-and-target-builds.patch file://0007-cmd-go-make-GOROOT-precious-by-default.patch file://0008-use-GOBUILDMODE-to-set-buildmode.patch" to "http://golang.org/dl/go1.15.8.src.tar.gz;name=main file://0001-allow-CC-and-CXX-to-have-multiple-words.patch file://0002-cmd-go-make-content-based-hash-generation-less-pedan.patch file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch file://0004-ld-add-soname-to-shareable-objects.patch file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch file://0006-cmd-dist-se
 parate-host-and-target-builds.patch file://0007-cmd-go-make-GOROOT-precious-by-default.patch file://0008-use-GOBUILDMODE-to-set-buildmode.patch"
Changes to packages/x86_64-linux/go-cross-core2-32 (sysroot):
  /usr/lib/i686-poky-linux/go/pkg/linux_amd64/internal/execabs.a was added
  /usr/lib/i686-poky-linux/go/src/internal/execabs was added
  /usr/lib/i686-poky-linux/go/src/internal/execabs/execabs.go was added
  /usr/lib/i686-poky-linux/go/src/internal/execabs/execabs_test.go was added

--===============2636834385316123644==--
