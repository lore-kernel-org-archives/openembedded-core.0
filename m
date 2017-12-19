Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id B0679784E2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 14:33:04 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id 33so24393533qtv.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 06:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZqRnIm+L4L98oJxrlvNhkWOaBj3KcuRIxXAki0hXCk4=;
	b=BjsSo2IkfrQRcbBDreuMaRwq39/7jyL3WSfmtJZvx3p6qIQjcQn4xvEkBHc6s6nhT7
	bc33PAa+SqiYoCZtP/7VYDdWzjhNgx22cqZea5S00ou0iF1Yns5TVmJ0bYXqGJePVdjF
	gvRZwTsYkwGUc0dNcYVPSDGTpf+pr8uHTifPCB1KymFHPDRVIq1kALlHlAGK9KZx56eG
	37qfWO3j7YhwkfyKLor6oq0o8Fg/v+5uB5b0qQp3AwcRKLoej3Q/zEd/Z82zZSU9u16q
	dBM07o3L0e+x+SW8AM3+LTcZhqd6cVWHoNXyen/qLLztubxCMtC1/awsTrxSnAaYvua8
	t/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZqRnIm+L4L98oJxrlvNhkWOaBj3KcuRIxXAki0hXCk4=;
	b=I0egymlG4SJ82+ntTGOHBD0k/obnOFNIocdCipCWmkR86D7kn4IVxJHIFoSgoJFXCP
	q9z73OWMjKy91Pao4MCNy3JN9p/duOWrggr5wQPFKZRecNHkVG3Gx9XM4th7GJpMpZLw
	Kvr+Hej93/wCimSvKjy1RoBWhFKnA6MND9QXH46rIGZYZMXVfno0c5d/74bZf3kHvdAZ
	YanJFGMMsHKAnvL3Zm9+FpotPM1BNLWz1kLYMQsQWDKwSLxHyXQ2nFVh3Ul8vogc+wX4
	So6ZSWlBJ5ufrVflwU1nmh7QnodgDUVk3lJi+bS+qukkHLXRu4DgL2T7aplSCoYd3cvk
	2icA==
X-Gm-Message-State: AKGB3mJyrBBKW605VnyTSHXTPY0e+Lium77OVU1FHOjMFU40W66Y6/9f
	/U8e9j7yfqIcSqsDbakqV7DuktuIRQ0FgGop+bY=
X-Google-Smtp-Source: ACJfBou03Sml2yzAPdc1AOzMkQYEGNcjaElphnuM/pl/ZqkRfBvWh4f0teuL1JTrWGIqgsJ9Nb4qdi1NeVpuwDKbY+A=
X-Received: by 10.200.4.44 with SMTP id v44mr5260794qtg.80.1513693985222; Tue,
	19 Dec 2017 06:33:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Tue, 19 Dec 2017 06:33:04 -0800 (PST)
In-Reply-To: <a2058b89-3ede-0a13-32bd-bc8b0efe0630@windriver.com>
References: <cover.1513612975.git.ross.burton@intel.com>
	<CADkTA4NgB4VWEi+F+dQqzQ8pYWWbG8DFRQX9ZLs13t1Q2O52zw@mail.gmail.com>
	<a2058b89-3ede-0a13-32bd-bc8b0efe0630@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 19 Dec 2017 09:33:04 -0500
Message-ID: <CADkTA4MpC_2UQVwv+wcKOJe_U2_vMLP2K5tCJgCuJ+iJxmuX0w@mail.gmail.com>
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
X-List-Received-Date: Tue, 19 Dec 2017 14:33:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 19, 2017 at 12:23 AM, ChenQi <Qi.Chen@windriver.com> wrote:
> On 12/19/2017 12:45 PM, Bruce Ashfield wrote:
>>
>> On Mon, Dec 18, 2017 at 11:03 AM, Ross Burton <ross.burton@intel.com>
>> wrote:
>>>
>>> Hi,
>>>
>>> Another batch of patches from the list which have passed autobuilder
>>> testing and
>>> review.
>>>
>>> Ross
>>>
>>> The following changes since commit
>>> d6b6508e0be4452eb285495403b73fa9fcf51e3e:
>>>
>>>    temp disable inode checking on sstate (2017-12-13 14:02:02 +0000)
>>>
>>> are available in the git repository at:
>>>
>>>    git://git.yoctoproject.org/poky-contrib ross/mut
>>>
>>> for you to fetch changes up to f64e867d1ff5e559a96f44fac8a2434ad2643502:
>>>
>>>    meta-selftest: wic: Add test for --use-uuid / --fsuuid (2017-12-16
>>> 00:21:42 +0000)
>>>
>>> ----------------------------------------------------------------
>>> Alejandro Hernandez (4):
>>>        busybox: Add mkfs.EXT2 support on poky-tiny
>>>        linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.9
>>>        linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.12
>>>        linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.4
>>>
>>> Alexander Kanavin (9):
>>>        gobject-introspection: update to 1.54.1
>>>        webkitgtk: update to 2.18.3
>>>        psmisc: update to 23.0
>>>        ffmpeg: update to 3.4
>>>        devtool: add a 'latest-version' command
>>>        devtool: provide useful defaults for version/commit when upgrading
>>> recipes
>>>        devtool: add license checksum change handling to 'devtool upgrade'
>>>        maintainers.inc: add an entry for dwarfsrcfiles
>>>        maintainers.inc: add an entry for pkgconf
>>>
>>> Chang Rebecca Swee Fun (1):
>>>        recipetool: create: fix conflict between SRCREV and tag
>>>
>>> Chen Qi (4):
>>>        coreutils: upgrade to 8.28
>>>        coreutils: add PACKAGECONFIG for single-binary
>>>        dbus: upgrade to 1.12.2
>>>        dbus-test: upgrade to 1.12.2
>>
>>
>> Anyone else seeing dbus blow up during configure after this update ?
>>
>> --------------------------------
>> Initialising tasks: 100%
>>
>> |########################################################################################################################################|
>> Time: 0:00:00
>>
>> NOTE: Executing SetScene Tasks
>>
>> NOTE: Executing RunQueue Tasks
>>
>> ERROR: dbus-native-1.12.2-r0 do_configure: autoreconf execution failed.
>>
>> ERROR: dbus-native-1.12.2-r0 do_configure: Function failed:
>> do_configure (log file is located at
>>
>> /home/bruce/poky/build/tmp/work/x86_64-linux/dbus-native/1.12.2-r0/temp/log.do_configure.30425)
>>
>> ERROR: Logfile of failure stored in:
>>
>> /home/bruce/poky/build/tmp/work/x86_64-linux/dbus-native/1.12.2-r0/temp/log.do_configure.30425
>>
>> Log data follows:
>>
>> | DEBUG: Executing shell function autotools_preconfigure
>>
>> | DEBUG: Shell function autotools_preconfigure finished
>>
>> | DEBUG: Executing python function autotools_aclocals
>>
>> | DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
>> 'bit-64', 'x86_64-linux', 'common']
>>
>> | DEBUG: Python function autotools_aclocals finished
>>
>> | DEBUG: Executing shell function do_configure
>>
>> | automake (GNU automake) 1.15.1
>>
>> | Copyright (C) 2017 Free Software Foundation, Inc.
>>
>> | License GPLv2+: GNU GPL version 2 or later
>> <http://gnu.org/licenses/gpl-2.0.html>
>>
>> | This is free software: you are free to change and redistribute it.
>>
>> | There is NO WARRANTY, to the extent permitted by law.
>>
>> |
>>
>> | Written by Tom Tromey <tromey@redhat.com>
>>
>> |        and Alexandre Duret-Lutz <adl@gnu.org>.
>>
>>
>> <snip>
>>
>> | autoreconf: running:
>>
>> /home/bruce/poky/build/tmp/work/x86_64-linux/dbus-native/1.12.2-r0/recipe-sysroot-native/usr/bin/autoconf
>>
>> --include=/home/bruce/poky/build/tmp/work/x86_64-linux/dbus-native/1.12.2-r0/dbus-1.12.2/m4/
>> --force
>>
>> | configure.ac:95: error: Unexpanded AX_ macro found. Please install
>> GNU autoconf-archive
>>
>> |       If this token and others are legitimate, please use
>> m4_pattern_allow.
>>
>> |       See the Autoconf documentation.
>>
>> | configure.ac:374: error: Unexpanded AX_ macro found. Please install
>> GNU autoconf-archive
>>
>> | autoreconf:
>> /home/bruce/poky/build/tmp/work/x86_64-linux/dbus-native/1.12.2-r0/recipe-sysroot-native/usr/bin/autoconf
>> failed with exit status: 1
>>
>> | ERROR: autoreconf execution failed.
>>
>> | WARNING: exit code 1 from a shell command.
>>
>> | ERROR: Function failed: do_configure (log file is located at
>>
>> /home/bruce/poky/build/tmp/work/x86_64-linux/dbus-native/1.12.2-r0/temp/log.do_configure.30425)
>>
>> ERROR: Task
>> (virtual:native:/home/bruce/poky/meta/recipes-core/dbus/dbus_1.12.2.bb:do_configure)
>> failed with exit code '1'
>>
>> NOTE: Tasks Summary: Attempted 458 tasks of which 451 didn't need to
>> be rerun and 1 failed.
>>
>> --------------------------------
>>
>> Is there something I should have cleaned besides dbus and dbus-native
>> ? This is a
>> build directory that I've been using for ages (if that makes a
>> difference).
>>
>> Reverting the uprev of the dbus packages, fixed my build.
>>
>> Bruce
>>
>>
>
> Hi Bruce,
>
> I also encountered similar problem when I was upgrading dbus. The problem
> has been solved by adding 'autoconf-archive' to DEPENDS.
>
> configure.ac:374 means macro AX_CODE_COVERAGE.
> For now, I can find it in recipe-sysroot-native of dbus-native. See below.
>
> ~/poky/build-systemd/tmp/work/x86_64-linux/dbus-native/1.12.2-r0 [1] $ grep
> -rw AX_CODE_COVERAGE recipe-sysroot-native/
> recipe-sysroot-native/usr/share/aclocal/ax_code_coverage.m4:#
> AX_CODE_COVERAGE()
> recipe-sysroot-native/usr/share/aclocal/ax_code_coverage.m4:#
> AX_CODE_COVERAGE
> recipe-sysroot-native/usr/share/aclocal/ax_code_coverage.m4:AC_DEFUN([AX_CODE_COVERAGE],[
>
> ~/poky/build-systemd/tmp/work/x86_64-linux/dbus-native/1.12.2-r0 [1] $ grep
> ax_code_coverage.m4
> recipe-sysroot-native/installeddeps/autoconf-archive-native
> recipe-sysroot-native/usr/share/aclocal/ax_code_coverage.m4
>
> Could you please help check if autoconf-archive-native is in DEPENDS of
> dbus-native? And also the above files available in recipe-sysroot-native of
> dbus-native?

I removed my revert of the upgrade, and it definitely blew up again
(in the same way). Here's
the things you wanted me to check:

yow-bashfiel-d4 [/home/bruc.../1.12.2-r0]> pwd
/home/bruce/poky/build/tmp/work/x86_64-linux/dbus-native/1.12.2-r0
yow-bashfiel-d4 [/home/bruc.../1.12.2-r0]> grep -rw AX_CODE_COVERAGE
recipe-sysroot-native/

So that AC define isn't in my native sysroot.

As for the depends, do you mean dumping it from bitbake, or just
reading the recipe ?
(I'm thinking bitbake, since anyone could read the recipe), but for
completeness sake, the
recipe has:

DEPENDS = "expat virtual/libintl autoconf-archive"
RDEPENDS_dbus_class-native = ""
RDEPENDS_dbus_class-nativesdk = ""

And from bitbake -e on dbus-native:

DEPENDS="pkgconfig-native autoconf-native automake-native
libtool-native gnu-config-native gettext-minimal-native expat-native
virtual/libintl-native autoconf-archive-native"

... but yet, I still fail to configure.

Bruce

>
> Best Regards,
> Chen Qi



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

