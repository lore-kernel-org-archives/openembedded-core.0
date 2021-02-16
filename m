Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.5110.1613463848635394653
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id BCA0338C128C
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:10 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] asciidoc: upgrading to 10.0.0 FAILED
Message-ID: <MADEUP.16642CD2EDD7E1D0.5617@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============3387080635558428837=="

--===============3387080635558428837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *asciidoc* to *10.0.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe asciidoc failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1428 entries from dependency cache.
INFO: Extracting current version source...
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-d7f85ed7e011dd4d0f4b2cf48296bdf0dc7098da"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d7f85ed7e011dd4d0f4b2cf48296bdf0dc7098da"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting upgraded version source...
WARNING: Command 'git rebase 02cf718a54f4d7d84587afa30060092ab6289e0e' failed:
First, rewinding head to replay your work on top of it...
Applying: asciidoc: specify XML catalogue to use
Using index info to reconstruct a base tree...
A	a2x.py
Falling back to patching base and 3-way merge...
Auto-merging asciidoc/a2x.py
CONFLICT (content): Merge conflict in asciidoc/a2x.py
error: Failed to merge in the changes.
Patch failed at 0001 asciidoc: specify XML catalogue to use
Use 'git am --show-current-patch' to see the failed patch

Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since recipe inherits autotools-brokensep
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/asciidoc
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/asciidoc/asciidoc_10.0.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============3387080635558428837==--
