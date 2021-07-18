Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.13114.1626600382114071777
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jul 2021 02:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-1.yocto.io (unknown [172.29.10.61])
	by mail.yoctoproject.org (Postfix) with ESMTP id 5CB7638C12B7
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Jul 2021 09:26:21 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-runtime: upgrading to 1.16.6 FAILED
Message-ID: <MADEUP.1692D86DF71FBF7E.32522@lists.openembedded.org>
X-Groupsio-MsgNum: 153959
Content-Type: multipart/mixed; boundary="===============6484130079610249763=="

--===============6484130079610249763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go-runtime* to *1.16.6* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-go-runtime-upgrade-1.16.5-1.16.6.patch
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

--===============6484130079610249763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1458 entries from dependency cache.
Parsing recipes...ERROR: ParseError at /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-native_1.16.5.bb:4: Could not include required file go-1.16.5.inc

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============6484130079610249763==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-go-runtime-upgrade-1.16.5-1.16.6.patch"

From 2411f0b69151d56b1172a7e138fc8880e1115e06 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 18 Jul 2021 07:17:14 +0000
Subject: [PATCH] go-runtime: upgrade 1.16.5 -> 1.16.6

---
 meta/recipes-devtools/go/{go-1.16.5.inc => go-1.16.6.inc}     | 4 ++--
 .../go/{go-runtime_1.16.5.bb => go-runtime_1.16.6.bb}         | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/go/{go-1.16.5.inc => go-1.16.6.inc} (88%)
 rename meta/recipes-devtools/go/{go-runtime_1.16.5.bb => go-runtime_1.16.6.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.16.5.inc b/meta/recipes-devtools/go/go-1.16.6.inc
similarity index 88%
rename from meta/recipes-devtools/go/go-1.16.5.inc
rename to meta/recipes-devtools/go/go-1.16.6.inc
index bd928e44f8..cb71e2fbf3 100644
--- a/meta/recipes-devtools/go/go-1.16.5.inc
+++ b/meta/recipes-devtools/go/go-1.16.6.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.16"
-PV = "1.16.5"
+PV = "1.16.6"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
@@ -17,4 +17,4 @@ SRC_URI += "\
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
     file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
 "
-SRC_URI[main.sha256sum] = "7bfa7e5908c7cc9e75da5ddf3066d7cbcf3fd9fa51945851325eebc17f50ba80"
+SRC_URI[main.sha256sum] = "a3a5d4bc401b51db065e4f93b523347a4d343ae0c0b08a65c3423b05a138037d"
diff --git a/meta/recipes-devtools/go/go-runtime_1.16.5.bb b/meta/recipes-devtools/go/go-runtime_1.16.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.16.5.bb
rename to meta/recipes-devtools/go/go-runtime_1.16.6.bb
-- 
2.27.0


--===============6484130079610249763==--
