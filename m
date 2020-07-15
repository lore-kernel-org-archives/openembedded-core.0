Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.98.1594831457366640100
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2020 09:44:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3AA02E01E94; Wed, 15 Jul 2020 09:44:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.2 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.111] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D80C9E01ECB
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2020 09:43:01 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-demos: upgrading to 3b117fd2dc08f3499d8985f3ddc1093e136f56ca FAILED
Message-Id: <20200715164417.3AA02E01E94@yocto-www.yoctoproject.org>
Date: Wed, 15 Jul 2020 09:44:17 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============1128010916318554130=="

--===============1128010916318554130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-demos* to *3b117fd2dc08f3499d8985f3ddc1093e136f56ca* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe vulkan-demos failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1339 entries from dependency cache.
INFO: Extracting current version source...
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20200715"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f4c3a16a7f8f88122efcf9ec14486125b6109125"
workspace            = "master:ca701cb92dcf186664d9b1f82c679e4f9cc388ec"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting upgraded version source...
WARNING: Command 'git rebase 3b117fd2dc08f3499d8985f3ddc1093e136f56ca' failed:
First, rewinding head to replay your work on top of it...
Applying: Don't build demos with questionably licensed data
Using index info to reconstruct a base tree...
M	examples/CMakeLists.txt
Falling back to patching base and 3-way merge...
Auto-merging examples/CMakeLists.txt
CONFLICT (content): Merge conflict in examples/CMakeLists.txt
error: Failed to merge in the changes.
Patch failed at 0001 Don't build demos with questionably licensed data
Use 'git am --show-current-patch' to see the failed patch

Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/vulkan-demos
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/vulkan-demos/vulkan-demos_git.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============1128010916318554130==--
