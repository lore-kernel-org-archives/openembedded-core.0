Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.51637.1606224902562822676
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2020 05:35:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RWxtMunM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id s8so22297076wrw.10
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2020 05:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=BAjhM2lX/pjd+F3fqSHWbCU13jPIgnX5u3ujVcaqAy8=;
        b=RWxtMunM83BtnIV2UCORXyckIY/H2VPOpjoSsrqhmyFPhH8unKPV6XezJRbBjc9JBT
         ZYSgdVJzZ0IwgAa7HyodMcT9D7e9S/iP3j2P+OPpTHNi15tjBe9Y/rMSHhY0CpEboUHc
         ipYWXdlvddGooua4tok+bFv1WW/ZghLC//UXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=BAjhM2lX/pjd+F3fqSHWbCU13jPIgnX5u3ujVcaqAy8=;
        b=CUXVWsA44gh3T7bJcMoDewza3kPYQ4KMC7WgV3m0Pr9DLTsjU8o5tWeiDxMJvOLkoZ
         in2sHZTNMCyyxgYa0p58tcUvDDzrqAhx9Y0ZvinGI6rFplyy8kXExtEsUi2oaYYlUm/4
         5j46Tcurqs5mqsSQHjmgUY1QBhnkZJzVhNH9anV5b2rn9dwfxK21Cga0NSgRBmlLPcLq
         I8CFj46qsPUTqx/0N1qTv7VVMsd3wRSyAdjDDIj2g8nHZPp1LltEFpiVeiPDK8IGxTlt
         F5nX/y1s7PyYbc96eIVCMVnGOV9vzfDQBWHxWHAaKTXwRrTLCYD6B/QzyGSZVngdUNd7
         Rr+Q==
X-Gm-Message-State: AOAM530NXBMAIDS535GVSaoI6TMMAF9oBDpvbw8BWfFoBTj5ggpQ7IzV
	//6+/deaTq7tfH/ak9rqgmg6tg==
X-Google-Smtp-Source: ABdhPJwgIm6ufGma1MUUwsxc3GgDe4UPjPa7caF2Q7DMtIyknNwvreEQqeloDqFPSjhTI8Jxtxgxcw==
X-Received: by 2002:a5d:634d:: with SMTP id b13mr5348861wrw.310.1606224900764;
        Tue, 24 Nov 2020 05:35:00 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.3.1.2.4.d.e.0.6.7.2.2.d.6.0.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.3.1.2.4.d.e.0.6.7.2.2.d.6.0.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:906d:2276:ed4:2134])
        by smtp.gmail.com with ESMTPSA id v64sm5664379wme.25.2020.11.24.05.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 05:35:00 -0800 (PST)
Message-ID: <b3ec08a042f8b607fcd86044a233a41a9d713eee.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v2 1/2] bitbake.conf: Split optimization into common part
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Valek, Andrej" <andrej.valek@siemens.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "Bach, Pascal" <pascal.bach@siemens.com>, "Freihofer, Adrian"
	 <adrian.freihofer@siemens.com>
Date: Tue, 24 Nov 2020 13:34:59 +0000
In-Reply-To: <DB8PR10MB3977CFDFC71C9D64380189E192FB0@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
References: <20201122124853.30262-1-andrej.valek@siemens.com>
	 <20201123190029.13811-1-andrej.valek@siemens.com>
	 <96f00422db0f45f642f33828d7cb21e85db81ab6.camel@linuxfoundation.org>
	 <DB8PR10MB3977CFDFC71C9D64380189E192FB0@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-11-24 at 08:01 +0000, Valek, Andrej wrote:
> Hello Richard,
>=20
> Is it possible to provide log.do_configure log? I've tried it on
> qemux86-64 and it works without problems. Tests were based on poky-
> glibc-x86_64-core-image-sato-core2-64-qemux86-64-toolchain-ext-3.2.sh=20
> .
>=20
> DEBUG: Python function extend_recipe_sysroot finished
> DEBUG: Executing shell function do_configure
> -- The C compiler identification is GNU 10.2.0
> -- The CXX compiler identification is GNU 10.2.0
> ...
> -- Build files have been written to: /home/projects/yocto/qemux86-
> 64/tmp/work/core2-64-poky-linux/cmake/3.18.2-r0/build
> DEBUG: Shell function do_configure finished
> DEBUG: Executing python function do_qa_configure
> DEBUG: Python function do_qa_configure finished

You can see that on the autobuilder here:

https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/2718/step=
s/12/logs/stdio

i.e.:

ERROR: cmake-3.18.4-r0 do_configure: Execution of '/home/pokybuild/yocto-wo=
rker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/cmake/3.18.4-r0=
/temp/run.do_configure.25583' failed with exit code 1:
-- The C compiler identification is GNU 10.2.0
-- The CXX compiler identification is GNU 10.2.0
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /home/pokybuild/yocto-worker/qemux86-world=
/build/build/tmp/work/core2-64-poky-linux/cmake/3.18.4-r0/recipe-sysroot-na=
tive/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /home/pokybuild/yocto-worker/qemux86-wor=
ld/build/build/tmp/work/core2-64-poky-linux/cmake/3.18.4-r0/recipe-sysroot-=
native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Checking if compiler supports C11 _Thread_local
-- Checking if compiler supports C11 _Thread_local - yes
-- Checking if compiler supports needed C++17 constructs
-- Checking if compiler supports needed C++17 constructs - yes
-- Checking if compiler supports C++ make_unique
-- Checking if compiler supports C++ make_unique - no
-- Checking if compiler supports C++ unique_ptr
-- Checking if compiler supports C++ unique_ptr - no
CMake Error at CMakeLists.txt:107 (message):
  The C++ compiler does not support C++11 (e.g.  std::unique_ptr).
-- Configuring incomplete, errors occurred!
See also "/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/c=
ore2-64-poky-linux/cmake/3.18.4-r0/build/CMakeFiles/CMakeOutput.log".
See also "/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/c=
ore2-64-poky-linux/cmake/3.18.4-r0/build/CMakeFiles/CMakeError.log".
WARNING: exit code 1 from a shell command.
NOTE: recipe lib32-epiphany-3.38.1-r0: task do_configure: Succeeded
NOTE: Running task 15280 of 24981 (virtual:multilib:lib32:/home/pokybuild/y=
octo-worker/qemux86-world/build/meta/recipes-graphics/xorg-util/makedepend_=
1.0.6.bb:do_configure)
NOTE: recipe lib32-makedepend-1_1.0.6-r0: task do_configure: Started
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/qemux86-w=
orld/build/build/tmp/work/core2-64-poky-linux/cmake/3.18.4-r0/temp/log.do_c=
onfigure.25583
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/qemux86-worl=
d/build/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot', '/hom=
e/pokybuild/yocto-worker/qemux86-world/build/meta/recipes-extended/bzip2/bz=
ip2_1.0.8.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-wo=
rker/qemux86-world/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_popu=
late_sysroot', '/home/pokybuild/yocto-worker/qemux86-world/build/meta/recip=
es-extended/xz/xz_5.2.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-wor=
ker/qemux86-world/build/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populat=
e_sysroot', '/home/pokybuild/yocto-worker/qemux86-world/build/meta/recipes-=
devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot', 'virtual:native:/home/=
pokybuild/yocto-worker/qemux86-world/build/meta/recipes-devtools/pseudo/pse=
udo_git.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/qemux86-worl=
d/build/meta/recipes-extended/libarchive/libarchive_3.4.3.bb:do_populate_sy=
sroot', '/home/pokybuild/yocto-worker/qemux86-world/build/meta/recipes-core=
/glibc/glibc_2.32.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/qe=
mux86-world/build/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate=
_sysroot', '/home/pokybuild/yocto-worker/qemux86-world/build/meta/recipes-d=
evtools/quilt/quilt-native_0.66.bb:do_populate_sysroot', '/home/pokybuild/y=
octo-worker/qemux86-world/build/meta/recipes-support/bash-completion/bash-c=
ompletion_2.11.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/qemux=
86-world/build/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot', =
'/home/pokybuild/yocto-worker/qemux86-world/build/meta/recipes-support/curl=
/curl_7.73.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/qemux86=
-world/build/meta/recipes-devtools/cmake/cmake-native_3.18.4.bb:do_populate=
_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/qemux86-world/build=
/meta/recipes-devtools/ninja/ninja_1.10.1.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['expat', 'bzip2', 'patch-na=
tive', 'xz', 'ncurses', 'gcc-cross-x86_64', 'pseudo-native', 'libarchive', =
'glibc', 'gcc-runtime', 'quilt-native', 'bash-completion', 'zlib', 'curl', =
'cmake-native', 'ninja-native', 'opkg-utils', 'libtool-native', 'attr-nativ=
e', 'automake-native', 'gnu-config-native', 'autoconf-native', 'gmp-native'=
, 'mpfr-native', 'texinfo-dummy-native', 'zlib-native', 'libmpc-native', 'b=
inutils-cross-x86_64', 'linux-libc-headers', 'xz-native', 'flex-native', 'l=
ibxml2', 'acl', 'lzo', 'attr', 'libgcc', 'gnutls', 'libidn2', 'bzip2-native=
', 'curl-native', 'ncurses-native', 're2c-native', 'gettext-minimal-native'=
, 'm4-native', 'python3', 'nettle', 'libunistring', 'gmp', 'pkgconfig-nativ=
e', 'openssl-native', 'gdbm', 'libxcrypt', 'openssl', 'sqlite3', 'libffi', =
'libtirpc', 'libnsl2', 'readline', 'util-linux', 'libcap-ng']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| -- The C compiler identification is GNU 10.2.0
| -- The CXX compiler identification is GNU 10.2.0
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Check for working C compiler: /home/pokybuild/yocto-worker/qemux86-wor=
ld/build/build/tmp/work/core2-64-poky-linux/cmake/3.18.4-r0/recipe-sysroot-=
native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc - skipped
| -- Detecting C compile features
| -- Detecting C compile features - done
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working CXX compiler: /home/pokybuild/yocto-worker/qemux86-w=
orld/build/build/tmp/work/core2-64-poky-linux/cmake/3.18.4-r0/recipe-sysroo=
t-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ - skipped
| -- Detecting CXX compile features
| -- Detecting CXX compile features - done
| -- Checking if compiler supports C11 _Thread_local
| -- Checking if compiler supports C11 _Thread_local - yes
| -- Checking if compiler supports needed C++17 constructs
| -- Checking if compiler supports needed C++17 constructs - yes
| -- Checking if compiler supports C++ make_unique
| -- Checking if compiler supports C++ make_unique - no
| -- Checking if compiler supports C++ unique_ptr
| -- Checking if compiler supports C++ unique_ptr - no
| CMake Error at CMakeLists.txt:107 (message):
|   The C++ compiler does not support C++11 (e.g.  std::unique_ptr).
|=20
|=20
| -- Configuring incomplete, errors occurred!
| See also "/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work=
/core2-64-poky-linux/cmake/3.18.4-r0/build/CMakeFiles/CMakeOutput.log".
| See also "/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work=
/core2-64-poky-linux/cmake/3.18.4-r0/build/CMakeFiles/CMakeError.log".
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of '/home/pokybuild/yocto-worker/qemux86-world/build/bui=
ld/tmp/work/core2-64-poky-linux/cmake/3.18.4-r0/temp/run.do_configure.25583=
' failed with exit code 1:
| -- The C compiler identification is GNU 10.2.0
| -- The CXX compiler identification is GNU 10.2.0
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Check for working C compiler: /home/pokybuild/yocto-worker/qemux86-wor=
ld/build/build/tmp/work/core2-64-poky-linux/cmake/3.18.4-r0/recipe-sysroot-=
native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc - skipped
| -- Detecting C compile features
| -- Detecting C compile features - done
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working CXX compiler: /home/pokybuild/yocto-worker/qemux86-w=
orld/build/build/tmp/work/core2-64-poky-linux/cmake/3.18.4-r0/recipe-sysroo=
t-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ - skipped
| -- Detecting CXX compile features
| -- Detecting CXX compile features - done
| -- Checking if compiler supports C11 _Thread_local
| -- Checking if compiler supports C11 _Thread_local - yes
| -- Checking if compiler supports needed C++17 constructs
| -- Checking if compiler supports needed C++17 constructs - yes
| -- Checking if compiler supports C++ make_unique
| -- Checking if compiler supports C++ make_unique - no
| -- Checking if compiler supports C++ unique_ptr
| -- Checking if compiler supports C++ unique_ptr - no
| CMake Error at CMakeLists.txt:107 (message):
|   The C++ compiler does not support C++11 (e.g.  std::unique_ptr).
|=20
|=20
| -- Configuring incomplete, errors occurred!
| See also "/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work=
/core2-64-poky-linux/cmake/3.18.4-r0/build/CMakeFiles/CMakeOutput.log".
| See also "/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work=
/core2-64-poky-linux/cmake/3.18.4-r0/build/CMakeFiles/CMakeError.log".
| WARNING: exit code 1 from a shell command.
|=20
NOTE: recipe cmake-3.18.4-r0: task do_configure: Failed
ERROR: Task (/home/pokybuild/yocto-worker/qemux86-world/build/meta/recipes-=
devtools/cmake/cmake_3.18.4.bb:do_configure) failed with exit code '1'

however this should give a better hint:

pokybuild@debian8-ty-1:~/yocto-worker/qemux86-world/build/build-renamed/tmp=
/work/core2-64-poky-linux/cmake/3.18.4-r0/build/CMakeFiles$ cat CMakeError.=
log=20
Determining if compiler supports C++ make_unique failed with the following =
output:
Change Dir: /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work=
/core2-64-poky-linux/cmake/3.18.4-r0/build/CMakeFiles/CMakeTmp

Run Build Command(s):ninja cmTC_6b525 && [1/2] Building CXX object CMakeFil=
es/cmTC_6b525.dir/cm_cxx_make_unique.cxx.o
In file included from /home/pokybuild/yocto-worker/qemux86-world/build/buil=
d/tmp/work/core2-64-poky-linux/cmake/3.18.4-r0/recipe-sysroot/usr/include/c=
++/10.2.0/x86_64-poky-linux/bits/os_defines.h:39,
                 from /home/pokybuild/yocto-worker/qemux86-world/build/buil=
d/tmp/work/core2-64-poky-linux/cmake/3.18.4-r0/recipe-sysroot/usr/include/c=
++/10.2.0/x86_64-poky-linux/bits/c++config.h:518,
                 from /home/pokybuild/yocto-worker/qemux86-world/build/buil=
d/tmp/work/core2-64-poky-linux/cmake/3.18.4-r0/recipe-sysroot/usr/include/c=
++/10.2.0/bits/stl_algobase.h:59,
                 from /home/pokybuild/yocto-worker/qemux86-world/build/buil=
d/tmp/work/core2-64-poky-linux/cmake/3.18.4-r0/recipe-sysroot/usr/include/c=
++/10.2.0/memory:63,
                 from /home/pokybuild/yocto-worker/qemux86-world/build/buil=
d/tmp/work/core2-64-poky-linux/cmake/3.18.4-r0/cmake-3.18.4/Source/Checks/c=
m_cxx_make_unique.cxx:1:
/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-po=
ky-linux/cmake/3.18.4-r0/recipe-sysroot/usr/include/features.h:397:4: warni=
ng: #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Wc=
pp]
  397 | #  warning _FORTIFY_SOURCE requires compiling with optimization (-O=
)
      |    ^~~~~~~
[2/2] Linking CXX executable cmTC_6b525



Determining if compiler supports C++ unique_ptr failed with the following o=
utput:
Change Dir: /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work=
/core2-64-poky-linux/cmake/3.18.4-r0/build/CMakeFiles/CMakeTmp

Run Build Command(s):ninja cmTC_24b5e && [1/2] Building CXX object CMakeFil=
es/cmTC_24b5e.dir/cm_cxx_unique_ptr.cxx.o
In file included from /home/pokybuild/yocto-worker/qemux86-world/build/buil=
d/tmp/work/core2-64-poky-linux/cmake/3.18.4-r0/recipe-sysroot/usr/include/c=
++/10.2.0/x86_64-poky-linux/bits/os_defines.h:39,
                 from /home/pokybuild/yocto-worker/qemux86-world/build/buil=
d/tmp/work/core2-64-poky-linux/cmake/3.18.4-r0/recipe-sysroot/usr/include/c=
++/10.2.0/x86_64-poky-linux/bits/c++config.h:518,
                 from /home/pokybuild/yocto-worker/qemux86-world/build/buil=
d/tmp/work/core2-64-poky-linux/cmake/3.18.4-r0/recipe-sysroot/usr/include/c=
++/10.2.0/bits/stl_algobase.h:59,
                 from /home/pokybuild/yocto-worker/qemux86-world/build/buil=
d/tmp/work/core2-64-poky-linux/cmake/3.18.4-r0/recipe-sysroot/usr/include/c=
++/10.2.0/memory:63,
                 from /home/pokybuild/yocto-worker/qemux86-world/build/buil=
d/tmp/work/core2-64-poky-linux/cmake/3.18.4-r0/cmake-3.18.4/Source/Checks/c=
m_cxx_unique_ptr.cxx:1:
/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-po=
ky-linux/cmake/3.18.4-r0/recipe-sysroot/usr/include/features.h:397:4: warni=
ng: #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Wc=
pp]
  397 | #  warning _FORTIFY_SOURCE requires compiling with optimization (-O=
)
      |    ^~~~~~~
[2/2] Linking CXX executable cmTC_24b5e


which suggests its the security flags inclusion. Did you modify the
distro? or are you not using poky?

Cheers,

Richard

