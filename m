Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.19785.1597558791520770918
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2020 23:19:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 62D60E02027; Sat, 15 Aug 2020 23:19:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.2 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.111] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CD429E02028
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2020 23:19:36 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gettext: upgrading to 0.21 FAILED
Message-Id: <20200816061951.62D60E02027@yocto-www.yoctoproject.org>
Date: Sat, 15 Aug 2020 23:19:51 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============5881692592737221545=="

--===============5881692592737221545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gettext* to *0.21* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gettext failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1342 entries from dependency cache.
INFO: Extracting current version source...
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20200815"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:201806bf7d22d64827ad3acff97b8a951c57df8e"
workspace            = "master:bd1da2aca0bc26720f438a9c1d54f5b04084da4e"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftp.gnu.org/gnu/gettext/gettext-0.21.tar.gz...
Loading cache...done.
Loaded 1342 entries from dependency cache.
Parsing recipes...done.
Parsing of 779 .bb files complete (777 cached, 2 parsed). 1343 targets, 33 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20200815"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:201806bf7d22d64827ad3acff97b8a951c57df8e"
workspace            = "master:bd1da2aca0bc26720f438a9c1d54f5b04084da4e"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   4% |#                                   | ETA:  0:00:01
Adding changed files:   8% |###                                 | ETA:  0:00:01
Adding changed files:  12% |####                                | ETA:  0:00:01
Adding changed files:  17% |######                              | ETA:  0:00:01
Adding changed files:  21% |#######                             | ETA:  0:00:01
Adding changed files:  25% |#########                           | ETA:  0:00:01
Adding changed files:  30% |##########                          | ETA:  0:00:01
Adding changed files:  34% |############                        | ETA:  0:00:01
Adding changed files:  38% |##############                      | ETA:  0:00:00
Adding changed files:  43% |###############                     | ETA:  0:00:00
Adding changed files:  47% |#################                   | ETA:  0:00:00
Adding changed files:  51% |##################                  | ETA:  0:00:00
Adding changed files:  56% |####################                | ETA:  0:00:00
Adding changed files:  60% |#####################               | ETA:  0:00:00
Adding changed files:  64% |#######################             | ETA:  0:00:00
Adding changed files:  69% |########################            | ETA:  0:00:00
Adding changed files:  73% |##########################          | ETA:  0:00:00
Adding changed files:  77% |############################        | ETA:  0:00:00
Adding changed files:  82% |#############################       | ETA:  0:00:00
Adding changed files:  86% |###############################     | ETA:  0:00:00
Adding changed files:  90% |################################    | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:02
WARNING: Command 'git rebase 61df3a2619f9620639552c21f4de1c3639b4af45' failed:
First, rewinding head to replay your work on top of it...
Applying: instal libgettextlib.a before removing it
Applying: m4/bison-i18n.m4: add --with-bisonlocaledir to assign BISON_LOCALEDIR
Using index info to reconstruct a base tree...
M	gettext-tools/gnulib-m4/bison-i18n.m4
Falling back to patching base and 3-way merge...
Auto-merging gettext-tools/gnulib-m4/bison-i18n.m4
CONFLICT (content): Merge conflict in gettext-tools/gnulib-m4/bison-i18n.m4
error: Failed to merge in the changes.
Patch failed at 0002 m4/bison-i18n.m4: add --with-bisonlocaledir to assign BISON_LOCALEDIR
Use 'git am --show-current-patch' to see the failed patch

Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/gettext
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/gettext/gettext_0.21.bb




Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============5881692592737221545==--
