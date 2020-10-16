Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.12521.1602843683142020315
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 5086138C162C
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:24 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-demos: upgrading to b9f0ac91d2adccc3055a904d3a8f6553b10ff6cd FAILED
Message-ID: <MADEUP.163E71D70FF81C70.13247@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============8734345246551352466=="

--===============8734345246551352466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-demos* to *b9f0ac91d2adccc3055a904d3a8f6553b10ff6cd* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-demos -S b9f0ac91d2adccc3055a904d3a8f6553b10ff6cd
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1506 entries from dependency cache.
INFO: Extracting current version source...
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2d076d21137113760f34898162e1737b7ba4a340"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout b9f0ac91d2adccc3055a904d3a8f6553b10ff6cd' failed with exit code 1:
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

--===============8734345246551352466==--
