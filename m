Return-Path: <alistair23@gmail.com>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8452E75382
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 17:17:43 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id i83-v6so14270278lfh.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2018 10:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+5ghctxjNXnFu/qXA6hUCK5+uuPFW7PdRiE9CTV8pqc=;
	b=jgjAy4NnH8D7Jqci1jxCqgghKgb3Yeja48uydtkxclvtgJTM0hSUVAbrE+dxp3uki2
	US5dvCnHEPmPQA3uitZUMFP+f+L7NyXRBApjjbQNMM3Nhop6wqDiFbId+WgxGgig0PkM
	pDYXPJuutB7/16rFC+VCTPlhV/t8pH7m41GwLcblOKiNvaD2pK4IryE+ULaY9qC1ueGX
	PcqGO9KT+Za+3vrRVIanFifcS5zdxWJROurYF5byK1qXphPOjeqG4ma/FRy8jHHkzEXQ
	ANlY43Tk5Pi7tdaSHv3/qVm73p41ztDmh3liOqwmc5RoLSFLE08bnxpjPgo8Y8401JMx
	o8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+5ghctxjNXnFu/qXA6hUCK5+uuPFW7PdRiE9CTV8pqc=;
	b=cf4du5czDnBUlGQsKh3Bl/sN61oVUTUuiV7bD6KFqvNnR73S91LXjkNa5RCC4h9nZj
	kR1cvOqHBxs02eQXxNCvb1u2iUMSPKW90Rn4pYban1OLXKjVei998FtpTJf9nfvOgiZl
	7EOhAOyF1i4Ldap163Wi//CsZP0GonauWlOnxNhI366tcwYTi7bPYPaQBU5bMAUDzfzg
	CpTn0qSwnTCOISuXbQXZsevnV7VoPylgIDc7xN7LGYVCyX785uh5khe2pwbc7yXmgIVt
	1a7PA5x0/iBoraE14Qz1znAE0kxpWycXxqyHtCYtb8I0K9ObybHUVARKkD06GJfp0QzI
	tGmg==
X-Gm-Message-State: ALKqPwePFkRjhVtzHbAx6R9EF3Qnwt5+goVjPveN/RlPghJGecbRKNI2
	UEXbEvf/MasvHIR7g0dyfcT0eWpOejgTs7woVoY=
X-Google-Smtp-Source: ADUXVKL99AfRL8xE6hUA3gV6P6zrEb6t7ueCKrKu5Ya5dG99cdMjrkKkpKmY9OLS2clQDX13XjS45Zrm9UUUkEx+j/0=
X-Received: by 2002:a19:b2c2:: with SMTP id
	t63-v6mr14005507lfk.27.1528132663805; 
	Mon, 04 Jun 2018 10:17:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:98c6:0:0:0:0:0 with HTTP;
	Mon, 4 Jun 2018 10:17:13 -0700 (PDT)
In-Reply-To: <CAJTo0Laocxug2iUZjAD8bLqDN4ho7GPO=_c2ZOQQmvSErOXyyQ@mail.gmail.com>
References: <20180601221436.27162-1-alistair.francis@wdc.com>
	<20180601221436.27162-2-alistair.francis@wdc.com>
	<CAJTo0Laocxug2iUZjAD8bLqDN4ho7GPO=_c2ZOQQmvSErOXyyQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 4 Jun 2018 10:17:13 -0700
Message-ID: <CAKmqyKN=5JzrFhK0aLvzuxHJFO4PmK_Km2JnynrqKjfovQAokw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] [meta] atk: Specify gettext-native dependency
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
X-List-Received-Date: Mon, 04 Jun 2018 17:17:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 4, 2018 at 3:06 AM, Burton, Ross <ross.burton@intel.com> wrote:
> So why isn't the inherit gettext sufficient?

I'm not sure. Here is the error I see when compiling for RISC-V before
this patch:

ERROR: atk-2.28.1-r0 do_configure: meson failed
ERROR: atk-2.28.1-r0 do_configure: Function failed: do_configure (log
file is located at
/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/temp/log.do_configure.206408)
ERROR: Logfile of failure stored in:
/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/temp/log.do_configure.206408
Log data follows:
| DEBUG: Executing shell function do_configure
| The Meson build system
| Version: 0.46.1
| Source dir: /scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/atk-2.28.1
| Build dir: /scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/build
| Build type: cross build
| Project name: atk
| Native C compiler: gcc (gcc 7.3.0 "gcc (Ubuntu 7.3.0-16ubuntu3) 7.3.0")
| Appending CFLAGS from environment: ' -O2 -pipe -g
-feliminate-unused-debug-types
-fdebug-prefix-map=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0=/usr/src/debug/atk/2.28.1-r0
-fdebug-prefix-map=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/recipe-sysroot=
-fdebug-prefix-map=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/recipe-sysroot-native=
'
| Appending LDFLAGS from environment: '-Wl,-O1 -Wl,--hash-style=gnu
-Wl,--as-needed'
| Cross C compiler: riscv64-oe-linux-gcc
--sysroot=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/recipe-sysroot
(gcc 7.3.0)
| Host machine cpu family: riscv64
| Host machine cpu: riscv64
| Target machine cpu family: riscv64
| Target machine cpu: riscv64
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Compiler for C supports arguments -fvisibility=hidden: YES
| WARNING: -Wl,-Bsymbolic looks like a linker argument, but
has_argument and other similar methods only support checking compiler
arguments. Using them to check linker arguments are never supported,
and results are likely to be wrong regardless of the compiler you are
using. has_link_argument or other similar method can be used instead.
| Compiler for C supports arguments -Wl,-Bsymbolic: YES
| WARNING: -Wl,-z,relro looks like a linker argument, but has_argument
and other similar methods only support checking compiler arguments.
Using them to check linker arguments are never supported, and results
are likely to be wrong regardless of the compiler you are using.
has_link_argument or other similar method can be used instead.
| Compiler for C supports arguments -Wl,-z,relro: YES
| WARNING: -Wl,-z,now looks like a linker argument, but has_argument
and other similar methods only support checking compiler arguments.
Using them to check linker arguments are never supported, and results
are likely to be wrong regardless of the compiler you are using.
has_link_argument or other similar method can be used instead.
| Compiler for C supports arguments -Wl,-z,now: YES
| Checking for function "bind_textdomain_codeset": YES
| Cross dependency gobject-2.0 found: YES 2.56.1
| Configuring atk.pc using configuration
| Configuring config.h using configuration
| Configuring atkversion.h using configuration
| Native dependency glib-2.0 found: YES 2.56.1
| Native dependency gobject-introspection-1.0 found: YES 1.56.1
|
| po/meson.build:3:5: ERROR:  Can not do gettext because xgettext is
not installed.
|
| A full log can be found at
/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/build/meson-logs/meson-log.txt
| Build started at 2018-06-04T17:13:59.406076
| Main binary: /scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/recipe-sysroot-native/usr/bin/python3-native/python3
| Python system: Linux
| The Meson build system
| Version: 0.46.1
| Source dir: /scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/atk-2.28.1
| Build dir: /scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/build
| Build type: cross build
| Project name: atk
| Sanity testing C compiler: gcc
| Is cross compiler: False.
| Sanity check compiler command line: gcc
/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/build/meson-private/sanitycheckc.c
-o /scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/build/meson-private/sanitycheckc.exe
| Sanity check compile stdout:
|
| -----
| Sanity check compile stderr:
|
| -----
| Running test binary command:
/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/build/meson-private/sanitycheckc.exe
| Sanity testing C compiler: riscv64-oe-linux-gcc
--sysroot=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/recipe-sysroot
| Is cross compiler: True.
| Sanity check compiler command line: riscv64-oe-linux-gcc
--sysroot=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/recipe-sysroot
--sysroot=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/recipe-sysroot
-O2 -pipe -g -feliminate-unused-debug-types
-fdebug-prefix-map=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0=/usr/src/debug/atk/2.28.1-r0
-fdebug-prefix-map=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/recipe-sysroot=
-fdebug-prefix-map=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/recipe-sysroot-native=
-c /scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/build/meson-private/sanitycheckc.c
-o /scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/build/meson-private/sanitycheckc_cross.exe
| Sanity check compile stdout:
|
| -----
| Sanity check compile stderr:
|
| -----
| Native C compiler: gcc (gcc 7.3.0 "gcc (Ubuntu 7.3.0-16ubuntu3) 7.3.0")
| Appending CFLAGS from environment: ' -O2 -pipe -g
-feliminate-unused-debug-types
-fdebug-prefix-map=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0=/usr/src/debug/atk/2.28.1-r0
-fdebug-prefix-map=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/recipe-sysroot=
-fdebug-prefix-map=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/recipe-sysroot-native=
'
| Appending LDFLAGS from environment: '-Wl,-O1 -Wl,--hash-style=gnu
-Wl,--as-needed'
| Cross C compiler: riscv64-oe-linux-gcc
--sysroot=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/recipe-sysroot
(gcc 7.3.0)
| Host machine cpu family: riscv64
| Host machine cpu: riscv64
| Target machine cpu family: riscv64
| Target machine cpu: riscv64
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Running compile:
| Working directory:  /tmp/tmp2xeyif9n
| Command line:  riscv64-oe-linux-gcc
--sysroot=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/recipe-sysroot
/tmp/tmp2xeyif9n/testfile.c -pipe -D_FILE_OFFSET_BITS=64 -c -o
/tmp/tmp2xeyif9n/output.obj
--sysroot=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/recipe-sysroot
-O2 -g -feliminate-unused-debug-types
-fdebug-prefix-map=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0=/usr/src/debug/atk/2.28.1-r0
-fdebug-prefix-map=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/recipe-sysroot=
-fdebug-prefix-map=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/recipe-sysroot-native=
-O0 -fvisibility=hidden
|
| Code:
|  int i;
|
| Compiler stdout:
|
| Compiler stderr:
|
| Compiler for C supports arguments -fvisibility=hidden: YES
| WARNING: -Wl,-Bsymbolic looks like a linker argument, but
has_argument and other similar methods only support checking compiler
arguments. Using them to check linker arguments are never supported,
and results are likely to be wrong regardless of the compiler you are
using. has_link_argument or other similar method can be used instead.
| Running compile:
| Working directory:  /tmp/tmpegyr805m
| Command line:  riscv64-oe-linux-gcc
--sysroot=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/recipe-sysroot
/tmp/tmpegyr805m/testfile.c -pipe -D_FILE_OFFSET_BITS=64 -c -o
/tmp/tmpegyr805m/output.obj
--sysroot=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/recipe-sysroot
-O2 -g -feliminate-unused-debug-types
-fdebug-prefix-map=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0=/usr/src/debug/atk/2.28.1-r0
-fdebug-prefix-map=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/recipe-sysroot=
-fdebug-prefix-map=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/recipe-sysroot-native=
-O0 -Wl,-Bsymbolic
|
| Code:
|  int i;
|
| Compiler stdout:
|
| Compiler stderr:
|
| Compiler for C supports arguments -Wl,-Bsymbolic: YES
| WARNING: -Wl,-z,relro looks like a linker argument, but has_argument
and other similar methods only support checking compiler arguments.
Using them to check linker arguments are never supported, and results
are likely to be wrong regardless of the compiler you are using.
has_link_argument or other similar method can be used instead.
| Running compile:
| Working directory:  /tmp/tmpfywmkhvm
| Command line:  riscv64-oe-linux-gcc
--sysroot=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/recipe-sysroot
/tmp/tmpfywmkhvm/testfile.c -pipe -D_FILE_OFFSET_BITS=64 -c -o
/tmp/tmpfywmkhvm/output.obj
--sysroot=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/recipe-sysroot
-O2 -g -feliminate-unused-debug-types
-fdebug-prefix-map=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0=/usr/src/debug/atk/2.28.1-r0
-fdebug-prefix-map=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/recipe-sysroot=
-fdebug-prefix-map=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/recipe-sysroot-native=
-O0 -Wl,-z,relro
|
| Code:
|  int i;
|
| Compiler stdout:
|
| Compiler stderr:
|
| Compiler for C supports arguments -Wl,-z,relro: YES
| WARNING: -Wl,-z,now looks like a linker argument, but has_argument
and other similar methods only support checking compiler arguments.
Using them to check linker arguments are never supported, and results
are likely to be wrong regardless of the compiler you are using.
has_link_argument or other similar method can be used instead.
| Running compile:
| Working directory:  /tmp/tmpx2j_agle
| Command line:  riscv64-oe-linux-gcc
--sysroot=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/recipe-sysroot
/tmp/tmpx2j_agle/testfile.c -pipe -D_FILE_OFFSET_BITS=64 -c -o
/tmp/tmpx2j_agle/output.obj
--sysroot=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/recipe-sysroot
-O2 -g -feliminate-unused-debug-types
-fdebug-prefix-map=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0=/usr/src/debug/atk/2.28.1-r0
-fdebug-prefix-map=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/recipe-sysroot=
-fdebug-prefix-map=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/recipe-sysroot-native=
-O0 -Wl,-z,now
|
| Code:
|  int i;
|
| Compiler stdout:
|
| Compiler stderr:
|
| Compiler for C supports arguments -Wl,-z,now: YES
| Running compile:
| Working directory:  /tmp/tmph8r3gbyu
| Command line:  riscv64-oe-linux-gcc
--sysroot=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/recipe-sysroot
/tmp/tmph8r3gbyu/testfile.c -pipe -D_FILE_OFFSET_BITS=64 -o
/tmp/tmph8r3gbyu/output.exe
--sysroot=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/recipe-sysroot
-O2 -g -feliminate-unused-debug-types
-fdebug-prefix-map=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0=/usr/src/debug/atk/2.28.1-r0
-fdebug-prefix-map=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/recipe-sysroot=
-fdebug-prefix-map=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/recipe-sysroot-native=
--sysroot=/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/recipe-sysroot
-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -O0 -std=c99
|
| Code:
|
|         #define bind_textdomain_codeset
meson_disable_define_of_bind_textdomain_codeset
|
|         #include <limits.h>
|         #undef bind_textdomain_codeset
|
|         #ifdef __cplusplus
|         extern "C"
|         #endif
|         char bind_textdomain_codeset ();
|
|         #if defined __stub_bind_textdomain_codeset || defined
__stub___bind_textdomain_codeset
|         fail fail fail this function is not going to work
|         #endif
|
|         int main () {
|           return bind_textdomain_codeset ();
|         }
| Compiler stdout:
|
| Compiler stderr:
|
| Checking for function "bind_textdomain_codeset": YES
| Determining dependency 'gobject-2.0' with pkg-config executable
'/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/recipe-sysroot-native/usr/bin/pkg-config'
| Cross dependency gobject-2.0 found: YES 2.56.1
| Configuring atk.pc using configuration
| Configuring config.h using configuration
| Configuring atkversion.h using configuration
| Determining dependency 'glib-2.0' with pkg-config executable
'/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/recipe-sysroot-native/usr/bin/pkg-config'
| Native dependency glib-2.0 found: YES 2.56.1
| Determining dependency 'gobject-introspection-1.0' with pkg-config
executable '/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/recipe-sysroot-native/usr/bin/pkg-config'
| Native dependency gobject-introspection-1.0 found: YES 1.56.1
| Got pkgconfig variable g_ir_scanner : /usr/bin/g-ir-scanner-wrapper
| Got pkgconfig variable g_ir_compiler : /usr/bin/g-ir-compiler-wrapper
| Got pkgconfig variable girdir :
| Got pkgconfig variable girdir :
| Adding test "testdocument".
| Adding test "testrole".
| Adding test "testrelation".
| Adding test "teststateset".
| Adding test "testvalue".
|
| po/meson.build:3:5: ERROR:  Can not do gettext because xgettext is
not installed.
| ERROR: meson failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at
/scratch/alistair/yocto/oe-master/build/tmp-glibc/work/riscv64-oe-linux/atk/2.28.1-r0/temp/log.do_configure.206408)
ERROR: Task (/scratch/alistair/yocto/oe-master/meta/recipes-support/atk/atk_2.28.1.bb:do_configure)
failed with exit code '1'


Alistair

>
> Ross
>
> On 1 June 2018 at 23:14, Alistair Francis <alistair.francis@wdc.com> wrote:
>> atk requires xgettext to compile, specify it as a dependency.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>  meta/recipes-support/atk/atk_2.28.1.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-support/atk/atk_2.28.1.bb b/meta/recipes-support/atk/atk_2.28.1.bb
>> index 657c69d576..1198005804 100644
>> --- a/meta/recipes-support/atk/atk_2.28.1.bb
>> +++ b/meta/recipes-support/atk/atk_2.28.1.bb
>> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
>>                      file://atk/atkutil.c;endline=18;md5=6fd31cd2fdc9b30f619ca8d819bc12d3 \
>>                      file://atk/atk.h;endline=18;md5=fcd7710187e0eae485e356c30d1b0c3b"
>>
>> -DEPENDS = "glib-2.0"
>> +DEPENDS = "glib-2.0 gettext-native"
>>
>>  GNOMEBASEBUILDCLASS = "meson"
>>  inherit gnomebase gtk-doc gettext upstream-version-is-even gobject-introspection
>> --
>> 2.17.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

