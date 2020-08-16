Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.19864.1597558911457015839
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2020 23:21:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 52A38E02037; Sat, 15 Aug 2020 23:21:51 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 45A34E02064
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2020 23:19:42 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-demos: upgrading to e6956acfbdaf082f930e9cc6bb2c337695d9cebb FAILED
Message-Id: <20200816062151.52A38E02037@yocto-www.yoctoproject.org>
Date: Sat, 15 Aug 2020 23:21:51 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============2636238850937679604=="

--===============2636238850937679604==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-demos* to *e6956acfbdaf082f930e9cc6bb2c337695d9cebb* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-demos -S e6956acfbdaf082f930e9cc6bb2c337695d9cebb
NOTE: Starting bitbake server...
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
DISTRO_VERSION       = "3.1+snapshot-20200816"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ad9ed5d4452f83e86f267207c5962070e0d90ff1"
workspace            = "master:bd1da2aca0bc26720f438a9c1d54f5b04084da4e"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout e6956acfbdaf082f930e9cc6bb2c337695d9cebb' failed with exit code 1:
error: The following untracked working tree files would be overwritten by checkout:
	external/ktx/LICENSE.md
	external/ktx/NOTICE.md
	external/ktx/README.md
	external/ktx/include/ktx.h
	external/ktx/include/ktxvulkan.h
	external/ktx/lib/checkheader.c
	external/ktx/lib/errstr.c
	external/ktx/lib/etcdec.cxx
	external/ktx/lib/etcunpack.cxx
	external/ktx/lib/filestream.c
	external/ktx/lib/filestream.h
	external/ktx/lib/gl_format.h
	external/ktx/lib/gl_funcptrs.h
	external/ktx/lib/gles1_funcptrs.h
	external/ktx/lib/gles2_funcptrs.h
	external/ktx/lib/gles3_funcptrs.h
	external/ktx/lib/glloader.c
	external/ktx/lib/hashlist.c
	external/ktx/lib/hashtable.c
	external/ktx/lib/ktxgl.h
	external/ktx/lib/ktxint.h
	external/ktx/lib/libktx.gypi
	external/ktx/lib/mainpage.md
	external/ktx/lib/memstream.c
	external/ktx/lib/memstream.h
	external/ktx/lib/stream.h
	external/ktx/lib/swap.c
	external/ktx/lib/texture.c
	external/ktx/lib/uthash.h
	external/ktx/lib/vk_format.h
	external/ktx/lib/vk_funclist.inl
	external/ktx/lib/vk_funcs.c
	external/ktx/lib/vk_funcs.h
	external/ktx/lib/vkloader.c
	external/ktx/lib/writer.c
	external/ktx/lib/writer_v1.c
	external/ktx/other_include/KHR/khrplatform.h
Please move or remove them before you switch branches.
Aborting




Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============2636238850937679604==--
