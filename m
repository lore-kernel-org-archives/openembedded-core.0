Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.1363.1618510600238628654
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 0527938C13BB
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:39 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go: upgrading to 1.16.3 FAILED
Message-ID: <MADEUP.16761AD0D81FBD15.12681@lists.openembedded.org>
X-Groupsio-MsgNum: 150508
Content-Type: multipart/mixed; boundary="===============1141540401738616010=="

--===============1141540401738616010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go* to *1.16.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-go-upgrade-1.16.2-1.16.3.patch
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

--===============1141540401738616010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1438 entries from dependency cache.
Parsing recipes...ERROR: ParseError at /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-cross-canadian_1.16.2.bb:2: Could not include required file go-1.16.2.inc

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============1141540401738616010==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-go-upgrade-1.16.2-1.16.3.patch"

From 0d9ffdbd1dc5fc15aa914ae2ff9678b57fcd3df6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 04:55:21 +0000
Subject: [PATCH] go: upgrade 1.16.2 -> 1.16.3

---
 meta/recipes-devtools/go/{go-1.16.2.inc => go-1.16.3.inc} | 4 ++--
 meta/recipes-devtools/go/{go_1.16.2.bb => go_1.16.3.bb}   | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/go/{go-1.16.2.inc => go-1.16.3.inc} (88%)
 rename meta/recipes-devtools/go/{go_1.16.2.bb => go_1.16.3.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.16.2.inc b/meta/recipes-devtools/go/go-1.16.3.inc
similarity index 88%
rename from meta/recipes-devtools/go/go-1.16.2.inc
rename to meta/recipes-devtools/go/go-1.16.3.inc
index e65caf8197..ebd25a5eaa 100644
--- a/meta/recipes-devtools/go/go-1.16.2.inc
+++ b/meta/recipes-devtools/go/go-1.16.3.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.16"
-PV = "1.16.2"
+PV = "1.16.3"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
@@ -17,4 +17,4 @@ SRC_URI += "\
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
     file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
 "
-SRC_URI[main.sha256sum] = "37ca14287a23cb8ba2ac3f5c3dd8adbc1f7a54b9701a57824bf19a0b271f83ea"
+SRC_URI[main.sha256sum] = "b298d29de9236ca47a023e382313bcc2d2eed31dfa706b60a04103ce83a71a25"
diff --git a/meta/recipes-devtools/go/go_1.16.2.bb b/meta/recipes-devtools/go/go_1.16.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.16.2.bb
rename to meta/recipes-devtools/go/go_1.16.3.bb
-- 
2.27.0


--===============1141540401738616010==--
