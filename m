Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f182.google.com (mail-yb0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id C25FA71ABD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 07:01:21 +0000 (UTC)
Received: by mail-yb0-f182.google.com with SMTP id d7-v6so1433427ybn.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 00:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KhKUZSqsh/vuCKhOjOO1NgDkzRfGdpfn2j+8SofJ2EE=;
	b=fzVsQW7JSO2Hs615tEYMQVs2N2O2lDpANA443xiJSulU4rrDoKTYkAo+biv23r0fm5
	I/ZZMrqYixZXTQUMNWksFAyo99Vm4h+dIHbKrhk4DnCRVUYIKGCPi0yqY18cE0cn+acl
	5/Qc7nwvuKQyC+p3JvuCFwY+Mx9vk/cioYQPcOdc/BzFPL1qFVyi+SRL99m9h/X/4mY0
	FxWkqP8pbTPLRZn7TY1MyAtM8icv2C4W5vtDX2elPJEUG2Vb60ZurmJjXqkW3dObW7LK
	ix8PtF0eHfaVuKMiQXoUWV27B0ViHMCkKGQ2QC6OCwrmmGRywgP4QaOLUMfKd+1FY11k
	k7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KhKUZSqsh/vuCKhOjOO1NgDkzRfGdpfn2j+8SofJ2EE=;
	b=Haq3YLVQQ9XlmNPpyifTI4JFb6BD6CHDneWZVulZZW6ttqcNzogNNB9w5NRrJSGSWh
	G4Fgsbdv22aGFEWO5IXf/P6IgDygtk7e9wSkhmP45VRCYkyXmJrpqlJ1q2PereHlulm2
	SZQij+2j6GFKFGq3y7neafwcX8p5PM6K0OQ+VWjsDPYeEcUFv5343iu2e7904gVbdLFO
	TZMbZhV1wb07TzMX9R+7Ic3xyrvcPIRZSTyvWLepEdUK3/9Fb0AUhdjmEK1bitIn759P
	Ih9LLZ/6VE88V/9QsYw702Jc1xGdfGgM9oVe7D0Pw5tfbyFcE3YsSwT4heOrzgsK7rvo
	mVGQ==
X-Gm-Message-State: AElRT7FFw+7z8Pgws/Yefg5lZ+wUaYXIi8aabU9oqFUoNopGUDtq7tQl
	VdUukwTtVA9dHn23l3Z1c4EdWylyeQOmuVWsgQY=
X-Google-Smtp-Source: AIpwx48Gl7M8Cz/0MZyp+9Pf3/I8nOdinmI+w+lD4NFF7SL6AIW4lq/3kTTviZDQvPteWvHgG0wXSOI+rpwleM5JZU8=
X-Received: by 2002:a5b:885:: with SMTP id e5-v6mr4062185ybq.180.1522306882406;
	Thu, 29 Mar 2018 00:01:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP; Thu, 29 Mar 2018 00:01:21
	-0700 (PDT)
In-Reply-To: <CAPGMVzHCs9j9=UJJwKp6zM_G6_4MYNs=oLk3QjAay7ut0ETrxw@mail.gmail.com>
References: <CAPGMVzHCs9j9=UJJwKp6zM_G6_4MYNs=oLk3QjAay7ut0ETrxw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 29 Mar 2018 09:01:21 +0200
Message-ID: <CALbNGRR_uLb90KsBRJ_Xko+Finj=m5rE=wpxsqf5=85Xe1itTA@mail.gmail.com>
To: Rajath C S <rajathcs.1996@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-debian] build error
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
X-List-Received-Date: Thu, 29 Mar 2018 07:01:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 29, 2018 at 6:49 AM, Rajath C S <rajathcs.1996@gmail.com> wrote:
> 0 down vote favorite
>
> I followed the instruction provided by meta-debian github page:
> https://github.com/meta-debian/meta-debian
>
> During the build process I faced errors while bitbake was do-compiling some
> of the recipes.. they are e2fsprogs, busybox, gettext etc..
>
> I searched the respective layers i.e, meta and meta-debian and found out
> that this recipes were present in both the layers.
>
> I removed e2fsprogs from meta layer and busybox, gettext from meta-debian
> and bitbaked again, this removed the errors which was showing previously
> during bitbake. I did this because same recipes was present in the both the
> layers.
>
> now the build is completed up to 90% but I'm stuck at gcc-runtime-4.9.2-r0
> do_compile error.
>
> I tried hard but I'm not able to solve this error.
>
> The entire terminal output is as shown below.
>
> ERROR: gcc-runtime-4.9.2-r0 do_compile: oe_runmake failed
>
> ERROR: gcc-runtime-4.9.2-r0 do_compile: Function failed: do_compile (log
> file is located at
> /media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/temp/log.do_compile.18839)
>
> ERROR: Logfile of failure stored in:
> /media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/temp/log.do_compile.18839
>
> Log data follows: | DEBUG: SITE files ['endian-little', 'bit-32',
> 'ix86-common', 'common-linux', 'common-glibc', 'i586-linux', 'common'] |
> DEBUG: Executing shell function do_compile | NOTE: make -j 4
> ARCH_FLAGS_FOR_TARGET= -m32 -march=i586
> -isystem/media/pavan/WD03/build/tmp/sysroots/qemux86/usr/include
> MULTIBUILDTOP=/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/gcc-4.9.2/build.i586-deby-linux.i586-deby-linux/i586-deby-linux/libgcc/
> | # If this is the top-level multilib, build all the other | DEFINES=''
> HEADERS='/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/git/src/libgcc/config/i386/value-unwind.h'
> \ |
> /media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/git/src/libgcc/mkheader.sh
>> tmp-libgcc_tm.h | # multilibs. | /bin/bash
> /media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/git/src/libgcc/../move-if-change
> tmp-libgcc_tm.h libgcc_tm.h | i586-deby-linux-gcc -m32 -march=i586
> --sysroot=/media/pavan/WD03/build/tmp/sysroots/qemux86 -O2 -pipe -g
> -feliminate-unused-debug-types
> -fdebug-prefix-map=/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0=/usr/src/debug/gcc-runtime/4.9.2-r0
> -fdebug-prefix-map=/media/pavan/WD03/build/tmp/sysroots/x86_64-linux=
> -fdebug-prefix-map=/media/pavan/WD03/build/tmp/sysroots/qemux86= -O2 -g -Os
> -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE -W -Wall -Wno-narrowing -Wwrite-strings
> -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition
> -isystem ./include -fpic -mlong-double-80 -g -DIN_LIBGCC2 -fbuilding-libgcc
> -fno-stack-protector -fpic -mlong-double-80 -I. -I.
> -I/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/gcc-4.9.2/build.i586-deby-linux.i586-deby-linux/i586-deby-linux/libgcc/../.././gcc
> -I/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/git/src/libgcc
> -I/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/git/src/libgcc/.
> -I/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/git/src/libgcc/../gcc
> -I/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/git/src/libgcc/../include
> -I/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/git/src/libgcc/config/libbid
> -DENABLE_DECIMAL_BID_FORMAT -DHAVE_CC_TLS -DUSE_TLS -o morestack_s.o -MT
> morestack_s.o -MD -MP -MF morestack_s.dep -DSHARED -c -xassembler-with-cpp
> /media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/git/src/libgcc/config/i386/morestack.S
> | sed -e 's/PFX//g' \ | -e 's/__FIXPTPFX/__/g' <
> /media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/git/src/libgcc/libgcc-std.ver.in
>> libgcc-std.ver PIC -DPIC -fno-implicit-templates -Wall -Wextra
> -Wwrite-strings -Wcast-qual -Wabi -fdiagnostics-show-location=once
> -ffunction-sections -fdata-sections -frandom-seed=compatibility-condvar.lo
> -O2 -pipe -g -feliminate-unused-debug-types
> -fdebug-prefix-map=/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0=/usr/src/debug/gcc-runtime/4.9.2-r0
> -fdebug-prefix-map=/media/pavan/WD03/build/tmp/sysroots/x86_64-linux=
> -fdebug-prefix-map=/media/pavan/WD03/build/tmp/sysroots/qemux86=
> -std=gnu++11 -c
> /media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/git/src/libstdc++-v3/src/c++11/compatibility-condvar.cc
> -o compatibility-condvar.o >/dev/null 2>&1 | /bin/bash ../libtool --tag CXX
> --mode=link i586-deby-linux-g++ -m32 -march=i586
> --sysroot=/media/pavan/WD03/build/tmp/sysroots/qemux86 -nostdinc++
> -nostdlib++ -Wl,-O1 -Wl,-z,relro -Wl,--gc-sections -fPIC -DPIC
> -fno-implicit-templates -Wall -Wextra -Wwrite-strings -Wcast-qual -Wabi
> -fdiagnostics-show-location=once -ffunction-sections -fdata-sections
> -frandom-seed=libstdc++.la '-Wl,-O1' '-Wl,--hash-style=gnu' -o libstdc++.la
> -version-info 6:20:0 -Wl,--version-script=libstdc++-symbols.ver -lm -rpath
> /usr/lib compatibility.lo compatibility-debug_list.lo
> compatibility-debug_list-2.lo compatibility-c++0x.lo
> compatibility-atomic-c++0x.lo compatibility-thread-c++0x.lo
> compatibility-chrono.lo compatibility-condvar.lo
> ../libsupc++/libsupc++convenience.la ../src/c++98/libc++98convenience.la
> ../src/c++11/libc++11convenience.la | libtool: link: i586-deby-linux-g++
> -m32 -march=i586 --sysroot=/media/pavan/WD03/build/tmp/sysroots/qemux86
> -nostdinc++ -nostdlib++ -shared -nostdlib
> /media/pavan/WD03/build/tmp/sysroots/qemux86/usr/lib/crti.o
> /media/pavan/WD03/build/tmp/sysroots/qemux86/usr/lib/i586-deby-linux/4.9/crtbeginS.o
> .libs/compatibility.o .libs/compatibility-debug_list.o
> .libs/compatibility-debug_list-2.o .libs/compatibility-c++0x.o
> .libs/compatibility-atomic-c++0x.o .libs/compatibility-thread-c++0x.o
> .libs/compatibility-chrono.o .libs/compatibility-condvar.o
> -Wl,--whole-archive ../libsupc++/.libs/libsupc++convenience.a
> ../src/c++98/.libs/libc++98convenience.a
> ../src/c++11/.libs/libc++11convenience.a -Wl,--no-whole-archive -lm
> -L/media/pavan/WD03/build/tmp/sysroots/x86_64-linux/usr/lib/i586-deby-linux/gcc/i586-deby-linux/4.9
> -L/media/pavan/WD03/build/tmp/sysroots/qemux86/lib
> -L/media/pavan/WD03/build/tmp/sysroots/qemux86/usr/lib/i586-deby-linux/4.9
> -L/media/pavan/WD03/build/tmp/sysroots/qemux86/usr/lib -lc -lgcc_s
> /media/pavan/WD03/build/tmp/sysroots/qemux86/usr/lib/i586-deby-linux/4.9/crtendS.o
> /media/pavan/WD03/build/tmp/sysroots/qemux86/usr/lib/crtn.o -m32 -march=i586
> -Wl,-O1 -Wl,-z -Wl,relro -Wl,--gc-sections -Wl,-O1 -Wl,--hash-style=gnu
> -Wl,--version-script=libstdc++-symbols.ver -Wl,-soname -Wl,libstdc++.so.6 -o
> .libs/libstdc++.so.6.0.20 |
> ../src/c++11/.libs/libc++11convenience.a(system_error.o): In function
> __static_initialization_and_destruction_0': |
> /usr/src/debug/gcc-runtime/4.9.2-r0/git/src/libstdc++-v3/src/c++11/system_error.cc:65:
> undefined reference to__dso_handle' |
> /media/pavan/WD03/build/tmp/sysroots/x86_64-linux/usr/libexec/i586-deby-linux/gcc/i586-deby-linux/4.9/ld:
> ../src/c++11/.libs/libc++11convenience.a(system_error.o): relocation
> R_386_GOTOFF against undefined hidden symbol `__dso_handle' can not be used
> when making a shared object |
> /media/pavan/WD03/build/tmp/sysroots/x86_64-linux/usr/libexec/i586-deby-linux/gcc/i586-deby-linux/4.9/ld:
> final link failed: Bad value | collect2: error: ld returned 1 exit status |
> Makefile:555: recipe for target 'libstdc++.la' failed | make[3]: *
> [libstdc++.la] Error 1 | make[3]: Leaving directory
> '/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/gcc-4.9.2/build.i586-deby-linux.i586-deby-linux/i586-deby-linux/libstdc++-v3/src'
> | Makefile:585: recipe for target 'all-recursive' failed | make[2]:
> [all-recursive] Error 1 | make[2]: Leaving directory
> '/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/gcc-4.9.2/build.i586-deby-linux.i586-deby-linux/i586-deby-linux/libstdc++-v3/src'
> | Makefile:485: recipe for target 'all-recursive' failed | make[1]:
> [all-recursive] Error 1 | make[1]: Leaving directory
> '/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/gcc-4.9.2/build.i586-deby-linux.i586-deby-linux/i586-deby-linux/libstdc++-v3'
> | Makefile:391: recipe for target 'all' failed | make: * [all] Error 2 |
> ERROR: Function failed: do_compile (log file is located at
> /media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/temp/log.do_compile.18839)
>
> ERROR: Task
> (/media/pavan/WD03/poky/meta-debian/recipes-debian/gcc/gcc-runtime_debian.bb:do_compile)
> failed with exit code '1'
>
> NOTE: Tasks Summary: Attempted 1086 tasks of which 1070 didn't need to be
> rerun and 1 failed.
>
> Summary: 1 task failed:
> /media/pavan/WD03/poky/meta-debian/recipes-debian/gcc/gcc-runtime_debian.bb:do_compile
> Summary: There was 1 WARNING message shown. Summary: There were 2 ERROR
> messages shown, returning a non-zero exit code.
>
> I'm not able to solve this error. Please help me understand what is the
> actual problem that is causing this error and what are the possible
> solutions..
>
> thank you.
>
>
Again: Here is not the place to ask for meta-debian issues.

Andreas

