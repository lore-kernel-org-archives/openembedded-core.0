Return-Path: <mirza.krak@hostmobility.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id F365865CF8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Apr 2014 06:22:22 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id n15so5695029lbi.14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Apr 2014 23:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type;
	bh=mK3uJW23NrcFOkuO7nOMyqP8JX684bAxbMBfaXYlC30=;
	b=e+Z/Q2ZkUXVTxaKhsX3Hcyp4iKoswA5x5fTsdFvnaBLqIKHTSZwo/1HapCLVJ1aHNa
	hHJKAW5g9Gnf36jVr18Lc1sfTepXPWhoO/N6qzOy+GQNBZQC+DsgXxl2PA3+o/DJNyfk
	A4IDXaKtL4ONbvohJTY151egnjJ/GNnUnIQhmII0IX6CI0E4lE3gagYWfdq9SRtHCVXa
	WKAn6FOhqAJdvBPfDuL6t5/lqgHlsBlO3kdti4/te2KK7O+D5sDNYWjqwre0CyL6Tp1X
	wf/60eCXRDAk/BSOow7tOc6n/CrU8PGm3rQmFJdJFXTHCpK0YiTt2yW/Y0O0fTsKdKbM
	g8Mg==
X-Gm-Message-State: ALoCoQkgPorXz9TqhTw1ZabmVpIw8EIIR3MRbPFXa2lJyLW4Wws8T4mfROKvh0bxmA0kg27rN3TZ
X-Received: by 10.112.159.104 with SMTP id xb8mr8879817lbb.31.1398752542812;
	Mon, 28 Apr 2014 23:22:22 -0700 (PDT)
Received: from [192.168.0.98] (static-92-33-5-210.sme.bredbandsbolaget.se.
	[92.33.5.210])
	by mx.google.com with ESMTPSA id o1sm15132501lbw.16.2014.04.28.23.22.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 28 Apr 2014 23:22:21 -0700 (PDT)
Message-ID: <535F4513.20407@hostmobility.com>
Date: Tue, 29 Apr 2014 08:22:11 +0200
From: Mirza Krak <mirza.krak@hostmobility.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <535F3FFD.1080403@hostmobility.com>
In-Reply-To: <535F3FFD.1080403@hostmobility.com>
X-Forwarded-Message-Id: <535F3FFD.1080403@hostmobility.com>
Subject: quilt-native fails on tar version 1.27.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Apr 2014 06:22:27 -0000
X-Groupsio-MsgNum: 52663
Content-Type: multipart/mixed; boundary="------------030207000402050504020805"

--------------030207000402050504020805
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit


Hi.

I recently updated my Ubuntu PC to 14.04 LTS which broke yocto builds.

  From what I can see is that there seems to be an issue with the tar
command and quilt-native recipe. But I am to newb to fix this. Do you
guys have any ideas?

uname -a
Linux mirza-hm 3.11.0-20-generic #34-Ubuntu SMP Tue Apr 1 20:40:25 UTC
2014 x86_64 x86_64 x86_64 GNU/Linux

tar --version
tar (GNU tar) 1.27.1
Copyright (C) 2013 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later
<http://gnu.org/licenses/gpl.html>.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by John Gilmore and Jay Fenlason.

Attached log.

-- 
Med Vänliga Hälsningar / Best Regards

*******************************************************************
Mirza Krak
Host Mobility AB
mirza.krak@hostmobility.com
Anders Personsgatan 12, 416 64 Göteborg
Sweden
http://www.hostmobility.com
Direct: +46 31 31 32 704
Phone: +46 31 31 32 700
Fax: +46 31 80 67 51
Mobile: +46 730 28 06 22
*******************************************************************





--------------030207000402050504020805
Content-Type: text/x-log;
 name="quilt-native-error.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="quilt-native-error.log"

Pseudo is not present but is required, building this first before the main build
Loading cache...done.
Loaded 2305 entries from dependency cache.
WARNING: No recipes available for:
  /home/mirza/git/mx4/t20/oe-core/build/../stuff/meta-toradex/recipes-multimedia/webm/libvpx_1.1.0.bbappend

Build Configuration:
BB_VERSION        = "1.18.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Ubuntu-14.04"
TARGET_SYS        = "arm-angstrom-linux-gnueabi"
MACHINE           = "colibri-t20"
DISTRO            = "angstrom"
DISTRO_VERSION    = "v2013.06"
TUNE_FEATURES     = "armv7a vfp callconvention-hard"
TARGET_FPU        = "vfp"
meta-angstrom     = "(nobranch):7543b99f99592d0c23a5e66007b8631751b9d79c"
meta-toradex      = "(nobranch):1f28b5dd41ac54410dfaf9a3dc5d9af64ab06037"
meta-linaro-toolchain = "(nobranch):6321a745aba4fc2ddb559d4606b0a98afc8a1ca2"
toolchain-layer   
meta-oe           
meta-efl          
meta-gpe          
meta-gnome        
meta-xfce         
meta-initramfs    
meta-systemd      
meta-networking   
meta-multimedia   = "(nobranch):13ae5105ee30410136beeae66ec41ee4a8a2e2b0"
meta-lxde         = "(nobranch):f69ffe4cebf94f48f02838002dbc3544b3ffb460"
meta-browser      = "(nobranch):2140f2a114f7009f86479afb12a524bb157cbb0e"
meta-java         = "colibri:9dfb7ecb87e67052e94641d6e02907c582264217"
meta              = "(nobranch):3549f5f203363302256848bb33c05c4fd4871948"
meta-hm           = "master:6d5b8beee5db008fca42dddbe8378c8b57fcca8e"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Marking Active Tasks
NOTE: Pruned 357 inactive tasks, 63 left
NOTE: Assign Weightings
NOTE: Compute totals (have 1 endpoint(s))
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Running task 7 of 63 (ID: 10, /home/mirza/git/mx4/t20/oe-core/build/../stuff/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.61.bb, do_populate_sysroot)
NOTE: recipe quilt-native-0.61-r0: task do_populate_sysroot: Started
+ cd /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/quilt-0.61
+ sysroot_stage_all
+ sysroot_stage_dirs /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/image /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/sysroot-destdir/
+ from=/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/image
+ to=/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/sysroot-destdir/
+ sysroot_stage_dir /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/image/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/include /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/sysroot-destdir//home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/include
+ src=/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/image/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/include
+ dest=/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/sysroot-destdir//home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/include
+ 
[ ! -d /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/image/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/include ]
+ return
+ [ x86_64-linux = x86_64-linux ]
+ sysroot_stage_dir /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/image/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/bin /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/sysroot-destdir//home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/bin
+ src=/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/image/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/bin
+ dest=/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/sysroot-destdir//home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/bin
+ [ ! -d /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/image/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/bin ]
+ rmdir /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/image/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/bin

+ true

+ mkdir -p /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/sysroot-destdir//home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/bin

+ [ -d /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/image/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/bin ]

+ tar -cf - -C /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/image/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/bin -ps .
+ tar -xf - -C /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/sysroot-destdir//home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/bin

tar: --same-order option cannot be used with -c
Try 'tar --help' or 'tar --usage' for more information.

tar: This does not look like a tar archive
tar: Exiting with failure status due to previous errors

ERROR: Function failed: sysroot_stage_all (see /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/temp/log.do_populate_sysroot.28846 for further information)
ERROR: Logfile of failure stored in: /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/temp/log.do_populate_sysroot.28846
Log data follows:
| DEBUG: Executing python function sstate_task_prefunc
| DEBUG: Python function sstate_task_prefunc finished
| DEBUG: Executing python function do_populate_sysroot
| DEBUG: Executing shell function sysroot_stage_all
| + cd /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/quilt-0.61
| + sysroot_stage_all
| + sysroot_stage_dirs /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/image /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/sysroot-destdir/
| + from=/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/image
| + to=/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/sysroot-destdir/
| + sysroot_stage_dir /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/image/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/include /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/sysroot-destdir//home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/include
| + src=/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/image/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/include
| + dest=/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/sysroot-destdir//home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/include
| +
| + cd /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/quilt-0.61
| + sysroot_stage_all
| + sysroot_stage_dirs /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/image /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/sysroot-destdir/
| + from=/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/image
| + to=/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/sysroot-destdir/
| + sysroot_stage_dir /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/image/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/include /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/sysroot-destdir//home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/include
| + src=/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/image/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/include
| + dest=/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/sysroot-destdir//home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/include
| + [ ! -d /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/image/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/include ]
| + return
| + [ x86_64-linux = x86_64-linux ]
| + sysroot_stage_dir /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/image/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/bin /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/sysroot-destdir//home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/bin
| + src=/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/image/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/bin
| + dest=/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/sysroot-destdir//home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/bin
| + [ ! -d /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/image/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/bin ]
| + rmdir /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/image/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/bin
| 
| [ ! -d /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/image/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/include ]
| + return
| + [ x86_64-linux = x86_64-linux ]
| + sysroot_stage_dir /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/image/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/bin /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/sysroot-destdir//home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/bin
| + src=/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/image/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/bin
| + dest=/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/sysroot-destdir//home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/bin
| + [ ! -d /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/image/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/bin ]
| + rmdir /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/image/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/bin
| + true
| 
| + true
| + mkdir -p /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/sysroot-destdir//home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/bin
| 
| + mkdir -p /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/sysroot-destdir//home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/bin
| + [ -d /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/image/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/bin ]
| 
| + [ -d /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/image/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/bin ]
| + tar -cf - -C /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/image/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/bin -ps .
| + tar -xf - -C /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/sysroot-destdir//home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/bin
| 
| + tar -cf - -C /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/image/home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/bin -ps .
| + tar -xf - -C /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/sysroot-destdir//home/mirza/git/mx4/t20/oe-core/build/out-eglibc/sysroots/x86_64-linux/usr/bin
| tar: --same-order option cannot be used with -c
| Try 'tar --help' or 'tar --usage' for more information.
| 
| tar: --same-order option cannot be used with -c
| Try 'tar --help' or 'tar --usage' for more information.
| tar: This does not look like a tar archive
| tar: Exiting with failure status due to previous errors
| 
| tar: This does not look like a tar archive
| tar: Exiting with failure status due to previous errors
| DEBUG: Python function do_populate_sysroot finished
| ERROR: Function failed: sysroot_stage_all (see /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/x86_64-linux/quilt-native/0.61-r0/temp/log.do_populate_sysroot.28846 for further information)
NOTE: recipe quilt-native-0.61-r0: task do_populate_sysroot: Failed
ERROR: Task 10 (/home/mirza/git/mx4/t20/oe-core/build/../stuff/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.61.bb, do_populate_sysroot) failed with exit code '1'
NOTE: Tasks Summary: Attempted 23 tasks of which 22 didn't need to be rerun and 1 failed.
+ cd /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/armv7ahf-vfp-angstrom-linux-gnueabi/bblayers/1.0-r0/bblayers-1.0
+ buildhistory_commit
+ [ ! -d /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/buildhistory ]
+ + cd /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/work/armv7ahf-vfp-angstrom-linux-gnueabi/bblayers/1.0-r0/bblayers-1.0
+ buildhistory_commit
+ [ ! -d /home/mirza/git/mx4/t20/oe-core/build/out-eglibc/buildhistory ]
+ 

Summary: 1 task failed:
  /home/mirza/git/mx4/t20/oe-core/build/../stuff/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.61.bb, do_populate_sysroot
Summary: There was 1 WARNING message shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.


--------------030207000402050504020805--
