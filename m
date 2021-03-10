Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web12.3043.1615341383168238765
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 17:56:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AQyrGcuB;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id z6so6794182qts.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 17:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c4ZG8djVaKfLf5gjmZykfmuVaczN2txJX+4J5sLmB6c=;
        b=AQyrGcuBUzFbOiD08fUt66OhQZB/5VWoujX4A4bYzPjCb3uxmutj1SeGBB/N620Y1M
         pJzvyKvb/V6mLjSwXhKj/JH9hzTQCeRPZlMYGpmd7AQ4I2W+9g32wuZfKPbEVWPSAOfC
         WQ1iwv4pumqZ37/5itjQNMQj7WgW2CLjWbRvzWvqLZgqt5OWy5j5H0P9/63g14aZiM4/
         UV5y+zeZzv4Aw7LlV1BtA0shZUaz1eP9KZLLsAiMkRq93vB5EEUmDVBSdSAtP4jCy3lp
         Gy4rl1tkv6J8BABaTCqWJXL/fWdGVQUjDVpPLTwS8NXHEECaumY3JHlHYMwuIQ+qMPtA
         zyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c4ZG8djVaKfLf5gjmZykfmuVaczN2txJX+4J5sLmB6c=;
        b=Q4t/dDc1Qcx6PuTg+OmIXItRfL/WyL22+4YawSE48OCU2TWsAExoljiKbjBE+/4anM
         hJPJG7fVmFt9z2KB9Yc/vbQpLBYeRkO+iK5iRozO5O3BmuTKXZCT8fZoHrm4+200gk7A
         kP/oUtlB7ViqCqbJpGbHXYTgyE38S/bIXKYPUQfqCnC+UWqfjmCcODOQFQpsmz69VpWv
         c3TB2AdSiBdJUGfBWG5LFoKw469l3m6z1K1U9WO5h9c4274CSdu9Lq7jHwYZkWKFfWGg
         YJ4Hz+F+eE817N4tfFAS0KXAlbH9pdoIvjh/S1jHsixcHTD0ilFPvGYBblR+1J/oTGMS
         zKrw==
X-Gm-Message-State: AOAM531bbeE6CNzqcbhvh9mOGTDvjMbW+sDkXY7Exld95bZKcTqcnfvw
	CFHuQu8wfNaCJYjSL56fwYQ8DwISU8bEtOneHQs=
X-Google-Smtp-Source: ABdhPJxXu+KpFu6m/4nBxywc8asoIjOTwMBD2cmDPaaVuWypbadV6k+iCYWKP3ishIUKOHqlSBLv8tHcEAtHbIKuOeQ=
X-Received: by 2002:ac8:a42:: with SMTP id f2mr881842qti.214.1615341382180;
 Tue, 09 Mar 2021 17:56:22 -0800 (PST)
MIME-Version: 1.0
References: <20210309201321.1200205-1-andrei@gherzan.com>
In-Reply-To: <20210309201321.1200205-1-andrei@gherzan.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 9 Mar 2021 17:56:11 -0800
Message-ID: <CAMKF1soeS6nh9+GZNdty+Eg_rF8L8ZaOTat=JvmkLYD3yC=bTA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: Backport patch to fix _SC_LEVEL1_ICACHE_LINESIZE
To: Andrei Gherzan <andrei@gherzan.com>
Cc: Andrei Gherzan <andrei.gherzan@huawei.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000046a33c05bd24f9eb"

--00000000000046a33c05bd24f9eb
Content-Type: text/plain; charset="UTF-8"

This is ok with me

On Tue, Mar 9, 2021 at 12:14 PM Andrei Gherzan <andrei@gherzan.com> wrote:

> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>
> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> ---
>  ...-_SC_LEVEL1_ICACHE_LINESIZE-BZ-27444.patch | 185 ++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.33.bb         |   1 +
>  2 files changed, 186 insertions(+)
>  create mode 100644
> meta/recipes-core/glibc/glibc/0033-x86-Handle-_SC_LEVEL1_ICACHE_LINESIZE-BZ-27444.patch
>
> diff --git
> a/meta/recipes-core/glibc/glibc/0033-x86-Handle-_SC_LEVEL1_ICACHE_LINESIZE-BZ-27444.patch
> b/meta/recipes-core/glibc/glibc/0033-x86-Handle-_SC_LEVEL1_ICACHE_LINESIZE-BZ-27444.patch
> new file mode 100644
> index 0000000000..3a004e227f
> --- /dev/null
> +++
> b/meta/recipes-core/glibc/glibc/0033-x86-Handle-_SC_LEVEL1_ICACHE_LINESIZE-BZ-27444.patch
> @@ -0,0 +1,185 @@
> +From 750b00a1ddae220403fd892a6fd4e0791ffd154a Mon Sep 17 00:00:00 2001
> +From: "H.J. Lu" <hjl.tools@gmail.com>
> +Date: Fri, 18 Sep 2020 07:55:14 -0700
> +Subject: [PATCH] x86: Handle _SC_LEVEL1_ICACHE_LINESIZE [BZ #27444]
> +
> +    x86: Move x86 processor cache info to cpu_features
> +
> +missed _SC_LEVEL1_ICACHE_LINESIZE.
> +
> +1. Add level1_icache_linesize to struct cpu_features.
> +2. Initialize level1_icache_linesize by calling handle_intel,
> +handle_zhaoxin and handle_amd with _SC_LEVEL1_ICACHE_LINESIZE.
> +3. Return level1_icache_linesize for _SC_LEVEL1_ICACHE_LINESIZE.
> +
> +Upstream-Status: Backport [
> https://sourceware.org/bugzilla/show_bug.cgi?id=27444]
> +Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> +---
> + sysdeps/x86/Makefile                          |  8 +++
> + sysdeps/x86/cacheinfo.c                       |  3 +
> + sysdeps/x86/dl-cacheinfo.h                    |  6 ++
> + sysdeps/x86/include/cpu-features.h            |  2 +
> + .../x86/tst-sysconf-cache-linesize-static.c   |  1 +
> + sysdeps/x86/tst-sysconf-cache-linesize.c      | 57 +++++++++++++++++++
> + 6 files changed, 77 insertions(+)
> + create mode 100644 sysdeps/x86/tst-sysconf-cache-linesize-static.c
> + create mode 100644 sysdeps/x86/tst-sysconf-cache-linesize.c
> +
> +diff --git a/sysdeps/x86/Makefile b/sysdeps/x86/Makefile
> +index dd82674342..d231263051 100644
> +--- a/sysdeps/x86/Makefile
> ++++ b/sysdeps/x86/Makefile
> +@@ -208,3 +208,11 @@ $(objpfx)check-cet.out:
> $(..)sysdeps/x86/check-cet.awk \
> + generated += check-cet.out
> + endif
> + endif
> ++
> ++ifeq ($(subdir),posix)
> ++tests += \
> ++  tst-sysconf-cache-linesize \
> ++  tst-sysconf-cache-linesize-static
> ++tests-static += \
> ++  tst-sysconf-cache-linesize-static
> ++endif
> +diff --git a/sysdeps/x86/cacheinfo.c b/sysdeps/x86/cacheinfo.c
> +index 7b8df45e3b..5ea4723ca6 100644
> +--- a/sysdeps/x86/cacheinfo.c
> ++++ b/sysdeps/x86/cacheinfo.c
> +@@ -32,6 +32,9 @@ __cache_sysconf (int name)
> +     case _SC_LEVEL1_ICACHE_SIZE:
> +       return cpu_features->level1_icache_size;
> +
> ++    case _SC_LEVEL1_ICACHE_LINESIZE:
> ++      return cpu_features->level1_icache_linesize;
> ++
> +     case _SC_LEVEL1_DCACHE_SIZE:
> +       return cpu_features->level1_dcache_size;
> +
> +diff --git a/sysdeps/x86/dl-cacheinfo.h b/sysdeps/x86/dl-cacheinfo.h
> +index a31fa0783a..7cd00b92f1 100644
> +--- a/sysdeps/x86/dl-cacheinfo.h
> ++++ b/sysdeps/x86/dl-cacheinfo.h
> +@@ -707,6 +707,7 @@ dl_init_cacheinfo (struct cpu_features *cpu_features)
> +   long int core;
> +   unsigned int threads = 0;
> +   unsigned long int level1_icache_size = -1;
> ++  unsigned long int level1_icache_linesize = -1;
> +   unsigned long int level1_dcache_size = -1;
> +   unsigned long int level1_dcache_assoc = -1;
> +   unsigned long int level1_dcache_linesize = -1;
> +@@ -726,6 +727,8 @@ dl_init_cacheinfo (struct cpu_features *cpu_features)
> +
> +       level1_icache_size
> +       = handle_intel (_SC_LEVEL1_ICACHE_SIZE, cpu_features);
> ++      level1_icache_linesize
> ++      = handle_intel (_SC_LEVEL1_ICACHE_LINESIZE, cpu_features);
> +       level1_dcache_size = data;
> +       level1_dcache_assoc
> +       = handle_intel (_SC_LEVEL1_DCACHE_ASSOC, cpu_features);
> +@@ -753,6 +756,7 @@ dl_init_cacheinfo (struct cpu_features *cpu_features)
> +       shared = handle_zhaoxin (_SC_LEVEL3_CACHE_SIZE);
> +
> +       level1_icache_size = handle_zhaoxin (_SC_LEVEL1_ICACHE_SIZE);
> ++      level1_icache_linesize = handle_zhaoxin
> (_SC_LEVEL1_ICACHE_LINESIZE);
> +       level1_dcache_size = data;
> +       level1_dcache_assoc = handle_zhaoxin (_SC_LEVEL1_DCACHE_ASSOC);
> +       level1_dcache_linesize = handle_zhaoxin
> (_SC_LEVEL1_DCACHE_LINESIZE);
> +@@ -772,6 +776,7 @@ dl_init_cacheinfo (struct cpu_features *cpu_features)
> +       shared = handle_amd (_SC_LEVEL3_CACHE_SIZE);
> +
> +       level1_icache_size = handle_amd (_SC_LEVEL1_ICACHE_SIZE);
> ++      level1_icache_linesize = handle_amd (_SC_LEVEL1_ICACHE_LINESIZE);
> +       level1_dcache_size = data;
> +       level1_dcache_assoc = handle_amd (_SC_LEVEL1_DCACHE_ASSOC);
> +       level1_dcache_linesize = handle_amd (_SC_LEVEL1_DCACHE_LINESIZE);
> +@@ -833,6 +838,7 @@ dl_init_cacheinfo (struct cpu_features *cpu_features)
> +     }
> +
> +   cpu_features->level1_icache_size = level1_icache_size;
> ++  cpu_features->level1_icache_linesize = level1_icache_linesize;
> +   cpu_features->level1_dcache_size = level1_dcache_size;
> +   cpu_features->level1_dcache_assoc = level1_dcache_assoc;
> +   cpu_features->level1_dcache_linesize = level1_dcache_linesize;
> +diff --git a/sysdeps/x86/include/cpu-features.h
> b/sysdeps/x86/include/cpu-features.h
> +index 624736b40e..39a3f4f311 100644
> +--- a/sysdeps/x86/include/cpu-features.h
> ++++ b/sysdeps/x86/include/cpu-features.h
> +@@ -874,6 +874,8 @@ struct cpu_features
> +   unsigned long int rep_stosb_threshold;
> +   /* _SC_LEVEL1_ICACHE_SIZE.  */
> +   unsigned long int level1_icache_size;
> ++  /* _SC_LEVEL1_ICACHE_LINESIZE.  */
> ++  unsigned long int level1_icache_linesize;
> +   /* _SC_LEVEL1_DCACHE_SIZE.  */
> +   unsigned long int level1_dcache_size;
> +   /* _SC_LEVEL1_DCACHE_ASSOC.  */
> +diff --git a/sysdeps/x86/tst-sysconf-cache-linesize-static.c
> b/sysdeps/x86/tst-sysconf-cache-linesize-static.c
> +new file mode 100644
> +index 0000000000..152ae68821
> +--- /dev/null
> ++++ b/sysdeps/x86/tst-sysconf-cache-linesize-static.c
> +@@ -0,0 +1 @@
> ++#include "tst-sysconf-cache-linesize.c"
> +diff --git a/sysdeps/x86/tst-sysconf-cache-linesize.c
> b/sysdeps/x86/tst-sysconf-cache-linesize.c
> +new file mode 100644
> +index 0000000000..642dbde5d2
> +--- /dev/null
> ++++ b/sysdeps/x86/tst-sysconf-cache-linesize.c
> +@@ -0,0 +1,57 @@
> ++/* Test system cache line sizes.
> ++   Copyright (C) 2021 Free Software Foundation, Inc.
> ++   This file is part of the GNU C Library.
> ++
> ++   The GNU C Library is free software; you can redistribute it and/or
> ++   modify it under the terms of the GNU Lesser General Public
> ++   License as published by the Free Software Foundation; either
> ++   version 2.1 of the License, or (at your option) any later version.
> ++
> ++   The GNU C Library is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++   Lesser General Public License for more details.
> ++
> ++   You should have received a copy of the GNU Lesser General Public
> ++   License along with the GNU C Library; if not, see
> ++   <https://www.gnu.org/licenses/>.  */
> ++
> ++#include <stdio.h>
> ++#include <stdlib.h>
> ++#include <unistd.h>
> ++#include <array_length.h>
> ++
> ++static struct
> ++{
> ++  const char *name;
> ++  int _SC_val;
> ++} sc_options[] =
> ++  {
> ++#define N(name) { "_SC_"#name, _SC_##name }
> ++    N (LEVEL1_ICACHE_LINESIZE),
> ++    N (LEVEL1_DCACHE_LINESIZE),
> ++    N (LEVEL2_CACHE_LINESIZE)
> ++  };
> ++
> ++static int
> ++do_test (void)
> ++{
> ++  int result = EXIT_SUCCESS;
> ++
> ++  for (int i = 0; i < array_length (sc_options); ++i)
> ++    {
> ++      long int scret = sysconf (sc_options[i]._SC_val);
> ++      if (scret < 0)
> ++      {
> ++        printf ("sysconf (%s) returned < 0 (%ld)\n",
> ++                sc_options[i].name, scret);
> ++        result = EXIT_FAILURE;
> ++      }
> ++      else
> ++      printf ("sysconf (%s): %ld\n", sc_options[i].name, scret);
> ++    }
> ++
> ++  return result;
> ++}
> ++
> ++#include <support/test-driver.c>
> diff --git a/meta/recipes-core/glibc/glibc_2.33.bb
> b/meta/recipes-core/glibc/glibc_2.33.bb
> index c47826a51e..ac73bbeb7f 100644
> --- a/meta/recipes-core/glibc/glibc_2.33.bb
> +++ b/meta/recipes-core/glibc/glibc_2.33.bb
> @@ -45,6 +45,7 @@ SRC_URI =
> "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>             file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch
> \
>
> file://0031-x86-Require-full-ISA-support-for-x86-64-level-marker.patch \
>             file://0032-string-Work-around-GCC-PR-98512-in-rawmemchr.patch
> \
> +
>  file://0033-x86-Handle-_SC_LEVEL1_ICACHE_LINESIZE-BZ-27444.patch \
>             "
>  S = "${WORKDIR}/git"
>  B = "${WORKDIR}/build-${TARGET_SYS}"
> --
> 2.30.1
>
>
> 
>
>

--00000000000046a33c05bd24f9eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This is ok=C2=A0with me</div><div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 9, 2021 at 12:14 =
PM Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.com">andrei@gherzan.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Andrei Ghe=
rzan &lt;<a href=3D"mailto:andrei.gherzan@huawei.com" target=3D"_blank">and=
rei.gherzan@huawei.com</a>&gt;<br>
<br>
Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei.gherzan@huawei.=
com" target=3D"_blank">andrei.gherzan@huawei.com</a>&gt;<br>
---<br>
=C2=A0...-_SC_LEVEL1_ICACHE_LINESIZE-BZ-27444.patch | 185 ++++++++++++++++=
++<br>
=C2=A0meta/recipes-core/glibc/<a href=3D"http://glibc_2.33.bb" rel=3D"nore=
ferrer" target=3D"_blank">glibc_2.33.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A01 +<br>
=C2=A02 files changed, 186 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/glibc/glibc/0033-x86-Handle-_SC=
_LEVEL1_ICACHE_LINESIZE-BZ-27444.patch<br>
<br>
diff --git a/meta/recipes-core/glibc/glibc/0033-x86-Handle-_SC_LEVEL1_ICAC=
HE_LINESIZE-BZ-27444.patch b/meta/recipes-core/glibc/glibc/0033-x86-Handle-=
_SC_LEVEL1_ICACHE_LINESIZE-BZ-27444.patch<br>
new file mode 100644<br>
index 0000000000..3a004e227f<br>
--- /dev/null<br>
+++ b/meta/recipes-core/glibc/glibc/0033-x86-Handle-_SC_LEVEL1_ICACHE_LINE=
SIZE-BZ-27444.patch<br>
@@ -0,0 +1,185 @@<br>
+From 750b00a1ddae220403fd892a6fd4e0791ffd154a Mon Sep 17 00:00:00 2001<br=
>
+From: &quot;H.J. Lu&quot; &lt;<a href=3D"mailto:hjl.tools@gmail.com" targ=
et=3D"_blank">hjl.tools@gmail.com</a>&gt;<br>
+Date: Fri, 18 Sep 2020 07:55:14 -0700<br>
+Subject: [PATCH] x86: Handle _SC_LEVEL1_ICACHE_LINESIZE [BZ #27444]<br>
+<br>
+=C2=A0 =C2=A0 x86: Move x86 processor cache info to cpu_features<br>
+<br>
+missed _SC_LEVEL1_ICACHE_LINESIZE.<br>
+<br>
+1. Add level1_icache_linesize to struct cpu_features.<br>
+2. Initialize level1_icache_linesize by calling handle_intel,<br>
+handle_zhaoxin and handle_amd with _SC_LEVEL1_ICACHE_LINESIZE.<br>
+3. Return level1_icache_linesize for _SC_LEVEL1_ICACHE_LINESIZE.<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://sourceware.org/bugzilla/sho=
w_bug.cgi?id=3D27444" rel=3D"noreferrer" target=3D"_blank">https://sourcewa=
re.org/bugzilla/show_bug.cgi?id=3D27444</a>]<br>
+Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei.gherzan@huawei=
.com" target=3D"_blank">andrei.gherzan@huawei.com</a>&gt;<br>
+---<br>
+ sysdeps/x86/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 +++<br>
+ sysdeps/x86/cacheinfo.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +<br>
+ sysdeps/x86/dl-cacheinfo.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++<br>
+ sysdeps/x86/include/cpu-features.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 |=C2=A0 2 +<br>
+ .../x86/tst-sysconf-cache-linesize-static.c=C2=A0 =C2=A0|=C2=A0 1 +<br>
+ sysdeps/x86/tst-sysconf-cache-linesize.c=C2=A0 =C2=A0 =C2=A0 | 57 ++++++=
+++++++++++++<br>
+ 6 files changed, 77 insertions(+)<br>
+ create mode 100644 sysdeps/x86/tst-sysconf-cache-linesize-static.c<br>
+ create mode 100644 sysdeps/x86/tst-sysconf-cache-linesize.c<br>
+<br>
+diff --git a/sysdeps/x86/Makefile b/sysdeps/x86/Makefile<br>
+index dd82674342..d231263051 100644<br>
+--- a/sysdeps/x86/Makefile<br>
++++ b/sysdeps/x86/Makefile<br>
+@@ -208,3 +208,11 @@ $(objpfx)check-cet.out: $(..)sysdeps/x86/check-cet.a=
wk \<br>
+ generated +=3D check-cet.out<br>
+ endif<br>
+ endif<br>
++<br>
++ifeq ($(subdir),posix)<br>
++tests +=3D \<br>
++=C2=A0 tst-sysconf-cache-linesize \<br>
++=C2=A0 tst-sysconf-cache-linesize-static<br>
++tests-static +=3D \<br>
++=C2=A0 tst-sysconf-cache-linesize-static<br>
++endif<br>
+diff --git a/sysdeps/x86/cacheinfo.c b/sysdeps/x86/cacheinfo.c<br>
+index 7b8df45e3b..5ea4723ca6 100644<br>
+--- a/sysdeps/x86/cacheinfo.c<br>
++++ b/sysdeps/x86/cacheinfo.c<br>
+@@ -32,6 +32,9 @@ __cache_sysconf (int name)<br>
+=C2=A0 =C2=A0 =C2=A0case _SC_LEVEL1_ICACHE_SIZE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return cpu_features-&gt;level1_icache_size;<br=
>
+ <br>
++=C2=A0 =C2=A0 case _SC_LEVEL1_ICACHE_LINESIZE:<br>
++=C2=A0 =C2=A0 =C2=A0 return cpu_features-&gt;level1_icache_linesize;<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0case _SC_LEVEL1_DCACHE_SIZE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return cpu_features-&gt;level1_dcache_size;<br=
>
+ <br>
+diff --git a/sysdeps/x86/dl-cacheinfo.h b/sysdeps/x86/dl-cacheinfo.h<br>
+index a31fa0783a..7cd00b92f1 100644<br>
+--- a/sysdeps/x86/dl-cacheinfo.h<br>
++++ b/sysdeps/x86/dl-cacheinfo.h<br>
+@@ -707,6 +707,7 @@ dl_init_cacheinfo (struct cpu_features *cpu_features)=
<br>
+=C2=A0 =C2=A0long int core;<br>
+=C2=A0 =C2=A0unsigned int threads =3D 0;<br>
+=C2=A0 =C2=A0unsigned long int level1_icache_size =3D -1;<br>
++=C2=A0 unsigned long int level1_icache_linesize =3D -1;<br>
+=C2=A0 =C2=A0unsigned long int level1_dcache_size =3D -1;<br>
+=C2=A0 =C2=A0unsigned long int level1_dcache_assoc =3D -1;<br>
+=C2=A0 =C2=A0unsigned long int level1_dcache_linesize =3D -1;<br>
+@@ -726,6 +727,8 @@ dl_init_cacheinfo (struct cpu_features *cpu_features)=
<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0level1_icache_size<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D handle_intel (_SC_LEVEL1_ICACHE_SIZE, cpu_=
features);<br>
++=C2=A0 =C2=A0 =C2=A0 level1_icache_linesize<br>
++=C2=A0 =C2=A0 =C2=A0 =3D handle_intel (_SC_LEVEL1_ICACHE_LINESIZE, cpu_f=
eatures);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0level1_dcache_size =3D data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0level1_dcache_assoc<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D handle_intel (_SC_LEVEL1_DCACHE_ASSOC, cpu=
_features);<br>
+@@ -753,6 +756,7 @@ dl_init_cacheinfo (struct cpu_features *cpu_features)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0shared =3D handle_zhaoxin (_SC_LEVEL3_CACHE_SI=
ZE);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0level1_icache_size =3D handle_zhaoxin (_SC_LEV=
EL1_ICACHE_SIZE);<br>
++=C2=A0 =C2=A0 =C2=A0 level1_icache_linesize =3D handle_zhaoxin (_SC_LEVE=
L1_ICACHE_LINESIZE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0level1_dcache_size =3D data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0level1_dcache_assoc =3D handle_zhaoxin (_SC_LE=
VEL1_DCACHE_ASSOC);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0level1_dcache_linesize =3D handle_zhaoxin (_SC=
_LEVEL1_DCACHE_LINESIZE);<br>
+@@ -772,6 +776,7 @@ dl_init_cacheinfo (struct cpu_features *cpu_features)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0shared =3D handle_amd (_SC_LEVEL3_CACHE_SIZE);=
<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0level1_icache_size =3D handle_amd (_SC_LEVEL1_=
ICACHE_SIZE);<br>
++=C2=A0 =C2=A0 =C2=A0 level1_icache_linesize =3D handle_amd (_SC_LEVEL1_I=
CACHE_LINESIZE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0level1_dcache_size =3D data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0level1_dcache_assoc =3D handle_amd (_SC_LEVEL1=
_DCACHE_ASSOC);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0level1_dcache_linesize =3D handle_amd (_SC_LEV=
EL1_DCACHE_LINESIZE);<br>
+@@ -833,6 +838,7 @@ dl_init_cacheinfo (struct cpu_features *cpu_features)=
<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0cpu_features-&gt;level1_icache_size =3D level1_icache_size;<=
br>
++=C2=A0 cpu_features-&gt;level1_icache_linesize =3D level1_icache_linesiz=
e;<br>
+=C2=A0 =C2=A0cpu_features-&gt;level1_dcache_size =3D level1_dcache_size;<=
br>
+=C2=A0 =C2=A0cpu_features-&gt;level1_dcache_assoc =3D level1_dcache_assoc=
;<br>
+=C2=A0 =C2=A0cpu_features-&gt;level1_dcache_linesize =3D level1_dcache_li=
nesize;<br>
+diff --git a/sysdeps/x86/include/cpu-features.h b/sysdeps/x86/include/cpu=
-features.h<br>
+index 624736b40e..39a3f4f311 100644<br>
+--- a/sysdeps/x86/include/cpu-features.h<br>
++++ b/sysdeps/x86/include/cpu-features.h<br>
+@@ -874,6 +874,8 @@ struct cpu_features<br>
+=C2=A0 =C2=A0unsigned long int rep_stosb_threshold;<br>
+=C2=A0 =C2=A0/* _SC_LEVEL1_ICACHE_SIZE.=C2=A0 */<br>
+=C2=A0 =C2=A0unsigned long int level1_icache_size;<br>
++=C2=A0 /* _SC_LEVEL1_ICACHE_LINESIZE.=C2=A0 */<br>
++=C2=A0 unsigned long int level1_icache_linesize;<br>
+=C2=A0 =C2=A0/* _SC_LEVEL1_DCACHE_SIZE.=C2=A0 */<br>
+=C2=A0 =C2=A0unsigned long int level1_dcache_size;<br>
+=C2=A0 =C2=A0/* _SC_LEVEL1_DCACHE_ASSOC.=C2=A0 */<br>
+diff --git a/sysdeps/x86/tst-sysconf-cache-linesize-static.c b/sysdeps/x8=
6/tst-sysconf-cache-linesize-static.c<br>
+new file mode 100644<br>
+index 0000000000..152ae68821<br>
+--- /dev/null<br>
++++ b/sysdeps/x86/tst-sysconf-cache-linesize-static.c<br>
+@@ -0,0 +1 @@<br>
++#include &quot;tst-sysconf-cache-linesize.c&quot;<br>
+diff --git a/sysdeps/x86/tst-sysconf-cache-linesize.c b/sysdeps/x86/tst-s=
ysconf-cache-linesize.c<br>
+new file mode 100644<br>
+index 0000000000..642dbde5d2<br>
+--- /dev/null<br>
++++ b/sysdeps/x86/tst-sysconf-cache-linesize.c<br>
+@@ -0,0 +1,57 @@<br>
++/* Test system cache line sizes.<br>
++=C2=A0 =C2=A0Copyright (C) 2021 Free Software Foundation, Inc.<br>
++=C2=A0 =C2=A0This file is part of the GNU C Library.<br>
++<br>
++=C2=A0 =C2=A0The GNU C Library is free software; you can redistribute it=
 and/or<br>
++=C2=A0 =C2=A0modify it under the terms of the GNU Lesser General Public<=
br>
++=C2=A0 =C2=A0License as published by the Free Software Foundation; eithe=
r<br>
++=C2=A0 =C2=A0version 2.1 of the License, or (at your option) any later v=
ersion.<br>
++<br>
++=C2=A0 =C2=A0The GNU C Library is distributed in the hope that it will b=
e useful,<br>
++=C2=A0 =C2=A0but WITHOUT ANY WARRANTY; without even the implied warranty=
 of<br>
++=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 =
See the GNU<br>
++=C2=A0 =C2=A0Lesser General Public License for more details.<br>
++<br>
++=C2=A0 =C2=A0You should have received a copy of the GNU Lesser General P=
ublic<br>
++=C2=A0 =C2=A0License along with the GNU C Library; if not, see<br>
++=C2=A0 =C2=A0&lt;<a href=3D"https://www.gnu.org/licenses/" rel=3D"norefe=
rrer" target=3D"_blank">https://www.gnu.org/licenses/</a>&gt;.=C2=A0 */<br>
++<br>
++#include &lt;stdio.h&gt;<br>
++#include &lt;stdlib.h&gt;<br>
++#include &lt;unistd.h&gt;<br>
++#include &lt;array_length.h&gt;<br>
++<br>
++static struct<br>
++{<br>
++=C2=A0 const char *name;<br>
++=C2=A0 int _SC_val;<br>
++} sc_options[] =3D<br>
++=C2=A0 {<br>
++#define N(name) { &quot;_SC_&quot;#name, _SC_##name }<br>
++=C2=A0 =C2=A0 N (LEVEL1_ICACHE_LINESIZE),<br>
++=C2=A0 =C2=A0 N (LEVEL1_DCACHE_LINESIZE),<br>
++=C2=A0 =C2=A0 N (LEVEL2_CACHE_LINESIZE)<br>
++=C2=A0 };<br>
++<br>
++static int<br>
++do_test (void)<br>
++{<br>
++=C2=A0 int result =3D EXIT_SUCCESS;<br>
++<br>
++=C2=A0 for (int i =3D 0; i &lt; array_length (sc_options); ++i)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 long int scret =3D sysconf (sc_options[i]._SC_val);=
<br>
++=C2=A0 =C2=A0 =C2=A0 if (scret &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf (&quot;sysconf (%s) returned &lt; 0 (=
%ld)\n&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sc_options[i].na=
me, scret);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D EXIT_FAILURE;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 printf (&quot;sysconf (%s): %ld\n&quot;, sc_options=
[i].name, scret);<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 return result;<br>
++}<br>
++<br>
++#include &lt;support/test-driver.c&gt;<br>
diff --git a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.33.bb" rel=
=3D"noreferrer" target=3D"_blank">glibc_2.33.bb</a> b/meta/recipes-core/gl=
ibc/<a href=3D"http://glibc_2.33.bb" rel=3D"noreferrer" target=3D"_blank">g=
libc_2.33.bb</a><br>
index c47826a51e..ac73bbeb7f 100644<br>
--- a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.33.bb" rel=3D"nore=
ferrer" target=3D"_blank">glibc_2.33.bb</a><br>
+++ b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.33.bb" rel=3D"nore=
ferrer" target=3D"_blank">glibc_2.33.bb</a><br>
@@ -45,6 +45,7 @@ SRC_URI =3D=C2=A0 &quot;${GLIBC_GIT_URI};branch=3D${SRCB=
RANCH};name=3Dglibc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0030-powerpc-Do-not-ask-c=
ompiler-for-finding-arch.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0031-x86-Require-full-ISA=
-support-for-x86-64-level-marker.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0032-string-Work-around-G=
CC-PR-98512-in-rawmemchr.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0033-x86-Handle-_SC_LEVEL=
1_ICACHE_LINESIZE-BZ-27444.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
=C2=A0B =3D &quot;${WORKDIR}/build-${TARGET_SYS}&quot;<br>
-- <br>
2.30.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--00000000000046a33c05bd24f9eb--
