Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-ua0-f169.google.com (mail-ua0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2FB1E78526
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 04:49:29 +0000 (UTC)
Received: by mail-ua0-f169.google.com with SMTP id m47so2927562uae.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 21:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=4N9Mr4mBKzjYhkn9ISHEE8Z07BMSWY4FW8NSEUfppTQ=;
	b=pTNis120Qsc/av6OdIRyzxQdQgUgg1G/TFcjwUCEVqJBJFG39pyXjHUmQr1VQEhbE/
	Ls1CGoDsSZS7tACFZnGEwk2Bp3JnhTWwkhr0QRaVXG8iT3dGoHYw6TxRTALn5lgpWhac
	sA3QqKKBPxTP6mvCcInRyhvDLNTq3TklM1Q5ULEbk5J+i68M8+RcfhkaL6E1fyOoPwUi
	sElSBXy+/6KHw5BFiDWzq8zDsdedX68vtlCcX/jw1Z92CCH303cXcRCgVR6hPvWGA85S
	lEVAawt6rRdZnHU+2R67l0GSI1Ub6GUuC5Q7yteq8MbeAhzM63P37jYaWd1oZbtWOiwX
	Nlqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=4N9Mr4mBKzjYhkn9ISHEE8Z07BMSWY4FW8NSEUfppTQ=;
	b=HkFs3TetgSpFn9qjmk0AcqFb5OJaqDtFDDyE2F9jF2j9KycTLhAbcETlpQkk0MNJ2+
	u99C2BhHtVgg13fiI582jI2qbXKqf70RiNMqpCmXhOX+4rnHcAaB+LDmMipfM7lS0VJf
	X1Zkpnyz6wI5/uW6gQpyfCvgxzYfUdsKO8ZQL8Cudh29JTAfGy2wcb47p8H7KY2XyChn
	AWg0hOaHnA8crM0q0LkOffV6xt2OWAt0VJrIJi1GHF7Ui+YKJtDapcRtRMes5IZPI5MK
	V3LImEsWtTfBDrwhyoJm1dSYAUC4gk4d9ZsswKKlZBWEkCtXGEk47oS756Hv9iZnqHYJ
	FVzA==
X-Gm-Message-State: AElRT7GukGS/dsBko9LzH1bFoOiGvXndpRRqW0kfGrydLhZ3wFtbF+iB
	HnAX4dPrURRPEx2oAFbRcsWHJv5hXqCkzE4MC/p/Hw==
X-Google-Smtp-Source: AIpwx4820eJ8uxrkiEXODPbm9sndVK1zxDNXqQ8N0otDmdatK8moCb6vDyjCbS3ch5o3k5Zs4bEZWE6INlMtqBajAxE=
X-Received: by 10.159.47.2 with SMTP id x2mr4401811uaj.23.1522298970459; Wed,
	28 Mar 2018 21:49:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.219.149 with HTTP; Wed, 28 Mar 2018 21:49:30 -0700 (PDT)
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Thu, 29 Mar 2018 10:19:30 +0530
Message-ID: <CAPGMVzHCs9j9=UJJwKp6zM_G6_4MYNs=oLk3QjAay7ut0ETrxw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: [meta-debian] build error
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
X-List-Received-Date: Thu, 29 Mar 2018 04:49:30 -0000
Content-Type: multipart/alternative; boundary="089e08253a746053f4056885d90c"

--089e08253a746053f4056885d90c
Content-Type: text/plain; charset="UTF-8"

 0 down vote favorite
<https://stackoverflow.com/questions/49541571/error-building-meta-debian-in-yocto#>

I followed the instruction provided by meta-debian github page:
https://github.com/meta-debian/meta-debian

During the build process I faced errors while bitbake was do-compiling some
of the recipes.. they are *e2fsprogs, busybox, gettext* etc..

I searched the respective layers i.e, *meta* and *meta-debian* and found
out that this recipes were present in both the layers.

I removed *e2fsprogs* from *meta* layer and *busybox, gettext* from
*meta-debian* and bitbaked again, this removed the errors which was showing
previously during bitbake. I did this because same recipes was present in
the both the layers.

now the build is completed up to 90% but I'm stuck at *gcc-runtime-4.9.2-r0*
do_compile error.

I tried hard but I'm not able to solve this error.

The entire terminal output is as shown below.

*ERROR: gcc-runtime-4.9.2-r0 do_compile: oe_runmake failed*

*ERROR: gcc-runtime-4.9.2-r0 do_compile: Function failed: do_compile (log
file is located at
/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/temp/log.do_compile.18839)*

*ERROR: Logfile of failure stored in:
/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/temp/log.do_compile.18839*

Log data follows: | DEBUG: SITE files ['endian-little', 'bit-32',
'ix86-common', 'common-linux', 'common-glibc', 'i586-linux', 'common'] |
DEBUG: Executing shell function do_compile | NOTE: make -j 4
ARCH_FLAGS_FOR_TARGET= -m32 -march=i586
-isystem/media/pavan/WD03/build/tmp/sysroots/qemux86/usr/include
MULTIBUILDTOP=/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/gcc-4.9.2/build.i586-deby-linux.i586-deby-linux/i586-deby-linux/libgcc/
| # If this is the top-level multilib, build all the other | DEFINES=''
HEADERS='/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/git/src/libgcc/config/i386/value-unwind.h'
\ |
/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/git/src/libgcc/mkheader.sh
> tmp-libgcc_tm.h | # multilibs. | /bin/bash
/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/git/src/libgcc/../move-if-change
tmp-libgcc_tm.h libgcc_tm.h | i586-deby-linux-gcc -m32 -march=i586
--sysroot=/media/pavan/WD03/build/tmp/sysroots/qemux86 -O2 -pipe -g
-feliminate-unused-debug-types
-fdebug-prefix-map=/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0=/usr/src/debug/gcc-runtime/4.9.2-r0
-fdebug-prefix-map=/media/pavan/WD03/build/tmp/sysroots/x86_64-linux=
-fdebug-prefix-map=/media/pavan/WD03/build/tmp/sysroots/qemux86= -O2 -g -Os
-DIN_GCC -DCROSS_DIRECTORY_STRUCTURE -W -Wall -Wno-narrowing
-Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes
-Wold-style-definition -isystem ./include -fpic -mlong-double-80 -g
-DIN_LIBGCC2 -fbuilding-libgcc -fno-stack-protector -fpic -mlong-double-80
-I. -I.
-I/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/gcc-4.9.2/build.i586-deby-linux.i586-deby-linux/i586-deby-linux/libgcc/../.././gcc
-I/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/git/src/libgcc
-I/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/git/src/libgcc/.
-I/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/git/src/libgcc/../gcc
-I/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/git/src/libgcc/../include
-I/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/git/src/libgcc/config/libbid
-DENABLE_DECIMAL_BID_FORMAT -DHAVE_CC_TLS -DUSE_TLS -o morestack_s.o -MT
morestack_s.o -MD -MP -MF morestack_s.dep -DSHARED -c -xassembler-with-cpp
/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/git/src/libgcc/config/i386/morestack.S
| sed -e 's/*PFX*/*/g' \ | -e 's/__FIXPTPFX*/__/g' <
/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/git/src/libgcc/
libgcc-std.ver.in > libgcc-std.ver PIC -DPIC -fno-implicit-templates -Wall
-Wextra -Wwrite-strings -Wcast-qual -Wabi -fdiagnostics-show-location=once
-ffunction-sections -fdata-sections -frandom-seed=compatibility-condvar.lo
-O2 -pipe -g -feliminate-unused-debug-types
-fdebug-prefix-map=/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0=/usr/src/debug/gcc-runtime/4.9.2-r0
-fdebug-prefix-map=/media/pavan/WD03/build/tmp/sysroots/x86_64-linux=
-fdebug-prefix-map=/media/pavan/WD03/build/tmp/sysroots/qemux86=
-std=gnu++11 -c
/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/git/src/libstdc++-v3/src/c++11/compatibility-condvar.cc
-o compatibility-condvar.o >/dev/null 2>&1 | /bin/bash ../libtool --tag CXX
--mode=link i586-deby-linux-g++ -m32 -march=i586
--sysroot=/media/pavan/WD03/build/tmp/sysroots/qemux86 -nostdinc++
-nostdlib++ -Wl,-O1 -Wl,-z,relro -Wl,--gc-sections -fPIC -DPIC
-fno-implicit-templates -Wall -Wextra -Wwrite-strings -Wcast-qual -Wabi
-fdiagnostics-show-location=once -ffunction-sections -fdata-sections
-frandom-seed=libstdc++.la '-Wl,-O1' '-Wl,--hash-style=gnu' -o libstdc++.la
-version-info 6:20:0 -Wl,--version-script=libstdc++-symbols.ver -lm -rpath
/usr/lib compatibility.lo compatibility-debug_list.lo
compatibility-debug_list-2.lo compatibility-c++0x.lo
compatibility-atomic-c++0x.lo compatibility-thread-c++0x.lo
compatibility-chrono.lo compatibility-condvar.lo ../libsupc++/libsupc++
convenience.la ../src/c++98/libc++98convenience.la ../src/c++11/libc++
11convenience.la | libtool: link: i586-deby-linux-g++ -m32 -march=i586
--sysroot=/media/pavan/WD03/build/tmp/sysroots/qemux86 -nostdinc++
-nostdlib++ -shared -nostdlib
/media/pavan/WD03/build/tmp/sysroots/qemux86/usr/lib/crti.o
/media/pavan/WD03/build/tmp/sysroots/qemux86/usr/lib/i586-deby-linux/4.9/crtbeginS.o
.libs/compatibility.o .libs/compatibility-debug_list.o
.libs/compatibility-debug_list-2.o .libs/compatibility-c++0x.o
.libs/compatibility-atomic-c++0x.o .libs/compatibility-thread-c++0x.o
.libs/compatibility-chrono.o .libs/compatibility-condvar.o
-Wl,--whole-archive ../libsupc++/.libs/libsupc++convenience.a
../src/c++98/.libs/libc++98convenience.a
../src/c++11/.libs/libc++11convenience.a -Wl,--no-whole-archive -lm
-L/media/pavan/WD03/build/tmp/sysroots/x86_64-linux/usr/lib/i586-deby-linux/gcc/i586-deby-linux/4.9
-L/media/pavan/WD03/build/tmp/sysroots/qemux86/lib
-L/media/pavan/WD03/build/tmp/sysroots/qemux86/usr/lib/i586-deby-linux/4.9
-L/media/pavan/WD03/build/tmp/sysroots/qemux86/usr/lib -lc -lgcc_s
/media/pavan/WD03/build/tmp/sysroots/qemux86/usr/lib/i586-deby-linux/4.9/crtendS.o
/media/pavan/WD03/build/tmp/sysroots/qemux86/usr/lib/crtn.o -m32
-march=i586 -Wl,-O1 -Wl,-z -Wl,relro -Wl,--gc-sections -Wl,-O1
-Wl,--hash-style=gnu -Wl,--version-script=libstdc++-symbols.ver -Wl,-soname
-Wl,libstdc++.so.6 -o .libs/libstdc++.so.6.0.20 |
../src/c++11/.libs/libc++11convenience.a(system_error.o): In function
__static_initialization_and_destruction_0':
|
/usr/src/debug/gcc-runtime/4.9.2-r0/git/src/libstdc++-v3/src/c++11/system_error.cc:65:
undefined reference to__dso_handle' |
/media/pavan/WD03/build/tmp/sysroots/x86_64-linux/usr/libexec/i586-deby-linux/gcc/i586-deby-linux/4.9/ld:
../src/c++11/.libs/libc++11convenience.a(system_error.o): relocation
R_386_GOTOFF against undefined hidden symbol `__dso_handle' can not be used
when making a shared object |
/media/pavan/WD03/build/tmp/sysroots/x86_64-linux/usr/libexec/i586-deby-linux/gcc/i586-deby-linux/4.9/ld:
final link failed: Bad value | collect2: error: ld returned 1 exit status |
Makefile:555: recipe for target 'libstdc++.la' failed | make[3]: **
[libstdc++.la] Error 1 | make[3]: Leaving directory
'/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/gcc-4.9.2/build.i586-deby-linux.i586-deby-linux/i586-deby-linux/libstdc++-v3/src'
| Makefile:585: recipe for target 'all-recursive' failed | make[2]: **
[all-recursive] Error 1 | make[2]: Leaving directory
'/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/gcc-4.9.2/build.i586-deby-linux.i586-deby-linux/i586-deby-linux/libstdc++-v3/src'
| Makefile:485: recipe for target 'all-recursive' failed | make[1]: **
[all-recursive] Error 1 | make[1]: Leaving directory
'/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/gcc-4.9.2/build.i586-deby-linux.i586-deby-linux/i586-deby-linux/libstdc++-v3'
| Makefile:391: recipe for target 'all' failed | make: ** [all] Error 2 |
ERROR: Function failed: do_compile (log file is located at
/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/temp/log.do_compile.18839)

*ERROR: Task
(/media/pavan/WD03/poky/meta-debian/recipes-debian/gcc/gcc-runtime_debian.bb:do_compile)
failed with exit code '1'*

NOTE: Tasks Summary: Attempted 1086 tasks of which 1070 didn't need to be
rerun and 1 failed.

Summary: 1 task failed:
/media/pavan/WD03/poky/meta-debian/recipes-debian/gcc/gcc-runtime_debian.bb:do_compile
Summary: There was 1 WARNING message shown. Summary: There were 2 ERROR
messages shown, returning a non-zero exit code.

I'm not able to solve this error. Please help me understand what is the
actual problem that is causing this error and what are the possible
solutions..

thank you.

--089e08253a746053f4056885d90c
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div class="gmail-votecell gmail-post-layout--left"><div class="gmail-vote"><a class="gmail-vote-up-off" title="This question shows research effort; it is useful and clear"></a>
        <span class="gmail-vote-count-post">0</span>
        <a class="gmail-vote-down-off" title="This question does not show any research effort; it is unclear or not useful">down vote</a>

        <a class="gmail-star-off" href="https://stackoverflow.com/questions/49541571/error-building-meta-debian-in-yocto#" title="Click to mark as favorite question (click again to undo)">favorite</a>
        <div class="gmail-favoritecount"><b></b></div>


</div>

            </div>

            
<div class="gmail-postcell gmail-post-layout--right">
    <div class="gmail-post-text">

<p>I followed the instruction provided by meta-debian github page:
<a href="https://github.com/meta-debian/meta-debian" rel="nofollow noreferrer">https://github.com/meta-debian/meta-debian</a></p>

<p>During the build process I faced errors while bitbake was do-compiling some of the recipes.. they are <strong>e2fsprogs, busybox, gettext</strong> etc..</p>

<p>I searched the respective layers i.e, <strong>meta</strong> and <strong>meta-debian</strong> and found out that this recipes were present in both the layers. </p>

<p>I removed <strong>e2fsprogs</strong> from <strong>meta</strong> layer and <strong>busybox, gettext</strong> from <strong>meta-debian</strong>
 and bitbaked again, this removed the errors which was showing 
previously during bitbake. I did this because same recipes was present 
in the both the layers. </p>

<p>now the build is completed up to 90% but I&#39;m stuck at <strong>gcc-runtime-4.9.2-r0</strong> do_compile error. </p>

<p>I tried hard but I&#39;m not able to solve this error. </p>

<p>The entire terminal output is as shown below.</p>

<p><strong>ERROR: gcc-runtime-4.9.2-r0 do_compile: oe_runmake failed</strong></p>

<p><strong>ERROR: gcc-runtime-4.9.2-r0 do_compile: Function failed: 
do_compile (log file is located at 
/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/temp/log.do_compile.18839)</strong></p>

<p><strong>ERROR: Logfile of failure stored in: 
/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/temp/log.do_compile.18839</strong></p>

<p>Log data follows:
| DEBUG: SITE files [&#39;endian-little&#39;, &#39;bit-32&#39;, &#39;ix86-common&#39;, 
&#39;common-linux&#39;, &#39;common-glibc&#39;, &#39;i586-linux&#39;, &#39;common&#39;]
| DEBUG: Executing shell function do_compile
| NOTE: make -j 4 ARCH_FLAGS_FOR_TARGET= -m32 -march=i586 
-isystem/media/pavan/WD03/build/tmp/sysroots/qemux86/usr/include 
MULTIBUILDTOP=/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/gcc-4.9.2/build.i586-deby-linux.i586-deby-linux/i586-deby-linux/libgcc/
| # If this is the top-level multilib, build all the other
| DEFINES=&#39;&#39; 
HEADERS=&#39;/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/git/src/libgcc/config/i386/value-unwind.h&#39;
 \
|   
/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/git/src/libgcc/mkheader.sh
 &gt; tmp-libgcc_tm.h
| # multilibs.
| /bin/bash 
/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/git/src/libgcc/../move-if-change
 tmp-libgcc_tm.h libgcc_tm.h
| i586-deby-linux-gcc  -m32 -march=i586 
--sysroot=/media/pavan/WD03/build/tmp/sysroots/qemux86 -O2 -pipe -g 
-feliminate-unused-debug-types 
-fdebug-prefix-map=/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0=/usr/src/debug/gcc-runtime/4.9.2-r0
 -fdebug-prefix-map=/media/pavan/WD03/build/tmp/sysroots/x86_64-linux= 
-fdebug-prefix-map=/media/pavan/WD03/build/tmp/sysroots/qemux86= -O2  -g
 -Os -DIN_GCC  -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing 
-Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes 
-Wold-style-definition  -isystem ./include   -fpic -mlong-double-80 -g 
-DIN_LIBGCC2 -fbuilding-libgcc -fno-stack-protector   -fpic 
-mlong-double-80 -I. -I. 
-I/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/gcc-4.9.2/build.i586-deby-linux.i586-deby-linux/i586-deby-linux/libgcc/../.././gcc
 
-I/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/git/src/libgcc
 
-I/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/git/src/libgcc/.
 
-I/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/git/src/libgcc/../gcc
 
-I/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/git/src/libgcc/../include
 
-I/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/git/src/libgcc/config/libbid
 -DENABLE_DECIMAL_BID_FORMAT -DHAVE_CC_TLS  -DUSE_TLS -o morestack_s.o 
-MT morestack_s.o -MD -MP -MF morestack_s.dep -DSHARED -c 
-xassembler-with-cpp 
/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/git/src/libgcc/config/i386/morestack.S
| sed -e &#39;s/<strong>PFX</strong>/<strong>/g&#39; \
|     -e &#39;s/__FIXPTPFX</strong>/__/g&#39; &lt; 
/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/git/src/libgcc/<a href="http://libgcc-std.ver.in">libgcc-std.ver.in</a>
 &gt; libgcc-std.ver
PIC -DPIC -fno-implicit-templates -Wall -Wextra -Wwrite-strings 
-Wcast-qual -Wabi -fdiagnostics-show-location=once -ffunction-sections 
-fdata-sections -frandom-seed=compatibility-condvar.lo -O2 -pipe -g 
-feliminate-unused-debug-types 
-fdebug-prefix-map=/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0=/usr/src/debug/gcc-runtime/4.9.2-r0
 -fdebug-prefix-map=/media/pavan/WD03/build/tmp/sysroots/x86_64-linux= 
-fdebug-prefix-map=/media/pavan/WD03/build/tmp/sysroots/qemux86= 
-std=gnu++11 -c 
/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/git/src/libstdc++-v3/src/c++11/compatibility-condvar.cc
 -o compatibility-condvar.o &gt;/dev/null 2&gt;&amp;1
| /bin/bash ../libtool --tag CXX   --mode=link i586-deby-linux-g++  -m32
 -march=i586 --sysroot=/media/pavan/WD03/build/tmp/sysroots/qemux86 
-nostdinc++ -nostdlib++  -Wl,-O1 -Wl,-z,relro -Wl,--gc-sections  -fPIC 
-DPIC -fno-implicit-templates  -Wall -Wextra -Wwrite-strings -Wcast-qual
 -Wabi  -fdiagnostics-show-location=once   -ffunction-sections 
-fdata-sections  -frandom-seed=libstdc++.la  &#39;-Wl,-O1&#39; 
&#39;-Wl,--hash-style=gnu&#39; -o libstdc++.la -version-info 6:20:0 
-Wl,--version-script=libstdc++-symbols.ver -lm -rpath /usr/lib 
compatibility.lo compatibility-debug_list.lo 
compatibility-debug_list-2.lo  compatibility-c++0x.lo 
compatibility-atomic-c++0x.lo compatibility-thread-c++0x.lo 
compatibility-chrono.lo compatibility-condvar.lo  
../libsupc++/libsupc++<a href="http://convenience.la">convenience.la</a> ../src/c++98/libc++<a href="http://98convenience.la">98convenience.la</a>
 ../src/c++11/libc++<a href="http://11convenience.la">11convenience.la</a>
| libtool: link: i586-deby-linux-g++  -m32 -march=i586 
--sysroot=/media/pavan/WD03/build/tmp/sysroots/qemux86 -nostdinc++ 
-nostdlib++ -shared -nostdlib 
/media/pavan/WD03/build/tmp/sysroots/qemux86/usr/lib/crti.o 
/media/pavan/WD03/build/tmp/sysroots/qemux86/usr/lib/i586-deby-linux/4.9/crtbeginS.o
  .libs/compatibility.o .libs/compatibility-debug_list.o 
.libs/compatibility-debug_list-2.o .libs/compatibility-c++0x.o 
.libs/compatibility-atomic-c++0x.o .libs/compatibility-thread-c++0x.o 
.libs/compatibility-chrono.o .libs/compatibility-condvar.o  
-Wl,--whole-archive ../libsupc++/.libs/libsupc++convenience.a 
../src/c++98/.libs/libc++98convenience.a 
../src/c++11/.libs/libc++11convenience.a -Wl,--no-whole-archive  -lm 
-L/media/pavan/WD03/build/tmp/sysroots/x86_64-linux/usr/lib/i586-deby-linux/gcc/i586-deby-linux/4.9
 -L/media/pavan/WD03/build/tmp/sysroots/qemux86/lib 
-L/media/pavan/WD03/build/tmp/sysroots/qemux86/usr/lib/i586-deby-linux/4.9
 -L/media/pavan/WD03/build/tmp/sysroots/qemux86/usr/lib -lc -lgcc_s 
/media/pavan/WD03/build/tmp/sysroots/qemux86/usr/lib/i586-deby-linux/4.9/crtendS.o
 /media/pavan/WD03/build/tmp/sysroots/qemux86/usr/lib/crtn.o  -m32 
-march=i586 -Wl,-O1 -Wl,-z -Wl,relro -Wl,--gc-sections -Wl,-O1 
-Wl,--hash-style=gnu -Wl,--version-script=libstdc++-symbols.ver   
-Wl,-soname -Wl,libstdc++.so.6 -o .libs/libstdc++.so.6.0.20
| ../src/c++11/.libs/libc++11convenience.a(system_error.o): In function <code>__static_initialization_and_destruction_0&#39;:
| /usr/src/debug/gcc-runtime/4.9.2-r0/git/src/libstdc++-v3/src/c++11/system_error.cc:65: undefined reference to</code>__dso_handle&#39;
| 
/media/pavan/WD03/build/tmp/sysroots/x86_64-linux/usr/libexec/i586-deby-linux/gcc/i586-deby-linux/4.9/ld:
 ../src/c++11/.libs/libc++11convenience.a(system_error.o): relocation 
R_386_GOTOFF against undefined hidden symbol `__dso_handle&#39; can not be 
used when making a shared object
| 
/media/pavan/WD03/build/tmp/sysroots/x86_64-linux/usr/libexec/i586-deby-linux/gcc/i586-deby-linux/4.9/ld:
 final link failed: Bad value
| collect2: error: ld returned 1 exit status
| Makefile:555: recipe for target &#39;libstdc++.la&#39; failed
| make[3]: <strong>* [libstdc++.la] Error 1
| make[3]: Leaving directory 
&#39;/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/gcc-4.9.2/build.i586-deby-linux.i586-deby-linux/i586-deby-linux/libstdc++-v3/src&#39;
| Makefile:585: recipe for target &#39;all-recursive&#39; failed
| make[2]: <em></em></strong><em> [all-recursive] Error 1
| make[2]: Leaving directory 
&#39;/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/gcc-4.9.2/build.i586-deby-linux.i586-deby-linux/i586-deby-linux/libstdc++-v3/src&#39;
| Makefile:485: recipe for target &#39;all-recursive&#39; failed
| make[1]: <strong></strong></em><strong> [all-recursive] Error 1
| make[1]: Leaving directory 
&#39;/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/gcc-4.9.2/build.i586-deby-linux.i586-deby-linux/i586-deby-linux/libstdc++-v3&#39;
| Makefile:391: recipe for target &#39;all&#39; failed
| make: *</strong> [all] Error 2
| ERROR: Function failed: do_compile (log file is located at 
/media/pavan/WD03/build/tmp/work/i586-deby-linux/gcc-runtime/4.9.2-r0/temp/log.do_compile.18839)</p>

<p><strong>ERROR: Task (/media/pavan/WD03/poky/meta-debian/recipes-debian/gcc/gcc-runtime_debian.bb:do_compile) failed with exit code &#39;1&#39;</strong></p>

<p>NOTE: Tasks Summary: Attempted 1086 tasks of which 1070 didn&#39;t need to be rerun and 1 failed.</p>

<p>Summary: 1 task failed:
  /media/pavan/WD03/poky/meta-debian/recipes-debian/gcc/gcc-runtime_debian.bb:do_compile
Summary: There was 1 WARNING message shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.</p>

<p>I&#39;m not able to solve this error. Please help me understand what is 
the actual problem that is causing this error and what are the possible 
solutions.. </p>

<p>thank you.</p>
    </div></div></div>

--089e08253a746053f4056885d90c--
