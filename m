Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1E54B6EC51
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 10:20:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1LAKAYq013251
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 21 Feb 2014 02:20:10 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 21 Feb 2014 02:20:09 -0800
Message-ID: <53072858.7060600@windriver.com>
Date: Fri, 21 Feb 2014 18:20:08 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: =?UTF-8?B?IkNoYXJsZXMgWmhhaSAo57+f5q2j5piMKSI=?= <Charles.Zhai@wnc.com.tw>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <F5E21899216EC24D9042BF90A93DA923255A3446@cnmbox1>
In-Reply-To: <F5E21899216EC24D9042BF90A93DA923255A3446@cnmbox1>
Subject: Re: configure: error: C compiler cannot create executables
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
X-List-Received-Date: Fri, 21 Feb 2014 10:20:12 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


Hi Charles,

This should go into oe-core mailing list.

For the error, maybe you can:

$ bitbake system-core -cdevshell

Then create a foo.c, and compile it with the command to see the errors:

ccache arm-oe-linux-gnueabi-gcc foo.c -o foo  -march=armv7-a -fno-tree-vectorize 
-mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 
-mno-thumb-interwork -mno-thumb 
--sysroot=/home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/sysroots/9615-cdp

Note, it is only the pseudo-code, not very sure whether it works or not,
you may need adjust it a little.

// Robert


On 02/18/2014 03:17 PM, Charles Zhai (翟正昌) wrote:
> charles@bl460gen8:~/4533/apps_proc/oe-core$ source build/conf/set_bb_env.sh
>
> ### Shell environment set up for builds. ###
>
> You can now run 'bitbake <target>'
>
> Common targets are:
>      core-image-minimal
>      core-image-sato
>      meta-toolchain
>      meta-toolchain-sdk
>      adt-installer
>      meta-ide-support
>
> You can also run generated qemu images with a command like 'runqemu qemux86'
>
> charles@bl460gen8:~/4533/apps_proc/oe-core/build$ bitbake -fc compile system-core
> NOTE: Out of date cache found, rebuilding...
> Parsing recipes: 100% |#########################################| ETA:  00:00:00
> Parsing of 918 .bb files complete (0 cached, 918 parsed). 1197 targets, 42 skipped, 0 masked, 0 errors.
>
> OE Build Configuration:
> BB_VERSION        = "1.15.1"
> TARGET_ARCH       = "arm"
> TARGET_OS         = "linux-gnueabi"
> MACHINE           = "9615-cdp"
> DISTRO            = "msm"
> DISTRO_VERSION    = "20140218"
> TUNE_FEATURES     = "armv7a vfp neon cortexa8"
> TARGET_FPU        = "vfp-neon"
> meta-qcom         = "(nobranch):746e8ffa66850bf9050cd6baf94eb76c492eb535"
> meta-msm          = "(nobranch):fc0285e3de164d0e5525576e0214d20e50d51fba"
> meta
> meta-skeleton     = "(nobranch):746e8ffa66850bf9050cd6baf94eb76c492eb535"
>
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> NOTE: Running task 263 of 264 (ID: 3, /home/charles/4533/apps_proc/oe-core/meta-msm/recipes/system-core/system-core_git.bb, do_configure)
> NOTE: package system-core-git-r6: task do_configure: Started
> ERROR: Function failed: do_configure (see /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/temp/log.do_configure.17410 for further information)
> ERROR: Logfile of failure stored in: /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/temp/log.do_configure.17410
> Log data follows:
> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
> | + cd /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core
> | + do_configure
> | + autotools_do_configure
> | + case system-core in
> | ++ find /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core -name configure.in -o -name configure.ac
> | + for ac in '`find /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core -name configure.in -o -name configure.ac`'
> | ++ dirname /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/powerapp/configure.ac
> | + rm -f /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/powerapp/configure
> | + for ac in '`find /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core -name configure.in -o -name configure.ac`'
> | ++ dirname /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/configure.ac
> | + rm -f /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/configure
> | + '[' -e /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/configure.in -o -e /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/configure.ac ']'
> | ++ pwd
> | + olddir=/home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core
> | + cd /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core
> | + '[' xdefault = xdefault ']'
> | + acpaths=
> | ++ find /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core -maxdepth 2 -name '*.m4'
> | ++ grep -v aclocal.m4
> | ++ grep -v acinclude.m4
> | ++ sed -e 's,\(.*/\).*$,\1,'
> | ++ sort -u
> | + for i in '`find /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core -maxdepth 2 -name \*.m4|grep -v '\''aclocal.m4'\''|                                          grep -v '\''acinclude.m4'\'' | sed -e '\''s,\(.*/\).*$,\1,'\''|sort -u`'
> | + acpaths=' -I /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/aclocal-copy/'
> | ++ automake --version
> | ++ head -n 1
> | ++ sed 's/.* //;s/\.[0-9]\+$//'
> | + AUTOV=1.11
> | + automake --version
> | automake (GNU automake) 1.11.2
> | Copyright (C) 2011 Free Software Foundation, Inc.
> | License GPLv2+: GNU GPL version 2 or later <http://gnu.org/licenses/gpl-2.0.html>
> | This is free software: you are free to change and redistribute it.
> | There is NO WARRANTY, to the extent permitted by law.
> |
> | Written by Tom Tromey <tromey@redhat.com>
> |        and Alexandre Duret-Lutz <adl@gnu.org>.
> | + echo 'AUTOV is 1.11'
> | AUTOV is 1.11
> | + '[' -d /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/share/aclocal-1.11 ']'
> | + acpaths=' -I /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/aclocal-copy/ -I/home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/share/aclocal-1.11'
> | + '[' -d /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/sysroots/9615-cdp/usr/share/aclocal ']'
> | + mkdir -p /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/aclocal-copy/
> | + cp -r /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/sysroots/9615-cdp/usr/share/aclocal/. /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/aclocal-copy/
> | + acpaths=' -I /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/aclocal-copy/ -I/home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/share/aclocal-1.11 -I /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/aclocal-copy/'
> | + echo --exclude=autopoint
> | + grep -q aclocal
> | + rm -f aclocal.m4
> | + '[' -e configure.in ']'
> | + CONFIGURE_AC=configure.ac
> | + echo
> | + grep -q '\-\-disable-nls'
> | + grep '^[[:space:]]*AM_GLIB_GNU_GETTEXT' configure.ac
> | + grep '^[[:space:]]*AM_GNU_GETTEXT' configure.ac
> | + mkdir -p m4
> | + grep '^[[:space:]]*[AI][CT]_PROG_INTLTOOL' configure.ac
> | + bbnote Executing autoreconf --verbose --install --force --exclude=autopoint -I /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/aclocal-copy/ -I/home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/share/aclocal-1.11 -I /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/aclocal-copy/
> | + echo 'NOTE: Executing autoreconf --verbose --install --force --exclude=autopoint -I /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/aclocal-copy/ -I/home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/share/aclocal-1.11 -I /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/aclocal-copy/'
> | NOTE: Executing autoreconf --verbose --install --force --exclude=autopoint -I /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/aclocal-copy/ -I/home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/share/aclocal-1.11 -I /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/aclocal-copy/
> | + autoreconf -Wcross --verbose --install --force --exclude=autopoint -I /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/aclocal-copy/ -I/home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/share/aclocal-1.11 -I /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/aclocal-copy/
> | autoreconf: Entering directory `.'
> | autoreconf: configure.ac: not using Gettext
> | autoreconf: running: aclocal -I /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/aclocal-copy/ -I /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/share/aclocal-1.11 -I /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/aclocal-copy/ -I /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/aclocal-copy/ -I /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/share/aclocal-1.11 -I /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/aclocal-copy/ --force --warnings=cross
> | aclocal: unknown warning category `cross'
> | /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/aclocal-copy/libpcap.m4:40: warning: underquoted definition of AC_LBL_C_INIT_BEFORE_CC
> | /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/aclocal-copy/libpcap.m4:40:   run info '(automake)Extending aclocal'
> | /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/aclocal-copy/libpcap.m4:40:   or see http://www.gnu.org/software/automake/manual/automake.html#Extending-aclocal
> | autoreconf: configure.ac: tracing
> | autoreconf: running: libtoolize --copy --force
> | libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, `build-aux'.
> | libtoolize: copying file `build-aux/ltmain.sh'
> | libtoolize: Consider adding `AC_CONFIG_MACRO_DIR([m4])' to configure.ac and
> | libtoolize: rerunning libtoolize, to keep the correct libtool macros in-tree.
> | libtoolize: Consider adding `-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
> | aclocal: unknown warning category `cross'
> | /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/aclocal-copy/libpcap.m4:40: warning: underquoted definition of AC_LBL_C_INIT_BEFORE_CC
> | /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/aclocal-copy/libpcap.m4:40:   run info '(automake)Extending aclocal'
> | /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/aclocal-copy/libpcap.m4:40:   or see http://www.gnu.org/software/automake/manual/automake.html#Extending-aclocal
> | autoreconf: running: /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/autoconf --include=/home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/aclocal-copy/ --include=/home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/share/aclocal-1.11 --include=/home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/aclocal-copy/ --force --warnings=cross
> | autoreconf: running: /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/autoheader --include=/home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/aclocal-copy/ --include=/home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/share/aclocal-1.11 --include=/home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/aclocal-copy/ --force --warnings=cross
> | autoreconf: running: automake --foreign --add-missing --copy --force-missing --warnings=cross
> | automake: unknown warning category `cross'
> | autoreconf: running: gnu-configize
> | autoreconf: Leaving directory `.'
> | + cd /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core
> | + '[' -e /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/configure ']'
> | + oe_runconf
> | + cfgscript=/home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/configure
> | + '[' -x /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/configure ']'
> | + bbnote 'Running /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/configure  --build=x86_64-linux                   --host=arm-oe-linux-gnueabi                 --target=arm-oe-linux-gnueabi              --prefix=/usr                   --exec_prefix=/usr                  --bindir=/usr/bin                     --sbindir=/usr/sbin                 --libexecdir=/usr/libexec                --datadir=/usr/share                  --sysconfdir=/etc                    --sharedstatedir=/com                   --localstatedir=/var                --libdir=/usr/lib                   --includedir=/usr/include      --oldincludedir=/usr/include                   --infodir=/usr/share/info                --mandir=/usr/share/man                  --disable-silent-rules              --disable-dependency-tracking              --with-libtool-sysroot=/home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/sysroots/9615-cdp  '
> | + echo 'NOTE: Running /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/configure  --build=x86_64-linux                   --host=arm-oe-linux-gnueabi                 --target=arm-oe-linux-gnueabi              --prefix=/usr                   --exec_prefix=/usr                  --bindir=/usr/bin                     --sbindir=/usr/sbin                 --libexecdir=/usr/libexec                --datadir=/usr/share                  --sysconfdir=/etc                    --sharedstatedir=/com                   --localstatedir=/var                --libdir=/usr/lib                   --includedir=/usr/include      --oldincludedir=/usr/include                   --infodir=/usr/share/info                --mandir=/usr/share/man                  --disable-silent-rules              --disable-dependency-tracking              --with-libtool-sysroot=/home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/sysroots/9615-cdp  '
> | NOTE: Running /home/charles/4533/appsERROR: Function failed: do_configure (see /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/temp/log.do_configure.17410 for further information)
> | _proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/configure  --build=x86_64-linux                      --host=arm-oe-linux-gnueabi                 --target=arm-oe-linux-gnueabi              --prefix=/usr   --exec_prefix=/usr               --bindir=/usr/bin                     --sbindir=/usr/sbin                 --libexecdir=/usr/libexec                --datadir=/usr/share   --sysconfdir=/etc                --sharedstatedir=/com                   --localstatedir=/var                --libdir=/usr/lib               --includedir=/usr/include                    --oldincludedir=/usr/include                   --infodir=/usr/share/info                --mandir=/usr/share/man                  --disable-silent-rules              --disable-dependency-tracking              --with-libtool-sysroot=/home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/sysroots/9615-cdp
> | + /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core/configure --build=x86_64-linux --host=arm-oe-linux-gnueabi --target=arm-oe-linux-gnueabi --prefix=/usr --exec_prefix=/usr --bindir=/usr/bin --sbindir=/usr/sbin --libexecdir=/usr/libexec --datadir=/usr/share --sysconfdir=/etc --sharedstatedir=/com --localstatedir=/var --libdir=/usr/lib --includedir=/usr/include --oldincludedir=/usr/include --infodir=/usr/share/info --mandir=/usr/share/man --disable-silent-rules --disable-dependency-tracking --with-libtool-sysroot=/home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/sysroots/9615-cdp
> | configure: WARNING: unrecognized options: --disable-silent-rules
> | configure: loading site script /home/charles/4533/apps_proc/oe-core/meta/site/endian-little
> | configure: loading site script /home/charles/4533/apps_proc/oe-core/meta/site/arm-common
> | configure: loading site script /home/charles/4533/apps_proc/oe-core/meta/site/common-linux
> | configure: loading site script /home/charles/4533/apps_proc/oe-core/meta/site/common-glibc
> | configure: loading site script /home/charles/4533/apps_proc/oe-core/meta/site/arm-linux
> | configure: loading site script /home/charles/4533/apps_proc/oe-core/meta/site/common
> | configure: loading site script /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/sysroots/9615-cdp/usr/share/arm-oe-linux-gnueabi_config_site.d/zlib_config
> | configure: loading site script /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/sysroots/9615-cdp/usr/share/arm-oe-linux-gnueabi_config_site.d/ncurses_config
> | configure: loading site script /home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/sysroots/9615-cdp/usr/share/arm-oe-linux-gnueabi_config_site.d/eglibc_config
> | checking for a BSD-compatible install... /usr/bin/install -c
> | checking whether build environment is sane... yes
> | checking for arm-oe-linux-gnueabi-strip... arm-oe-linux-gnueabi-strip
> | checking for a thread-safe mkdir -p... /bin/mkdir -p
> | checking for gawk... gawk
> | checking whether make sets $(MAKE)... yes
> | checking whether to enable maintainer-specific portions of Makefiles... no
> | checking for style of include used by make... GNU
> | checking for arm-oe-linux-gnueabi-gcc... ccache arm-oe-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 -mno-thumb-interwork -mno-thumb --sysroot=/home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/sysroots/9615-cdp
> | checking whether the C compiler works... no
> | configure: error: in `/home/charles/4533/apps_proc/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/system-core-git-r6/core':
> | configure: error: C compiler cannot create executables
> | See `config.log' for more details
> | + bbfatal 'oe_runconf failed'
> | + echo 'ERROR: oe_runconf failed'
> | ERROR: oe_runconf failed
> | + exit 1
> NOTE: package system-core-git-r6: task do_configure: Failed
> ERROR: Task 3 (/home/charles/4533/apps_proc/oe-core/meta-msm/recipes/system-core/system-core_git.bb, do_configure) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 263 tasks of which 262 didn't need to be rerun and 1 failed.
>
> Summary: 1 task failed:
>    /home/charles/4533/apps_proc/oe-core/meta-msm/recipes/system-core/system-core_git.bb, do_configure
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>
>
> ________________________________
> This email and any attachments are intended for the sole use of the named recipient(s) and may contain confidential, proprietary, privileged or copyrighted information. If you are not the intended recipient, please delete immediately. Do not read, copy, or forward this email or any attachments.
> ________________________________
>
>
>
> _______________________________________________
> bitbake-devel mailing list
> bitbake-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/bitbake-devel
>

