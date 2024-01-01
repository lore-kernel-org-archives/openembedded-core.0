Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B933BC4829E
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:08 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.4627.1704114719511820484
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:11:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Yh2yk/lh;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=OwjuJpVk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018cc5270af6-8c5d123f-a3e3-4ab3-9023-48479c2b63a5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114719;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PzPG5m/hypBtIJkUsBEr2W/JIT2AztwysmAs9N6WkoE=;
	b=Yh2yk/lhGx+cETqzFJ1jjLoCxaQrAPSV51F8+2rKoQUk4LFQG5g5ccUGiPtlpQdq
	57IBvmvYpe0rf56OLZMKAfv+vWGY65JsGjqV7nuJAVyfNf4XuaX+DvfV9TOVoXWu2Xn
	KdvyEbDbeVEjgljVaw5wuPSlnnZsZr9kSkDbUKls=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114719;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PzPG5m/hypBtIJkUsBEr2W/JIT2AztwysmAs9N6WkoE=;
	b=OwjuJpVkGtHGtKv5RVpf0Jugu5ZJHfzapao9CDHtUVq2xnCjYJfogjEPsRryrcsG
	04YZ08454oqFwfqjZhpD+HGWxnu8APcAn3G+UogxgqPqlculPrHnv+YBgIJMUixXa6L
	fLM+PKHXA4M5zRXIAxNhyHAxpV0yaTjyzfWk5qFo=
Content-Type: multipart/mixed; boundary="===============3522095299274787896=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3: upgrading to 3.12.1 FAILED
Message-ID: <0101018cc5270af6-8c5d123f-a3e3-4ab3-9023-48479c2b63a5-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:11:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193122

--===============3522095299274787896==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3* to *3.12.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade python3 -V 3.12.1
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1847 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-7ee6010c5a22b3655b92b44db69253892aedb131"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7ee6010c5a22b3655b92b44db69253892aedb131"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1847 entries from dependency cache.
Parsing recipes...done.
Parsing of 914 .bb files complete (912 cached, 2 parsed). 1848 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-7ee6010c5a22b3655b92b44db69253892aedb131"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7ee6010c5a22b3655b92b44db69253892aedb131"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 8 Local 7 Mirrors 0 Missed 1 Current 20 (87% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   3% |#                                   | ETA:  0:00:05
Adding changed files:   7% |##                                  | ETA:  0:00:03
Adding changed files:  11% |###                                 | ETA:  0:00:02
Adding changed files:  14% |#####                               | ETA:  0:00:02
Adding changed files:  18% |######                              | ETA:  0:00:02
Adding changed files:  22% |#######                             | ETA:  0:00:02
Adding changed files:  25% |#########                           | ETA:  0:00:02
Adding changed files:  29% |##########                          | ETA:  0:00:01
Adding changed files:  33% |###########                         | ETA:  0:00:01
Adding changed files:  36% |#############                       | ETA:  0:00:01
Adding changed files:  40% |##############                      | ETA:  0:00:01
Adding changed files:  44% |###############                     | ETA:  0:00:01
Adding changed files:  47% |#################                   | ETA:  0:00:01
Adding changed files:  51% |##################                  | ETA:  0:00:01
Adding changed files:  55% |###################                 | ETA:  0:00:01
Adding changed files:  58% |#####################               | ETA:  0:00:01
Adding changed files:  62% |######################              | ETA:  0:00:00
Adding changed files:  66% |#######################             | ETA:  0:00:00
Adding changed files:  69% |#########################           | ETA:  0:00:00
Adding changed files:  73% |##########################          | ETA:  0:00:00
Adding changed files:  77% |###########################         | ETA:  0:00:00
Adding changed files:  81% |#############################       | ETA:  0:00:00
Adding changed files:  84% |##############################      | ETA:  0:00:00
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:02

INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching http://www.python.org/ftp/python/3.12.1/Python-3.12.1.tar.xz...
INFO: Rebasing devtool onto 512a33447035ba2eb0e73616f64641d2817f67b3
WARNING: Command 'git rebase 512a33447035ba2eb0e73616f64641d2817f67b3' failed:
CONFLICT (modify/delete): setup.py deleted in HEAD and modified in 71363a2 (Do not add /usr/lib/termcap to linker flags to avoid host contamination).  Version 71363a2 (Do not add /usr/lib/termcap to linker flags to avoid host contamination) of setup.py left in tree.

INFO: Rebasing devtool-override-class-native onto 512a33447035ba2eb0e73616f64641d2817f67b3
ERROR: Execution of 'git checkout devtool-override-class-native' failed with exit code 1:
error: you need to resolve your current index first
setup.py: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3522095299274787896==--

