Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27743.1793856421562478069
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 21:27:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gYY/FVuS;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=JDW78Ohc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a1aa2cbb19-64814f9f-4783-4cdc-956d-bf90deafc0a8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793856420;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=PSdZ5fz2TDXwKEiZRNyem7Rn8w4SLJUa4+9Rn86hSR0=;
	b=gYY/FVuS+z1+euJ1IdNaf/Gq7Ad55zkphbqPTV/DkWznsIcMSCL16NW6BLerFAu4
	xnDWRx9JiRajxpdcdo1TT/XUJapF/ew1r+bEjxUMETMS+ujcO+U04kuRJBVZnmSZZKW
	I+L7QxWK3FfsMJufI5f2QetpLxSX8+P9P1HB7IoI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793856420;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=PSdZ5fz2TDXwKEiZRNyem7Rn8w4SLJUa4+9Rn86hSR0=;
	b=JDW78Ohc7BDa726pGIeDtq1D70l/Mtvr5xeRzgckASvyp1aZFME6fsTCZpuV7kSN
	+Y9Gt1T4aPMEhjgdcqAOTIjHqCrabOiccLWSUaVEVupEEZzoYkIBZSAOJmVY74wMMfX
	7Z2AyfR3zOxvvvSVhruzeJ1iZR0M+l5Jsp/JdApg=
Content-Type: multipart/mixed; boundary="===============5265218509311375971=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] apt: upgrading to 3.0.4 SUCCEEDED
Message-ID: <010101a1aa2cbb19-64814f9f-4783-4cdc-956d-bf90deafc0a8-000000@us-west-2.amazonses.com>
Date: Thu, 5 Nov 2026 05:27:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.05-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 05:27:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249423

--===============5265218509311375971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *apt* to *3.0.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-apt-upgrade-3.0.3-3.0.4.patch
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
From c336ac2f20a6403f8acd9d4a1e7273705592a36e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 5 Nov 2026 05:12:06 +0000
Subject: [PATCH] apt: upgrade 3.0.3 -> 3.0.4

apt (3.0.4) trixie-security; urgency=medium
 -- Julian Andres Klode <jak@debian.org>  Mon, 02 Nov 2026 14:41:34 +0100
---
 ...keLists.txt-avoid-changing-install-paths-based-on.patch | 4 ++--
 .../0001-Disable-documentation-directory-altogether.patch  | 5 ++---
 .../0001-Do-not-init-tables-from-dpkg-configuration.patch  | 5 ++---
 ...ert-always-run-dpkg-configure-a-at-the-end-of-our.patch | 5 ++---
 .../apt/apt/0001-cmake-Do-not-build-po-files.patch         | 4 ++--
 .../apt/apt/0001-fix-compilation-with-musl.patch           | 7 ++-----
 meta/recipes-devtools/apt/{apt_3.0.3.bb => apt_3.0.4.bb}   | 2 +-
 7 files changed, 13 insertions(+), 19 deletions(-)
 rename meta/recipes-devtools/apt/{apt_3.0.3.bb => apt_3.0.4.bb} (98%)

diff --git a/meta/recipes-devtools/apt/apt/0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch b/meta/recipes-devtools/apt/apt/0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch
index d37aa811cd..39c12517cd 100644
--- a/meta/recipes-devtools/apt/apt/0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch
+++ b/meta/recipes-devtools/apt/apt/0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch
@@ -1,4 +1,4 @@
-From 9023589317843df4e57f8ebef1d9a8398ddb929d Mon Sep 17 00:00:00 2001
+From 2de44464abcf722decf6d33c6849639c77ea2b11 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 28 May 2020 15:34:05 +0000
 Subject: [PATCH] CMakeLists.txt: avoid changing install paths based on host
@@ -11,7 +11,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 2cd4f8e..4759812 100644
+index 99bbdba..99bded2 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -28,9 +28,9 @@ set(CMAKE_EXE_LINKER_FLAGS_COVERAGE "-lgcov")
diff --git a/meta/recipes-devtools/apt/apt/0001-Disable-documentation-directory-altogether.patch b/meta/recipes-devtools/apt/apt/0001-Disable-documentation-directory-altogether.patch
index 4bc6dce760..7ef1054095 100644
--- a/meta/recipes-devtools/apt/apt/0001-Disable-documentation-directory-altogether.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Disable-documentation-directory-altogether.patch
@@ -1,4 +1,4 @@
-From f629d1c3fcfb560ed24efc3e73d4e4999b1eab33 Mon Sep 17 00:00:00 2001
+From f504ca94efcb933293c5243b0e1bba1ec871b89b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 10 May 2019 14:16:47 +0200
 Subject: [PATCH] Disable documentation directory altogether
@@ -7,13 +7,12 @@ Even when WITH_DOC=False, the build requires po4a to generate manpages.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 668e2d762..62f441bfa 100644
+index 142fadd..99bbdba 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -251,7 +251,7 @@ add_subdirectory(apt-private)
diff --git a/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch b/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
index d21f5a49c5..ff3d0610e8 100644
--- a/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
@@ -1,4 +1,4 @@
-From b84280fec4e1d0d33eca78e76556023f8f8fe5b7 Mon Sep 17 00:00:00 2001
+From 1f9ee9f8ff3975746f0c8d8a1a4abbae87d8b584 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 10 May 2019 16:47:38 +0200
 Subject: [PATCH] Do not init tables from dpkg configuration
@@ -7,13 +7,12 @@ This would require sysroot relocation logic, and it's easier to just disable the
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  apt-pkg/init.cc | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/apt-pkg/init.cc b/apt-pkg/init.cc
-index b9d9b15d2..1725c5966 100644
+index 61d45e3..97017d2 100644
 --- a/apt-pkg/init.cc
 +++ b/apt-pkg/init.cc
 @@ -295,8 +295,8 @@ bool pkgInitSystem(Configuration &Cnf,pkgSystem *&Sys)
diff --git a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
index 43ab6a4cd8..8982adcaca 100644
--- a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
@@ -1,4 +1,4 @@
-From a2dd661484536492b47d4c88998f2bf516749bc8 Mon Sep 17 00:00:00 2001
+From 0941deecc3845bbdf2e4df226f97273e67315651 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 21 May 2020 20:13:25 +0000
 Subject: [PATCH] Revert "always run 'dpkg --configure -a' at the end of our
@@ -14,13 +14,12 @@ be passed into dpkg, and lead to the below similar error:
 
 Upstream-Status: Inappropriate [embedded specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  apt-pkg/deb/dpkgpm.cc | 9 ++-------
  1 file changed, 2 insertions(+), 7 deletions(-)
 
 diff --git a/apt-pkg/deb/dpkgpm.cc b/apt-pkg/deb/dpkgpm.cc
-index 93effa959..4375781d1 100644
+index 09f3e47..58cd80d 100644
 --- a/apt-pkg/deb/dpkgpm.cc
 +++ b/apt-pkg/deb/dpkgpm.cc
 @@ -1210,12 +1210,6 @@ void pkgDPkgPM::BuildPackagesProgressMap()
diff --git a/meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-po-files.patch b/meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-po-files.patch
index 08815a3ec4..336568e397 100644
--- a/meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-po-files.patch
+++ b/meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-po-files.patch
@@ -1,4 +1,4 @@
-From 33347f9f8301633b01af4e208b7be5fdfcb0df0c Mon Sep 17 00:00:00 2001
+From c11341dfacfb2c82366fffca43b993cdbd2c22ff Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 20 Mar 2021 14:45:18 -0700
 Subject: [PATCH] cmake: Do not build po files
@@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 9 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index be157a55f..54163ae6c 100644
+index 99bded2..17da320 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -257,15 +257,6 @@ add_subdirectory(ftparchive)
diff --git a/meta/recipes-devtools/apt/apt/0001-fix-compilation-with-musl.patch b/meta/recipes-devtools/apt/apt/0001-fix-compilation-with-musl.patch
index d3c5fe658e..34eeb19661 100644
--- a/meta/recipes-devtools/apt/apt/0001-fix-compilation-with-musl.patch
+++ b/meta/recipes-devtools/apt/apt/0001-fix-compilation-with-musl.patch
@@ -1,4 +1,4 @@
-From a6b024ceb71c43977838d625f5ac64b7e4815a56 Mon Sep 17 00:00:00 2001
+From 1a29d16ac008398dc717c925241b1b1963450359 Mon Sep 17 00:00:00 2001
 From: Gyorgy Sarvari <skandigraun@gmail.com>
 Date: Thu, 28 Aug 2025 08:11:58 +0200
 Subject: [PATCH] fix compilation with musl
@@ -24,7 +24,7 @@ Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/cmdline/apt-internal-solver.cc b/cmdline/apt-internal-solver.cc
-index ceedd96c7..74ed38c50 100644
+index ceedd96..74ed38c 100644
 --- a/cmdline/apt-internal-solver.cc
 +++ b/cmdline/apt-internal-solver.cc
 @@ -35,6 +35,7 @@
@@ -44,6 +44,3 @@ index ceedd96c7..74ed38c50 100644
  	   _config->Set("APT::Solver", "3.0");
  	else if (_config->Find("APT::Solver") != "3.0")
  	   _config->Set("APT::Solver", "internal");
--- 
-2.39.5
-
diff --git a/meta/recipes-devtools/apt/apt_3.0.3.bb b/meta/recipes-devtools/apt/apt_3.0.4.bb
similarity index 98%
rename from meta/recipes-devtools/apt/apt_3.0.3.bb
rename to meta/recipes-devtools/apt/apt_3.0.4.bb
index 393008f05e..c56819f099 100644
--- a/meta/recipes-devtools/apt/apt_3.0.3.bb
+++ b/meta/recipes-devtools/apt/apt_3.0.4.bb
@@ -23,7 +23,7 @@ SRC_URI:append:class-nativesdk = " \
            file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
            "
 
-SRC_URI[sha256sum] = "5b5f6f6d26121742a83aa80d4ed0eb0c6ce9bea259518db412edefd95760e4ef"
+SRC_URI[sha256sum] = "e853aec49afbe520ebcd4dbcbc98e1c55262c6bf1c119cf43e6aec69752443c6"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
-- 
2.47.1


--===============5265218509311375971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/apt/apt-bash-completion: PV changed from "3.0.3" to "3.0.4"
packages/x86-64-v3-poky-linux/apt/apt-bash-completion: PKGV changed from 3.0.3 [default] to 3.0.4 [default]
packages/x86-64-v3-poky-linux/apt/apt-dbg: PKGSIZE changed from 73829664 to 73827336 (-0%)
packages/x86-64-v3-poky-linux/apt/apt-dbg: PV changed from "3.0.3" to "3.0.4"
packages/x86-64-v3-poky-linux/apt/apt-dbg: PKGV changed from 3.0.3 [default] to 3.0.4 [default]
packages/x86-64-v3-poky-linux/apt/apt-dev: PV changed from "3.0.3" to "3.0.4"
packages/x86-64-v3-poky-linux/apt/apt-dev: PKGV changed from 3.0.3 [default] to 3.0.4 [default]
packages/x86-64-v3-poky-linux/apt/apt-doc: PV changed from "3.0.3" to "3.0.4"
packages/x86-64-v3-poky-linux/apt/apt-doc: PKGV changed from 3.0.3 [default] to 3.0.4 [default]
packages/x86-64-v3-poky-linux/apt/apt-locale: PV changed from "3.0.3" to "3.0.4"
packages/x86-64-v3-poky-linux/apt/apt-locale: PKGV changed from 3.0.3 [default] to 3.0.4 [default]
packages/x86-64-v3-poky-linux/apt/apt-src: PKGSIZE changed from 2978183 to 2979311 (+0%)
packages/x86-64-v3-poky-linux/apt/apt-src: FILELIST: directory renamed /usr/src/debug/apt/3.0.3/apt-private -> /usr/src/debug/apt/3.0.4/apt-private, directory renamed /usr/src/debug/apt/3.0.3/ftparchive -> /usr/src/debug/apt/3.0.4/ftparchive, directory renamed /usr/src/debug/apt/3.0.3/apt-pkg/edsp -> /usr/src/debug/apt/3.0.4/apt-pkg/edsp, directory renamed /usr/src/debug/apt/3.0.3/apt-pkg/deb -> /usr/src/debug/apt/3.0.4/apt-pkg/deb, directory renamed /usr/src/debug/apt/3.0.3/include/apt-private -> /usr/src/debug/apt/3.0.4/include/apt-private, directory renamed /usr/src/debug/apt/3.0.3/cmdline -> /usr/src/debug/apt/3.0.4/cmdline, directory renamed /usr/src/debug/apt/3.0.3/apt-pkg -> /usr/src/debug/apt/3.0.4/apt-pkg, directory renamed /usr/src/debug/apt/3.0.3/include/apt-pkg -> /usr/src/debug/apt/3.0.4/include/apt-pkg, directory renamed /usr/src/debug/apt/3.0.3/methods -> /usr/src/debug/apt/3.0.4/methods, directory renamed /usr/src/debug/apt/3.0.3/apt-pkg/contrib -> /usr/src/debug/apt/
 3.0.4/apt-pkg/contrib
packages/x86-64-v3-poky-linux/apt/apt-src: PV changed from "3.0.3" to "3.0.4"
packages/x86-64-v3-poky-linux/apt/apt-src: PKGV changed from 3.0.3 [default] to 3.0.4 [default]
packages/x86-64-v3-poky-linux/apt/apt-staticdev: PV changed from "3.0.3" to "3.0.4"
packages/x86-64-v3-poky-linux/apt/apt-staticdev: PKGV changed from 3.0.3 [default] to 3.0.4 [default]
packages/x86-64-v3-poky-linux/apt/apt: PV changed from "3.0.3" to "3.0.4"
packages/x86-64-v3-poky-linux/apt/apt: PKGV changed from 3.0.3 [default] to 3.0.4 [default]
packages/x86-64-v3-poky-linux/apt: SRC_URI changed from "http://deb.debian.org/debian/pool/main/a/apt/apt_3.0.3.tar.xz file://triehash file://0001-Disable-documentation-directory-altogether.patch file://0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch file://0001-cmake-Do-not-build-po-files.patch file://0001-fix-compilation-with-musl.patch" to "http://deb.debian.org/debian/pool/main/a/apt/apt_3.0.4.tar.xz file://triehash file://0001-Disable-documentation-directory-altogether.patch file://0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch file://0001-cmake-Do-not-build-po-files.patch file://0001-fix-compilation-with-musl.patch"
packages/x86-64-v3-poky-linux/apt: PV changed from "3.0.3" to "3.0.4"
packages/x86-64-v3-poky-linux/apt: PKGV changed from 3.0.3 [default] to 3.0.4 [default]

--===============5265218509311375971==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-apt-upgrade-3.0.3-3.0.4.patch"

RnJvbSBjMzM2YWMyZjIwYTY0MDNmOGFjZDlkNGExZTcyNzM3MDU1OTJhMzZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgNSBOb3YgMjAyNiAwNToxMjowNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGFw
dDogdXBncmFkZSAzLjAuMyAtPiAzLjAuNAoKYXB0ICgzLjAuNCkgdHJpeGllLXNlY3VyaXR5OyB1
cmdlbmN5PW1lZGl1bQogLS0gSnVsaWFuIEFuZHJlcyBLbG9kZSA8amFrQGRlYmlhbi5vcmc+ICBN
b24sIDAyIE5vdiAyMDI2IDE0OjQxOjM0ICswMTAwCi0tLQogLi4ua2VMaXN0cy50eHQtYXZvaWQt
Y2hhbmdpbmctaW5zdGFsbC1wYXRocy1iYXNlZC1vbi5wYXRjaCB8IDQgKystLQogLi4uLzAwMDEt
RGlzYWJsZS1kb2N1bWVudGF0aW9uLWRpcmVjdG9yeS1hbHRvZ2V0aGVyLnBhdGNoICB8IDUgKyst
LS0KIC4uLi8wMDAxLURvLW5vdC1pbml0LXRhYmxlcy1mcm9tLWRwa2ctY29uZmlndXJhdGlvbi5w
YXRjaCAgfCA1ICsrLS0tCiAuLi5lcnQtYWx3YXlzLXJ1bi1kcGtnLWNvbmZpZ3VyZS1hLWF0LXRo
ZS1lbmQtb2Ytb3VyLnBhdGNoIHwgNSArKy0tLQogLi4uL2FwdC9hcHQvMDAwMS1jbWFrZS1Eby1u
b3QtYnVpbGQtcG8tZmlsZXMucGF0Y2ggICAgICAgICB8IDQgKystLQogLi4uL2FwdC9hcHQvMDAw
MS1maXgtY29tcGlsYXRpb24td2l0aC1tdXNsLnBhdGNoICAgICAgICAgICB8IDcgKystLS0tLQog
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC97YXB0XzMuMC4zLmJiID0+IGFwdF8zLjAuNC5iYn0g
ICB8IDIgKy0KIDcgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25z
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC97YXB0XzMuMC4zLmJiID0+IGFw
dF8zLjAuNC5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0
L2FwdC8wMDAxLUNNYWtlTGlzdHMudHh0LWF2b2lkLWNoYW5naW5nLWluc3RhbGwtcGF0aHMtYmFz
ZWQtb24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLUNNYWtlTGlz
dHMudHh0LWF2b2lkLWNoYW5naW5nLWluc3RhbGwtcGF0aHMtYmFzZWQtb24ucGF0Y2gKaW5kZXgg
ZDM3YWE4MTFjZC4uMzljMTI1MTdjZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2FwdC9hcHQvMDAwMS1DTWFrZUxpc3RzLnR4dC1hdm9pZC1jaGFuZ2luZy1pbnN0YWxsLXBhdGhz
LWJhc2VkLW9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEt
Q01ha2VMaXN0cy50eHQtYXZvaWQtY2hhbmdpbmctaW5zdGFsbC1wYXRocy1iYXNlZC1vbi5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOTAyMzU4OTMxNzg0M2RmNGU1N2Y4ZWJlZjFkOWE4Mzk4
ZGRiOTI5ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMmRlNDQ0NjRhYmNmNzIyZGVj
ZjZkMzNjNjg0OTYzOWM3N2VhMmIxMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFs
ZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogVGh1LCAyOCBN
YXkgMjAyMCAxNTozNDowNSArMDAwMAogU3ViamVjdDogW1BBVENIXSBDTWFrZUxpc3RzLnR4dDog
YXZvaWQgY2hhbmdpbmcgaW5zdGFsbCBwYXRocyBiYXNlZCBvbiBob3N0CkBAIC0xMSw3ICsxMSw3
IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwu
Y29tPgogIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiAK
IGRpZmYgLS1naXQgYS9DTWFrZUxpc3RzLnR4dCBiL0NNYWtlTGlzdHMudHh0Ci1pbmRleCAyY2Q0
ZjhlLi40NzU5ODEyIDEwMDY0NAoraW5kZXggOTliYmRiYS4uOTliZGVkMiAxMDA2NDQKIC0tLSBh
L0NNYWtlTGlzdHMudHh0CiArKysgYi9DTWFrZUxpc3RzLnR4dAogQEAgLTI4LDkgKzI4LDkgQEAg
c2V0KENNQUtFX0VYRV9MSU5LRVJfRkxBR1NfQ09WRVJBR0UgIi1sZ2NvdiIpCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLURpc2FibGUtZG9jdW1lbnRhdGlv
bi1kaXJlY3RvcnktYWx0b2dldGhlci5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQv
YXB0LzAwMDEtRGlzYWJsZS1kb2N1bWVudGF0aW9uLWRpcmVjdG9yeS1hbHRvZ2V0aGVyLnBhdGNo
CmluZGV4IDRiYzZkY2U3NjAuLjdlZjEwNTQwOTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9hcHQvYXB0LzAwMDEtRGlzYWJsZS1kb2N1bWVudGF0aW9uLWRpcmVjdG9yeS1hbHRv
Z2V0aGVyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtRGlz
YWJsZS1kb2N1bWVudGF0aW9uLWRpcmVjdG9yeS1hbHRvZ2V0aGVyLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSBmNjI5ZDFjM2ZjZmI1NjBlZDI0ZWZjM2U3M2Q0ZTQ5OTliMWVhYjMzIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmNTA0Y2E5NGVmY2I5MzMyOTNjNTI0M2IwZTFiYmEx
ZWM4NzFiODliIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2
aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBGcmksIDEwIE1heSAyMDE5IDE0OjE2
OjQ3ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIERpc2FibGUgZG9jdW1lbnRhdGlvbiBkaXJlY3Rv
cnkgYWx0b2dldGhlcgpAQCAtNywxMyArNywxMiBAQCBFdmVuIHdoZW4gV0lUSF9ET0M9RmFsc2Us
IHRoZSBidWlsZCByZXF1aXJlcyBwbzRhIHRvIGdlbmVyYXRlIG1hbnBhZ2VzLgogCiBVcHN0cmVh
bS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW29lLWNvcmUgc3BlY2lmaWNdCiBTaWduZWQtb2ZmLWJ5
OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KLQogLS0tCiAgQ01h
a2VMaXN0cy50eHQgfCAyICstCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9DTWFrZUxpc3RzLnR4dCBiL0NNYWtlTGlzdHMudHh0
Ci1pbmRleCA2NjhlMmQ3NjIuLjYyZjQ0MWJmYSAxMDA2NDQKK2luZGV4IDE0MmZhZGQuLjk5YmJk
YmEgMTAwNjQ0CiAtLS0gYS9DTWFrZUxpc3RzLnR4dAogKysrIGIvQ01ha2VMaXN0cy50eHQKIEBA
IC0yNTEsNyArMjUxLDcgQEAgYWRkX3N1YmRpcmVjdG9yeShhcHQtcHJpdmF0ZSkKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtRG8tbm90LWluaXQtdGFibGVz
LWZyb20tZHBrZy1jb25maWd1cmF0aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Fw
dC9hcHQvMDAwMS1Eby1ub3QtaW5pdC10YWJsZXMtZnJvbS1kcGtnLWNvbmZpZ3VyYXRpb24ucGF0
Y2gKaW5kZXggZDIxZjVhNDljNS4uZmYzZDA2MTBlOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2FwdC9hcHQvMDAwMS1Eby1ub3QtaW5pdC10YWJsZXMtZnJvbS1kcGtnLWNvbmZp
Z3VyYXRpb24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1E
by1ub3QtaW5pdC10YWJsZXMtZnJvbS1kcGtnLWNvbmZpZ3VyYXRpb24ucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIGI4NDI4MGZlYzRlMWQwZDMzZWNhNzhlNzY1NTYwMjNmOGY4ZmU1YjcgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDFmOWVlOWY4ZmYzOTc1NzQ2ZjBjOGQ4YTFhNGFi
YmFlODdkOGI1ODQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2Fu
YXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgMTAgTWF5IDIwMTkgMTY6
NDc6MzggKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gRG8gbm90IGluaXQgdGFibGVzIGZyb20gZHBr
ZyBjb25maWd1cmF0aW9uCkBAIC03LDEzICs3LDEyIEBAIFRoaXMgd291bGQgcmVxdWlyZSBzeXNy
b290IHJlbG9jYXRpb24gbG9naWMsIGFuZCBpdCdzIGVhc2llciB0byBqdXN0IGRpc2FibGUgdGhl
CiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbb2UtY29yZSBzcGVjaWZpY10KIFNp
Z25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgot
CiAtLS0KICBhcHQtcGtnL2luaXQuY2MgfCA0ICsrLS0KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvYXB0LXBrZy9pbml0LmNj
IGIvYXB0LXBrZy9pbml0LmNjCi1pbmRleCBiOWQ5YjE1ZDIuLjE3MjVjNTk2NiAxMDA2NDQKK2lu
ZGV4IDYxZDQ1ZTMuLjk3MDE3ZDIgMTAwNjQ0CiAtLS0gYS9hcHQtcGtnL2luaXQuY2MKICsrKyBi
L2FwdC1wa2cvaW5pdC5jYwogQEAgLTI5NSw4ICsyOTUsOCBAQCBib29sIHBrZ0luaXRTeXN0ZW0o
Q29uZmlndXJhdGlvbiAmQ25mLHBrZ1N5c3RlbSAqJlN5cykKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtUmV2ZXJ0LWFsd2F5cy1ydW4tZHBrZy1jb25maWd1
cmUtYS1hdC10aGUtZW5kLW9mLW91ci5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQv
YXB0LzAwMDEtUmV2ZXJ0LWFsd2F5cy1ydW4tZHBrZy1jb25maWd1cmUtYS1hdC10aGUtZW5kLW9m
LW91ci5wYXRjaAppbmRleCA0M2FiNmE0Y2Q4Li44OTgyYWRjYWNhIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLVJldmVydC1hbHdheXMtcnVuLWRwa2ctY29u
ZmlndXJlLWEtYXQtdGhlLWVuZC1vZi1vdXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2FwdC9hcHQvMDAwMS1SZXZlcnQtYWx3YXlzLXJ1bi1kcGtnLWNvbmZpZ3VyZS1hLWF0LXRo
ZS1lbmQtb2Ytb3VyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBhMmRkNjYxNDg0NTM2NDky
YjQ3ZDRjODg5OThmMmJmNTE2NzQ5YmM4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAw
OTQxZGVlY2MzODQ1YmJkZjJlNGRmMjI2Zjk3MjczZTY3MzE1NjUxIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+
CiBEYXRlOiBUaHUsIDIxIE1heSAyMDIwIDIwOjEzOjI1ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hd
IFJldmVydCAiYWx3YXlzIHJ1biAnZHBrZyAtLWNvbmZpZ3VyZSAtYScgYXQgdGhlIGVuZCBvZiBv
dXIKQEAgLTE0LDEzICsxNCwxMiBAQCBiZSBwYXNzZWQgaW50byBkcGtnLCBhbmQgbGVhZCB0byB0
aGUgYmVsb3cgc2ltaWxhciBlcnJvcjoKIAogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRl
IFtlbWJlZGRlZCBzcGVjaWZpY10KIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxh
bGV4LmthbmF2aW5AZ21haWwuY29tPgotCiAtLS0KICBhcHQtcGtnL2RlYi9kcGtncG0uY2MgfCA5
ICsrLS0tLS0tLQogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25z
KC0pCiAKIGRpZmYgLS1naXQgYS9hcHQtcGtnL2RlYi9kcGtncG0uY2MgYi9hcHQtcGtnL2RlYi9k
cGtncG0uY2MKLWluZGV4IDkzZWZmYTk1OS4uNDM3NTc4MWQxIDEwMDY0NAoraW5kZXggMDlmM2U0
Ny4uNThjZDgwZCAxMDA2NDQKIC0tLSBhL2FwdC1wa2cvZGViL2Rwa2dwbS5jYwogKysrIGIvYXB0
LXBrZy9kZWIvZHBrZ3BtLmNjCiBAQCAtMTIxMCwxMiArMTIxMCw2IEBAIHZvaWQgcGtnRFBrZ1BN
OjpCdWlsZFBhY2thZ2VzUHJvZ3Jlc3NNYXAoKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2FwdC9hcHQvMDAwMS1jbWFrZS1Eby1ub3QtYnVpbGQtcG8tZmlsZXMucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLWNtYWtlLURvLW5vdC1idWlsZC1wby1m
aWxlcy5wYXRjaAppbmRleCAwODgxNWEzZWM0Li4zMzY1NjhlMzk3IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLWNtYWtlLURvLW5vdC1idWlsZC1wby1maWxl
cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLWNtYWtlLURv
LW5vdC1idWlsZC1wby1maWxlcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMzMzNDdmOWY4
MzAxNjMzYjAxYWY0ZTIwOGI3YmU1ZmRmY2IwZGYwYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gYzExMzQxZGZhY2ZiMmM4MjM2NmZmZmNhNDNiOTkzY2RiZDJjMjJmZiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRl
OiBTYXQsIDIwIE1hciAyMDIxIDE0OjQ1OjE4IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNtYWtl
OiBEbyBub3QgYnVpbGQgcG8gZmlsZXMKQEAgLTE1LDcgKzE1LDcgQEAgU2lnbmVkLW9mZi1ieTog
S2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgOSBkZWxldGlv
bnMoLSkKIAogZGlmZiAtLWdpdCBhL0NNYWtlTGlzdHMudHh0IGIvQ01ha2VMaXN0cy50eHQKLWlu
ZGV4IGJlMTU3YTU1Zi4uNTQxNjNhZTZjIDEwMDY0NAoraW5kZXggOTliZGVkMi4uMTdkYTMyMCAx
MDA2NDQKIC0tLSBhL0NNYWtlTGlzdHMudHh0CiArKysgYi9DTWFrZUxpc3RzLnR4dAogQEAgLTI1
NywxNSArMjU3LDYgQEAgYWRkX3N1YmRpcmVjdG9yeShmdHBhcmNoaXZlKQpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1maXgtY29tcGlsYXRpb24td2l0aC1t
dXNsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1maXgtY29tcGls
YXRpb24td2l0aC1tdXNsLnBhdGNoCmluZGV4IGQzYzVmZTY1OGUuLjM0ZWViMTk2NjEgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtZml4LWNvbXBpbGF0aW9u
LXdpdGgtbXVzbC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAx
LWZpeC1jb21waWxhdGlvbi13aXRoLW11c2wucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGE2
YjAyNGNlYjcxYzQzOTc3ODM4ZDYyNWY1YWM2NGI3ZTQ4MTVhNTYgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDFhMjlkMTZhYzAwODM5OGRjNzE3YzkyNTI0MWIxYjE5NjM0NTAzNTkgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBHeW9yZ3kgU2FydmFyaSA8c2thbmRpZ3JhdW5A
Z21haWwuY29tPgogRGF0ZTogVGh1LCAyOCBBdWcgMjAyNSAwODoxMTo1OCArMDIwMAogU3ViamVj
dDogW1BBVENIXSBmaXggY29tcGlsYXRpb24gd2l0aCBtdXNsCkBAIC0yNCw3ICsyNCw3IEBAIFNp
Z25lZC1vZmYtYnk6IEd5b3JneSBTYXJ2YXJpIDxza2FuZGlncmF1bkBnbWFpbC5jb20+CiAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0
IGEvY21kbGluZS9hcHQtaW50ZXJuYWwtc29sdmVyLmNjIGIvY21kbGluZS9hcHQtaW50ZXJuYWwt
c29sdmVyLmNjCi1pbmRleCBjZWVkZDk2YzcuLjc0ZWQzOGM1MCAxMDA2NDQKK2luZGV4IGNlZWRk
OTYuLjc0ZWQzOGMgMTAwNjQ0CiAtLS0gYS9jbWRsaW5lL2FwdC1pbnRlcm5hbC1zb2x2ZXIuY2MK
ICsrKyBiL2NtZGxpbmUvYXB0LWludGVybmFsLXNvbHZlci5jYwogQEAgLTM1LDYgKzM1LDcgQEAK
QEAgLTQ0LDYgKzQ0LDMgQEAgaW5kZXggY2VlZGQ5NmM3Li43NGVkMzhjNTAgMTAwNjQ0CiAgCSAg
IF9jb25maWctPlNldCgiQVBUOjpTb2x2ZXIiLCAiMy4wIik7CiAgCWVsc2UgaWYgKF9jb25maWct
PkZpbmQoIkFQVDo6U29sdmVyIikgIT0gIjMuMCIpCiAgCSAgIF9jb25maWctPlNldCgiQVBUOjpT
b2x2ZXIiLCAiaW50ZXJuYWwiKTsKLS0tIAotMi4zOS41Ci0KZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9hcHQvYXB0XzMuMC4zLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Fw
dC9hcHRfMy4wLjQuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2FwdC9hcHRfMy4wLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9hcHQvYXB0XzMuMC40LmJiCmluZGV4IDM5MzAwOGYwNWUuLmM1NjgxOWYwOTkgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0XzMuMC4zLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0XzMuMC40LmJiCkBAIC0yMyw3ICsyMyw3IEBAIFNSQ19V
Ukk6YXBwZW5kOmNsYXNzLW5hdGl2ZXNkayA9ICIgXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1S
ZXZlcnQtYWx3YXlzLXJ1bi1kcGtnLWNvbmZpZ3VyZS1hLWF0LXRoZS1lbmQtb2Ytb3VyLnBhdGNo
IFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNWI1ZjZmNmQyNjEyMTc0
MmE4M2FhODBkNGVkMGViMGM2Y2U5YmVhMjU5NTE4ZGI0MTJlZGVmZDk1NzYwZTRlZiIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICJlODUzYWVjNDlhZmJlNTIwZWJjZDRkYmNiYzk4ZTFjNTUyNjJjNmJm
MWMxMTljZjQzZTZhZWM2OTc1MjQ0M2M2IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09Q
WUlORy5HUEw7bWQ1PWIyMzRlZTRkNjlmNWZjZTQ0ODZhODBmZGFmNGE0MjYzIgogCiAjIHRoZSBw
YWNrYWdlIGlzIHRha2VuIGZyb20gc25hcHNob3RzLmRlYmlhbi5vcmc7IHRoYXQgc291cmNlIGlz
IHN0YXRpYyBhbmQgZ29lcyBzdGFsZQotLSAKMi40Ny4xCgo=

--===============5265218509311375971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="apt-changelog.txt"

apt (3.0.4) trixie-security; urgency=medium
 -- Julian Andres Klode <jak@debian.org>  Mon, 02 Nov 2026 14:41:34 +0100

--===============5265218509311375971==--
