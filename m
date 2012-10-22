Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TQEci-000402-Oz
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 11:48:41 +0200
Received: from localhost ([127.0.0.1]:36240 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TQEPj-0003PD-SY
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 09:35:15 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:content-type
	:content-transfer-encoding; s=default; bh=kuzl5M+H081tENkYeeAOTk
	8Sqpc=; b=nWctyhZFpsSPble4Mc6SNGmkU+7hIodD033FRECQdMXzDfZLk/PC33
	+J1o1zDTil/L0B7oRzGhatSRfBtO75/BN4qQSK//Z7Wr/w6Jc1mM58Mx3L+m0/e8
	4WQHlXfCeJa0ID8WLuOzXHTIo6A24/pdxbutk8VEsQVHEGOzbErT4=
Received: from [195.171.99.130] (port=6534 helo=[192.168.0.67])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TQEPj-0003P8-Q9
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 09:35:15 +0000
Message-ID: <508513C8.8070304@communistcode.co.uk>
Date: Mon, 22 Oct 2012 10:37:12 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121012 Thunderbird/16.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: build failures: rpath - gettext related?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Oct 2012 09:48:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On my weekly 'git pull master' build I am facing rpath errors which seem 
to be related to gettext?

Parsing recipes: 100% |#########################################| ETA:  
00:00:00
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1196 targets, 
61 skipped, 8 masked, 0 errors.

Build Configuration:
BB_VERSION        = "1.16.0"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "beaglebone"
DISTRO            = "poky"
DISTRO_VERSION    = "1.3+snapshot-20121022"
TUNE_FEATURES     = "armv7a vfp neon cortexa8"
TARGET_FPU        = "vfp-neon"
meta
meta-yocto        = "master:7090cbe2c94f37baeb4e67cf3a822974d7dd0e61"
meta-ti           = "master:4f3522a9dc7f04e2f650199d66badb08dad214c6"
meta-db           = "master:4dbfea5ae4acf397d4e28a3b164860f4c8064801"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: Function failed: do_configure (see 
/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/work/x86_64-linux/bison-native-2.5.1-r0/temp/log.do_configure.3008 
for further information)
ERROR: Logfile of failure stored in: 
/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/work/x86_64-linux/bison-native-2.5.1-r0/temp/log.do_configure.3008
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.12.3
| Copyright (C) 2012 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later 
<http://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
|
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.12
| cp: cannot stat 
'/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/sysroots/x86_64-linux/usr/share/gettext/config.rpath': 
No such file or directory
| ERROR: Function failed: do_configure (see 
/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/work/x86_64-linux/bison-native-2.5.1-r0/temp/log.do_configure.3008 
for further information)
ERROR: Task 707 
(virtual:native:/mnt/storage/yoctoBuilds/poky-beaglebone.git/meta/recipes-devtools/bison/bison_2.5.1.bb, 
do_configure) failed with exit code '1'
ERROR: Function failed: do_configure (see 
/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/work/x86_64-linux/flex-native-2.5.35-r3/temp/log.do_configure.3009 
for further information)
ERROR: Logfile of failure stored in: 
/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/work/x86_64-linux/flex-native-2.5.35-r3/temp/log.do_configure.3009
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.12.3
| Copyright (C) 2012 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later 
<http://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
|
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.12
| cp: cannot stat 
'/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/sysroots/x86_64-linux/usr/share/gettext/config.rpath': 
No such file or directory
| ERROR: Function failed: do_configure (see 
/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/work/x86_64-linux/flex-native-2.5.35-r3/temp/log.do_configure.3009 
for further information)
ERROR: Task 1566 
(virtual:native:/mnt/storage/yoctoBuilds/poky-beaglebone.git/meta/recipes-devtools/flex/flex_2.5.35.bb, 
do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 122 tasks of which 116 didn't need to be 
rerun and 2 failed.
Waiting for 0 running tasks to finish:

Summary: 2 tasks failed:
virtual:native:/mnt/storage/yoctoBuilds/poky-beaglebone.git/meta/recipes-devtools/bison/bison_2.5.1.bb, 
do_configure
virtual:native:/mnt/storage/yoctoBuilds/poky-beaglebone.git/meta/recipes-devtools/flex/flex_2.5.35.bb, 
do_configure
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

Any ideas? Would Richards patch '[OE-core] [PATCH] gettext: Add 
config.rpath and Makefile.in.in to gettext-minimal-native' possibly fix 
the issue?

Regards,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



