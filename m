Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.5212.1613463848681847767
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 7712338C112E
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:08 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] git: upgrading to 2.30.1 FAILED
Message-ID: <MADEUP.16642CD26E353A28.20265@lists.openembedded.org>
X-Groupsio-MsgNum: 148099
Content-Type: multipart/mixed; boundary="===============0790087421421177328=="

--===============0790087421421177328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *git* to *2.30.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-git-upgrade-2.30.0-2.30.1.patch
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

--===============0790087421421177328==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-git-upgrade-2.30.0-2.30.1.patch"

From f1af5dee67dfc3e26b45809cc76d047e133713b7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Feb 2021 19:52:52 +0000
Subject: [PATCH] git: upgrade 2.30.0 -> 2.30.1

---
 meta/recipes-devtools/git/{git_2.30.0.bb => git_2.30.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.30.0.bb => git_2.30.1.bb} (75%)

diff --git a/meta/recipes-devtools/git/git_2.30.0.bb b/meta/recipes-devtools/git/git_2.30.1.bb
similarity index 75%
rename from meta/recipes-devtools/git/git_2.30.0.bb
rename to meta/recipes-devtools/git/git_2.30.1.bb
index 93f8ed298b..a0299982d4 100644
--- a/meta/recipes-devtools/git/git_2.30.0.bb
+++ b/meta/recipes-devtools/git/git_2.30.1.bb
@@ -5,5 +5,5 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "d24c4fa2a658318c2e66e25ab67cc30038a35696d2d39e6b12ceccf024de1e5e"
+SRC_URI[tarball.sha256sum] = "23a3e53f0d2dd3e62a8147b24a1a91d6ffe95b92123ef4dbae04e9a6205e71c0"
 SRC_URI[manpages.sha256sum] = "e23035ae232c9a5eda57db258bc3b7f1c1060cfd66920f92c7d388b6439773a6"
-- 
2.17.1


--===============0790087421421177328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1428 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (809 cached, 1 parsed). 1428 targets, 31 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-ec5fe82cc2f0991530ba1bb0c9203674cfe95f44"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ec5fe82cc2f0991530ba1bb0c9203674cfe95f44"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

Initialising tasks...done.
Sstate summary: Wanted 218 Found 209 Missed 9 Current 464 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1565 of 2165 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.30.1.bb:do_fetch)
NOTE: recipe git-2.30.1-r0: task do_fetch: Started
WARNING: git-2.30.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/git-manpages-2.30.1.tar.gz
Cleaning and trying again.
WARNING: git-2.30.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/git-manpages-2.30.1.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/git-manpages-2.30.1.tar.gz_bad-checksum_db323e1b242e9d0337363b1e538c8b879e4c46eedbf94d3bee9e65dab6d49138
WARNING: git-2.30.1-r0 do_fetch: Checksum failure encountered with download of https://cdn.kernel.org/pub/software/scm/git/git-manpages-2.30.1.tar.gz;name=manpages - will attempt other sources if available
WARNING: git-2.30.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/git-manpages-2.30.1.tar.gz
Cleaning and trying again.
WARNING: git-2.30.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/git-manpages-2.30.1.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/git-manpages-2.30.1.tar.gz_bad-checksum_db323e1b242e9d0337363b1e538c8b879e4c46eedbf94d3bee9e65dab6d49138
ERROR: git-2.30.1-r0 do_fetch: Checksum failure fetching https://cdn.kernel.org/pub/software/scm/git/git-manpages-2.30.1.tar.gz;name=manpages
ERROR: git-2.30.1-r0 do_fetch: Fetcher failure for URL: 'https://cdn.kernel.org/pub/software/scm/git/git-manpages-2.30.1.tar.gz;name=manpages'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/git-manpages-2.30.1.tar.gz' has sha256 checksum db323e1b242e9d0337363b1e538c8b879e4c46eedbf94d3bee9e65dab6d49138 when e23035ae232c9a5eda57db258bc3b7f1c1060cfd66920f92c7d388b6439773a6 was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[manpages.sha256sum] = "db323e1b242e9d0337363b1e538c8b879e4c46eedbf94d3bee9e65dab6d49138"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.30.1-r0/temp/log.do_fetch.29720
NOTE: recipe git-2.30.1-r0: task do_fetch: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.30.1.bb:do_fetch) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2151 tasks of which 2150 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.30.1.bb:do_fetch
Summary: There were 5 WARNING messages shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============0790087421421177328==--
