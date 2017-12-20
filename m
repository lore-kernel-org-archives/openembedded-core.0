Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 75E52719B1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Dec 2017 14:01:08 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id r39so28293170qtr.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Dec 2017 06:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PjSzziwBu0FZheLj0Jqd3p6JQ2UUMJtSfkKgO23LihY=;
	b=JHhgrOshLyJIuUHOH1qSCWkh/Om0a+VJhQz/Vs9nhMM9fmMPwePCKL95eX7iulTJMV
	qnwZYCthwYWaKUSFtI76O1Pgr8T9R5H0Kbfq3TkhIrojXnWdYB4YTJnsFk/lhXSqtHOa
	D51Sknp/Gife69fzONyKuj5thkURhzonIpMfIhxraCFclDhi5ul7vgc27utqt57ftwxQ
	QycS+nAymrPKeIaAho6JPG9vGqPboddxqrI72i62exNVJDH9PzcJhhcf/K0AonPbPwdn
	lvVgW3ub/ZzyENPWUEPBIzdK0nKXU038NQRcC0Z52bgFYpRaC8hgjHez5RQWKnewlILC
	nfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PjSzziwBu0FZheLj0Jqd3p6JQ2UUMJtSfkKgO23LihY=;
	b=gyaW/3qZst1jb869AFompwkExeXDy8RTInsyGfzyRbTS3BC+vd4KLbegL/Q/pRn3gU
	LD1TNRb2s1+c+9+z4gl+WL7h8h2ZwOwDwC8AL7iRtSvxmfy+I88pJnrmzfCVA2bYN/W9
	RoLZDFjrj8ez850AD2DZg8Ka6ElR0H/1O/PTrFO2yl1yLKkxk00jBfDsezgqUGcF990W
	/CHUsDlbgObofJTbnWNAnD6aNJqvnXBP2SKppmNH5d3sAiwIQ8KD1sV9sLIhLnHGMjVz
	KFwX+tpwe8sYdxrAtYEMqnaztgKpkUHrrVQlpoXoW/W4eoxA50/WPdxWhHG5iu6bpNG8
	T1og==
X-Gm-Message-State: AKGB3mJL2Y3gySnLIw/fU1oNAuVe2fJz9tDjxY3MxTCW0IWjhcWWzb30
	vTrJFPEI14pRr1fa/Xc/BcJxvke3vHelxp05f8k=
X-Google-Smtp-Source: ACJfBosdJU+lT5pNBoGynt6J070osR9HVXaFSMAfclXxZfQKREkpZJVGEfvIrpbRv0SM8daSUDwpVtCSZEsLT5/NwUk=
X-Received: by 10.200.4.44 with SMTP id v44mr10246289qtg.80.1513778469976;
	Wed, 20 Dec 2017 06:01:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Wed, 20 Dec 2017 06:01:09 -0800 (PST)
In-Reply-To: <ec4cc81e-bc20-019e-53a5-64b1397c5bbd@windriver.com>
References: <cover.1513612975.git.ross.burton@intel.com>
	<CADkTA4NgB4VWEi+F+dQqzQ8pYWWbG8DFRQX9ZLs13t1Q2O52zw@mail.gmail.com>
	<a2058b89-3ede-0a13-32bd-bc8b0efe0630@windriver.com>
	<CADkTA4MpC_2UQVwv+wcKOJe_U2_vMLP2K5tCJgCuJ+iJxmuX0w@mail.gmail.com>
	<ec4cc81e-bc20-019e-53a5-64b1397c5bbd@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 20 Dec 2017 09:01:09 -0500
Message-ID: <CADkTA4NNY_MXsB3gCZ4Lecze+PVWKCiw=-R0tkGfA1CmrYbuMw@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/49] Consolidated pull
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
X-List-Received-Date: Wed, 20 Dec 2017 14:01:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 19, 2017 at 8:52 PM, ChenQi <Qi.Chen@windriver.com> wrote:
> On 12/19/2017 10:33 PM, Bruce Ashfield wrote:
>>
>> On Tue, Dec 19, 2017 at 12:23 AM, ChenQi <Qi.Chen@windriver.com> wrote:
>>>
>>> On 12/19/2017 12:45 PM, Bruce Ashfield wrote:
>>>>
>>>> On Mon, Dec 18, 2017 at 11:03 AM, Ross Burton <ross.burton@intel.com>
>>>> wrote:
>>>>>
>>>>> Hi,
>>>>>
>>>>> Another batch of patches from the list which have passed autobuilder
>>>>> testing and
>>>>> review.
>>>>>
>>>>> Ross
>>>>>
>>>>> The following changes since commit
>>>>> d6b6508e0be4452eb285495403b73fa9fcf51e3e:
>>>>>
>>>>>     temp disable inode checking on sstate (2017-12-13 14:02:02 +0000)
>>>>>
>>>>> are available in the git repository at:
>>>>>
>>>>>     git://git.yoctoproject.org/poky-contrib ross/mut
>>>>>
>>>>> for you to fetch changes up to
>>>>> f64e867d1ff5e559a96f44fac8a2434ad2643502:
>>>>>
>>>>>     meta-selftest: wic: Add test for --use-uuid / --fsuuid (2017-12-16
>>>>> 00:21:42 +0000)
>>>>>
>>>>> ----------------------------------------------------------------
>>>>> Alejandro Hernandez (4):
>>>>>         busybox: Add mkfs.EXT2 support on poky-tiny
>>>>>         linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.9
>>>>>         linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.12
>>>>>         linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.4
>>>>>
>>>>> Alexander Kanavin (9):
>>>>>         gobject-introspection: update to 1.54.1
>>>>>         webkitgtk: update to 2.18.3
>>>>>         psmisc: update to 23.0
>>>>>         ffmpeg: update to 3.4
>>>>>         devtool: add a 'latest-version' command
>>>>>         devtool: provide useful defaults for version/commit when
>>>>> upgrading
>>>>> recipes
>>>>>         devtool: add license checksum change handling to 'devtool
>>>>> upgrade'
>>>>>         maintainers.inc: add an entry for dwarfsrcfiles
>>>>>         maintainers.inc: add an entry for pkgconf
>>>>>
>>>>> Chang Rebecca Swee Fun (1):
>>>>>         recipetool: create: fix conflict between SRCREV and tag
>>>>>
>>>>> Chen Qi (4):
>>>>>         coreutils: upgrade to 8.28
>>>>>         coreutils: add PACKAGECONFIG for single-binary
>>>>>         dbus: upgrade to 1.12.2
>>>>>         dbus-test: upgrade to 1.12.2
>>>>
>>>>
>>>> Anyone else seeing dbus blow up during configure after this update ?
>>>>
>>>> --------------------------------
>>>> Initialising tasks: 100%
>>>>
>>>>
>>>> |########################################################################################################################################|
>>>> Time: 0:00:00
>>>>
>>>> NOTE: Executing SetScene Tasks
>>>>
>>>> NOTE: Executing RunQueue Tasks
>>>>
>>>> ERROR: dbus-native-1.12.2-r0 do_configure: autoreconf execution failed.
>>>>
>>>> ERROR: dbus-native-1.12.2-r0 do_configure: Function failed:
>>>> do_configure (log file is located at
>>>>
>>>>
>>>> /home/bruce/poky/build/tmp/work/x86_64-linux/dbus-native/1.12.2-r0/temp/log.do_configure.30425)
>>>>
>>>> ERROR: Logfile of failure stored in:
>>>>
>>>>
>>>> /home/bruce/poky/build/tmp/work/x86_64-linux/dbus-native/1.12.2-r0/temp/log.do_configure.30425
>>>>
>>>> Log data follows:
>>>>
>>>> | DEBUG: Executing shell function autotools_preconfigure
>>>>
>>>> | DEBUG: Shell function autotools_preconfigure finished
>>>>
>>>> | DEBUG: Executing python function autotools_aclocals
>>>>
>>>> | DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
>>>> 'bit-64', 'x86_64-linux', 'common']
>>>>
>>>> | DEBUG: Python function autotools_aclocals finished
>>>>
>>>> | DEBUG: Executing shell function do_configure
>>>>
>>>> | automake (GNU automake) 1.15.1
>>>>
>>>> | Copyright (C) 2017 Free Software Foundation, Inc.
>>>>
>>>> | License GPLv2+: GNU GPL version 2 or later
>>>> <http://gnu.org/licenses/gpl-2.0.html>
>>>>
>>>> | This is free software: you are free to change and redistribute it.
>>>>
>>>> | There is NO WARRANTY, to the extent permitted by law.
>>>>
>>>> |
>>>>
>>>> | Written by Tom Tromey <tromey@redhat.com>
>>>>
>>>> |        and Alexandre Duret-Lutz <adl@gnu.org>.
>>>>
>>>>
>>>> <snip>
>>>>
>>>> | autoreconf: running:
>>>>
>>>>
>>>> /home/bruce/poky/build/tmp/work/x86_64-linux/dbus-native/1.12.2-r0/recipe-sysroot-native/usr/bin/autoconf
>>>>
>>>>
>>>> --include=/home/bruce/poky/build/tmp/work/x86_64-linux/dbus-native/1.12.2-r0/dbus-1.12.2/m4/
>>>> --force
>>>>
>>>> | configure.ac:95: error: Unexpanded AX_ macro found. Please install
>>>> GNU autoconf-archive
>>>>
>>>> |       If this token and others are legitimate, please use
>>>> m4_pattern_allow.
>>>>
>>>> |       See the Autoconf documentation.
>>>>
>>>> | configure.ac:374: error: Unexpanded AX_ macro found. Please install
>>>> GNU autoconf-archive
>>>>
>>>> | autoreconf:
>>>>
>>>> /home/bruce/poky/build/tmp/work/x86_64-linux/dbus-native/1.12.2-r0/recipe-sysroot-native/usr/bin/autoconf
>>>> failed with exit status: 1
>>>>
>>>> | ERROR: autoreconf execution failed.
>>>>
>>>> | WARNING: exit code 1 from a shell command.
>>>>
>>>> | ERROR: Function failed: do_configure (log file is located at
>>>>
>>>>
>>>> /home/bruce/poky/build/tmp/work/x86_64-linux/dbus-native/1.12.2-r0/temp/log.do_configure.30425)
>>>>
>>>> ERROR: Task
>>>>
>>>> (virtual:native:/home/bruce/poky/meta/recipes-core/dbus/dbus_1.12.2.bb:do_configure)
>>>> failed with exit code '1'
>>>>
>>>> NOTE: Tasks Summary: Attempted 458 tasks of which 451 didn't need to
>>>> be rerun and 1 failed.
>>>>
>>>> --------------------------------
>>>>
>>>> Is there something I should have cleaned besides dbus and dbus-native
>>>> ? This is a
>>>> build directory that I've been using for ages (if that makes a
>>>> difference).
>>>>
>>>> Reverting the uprev of the dbus packages, fixed my build.
>>>>
>>>> Bruce
>>>>
>>>>
>>> Hi Bruce,
>>>
>>> I also encountered similar problem when I was upgrading dbus. The problem
>>> has been solved by adding 'autoconf-archive' to DEPENDS.
>>>
>>> configure.ac:374 means macro AX_CODE_COVERAGE.
>>> For now, I can find it in recipe-sysroot-native of dbus-native. See
>>> below.
>>>
>>> ~/poky/build-systemd/tmp/work/x86_64-linux/dbus-native/1.12.2-r0 [1] $
>>> grep
>>> -rw AX_CODE_COVERAGE recipe-sysroot-native/
>>> recipe-sysroot-native/usr/share/aclocal/ax_code_coverage.m4:#
>>> AX_CODE_COVERAGE()
>>> recipe-sysroot-native/usr/share/aclocal/ax_code_coverage.m4:#
>>> AX_CODE_COVERAGE
>>>
>>> recipe-sysroot-native/usr/share/aclocal/ax_code_coverage.m4:AC_DEFUN([AX_CODE_COVERAGE],[
>>>
>>> ~/poky/build-systemd/tmp/work/x86_64-linux/dbus-native/1.12.2-r0 [1] $
>>> grep
>>> ax_code_coverage.m4
>>> recipe-sysroot-native/installeddeps/autoconf-archive-native
>>> recipe-sysroot-native/usr/share/aclocal/ax_code_coverage.m4
>>>
>>> Could you please help check if autoconf-archive-native is in DEPENDS of
>>> dbus-native? And also the above files available in recipe-sysroot-native
>>> of
>>> dbus-native?
>>
>> I removed my revert of the upgrade, and it definitely blew up again
>> (in the same way). Here's
>> the things you wanted me to check:
>>
>> yow-bashfiel-d4 [/home/bruc.../1.12.2-r0]> pwd
>> /home/bruce/poky/build/tmp/work/x86_64-linux/dbus-native/1.12.2-r0
>> yow-bashfiel-d4 [/home/bruc.../1.12.2-r0]> grep -rw AX_CODE_COVERAGE
>> recipe-sysroot-native/
>>
>> So that AC define isn't in my native sysroot.
>>
>> As for the depends, do you mean dumping it from bitbake, or just
>> reading the recipe ?
>> (I'm thinking bitbake, since anyone could read the recipe), but for
>> completeness sake, the
>> recipe has:
>>
>> DEPENDS = "expat virtual/libintl autoconf-archive"
>> RDEPENDS_dbus_class-native = ""
>> RDEPENDS_dbus_class-nativesdk = ""
>>
>> And from bitbake -e on dbus-native:
>>
>> DEPENDS="pkgconfig-native autoconf-native automake-native
>> libtool-native gnu-config-native gettext-minimal-native expat-native
>> virtual/libintl-native autoconf-archive-native"
>>
>> ... but yet, I still fail to configure.
>>
>> Bruce
>>
>
> Hi Bruce,
>
> That is strange. After thinking for quite a while, my best guess is that you
> might be using an old meta-openembedded repo. If this is not the case, then
> I must get the environment for further investigation.

Aha!!

Your guess is right. Thanks for helping me sort this out. I was only
updating oe-core
to keep my rebuild minimal, and that is what caused the problem.

If I had noticed the original patches on the list, I probably would
have been aware
of that requirement.

Cheers,

Bruce

>
> The autoconf-archive recipe was in meta-openembedded repo and was later
> moved to oe-core.
> I found a commit in meta-openembedded's commit history that might be related
> to this problem.
>
> commit 449030b1b920a0ee12a63e2655744db559303778
> Author: Zhixiong Chi <zhixiong.chi@windriver.com>
> Date:   Wed Apr 19 14:28:35 2017 +0800
>
>     autoconf-archive: drop m4files confliction with gnome-common
>
>     Delete the conflicting m4files with gnome-common to avoid the
> confliction,
>     and the two m4 files will be installed by gnome-common that comes from
>     oe-core, then set rdepends to gnome-common.
>
>     Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
>     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> Note that this commit adds a patch to autoconf-archive which removes two m4
> files.
>
> +-M4FILES="m4_esyscmd([echo -n m4/*.m4])"
> ++M4FILES="m4_esyscmd([echo -n m4/*.m4 | sed -e 's:m4/ax_code_coverage.m4
> ::g'|sed -e 's:m4/ax_check_enable_debug.m4 ::g'])"
>
> And the two errors you encountered are related to these two files.
>
> configure.ac:95: error: Unexpanded AX_ macro found.
>
> It's this one. AX_CHECK_ENABLE_DEBUG([$enable_developer])
>
> configure.ac:374: error: Unexpanded AX_ macro found.
>
> It's this one. AX_CODE_COVERAGE
>
> If this is not the case, give me the environment personally if convenient,
> and I'll find out why.
>
> Best Regards,
> Chen Qi
>
>
>>> Best Regards,
>>> Chen Qi
>>
>>
>>
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

