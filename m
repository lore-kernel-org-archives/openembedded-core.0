Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 254B1C3601A
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:52:10 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.42888.1744019523772445645
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:52:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MujELkFw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B8E4443275;
	Mon,  7 Apr 2025 09:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744019522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EslkQQ2b2U3XIntC9lezQl4ajdp0TxA6KsuTEzjmvgo=;
	b=MujELkFwmknLS4u6KtLuxRQn9BZKA/U/MDO6BY6xPClM6hG3sLKjHp0E3gR1fJX7VgDmzn
	/1B+SBbW97OFjR8CEUiiSaGWgr7nDdWRbiFc1ORUSB+RkWe37GvF7lVSNOWleKh3aDIJ3v
	glJVytd0Jblvpb4kwaR0zJX+Rm1k8xpgj4GC6x0i3khaW7ZAVBRt5z94t1GNdcNVC1fo6G
	zZ6u9WTFz7P8cswSVSXbOUs6TsSiYcJuCyPBeDeQ0J5YjGBX2Iq2f6vOtEMXgaZ9JA5Gd8
	wkSa9Q7huEDvQ391HcaBC/sqMk7eyR+T3Z+bfhXdlgNk9JOHLapiauP8Jw1/Xw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Apr 2025 11:52:01 +0200
Message-Id: <D90BBNJUDNA5.3UQXSK0K43FNK@bootlin.com>
Subject: Re: [OE-core] [PATCH v3 00/11] systemd based initrd and modular
 kernel support
Cc: <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Mikko Rapeli" <mikko.rapeli@linaro.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <D908T3Q0WX31.XYGZX5NGTRL7@bootlin.com> <Z_OIeeFp_hWMjTkJ@nuoska>
 <D90A1HIWOZYV.25J0FOK1DMUDK@bootlin.com> <Z_OZ24jicgPP2HaP@nuoska>
In-Reply-To: <Z_OZ24jicgPP2HaP@nuoska>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduleelkeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhvdfgjeevjeffkedvgefftdeguddvteejgfdvfffhtdfggeduieeihfelveejtdenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpuddvrdgssgdpgedurdgssgdpgeegrdgssgdptddurdgssgdpudegrdgssgdpuddtrdgssgdpgeekrdgssgdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegso
 hhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepmhhikhhkohdrrhgrphgvlhhisehlihhnrghrohdrohhrghdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:52:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214443

On Mon Apr 7, 2025 at 11:24 AM CEST, Mikko Rapeli wrote:
> On Mon, Apr 07, 2025 at 10:51:43AM +0200, Mathieu Dubois-Briand wrote:
>> On Mon Apr 7, 2025 at 10:10 AM CEST, Mikko Rapeli wrote:
>> > Hi,
>> >
>> > On Mon, Apr 07, 2025 at 09:53:45AM +0200, Mathieu Dubois-Briand wrote:
>> >> On Fri Apr 4, 2025 at 6:29 PM CEST, Mikko Rapeli via lists.openembedd=
ed.org wrote:
>> >> > systemd based initrd supports more security, encryption etc feature=
s
>> >> > than custom shell script ones but oe-core lacks support for it.
>> >> > Convert core-image-initramfs-boot to create systemd based initrd
>> >> > if "systemd-initramfs" is set in DISTRO_FEATURES. Includes a test
>> >> > for this initrd to mount rootfs via Unified Kernel Image uki.py.
>> >> >
>> >> > Sadly the boot time is really slow, e.g. over 30 seconds with
>> >> > systemd based initrd. One of the major reasons is the large
>> >> > amount of kernel modules built into the linux-yocto kernel and
>> >> > processing of their udev events in userspace. Thus add
>> >> > kernel-initrd-modules meta package to easily install
>> >> > subset of all kernel modules to initrd. The subset
>> >> > supports "mount rootfs from any block device" but
>> >> > doesn't include graphics, UBS etc support. Without this
>> >> > generated meta package, initrd recipe needs to manually define
>> >> > which exact kernel modules to include which breaks if
>> >> > those modules are built into the kernel. Thus the initrd
>> >> > becomes machine and kernel config specific and hard to maintain.
>> >> > With this meta package a generic initrd can be created.
>> >> >
>> >> > Separate changes to linux-yocto compile a lot more drivers
>> >> > as modules but they depend on these initrd changes.
>> >> >
>> >>=20
>> >> Hi Mikko,
>> >>=20
>> >> Thanks for your patch.
>> >>=20
>> >> I believe one of these wic related patches is responsible of some
>> >> oe-selftest failures we can see on the autobuilder:
>> >>=20
>> >> 2025-04-06 15:51:49,317 - oe-selftest - INFO - wic.Wic.test_permissio=
ns (subunit.RemotedTestCase)
>> >> 2025-04-06 15:51:49,318 - oe-selftest - INFO -  ... FAIL
>> >>=20
>> >> ...
>> >>=20
>> >> ERROR: When reparsing /tmp/selftest-fetchsrayuxoq/test.bb:do_checkuri=
, the basehash value changed from 84b9e23a83a764e7a5d8a96ee523199e2b1c604f4=
280a45030e248de0ff52962 to 4123da244f465feffecb2b4fd2b132b64851981ec2fb70bf=
9445df8b0ea6a69e. The metadata is not deterministic and this needs to be fi=
xed.
>> >> ERROR: The following commands may help:
>> >> ERROR: $ bitbake test -cdo_checkuri -Snone
>> >> ERROR: Then:
>> >> ERROR: $ bitbake test -cdo_checkuri -Sprintdiff
>> >>=20
>> >> ERROR: When reparsing /tmp/selftest-fetchsrayuxoq/test.bb:do_fetch, t=
he basehash value changed from 6d55d6743729b615749dc016857d7e5f9c884a8b92f0=
d57f68e743f4910333d3 to fa7d6ea0563b60362418d2a6c5e41a6684183d01ec578b65abd=
0c64a9cfba7cf. The metadata is not deterministic and this needs to be fixed=
.
>> >> ERROR: The following commands may help:
>> >> ERROR: $ bitbake test -cdo_fetch -Snone
>> >> ERROR: Then:
>> >> ERROR: $ bitbake test -cdo_fetch -Sprintdiff
>> >>=20
>> >> ERROR: When reparsing /tmp/selftest-fetchsrayuxoq/test.bb:do_unpack, =
the basehash value changed from ae9d94aafc721d891f8754df82ed90da8191357178f=
3db64221a49d5c1de3bcd to 1ac8f87a71db151b8eb2ae8d13f9a6ea1a0c884ef98555d61d=
2c2fe07a476a8a. The metadata is not deterministic and this needs to be fixe=
d.
>> >> ERROR: The following commands may help:
>> >> ERROR: $ bitbake test -cdo_unpack -Snone
>> >> ERROR: Then:
>> >> ERROR: $ bitbake test -cdo_unpack -Sprintdiff
>> >>=20
>> >> ...
>> >>=20
>> >> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/13=
91
>> >>=20
>> >> Can you have a look at this please?
>> >
>> > I can have a look but how can these patches change the basehash'es whe=
n testing?
>> >
>> > I've seen some of the wic selftets failing on x86_64 build machine wit=
h zfs
>> > but changes to fix this was rejected multiple times.
>> >
>> > Then I've seen some of these failing with odd pseudo failures on aarch=
64
>> > build machine.
>> >
>> > With my patches the end result was the same.
>> >
>> > I ran wic and uki selftests on x86_64 and aarch64 build machines for t=
argets qemuarm64,
>> > qemuarm and genericx86-64.
>> >
>> > The wic patches have actually nothing to do with this series except I =
ran into bugs
>> > in wic which resulted in unbootable images, e.g. the UEFI bootloader b=
inaries
>> > missing from ESP partition. These were impacting some builds but not a=
ll
>> > which was really troubling.
>> >
>> > Cheers,
>> >
>> > -Mikko
>>=20
>> Ok, I am running some git bisect locally anyway, I will keep you updated
>> a bit later today.
>
> I ran wic.Wic.test_permissions and it passed without this series
> on aarch64 build machine and genericarm64 target machine:
>
> NOTE: Reconnecting to bitbake server...
> NOTE: Retrying server connection (#1)... (08:13:45.320086)
> NOTE: Reconnecting to bitbake server...
> NOTE: Reconnecting to bitbake server...
> NOTE: Retrying server connection (#1)... (08:13:45.320086)
> NOTE: Retrying server connection (#1)... (08:13:45.320086)
> NOTE: Starting bitbake server...
> hint: Using 'master' as the name for the initial branch. This default bra=
nch name
> hint: is subject to change. To configure the initial branch name to use i=
n all
> hint: of your new repositories, which will suppress this warning, call:
> hint:=20
> hint:   git config --global init.defaultBranch <name>
> hint:=20
> hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
> hint: 'development'. The just-created branch can be renamed via this comm=
and:
> hint:=20
> hint:   git branch -m <name>
> 2025-04-07 08:13:46,418 - oe-selftest - INFO - Adding: "include selftest.=
inc" in /home/mcfrisk/src/base/poky/build_genericarm64-st/conf/local.conf
> 2025-04-07 08:13:46,418 - oe-selftest - INFO - Adding: "include bblayers.=
inc" in bblayers.conf
> 2025-04-07 08:13:46,418 - oe-selftest - INFO - test_permissions (wic.Wic.=
test_permissions)
> 2025-04-07 08:24:47,941 - oe-selftest - INFO -  ... ok
> 2025-04-07 08:24:54,376 - oe-selftest - INFO - --------------------------=
--------------------------------------------
> 2025-04-07 08:24:54,376 - oe-selftest - INFO - Ran 1 test in 668.167s
> 2025-04-07 08:24:54,376 - oe-selftest - INFO - OK
> 2025-04-07 08:25:00,978 - oe-selftest - INFO - RESULTS:
> 2025-04-07 08:25:00,978 - oe-selftest - INFO - RESULTS - wic.Wic.test_per=
missions: PASSED (661.52s)
> 2025-04-07 08:25:00,979 - oe-selftest - INFO - SUMMARY:
> 2025-04-07 08:25:00,979 - oe-selftest - INFO - oe-selftest () - Ran 1 tes=
t in 668.168s
> 2025-04-07 08:25:00,979 - oe-selftest - INFO - oe-selftest - OK - All req=
uired tests passed (successes=3D1, skipped=3D0, failures=3D0, errors=3D0)
>
> Then with patches from this series (and a few more which I sent out separ=
ately,
> should be unrelated) it failed with pseudo errors:
>
> 2025-04-07 08:32:12,107 - oe-selftest - INFO - Changing cwd to /home/mcfr=
isk/src/base/poky/build_genericarm64
> 2025-04-07 08:32:12,107 - oe-selftest - INFO - Adding layer libraries:
> 2025-04-07 08:32:12,107 - oe-selftest - INFO -  /home/mcfrisk/src/base/po=
ky/meta/lib
> 2025-04-07 08:32:12,107 - oe-selftest - INFO -  /home/mcfrisk/src/base/po=
ky/meta-yocto-bsp/lib
> 2025-04-07 08:32:12,107 - oe-selftest - INFO -  /home/mcfrisk/src/base/po=
ky/meta-selftest/lib
> 2025-04-07 08:32:12,108 - oe-selftest - INFO - Checking base configuratio=
n is valid/parsable
> NOTE: Reconnecting to bitbake server...
> NOTE: Retrying server connection (#1)... (08:32:12.728357)
> NOTE: Reconnecting to bitbake server...
> NOTE: Reconnecting to bitbake server...
> NOTE: Retrying server connection (#1)... (08:32:12.728357)
> NOTE: Retrying server connection (#1)... (08:32:12.728357)
> NOTE: Starting bitbake server...
> hint: Using 'master' as the name for the initial branch. This default bra=
nch name
> hint: is subject to change. To configure the initial branch name to use i=
n all
> hint: of your new repositories, which will suppress this warning, call:
> hint:=20
> hint:   git config --global init.defaultBranch <name>
> hint:=20
> hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
> hint: 'development'. The just-created branch can be renamed via this comm=
and:
> hint:=20
> hint:   git branch -m <name>
> 2025-04-07 08:32:13,824 - oe-selftest - INFO - Adding: "include selftest.=
inc" in /home/mcfrisk/src/base/poky/build_genericarm64-st/conf/local.conf
> 2025-04-07 08:32:13,824 - oe-selftest - INFO - Adding: "include bblayers.=
inc" in bblayers.conf
> 2025-04-07 08:32:13,824 - oe-selftest - INFO - test_permissions (wic.Wic.=
test_permissions)
> 2025-04-07 09:10:05,405 - oe-selftest - INFO -  ... FAIL
> 2025-04-07 09:10:05,488 - oe-selftest - INFO - Traceback (most recent cal=
l last):
>   File "/home/mcfrisk/src/base/poky/meta/lib/oeqa/selftest/cases/wic.py",=
 line 677, in test_permissions
>     bitbake('core-image-minimal')
>   File "/home/mcfrisk/src/base/poky/meta/lib/oeqa/utils/commands.py", lin=
e 236, in bitbake
>     return runCmd(cmd, ignore_status, timeout, output_log=3Doutput_log, *=
*options)
>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^
>   File "/home/mcfrisk/src/base/poky/meta/lib/oeqa/utils/commands.py", lin=
e 214, in runCmd
>     raise AssertionError("Command '%s' returned non-zero exit status %d:\=
n%s" % (command, result.status, exc_output))
> AssertionError: Command 'bitbake  core-image-minimal' returned non-zero e=
xit status 1:
> Loading cache...done.
> Loaded 1976 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           =3D "2.12.0"
> BUILD_SYS            =3D "aarch64-linux"
> NATIVELSBSTRING      =3D "universal"
> TARGET_SYS           =3D "aarch64-poky-linux"
> MACHINE              =3D "genericarm64"
> DISTRO               =3D "poky-altcfg"
> DISTRO_VERSION       =3D "5.2"
> TUNE_FEATURES        =3D "aarch64 armv8a crc"
> TARGET_FPU           =3D ""
> meta                =20
> meta-poky           =20
> meta-yocto-bsp       =3D "HEAD:a75117f79e4771927b89125e464e38acdc9c556e"
> meta-selftest        =3D "master:fd26cf3cc0e6e590b56e331971cdf884d1b881b9=
"
>
> Initialising tasks...Sstate summary: Wanted 539 Local 536 Mirrors 0 Misse=
d 3 Current 1968 (99% match, 99% complete)
> Removing 3 stale sstate objects for arch genericarm64...done.
> NOTE: Executing Tasks
> NOTE: Running task 5157 of 5259 (/home/mcfrisk/src/base/poky/meta/recipes=
-core/images/core-image-minimal.bb:do_image_wic)
> NOTE: recipe core-image-minimal-1.0-r0: task do_image_wic: Started
> ERROR: core-image-minimal-1.0-r0 do_image_wic: Execution of '/home/mcfris=
k/src/base/poky/build_genericarm64-st/tmp/work/genericarm64-poky-linux/core=
-image-minimal/1.0/temp/run.do_image_wic.117565' failed with exit code 134
> ERROR: Logfile of failure stored in: /home/mcfrisk/src/base/poky/build_ge=
nericarm64-st/tmp/work/genericarm64-poky-linux/core-image-minimal/1.0/temp/=
log.do_image_wic.117565
> Log data follows:
> | DEBUG: Executing python function extend_recipe_sysroot
> | NOTE: Direct dependencies are ['/home/mcfrisk/src/base/poky/meta/recipe=
s-bsp/grub/grub-efi_2.12.bb:do_populate_sysroot', '/home/mcfrisk/src/base/p=
oky/meta/recipes-core/gli
> bc/cross-localedef-native_2.41.bb:do_populate_sysroot', '/home/mcfrisk/sr=
c/base/poky/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb:do_populate_s=
ysroot', '/home/mcfrisk/src/base/poky/meta/recipes-core/systemd/systemd-boo=
t_257.4.bb:do_populate_sysroot', '/home/mcfrisk/src/base/poky/meta/recipes-=
devtools/binutils/binutils-cross_2.44.bb:do_popu
> late_sysroot', '/home/mcfrisk/src/base/poky/meta/recipes-devtools/cdrtool=
s/cdrtools-native_3.01.bb:do_populate_sysroot', '/home/mcfrisk/src/base/pok=
y/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_populate_sysroot',=
 '/home/mcfrisk/src/base/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_=
1.0.bb:do_populate_sysroot', 'virtual:native:/home/mcfrisk/src/base/poky/me=
ta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_populate_sysroot', 'virtu=
al:native:/home/mcfrisk/src/base/poky/meta/recipes-devtools/btrfs-tools
> /btrfs-tools_6.14.bb:do_populate_sysroot', 'virtual:native:/home/mcfrisk/=
src/base/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_populat=
e_sysroot', 'virtual:native:/home/mcfrisk/src/base/poky/meta/recipes-devtoo=
ls/e2fsprogs/e2fsprogs_1.47.1.bb:do_populate_sysroot', 'virtual:native:/hom=
e/mcfrisk/src/base/poky/meta/recipes-devtools/er
> ofs-utils/erofs-utils_1.8.5.bb:do_populate_sysroot', 'virtual:native:/hom=
e/mcfrisk/src/base/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.10.bb:do_p=
opulate_sysroot', 'virtual:native:/home/mcfrisk/src/base/poky/meta/recipes-=
devtools/makedevs/makedevs_1.0.1.bb:do_populate_sysroot', 'virtual:native:/=
home/mcfrisk/src/base/poky/meta/recipes-devtools/mtools/mtools_4.0.48.bb:do=
_populate_sysroot', 'virtual:native:/home/mcfrisk/src/base/poky/meta/recipe=
s-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot', 'virtua
> l:native:/home/mcfrisk/src/base/poky/meta/recipes-devtools/opkg/opkg_0.7.=
0.bb:do_populate_sysroot', 'virtual:native:/home/mcfrisk/src/base/poky/meta=
/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:nativ=
e:/home/mcfrisk/src/base/poky/meta/recipes-devtools/squashfs-tools/squashfs=
-tools_git.bb:do_populate_sysroot', 'virtual:nat
> ive:/home/mcfrisk/src/base/poky/meta/recipes-extended/parted/parted_3.6.b=
b:do_populate_sysroot', 'virtual:native:/home/mcfrisk/src/base/poky/meta/re=
cipes-extended/pigz/pigz_
> 2.8.bb:do_populate_sysroot', 'virtual:native:/home/mcfrisk/src/base/poky/=
meta/recipes-support/bmaptool/bmaptool_git.bb:do_populate_sysroot']
> | NOTE: Installed into sysroot: []
> | NOTE: Skipping as already exists in sysroot: ['grub-efi', 'gettext-mini=
mal-native', 'cross-localedef-native', 'glibc', 'ldconfig-native', 'libxcry=
pt', 'ncurses', 'systemd-
> boot', 'systemd-systemctl-native', 'util-linux-libuuid', 'util-linux', 'z=
lib', 'binutils-cross-aarch64', 'cdrtools-native', 'cmake-native', 'gcc-run=
time', 'libgcc', 'libtool-native', 'm4-native', 'opkg-utils', 'qemu-helper-=
native', 'qemu-native', 'qemu-system-native', 'qemuwrapper-cross', 'libpam'=
, 'texinfo-dummy-native', 'depmodwrapper-cross', 'linux-libc-headers', 'bas=
h-completion', 'libcap-ng', 'libcap', 'sqlite3', 'openssl-native', 'libslir=
p-native', 'coreutils-native', 'expat-native', 'gettext-native', 'glib-
> 2.0-native', 'libxml2-native', 'ncurses-native', 'readline-native', 'upda=
te-rc.d-native', 'util-linux-libuuid-native', 'util-linux-native', 'zlib-na=
tive', 'btrfs-tools-nativ
> e', 'chrpath-native', 'dosfstools-native', 'e2fsprogs-native', 'elfutils-=
native', 'erofs-utils-native', 'gptfdisk-native', 'flex-native', 'gnu-confi=
g-native', 'json-c-native
> ', 'libedit-native', 'llvm-native', 'make-native', 'makedevs-native', 'mt=
ools-native', 'opkg-utils-native', 'opkg-native', 'perl-native', 'pseudo-na=
tive', 'python3-build-native', 'python3-calver-native', 'python3-editables-=
native', 'python3-flit-core-native', 'python3-hatchling-native', 'python3-i=
nstaller-native', 'python3-jinja2-native', 'pyth
> on3-mako-native', 'python3-markupsafe-native', 'python3-packaging-native'=
, 'python3-pathspec-native', 'python3-pip-native', 'python3-pluggy-native',=
 'python3-pygments-native
> ', 'python3-pyparsing-native', 'python3-pyproject-hooks-native', 'python3=
-setuptools-scm-native', 'python3-setuptools-native', 'python3-six-native',=
 'python3-trove-classifiers-native', 'python3-typing-extensions-native', 'p=
ython3-wheel-native', 'python3-native', 'squashfs-tools-native', 'unfs3-nat=
ive', 'bzip2-native', 'cpio-native', 'diffutils-
> native', 'libarchive-native', 'libidn2-native', 'libnsl2-native', 'libsol=
v-native', 'libtirpc-native', 'parted-native', 'pigz-native', 'shadow-nativ=
e', 'unzip-native', 'xz-native', 'zstd-native', 'libdrm-native', 'libepoxy-=
native', 'libsdl2-native', 'mesa-native', 'virglrenderer-native', 'wayland-=
protocols-native', 'wayland-native', 'xrandr-nat
> ive', 'libpciaccess-native', 'libpthread-stubs-native', 'libx11-native', =
'libxau-native', 'libxcb-native', 'libxdamage-native', 'libxdmcp-native', '=
libxext-native', 'libxfixes-native', 'libxrandr-native', 'libxrender-native=
', 'libxshmfence-native', 'libxxf86vm-native', 'pixman-native', 'xtrans-nat=
ive', 'xcb-proto-native', 'xorgproto-native', 'makedepend-native', 'util-ma=
cros-native', 'dtc-native', 'kmod-native', 'alsa-lib-native', 'libpng-nativ=
e', 'acl-native', 'attr-native', 'bmaptool-native', 'curl-native', 'deb
> ianutils-native', 'gdbm-native', 'gmp-native', 'gnutls-native', 'libtasn1=
-native', 'libbsd-native', 'libcap-ng-native', 'libcap-native', 'libffi-nat=
ive', 'libgcrypt-native', 'libgpg-error-native', 'libmd-native', 'libmicroh=
ttpd-native', 'libpcre2-native', 'libunistring-native', 'lz4-native', 'lzo-=
native', 'nettle-native', 'popt-native', 'shared
> -mime-info-native', 'sqlite3-native']
> | DEBUG: Python function extend_recipe_sysroot finished
> | DEBUG: Executing python function set_image_size
> | DEBUG: 159546.400000 =3D 122728 * 1.300000
> | DEBUG: 163642.400000 =3D max(159546.400000, 8192)[159546.400000] + 4096
> | DEBUG: 163643.000000 =3D int(163642.400000)
> | DEBUG: 163643 =3D aligned(163643)
> | DEBUG: returning 163643
> | DEBUG: Python function set_image_size finished
> | DEBUG: Executing shell function do_image_wic
> | abort()ing pseudo client by server request. See https://wiki.yoctoproje=
ct.org/wiki/Pseudo_Abort for more details on this.
> | Check logfile: /home/mcfrisk/src/base/poky/build_genericarm64-st/tmp/wo=
rk/genericarm64-poky-linux/core-image-minimal/1.0/pseudo//pseudo.log
> | WARNING: exit code 134 from a shell command.
> | Aborted
> NOTE: recipe core-image-minimal-1.0-r0: task do_image_wic: Failed
> ERROR: Task (/home/mcfrisk/src/base/poky/meta/recipes-core/images/core-im=
age-minimal.bb:do_image_wic) failed with exit code '1'=20
> Pseudo log:
> path mismatch [2 links]: ino 43965780 db '/home/mcfrisk/src/base/poky/bui=
ld_genericarm64-st/tmp/work/genericarm64-poky-linux/core-image-minimal/1.0/=
rootfs/boot/loader/loader.conf' req '/home/mcfrisk/src/base/poky/build_gene=
ricarm64-st/tmp/work/genericarm64-poky-linux/core-image-minimal/1.0/tmp-wic=
/rootfs1/boot/loader/loader.conf'.
> Setup complete, sending SIGUSR1 to pid 117389.
>
> NOTE: Tasks Summary: Attempted 5254 tasks of which 5253 didn't need to be=
 rerun and 1 failed.
>
> Summary: 1 task failed:
>   /home/mcfrisk/src/base/poky/meta/recipes-core/images/core-image-minimal=
.bb:do_image_wic
>     log: /home/mcfrisk/src/base/poky/build_genericarm64-st/tmp/work/gener=
icarm64-poky-linux/core-image-minimal/1.0/temp/log.do_image_wic.117565
> Summary: There was 1 ERROR message, returning a non-zero exit code.
>
> 2025-04-07 09:10:05,488 - oe-selftest - INFO - =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 2025-04-07 09:10:05,488 - oe-selftest - INFO - FAIL: test_permissions (wi=
c.Wic.test_permissions)
> 2025-04-07 09:10:05,489 - oe-selftest - INFO - --------------------------=
--------------------------------------------
> 2025-04-07 09:10:05,489 - oe-selftest - INFO - Traceback (most recent cal=
l last):
>   File "/home/mcfrisk/src/base/poky/meta/lib/oeqa/selftest/cases/wic.py",=
 line 677, in test_permissions
>     bitbake('core-image-minimal')
>   File "/home/mcfrisk/src/base/poky/meta/lib/oeqa/utils/commands.py", lin=
e 236, in bitbake
>     return runCmd(cmd, ignore_status, timeout, output_log=3Doutput_log, *=
*options)
>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^
>   File "/home/mcfrisk/src/base/poky/meta/lib/oeqa/utils/commands.py", lin=
e 214, in runCmd
>     raise AssertionError("Command '%s' returned non-zero exit status %d:\=
n%s" % (command, result.status, exc_output))
> AssertionError: Command 'bitbake  core-image-minimal' returned non-zero e=
xit status 1:
> Loading cache...done.
> Loaded 1976 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           =3D "2.12.0"
> BUILD_SYS            =3D "aarch64-linux"
> NATIVELSBSTRING      =3D "universal"
> TARGET_SYS           =3D "aarch64-poky-linux"
> MACHINE              =3D "genericarm64"
> DISTRO               =3D "poky-altcfg"
> DISTRO_VERSION       =3D "5.2"
> TUNE_FEATURES        =3D "aarch64 armv8a crc"
> TARGET_FPU           =3D ""
> meta                =20
> meta-poky           =20
> meta-yocto-bsp       =3D "HEAD:a75117f79e4771927b89125e464e38acdc9c556e"
> meta-selftest        =3D "master:fd26cf3cc0e6e590b56e331971cdf884d1b881b9=
"
>
> Initialising tasks...Sstate summary: Wanted 539 Local 536 Mirrors 0 Misse=
d 3 Current 1968 (99% match, 99% complete)
> Removing 3 stale sstate objects for arch genericarm64...done.
> NOTE: Executing Tasks
> NOTE: Running task 5157 of 5259 (/home/mcfrisk/src/base/poky/meta/recipes=
-core/images/core-image-minimal.bb:do_image_wic)
> NOTE: recipe core-image-minimal-1.0-r0: task do_image_wic: Started
> ERROR: core-image-minimal-1.0-r0 do_image_wic: Execution of '/home/mcfris=
k/src/base/poky/build_genericarm64-st/tmp/work/genericarm64-poky-linux/core=
-image-minimal/1.0/temp/r
> un.do_image_wic.117565' failed with exit code 134
> ERROR: Logfile of failure stored in: /home/mcfrisk/src/base/poky/build_ge=
nericarm64-st/tmp/work/genericarm64-poky-linux/core-image-minimal/1.0/temp/=
log.do_image_wic.117565
> Log data follows:
> | DEBUG: Executing python function extend_recipe_sysroot
> | NOTE: Direct dependencies are ['/home/mcfrisk/src/base/poky/meta/recipe=
s-bsp/grub/grub-efi_2.12.bb:do_populate_sysroot', '/home/mcfrisk/src/base/p=
oky/meta/recipes-core/glibc/cross-localedef-native_2.41.bb:do_populate_sysr=
oot', '/home/mcfrisk/src/base/poky/meta/recipes-core/glibc/ldconfig-native_=
2.12.1.bb:do_populate_sysroot', '/home/mcfrisk/s
> rc/base/poky/meta/recipes-core/systemd/systemd-boot_257.4.bb:do_populate_=
sysroot', '/home/mcfrisk/src/base/poky/meta/recipes-devtools/binutils/binut=
ils-cross_2.44.bb:do_populate_sysroot', '/home/mcfrisk/src/base/poky/meta/r=
ecipes-devtools/cdrtools/cdrtools-native_3.01.bb:do_populate_sysroot', '/ho=
me/mcfrisk/src/base/poky/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.b=
b:do_populate_sysroot', '/home/mcfrisk/src/base/poky/meta/recipes-kernel/km=
od/depmodwrapper-cross_1.0.bb:do_populate_sysroot', 'virtual:native:/ho
> me/mcfrisk/src/base/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb=
:do_populate_sysroot', 'virtual:native:/home/mcfrisk/src/base/poky/meta/rec=
ipes-devtools/btrfs-tools/btrfs-tools_6.14.bb:do_populate_sysroot', 'virtua=
l:native:/home/mcfrisk/src/base/poky/meta/recipes-devtools/dosfstools/dosfs=
tools_4.2.bb:do_populate_sysroot', 'virtual:nati
> ve:/home/mcfrisk/src/base/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_=
1.47.1.bb:do_populate_sysroot', 'virtual:native:/home/mcfrisk/src/base/poky=
/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.5.bb:do_populate_sysroot=
', 'virtual:native:/home/mcfrisk/src/base/poky/meta/recipes-devtools/fdisk/=
gptfdisk_1.0.10.bb:do_populate_sysroot', 'virtual:native:/home/mcfrisk/src/=
base/poky/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb:do_populate_sysr=
oot', 'virtual:native:/home/mcfrisk/src/base/poky/meta/recipes-devtools/mto=
ols/mtools_4.0.48.bb:do_populate_sysroot', 'virtual:native:/home/mcfrisk/sr=
c/base/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populat=
e_sysroot', 'virtua
> l:native:/home/mcfrisk/src/base/poky/meta/recipes-devtools/opkg/opkg_0.7.=
0.bb:do_populate_sysroot', 'virtual:native:/home/mcfrisk/src/base/poky/meta=
/recipes-devtools/pseudo/
> pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/mcfrisk/src/bas=
e/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_popula=
te_sysroot', 'virtual:native:/home/mcfrisk/src/base/poky/meta/recipes-exten=
ded/parted/parted_3.6.bb:do_populate_sysroot', 'virtual:native:/home/mcfris=
k/src/base/poky/meta/recipes-extended/pigz/pigz_2.8.bb:do_populate_sysroot'=
, 'virtual:native:/home/mcfrisk/src/base/poky/meta/recipes-support/bmaptool=
/bmaptool_git.bb:do_populate_sysroot']
> | NOTE: Installed into sysroot: []
> | NOTE: Skipping as already exists in sysroot: ['grub-efi', 'gettext-mini=
mal-native', 'cross-localedef-native', 'glibc', 'ldconfig-native', 'libxcry=
pt', 'ncurses', 'systemd-boot', 'systemd-systemctl-native', 'util-linux-lib=
uuid', 'util-linux', 'zlib', 'binutils-cross-aarch64', 'cdrtools-native', '=
cmake-native', 'gcc-runtime', 'libgcc', 'libtool
> -native', 'm4-native', 'opkg-utils', 'qemu-helper-native', 'qemu-native',=
 'qemu-system-native', 'qemuwrapper-cross', 'libpam', 'texinfo-dummy-native=
', 'depmodwrapper-cross', 'linux-libc-headers', 'bash-completion', 'libcap-=
ng', 'libcap', 'sqlite3', 'openssl-native', 'libslirp-native', 'coreutils-n=
ative', 'expat-native', 'gettext-native', 'glib-
> 2.0-native', 'libxml2-native', 'ncurses-native', 'readline-native', 'upda=
te-rc.d-native', 'util-linux-libuuid-native', 'util-linux-native', 'zlib-na=
tive', 'btrfs-tools-native', 'chrpath-native', 'dosfstools-native', 'e2fspr=
ogs-native', 'elfutils-native', 'erofs-utils-native', 'gptfdisk-native', 'f=
lex-native', 'gnu-config-native', 'json-c-native', 'libedit-native', 'llvm-=
native', 'make-native', 'makedevs-native', 'mtools-native', 'opkg-utils-nat=
ive', 'opkg-native', 'perl-native', 'pseudo-native', 'python3-build-nat
> ive', 'python3-calver-native', 'python3-editables-native', 'python3-flit-=
core-native', 'python3-hatchling-native', 'python3-installer-native', 'pyth=
on3-jinja2-native', 'python3-mako-native', 'python3-markupsafe-native', 'py=
thon3-packaging-native', 'python3-pathspec-native', 'python3-pip-native', '=
python3-pluggy-native', 'python3-pygments-native
> ', 'python3-pyparsing-native', 'python3-pyproject-hooks-native', 'python3=
-setuptools-scm-native', 'python3-setuptools-native', 'python3-six-native',=
 'python3-trove-classifiers-native', 'python3-typing-extensions-native', 'p=
ython3-wheel-native', 'python3-native', 'squashfs-tools-native', 'unfs3-nat=
ive', 'bzip2-native', 'cpio-native', 'diffutils-native', 'libarchive-native=
', 'libidn2-native', 'libnsl2-native', 'libsolv-native', 'libtirpc-native',=
 'parted-native', 'pigz-native', 'shadow-native', 'unzip-native', 'xz-n
> ative', 'zstd-native', 'libdrm-native', 'libepoxy-native', 'libsdl2-nativ=
e', 'mesa-native', 'virglrenderer-native', 'wayland-protocols-native', 'way=
land-native', 'xrandr-native', 'libpciaccess-native', 'libpthread-stubs-nat=
ive', 'libx11-native', 'libxau-native', 'libxcb-native', 'libxdamage-native=
', 'libxdmcp-native', 'libxext-native', 'libxfix
> es-native', 'libxrandr-native', 'libxrender-native', 'libxshmfence-native=
', 'libxxf86vm-native', 'pixman-native', 'xtrans-native', 'xcb-proto-native=
', 'xorgproto-native', 'makedepend-native', 'util-macros-native', 'dtc-nati=
ve', 'kmod-native', 'alsa-lib-native', 'libpng-native', 'acl-native', 'attr=
-native', 'bmaptool-native', 'curl-native', 'debianutils-native', 'gdbm-nat=
ive', 'gmp-native', 'gnutls-native', 'libtasn1-native', 'libbsd-native', 'l=
ibcap-ng-native', 'libcap-native', 'libffi-native', 'libgcrypt-native',
>  'libgpg-error-native', 'libmd-native', 'libmicrohttpd-native', 'libpcre2=
-native', 'libunistring-native', 'lz4-native', 'lzo-native', 'nettle-native=
', 'popt-native', 'shared-mime-info-native', 'sqlite3-native']
> | DEBUG: Python function extend_recipe_sysroot finished
> | DEBUG: Executing python function set_image_size
> | DEBUG: 159546.400000 =3D 122728 * 1.300000
> | DEBUG: 163642.400000 =3D max(159546.400000, 8192)[159546.400000] + 4096
> | DEBUG: 163643.000000 =3D int(163642.400000)
> | DEBUG: 163643 =3D aligned(163643)
> | DEBUG: returning 163643
> | DEBUG: Python function set_image_size finished
> | DEBUG: Executing shell function do_image_wic
> | abort()ing pseudo client by server request. See https://wiki.yoctoproje=
ct.org/wiki/Pseudo_Abort for more details on this.
> | Check logfile: /home/mcfrisk/src/base/poky/build_genericarm64-st/tmp/wo=
rk/genericarm64-poky-linux/core-image-minimal/1.0/pseudo//pseudo.log
> | WARNING: exit code 134 from a shell command.
> | Aborted
> NOTE: recipe core-image-minimal-1.0-r0: task do_image_wic: Failed
> ERROR: Task (/home/mcfrisk/src/base/poky/meta/recipes-core/images/core-im=
age-minimal.bb:do_image_wic) failed with exit code '1'=20
> Pseudo log:
> path mismatch [2 links]: ino 43965780 db '/home/mcfrisk/src/base/poky/bui=
ld_genericarm64-st/tmp/work/genericarm64-poky-linux/core-image-minimal/1.0/=
rootfs/boot/loader/loader.conf' req '/home/mcfrisk/src/base/poky/build_gene=
ricarm64-st/tmp/work/genericarm64-poky-linux/core-image-minimal/1.0/tmp-wic=
/rootfs1/boot/loader/loader.conf'.
> Setup complete, sending SIGUSR1 to pid 117389.
>
> NOTE: Tasks Summary: Attempted 5254 tasks of which 5253 didn't need to be=
 rerun and 1 failed.
>
> Summary: 1 task failed:
>   /home/mcfrisk/src/base/poky/meta/recipes-core/images/core-image-minimal=
.bb:do_image_wic
>     log: /home/mcfrisk/src/base/poky/build_genericarm64-st/tmp/work/gener=
icarm64-poky-linux/core-image-minimal/1.0/temp/log.do_image_wic.117565
> Summary: There was 1 ERROR message, returning a non-zero exit code.
> ----------------------------------------------------------------------
> 2025-04-07 09:10:05,489 - oe-selftest - INFO - Ran 1 test in 2271.863s
> 2025-04-07 09:10:05,489 - oe-selftest - INFO - FAILED
> 2025-04-07 09:10:05,489 - oe-selftest - INFO -  (failures=3D1)
> 2025-04-07 09:10:11,706 - oe-selftest - INFO - RESULTS:
> 2025-04-07 09:10:11,706 - oe-selftest - INFO - RESULTS - wic.Wic.test_per=
missions: FAILED (2271.66s)
> 2025-04-07 09:10:11,708 - oe-selftest - INFO - SUMMARY:
> 2025-04-07 09:10:11,708 - oe-selftest - INFO - oe-selftest () - Ran 1 tes=
t in 2271.863s
> 2025-04-07 09:10:11,708 - oe-selftest - INFO - oe-selftest - FAIL - Requi=
red tests failed (successes=3D0, skipped=3D0, failures=3D1, errors=3D0)
>
> I think something in this test is faulty. For example building an image
> in yocto do_image with fakeroot/pseudo and then modifying it outside of b=
uild
> env with wic is likely going to fail like this.
>
> I will try with other machine targets and cleaner local.conf
> but I suspect I will run into this same issue again.
>
> And the error from your CI buidl was completely different... :/
>
> Cheers,
>
> -Mikko

I confirm, localally I see the same thing as you do: just some pseudo
errors. They seem to come from "image_types_wic.bbclass: capture verbose
wic output by default" patch.

So yes, different than on the autobuilder, but yet if I drop the series,
autobuilder builds do succeed :(

So we can hope there is an obscure link between both failures, but
that's all I've got so far.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


