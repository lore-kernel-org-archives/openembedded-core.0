Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.19854.1597558871530617417
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2020 23:21:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 647B9E02022; Sat, 15 Aug 2020 23:21:11 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BC4D6E02040
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2020 23:19:38 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] qemu: upgrading to 5.1.0 FAILED
Message-Id: <20200816062111.647B9E02022@yocto-www.yoctoproject.org>
Date: Sat, 15 Aug 2020 23:21:11 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============1528262848663365948=="

--===============1528262848663365948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *qemu* to *5.1.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe qemu failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1342 entries from dependency cache.
INFO: Extracting current version source...
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
meta-yocto-bsp       = "tmp-auh-upgrades:ed32cbdb743d602e19b5527a222fad6884779b73"
workspace            = "master:bd1da2aca0bc26720f438a9c1d54f5b04084da4e"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 22 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.qemu.org/qemu-5.1.0.tar.xz...
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
meta-yocto-bsp       = "tmp-auh-upgrades:ed32cbdb743d602e19b5527a222fad6884779b73"
workspace            = "master:bd1da2aca0bc26720f438a9c1d54f5b04084da4e"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 18 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   3% |#                                   | ETA:  0:00:07
Adding changed files:   7% |##                                  | ETA:  0:00:05
Adding changed files:  11% |####                                | ETA:  0:00:04
Adding changed files:  15% |#####                               | ETA:  0:00:04
Adding changed files:  19% |#######                             | ETA:  0:00:04
Adding changed files:  23% |########                            | ETA:  0:00:03
Adding changed files:  27% |#########                           | ETA:  0:00:03
Adding changed files:  31% |###########                         | ETA:  0:00:03
Adding changed files:  35% |############                        | ETA:  0:00:03
Adding changed files:  39% |##############                      | ETA:  0:00:02
Adding changed files:  42% |###############                     | ETA:  0:00:02
Adding changed files:  46% |################                    | ETA:  0:00:02
Adding changed files:  50% |##################                  | ETA:  0:00:02
Adding changed files:  54% |###################                 | ETA:  0:00:02
Adding changed files:  58% |#####################               | ETA:  0:00:02
Adding changed files:  62% |######################              | ETA:  0:00:01
Adding changed files:  66% |#######################             | ETA:  0:00:01
Adding changed files:  70% |#########################           | ETA:  0:00:01
Adding changed files:  74% |##########################          | ETA:  0:00:01
Adding changed files:  78% |############################        | ETA:  0:00:01
Adding changed files:  81% |#############################       | ETA:  0:00:00
Adding changed files:  85% |##############################      | ETA:  0:00:00
Adding changed files:  89% |################################    | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:04
WARNING: Command 'git rebase 984e4aaa01a6f86d0a12e2ae75d9a77cf2847158' failed:
First, rewinding head to replay your work on top of it...
Applying: qemu: Add missing wacom HID descriptor
Applying: Add subpackage -ptest which runs all unit test cases for qemu.
Applying: qemu: Add addition environment space to boot loader qemu-system-mips
Using index info to reconstruct a base tree...
A	hw/mips/mips_malta.c
Falling back to patching base and 3-way merge...
Auto-merging hw/mips/malta.c
Applying: qemu: disable Valgrind
Applying: qemu-native: set ld.bfd, fix cflags, and set some environment
Applying: chardev: connect socket to a spawned command
Using index info to reconstruct a base tree...
M	chardev/char-socket.c
M	chardev/char.c
M	qapi/char.json
Falling back to patching base and 3-way merge...
Auto-merging qapi/char.json
Auto-merging chardev/char.c
Auto-merging chardev/char-socket.c
CONFLICT (content): Merge conflict in chardev/char-socket.c
error: Failed to merge in the changes.
Patch failed at 0006 chardev: connect socket to a spawned command
Use 'git am --show-current-patch' to see the failed patch

Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/qemu
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/qemu/qemu_5.1.0.bb




Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============1528262848663365948==--
