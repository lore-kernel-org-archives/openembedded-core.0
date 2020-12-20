Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.23886.1608473714255479553
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id 0AE3238C1467
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:14 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] qemu: upgrading to 5.2.0 FAILED
Message-ID: <MADEUP.1652725273B24D6A.28097@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============4469533202466070397=="

--===============4469533202466070397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *qemu* to *5.2.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe qemu failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1416 entries from dependency cache.
INFO: Extracting current version source...
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-f8e8e66f7bd276679e760e63a80dbdc1f6d411cb"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f8e8e66f7bd276679e760e63a80dbdc1f6d411cb"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 22 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.qemu.org/qemu-5.2.0.tar.xz...
Loading cache...done.
Loaded 1416 entries from dependency cache.
Parsing recipes...done.
Parsing of 808 .bb files complete (806 cached, 2 parsed). 1417 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-f8e8e66f7bd276679e760e63a80dbdc1f6d411cb"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f8e8e66f7bd276679e760e63a80dbdc1f6d411cb"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 18 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:01:00
Adding changed files:   1% |                                    | ETA:  0:00:41
Adding changed files:   2% |                                    | ETA:  0:00:36
Adding changed files:   2% |#                                   | ETA:  0:00:33
Adding changed files:   3% |#                                   | ETA:  0:00:31
Adding changed files:   4% |#                                   | ETA:  0:00:29
Adding changed files:   4% |#                                   | ETA:  0:00:27
Adding changed files:   5% |##                                  | ETA:  0:00:26
Adding changed files:   6% |##                                  | ETA:  0:00:26
Adding changed files:   7% |##                                  | ETA:  0:00:25
Adding changed files:   7% |##                                  | ETA:  0:00:25
Adding changed files:   8% |###                                 | ETA:  0:00:24
Adding changed files:   9% |###                                 | ETA:  0:00:24
Adding changed files:   9% |###                                 | ETA:  0:00:23
Adding changed files:  10% |###                                 | ETA:  0:00:23
Adding changed files:  11% |####                                | ETA:  0:00:22
Adding changed files:  12% |####                                | ETA:  0:00:22
Adding changed files:  12% |####                                | ETA:  0:00:21
Adding changed files:  13% |####                                | ETA:  0:00:21
Adding changed files:  14% |#####                               | ETA:  0:00:20
Adding changed files:  14% |#####                               | ETA:  0:00:20
Adding changed files:  15% |#####                               | ETA:  0:00:20
Adding changed files:  16% |#####                               | ETA:  0:00:19
Adding changed files:  17% |######                              | ETA:  0:00:19
Adding changed files:  17% |######                              | ETA:  0:00:19
Adding changed files:  18% |######                              | ETA:  0:00:19
Adding changed files:  19% |######                              | ETA:  0:00:18
Adding changed files:  19% |#######                             | ETA:  0:00:18
Adding changed files:  20% |#######                             | ETA:  0:00:18
Adding changed files:  21% |#######                             | ETA:  0:00:18
Adding changed files:  21% |#######                             | ETA:  0:00:17
Adding changed files:  22% |########                            | ETA:  0:00:17
Adding changed files:  23% |########                            | ETA:  0:00:17
Adding changed files:  24% |########                            | ETA:  0:00:17
Adding changed files:  24% |########                            | ETA:  0:00:17
Adding changed files:  25% |#########                           | ETA:  0:00:16
Adding changed files:  26% |#########                           | ETA:  0:00:16
Adding changed files:  26% |#########                           | ETA:  0:00:16
Adding changed files:  27% |#########                           | ETA:  0:00:16
Adding changed files:  28% |##########                          | ETA:  0:00:16
Adding changed files:  29% |##########                          | ETA:  0:00:15
Adding changed files:  29% |##########                          | ETA:  0:00:15
Adding changed files:  30% |##########                          | ETA:  0:00:15
Adding changed files:  31% |###########                         | ETA:  0:00:15
Adding changed files:  31% |###########                         | ETA:  0:00:15
Adding changed files:  32% |###########                         | ETA:  0:00:15
Adding changed files:  33% |###########                         | ETA:  0:00:16
Adding changed files:  34% |############                        | ETA:  0:00:16
Adding changed files:  34% |############                        | ETA:  0:00:16
Adding changed files:  35% |############                        | ETA:  0:00:16
Adding changed files:  36% |#############                       | ETA:  0:00:16
Adding changed files:  36% |#############                       | ETA:  0:00:15
Adding changed files:  37% |#############                       | ETA:  0:00:15
Adding changed files:  38% |#############                       | ETA:  0:00:15
Adding changed files:  38% |##############                      | ETA:  0:00:15
Adding changed files:  39% |##############                      | ETA:  0:00:15
Adding changed files:  40% |##############                      | ETA:  0:00:14
Adding changed files:  41% |##############                      | ETA:  0:00:14
Adding changed files:  41% |###############                     | ETA:  0:00:14
Adding changed files:  42% |###############                     | ETA:  0:00:14
Adding changed files:  43% |###############                     | ETA:  0:00:14
Adding changed files:  43% |###############                     | ETA:  0:00:13
Adding changed files:  44% |################                    | ETA:  0:00:13
Adding changed files:  45% |################                    | ETA:  0:00:13
Adding changed files:  46% |################                    | ETA:  0:00:13
Adding changed files:  46% |################                    | ETA:  0:00:13
Adding changed files:  47% |#################                   | ETA:  0:00:13
Adding changed files:  48% |#################                   | ETA:  0:00:13
Adding changed files:  48% |#################                   | ETA:  0:00:13
Adding changed files:  49% |#################                   | ETA:  0:00:12
Adding changed files:  50% |##################                  | ETA:  0:00:12
Adding changed files:  51% |##################                  | ETA:  0:00:12
Adding changed files:  51% |##################                  | ETA:  0:00:12
Adding changed files:  52% |##################                  | ETA:  0:00:12
Adding changed files:  53% |###################                 | ETA:  0:00:12
Adding changed files:  53% |###################                 | ETA:  0:00:11
Adding changed files:  54% |###################                 | ETA:  0:00:11
Adding changed files:  55% |###################                 | ETA:  0:00:11
Adding changed files:  56% |####################                | ETA:  0:00:11
Adding changed files:  56% |####################                | ETA:  0:00:11
Adding changed files:  57% |####################                | ETA:  0:00:11
Adding changed files:  58% |####################                | ETA:  0:00:10
Adding changed files:  58% |#####################               | ETA:  0:00:10
Adding changed files:  59% |#####################               | ETA:  0:00:10
Adding changed files:  60% |#####################               | ETA:  0:00:10
Adding changed files:  60% |#####################               | ETA:  0:00:10
Adding changed files:  61% |######################              | ETA:  0:00:09
Adding changed files:  62% |######################              | ETA:  0:00:09
Adding changed files:  63% |######################              | ETA:  0:00:09
Adding changed files:  63% |######################              | ETA:  0:00:09
Adding changed files:  64% |#######################             | ETA:  0:00:09
Adding changed files:  65% |#######################             | ETA:  0:00:09
Adding changed files:  65% |#######################             | ETA:  0:00:09
Adding changed files:  66% |#######################             | ETA:  0:00:08
Adding changed files:  67% |########################            | ETA:  0:00:08
Adding changed files:  68% |########################            | ETA:  0:00:08
Adding changed files:  68% |########################            | ETA:  0:00:08
Adding changed files:  69% |#########################           | ETA:  0:00:08
Adding changed files:  70% |#########################           | ETA:  0:00:07
Adding changed files:  70% |#########################           | ETA:  0:00:07
Adding changed files:  71% |#########################           | ETA:  0:00:07
Adding changed files:  72% |##########################          | ETA:  0:00:07
Adding changed files:  73% |##########################          | ETA:  0:00:07
Adding changed files:  73% |##########################          | ETA:  0:00:07
Adding changed files:  74% |##########################          | ETA:  0:00:06
Adding changed files:  75% |###########################         | ETA:  0:00:06
Adding changed files:  75% |###########################         | ETA:  0:00:06
Adding changed files:  76% |###########################         | ETA:  0:00:06
Adding changed files:  77% |###########################         | ETA:  0:00:06
Adding changed files:  77% |############################        | ETA:  0:00:05
Adding changed files:  78% |############################        | ETA:  0:00:05
Adding changed files:  79% |############################        | ETA:  0:00:05
Adding changed files:  80% |############################        | ETA:  0:00:05
Adding changed files:  80% |#############################       | ETA:  0:00:05
Adding changed files:  81% |#############################       | ETA:  0:00:04
Adding changed files:  82% |#############################       | ETA:  0:00:04
Adding changed files:  82% |#############################       | ETA:  0:00:04
Adding changed files:  83% |##############################      | ETA:  0:00:04
Adding changed files:  84% |##############################      | ETA:  0:00:04
Adding changed files:  85% |##############################      | ETA:  0:00:03
Adding changed files:  85% |##############################      | ETA:  0:00:03
Adding changed files:  86% |###############################     | ETA:  0:00:03
Adding changed files:  87% |###############################     | ETA:  0:00:03
Adding changed files:  87% |###############################     | ETA:  0:00:03
Adding changed files:  88% |###############################     | ETA:  0:00:03
Adding changed files:  89% |################################    | ETA:  0:00:02
Adding changed files:  90% |################################    | ETA:  0:00:02
Adding changed files:  90% |################################    | ETA:  0:00:02
Adding changed files:  91% |################################    | ETA:  0:00:02
Adding changed files:  92% |#################################   | ETA:  0:00:02
Adding changed files:  92% |#################################   | ETA:  0:00:02
Adding changed files:  93% |#################################   | ETA:  0:00:01
Adding changed files:  94% |#################################   | ETA:  0:00:01
Adding changed files:  95% |##################################  | ETA:  0:00:01
Adding changed files:  95% |##################################  | ETA:  0:00:01
Adding changed files:  96% |##################################  | ETA:  0:00:01
Adding changed files:  97% |##################################  | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:29
WARNING: Command 'git rebase 524e819ac69ca08d7b56998710236de8ffe39b43' failed:
First, rewinding head to replay your work on top of it...
Applying: qemu: Add missing wacom HID descriptor
.git/rebase-apply/patch:13: trailing whitespace.
    0x85, 0x01,		/*   Report ID (1) */ 
.git/rebase-apply/patch:40: trailing whitespace.
    0x85, 0x02,		/*   Report ID (2) */ 
.git/rebase-apply/patch:51: trailing whitespace.
    0x85, 0x02, 	/*   Report ID (2) */ 
.git/rebase-apply/patch:58: trailing whitespace.
    0x85, 0x02,   	/*   Report ID (2) */ 
.git/rebase-apply/patch:87: trailing whitespace.
    0xc0,		/*   End Collection */ 
warning: 5 lines add whitespace errors.
Using index info to reconstruct a base tree...
M	hw/usb/dev-wacom.c
Falling back to patching base and 3-way merge...
Auto-merging hw/usb/dev-wacom.c
CONFLICT (content): Merge conflict in hw/usb/dev-wacom.c
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch' to see the failed patch
Patch failed at 0001 qemu: Add missing wacom HID descriptor

Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/qemu
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/qemu/qemu_5.2.0.bb




Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============4469533202466070397==--
