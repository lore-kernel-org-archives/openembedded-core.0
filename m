Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A1BC6FD1B
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 13:59:57 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web08.12624.1662040786584669834
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=JzW9SiVT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 01010182f959c33a-930252f7-04c0-45dd-a21c-894a32318cac-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1662040785;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8R61/YUk8BKCrI1d0wpG2aMiGJ2QS/CQn29lNgq5W/c=;
	b=JzW9SiVTLX5zNQraW5NrDdcRoYG7T6CyqrR12ri4u890xYoLrZe8bxm3cYUa9xZr
	hcEHl+EL+kMG18GySjQUmcx61kfFJLGxg1AL+ZCNY0ZgRyAC7nmUKTaFjaVMpFOyayG
	uvrTxlnR0XgHCZfcirz2K5dYvjgSOJ+VS4Hjp8no=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1662040785;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8R61/YUk8BKCrI1d0wpG2aMiGJ2QS/CQn29lNgq5W/c=;
	b=ABoYzhLaMWrXdyf1JUtWkJu+w8t0JTI0evY04RB1RKg1lJMpjA+5ZPwHYKP4J6Yu
	abaJtC/gR0qNoX6qeQRgev4H8rw6b5w2w+rWH6/YsDcI9MvVEc0wuNdWcfz/N6S4b7i
	NVncKeUZ0ltTUaIWy4KW6Q6lFlxWCibF7lu+rTfo=
Content-Type: multipart/mixed; boundary="===============7084997228566352587=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] qemu: upgrading to 7.1.0 FAILED
Message-ID: 
 <01010182f959c33a-930252f7-04c0-45dd-a21c-894a32318cac-000000@us-west-2.amazonses.com>
Date: Thu, 1 Sep 2022 13:59:45 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 13:59:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170180

--===============7084997228566352587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *qemu* to *7.1.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe qemu failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1658 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-2685be24c7c2c6e69244740ea118cb3510ac6b53"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2685be24c7c2c6e69244740ea118cb3510ac6b53"
workspace            = "master:4c2f9073d6a8fb8bca198ff1f602c37c5afa691e"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 22 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1658 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (883 cached, 2 parsed). 1659 targets, 35 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-2685be24c7c2c6e69244740ea118cb3510ac6b53"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2685be24c7c2c6e69244740ea118cb3510ac6b53"
workspace            = "master:4c2f9073d6a8fb8bca198ff1f602c37c5afa691e"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 18 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   2% |                                    | ETA:  0:00:17
Adding changed files:   4% |#                                   | ETA:  0:00:12
Adding changed files:   6% |##                                  | ETA:  0:00:10
Adding changed files:   9% |###                                 | ETA:  0:00:09
Adding changed files:  11% |####                                | ETA:  0:00:08
Adding changed files:  13% |#####                               | ETA:  0:00:08
Adding changed files:  16% |#####                               | ETA:  0:00:07
Adding changed files:  18% |######                              | ETA:  0:00:07
Adding changed files:  20% |#######                             | ETA:  0:00:07
Adding changed files:  23% |########                            | ETA:  0:00:06
Adding changed files:  25% |#########                           | ETA:  0:00:06
Adding changed files:  27% |##########                          | ETA:  0:00:06
Adding changed files:  30% |##########                          | ETA:  0:00:06
Adding changed files:  32% |###########                         | ETA:  0:00:05
Adding changed files:  34% |############                        | ETA:  0:00:05
Adding changed files:  37% |#############                       | ETA:  0:00:05
Adding changed files:  39% |##############                      | ETA:  0:00:05
Adding changed files:  41% |###############                     | ETA:  0:00:04
Adding changed files:  44% |###############                     | ETA:  0:00:04
Adding changed files:  46% |################                    | ETA:  0:00:04
Adding changed files:  48% |#################                   | ETA:  0:00:04
Adding changed files:  51% |##################                  | ETA:  0:00:04
Adding changed files:  53% |###################                 | ETA:  0:00:03
Adding changed files:  55% |####################                | ETA:  0:00:03
Adding changed files:  57% |####################                | ETA:  0:00:03
Adding changed files:  60% |#####################               | ETA:  0:00:03
Adding changed files:  62% |######################              | ETA:  0:00:03
Adding changed files:  64% |#######################             | ETA:  0:00:03
Adding changed files:  67% |########################            | ETA:  0:00:02
Adding changed files:  69% |#########################           | ETA:  0:00:02
Adding changed files:  71% |#########################           | ETA:  0:00:02
Adding changed files:  74% |##########################          | ETA:  0:00:02
Adding changed files:  76% |###########################         | ETA:  0:00:02
Adding changed files:  78% |############################        | ETA:  0:00:01
Adding changed files:  81% |#############################       | ETA:  0:00:01
Adding changed files:  83% |##############################      | ETA:  0:00:01
Adding changed files:  85% |##############################      | ETA:  0:00:01
Adding changed files:  88% |###############################     | ETA:  0:00:01
Adding changed files:  90% |################################    | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:09
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.qemu.org/qemu-7.1.0.tar.xz...
INFO: Rebasing devtool onto e18c29432ef7d3bacf168461ea38db8c37354259
WARNING: Command 'git rebase e18c29432ef7d3bacf168461ea38db8c37354259' failed:
Adding tests/lcitool/libvirt-ci/lcitool/libvirt_wrapper.py
Adding tests/lcitool/libvirt-ci/lcitool/gitlab.py
Adding tests/lcitool/libvirt-ci/lcitool/ansible/vars/projects/internal/early_install.yml
Adding tests/lcitool/libvirt-ci/lcitool/ansible/playbooks/update/tasks/kludges.yml
Adding tests/lcitool/libvirt-ci/lcitool/ansible/playbooks/update/tasks/bootstrap.yml
Adding tests/lcitool/libvirt-ci/lcitool/ansible/group_vars/ubuntu-2204/main.yml
Adding tests/lcitool/libvirt-ci/lcitool/ansible/group_vars/alpine-316/main.yml
Adding tests/lcitool/libvirt-ci/lcitool/ansible/group_vars/almalinux-9/main.yml
Adding tests/lcitool/libvirt-ci/lcitool/__init__.py
Auto-merging hw/scsi/lsi53c895a.c
CONFLICT (content): Merge conflict in hw/scsi/lsi53c895a.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-nativesdk onto e18c29432ef7d3bacf168461ea38db8c37354259
WARNING: Command 'git rebase e18c29432ef7d3bacf168461ea38db8c37354259' failed:
Adding tests/lcitool/libvirt-ci/lcitool/libvirt_wrapper.py
Adding tests/lcitool/libvirt-ci/lcitool/gitlab.py
Adding tests/lcitool/libvirt-ci/lcitool/ansible/vars/projects/internal/early_install.yml
Adding tests/lcitool/libvirt-ci/lcitool/ansible/playbooks/update/tasks/kludges.yml
Adding tests/lcitool/libvirt-ci/lcitool/ansible/playbooks/update/tasks/bootstrap.yml
Adding tests/lcitool/libvirt-ci/lcitool/ansible/group_vars/ubuntu-2204/main.yml
Adding tests/lcitool/libvirt-ci/lcitool/ansible/group_vars/alpine-316/main.yml
Adding tests/lcitool/libvirt-ci/lcitool/ansible/group_vars/almalinux-9/main.yml
Adding tests/lcitool/libvirt-ci/lcitool/__init__.py
Auto-merging hw/scsi/lsi53c895a.c
CONFLICT (content): Merge conflict in hw/scsi/lsi53c895a.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-target onto e18c29432ef7d3bacf168461ea38db8c37354259
WARNING: Command 'git rebase e18c29432ef7d3bacf168461ea38db8c37354259' failed:
Adding tests/lcitool/libvirt-ci/lcitool/libvirt_wrapper.py
Adding tests/lcitool/libvirt-ci/lcitool/gitlab.py
Adding tests/lcitool/libvirt-ci/lcitool/ansible/vars/projects/internal/early_install.yml
Adding tests/lcitool/libvirt-ci/lcitool/ansible/playbooks/update/tasks/kludges.yml
Adding tests/lcitool/libvirt-ci/lcitool/ansible/playbooks/update/tasks/bootstrap.yml
Adding tests/lcitool/libvirt-ci/lcitool/ansible/group_vars/ubuntu-2204/main.yml
Adding tests/lcitool/libvirt-ci/lcitool/ansible/group_vars/alpine-316/main.yml
Adding tests/lcitool/libvirt-ci/lcitool/ansible/group_vars/almalinux-9/main.yml
Adding tests/lcitool/libvirt-ci/lcitool/__init__.py
Auto-merging hw/scsi/lsi53c895a.c
CONFLICT (content): Merge conflict in hw/scsi/lsi53c895a.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/qemu
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/qemu/qemu_7.1.0.bb
WARNING: Version is pinned to 7.0% via PREFERRED_VERSION; it may need adjustment to match the new version before any further steps are taken



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7084997228566352587==--

