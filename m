Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.934.1608060223438363423
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 11:23:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 9015B38C13FF
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 19:23:43 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go: upgrading to 1.15.6 SUCCEEDED
Message-ID: <MADEUP.1650FA40F43B0120.1152@lists.openembedded.org>
X-Groupsio-MsgNum: 145672
Content-Type: multipart/mixed; boundary="===============0242608716806072400=="

--===============0242608716806072400==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go* to *1.15.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-go-upgrade-1.15.5-1.15.6.patch
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

--===============0242608716806072400==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/go-runtime/go-runtime-dbg: PV changed from "1.15.5" to "1.15.6"
packages/core2-32-poky-linux/go-runtime/go-runtime-dbg: PKGV changed from 1.15.5 [default] to 1.15.6 [default]
packages/core2-32-poky-linux/go-runtime/go-runtime-dev: PV changed from "1.15.5" to "1.15.6"
packages/core2-32-poky-linux/go-runtime/go-runtime-dev: PKGV changed from 1.15.5 [default] to 1.15.6 [default]
packages/core2-32-poky-linux/go-runtime/go-runtime-dev: PKGSIZE changed from 135691745 to 135714940 (+0%)
packages/core2-32-poky-linux/go-runtime/go-runtime-doc: PV changed from "1.15.5" to "1.15.6"
packages/core2-32-poky-linux/go-runtime/go-runtime-doc: PKGV changed from 1.15.5 [default] to 1.15.6 [default]
packages/core2-32-poky-linux/go-runtime/go-runtime-locale: PV changed from "1.15.5" to "1.15.6"
packages/core2-32-poky-linux/go-runtime/go-runtime-locale: PKGV changed from 1.15.5 [default] to 1.15.6 [default]
packages/core2-32-poky-linux/go-runtime/go-runtime-src: PV changed from "1.15.5" to "1.15.6"
packages/core2-32-poky-linux/go-runtime/go-runtime-src: PKGV changed from 1.15.5 [default] to 1.15.6 [default]
packages/core2-32-poky-linux/go-runtime/go-runtime-staticdev: PV changed from "1.15.5" to "1.15.6"
packages/core2-32-poky-linux/go-runtime/go-runtime-staticdev: PKGV changed from 1.15.5 [default] to 1.15.6 [default]
packages/core2-32-poky-linux/go-runtime/go-runtime-staticdev: PKGSIZE changed from 63197094 to 63220338 (+0%)
packages/core2-32-poky-linux/go-runtime/go-runtime: PV changed from "1.15.5" to "1.15.6"
packages/core2-32-poky-linux/go-runtime/go-runtime: PKGV changed from 1.15.5 [default] to 1.15.6 [default]
packages/core2-32-poky-linux/go-runtime/go-runtime: PKGSIZE changed from 28087512 to 28087616 (+0%)
packages/core2-32-poky-linux/go-runtime: PV changed from "1.15.5" to "1.15.6"
packages/core2-32-poky-linux/go-runtime: PKGV changed from 1.15.5 [default] to 1.15.6 [default]
packages/core2-32-poky-linux/go-runtime: SRC_URI changed from "http://golang.org/dl/go1.15.5.src.tar.gz;name=main file://0001-allow-CC-and-CXX-to-have-multiple-words.patch file://0002-cmd-go-make-content-based-hash-generation-less-pedan.patch file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch file://0004-ld-add-soname-to-shareable-objects.patch file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch file://0006-cmd-dist-separate-host-and-target-builds.patch file://0007-cmd-go-make-GOROOT-precious-by-default.patch file://0008-use-GOBUILDMODE-to-set-buildmode.patch file://0009-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch" to "http://golang.org/dl/go1.15.6.src.tar.gz;name=main file://0001-allow-CC-and-CXX-to-have-multiple-words.patch file://0002-cmd-go-make-content-based-hash-generation-less-pedan.patch file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch file://0004-ld-add-soname-to-shareable-objects.patch file://0005-make.ba
 sh-override-CC-when-building-dist-and-go_boot.patch file://0006-cmd-dist-separate-host-and-target-builds.patch file://0007-cmd-go-make-GOROOT-precious-by-default.patch file://0008-use-GOBUILDMODE-to-set-buildmode.patch"
packages/core2-32-poky-linux/go/go-dev: PV changed from "1.15.5" to "1.15.6"
packages/core2-32-poky-linux/go/go-dev: PKGV changed from 1.15.5 [default] to 1.15.6 [default]
packages/core2-32-poky-linux/go/go-src: PV changed from "1.15.5" to "1.15.6"
packages/core2-32-poky-linux/go/go-src: PKGV changed from 1.15.5 [default] to 1.15.6 [default]
packages/core2-32-poky-linux/go/go: PV changed from "1.15.5" to "1.15.6"
packages/core2-32-poky-linux/go/go: PKGV changed from 1.15.5 [default] to 1.15.6 [default]
packages/core2-32-poky-linux/go/go: PKGSIZE changed from 81348563 to 81373139 (+0%)
packages/core2-32-poky-linux/go: PV changed from "1.15.5" to "1.15.6"
packages/core2-32-poky-linux/go: PKGV changed from 1.15.5 [default] to 1.15.6 [default]
packages/core2-32-poky-linux/go: SRC_URI changed from "http://golang.org/dl/go1.15.5.src.tar.gz;name=main file://0001-allow-CC-and-CXX-to-have-multiple-words.patch file://0002-cmd-go-make-content-based-hash-generation-less-pedan.patch file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch file://0004-ld-add-soname-to-shareable-objects.patch file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch file://0006-cmd-dist-separate-host-and-target-builds.patch file://0007-cmd-go-make-GOROOT-precious-by-default.patch file://0008-use-GOBUILDMODE-to-set-buildmode.patch file://0009-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch" to "http://golang.org/dl/go1.15.6.src.tar.gz;name=main file://0001-allow-CC-and-CXX-to-have-multiple-words.patch file://0002-cmd-go-make-content-based-hash-generation-less-pedan.patch file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch file://0004-ld-add-soname-to-shareable-objects.patch file://0005-make.bash-overr
 ide-CC-when-building-dist-and-go_boot.patch file://0006-cmd-dist-separate-host-and-target-builds.patch file://0007-cmd-go-make-GOROOT-precious-by-default.patch file://0008-use-GOBUILDMODE-to-set-buildmode.patch"

--===============0242608716806072400==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-go-upgrade-1.15.5-1.15.6.patch"

From 4db002178739cb75bd18792797b515acafa520ce Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Tue, 15 Dec 2020 06:25:08 +0000
Subject: [PATCH] go: upgrade 1.15.5 -> 1.15.6

---
 meta/recipes-devtools/go/go-1.15.inc          |  25 +++--
 ...t-CGO_LDFLAGS-to-appear-in-go-ldflag.patch | 100 ------------------
 2 files changed, 12 insertions(+), 113 deletions(-)
 delete mode 100644 meta/recipes-devtools/go/go-1.15/0009-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch

diff --git a/meta/recipes-devtools/go/go-1.15.inc b/meta/recipes-devtools/go/go-1.15.inc
index ccfb0c5987..472b891f33 100644
--- a/meta/recipes-devtools/go/go-1.15.inc
+++ b/meta/recipes-devtools/go/go-1.15.inc
@@ -1,20 +1,19 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.15"
-PV = "1.15.5"
+PV = "1.15.6"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 
-SRC_URI += "\
-    file://0001-allow-CC-and-CXX-to-have-multiple-words.patch \
-    file://0002-cmd-go-make-content-based-hash-generation-less-pedan.patch \
-    file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch \
-    file://0004-ld-add-soname-to-shareable-objects.patch \
-    file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch \
-    file://0006-cmd-dist-separate-host-and-target-builds.patch \
-    file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
-    file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
-    file://0009-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch \
-"
-SRC_URI[main.sha256sum] = "c1076b90cf94b73ebed62a81d802cd84d43d02dea8c07abdc922c57a071c84f1"
+SRC_URI = "http://golang.org/dl/go${PV}.src.tar.gz;name=main \
+           file://0001-allow-CC-and-CXX-to-have-multiple-words.patch \
+           file://0002-cmd-go-make-content-based-hash-generation-less-pedan.patch \
+           file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch \
+           file://0004-ld-add-soname-to-shareable-objects.patch \
+           file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch \
+           file://0006-cmd-dist-separate-host-and-target-builds.patch \
+           file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
+           file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
+           "
+SRC_URI[main.sha256sum] = "890bba73c5e2b19ffb1180e385ea225059eb008eb91b694875dd86ea48675817"
diff --git a/meta/recipes-devtools/go/go-1.15/0009-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch b/meta/recipes-devtools/go/go-1.15/0009-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch
deleted file mode 100644
index b57041f1db..0000000000
--- a/meta/recipes-devtools/go/go-1.15/0009-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From 4759221d46b1666de96b8047cec3160bfe4d3d5d Mon Sep 17 00:00:00 2001
-From: Ian Lance Taylor <iant@golang.org>
-Date: Fri, 13 Nov 2020 11:05:37 -0800
-Subject: [PATCH] cmd/go: permit CGO_LDFLAGS to appear in //go:ldflag
-
-Fixes #42565
-
-Upstream-Status: Backport [https://github.com/golang/go/commit/782cf560db4c919790fdb476d1bbe18e5ddf5ffd]
-Change-Id: If7cf39905d124dbd54dfac6a53ee38270498efed
-Reviewed-on: https://go-review.googlesource.com/c/go/+/269818
-Trust: Ian Lance Taylor <iant@golang.org>
-Run-TryBot: Ian Lance Taylor <iant@golang.org>
-TryBot-Result: Go Bot <gobot@golang.org>
-Reviewed-by: Jay Conrod <jayconrod@google.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/cmd/go/internal/work/exec.go      | 15 +++++++++
- src/cmd/go/testdata/script/ldflag.txt | 44 +++++++++++++++++++++++++++
- 2 files changed, 59 insertions(+)
- create mode 100644 src/cmd/go/testdata/script/ldflag.txt
-
-diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
-index 575a2df..9209e3d 100644
---- a/src/cmd/go/internal/work/exec.go
-+++ b/src/cmd/go/internal/work/exec.go
-@@ -2821,6 +2821,21 @@ func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgo
- 				idx = bytes.Index(src, []byte(cgoLdflag))
- 			}
- 		}
-+
-+		// We expect to find the contents of cgoLDFLAGS in flags.
-+		if len(cgoLDFLAGS) > 0 {
-+		outer:
-+			for i := range flags {
-+				for j, f := range cgoLDFLAGS {
-+					if f != flags[i+j] {
-+						continue outer
-+					}
-+				}
-+				flags = append(flags[:i], flags[i+len(cgoLDFLAGS):]...)
-+				break
-+			}
-+		}
-+
- 		if err := checkLinkerFlags("LDFLAGS", "go:cgo_ldflag", flags); err != nil {
- 			return nil, nil, err
- 		}
-diff --git a/src/cmd/go/testdata/script/ldflag.txt b/src/cmd/go/testdata/script/ldflag.txt
-new file mode 100644
-index 0000000..6ceb33b
---- /dev/null
-+++ b/src/cmd/go/testdata/script/ldflag.txt
-@@ -0,0 +1,44 @@
-+# Issue #42565
-+
-+[!cgo] skip
-+
-+# We can't build package bad, which uses #cgo LDFLAGS.
-+cd bad
-+! go build
-+stderr no-such-warning
-+
-+# We can build package ok with the same flags in CGO_LDFLAGS.
-+env CGO_LDFLAGS=-Wno-such-warning -Wno-unknown-warning-option
-+cd ../ok
-+go build
-+
-+# Build a main program that actually uses LDFLAGS.
-+cd ..
-+go build -ldflags=-v
-+
-+# Because we passed -v the Go linker should print the external linker
-+# command which should include the flag we passed in CGO_LDFLAGS.
-+stderr no-such-warning
-+
-+-- go.mod --
-+module ldflag
-+
-+-- bad/bad.go --
-+package bad
-+
-+// #cgo LDFLAGS: -Wno-such-warning -Wno-unknown-warning
-+import "C"
-+
-+func F() {}
-+-- ok/ok.go --
-+package ok
-+
-+import "C"
-+
-+func F() {}
-+-- main.go --
-+package main
-+
-+import _ "ldflag/ok"
-+
-+func main() {}
--- 
-2.29.2
-
-- 
2.17.1


--===============0242608716806072400==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 1417 entries from dependency cache.
Parsing recipes...done.
ERROR: Nothing PROVIDES 'go'
go was skipped: incompatible with host powerpc-poky-linux (not in COMPATIBLE_HOST)
Parsing of 807 .bb files complete (801 cached, 6 parsed). 1413 targets, 66 skipped, 0 masked, 0 errors.

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============0242608716806072400==--
