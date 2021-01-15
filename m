Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.671.1610713822567044692
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 09FAC38C1285
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] git: upgrading to 2.30.0 FAILED
Message-ID: <MADEUP.165A67B0238D97C0.24772@lists.openembedded.org>
X-Groupsio-MsgNum: 146755
Content-Type: multipart/mixed; boundary="===============6970078537749813527=="

--===============6970078537749813527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *git* to *2.30.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-git-upgrade-2.29.2-2.30.0.patch
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

--===============6970078537749813527==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-git-upgrade-2.29.2-2.30.0.patch"

From adbc3d92d774b56c0cf1d5e4f5d1bae61223f651 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 04:27:51 +0000
Subject: [PATCH] git: upgrade 2.29.2 -> 2.30.0

---
 meta/recipes-devtools/git/{git_2.29.2.bb => git_2.30.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.29.2.bb => git_2.30.0.bb} (75%)

diff --git a/meta/recipes-devtools/git/git_2.29.2.bb b/meta/recipes-devtools/git/git_2.30.0.bb
similarity index 75%
rename from meta/recipes-devtools/git/git_2.29.2.bb
rename to meta/recipes-devtools/git/git_2.30.0.bb
index 6433a2e2b7..c0e4a9a591 100644
--- a/meta/recipes-devtools/git/git_2.29.2.bb
+++ b/meta/recipes-devtools/git/git_2.30.0.bb
@@ -5,5 +5,5 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "869a121e1d75e4c28213df03d204156a17f02fce2dc77be9795b327830f54195"
+SRC_URI[tarball.sha256sum] = "d24c4fa2a658318c2e66e25ab67cc30038a35696d2d39e6b12ceccf024de1e5e"
 SRC_URI[manpages.sha256sum] = "68b258e6d590cb78e02c0df741bbaeab94cbbac6d25de9da4fb3882ee098307b"
-- 
2.27.0


--===============6970078537749813527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1420 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (809 cached, 1 parsed). 1420 targets, 33 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-77231e087aa7fdf7a623350328c567d0aa937864"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:77231e087aa7fdf7a623350328c567d0aa937864"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 148 Found 140 Missed 8 Current 536 (94% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1571 of 2171 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.30.0.bb:do_fetch)
NOTE: recipe git-2.30.0-r0: task do_fetch: Started
WARNING: git-2.30.0-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/git-manpages-2.30.0.tar.gz
Cleaning and trying again.
WARNING: git-2.30.0-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/git-manpages-2.30.0.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/git-manpages-2.30.0.tar.gz_bad-checksum_e23035ae232c9a5eda57db258bc3b7f1c1060cfd66920f92c7d388b6439773a6
WARNING: git-2.30.0-r0 do_fetch: Checksum failure encountered with download of https://cdn.kernel.org/pub/software/scm/git/git-manpages-2.30.0.tar.gz;name=manpages - will attempt other sources if available
WARNING: git-2.30.0-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/git-manpages-2.30.0.tar.gz
Cleaning and trying again.
WARNING: git-2.30.0-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/git-manpages-2.30.0.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/git-manpages-2.30.0.tar.gz_bad-checksum_e23035ae232c9a5eda57db258bc3b7f1c1060cfd66920f92c7d388b6439773a6
ERROR: git-2.30.0-r0 do_fetch: Checksum failure fetching https://cdn.kernel.org/pub/software/scm/git/git-manpages-2.30.0.tar.gz;name=manpages
ERROR: git-2.30.0-r0 do_fetch: Fetcher failure for URL: 'https://cdn.kernel.org/pub/software/scm/git/git-manpages-2.30.0.tar.gz;name=manpages'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/git-manpages-2.30.0.tar.gz' has sha256 checksum e23035ae232c9a5eda57db258bc3b7f1c1060cfd66920f92c7d388b6439773a6 when 68b258e6d590cb78e02c0df741bbaeab94cbbac6d25de9da4fb3882ee098307b was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[manpages.sha256sum] = "e23035ae232c9a5eda57db258bc3b7f1c1060cfd66920f92c7d388b6439773a6"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/git/2.30.0-r0/temp/log.do_fetch.3383568
NOTE: recipe git-2.30.0-r0: task do_fetch: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.30.0.bb:do_fetch) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2157 tasks of which 2156 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.30.0.bb:do_fetch
Summary: There were 5 WARNING messages shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============6970078537749813527==--
