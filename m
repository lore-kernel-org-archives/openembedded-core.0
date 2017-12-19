Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5E2AF78289
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 05:21:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vBJ5LJcP012295
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Dec 2017 21:21:20 -0800 (PST)
Received: from [128.224.162.167] (128.224.162.167) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 18 Dec 2017 21:21:19 -0800
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Ross Burton
	<ross.burton@intel.com>
References: <cover.1513612975.git.ross.burton@intel.com>
	<CADkTA4NgB4VWEi+F+dQqzQ8pYWWbG8DFRQX9ZLs13t1Q2O52zw@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <a2058b89-3ede-0a13-32bd-bc8b0efe0630@windriver.com>
Date: Tue, 19 Dec 2017 13:23:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4NgB4VWEi+F+dQqzQ8pYWWbG8DFRQX9ZLs13t1Q2O52zw@mail.gmail.com>
X-Originating-IP: [128.224.162.167]
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
X-List-Received-Date: Tue, 19 Dec 2017 05:21:20 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/19/2017 12:45 PM, Bruce Ashfield wrote:
> On Mon, Dec 18, 2017 at 11:03 AM, Ross Burton <ross.burton@intel.com> wrote:
>> Hi,
>>
>> Another batch of patches from the list which have passed autobuilder testing and
>> review.
>>
>> Ross
>>
>> The following changes since commit d6b6508e0be4452eb285495403b73fa9fcf51e3e:
>>
>>    temp disable inode checking on sstate (2017-12-13 14:02:02 +0000)
>>
>> are available in the git repository at:
>>
>>    git://git.yoctoproject.org/poky-contrib ross/mut
>>
>> for you to fetch changes up to f64e867d1ff5e559a96f44fac8a2434ad2643502:
>>
>>    meta-selftest: wic: Add test for --use-uuid / --fsuuid (2017-12-16 00:21:42 +0000)
>>
>> ----------------------------------------------------------------
>> Alejandro Hernandez (4):
>>        busybox: Add mkfs.EXT2 support on poky-tiny
>>        linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.9
>>        linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.12
>>        linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.4
>>
>> Alexander Kanavin (9):
>>        gobject-introspection: update to 1.54.1
>>        webkitgtk: update to 2.18.3
>>        psmisc: update to 23.0
>>        ffmpeg: update to 3.4
>>        devtool: add a 'latest-version' command
>>        devtool: provide useful defaults for version/commit when upgrading recipes
>>        devtool: add license checksum change handling to 'devtool upgrade'
>>        maintainers.inc: add an entry for dwarfsrcfiles
>>        maintainers.inc: add an entry for pkgconf
>>
>> Chang Rebecca Swee Fun (1):
>>        recipetool: create: fix conflict between SRCREV and tag
>>
>> Chen Qi (4):
>>        coreutils: upgrade to 8.28
>>        coreutils: add PACKAGECONFIG for single-binary
>>        dbus: upgrade to 1.12.2
>>        dbus-test: upgrade to 1.12.2
>
> Anyone else seeing dbus blow up during configure after this update ?
>
> --------------------------------
> Initialising tasks: 100%
> |########################################################################################################################################|
> Time: 0:00:00
>
> NOTE: Executing SetScene Tasks
>
> NOTE: Executing RunQueue Tasks
>
> ERROR: dbus-native-1.12.2-r0 do_configure: autoreconf execution failed.
>
> ERROR: dbus-native-1.12.2-r0 do_configure: Function failed:
> do_configure (log file is located at
> /home/bruce/poky/build/tmp/work/x86_64-linux/dbus-native/1.12.2-r0/temp/log.do_configure.30425)
>
> ERROR: Logfile of failure stored in:
> /home/bruce/poky/build/tmp/work/x86_64-linux/dbus-native/1.12.2-r0/temp/log.do_configure.30425
>
> Log data follows:
>
> | DEBUG: Executing shell function autotools_preconfigure
>
> | DEBUG: Shell function autotools_preconfigure finished
>
> | DEBUG: Executing python function autotools_aclocals
>
> | DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
> 'bit-64', 'x86_64-linux', 'common']
>
> | DEBUG: Python function autotools_aclocals finished
>
> | DEBUG: Executing shell function do_configure
>
> | automake (GNU automake) 1.15.1
>
> | Copyright (C) 2017 Free Software Foundation, Inc.
>
> | License GPLv2+: GNU GPL version 2 or later
> <http://gnu.org/licenses/gpl-2.0.html>
>
> | This is free software: you are free to change and redistribute it.
>
> | There is NO WARRANTY, to the extent permitted by law.
>
> |
>
> | Written by Tom Tromey <tromey@redhat.com>
>
> |        and Alexandre Duret-Lutz <adl@gnu.org>.
>
>
> <snip>
>
> | autoreconf: running:
> /home/bruce/poky/build/tmp/work/x86_64-linux/dbus-native/1.12.2-r0/recipe-sysroot-native/usr/bin/autoconf
> --include=/home/bruce/poky/build/tmp/work/x86_64-linux/dbus-native/1.12.2-r0/dbus-1.12.2/m4/
> --force
>
> | configure.ac:95: error: Unexpanded AX_ macro found. Please install
> GNU autoconf-archive
>
> |       If this token and others are legitimate, please use m4_pattern_allow.
>
> |       See the Autoconf documentation.
>
> | configure.ac:374: error: Unexpanded AX_ macro found. Please install
> GNU autoconf-archive
>
> | autoreconf: /home/bruce/poky/build/tmp/work/x86_64-linux/dbus-native/1.12.2-r0/recipe-sysroot-native/usr/bin/autoconf
> failed with exit status: 1
>
> | ERROR: autoreconf execution failed.
>
> | WARNING: exit code 1 from a shell command.
>
> | ERROR: Function failed: do_configure (log file is located at
> /home/bruce/poky/build/tmp/work/x86_64-linux/dbus-native/1.12.2-r0/temp/log.do_configure.30425)
>
> ERROR: Task (virtual:native:/home/bruce/poky/meta/recipes-core/dbus/dbus_1.12.2.bb:do_configure)
> failed with exit code '1'
>
> NOTE: Tasks Summary: Attempted 458 tasks of which 451 didn't need to
> be rerun and 1 failed.
>
> --------------------------------
>
> Is there something I should have cleaned besides dbus and dbus-native
> ? This is a
> build directory that I've been using for ages (if that makes a difference).
>
> Reverting the uprev of the dbus packages, fixed my build.
>
> Bruce
>
>

Hi Bruce,

I also encountered similar problem when I was upgrading dbus. The 
problem has been solved by adding 'autoconf-archive' to DEPENDS.

configure.ac:374 means macro AX_CODE_COVERAGE.
For now, I can find it in recipe-sysroot-native of dbus-native. See below.

~/poky/build-systemd/tmp/work/x86_64-linux/dbus-native/1.12.2-r0 [1] $ 
grep -rw AX_CODE_COVERAGE recipe-sysroot-native/
recipe-sysroot-native/usr/share/aclocal/ax_code_coverage.m4:# 
AX_CODE_COVERAGE()
recipe-sysroot-native/usr/share/aclocal/ax_code_coverage.m4:# 
AX_CODE_COVERAGE
recipe-sysroot-native/usr/share/aclocal/ax_code_coverage.m4:AC_DEFUN([AX_CODE_COVERAGE],[

~/poky/build-systemd/tmp/work/x86_64-linux/dbus-native/1.12.2-r0 [1] $ 
grep ax_code_coverage.m4 
recipe-sysroot-native/installeddeps/autoconf-archive-native
recipe-sysroot-native/usr/share/aclocal/ax_code_coverage.m4

Could you please help check if autoconf-archive-native is in DEPENDS of 
dbus-native? And also the above files available in recipe-sysroot-native 
of dbus-native?

Best Regards,
Chen Qi

