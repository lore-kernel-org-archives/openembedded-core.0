Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.298.1615826520740352861
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 09:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id B2E9A38C1286
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:42:00 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] git: upgrading to 2.30.2 FAILED
Message-ID: <MADEUP.166C91A8F1A0F8EE.2480@lists.openembedded.org>
X-Groupsio-MsgNum: 149486
Content-Type: multipart/mixed; boundary="===============0913577820237608625=="

--===============0913577820237608625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *git* to *2.30.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-git-upgrade-2.30.1-2.30.2.patch
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

--===============0913577820237608625==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-git-upgrade-2.30.1-2.30.2.patch"

From 6aa1773e4cb651c0632c02425f5bb2201d823dc0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Mar 2021 05:55:35 +0000
Subject: [PATCH] git: upgrade 2.30.1 -> 2.30.2

---
 meta/recipes-devtools/git/{git_2.30.1.bb => git_2.30.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.30.1.bb => git_2.30.2.bb} (75%)

diff --git a/meta/recipes-devtools/git/git_2.30.1.bb b/meta/recipes-devtools/git/git_2.30.2.bb
similarity index 75%
rename from meta/recipes-devtools/git/git_2.30.1.bb
rename to meta/recipes-devtools/git/git_2.30.2.bb
index bc1635ada9..319140353f 100644
--- a/meta/recipes-devtools/git/git_2.30.1.bb
+++ b/meta/recipes-devtools/git/git_2.30.2.bb
@@ -5,5 +5,5 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "23a3e53f0d2dd3e62a8147b24a1a91d6ffe95b92123ef4dbae04e9a6205e71c0"
+SRC_URI[tarball.sha256sum] = "9ddea08fc7c38f1823a54a014ae2e9ecd45e1b4a06e919025f4c41f2c6a8061b"
 SRC_URI[manpages.sha256sum] = "db323e1b242e9d0337363b1e538c8b879e4c46eedbf94d3bee9e65dab6d49138"
-- 
2.17.1


--===============0913577820237608625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1438 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (813 cached, 1 parsed). 1438 targets, 31 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-aec16a75ccc8d99b73d49db86eae6eb4e3cdd844"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:aec16a75ccc8d99b73d49db86eae6eb4e3cdd844"
workspace            = "master:eec64066073428e38d5b0b6947ff302943188f65"

Initialising tasks...done.
Sstate summary: Wanted 245 Local 236 Network 0 Missed 9 Current 448 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1585 of 2197 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.30.2.bb:do_fetch)
NOTE: recipe git-2.30.2-r0: task do_fetch: Started
WARNING: git-2.30.2-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/git-manpages-2.30.2.tar.gz
Cleaning and trying again.
WARNING: git-2.30.2-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/git-manpages-2.30.2.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/git-manpages-2.30.2.tar.gz_bad-checksum_c62cb68b551214e61f0de87e7217938020bcc708011100612760812ea494b1d4
WARNING: git-2.30.2-r0 do_fetch: Checksum failure encountered with download of https://cdn.kernel.org/pub/software/scm/git/git-manpages-2.30.2.tar.gz;name=manpages - will attempt other sources if available
WARNING: git-2.30.2-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/git-manpages-2.30.2.tar.gz
Cleaning and trying again.
WARNING: git-2.30.2-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/git-manpages-2.30.2.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/git-manpages-2.30.2.tar.gz_bad-checksum_c62cb68b551214e61f0de87e7217938020bcc708011100612760812ea494b1d4
ERROR: git-2.30.2-r0 do_fetch: Checksum failure fetching https://cdn.kernel.org/pub/software/scm/git/git-manpages-2.30.2.tar.gz;name=manpages
ERROR: git-2.30.2-r0 do_fetch: Fetcher failure for URL: 'https://cdn.kernel.org/pub/software/scm/git/git-manpages-2.30.2.tar.gz;name=manpages'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/git-manpages-2.30.2.tar.gz' has sha256 checksum c62cb68b551214e61f0de87e7217938020bcc708011100612760812ea494b1d4 when db323e1b242e9d0337363b1e538c8b879e4c46eedbf94d3bee9e65dab6d49138 was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[manpages.sha256sum] = "c62cb68b551214e61f0de87e7217938020bcc708011100612760812ea494b1d4"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.30.2-r0/temp/log.do_fetch.14196
NOTE: recipe git-2.30.2-r0: task do_fetch: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.30.2.bb:do_fetch) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2183 tasks of which 2182 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.30.2.bb:do_fetch
Summary: There were 5 WARNING messages shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============0913577820237608625==--
