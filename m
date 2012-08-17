Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T2O6O-0008Ka-Cn
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 17:04:44 +0200
Received: from localhost ([127.0.0.1]:45473 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T2Nun-0004Ne-6S
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 14:52:45 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:content-type
	:content-transfer-encoding; s=default; bh=LBTLKdc/0luiofBmzJfVVA
	Cr8Xg=; b=gLDwyxbLjJrWMSXKNgff+k15xLNDhYY6wr4Vt9NbVtH0mLTihVe7jc
	SDQqzYbNAgcrAp1szDYSlrCNxDtpB0bsatbpHrnpj8wr78bnOhgzFhlpTvLxb8Yk
	rxzh5vx322LVYUfTvH5gNVWqmQmHoK7Z+aqFInrQVt/Bq0GMvay2w=
Received: from [195.171.99.130] (port=2255 helo=[192.168.0.47])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T2Nun-0004Na-1X
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 14:52:45 +0000
Message-ID: <502E5B0E.8040809@communistcode.co.uk>
Date: Fri, 17 Aug 2012 15:54:06 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: qemu opengl issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Aug 2012 15:04:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

So I am trying to build qemuarm with latest master and I ran into this 
issue:

    NOTE: Resolving any missing task queue dependencies
    NOTE: Preparing runqueue
    NOTE: Executing SetScene Tasks
    NOTE: Executing RunQueue Tasks
    ERROR: Function failed: do_configure (see
    /mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/qemu-native-0.15.1-r11/temp/log.do_configure.2967
    for further information)
    ERROR: Logfile of failure stored in:
    /mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/qemu-native-0.15.1-r11/temp/log.do_configure.2967
    Log data follows:
    | DEBUG: Executing python function sysroot_cleansstate
    | DEBUG: Python function sysroot_cleansstate finished
    | DEBUG: Executing shell function do_configure
    | libSDL and header no found to build opengl acceleration for
    qemu-native.
    |     Ubuntu package names are: libsdl1.2-dev.
    |     Fedora package names are: SDL-devel.
    | ERROR: Function failed: do_configure (see
    /mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/qemu-native-0.15.1-r11/temp/log.do_configure.2967
    for further information)
    ERROR: Task 67
    (virtual:native:/mnt/storage/yoctoBuilds/poky-vanilla.git/meta/recipes-devtools/qemu/qemu_0.15.1.bb,
    do_configure) failed with exit code '1'
    NOTE: Tasks Summary: Attempted 1099 tasks of which 1074 didn't need
    to be rerun and 1 failed.


Summary: 1 task failed:
virtual:native:/mnt/storage/yoctoBuilds/poky-vanilla.git/meta/recipes-devtools/qemu/qemu_0.15.1.bb, 
do_configure
Summary: There was 1 WARNING message shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

Ok, I thought, lets install the sdl libraries. Which has now given me 
this error:

    Build Configuration:
    BB_VERSION        = "1.15.3"
    TARGET_ARCH       = "arm"
    TARGET_OS         = "linux-gnueabi"
    MACHINE           = "qemuarm"
    DISTRO            = "poky"
    DISTRO_VERSION    = "1.2+snapshot-20120817"
    TUNE_FEATURES     = "armv5 dsp thumb arm926ejs"
    TARGET_FPU        = "soft"
    meta
    meta-yocto        = "master:bddd8300325267253941e7ce656ce2cf86a8a4a4"

    NOTE: Resolving any missing task queue dependencies
    NOTE: Preparing runqueue
    NOTE: Executing SetScene Tasks
    NOTE: Executing RunQueue Tasks
    ERROR: Function failed: do_configure (see
    /mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/qemu-native-0.15.1-r11/temp/log.do_configure.6313
    for further information)
    ERROR: Logfile of failure stored in:
    /mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/qemu-native-0.15.1-r11/temp/log.do_configure.6313
    Log data follows:
    | DEBUG: Executing python function sysroot_cleansstate
    | DEBUG: Python function sysroot_cleansstate finished
    | DEBUG: Executing shell function do_configure
    | ERROR
    | ERROR: User requested feature gl_accel
    | ERROR: configure was not able to find it
    | ERROR
    | ERROR: Function failed: do_configure (see
    /mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/qemu-native-0.15.1-r11/temp/log.do_configure.6313
    for further information)
    ERROR: Task 67
    (virtual:native:/mnt/storage/yoctoBuilds/poky-vanilla.git/meta/recipes-devtools/qemu/qemu_0.15.1.bb,
    do_configure) failed with exit code '1'
    NOTE: Tasks Summary: Attempted 1152 tasks of which 1108 didn't need
    to be rerun and 1 failed.

    Summary: 1 task failed:
    virtual:native:/mnt/storage/yoctoBuilds/poky-vanilla.git/meta/recipes-devtools/qemu/qemu_0.15.1.bb,
    do_configure
    Summary: There was 1 WARNING message shown.
    Summary: There was 1 ERROR message shown, returning a non-zero exit
    code.


I am building on a headless machine with no X if that makes any 
difference in the matter...

Regards,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



