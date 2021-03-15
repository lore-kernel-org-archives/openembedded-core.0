Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.356.1615826521080335308
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 09:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id C70FE38C128A
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:42:00 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go: upgrading to 1.16.2 FAILED
Message-ID: <MADEUP.166C91A8F5F37DA5.27320@lists.openembedded.org>
X-Groupsio-MsgNum: 149489
Content-Type: multipart/mixed; boundary="===============7776857898671460184=="

--===============7776857898671460184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go* to *1.16.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-go-upgrade-1.16-1.16.2.patch
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

--===============7776857898671460184==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="0001-go-upgrade-1.16-1.16.2.patch"

From db8974e5e88b7e8f491a1907d3360352434e84f8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Mar 2021 06:02:35 +0000
Subject: [PATCH] go: upgrade 1.16 -> 1.16.2

---
 meta/recipes-devtools/go/{go-1.16.inc => go-1.16.2.inc}       | 4 ++--
 .../0001-allow-CC-and-CXX-to-have-multiple-words.patch        | 0
 ...cmd-go-make-content-based-hash-generation-less-pedan.patch | 0
 ...-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch | 0
 .../0004-ld-add-soname-to-shareable-objects.patch             | 0
 ...make.bash-override-CC-when-building-dist-and-go_boot.patch | 0
 .../0006-cmd-dist-separate-host-and-target-builds.patch       | 0
 .../0007-cmd-go-make-GOROOT-precious-by-default.patch         | 0
 .../0008-use-GOBUILDMODE-to-set-buildmode.patch               | 0
 ...0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch | 0
 meta/recipes-devtools/go/{go_1.16.bb => go_1.16.2.bb}         | 0
 11 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/go/{go-1.16.inc => go-1.16.2.inc} (88%)
 rename meta/recipes-devtools/go/{go-1.16 => go-1.16.2}/0001-allow-CC-and-CXX-to-have-multiple-words.patch (100%)
 rename meta/recipes-devtools/go/{go-1.16 => go-1.16.2}/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch (100%)
 rename meta/recipes-devtools/go/{go-1.16 => go-1.16.2}/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch (100%)
 rename meta/recipes-devtools/go/{go-1.16 => go-1.16.2}/0004-ld-add-soname-to-shareable-objects.patch (100%)
 rename meta/recipes-devtools/go/{go-1.16 => go-1.16.2}/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch (100%)
 rename meta/recipes-devtools/go/{go-1.16 => go-1.16.2}/0006-cmd-dist-separate-host-and-target-builds.patch (100%)
 rename meta/recipes-devtools/go/{go-1.16 => go-1.16.2}/0007-cmd-go-make-GOROOT-precious-by-default.patch (100%)
 rename meta/recipes-devtools/go/{go-1.16 => go-1.16.2}/0008-use-GOBUILDMODE-to-set-buildmode.patch (100%)
 rename meta/recipes-devtools/go/{go-1.16 => go-1.16.2}/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch (100%)
 rename meta/recipes-devtools/go/{go_1.16.bb => go_1.16.2.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.16.inc b/meta/recipes-devtools/go/go-1.16.2.inc
similarity index 88%
rename from meta/recipes-devtools/go/go-1.16.inc
rename to meta/recipes-devtools/go/go-1.16.2.inc
index 1ebbbef833..e65caf8197 100644
--- a/meta/recipes-devtools/go/go-1.16.inc
+++ b/meta/recipes-devtools/go/go-1.16.2.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.16"
-PV = "1.16"
+PV = "1.16.2"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
@@ -17,4 +17,4 @@ SRC_URI += "\
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
     file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
 "
-SRC_URI[main.sha256sum] = "7688063d55656105898f323d90a79a39c378d86fe89ae192eb3b7fc46347c95a"
+SRC_URI[main.sha256sum] = "37ca14287a23cb8ba2ac3f5c3dd8adbc1f7a54b9701a57824bf19a0b271f83ea"
diff --git a/meta/recipes-devtools/go/go-1.16/0001-allow-CC-and-CXX-to-have-multiple-words.patch b/meta/recipes-devtools/go/go-1.16.2/0001-allow-CC-and-CXX-to-have-multiple-words.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.16/0001-allow-CC-and-CXX-to-have-multiple-words.patch
rename to meta/recipes-devtools/go/go-1.16.2/0001-allow-CC-and-CXX-to-have-multiple-words.patch
diff --git a/meta/recipes-devtools/go/go-1.16/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go-1.16.2/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.16/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
rename to meta/recipes-devtools/go/go-1.16.2/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
diff --git a/meta/recipes-devtools/go/go-1.16/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch b/meta/recipes-devtools/go/go-1.16.2/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.16/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
rename to meta/recipes-devtools/go/go-1.16.2/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
diff --git a/meta/recipes-devtools/go/go-1.16/0004-ld-add-soname-to-shareable-objects.patch b/meta/recipes-devtools/go/go-1.16.2/0004-ld-add-soname-to-shareable-objects.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.16/0004-ld-add-soname-to-shareable-objects.patch
rename to meta/recipes-devtools/go/go-1.16.2/0004-ld-add-soname-to-shareable-objects.patch
diff --git a/meta/recipes-devtools/go/go-1.16/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go-1.16.2/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.16/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
rename to meta/recipes-devtools/go/go-1.16.2/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
diff --git a/meta/recipes-devtools/go/go-1.16/0006-cmd-dist-separate-host-and-target-builds.patch b/meta/recipes-devtools/go/go-1.16.2/0006-cmd-dist-separate-host-and-target-builds.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.16/0006-cmd-dist-separate-host-and-target-builds.patch
rename to meta/recipes-devtools/go/go-1.16.2/0006-cmd-dist-separate-host-and-target-builds.patch
diff --git a/meta/recipes-devtools/go/go-1.16/0007-cmd-go-make-GOROOT-precious-by-default.patch b/meta/recipes-devtools/go/go-1.16.2/0007-cmd-go-make-GOROOT-precious-by-default.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.16/0007-cmd-go-make-GOROOT-precious-by-default.patch
rename to meta/recipes-devtools/go/go-1.16.2/0007-cmd-go-make-GOROOT-precious-by-default.patch
diff --git a/meta/recipes-devtools/go/go-1.16/0008-use-GOBUILDMODE-to-set-buildmode.patch b/meta/recipes-devtools/go/go-1.16.2/0008-use-GOBUILDMODE-to-set-buildmode.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.16/0008-use-GOBUILDMODE-to-set-buildmode.patch
rename to meta/recipes-devtools/go/go-1.16.2/0008-use-GOBUILDMODE-to-set-buildmode.patch
diff --git a/meta/recipes-devtools/go/go-1.16/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch b/meta/recipes-devtools/go/go-1.16.2/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.16/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
rename to meta/recipes-devtools/go/go-1.16.2/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
diff --git a/meta/recipes-devtools/go/go_1.16.bb b/meta/recipes-devtools/go/go_1.16.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.16.bb
rename to meta/recipes-devtools/go/go_1.16.2.bb
-- 
2.17.1


--===============7776857898671460184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1438 entries from dependency cache.
Parsing recipes...ERROR: ParseError at /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-runtime_1.16.bb:1: Could not include required file go-1.16.inc

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============7776857898671460184==--
