Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 453E7CA6007
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 06:11:57 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9761.1791439911673581948
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2026 23:11:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=hAaUsjFv;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20261008061147bfe902d03e000207e6-dkhtgw@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20261008061147bfe902d03e000207e6
        for <openembedded-core@lists.openembedded.org>;
        Thu, 08 Oct 2026 08:11:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=sN92xq7WpHhs0TBjriCjXG+eQaaQnBya9JNk3hEcEQg=;
 b=hAaUsjFvVW+4G+dS1IV0J03bbLmd0PaQb5Qtr20jVF0gGK5BWlMuMt5cA5yp4qr4U/WOk2
 WL3HxrY8QdoLzEcdoKHEMojOVSkUW1kQz92sZFThNWIbrN/SKG5//f0/7crM5dEc8XwswXtS
 jGjOcAeQQn5UKOThYOIMnZWTVEU50jd++g7/mQCVQQdtpu6r9aceXjEHhf69j24uuwE2xLOf
 gUCMQjXQUqTKunpvnO6vnj/GK4wBcWUIF+A6yeNfGEICPVFW4yab4Z+wiYRUYaCyRauTsYI5
 YpILgYqSlqfwD2txntehB5qgWjAlgRxwPJORun9lsLKdnfqh2m+TJN6Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] glibc: stable 2.44 branch updates to 34106fee69
Date: Thu,  8 Oct 2026 08:11:36 +0200
Message-ID: <20261008061136.6429-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 06:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247416

From: Peter Marko <peter.marko@siemens.com>

Update SRCREV to pull the latest fixes from the upstream
release/2.44/master branch, including fixes for the following CVEs:

CVE-2026-18374 CVE-2026-8674 CVE-2026-86805 CVE-2026-89092
CVE-2026-95818 CVE-2026-97399

Also mark following CVEs are fixed as they have been included in
previous hash already:

cb61572ea3 iconvdata: EUC_JISX0213 decoding lacks pending character reset (CVE-2026-80489)
6f9b2bfa50 iconvdata: SHIFT_JISX0213 decoding lacks pending character reset (CVE-2026-77117)
[CVE-2026-19499] e88b9f0e5c stdio-common: Convert vfprintf and related functions to buffers

Commits between the old SRCREV (5c479454d1) and the new SRCREV (34106fee69):

34106fee69 powerpc: Fix one byte overread in strncasecmp (bug 34683, CVE-2026-97399)
07dc0a64a3 realloc: Fix mmap non-mremap reallocation case [BZ #34697]
c90398e005 CVE-2026-89092: nscd: replace alloca with malloc in aicache, hstcache
67dd5150c6 LoongArch: Add standard search paths for 32-bit
2ee4e25c97 LoongArch: Support pointer guard on LoongArch32
6dea23eeac LoongArch: Fix intermittent nptl/tst-cancel32 failure
13fd9fe7df Revert "posix: Add POSIX aliases to some spawn functions" (BZ 34437)
1848099f06 stdlib: Don't call clearenv from __libc_setenv_freemem
[CVE-2026-86805,CVE-2026-95818] 6b48c0b29c elf: Open the normalized $ORIGIN rpath in AT_SECURE programs (BZ 34360)
1f50262410 resolv: Fix assertion failure on search list truncation [BZ 31026, CVE-2026-8674]
e01330dcec fcntl: drop nonnull attribute for openat, openat2's path argument [BZ #34313]
e58294a5a7 io: drop nonnull attribute for fchmodat, faccessat, fchownat's path argument [BZ #34313]
d7179269b7 Revert "io: drop nonnull attribute for fchmodat, faccessat, fchownat's path argument [BZ #34313]"
d19791b12a x86-64: Link tst-shstk-legacy-1{f,g} with -Wl,--no-as-needed
b14c4b0bc9 io: drop nonnull attribute for fchmodat, faccessat, fchownat's path argument [BZ #34313]
b84047b5b7 elf: Do not load cache extensions from an old-format ld.so.cache [BZ #34600]
b4f51887c4 nptl: Skip pretty-printer tests without python3 [BZ #34507]
30950ce64d libio: Add test for fopen with an empty ", ccs=" value [BZ #34574]
0b4e41fc51 libio: Fix CVE-2026-18374 heap buffer overflow in ccs= handling

Testing Results:
+--------------+--------+--------+------+
| Result       | Before | After  | Diff |
+--------------+--------+--------+------+
| PASS         | 6029   | 6031   | +2   |
| FAIL         | 76     | 74     | -2   |
| XFAIL        | 16     | 16     |  0   |
| UNSUPPORTED  | 587    | 589    | +2   |
+--------------+--------+--------+------+

Changes in testcases:                            Before   After
elf/tst-dl-cache-old-format                       ---     UNSUPPORTED
elf/tst-origin-secure                             ---     UNSUPPORTED
malloc/tst-malloc-tcache-leak-malloc-largetcache  FAIL    PASS
malloc/tst-malloc-too-large-malloc-check          FAIL    PASS
malloc/tst-mallocfork3-malloc-largetcache         FAIL    PASS
posix/tst-regcomp-truncated                       PASS    FAIL

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.44.bb     | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index b9a4539277..2fb355a29b 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.44/master"
 PV = "2.44+git"
-SRCREV_glibc ?= "5c479454d1232f71c78fa21584e90a2f57883407"
+SRCREV_glibc ?= "34106fee698c83eb0af71d4d0381e66b399be746"
 SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc_2.44.bb b/meta/recipes-core/glibc/glibc_2.44.bb
index d547f595ab..886a15f157 100644
--- a/meta/recipes-core/glibc/glibc_2.44.bb
+++ b/meta/recipes-core/glibc/glibc_2.44.bb
@@ -22,7 +22,8 @@ CVE_STATUS[CVE-2025-0577] = "not-applicable-platform: specific to RHEL patches"
 # when upgrading, clear CVE list but keep the variables
 CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
 CVE_STATUS_STABLE_BACKPORTS = "\
-    CVE-2026-5435 CVE-2026-19542 \
+    CVE-2026-5435 CVE-2026-19542 CVE-2026-18374 CVE-2026-19499 CVE-2026-77117 CVE-2026-80489 \
+    CVE-2026-8674 CVE-2026-86805 CVE-2026-89092 CVE-2026-95818 CVE-2026-97399 \
 "
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 

