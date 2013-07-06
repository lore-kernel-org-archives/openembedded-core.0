Return-Path: <net147@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6C7A36B099
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jul 2013 14:54:23 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id bj3so3038477pad.14
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Jul 2013 07:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=cOPbUsUc01HAPmFyzCVBEoQvp+aIKVnczRNUVIQi9FE=;
	b=mMAD4etF9RCG7I20l+4qaABcewyCWHX/2DWKkVAjbFKqikeleFy6VpGGcRtfSuODm8
	477EeXrQgFx+lHG18FJsbB9Q6UebWbsqxiUrjKTbMt8M2K3At/JA+kmYeHlLLDiuMfgO
	Lv6FAj+kSiX7+UxJWds/FckTc7uEXOPwijbnGJq0XB5ifeuNl60CRW3uvNRxApQscf4b
	oUovV/QLx1TYo4JJwrRo+3CQzOoVG/HsHXUYjUc1cPtI1u2cXGE/9s/XG6bxSRjgG0fS
	Zrpg+RHWJU5LV3cUUkxhM/RSh7fxNldCJwXsJGR2dsdemA+mBh0sCuaDyxOs061M/xdW
	n3yg==
X-Received: by 10.66.134.132 with SMTP id pk4mr15326992pab.20.1373122463812;
	Sat, 06 Jul 2013 07:54:23 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	bs3sm12624970pbc.42.2013.07.06.07.54.20 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 06 Jul 2013 07:54:22 -0700 (PDT)
Message-ID: <51D82E76.3080202@gmail.com>
Date: Sun, 07 Jul 2013 00:49:26 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>
References: <cover.1367919920.git.liezhi.yang@windriver.com>
	<CANwerB3vdQu+WCYv-WzBMMFyv77LymqLkjp3wVMFHCO=KF53Dg@mail.gmail.com>
	<5190B127.40400@windriver.com> <5190B770.9050109@gmail.com>
	<5190C570.40700@windriver.com> <5190E932.2010604@gmail.com>
	<5191CC89.5030204@windriver.com>
In-Reply-To: <5191CC89.5030204@windriver.com>
Cc: dvhart@linux.intel.com, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] replace genext2fs with populate-extfs.sh
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
X-List-Received-Date: Sat, 06 Jul 2013 14:54:23 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/05/2013 3:32 PM, Robert Yang wrote:
>
>
> On 05/13/2013 09:22 PM, Jonathan Liu wrote:
>> On 13/05/2013 8:50 PM, Robert Yang wrote:
>>>
>>>
>>> On 05/13/2013 05:50 PM, Jonathan Liu wrote:
>>>> On 13/05/2013 7:23 PM, Robert Yang wrote:
>>>>>
>>>>> Hi Jonathan Liu,
>>>>>
>>>>> What's your configuration, please, I tried a core-image-minimal 
>>>>> building
>>>>> just now, didn't notice this error. Did the error come after these 
>>>>> patches
>>>>> applied ?
>>>> Yes, the errors occured after applying your patches.
>>>>
>>>
>>> Thanks, I will try a build with these configuration tonight, and see 
>>> the
>>> result tomorrow.
>>>
>>> // Robert
>> I can reproduce the fsck errors using the following:
>
> Thanks, I can reproduce it with your setting, will do more 
> investigation on
> it later.
>
> // Robert
Any updates?

Regards,
Jonathan
>
>> meta: f7afeeb75993b159bb8959e0309bc5eb3978a8fb
>>
>> conf/local.conf:
>> BB_NUMBER_THREADS = "8"
>> PARALLEL_MAKE = "-j 8"
>> MACHINE ??= "qemux86"
>> DISTRO ?= "poky"
>> PACKAGE_CLASSES = "package_ipk"
>> EXTRA_IMAGE_FEATURES = "debug-tweaks"
>> USER_CLASSES ?= "buildstats image-mklibs image-prelink"
>> PATCHRESOLVE = "noop"
>> BB_DISKMON_DIRS = "\
>>      STOPTASKS,${TMPDIR},1G,100K \
>>      STOPTASKS,${DL_DIR},1G,100K \
>>      STOPTASKS,${SSTATE_DIR},1G,100K \
>>      ABORT,${TMPDIR},100M,1K \
>>      ABORT,${DL_DIR},100M,1K \
>>      ABORT,${SSTATE_DIR},100M,1K"
>> CONF_VERSION = "1"
>> DISTRO_FEATURES_append = " systemd"
>> DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"
>> VIRTUAL-RUNTIME_init_manager = "systemd"
>> IMAGE_FSTYPES = "ext4"
>>
>> # bitbake core-image-minimal
>> # fsck.ext4 -fn tmp/deploy/images/core-image-minimal-qemux86.ext4
>>
>> Regards,
>> Jonathan
>>>
>>>> distro conf:
>>>> DISTRO_FEATURES_append = " largefile opengl systemd"
>>>> DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"
>>>> VIRTUAL-RUNTIME_graphical_init_manager = ""
>>>> VIRTUAL-RUNTIME_init_manager = "systemd"
>>>> PACKAGE_CLASSES = "package_ipk"
>>>>
>>>> image bb:
>>>> SYSLINUX_ROOT ?= "root=/dev/sda2"
>>>> SYSLINUX_PROMPT = "0"
>>>> SYSLINUX_TIMEOUT = "1"
>>>> SYSLINUX_LABELS = "boot"
>>>> LABELS_append = " ${SYSLINUX_LABELS} "
>>>> do_bootdirectdisk[depends] += "${PN}:do_rootfs"
>>>> APPEND += "rootfstype=ext4 rw"
>>>> ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.ext4"
>>>> inherit boot-directdisk
>>>> IMAGE_FEATURES += "hwcodecs package-management ssh-server-openssh x11"
>>>> IMAGE_FSTYPES = "ext4"
>>>> IMAGE_LINGUAS = ""
>>>>
>>>>>
>>>>> My configuration:
>>>>> MACHINE = "qemux86"
>>>>> IMAGE_FSTYPES += "ext4"
>>>>>
>>>>> // Robert
>>>>>
>>>>> On 05/13/2013 12:59 PM, Jonathan Liu wrote:
>>>>>> Hi Robert,
>>>>>>
>>>>>> I get the following errors doing filesystem check on the ext4 image:
>>>>>>
>>>>>> # fsck.ext4 -fn tmp/deploy/images/custom-image-custom.ext4.ext4
>>>>>> e2fsck 1.42.7 (21-Jan-2013)
>>>>>> Pass 1: Checking inodes, blocks, and sizes
>>>>>> Pass 2: Checking directory structure
>>>>>> Entry 'mtd7' in /dev (2739) has an incorrect filetype (was 4, 
>>>>>> should be 3).
>>>>>> Fix? no
>>>>>>
>>>>>> Entry 'mtd4' in /dev (2739) has an incorrect filetype (was 4, 
>>>>>> should be 3).
>>>>>> Fix? no
>>>>>>
>>>>>> Entry 'fb0' in /dev (2739) has an incorrect filetype (was 4, 
>>>>>> should be 3).
>>>>>> Fix? no
>>>>>>
>>>>>> Entry 'mtd5' in /dev (2739) has an incorrect filetype (was 4, 
>>>>>> should be 3).
>>>>>> Fix? no
>>>>>>
>>>>>> Entry 'tty' in /dev (2739) has an incorrect filetype (was 4, 
>>>>>> should be 3).
>>>>>> Fix? no
>>>>>>
>>>>>> Entry 'tty6' in /dev (2739) has an incorrect filetype (was 4, 
>>>>>> should be 3).
>>>>>> Fix? no
>>>>>>
>>>>>> Entry 'random' in /dev (2739) has an incorrect filetype (was 4, 
>>>>>> should be
>>>>>> 3).
>>>>>> Fix? no
>>>>>>
>>>>>> Entry 'mtd1' in /dev (2739) has an incorrect filetype (was 4, 
>>>>>> should be 3).
>>>>>> Fix? no
>>>>>>
>>>>>> Entry 'urandom' in /dev (2739) has an incorrect filetype (was 4, 
>>>>>> should be
>>>>>> 3).
>>>>>> Fix? no
>>>>>>
>>>>>> Entry 'zero' in /dev (2739) has an incorrect filetype (was 4, 
>>>>>> should be 3).
>>>>>> Fix? no
>>>>>>
>>>>>> Entry 'null' in /dev (2739) has an incorrect filetype (was 4, 
>>>>>> should be 3).
>>>>>> Fix? no
>>>>>>
>>>>>> Entry 'kmsg' in /dev (2739) has an incorrect filetype (was 4, 
>>>>>> should be 3).
>>>>>> Fix? no
>>>>>>
>>>>>> Entry 'kmem' in /dev (2739) has an incorrect filetype (was 4, 
>>>>>> should be 3).
>>>>>> Fix? no
>>>>>>
>>>>>> Entry 'mtd6' in /dev (2739) has an incorrect filetype (was 4, 
>>>>>> should be 3).
>>>>>> Fix? no
>>>>>>
>>>>>> Entry 'tty7' in /dev (2739) has an incorrect filetype (was 4, 
>>>>>> should be 3).
>>>>>> Fix? no
>>>>>>
>>>>>> Entry 'tty4' in /dev (2739) has an incorrect filetype (was 4, 
>>>>>> should be 3).
>>>>>> Fix? no
>>>>>>
>>>>>> Entry 'apm_bios' in /dev (2739) has an incorrect filetype (was 4, 
>>>>>> should be
>>>>>> 3).
>>>>>> Fix? no
>>>>>>
>>>>>> Entry 'tty5' in /dev (2739) has an incorrect filetype (was 4, 
>>>>>> should be 3).
>>>>>> Fix? no
>>>>>>
>>>>>> Entry 'mtd0' in /dev (2739) has an incorrect filetype (was 4, 
>>>>>> should be 3).
>>>>>> Fix? no
>>>>>>
>>>>>> Entry 'tty0' in /dev (2739) has an incorrect filetype (was 4, 
>>>>>> should be 3).
>>>>>> Fix? no
>>>>>>
>>>>>> Entry 'ttySA0' in /dev (2739) has an incorrect filetype (was 4, 
>>>>>> should be
>>>>>> 3).
>>>>>> Fix? no
>>>>>>
>>>>>> Entry 'mem' in /dev (2739) has an incorrect filetype (was 4, 
>>>>>> should be 3).
>>>>>> Fix? no
>>>>>>
>>>>>> Entry 'mtd2' in /dev (2739) has an incorrect filetype (was 4, 
>>>>>> should be 3).
>>>>>> Fix? no
>>>>>>
>>>>>> Entry 'tty8' in /dev (2739) has an incorrect filetype (was 4, 
>>>>>> should be 3).
>>>>>> Fix? no
>>>>>>
>>>>>> Entry 'console' in /dev (2739) has an incorrect filetype (was 4, 
>>>>>> should be
>>>>>> 3).
>>>>>> Fix? no
>>>>>>
>>>>>> Entry 'ttyS0' in /dev (2739) has an incorrect filetype (was 4, 
>>>>>> should be 3).
>>>>>> Fix? no
>>>>>>
>>>>>> Entry 'tty2' in /dev (2739) has an incorrect filetype (was 4, 
>>>>>> should be 3).
>>>>>> Fix? no
>>>>>>
>>>>>> Entry 'mtd3' in /dev (2739) has an incorrect filetype (was 4, 
>>>>>> should be 3).
>>>>>> Fix? no
>>>>>>
>>>>>> Entry 'tty1' in /dev (2739) has an incorrect filetype (was 4, 
>>>>>> should be 3).
>>>>>> Fix? no
>>>>>>
>>>>>> Entry 'tty3' in /dev (2739) has an incorrect filetype (was 4, 
>>>>>> should be 3).
>>>>>> Fix? no
>>>>>>
>>>>>> Pass 3: Checking directory connectivity
>>>>>> Pass 4: Checking reference counts
>>>>>> Inode 774 ref count is 9, should be 10.  Fix? no
>>>>>>
>>>>>> Pass 5: Checking group summary information
>>>>>>
>>>>>> tmp/deploy/images/custom-image-custom.ext4.ext4: ********** WARNING:
>>>>>> Filesystem still has errors **********
>>>>>>
>>>>>> tmp/deploy/images/custom-image-custom.ext4.ext4: 3899/21336 files 
>>>>>> (0.5%
>>>>>> non-contiguous), 131042/169656 blocks
>>>>>>
>>>>>>
>>>>>> After booting the image I get the following:
>>>>>> # dmesg | grep EXT4-fs
>>>>>> EXT4-fs (sda2): mounted filesystem with ordered data mode. Opts: 
>>>>>> (null)
>>>>>> EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode 
>>>>>> #883: comm
>>>>>> systemd: bad header/extent: invalid magic - magic 0, entries 0, 
>>>>>> max 0(0),
>>>>>> depth 0(0)
>>>>>> EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode 
>>>>>> #883: comm
>>>>>> systemd: bad header/extent: invalid magic - magic 0, entries 0, 
>>>>>> max 0(0),
>>>>>> depth 0(0)
>>>>>> EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode 
>>>>>> #883: comm
>>>>>> systemd: bad header/extent: invalid magic - magic 0, entries 0, 
>>>>>> max 0(0),
>>>>>> depth 0(0)
>>>>>> EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode 
>>>>>> #883: comm
>>>>>> systemd-machine: bad header/extent: invalid magic - magic 0, 
>>>>>> entries 0, max
>>>>>> 0(0), depth 0(0)
>>>>>> EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode 
>>>>>> #883: comm
>>>>>> systemd-machine: bad header/extent: invalid magic - magic 0, 
>>>>>> entries 0, max
>>>>>> 0(0), depth 0(0)
>>>>>> EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode 
>>>>>> #883: comm
>>>>>> systemd-journal: bad header/extent: invalid magic - magic 0, 
>>>>>> entries 0, max
>>>>>> 0(0), depth 0(0)
>>>>>> EXT4-fs (sda2): re-mounted. Opts: (null)
>>>>>> EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode 
>>>>>> #883: comm
>>>>>> systemd-journal: bad header/extent: invalid magic - magic 0, 
>>>>>> entries 0, max
>>>>>> 0(0), depth 0(0)
>>>>>> EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode 
>>>>>> #883: comm
>>>>>> systemd-journal: bad header/extent: invalid magic - magic 0, 
>>>>>> entries 0, max
>>>>>> 0(0), depth 0(0)
>>>>>> EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode 
>>>>>> #883: comm
>>>>>> systemd-journal: bad header/extent: invalid magic - magic 0, 
>>>>>> entries 0, max
>>>>>> 0(0), depth 0(0)
>>>>>> EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode 
>>>>>> #883: comm
>>>>>> systemd-journal: bad header/extent: invalid magic - magic 0, 
>>>>>> entries 0, max
>>>>>> 0(0), depth 0(0)
>>>>>> EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode 
>>>>>> #810: comm
>>>>>> login: bad header/extent: invalid magic - magic 0, entries 0, max 
>>>>>> 0(0),
>>>>>> depth 0(0)
>>>>>> EXT4-fs error (device sda2): ext4_ext_check_inode:467: inode 
>>>>>> #810: comm
>>>>>> sshd: bad header/extent: invalid magic - magic 0, entries 0, max 
>>>>>> 0(0),
>>>>>> depth 0(0)
>>>>>>
>>>>>>
>>>>>> # systemctl --failed | cat
>>>>>> UNIT                     LOAD   ACTIVE SUB DESCRIPTION
>>>>>> machineid.service        loaded failed failed Machine ID first boot
>>>>>> configure
>>>>>> systemd-journald.service loaded failed failed Journal Service
>>>>>> systemd-journald.socket  loaded failed failed Journal Socket
>>>>>>
>>>>>> LOAD   = Reflects whether the unit definition was properly loaded.
>>>>>> ACTIVE = The high-level unit activation state, i.e. 
>>>>>> generalization of SUB.
>>>>>> SUB    = The low-level unit activation state, values depend on 
>>>>>> unit type.
>>>>>>
>>>>>> 3 loaded units listed. Pass --all to see loaded but inactive 
>>>>>> units, too.
>>>>>> To show all installed unit files use 'systemctl list-unit-files'.
>>>>>>
>>>>>>
>>>>>> I am booting kernel with rootfstype=ext4. IMAGE_FSTYPES = "ext4".
>>>>>>
>>>>>> Regards,
>>>>>> Jonathan
>>>>>>
>>>>>>
>>>>>> On 7 May 2013 19:48, Robert Yang <liezhi.yang@windriver.com> wrote:
>>>>>>
>>>>>>> * The benefits:
>>>>>>>    - Really support ext4
>>>>>>>    - Support the sparse file (the sparse file became into the 
>>>>>>> common file
>>>>>>> before)
>>>>>>>    - Have a uniform code for ext2/3/4 generation
>>>>>>>    - Remove the depends on genext2fs-native
>>>>>>>
>>>>>>> * Impact
>>>>>>>    - Build time:
>>>>>>>      a) If we build fresh core-image-sato, there is nearly no 
>>>>>>> impact.
>>>>>>>      b) If we do the image generation, which means:
>>>>>>>         $ bitbake core-image-sato
>>>>>>>         $ bitbake core-image-sato -ccleansstate
>>>>>>>         $ bitbake core-image-sato
>>>>>>>     About 50 extra seconds are needed, here is my test result:
>>>>>>>     Before the patches: 4m25s
>>>>>>>     After the patches: 5m17s
>>>>>>>     This is because the genext2fs is much faster than the
>>>>>>>     populate-extfs.sh, we will replace this script by the mke2fs 
>>>>>>> when it
>>>>>>>     supports create the filesystem from a initial directory.
>>>>>>>
>>>>>>>    - Disk space (take core-image-sato as an example)
>>>>>>>      a) The image file size is the same as before (529M)
>>>>>>>      b) The disk usage is a little different: (du -sh)
>>>>>>>                before       now
>>>>>>>         ext2:  364M         388M
>>>>>>>         ext3:  381M         404M
>>>>>>>         ext4:  380M         387M
>>>>>>>
>>>>>>>     We may need to adjust the IMAGE_OVERHEAD_FACTOR from 1.3 to 
>>>>>>> 1.4.
>>>>>>>
>>>>>>>     I have done some simple runtime testing on core-image-sato and
>>>>>>>     core-image-minimal, they worked well.
>>>>>>>
>>>>>>> // Robert
>>>>>>>
>>>>>>> The following changes since commit
>>>>>>> 3472c1f7ab409cd91c1d4782d9e00880b84e3ae8:
>>>>>>>
>>>>>>>    grub-efi-native: Cleanup whitespace (2013-05-03 16:37:05 +0100)
>>>>>>>
>>>>>>> are available in the git repository at:
>>>>>>>
>>>>>>>    git://git.pokylinux.org/poky-contrib robert/ext4
>>>>>>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/ext4
>>>>>>>
>>>>>>> Robert Yang (4):
>>>>>>>    e2fsprogs: the max length of debugfs argument is too short
>>>>>>>    e2fsprogs: let debugfs do sparse copy
>>>>>>>    e2fsprogs: add populate-extfs.sh
>>>>>>>    image_types.bbclass: replace genext2fs with populate-extfs.sh
>>>>>>>
>>>>>>>   meta/classes/image_types.bbclass                   | 46 ++++----
>>>>>>>   .../e2fsprogs-1.42.7/debugfs-too-short.patch       | 28 +++++
>>>>>>>   .../e2fsprogs/e2fsprogs-1.42.7/populate-extfs.sh   | 93 
>>>>>>> ++++++++++++++++
>>>>>>>   .../e2fsprogs/e2fsprogs-1.42.7/sparse_copy.patch   | 114
>>>>>>> ++++++++++++++++++++
>>>>>>>   .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb | 4 +
>>>>>>>   5 files changed, 257 insertions(+), 28 deletions(-)
>>>>>>>   create mode 100644
>>>>>>> meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/debugfs-too-short.patch 
>>>>>>>
>>>>>>>   create mode 100644
>>>>>>> meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/populate-extfs.sh
>>>>>>>   create mode 100644
>>>>>>> meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/sparse_copy.patch
>>>>>>>
>>>>>>> -- 
>>>>>>> 1.7.10.4
>>>>>>>
>>>>>>>
>>>>>>> _______________________________________________
>>>>>>> Openembedded-core mailing list
>>>>>>> Openembedded-core@lists.openembedded.org
>>>>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core 
>>>>>>>
>>>>>>>
>>>>>>
>>>> Regards,
>>>> Jonathan
>>>>
>>>>
>>
>>
>>


