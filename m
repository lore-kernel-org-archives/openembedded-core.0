Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web11.107.1615320946231647177
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 12:15:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=jful/jOP;
 spf=pass (domain: gherzan.com, ip: 66.111.4.29, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 7F3A05C0071
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Mar 2021 15:15:45 -0500 (EST)
Received: from imap4 ([10.202.2.54])
  by compute3.internal (MEProxy); Tue, 09 Mar 2021 15:15:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	mime-version:message-id:in-reply-to:references:date:from:to
	:subject:content-type; s=fm1; bh=JIEc3kJBWdS156y361l8vN9CcgfVCAy
	lxudNDrMGYsU=; b=jful/jOPrxhM67VxFF58cLY9QjtJpZKeB40i0Fo795FRIE7
	6RccFOMheJmB/hpDHKz6F/VgDij3py/HSvJJWF8gTmOovilDVUa6uP7PD/wKAuvq
	3CLLKjPGTjs3xoSlbFA8dU5jS6rDW5FyZuEYiTUZt6HnYAygc/DCMzjTswZdfVpu
	oLznM/J+n5Bivl5v8+7ATAMyxb+5OA0EU5tSE6q89YawcTNfWXkKsbclc8TPlO6i
	P4NA9/qp3isBlX5TI8G8HF909aWekaQn7UcSamHYcCFptGunsifjyb9M0iZs7xcy
	3gyk7hAbE+8idFVQ4XuIDJiz6P23q/U1mup2kmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=JIEc3k
	JBWdS156y361l8vN9CcgfVCAylxudNDrMGYsU=; b=hKvzIngxR5ccSe40abVF7t
	ypbVXIAG+WcL1cl0/HVIfGmd8Wb6V/bFjW/z/NNhyCNrqFXoO1kSaJ0GzZlvrluM
	Bdp/Qan5KGhIaZqZFFMh0Ieuspi734TKU/VXJEOotgtvWl1gjLX92C7+xJ5FNMmX
	nL0KMBBFXQHymHoO52pWnR/VSbXomfTd6b2L8nNGUo6bEBVUCUtT7Fhu9w+3Wlhp
	I43rnNNatTniG2zuEidMkrm9cfnYWvYNBBQnUNUqEVMiZcYGdahcd/qFvqDL0aDX
	2HatIedKR9zsy3ydXMj/H0RgLaILjdyjAzzTU10qlSjXhcmYzvdMHRglhGID259g
	==
X-ME-Sender: <xms:cddHYGBCGEbH55hDqsJQligdORThVUkIa9FAsAAJXhJ9Nt5FXLT1zQ>
    <xme:cddHYAifbFyRdYKA3culbZTzC9P0O_BGQyxQMMIqmJ81uetqfcG99CkckzezF03A-
    7nJhsVZKQVM8PE_2_E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgudefhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesrg
    dtreerreerjeenucfhrhhomhepfdetnhgurhgvihcuifhhvghriigrnhdfuceorghnughr
    vghisehghhgvrhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpeetuddtheetkefhvd
    dvkeelkeetkedtheegudekteduudeigfejtefgtdfggeduudenucffohhmrghinhepohhp
    vghnvghmsggvugguvggurdhorhhgpdhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgt
    ohhm
X-ME-Proxy: <xmx:cddHYJk-4XNkStHKEnqlvZe4OfsVrKPnoxj73rmTnYMh8MJcGCGP0A>
    <xmx:cddHYEyJFF3jHRDOHVhjsoRpLRF2dLDuH3tdxrgDRsKPNYbFwJeG8Q>
    <xmx:cddHYLSBbMslDeYXi-UKfj-yNJQp84yOLmYxtJzAl6CRAZ4H2s4Wzw>
    <xmx:cddHYCeZit4AmH_eVE1ClEym3IyC4DAXzL3NapKXepQecO4K_fiWCQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 2AA21160068; Tue,  9 Mar 2021 15:15:45 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-206-g078a48fda5-fm-20210226.001-g078a48fd
Mime-Version: 1.0
Message-Id: <12ebc2a6-d6e9-45fe-b339-5c181d2632d8@www.fastmail.com>
In-Reply-To: <16654B509E6B5B9A.19946@lists.openembedded.org>
References: <16654B509E6B5B9A.19946@lists.openembedded.org>
Date: Tue, 09 Mar 2021 20:15:20 +0000
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] glibc: Bring back L1 icache line size
Content-Type: multipart/alternative;
 boundary=ee7ab90d0f784260aa6cc2310d81e97f

--ee7ab90d0f784260aa6cc2310d81e97f
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

Superseded by https://lists.openembedded.org/g/openembedded-core/message/14=
9192
---
Andrei

On Fri, 19 Feb 2021, at 23:53, Andrei Gherzan wrote:
> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>=20
> It was observerd that with glibc 2.33, sysconf reports unsupported
> option (-1) for _SC_LEVEL1_ICACHE_LINESIZE.
>=20
> This can be reproduced with sysconf tool:
>=20
> ```
> =E2=94=94=E2=94=80=E2=9D=AF  docker run -ti --rm archlinux:base-20210214=
.0.15477 getconf -a |
> grep "GNU_LIBC_VERSION\|LEVEL1_ICACHE_LINESIZE"
> GNU_LIBC_VERSION                   glibc 2.33
> LEVEL1_ICACHE_LINESIZE
> =E2=94=94=E2=94=80=E2=9D=AF  docker run -ti --rm archlinux:base-20210131=
.0.14634 getconf -a |
> grep "GNU_LIBC_VERSION\|LEVEL1_ICACHE_LINESIZE"
> GNU_LIBC_VERSION                   glibc 2.32
> LEVEL1_ICACHE_LINESIZE             64
> ```
>=20
> The offending patch in glibc is:
>=20
> commit 2d651eb9265d1366d7b9e881bfddd46db9c1ecc4
> Author: H.J. Lu <hjl.tools@gmail.com>
> Date:   Fri Sep 18 07:55:14 2020 -0700
>     x86: Move x86 processor cache info to cpu_features
>=20
> This patch reverts the above mentioned glibc change. It was tested on
> qemux86.
>=20
> Extra small cosmetic tweaks brought you by devtool (a superflous newline
> and whitespace).
>=20
> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> ---
> ...x86-processor-cache-info-to-cpu_feat.patch | 1074 +++++++++++++++++
> meta/recipes-core/glibc/glibc_2.33.bb         |    4 +-
> 2 files changed, 1076 insertions(+), 2 deletions(-)
> create mode 100644 meta/recipes-core/glibc/glibc/0032-Revert-x86-Move-x8=
6-processor-cache-info-to-cpu_feat.patch
>=20
> diff --git a/meta/recipes-core/glibc/glibc/0032-Revert-x86-Move-x86-proc=
essor-cache-info-to-cpu_feat.patch b/meta/recipes-core/glibc/glibc/0032-Rev=
ert-x86-Move-x86-processor-cache-info-to-cpu_feat.patch
> new file mode 100644
> index 0000000000..0ff1eba82b
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0032-Revert-x86-Move-x86-processor-c=
ache-info-to-cpu_feat.patch
> @@ -0,0 +1,1074 @@
> +From 961d681e38d30a4de06c980de0a96464fa3b4d74 Mon Sep 17 00:00:00 2001
> +From: Andrei Gherzan <andrei@gherzan.com>
> +Date: Fri, 19 Feb 2021 23:06:50 +0000
> +Subject: [PATCH] Revert "x86: Move x86 processor cache info to cpu_feat=
ures"
> +
> +This reverts commit 2d651eb9265d1366d7b9e881bfddd46db9c1ecc4.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> +---
> + sysdeps/x86/cacheinfo.c            |  46 +--
> + sysdeps/x86/cacheinfo.h            | 400 +++++++++++++++++++++++--
> + sysdeps/x86/cpu-features.c         |  35 ++-
> + sysdeps/x86/dl-cacheinfo.h         | 460 -----------------------------
> + sysdeps/x86/include/cpu-features.h |  22 --
> + 5 files changed, 412 insertions(+), 551 deletions(-)
> +
> +diff --git a/sysdeps/x86/cacheinfo.c b/sysdeps/x86/cacheinfo.c
> +index 7b8df45e3b..948dbea3db 100644
> +--- a/sysdeps/x86/cacheinfo.c
> ++++ b/sysdeps/x86/cacheinfo.c
> +@@ -18,8 +18,11 @@
> +=20
> + #if IS_IN (libc)
> +=20
> ++#include <assert.h>
> + #include <unistd.h>
> ++#include <cpuid.h>
> + #include <ldsodefs.h>
> ++#include <dl-cacheinfo.h>
> +=20
> + /* Get the value of the system variable NAME.  */
> + long int
> +@@ -27,45 +30,20 @@ attribute_hidden
> + __cache_sysconf (int name)
> + {
> +   const struct cpu_features *cpu_features =3D __get_cpu_features ();
> +-  switch (name)
> +-    {
> +-    case _SC_LEVEL1_ICACHE_SIZE:
> +-      return cpu_features->level1_icache_size;
> +=20
> +-    case _SC_LEVEL1_DCACHE_SIZE:
> +-      return cpu_features->level1_dcache_size;
> ++  if (cpu_features->basic.kind =3D=3D arch_kind_intel)
> ++    return handle_intel (name, cpu_features);
> +=20
> +-    case _SC_LEVEL1_DCACHE_ASSOC:
> +-      return cpu_features->level1_dcache_assoc;
> ++  if (cpu_features->basic.kind =3D=3D arch_kind_amd)
> ++    return handle_amd (name);
> +=20
> +-    case _SC_LEVEL1_DCACHE_LINESIZE:
> +-      return cpu_features->level1_dcache_linesize;
> ++  if (cpu_features->basic.kind =3D=3D arch_kind_zhaoxin)
> ++    return handle_zhaoxin (name);
> +=20
> +-    case _SC_LEVEL2_CACHE_SIZE:
> +-      return cpu_features->level2_cache_size;
> ++  // XXX Fill in more vendors.
> +=20
> +-    case _SC_LEVEL2_CACHE_ASSOC:
> +-      return cpu_features->level2_cache_assoc;
> +-
> +-    case _SC_LEVEL2_CACHE_LINESIZE:
> +-      return cpu_features->level2_cache_linesize;
> +-
> +-    case _SC_LEVEL3_CACHE_SIZE:
> +-      return cpu_features->level3_cache_size;
> +-
> +-    case _SC_LEVEL3_CACHE_ASSOC:
> +-      return cpu_features->level3_cache_assoc;
> +-
> +-    case _SC_LEVEL3_CACHE_LINESIZE:
> +-      return cpu_features->level3_cache_linesize;
> +-
> +-    case _SC_LEVEL4_CACHE_SIZE:
> +-      return cpu_features->level4_cache_size;
> +-
> +-    default:
> +-      break;
> +-    }
> +-  return -1;
> ++  /* CPU not known, we have no information.  */
> ++  return 0;
> + }
> +=20
> + # ifdef SHARED
> +diff --git a/sysdeps/x86/cacheinfo.h b/sysdeps/x86/cacheinfo.h
> +index 68c253542f..736189f7f2 100644
> +--- a/sysdeps/x86/cacheinfo.h
> ++++ b/sysdeps/x86/cacheinfo.h
> +@@ -18,16 +18,7 @@
> +=20
> + #include <assert.h>
> + #include <unistd.h>
> +-#include <cpuid.h>
> +-#include <cpu-features.h>
> +=20
> +-#if HAVE_TUNABLES
> +-# define TUNABLE_NAMESPACE cpu
> +-# include <unistd.h> /* Get STDOUT_FILENO for _dl_printf.  */
> +-# include <elf/dl-tunables.h>
> +-#endif
> +-
> +-#if IS_IN (libc)
> + /* Data cache size for use in memory and string routines, typically
> +    L1 size, rounded to multiple of 256 bytes.  */
> + long int __x86_data_cache_size_half attribute_hidden =3D 32 * 1024 / 2=
;
> +@@ -54,30 +45,385 @@ long int __x86_rep_movsb_threshold attribute_hidde=
n =3D 2048;
> + /* Threshold to use Enhanced REP STOSB.  */
> + long int __x86_rep_stosb_threshold attribute_hidden =3D 2048;
> +=20
> ++static void
> ++get_common_cache_info (long int *shared_ptr, unsigned int *threads_ptr=
,
> ++        long int core)
> ++{
> ++  unsigned int eax;
> ++  unsigned int ebx;
> ++  unsigned int ecx;
> ++  unsigned int edx;
> ++
> ++  /* Number of logical processors sharing L2 cache.  */
> ++  int threads_l2;
> ++
> ++  /* Number of logical processors sharing L3 cache.  */
> ++  int threads_l3;
> ++
> ++  const struct cpu_features *cpu_features =3D __get_cpu_features ();
> ++  int max_cpuid =3D cpu_features->basic.max_cpuid;
> ++  unsigned int family =3D cpu_features->basic.family;
> ++  unsigned int model =3D cpu_features->basic.model;
> ++  long int shared =3D *shared_ptr;
> ++  unsigned int threads =3D *threads_ptr;
> ++  bool inclusive_cache =3D true;
> ++  bool support_count_mask =3D true;
> ++
> ++  /* Try L3 first.  */
> ++  unsigned int level =3D 3;
> ++
> ++  if (cpu_features->basic.kind =3D=3D arch_kind_zhaoxin && family =3D=
=3D 6)
> ++    support_count_mask =3D false;
> ++
> ++  if (shared <=3D 0)
> ++    {
> ++      /* Try L2 otherwise.  */
> ++      level  =3D 2;
> ++      shared =3D core;
> ++      threads_l2 =3D 0;
> ++      threads_l3 =3D -1;
> ++    }
> ++  else
> ++    {
> ++      threads_l2 =3D 0;
> ++      threads_l3 =3D 0;
> ++    }
> ++
> ++  /* A value of 0 for the HTT bit indicates there is only a single
> ++     logical processor.  */
> ++  if (HAS_CPU_FEATURE (HTT))
> ++    {
> ++      /* Figure out the number of logical threads that share the
> ++         highest cache level.  */
> ++      if (max_cpuid >=3D 4)
> ++        {
> ++          int i =3D 0;
> ++
> ++          /* Query until cache level 2 and 3 are enumerated.  */
> ++          int check =3D 0x1 | (threads_l3 =3D=3D 0) << 1;
> ++          do
> ++            {
> ++              __cpuid_count (4, i++, eax, ebx, ecx, edx);
> ++
> ++              /* There seems to be a bug in at least some Pentium Ds
> ++                 which sometimes fail to iterate all cache parameters.
> ++                 Do not loop indefinitely here, stop in this case and
> ++                 assume there is no such information.  */
> ++              if (cpu_features->basic.kind =3D=3D arch_kind_intel
> ++                  && (eax & 0x1f) =3D=3D 0 )
> ++                goto intel_bug_no_cache_info;
> ++
> ++              switch ((eax >> 5) & 0x7)
> ++                {
> ++                  default:
> ++                    break;
> ++                  case 2:
> ++                    if ((check & 0x1))
> ++                      {
> ++                        /* Get maximum number of logical processors
> ++                           sharing L2 cache.  */
> ++                        threads_l2 =3D (eax >> 14) & 0x3ff;
> ++                        check &=3D ~0x1;
> ++                      }
> ++                    break;
> ++                  case 3:
> ++                    if ((check & (0x1 << 1)))
> ++                      {
> ++                        /* Get maximum number of logical processors
> ++                           sharing L3 cache.  */
> ++                        threads_l3 =3D (eax >> 14) & 0x3ff;
> ++
> ++                        /* Check if L2 and L3 caches are inclusive.  *=
/
> ++                        inclusive_cache =3D (edx & 0x2) !=3D 0;
> ++                        check &=3D ~(0x1 << 1);
> ++                      }
> ++                    break;
> ++                }
> ++            }
> ++          while (check);
> ++
> ++          /* If max_cpuid >=3D 11, THREADS_L2/THREADS_L3 are the maxim=
um
> ++             numbers of addressable IDs for logical processors sharing
> ++             the cache, instead of the maximum number of threads
> ++             sharing the cache.  */
> ++          if (max_cpuid >=3D 11 && support_count_mask)
> ++            {
> ++              /* Find the number of logical processors shipped in
> ++                 one core and apply count mask.  */
> ++              i =3D 0;
> ++
> ++              /* Count SMT only if there is L3 cache.  Always count
> ++                 core if there is no L3 cache.  */
> ++              int count =3D ((threads_l2 > 0 && level =3D=3D 3)
> ++                           | ((threads_l3 > 0
> ++                               || (threads_l2 > 0 && level =3D=3D 2)) =
<< 1));
> ++
> ++              while (count)
> ++                {
> ++                  __cpuid_count (11, i++, eax, ebx, ecx, edx);
> ++
> ++                  int shipped =3D ebx & 0xff;
> ++                  int type =3D ecx & 0xff00;
> ++                  if (shipped =3D=3D 0 || type =3D=3D 0)
> ++                    break;
> ++                  else if (type =3D=3D 0x100)
> ++                    {
> ++                      /* Count SMT.  */
> ++                      if ((count & 0x1))
> ++                        {
> ++                          int count_mask;
> ++
> ++                          /* Compute count mask.  */
> ++                          asm ("bsr %1, %0"
> ++                               : "=3Dr" (count_mask) : "g" (threads_l2=
));
> ++                          count_mask =3D ~(-1 << (count_mask + 1));
> ++                          threads_l2 =3D (shipped - 1) & count_mask;
> ++                          count &=3D ~0x1;
> ++                        }
> ++                    }
> ++                  else if (type =3D=3D 0x200)
> ++                    {
> ++                      /* Count core.  */
> ++                      if ((count & (0x1 << 1)))
> ++                        {
> ++                          int count_mask;
> ++                          int threads_core
> ++                            =3D (level =3D=3D 2 ? threads_l2 : threads=
_l3);
> ++
> ++                          /* Compute count mask.  */
> ++                          asm ("bsr %1, %0"
> ++                               : "=3Dr" (count_mask) : "g" (threads_co=
re));
> ++                          count_mask =3D ~(-1 << (count_mask + 1));
> ++                          threads_core =3D (shipped - 1) & count_mask;
> ++                          if (level =3D=3D 2)
> ++                            threads_l2 =3D threads_core;
> ++                          else
> ++                            threads_l3 =3D threads_core;
> ++                          count &=3D ~(0x1 << 1);
> ++                        }
> ++                    }
> ++                }
> ++            }
> ++          if (threads_l2 > 0)
> ++            threads_l2 +=3D 1;
> ++          if (threads_l3 > 0)
> ++            threads_l3 +=3D 1;
> ++          if (level =3D=3D 2)
> ++            {
> ++              if (threads_l2)
> ++                {
> ++                  threads =3D threads_l2;
> ++                  if (cpu_features->basic.kind =3D=3D arch_kind_intel
> ++                      && threads > 2
> ++                      && family =3D=3D 6)
> ++                    switch (model)
> ++                      {
> ++                        case 0x37:
> ++                        case 0x4a:
> ++                        case 0x4d:
> ++                        case 0x5a:
> ++                        case 0x5d:
> ++                          /* Silvermont has L2 cache shared by 2 cores=
.  */
> ++                          threads =3D 2;
> ++                          break;
> ++                        default:
> ++                          break;
> ++                      }
> ++                }
> ++            }
> ++          else if (threads_l3)
> ++            threads =3D threads_l3;
> ++        }
> ++      else
> ++        {
> ++intel_bug_no_cache_info:
> ++          /* Assume that all logical threads share the highest cache
> ++             level.  */
> ++          threads
> ++     =3D ((cpu_features->features[CPUID_INDEX_1].cpuid.ebx >> 16)
> ++ & 0xff);
> ++        }
> ++
> ++        /* Cap usage of highest cache level to the number of supported
> ++           threads.  */
> ++        if (shared > 0 && threads > 0)
> ++          shared /=3D threads;
> ++    }
> ++
> ++  /* Account for non-inclusive L2 and L3 caches.  */
> ++  if (!inclusive_cache)
> ++    {
> ++      if (threads_l2 > 0)
> ++        core /=3D threads_l2;
> ++      shared +=3D core;
> ++    }
> ++
> ++  *shared_ptr =3D shared;
> ++  *threads_ptr =3D threads;
> ++}
> ++
> + static void
> + init_cacheinfo (void)
> + {
> ++  /* Find out what brand of processor.  */
> ++  unsigned int ebx;
> ++  unsigned int ecx;
> ++  unsigned int edx;
> ++  int max_cpuid_ex;
> ++  long int data =3D -1;
> ++  long int shared =3D -1;
> ++  long int core;
> ++  unsigned int threads =3D 0;
> +   const struct cpu_features *cpu_features =3D __get_cpu_features ();
> +-  long int data =3D cpu_features->data_cache_size;
> +-  __x86_raw_data_cache_size_half =3D data / 2;
> +-  __x86_raw_data_cache_size =3D data;
> +-  /* Round data cache size to multiple of 256 bytes.  */
> +-  data =3D data & ~255L;
> +-  __x86_data_cache_size_half =3D data / 2;
> +-  __x86_data_cache_size =3D data;
> +-
> +-  long int shared =3D cpu_features->shared_cache_size;
> +-  __x86_raw_shared_cache_size_half =3D shared / 2;
> +-  __x86_raw_shared_cache_size =3D shared;
> +-  /* Round shared cache size to multiple of 256 bytes.  */
> +-  shared =3D shared & ~255L;
> +-  __x86_shared_cache_size_half =3D shared / 2;
> +-  __x86_shared_cache_size =3D shared;
> +=20
> ++  /* NB: In libc.so, cpu_features is defined in ld.so and is initializ=
ed
> ++     by DL_PLATFORM_INIT or IFUNC relocation before init_cacheinfo is
> ++     called by IFUNC relocation.  In libc.a, init_cacheinfo is called
> ++     from init_cpu_features by ARCH_INIT_CPU_FEATURES.  */
> ++  assert (cpu_features->basic.kind !=3D arch_kind_unknown);
> ++
> ++  if (cpu_features->basic.kind =3D=3D arch_kind_intel)
> ++    {
> ++      data =3D handle_intel (_SC_LEVEL1_DCACHE_SIZE, cpu_features);
> ++      core =3D handle_intel (_SC_LEVEL2_CACHE_SIZE, cpu_features);
> ++      shared =3D handle_intel (_SC_LEVEL3_CACHE_SIZE, cpu_features);
> ++
> ++      get_common_cache_info (&shared, &threads, core);
> ++    }
> ++  else if (cpu_features->basic.kind =3D=3D arch_kind_zhaoxin)
> ++    {
> ++      data =3D handle_zhaoxin (_SC_LEVEL1_DCACHE_SIZE);
> ++      core =3D handle_zhaoxin (_SC_LEVEL2_CACHE_SIZE);
> ++      shared =3D handle_zhaoxin (_SC_LEVEL3_CACHE_SIZE);
> ++
> ++      get_common_cache_info (&shared, &threads, core);
> ++    }
> ++  else if (cpu_features->basic.kind =3D=3D arch_kind_amd)
> ++    {
> ++      data   =3D handle_amd (_SC_LEVEL1_DCACHE_SIZE);
> ++      long int core =3D handle_amd (_SC_LEVEL2_CACHE_SIZE);
> ++      shared =3D handle_amd (_SC_LEVEL3_CACHE_SIZE);
> ++
> ++      /* Get maximum extended function. */
> ++      __cpuid (0x80000000, max_cpuid_ex, ebx, ecx, edx);
> ++
> ++      if (shared <=3D 0)
> ++ /* No shared L3 cache.  All we have is the L2 cache.  */
> ++ shared =3D core;
> ++      else
> ++ {
> ++   /* Figure out the number of logical threads that share L3.  */
> ++   if (max_cpuid_ex >=3D 0x80000008)
> ++     {
> ++       /* Get width of APIC ID.  */
> ++       __cpuid (0x80000008, max_cpuid_ex, ebx, ecx, edx);
> ++       threads =3D 1 << ((ecx >> 12) & 0x0f);
> ++     }
> ++
> ++   if (threads =3D=3D 0 || cpu_features->basic.family >=3D 0x17)
> ++     {
> ++       /* If APIC ID width is not available, use logical
> ++ processor count.  */
> ++       __cpuid (0x00000001, max_cpuid_ex, ebx, ecx, edx);
> ++
> ++       if ((edx & (1 << 28)) !=3D 0)
> ++ threads =3D (ebx >> 16) & 0xff;
> ++     }
> ++
> ++   /* Cap usage of highest cache level to the number of
> ++      supported threads.  */
> ++   if (threads > 0)
> ++     shared /=3D threads;
> ++
> ++   /* Get shared cache per ccx for Zen architectures.  */
> ++   if (cpu_features->basic.family >=3D 0x17)
> ++     {
> ++       unsigned int eax;
> ++
> ++       /* Get number of threads share the L3 cache in CCX.  */
> ++       __cpuid_count (0x8000001D, 0x3, eax, ebx, ecx, edx);
> ++
> ++       unsigned int threads_per_ccx =3D ((eax >> 14) & 0xfff) + 1;
> ++       shared *=3D threads_per_ccx;
> ++     }
> ++   else
> ++     {
> ++       /* Account for exclusive L2 and L3 caches.  */
> ++       shared +=3D core;
> ++            }
> ++      }
> ++    }
> ++
> ++  /* Prefer cache size configure via tuning.  */
> ++  if (cpu_features->data_cache_size !=3D 0)
> ++    data =3D cpu_features->data_cache_size;
> ++
> ++  if (data > 0)
> ++    {
> ++      __x86_raw_data_cache_size_half =3D data / 2;
> ++      __x86_raw_data_cache_size =3D data;
> ++      /* Round data cache size to multiple of 256 bytes.  */
> ++      data =3D data & ~255L;
> ++      __x86_data_cache_size_half =3D data / 2;
> ++      __x86_data_cache_size =3D data;
> ++    }
> ++
> ++  /* Prefer cache size configure via tuning.  */
> ++  if (cpu_features->shared_cache_size !=3D 0)
> ++    shared =3D cpu_features->shared_cache_size;
> ++
> ++  if (shared > 0)
> ++    {
> ++      __x86_raw_shared_cache_size_half =3D shared / 2;
> ++      __x86_raw_shared_cache_size =3D shared;
> ++      /* Round shared cache size to multiple of 256 bytes.  */
> ++      shared =3D shared & ~255L;
> ++      __x86_shared_cache_size_half =3D shared / 2;
> ++      __x86_shared_cache_size =3D shared;
> ++    }
> ++
> ++  /* The default setting for the non_temporal threshold is 3/4 of one
> ++     thread's share of the chip's cache. For most Intel and AMD proces=
sors
> ++     with an initial release date between 2017 and 2020, a thread's ty=
pical
> ++     share of the cache is from 500 KBytes to 2 MBytes. Using the 3/4
> ++     threshold leaves 125 KBytes to 500 KBytes of the thread's data
> ++     in cache after a maximum temporal copy, which will maintain
> ++     in cache a reasonable portion of the thread's stack and other
> ++     active data. If the threshold is set higher than one thread's
> ++     share of the cache, it has a substantial risk of negatively
> ++     impacting the performance of other threads running on the chip. *=
/
> +   __x86_shared_non_temporal_threshold
> +-    =3D cpu_features->non_temporal_threshold;
> ++    =3D (cpu_features->non_temporal_threshold !=3D 0
> ++       ? cpu_features->non_temporal_threshold
> ++       : __x86_shared_cache_size * 3 / 4);
> ++
> ++  /* NB: The REP MOVSB threshold must be greater than VEC_SIZE * 8.  *=
/
> ++  unsigned int minimum_rep_movsb_threshold;
> ++  /* NB: The default REP MOVSB threshold is 2048 * (VEC_SIZE / 16).  *=
/
> ++  unsigned int rep_movsb_threshold;
> ++  if (CPU_FEATURE_USABLE_P (cpu_features, AVX512F)
> ++      && !CPU_FEATURE_PREFERRED_P (cpu_features, Prefer_No_AVX512))
> ++    {
> ++      rep_movsb_threshold =3D 2048 * (64 / 16);
> ++      minimum_rep_movsb_threshold =3D 64 * 8;
> ++    }
> ++  else if (CPU_FEATURE_PREFERRED_P (cpu_features,
> ++     AVX_Fast_Unaligned_Load))
> ++    {
> ++      rep_movsb_threshold =3D 2048 * (32 / 16);
> ++      minimum_rep_movsb_threshold =3D 32 * 8;
> ++    }
> ++  else
> ++    {
> ++      rep_movsb_threshold =3D 2048 * (16 / 16);
> ++      minimum_rep_movsb_threshold =3D 16 * 8;
> ++    }
> ++  if (cpu_features->rep_movsb_threshold > minimum_rep_movsb_threshold)
> ++    __x86_rep_movsb_threshold =3D cpu_features->rep_movsb_threshold;
> ++  else
> ++    __x86_rep_movsb_threshold =3D rep_movsb_threshold;
> +=20
> +-  __x86_rep_movsb_threshold =3D cpu_features->rep_movsb_threshold;
> ++# if HAVE_TUNABLES
> +   __x86_rep_stosb_threshold =3D cpu_features->rep_stosb_threshold;
> ++# endif
> + }
> +-#endif
> +diff --git a/sysdeps/x86/cpu-features.c b/sysdeps/x86/cpu-features.c
> +index 73b0a4dc9a..c9e51b5e5a 100644
> +--- a/sysdeps/x86/cpu-features.c
> ++++ b/sysdeps/x86/cpu-features.c
> +@@ -16,13 +16,22 @@
> +    License along with the GNU C Library; if not, see
> +    <https://www.gnu.org/licenses/>.  */
> +=20
> ++#include <cpuid.h>
> + #include <dl-hwcap.h>
> + #include <libc-pointer-arith.h>
> + #include <get-isa-level.h>
> +-#include <cacheinfo.h>
> +-#include <dl-cacheinfo.h>
> ++#if IS_IN (libc) && !defined SHARED
> ++# include <assert.h>
> ++# include <unistd.h>
> ++# include <dl-cacheinfo.h>
> ++# include <cacheinfo.h>
> ++#endif
> +=20
> + #if HAVE_TUNABLES
> ++# define TUNABLE_NAMESPACE cpu
> ++# include <unistd.h> /* Get STDOUT_FILENO for _dl_printf.  */
> ++# include <elf/dl-tunables.h>
> ++
> + extern void TUNABLE_CALLBACK (set_hwcaps) (tunable_val_t *)
> +   attribute_hidden;
> +=20
> +@@ -639,14 +648,24 @@ no_cpuid:
> +   cpu_features->basic.model =3D model;
> +   cpu_features->basic.stepping =3D stepping;
> +=20
> +-  dl_init_cacheinfo (cpu_features);
> +-
> + #if HAVE_TUNABLES
> +   TUNABLE_GET (hwcaps, tunable_val_t *, TUNABLE_CALLBACK (set_hwcaps))=
;
> +-#elif defined SHARED
> +-  /* Reuse dl_platform, dl_hwcap and dl_hwcap_mask for x86.  The
> +-     glibc.cpu.hwcap_mask tunable is initialized already, so no
> +-     need to do this.  */
> ++  cpu_features->non_temporal_threshold
> ++    =3D TUNABLE_GET (x86_non_temporal_threshold, long int, NULL);
> ++  cpu_features->rep_movsb_threshold
> ++    =3D TUNABLE_GET (x86_rep_movsb_threshold, long int, NULL);
> ++  cpu_features->rep_stosb_threshold
> ++    =3D TUNABLE_GET (x86_rep_stosb_threshold, long int, NULL);
> ++  cpu_features->data_cache_size
> ++    =3D TUNABLE_GET (x86_data_cache_size, long int, NULL);
> ++  cpu_features->shared_cache_size
> ++    =3D TUNABLE_GET (x86_shared_cache_size, long int, NULL);
> ++#endif
> ++
> ++  /* Reuse dl_platform, dl_hwcap and dl_hwcap_mask for x86.  */
> ++#if !HAVE_TUNABLES && defined SHARED
> ++  /* The glibc.cpu.hwcap_mask tunable is initialized already, so no ne=
ed to do
> ++     this.  */
> +   GLRO(dl_hwcap_mask) =3D HWCAP_IMPORTANT;
> + #endif
> +=20
> +diff --git a/sysdeps/x86/dl-cacheinfo.h b/sysdeps/x86/dl-cacheinfo.h
> +index a31fa0783a..6adce4147c 100644
> +--- a/sysdeps/x86/dl-cacheinfo.h
> ++++ b/sysdeps/x86/dl-cacheinfo.h
> +@@ -476,463 +476,3 @@ handle_zhaoxin (int name)
> +   /* Nothing found.  */
> +   return 0;
> + }
> +-
> +-static void
> +-get_common_cache_info (long int *shared_ptr, unsigned int *threads_ptr=
,
> +-                long int core)
> +-{
> +-  unsigned int eax;
> +-  unsigned int ebx;
> +-  unsigned int ecx;
> +-  unsigned int edx;
> +-
> +-  /* Number of logical processors sharing L2 cache.  */
> +-  int threads_l2;
> +-
> +-  /* Number of logical processors sharing L3 cache.  */
> +-  int threads_l3;
> +-
> +-  const struct cpu_features *cpu_features =3D __get_cpu_features ();
> +-  int max_cpuid =3D cpu_features->basic.max_cpuid;
> +-  unsigned int family =3D cpu_features->basic.family;
> +-  unsigned int model =3D cpu_features->basic.model;
> +-  long int shared =3D *shared_ptr;
> +-  unsigned int threads =3D *threads_ptr;
> +-  bool inclusive_cache =3D true;
> +-  bool support_count_mask =3D true;
> +-
> +-  /* Try L3 first.  */
> +-  unsigned int level =3D 3;
> +-
> +-  if (cpu_features->basic.kind =3D=3D arch_kind_zhaoxin && family =3D=
=3D 6)
> +-    support_count_mask =3D false;
> +-
> +-  if (shared <=3D 0)
> +-    {
> +-      /* Try L2 otherwise.  */
> +-      level  =3D 2;
> +-      shared =3D core;
> +-      threads_l2 =3D 0;
> +-      threads_l3 =3D -1;
> +-    }
> +-  else
> +-    {
> +-      threads_l2 =3D 0;
> +-      threads_l3 =3D 0;
> +-    }
> +-
> +-  /* A value of 0 for the HTT bit indicates there is only a single
> +-     logical processor.  */
> +-  if (HAS_CPU_FEATURE (HTT))
> +-    {
> +-      /* Figure out the number of logical threads that share the
> +-         highest cache level.  */
> +-      if (max_cpuid >=3D 4)
> +-        {
> +-          int i =3D 0;
> +-
> +-          /* Query until cache level 2 and 3 are enumerated.  */
> +-          int check =3D 0x1 | (threads_l3 =3D=3D 0) << 1;
> +-          do
> +-            {
> +-              __cpuid_count (4, i++, eax, ebx, ecx, edx);
> +-
> +-              /* There seems to be a bug in at least some Pentium Ds
> +-                 which sometimes fail to iterate all cache parameters.
> +-                 Do not loop indefinitely here, stop in this case and
> +-                 assume there is no such information.  */
> +-              if (cpu_features->basic.kind =3D=3D arch_kind_intel
> +-                  && (eax & 0x1f) =3D=3D 0 )
> +-                goto intel_bug_no_cache_info;
> +-
> +-              switch ((eax >> 5) & 0x7)
> +-                {
> +-                  default:
> +-                    break;
> +-                  case 2:
> +-                    if ((check & 0x1))
> +-                      {
> +-                        /* Get maximum number of logical processors
> +-                           sharing L2 cache.  */
> +-                        threads_l2 =3D (eax >> 14) & 0x3ff;
> +-                        check &=3D ~0x1;
> +-                      }
> +-                    break;
> +-                  case 3:
> +-                    if ((check & (0x1 << 1)))
> +-                      {
> +-                        /* Get maximum number of logical processors
> +-                           sharing L3 cache.  */
> +-                        threads_l3 =3D (eax >> 14) & 0x3ff;
> +-
> +-                        /* Check if L2 and L3 caches are inclusive.  *=
/
> +-                        inclusive_cache =3D (edx & 0x2) !=3D 0;
> +-                        check &=3D ~(0x1 << 1);
> +-                      }
> +-                    break;
> +-                }
> +-            }
> +-          while (check);
> +-
> +-          /* If max_cpuid >=3D 11, THREADS_L2/THREADS_L3 are the maxim=
um
> +-             numbers of addressable IDs for logical processors sharing
> +-             the cache, instead of the maximum number of threads
> +-             sharing the cache.  */
> +-          if (max_cpuid >=3D 11 && support_count_mask)
> +-            {
> +-              /* Find the number of logical processors shipped in
> +-                 one core and apply count mask.  */
> +-              i =3D 0;
> +-
> +-              /* Count SMT only if there is L3 cache.  Always count
> +-                 core if there is no L3 cache.  */
> +-              int count =3D ((threads_l2 > 0 && level =3D=3D 3)
> +-                           | ((threads_l3 > 0
> +-                               || (threads_l2 > 0 && level =3D=3D 2)) =
<< 1));
> +-
> +-              while (count)
> +-                {
> +-                  __cpuid_count (11, i++, eax, ebx, ecx, edx);
> +-
> +-                  int shipped =3D ebx & 0xff;
> +-                  int type =3D ecx & 0xff00;
> +-                  if (shipped =3D=3D 0 || type =3D=3D 0)
> +-                    break;
> +-                  else if (type =3D=3D 0x100)
> +-                    {
> +-                      /* Count SMT.  */
> +-                      if ((count & 0x1))
> +-                        {
> +-                          int count_mask;
> +-
> +-                          /* Compute count mask.  */
> +-                          asm ("bsr %1, %0"
> +-                               : "=3Dr" (count_mask) : "g" (threads_l2=
));
> +-                          count_mask =3D ~(-1 << (count_mask + 1));
> +-                          threads_l2 =3D (shipped - 1) & count_mask;
> +-                          count &=3D ~0x1;
> +-                        }
> +-                    }
> +-                  else if (type =3D=3D 0x200)
> +-                    {
> +-                      /* Count core.  */
> +-                      if ((count & (0x1 << 1)))
> +-                        {
> +-                          int count_mask;
> +-                          int threads_core
> +-                            =3D (level =3D=3D 2 ? threads_l2 : threads=
_l3);
> +-
> +-                          /* Compute count mask.  */
> +-                          asm ("bsr %1, %0"
> +-                               : "=3Dr" (count_mask) : "g" (threads_co=
re));
> +-                          count_mask =3D ~(-1 << (count_mask + 1));
> +-                          threads_core =3D (shipped - 1) & count_mask;
> +-                          if (level =3D=3D 2)
> +-                            threads_l2 =3D threads_core;
> +-                          else
> +-                            threads_l3 =3D threads_core;
> +-                          count &=3D ~(0x1 << 1);
> +-                        }
> +-                    }
> +-                }
> +-            }
> +-          if (threads_l2 > 0)
> +-            threads_l2 +=3D 1;
> +-          if (threads_l3 > 0)
> +-            threads_l3 +=3D 1;
> +-          if (level =3D=3D 2)
> +-            {
> +-              if (threads_l2)
> +-                {
> +-                  threads =3D threads_l2;
> +-                  if (cpu_features->basic.kind =3D=3D arch_kind_intel
> +-                      && threads > 2
> +-                      && family =3D=3D 6)
> +-                    switch (model)
> +-                      {
> +-                        case 0x37:
> +-                        case 0x4a:
> +-                        case 0x4d:
> +-                        case 0x5a:
> +-                        case 0x5d:
> +-                          /* Silvermont has L2 cache shared by 2 cores=
.  */
> +-                          threads =3D 2;
> +-                          break;
> +-                        default:
> +-                          break;
> +-                      }
> +-                }
> +-            }
> +-          else if (threads_l3)
> +-            threads =3D threads_l3;
> +-        }
> +-      else
> +-        {
> +-intel_bug_no_cache_info:
> +-          /* Assume that all logical threads share the highest cache
> +-             level.  */
> +-          threads
> +-            =3D ((cpu_features->features[CPUID_INDEX_1].cpuid.ebx >> 1=
6)
> +-        & 0xff);
> +-        }
> +-
> +-        /* Cap usage of highest cache level to the number of supported
> +-           threads.  */
> +-        if (shared > 0 && threads > 0)
> +-          shared /=3D threads;
> +-    }
> +-
> +-  /* Account for non-inclusive L2 and L3 caches.  */
> +-  if (!inclusive_cache)
> +-    {
> +-      if (threads_l2 > 0)
> +-        core /=3D threads_l2;
> +-      shared +=3D core;
> +-    }
> +-
> +-  *shared_ptr =3D shared;
> +-  *threads_ptr =3D threads;
> +-}
> +-
> +-static void
> +-dl_init_cacheinfo (struct cpu_features *cpu_features)
> +-{
> +-  /* Find out what brand of processor.  */
> +-  unsigned int ebx;
> +-  unsigned int ecx;
> +-  unsigned int edx;
> +-  int max_cpuid_ex;
> +-  long int data =3D -1;
> +-  long int shared =3D -1;
> +-  long int core;
> +-  unsigned int threads =3D 0;
> +-  unsigned long int level1_icache_size =3D -1;
> +-  unsigned long int level1_dcache_size =3D -1;
> +-  unsigned long int level1_dcache_assoc =3D -1;
> +-  unsigned long int level1_dcache_linesize =3D -1;
> +-  unsigned long int level2_cache_size =3D -1;
> +-  unsigned long int level2_cache_assoc =3D -1;
> +-  unsigned long int level2_cache_linesize =3D -1;
> +-  unsigned long int level3_cache_size =3D -1;
> +-  unsigned long int level3_cache_assoc =3D -1;
> +-  unsigned long int level3_cache_linesize =3D -1;
> +-  unsigned long int level4_cache_size =3D -1;
> +-
> +-  if (cpu_features->basic.kind =3D=3D arch_kind_intel)
> +-    {
> +-      data =3D handle_intel (_SC_LEVEL1_DCACHE_SIZE, cpu_features);
> +-      core =3D handle_intel (_SC_LEVEL2_CACHE_SIZE, cpu_features);
> +-      shared =3D handle_intel (_SC_LEVEL3_CACHE_SIZE, cpu_features);
> +-
> +-      level1_icache_size
> +- =3D handle_intel (_SC_LEVEL1_ICACHE_SIZE, cpu_features);
> +-      level1_dcache_size =3D data;
> +-      level1_dcache_assoc
> +- =3D handle_intel (_SC_LEVEL1_DCACHE_ASSOC, cpu_features);
> +-      level1_dcache_linesize
> +- =3D handle_intel (_SC_LEVEL1_DCACHE_LINESIZE, cpu_features);
> +-      level2_cache_size =3D core;
> +-      level2_cache_assoc
> +- =3D handle_intel (_SC_LEVEL2_CACHE_ASSOC, cpu_features);
> +-      level2_cache_linesize
> +- =3D handle_intel (_SC_LEVEL2_CACHE_LINESIZE, cpu_features);
> +-      level3_cache_size =3D shared;
> +-      level3_cache_assoc
> +- =3D handle_intel (_SC_LEVEL3_CACHE_ASSOC, cpu_features);
> +-      level3_cache_linesize
> +- =3D handle_intel (_SC_LEVEL3_CACHE_LINESIZE, cpu_features);
> +-      level4_cache_size
> +- =3D handle_intel (_SC_LEVEL4_CACHE_SIZE, cpu_features);
> +-
> +-      get_common_cache_info (&shared, &threads, core);
> +-    }
> +-  else if (cpu_features->basic.kind =3D=3D arch_kind_zhaoxin)
> +-    {
> +-      data =3D handle_zhaoxin (_SC_LEVEL1_DCACHE_SIZE);
> +-      core =3D handle_zhaoxin (_SC_LEVEL2_CACHE_SIZE);
> +-      shared =3D handle_zhaoxin (_SC_LEVEL3_CACHE_SIZE);
> +-
> +-      level1_icache_size =3D handle_zhaoxin (_SC_LEVEL1_ICACHE_SIZE);
> +-      level1_dcache_size =3D data;
> +-      level1_dcache_assoc =3D handle_zhaoxin (_SC_LEVEL1_DCACHE_ASSOC)=
;
> +-      level1_dcache_linesize =3D handle_zhaoxin (_SC_LEVEL1_DCACHE_LIN=
ESIZE);
> +-      level2_cache_size =3D core;
> +-      level2_cache_assoc =3D handle_zhaoxin (_SC_LEVEL2_CACHE_ASSOC);
> +-      level2_cache_linesize =3D handle_zhaoxin (_SC_LEVEL2_CACHE_LINES=
IZE);
> +-      level3_cache_size =3D shared;
> +-      level3_cache_assoc =3D handle_zhaoxin (_SC_LEVEL3_CACHE_ASSOC);
> +-      level3_cache_linesize =3D handle_zhaoxin (_SC_LEVEL3_CACHE_LINES=
IZE);
> +-
> +-      get_common_cache_info (&shared, &threads, core);
> +-    }
> +-  else if (cpu_features->basic.kind =3D=3D arch_kind_amd)
> +-    {
> +-      data  =3D handle_amd (_SC_LEVEL1_DCACHE_SIZE);
> +-      core =3D handle_amd (_SC_LEVEL2_CACHE_SIZE);
> +-      shared =3D handle_amd (_SC_LEVEL3_CACHE_SIZE);
> +-
> +-      level1_icache_size =3D handle_amd (_SC_LEVEL1_ICACHE_SIZE);
> +-      level1_dcache_size =3D data;
> +-      level1_dcache_assoc =3D handle_amd (_SC_LEVEL1_DCACHE_ASSOC);
> +-      level1_dcache_linesize =3D handle_amd (_SC_LEVEL1_DCACHE_LINESIZ=
E);
> +-      level2_cache_size =3D core;
> +-      level2_cache_assoc =3D handle_amd (_SC_LEVEL2_CACHE_ASSOC);
> +-      level2_cache_linesize =3D handle_amd (_SC_LEVEL2_CACHE_LINESIZE)=
;
> +-      level3_cache_size =3D shared;
> +-      level3_cache_assoc =3D handle_amd (_SC_LEVEL3_CACHE_ASSOC);
> +-      level3_cache_linesize =3D handle_amd (_SC_LEVEL3_CACHE_LINESIZE)=
;
> +-
> +-      /* Get maximum extended function. */
> +-      __cpuid (0x80000000, max_cpuid_ex, ebx, ecx, edx);
> +-
> +-      if (shared <=3D 0)
> +- /* No shared L3 cache.  All we have is the L2 cache.  */
> +- shared =3D core;
> +-      else
> +- {
> +-   /* Figure out the number of logical threads that share L3.  */
> +-   if (max_cpuid_ex >=3D 0x80000008)
> +-     {
> +-       /* Get width of APIC ID.  */
> +-       __cpuid (0x80000008, max_cpuid_ex, ebx, ecx, edx);
> +-       threads =3D 1 << ((ecx >> 12) & 0x0f);
> +-     }
> +-
> +-   if (threads =3D=3D 0 || cpu_features->basic.family >=3D 0x17)
> +-     {
> +-       /* If APIC ID width is not available, use logical
> +- processor count.  */
> +-       __cpuid (0x00000001, max_cpuid_ex, ebx, ecx, edx);
> +-
> +-       if ((edx & (1 << 28)) !=3D 0)
> +- threads =3D (ebx >> 16) & 0xff;
> +-     }
> +-
> +-   /* Cap usage of highest cache level to the number of
> +-      supported threads.  */
> +-   if (threads > 0)
> +-     shared /=3D threads;
> +-
> +-   /* Get shared cache per ccx for Zen architectures.  */
> +-   if (cpu_features->basic.family >=3D 0x17)
> +-     {
> +-       unsigned int eax;
> +-
> +-       /* Get number of threads share the L3 cache in CCX.  */
> +-       __cpuid_count (0x8000001D, 0x3, eax, ebx, ecx, edx);
> +-
> +-       unsigned int threads_per_ccx =3D ((eax >> 14) & 0xfff) + 1;
> +-       shared *=3D threads_per_ccx;
> +-     }
> +-   else
> +-     {
> +-       /* Account for exclusive L2 and L3 caches.  */
> +-       shared +=3D core;
> +-            }
> +- }
> +-    }
> +-
> +-  cpu_features->level1_icache_size =3D level1_icache_size;
> +-  cpu_features->level1_dcache_size =3D level1_dcache_size;
> +-  cpu_features->level1_dcache_assoc =3D level1_dcache_assoc;
> +-  cpu_features->level1_dcache_linesize =3D level1_dcache_linesize;
> +-  cpu_features->level2_cache_size =3D level2_cache_size;
> +-  cpu_features->level2_cache_assoc =3D level2_cache_assoc;
> +-  cpu_features->level2_cache_linesize =3D level2_cache_linesize;
> +-  cpu_features->level3_cache_size =3D level3_cache_size;
> +-  cpu_features->level3_cache_assoc =3D level3_cache_assoc;
> +-  cpu_features->level3_cache_linesize =3D level3_cache_linesize;
> +-  cpu_features->level4_cache_size =3D level4_cache_size;
> +-
> +-  /* The default setting for the non_temporal threshold is 3/4 of one
> +-     thread's share of the chip's cache. For most Intel and AMD proces=
sors
> +-     with an initial release date between 2017 and 2020, a thread's ty=
pical
> +-     share of the cache is from 500 KBytes to 2 MBytes. Using the 3/4
> +-     threshold leaves 125 KBytes to 500 KBytes of the thread's data
> +-     in cache after a maximum temporal copy, which will maintain
> +-     in cache a reasonable portion of the thread's stack and other
> +-     active data. If the threshold is set higher than one thread's
> +-     share of the cache, it has a substantial risk of negatively
> +-     impacting the performance of other threads running on the chip. *=
/
> +-  unsigned long int non_temporal_threshold =3D shared * 3 / 4;
> +-
> +-#if HAVE_TUNABLES
> +-  /* NB: The REP MOVSB threshold must be greater than VEC_SIZE * 8.  *=
/
> +-  unsigned int minimum_rep_movsb_threshold;
> +-#endif
> +-  /* NB: The default REP MOVSB threshold is 2048 * (VEC_SIZE / 16).  *=
/
> +-  unsigned int rep_movsb_threshold;
> +-  if (CPU_FEATURE_USABLE_P (cpu_features, AVX512F)
> +-      && !CPU_FEATURE_PREFERRED_P (cpu_features, Prefer_No_AVX512))
> +-    {
> +-      rep_movsb_threshold =3D 2048 * (64 / 16);
> +-#if HAVE_TUNABLES
> +-      minimum_rep_movsb_threshold =3D 64 * 8;
> +-#endif
> +-    }
> +-  else if (CPU_FEATURE_PREFERRED_P (cpu_features,
> +-     AVX_Fast_Unaligned_Load))
> +-    {
> +-      rep_movsb_threshold =3D 2048 * (32 / 16);
> +-#if HAVE_TUNABLES
> +-      minimum_rep_movsb_threshold =3D 32 * 8;
> +-#endif
> +-    }
> +-  else
> +-    {
> +-      rep_movsb_threshold =3D 2048 * (16 / 16);
> +-#if HAVE_TUNABLES
> +-      minimum_rep_movsb_threshold =3D 16 * 8;
> +-#endif
> +-    }
> +-
> +-  /* The default threshold to use Enhanced REP STOSB.  */
> +-  unsigned long int rep_stosb_threshold =3D 2048;
> +-
> +-#if HAVE_TUNABLES
> +-  long int tunable_size;
> +-
> +-  tunable_size =3D TUNABLE_GET (x86_data_cache_size, long int, NULL);
> +-  /* NB: Ignore the default value 0.  */
> +-  if (tunable_size !=3D 0)
> +-    data =3D tunable_size;
> +-
> +-  tunable_size =3D TUNABLE_GET (x86_shared_cache_size, long int, NULL)=
;
> +-  /* NB: Ignore the default value 0.  */
> +-  if (tunable_size !=3D 0)
> +-    shared =3D tunable_size;
> +-
> +-  tunable_size =3D TUNABLE_GET (x86_non_temporal_threshold, long int, =
NULL);
> +-  /* NB: Ignore the default value 0.  */
> +-  if (tunable_size !=3D 0)
> +-    non_temporal_threshold =3D tunable_size;
> +-
> +-  tunable_size =3D TUNABLE_GET (x86_rep_movsb_threshold, long int, NUL=
L);
> +-  if (tunable_size > minimum_rep_movsb_threshold)
> +-    rep_movsb_threshold =3D tunable_size;
> +-
> +-  /* NB: The default value of the x86_rep_stosb_threshold tunable is t=
he
> +-     same as the default value of __x86_rep_stosb_threshold and the
> +-     minimum value is fixed.  */
> +-  rep_stosb_threshold =3D TUNABLE_GET (x86_rep_stosb_threshold,
> +-      long int, NULL);
> +-
> +-  TUNABLE_SET_WITH_BOUNDS (x86_data_cache_size, long int, data,
> +-    0, (long int) -1);
> +-  TUNABLE_SET_WITH_BOUNDS (x86_shared_cache_size, long int, shared,
> +-    0, (long int) -1);
> +-  TUNABLE_SET_WITH_BOUNDS (x86_non_temporal_threshold, long int,
> +-    non_temporal_threshold, 0, (long int) -1);
> +-  TUNABLE_SET_WITH_BOUNDS (x86_rep_movsb_threshold, long int,
> +-    rep_movsb_threshold,
> +-    minimum_rep_movsb_threshold, (long int) -1);
> +-  TUNABLE_SET_WITH_BOUNDS (x86_rep_stosb_threshold, long int,
> +-    rep_stosb_threshold, 1, (long int) -1);
> +-#endif
> +-
> +-  cpu_features->data_cache_size =3D data;
> +-  cpu_features->shared_cache_size =3D shared;
> +-  cpu_features->non_temporal_threshold =3D non_temporal_threshold;
> +-  cpu_features->rep_movsb_threshold =3D rep_movsb_threshold;
> +-  cpu_features->rep_stosb_threshold =3D rep_stosb_threshold;
> +-}
> +diff --git a/sysdeps/x86/include/cpu-features.h b/sysdeps/x86/include/c=
pu-features.h
> +index 624736b40e..fb02f0607b 100644
> +--- a/sysdeps/x86/include/cpu-features.h
> ++++ b/sysdeps/x86/include/cpu-features.h
> +@@ -872,28 +872,6 @@ struct cpu_features
> +   unsigned long int rep_movsb_threshold;
> +   /* Threshold to use "rep stosb".  */
> +   unsigned long int rep_stosb_threshold;
> +-  /* _SC_LEVEL1_ICACHE_SIZE.  */
> +-  unsigned long int level1_icache_size;
> +-  /* _SC_LEVEL1_DCACHE_SIZE.  */
> +-  unsigned long int level1_dcache_size;
> +-  /* _SC_LEVEL1_DCACHE_ASSOC.  */
> +-  unsigned long int level1_dcache_assoc;
> +-  /* _SC_LEVEL1_DCACHE_LINESIZE.  */
> +-  unsigned long int level1_dcache_linesize;
> +-  /* _SC_LEVEL2_CACHE_ASSOC.  */
> +-  unsigned long int level2_cache_size;
> +-  /* _SC_LEVEL2_DCACHE_ASSOC.  */
> +-  unsigned long int level2_cache_assoc;
> +-  /* _SC_LEVEL2_CACHE_LINESIZE.  */
> +-  unsigned long int level2_cache_linesize;
> +-  /* /_SC_LEVEL3_CACHE_SIZE.  */
> +-  unsigned long int level3_cache_size;
> +-  /* _SC_LEVEL3_CACHE_ASSOC.  */
> +-  unsigned long int level3_cache_assoc;
> +-  /* _SC_LEVEL3_CACHE_LINESIZE.  */
> +-  unsigned long int level3_cache_linesize;
> +-  /* /_SC_LEVEL4_CACHE_SIZE.  */
> +-  unsigned long int level4_cache_size;
> + };
> +=20
> + /* Get a pointer to the CPU features structure.  */
> diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/g=
libc/glibc_2.33.bb
> index e0002e6046..dd4087f80b 100644
> --- a/meta/recipes-core/glibc/glibc_2.33.bb
> +++ b/meta/recipes-core/glibc/glibc_2.33.bb
> @@ -15,11 +15,10 @@ NATIVESDKFIXES_class-nativesdk =3D "\
>             file://faccessat2-perm.patch \
> "
>  
> -SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=3Dglibc \
> +SRC_URI =3D "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=3Dglibc \
>             file://etc/ld.so.conf \
>             file://generate-supported.mk \
>             file://makedbs.sh \
> -           \
>             ${NATIVESDKFIXES} \
>             file://0008-fsl-e500-e5500-e6500-603e-fsqrt-implementation.p=
atch \
>             file://0009-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finit=
e.patch \
> @@ -44,6 +43,7 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};n=
ame=3Dglibc \
>             file://0029-wordsize.h-Unify-the-header-between-arm-and-aarc=
h64.patch \
>             file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.pat=
ch \
>             file://0031-x86-Require-full-ISA-support-for-x86-64-level-ma=
rker.patch \
> +           file://0032-Revert-x86-Move-x86-processor-cache-info-to-cpu_=
feat.patch \
>             "
> S =3D "${WORKDIR}/git"
> B =3D "${WORKDIR}/build-${TARGET_SYS}"
> --=20
> 2.30.1
>=20
>=20
>=20
>=20
>=20
>=20

--ee7ab90d0f784260aa6cc2310d81e97f
Content-Type: text/html;charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title><style type=3D"text/css">p.MsoNor=
mal,p.MsoNoSpacing{margin:0}</style></head><body><div>Superseded by <a href=
=
=3D"https://lists.openembedded.org/g/openembedded-core/message/149192">htt=
ps://lists.openembedded.org/g/openembedded-core/message/149192</a><br></div=
><div>---<br></div><div>Andrei<br></div><div><br></div><div>On Fri, 19 Feb =
2021, at 23:53, Andrei Gherzan wrote:<br></div><blockquote type=3D"cite" id=
=
=3D"qt" style=3D""><div>From: Andrei Gherzan &lt;<a href=3D"mailto:andrei.=
gherzan@huawei.com">andrei.gherzan@huawei.com</a>&gt;<br></div><div><br></d=
iv><div>It was observerd that with glibc 2.33, sysconf reports unsupported<=
br></div><div>option (-1) for _SC_LEVEL1_ICACHE_LINESIZE.<br></div><div><br=
></div><div>This can be reproduced with sysconf tool:<br></div><div><br></d=
iv><div>```<br></div><div>=E2=94=94=E2=94=80=E2=9D=AF&nbsp; docker run -ti =
--rm archlinux:base-20210214.0.15477 getconf -a |<br></div><div>grep "GNU_L=
IBC_VERSION\|LEVEL1_ICACHE_LINESIZE"<br></div><div>GNU_LIBC_VERSION&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; glibc 2.33<br></div><div>LEVEL1_ICACHE_LINESIZE<b=
r></div><div>=E2=94=94=E2=94=80=E2=9D=AF&nbsp; docker run -ti --rm archlinu=
x:base-20210131.0.14634 getconf -a |<br></div><div>grep "GNU_LIBC_VERSION\|=
LEVEL1_ICACHE_LINESIZE"<br></div><div>GNU_LIBC_VERSION&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; glibc 2.32<br></div><div>LEVEL1_ICACHE_LINESIZE&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 64<br></div><div>=
```<br></div><div><br></div><div>The offending patch in glibc is:<br></div>=
<div><br></div><div>commit 2d651eb9265d1366d7b9e881bfddd46db9c1ecc4<br></di=
v><div>Author: H.J. Lu &lt;<a href=3D"mailto:hjl.tools@gmail.com">hjl.tools=
@gmail.com</a>&gt;<br></div><div>Date:&nbsp;&nbsp; Fri Sep 18 07:55:14 2020=
 -0700<br></div><div>&nbsp;&nbsp;&nbsp; x86: Move x86 processor cache info =
to cpu_features<br></div><div><br></div><div>This patch reverts the above m=
entioned glibc change. It was tested on<br></div><div>qemux86.<br></div><di=
v><br></div><div>Extra small cosmetic tweaks brought you by devtool (a supe=
rflous newline<br></div><div>and whitespace).<br></div><div><br></div><div>=
Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei.gherzan@huawei.c=
om">andrei.gherzan@huawei.com</a>&gt;<br></div><div>---<br></div><div>...x8=
6-processor-cache-info-to-cpu_feat.patch | 1074 +++++++++++++++++<br></div>=
<div>meta/recipes-core/glibc/glibc_2.33.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; 4 +-<br></div><div>2 files changed, 107=
6 insertions(+), 2 deletions(-)<br></div><div>create mode 100644 meta/recip=
es-core/glibc/glibc/0032-Revert-x86-Move-x86-processor-cache-info-to-cpu_fe=
at.patch<br></div><div><br></div><div>diff --git a/meta/recipes-core/glibc/=
glibc/0032-Revert-x86-Move-x86-processor-cache-info-to-cpu_feat.patch b/met=
a/recipes-core/glibc/glibc/0032-Revert-x86-Move-x86-processor-cache-info-to=
-cpu_feat.patch<br></div><div>new file mode 100644<br></div><div>index 0000=
000000..0ff1eba82b<br></div><div>--- /dev/null<br></div><div>+++ b/meta/rec=
ipes-core/glibc/glibc/0032-Revert-x86-Move-x86-processor-cache-info-to-cpu_=
feat.patch<br></div><div>@@ -0,0 +1,1074 @@<br></div><div>+From 961d681e38d=
30a4de06c980de0a96464fa3b4d74 Mon Sep 17 00:00:00 2001<br></div><div>+From:=
 Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.com">andrei@gherzan.co=
m</a>&gt;<br></div><div>+Date: Fri, 19 Feb 2021 23:06:50 +0000<br></div><di=
v>+Subject: [PATCH] Revert "x86: Move x86 processor cache info to cpu_featu=
res"<br></div><div>+<br></div><div>+This reverts commit 2d651eb9265d1366d7b=
9e881bfddd46db9c1ecc4.<br></div><div>+<br></div><div>+Upstream-Status: Pend=
ing<br></div><div>+Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andr=
ei.gherzan@huawei.com">andrei.gherzan@huawei.com</a>&gt;<br></div><div>+---=
<br></div><div>+ sysdeps/x86/cacheinfo.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 46 +--<br></div><div>+ sysdeps/x86/=
cacheinfo.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; | 400 +++++++++++++++++++++++--<br></div><div>+ sysdeps/x86/cpu-features=
.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 35 ++-<br></div>=
<div>+ sysdeps/x86/dl-cacheinfo.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; | 460 -----------------------------<br></div><div>+ sysdeps/x86/incl=
ude/cpu-features.h |&nbsp; 22 --<br></div><div>+ 5 files changed, 412 inser=
tions(+), 551 deletions(-)<br></div><div>+<br></div><div>+diff --git a/sysd=
eps/x86/cacheinfo.c b/sysdeps/x86/cacheinfo.c<br></div><div>+index 7b8df45e=
3b..948dbea3db 100644<br></div><div>+--- a/sysdeps/x86/cacheinfo.c<br></div=
><div>++++ b/sysdeps/x86/cacheinfo.c<br></div><div>+@@ -18,8 +18,11 @@<br><=
/div><div>+&nbsp;<br></div><div>+ #if IS_IN (libc)<br></div><div>+&nbsp;<br=
></div><div>++#include &lt;assert.h&gt;<br></div><div>+ #include &lt;unistd=
.h&gt;<br></div><div>++#include &lt;cpuid.h&gt;<br></div><div>+ #include &l=
t;ldsodefs.h&gt;<br></div><div>++#include &lt;dl-cacheinfo.h&gt;<br></div><=
div>+&nbsp;<br></div><div>+ /* Get the value of the system variable NAME.&n=
bsp; */<br></div><div>+ long int<br></div><div>+@@ -27,45 +30,20 @@ attribu=
te_hidden<br></div><div>+ __cache_sysconf (int name)<br></div><div>+ {<br><=
/div><div>+&nbsp;&nbsp; const struct cpu_features *cpu_features =3D __get_c=
pu_features ();<br></div><div>+-&nbsp; switch (name)<br></div><div>+-&nbsp;=
&nbsp;&nbsp; {<br></div><div>+-&nbsp;&nbsp;&nbsp; case _SC_LEVEL1_ICACHE_SI=
ZE:<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return cpu_features-&gt;=
level1_icache_size;<br></div><div>+&nbsp;<br></div><div>+-&nbsp;&nbsp;&nbsp=
; case _SC_LEVEL1_DCACHE_SIZE:<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; return cpu_features-&gt;level1_dcache_size;<br></div><div>++&nbsp; if (c=
pu_features-&gt;basic.kind =3D=3D arch_kind_intel)<br></div><div>++&nbsp;&n=
bsp;&nbsp; return handle_intel (name, cpu_features);<br></div><div>+&nbsp;<=
br></div><div>+-&nbsp;&nbsp;&nbsp; case _SC_LEVEL1_DCACHE_ASSOC:<br></div><=
div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return cpu_features-&gt;level1_dcache_=
assoc;<br></div><div>++&nbsp; if (cpu_features-&gt;basic.kind =3D=3D arch_k=
ind_amd)<br></div><div>++&nbsp;&nbsp;&nbsp; return handle_amd (name);<br></=
div><div>+&nbsp;<br></div><div>+-&nbsp;&nbsp;&nbsp; case _SC_LEVEL1_DCACHE_=
LINESIZE:<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return cpu_feature=
s-&gt;level1_dcache_linesize;<br></div><div>++&nbsp; if (cpu_features-&gt;b=
asic.kind =3D=3D arch_kind_zhaoxin)<br></div><div>++&nbsp;&nbsp;&nbsp; retu=
rn handle_zhaoxin (name);<br></div><div>+&nbsp;<br></div><div>+-&nbsp;&nbsp=
;&nbsp; case _SC_LEVEL2_CACHE_SIZE:<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return cpu_features-&gt;level2_cache_size;<br></div><div>++&nbsp; /=
/ XXX Fill in more vendors.<br></div><div>+&nbsp;<br></div><div>+-&nbsp;&nb=
sp;&nbsp; case _SC_LEVEL2_CACHE_ASSOC:<br></div><div>+-&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return cpu_features-&gt;level2_cache_assoc;<br></div><div>+-<br>=
</div><div>+-&nbsp;&nbsp;&nbsp; case _SC_LEVEL2_CACHE_LINESIZE:<br></div><d=
iv>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return cpu_features-&gt;level2_cache_li=
nesize;<br></div><div>+-<br></div><div>+-&nbsp;&nbsp;&nbsp; case _SC_LEVEL3=
_CACHE_SIZE:<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return cpu_feat=
ures-&gt;level3_cache_size;<br></div><div>+-<br></div><div>+-&nbsp;&nbsp;&n=
bsp; case _SC_LEVEL3_CACHE_ASSOC:<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return cpu_features-&gt;level3_cache_assoc;<br></div><div>+-<br></div=
><div>+-&nbsp;&nbsp;&nbsp; case _SC_LEVEL3_CACHE_LINESIZE:<br></div><div>+-=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return cpu_features-&gt;level3_cache_linesiz=
e;<br></div><div>+-<br></div><div>+-&nbsp;&nbsp;&nbsp; case _SC_LEVEL4_CACH=
E_SIZE:<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return cpu_features-=
&gt;level4_cache_size;<br></div><div>+-<br></div><div>+-&nbsp;&nbsp;&nbsp; =
default:<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br></div><di=
v>+-&nbsp;&nbsp;&nbsp; }<br></div><div>+-&nbsp; return -1;<br></div><div>++=
&nbsp; /* CPU not known, we have no information.&nbsp; */<br></div><div>++&=
nbsp; return 0;<br></div><div>+ }<br></div><div>+&nbsp;<br></div><div>+ # i=
fdef SHARED<br></div><div>+diff --git a/sysdeps/x86/cacheinfo.h b/sysdeps/x=
86/cacheinfo.h<br></div><div>+index 68c253542f..736189f7f2 100644<br></div>=
<div>+--- a/sysdeps/x86/cacheinfo.h<br></div><div>++++ b/sysdeps/x86/cachei=
nfo.h<br></div><div>+@@ -18,16 +18,7 @@<br></div><div>+&nbsp;<br></div><div=
>+ #include &lt;assert.h&gt;<br></div><div>+ #include &lt;unistd.h&gt;<br><=
/div><div>+-#include &lt;cpuid.h&gt;<br></div><div>+-#include &lt;cpu-featu=
res.h&gt;<br></div><div>+&nbsp;<br></div><div>+-#if HAVE_TUNABLES<br></div>=
<div>+-# define TUNABLE_NAMESPACE cpu<br></div><div>+-# include &lt;unistd.=
h&gt;	=09/* Get STDOUT_FILENO for _dl_printf.&nbsp; */<br></div><div>+-# in=
clude &lt;elf/dl-tunables.h&gt;<br></div><div>+-#endif<br></div><div>+-<br>=
</div><div>+-#if IS_IN (libc)<br></div><div>+ /* Data cache size for use in=
 memory and string routines, typically<br></div><div>+&nbsp;&nbsp;&nbsp; L1=
 size, rounded to multiple of 256 bytes.&nbsp; */<br></div><div>+ long int =
__x86_data_cache_size_half attribute_hidden =3D 32 * 1024 / 2;<br></div><di=
v>+@@ -54,30 +45,385 @@ long int __x86_rep_movsb_threshold attribute_hidden=
 =3D 2048;<br></div><div>+ /* Threshold to use Enhanced REP STOSB.&nbsp; */=
<br></div><div>+ long int __x86_rep_stosb_threshold attribute_hidden =3D 20=
48;<br></div><div>+&nbsp;<br></div><div>++static void<br></div><div>++get_c=
ommon_cache_info (long int *shared_ptr, unsigned int *threads_ptr,<br></div=
><div>++	=09&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; long int core)<br></div><d=
iv>++{<br></div><div>++&nbsp; unsigned int eax;<br></div><div>++&nbsp; unsi=
gned int ebx;<br></div><div>++&nbsp; unsigned int ecx;<br></div><div>++&nbs=
p; unsigned int edx;<br></div><div>++<br></div><div>++&nbsp; /* Number of l=
ogical processors sharing L2 cache.&nbsp; */<br></div><div>++&nbsp; int thr=
eads_l2;<br></div><div>++<br></div><div>++&nbsp; /* Number of logical proce=
ssors sharing L3 cache.&nbsp; */<br></div><div>++&nbsp; int threads_l3;<br>=
</div><div>++<br></div><div>++&nbsp; const struct cpu_features *cpu_feature=
s =3D __get_cpu_features ();<br></div><div>++&nbsp; int max_cpuid =3D cpu_f=
eatures-&gt;basic.max_cpuid;<br></div><div>++&nbsp; unsigned int family =3D=
 cpu_features-&gt;basic.family;<br></div><div>++&nbsp; unsigned int model =
=3D cpu_features-&gt;basic.model;<br></div><div>++&nbsp; long int shared =
=3D *shared_ptr;<br></div><div>++&nbsp; unsigned int threads =3D *threads_=
ptr;<br></div><div>++&nbsp; bool inclusive_cache =3D true;<br></div><div>++=
&nbsp; bool support_count_mask =3D true;<br></div><div>++<br></div><div>++&=
nbsp; /* Try L3 first.&nbsp; */<br></div><div>++&nbsp; unsigned int level =
=3D 3;<br></div><div>++<br></div><div>++&nbsp; if (cpu_features-&gt;basic.=
kind =3D=3D arch_kind_zhaoxin &amp;&amp; family =3D=3D 6)<br></div><div>++&=
nbsp;&nbsp;&nbsp; support_count_mask =3D false;<br></div><div>++<br></div><=
div>++&nbsp; if (shared &lt;=3D 0)<br></div><div>++&nbsp;&nbsp;&nbsp; {<br>=
</div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Try L2 otherwise.&nbsp; */<b=
r></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; level&nbsp; =3D 2;<br></div><=
div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; shared =3D core;<br></div><div>++&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; threads_l2 =3D 0;<br></div><div>++&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; threads_l3 =3D -1;<br></div><div>++&nbsp;&nbsp;&nbsp; }<br>=
</div><div>++&nbsp; else<br></div><div>++&nbsp;&nbsp;&nbsp; {<br></div><div=
>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; threads_l2 =3D 0;<br></div><div>++&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; threads_l3 =3D 0;<br></div><div>++&nbsp;&nbsp;&nbsp=
; }<br></div><div>++<br></div><div>++&nbsp; /* A value of 0 for the HTT bit=
 indicates there is only a single<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp; =
logical processor.&nbsp; */<br></div><div>++&nbsp; if (HAS_CPU_FEATURE (HTT=
))<br></div><div>++&nbsp;&nbsp;&nbsp; {<br></div><div>++&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; /* Figure out the number of logical threads that share the<br><=
/div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; highest cache =
level.&nbsp; */<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (max_cpui=
d &gt;=3D 4)<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<b=
r></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i=
 =3D 0;<br></div><div>++<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; /* Query until cache level 2 and 3 are enumerated.&nbs=
p; */<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; int check =3D 0x1 | (threads_l3 =3D=3D 0) &lt;&lt; 1;<br></div><div>++&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do<br></div><div>++&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br></div><=
div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; __cpuid_count (4, i++, eax, ebx, ecx, edx);<br></div><div>++<br><=
/div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; /* There seems to be a bug in at least some Pentium Ds<br><=
/div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; which sometimes fail to iterate all cache=
 parameters.<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Do not loop indefinitely=
 here, stop in this case and<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assume t=
here is no such information.&nbsp; */<br></div><div>++&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (cpu_features-=
&gt;basic.kind =3D=3D arch_kind_intel<br></div><div>++&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &amp;&amp; (eax &amp; 0x1f) =3D=3D 0 )<br></div><div>++&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; goto intel_bug_no_cache_info;<br></div><div>++<br></div><div>++&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switc=
h ((eax &gt;&gt; 5) &amp; 0x7)<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br></div><=
div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br></div><div>++&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; break;<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
case 2:<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((check =
&amp; 0x1))<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; {<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; /* Get maximum number of logical processors<br></div><div>++&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; sharing L2 cache.&nbsp; */<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; threads_l2 =3D (eax &gt;&gt; 14) &amp; =
0x3ff;<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; check &amp;=3D ~0x1;<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; }<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; break;<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case 3:<br></di=
v><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((check &amp; (0x1 &lt;=
&lt; 1)))<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; {<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; /* Get maximum number of logical processors<br></div><div>++&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; sharing L3 cache.&nbsp; */<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; threads_l3 =3D (eax &gt;&gt; 14) &amp; 0x=
3ff;<br></div><div>++<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; /* Check if L2 and L3 caches are inclusive.&nbsp=
; */<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; inclusive_cache =3D (edx &amp; 0x2) !=3D 0;<br></div><div>++&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; check &amp;=3D ~=
(0x1 &lt;&lt; 1);<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;=
<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br></div><div>++&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (check);<br></div><div>++<br=
></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* If =
max_cpuid &gt;=3D 11, THREADS_L2/THREADS_L3 are the maximum<br></div><div>+=
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; n=
umbers of addressable IDs for logical processors sharing<br></div><div>++&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the =
cache, instead of the maximum number of threads<br></div><div>++&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sharing the c=
ache.&nbsp; */<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (max_cpuid &gt;=3D 11 &amp;&amp; support_count_mask)<br></div=
><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
{<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; /* Find the number of logical processors shipped in<b=
r></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; one core and apply count mask.&nbsp; *=
/<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; i =3D 0;<br></div><div>++<br></div><div>++&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Coun=
t SMT only if there is L3 cache.&nbsp; Always count<br></div><div>++&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; core if there is no L3 cache.&nbsp; */<br></div><div>++&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
nt count =3D ((threads_l2 &gt; 0 &amp;&amp; level =3D=3D 3)<br></div><div>+=
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; | ((threads_l3 &gt; 0<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; || (threads_l2 &gt; 0 &amp;&amp; level =3D=3D 2)) &lt;&lt; 1));<br></div>=
<div>++<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; while (count)<br></div><div>++&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {=
<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __cpuid_count (11, i++, eax, e=
bx, ecx, edx);<br></div><div>++<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 int shipped =3D ebx &amp; 0xff;<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; int type =3D ecx &amp; 0xff00;<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; if (shipped =3D=3D 0 || type =3D=3D 0)<br></div><div>++&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; el=
se if (type =3D=3D 0x100)<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; {<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; /* Count SMT.&nbsp; */<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; if ((count &amp; 0x1))<br></div><div>++&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br></div><div>++&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int count_=
mask;<br></div><div>++<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Compute count mask.&nbsp; */<br>=
</div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; asm ("bsr %1, %0"<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; : "=3Dr" (count_mask) : "g" (threads_l2));<br></div><div>++&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; count_mask =
=
=3D ~(-1 &lt;&lt; (count_mask + 1));<br></div><div>++&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; threads_l2 =3D (ship=
ped - 1) &amp; count_mask;<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; count &amp;=3D ~0x1;<br></div><=
div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>=
</div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br></div><div>++&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; else if (type =3D=3D 0x200)<br></div><div>++&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; /* Count core.&nbsp; */<br></div><div>++&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((count &amp; (0x1 &lt;&lt;=
 1)))<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; {<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int count_mask;<br></div><div>++&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int threads_=
core<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D (level =3D=3D 2 ? threads_l2 : thread=
s_l3);<br></div><div>++<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Compute count mask.&nbsp; */<br=
></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; asm ("bsr %1, %0"<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; : "=3Dr" (count_mask) : "g" (threads_core));<br></div><div>++&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; count_ma=
sk =3D ~(-1 &lt;&lt; (count_mask + 1));<br></div><div>++&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; threads_core =3D (=
shipped - 1) &amp; count_mask;<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (level =3D=3D 2)<br></di=
v><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; threads_l2 =3D threads_core;<br></div><div>++&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br=
></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; threads_l3 =3D threads_core;<br></div><div>++&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; co=
unt &amp;=3D ~(0x1 &lt;&lt; 1);<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br></div><div>++&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; }<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br></div><div>++&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br></div>=
<div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (threads_l=
2 &gt; 0)<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; threads_l2 +=3D 1;<br></div><div>++&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (threads_l3 &gt; 0)<br></div><div>++&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; threads_l3 =
+=3D 1;<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (level =3D=3D 2)<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (threads_l2)<br></=
div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; {<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; th=
reads =3D threads_l2;<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (cpu_f=
eatures-&gt;basic.kind =3D=3D arch_kind_intel<br></div><div>++&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; threads &gt; 2<br></div><=
div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; family=
 =3D=3D 6)<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (=
model)<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
{<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; case 0x37:<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; case 0x4a:<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case 0x4d:<br></div><div>++&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case 0x5a:<br></div>=
<div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case=
 0x5d:<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; /* Silvermont has L2 cache shared by 2 cores.&nbsp;=
 */<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; threads =3D 2;<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br></div><div>+=
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<b=
r></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; break;<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; }<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br></div><div>++&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br></div><div=
>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (threads_=
l3)<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; threads =3D threads_l3;<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; }<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<b=
r></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br></div><div>+=
+intel_bug_no_cache_info:<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; /* Assume that all logical threads share the highest =
cache<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; level.&nbsp; */<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; threads<br></div><div>++	&nbsp;&nbsp;&nbsp;=
 =3D ((cpu_features-&gt;features[CPUID_INDEX_1].cpuid.ebx &gt;&gt; 16)<br><=
/div><div>++	=09&amp; 0xff);<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; }<br></div><div>++<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; /* Cap usage of highest cache level to the number of suppor=
ted<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; threads.&nbsp; */<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (shared &gt; 0 &amp;&amp; threads &gt; 0)<br></div><div>++&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; shared /=3D threads;<br></=
div><div>++&nbsp;&nbsp;&nbsp; }<br></div><div>++<br></div><div>++&nbsp; /* =
Account for non-inclusive L2 and L3 caches.&nbsp; */<br></div><div>++&nbsp;=
 if (!inclusive_cache)<br></div><div>++&nbsp;&nbsp;&nbsp; {<br></div><div>+=
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (threads_l2 &gt; 0)<br></div><div>++&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; core /=3D threads_l2;<br></div><div>=
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; shared +=3D core;<br></div><div>++&nbsp;&n=
bsp;&nbsp; }<br></div><div>++<br></div><div>++&nbsp; *shared_ptr =3D shared=
;<br></div><div>++&nbsp; *threads_ptr =3D threads;<br></div><div>++}<br></d=
iv><div>++<br></div><div>+ static void<br></div><div>+ init_cacheinfo (void=
)<br></div><div>+ {<br></div><div>++&nbsp; /* Find out what brand of proces=
sor.&nbsp; */<br></div><div>++&nbsp; unsigned int ebx;<br></div><div>++&nbs=
p; unsigned int ecx;<br></div><div>++&nbsp; unsigned int edx;<br></div><div=
>++&nbsp; int max_cpuid_ex;<br></div><div>++&nbsp; long int data =3D -1;<br=
></div><div>++&nbsp; long int shared =3D -1;<br></div><div>++&nbsp; long in=
t core;<br></div><div>++&nbsp; unsigned int threads =3D 0;<br></div><div>+&=
nbsp;&nbsp; const struct cpu_features *cpu_features =3D __get_cpu_features =
();<br></div><div>+-&nbsp; long int data =3D cpu_features-&gt;data_cache_si=
ze;<br></div><div>+-&nbsp; __x86_raw_data_cache_size_half =3D data / 2;<br>=
</div><div>+-&nbsp; __x86_raw_data_cache_size =3D data;<br></div><div>+-&nb=
sp; /* Round data cache size to multiple of 256 bytes.&nbsp; */<br></div><d=
iv>+-&nbsp; data =3D data &amp; ~255L;<br></div><div>+-&nbsp; __x86_data_ca=
che_size_half =3D data / 2;<br></div><div>+-&nbsp; __x86_data_cache_size =
=3D data;<br></div><div>+-<br></div><div>+-&nbsp; long int shared =3D cpu_=
features-&gt;shared_cache_size;<br></div><div>+-&nbsp; __x86_raw_shared_cac=
he_size_half =3D shared / 2;<br></div><div>+-&nbsp; __x86_raw_shared_cache_=
size =3D shared;<br></div><div>+-&nbsp; /* Round shared cache size to multi=
ple of 256 bytes.&nbsp; */<br></div><div>+-&nbsp; shared =3D shared &amp; ~=
255L;<br></div><div>+-&nbsp; __x86_shared_cache_size_half =3D shared / 2;<b=
r></div><div>+-&nbsp; __x86_shared_cache_size =3D shared;<br></div><div>+&n=
bsp;<br></div><div>++&nbsp; /* NB: In libc.so, cpu_features is defined in l=
d.so and is initialized<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp; by DL_PLAT=
FORM_INIT or IFUNC relocation before init_cacheinfo is<br></div><div>++&nbs=
p;&nbsp;&nbsp;&nbsp; called by IFUNC relocation.&nbsp; In libc.a, init_cach=
einfo is called<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp; from init_cpu_feat=
ures by ARCH_INIT_CPU_FEATURES.&nbsp; */<br></div><div>++&nbsp; assert (cpu=
_features-&gt;basic.kind !=3D arch_kind_unknown);<br></div><div>++<br></div=
><div>++&nbsp; if (cpu_features-&gt;basic.kind =3D=3D arch_kind_intel)<br><=
/div><div>++&nbsp;&nbsp;&nbsp; {<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; data =3D handle_intel (_SC_LEVEL1_DCACHE_SIZE, cpu_features);<br></div=
><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; core =3D handle_intel (_SC_LEVEL2_CA=
CHE_SIZE, cpu_features);<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sha=
red =3D handle_intel (_SC_LEVEL3_CACHE_SIZE, cpu_features);<br></div><div>+=
+<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; get_common_cache_info (&am=
p;shared, &amp;threads, core);<br></div><div>++&nbsp;&nbsp;&nbsp; }<br></di=
v><div>++&nbsp; else if (cpu_features-&gt;basic.kind =3D=3D arch_kind_zhaox=
in)<br></div><div>++&nbsp;&nbsp;&nbsp; {<br></div><div>++&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; data =3D handle_zhaoxin (_SC_LEVEL1_DCACHE_SIZE);<br></div><di=
v>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; core =3D handle_zhaoxin (_SC_LEVEL2_CACH=
E_SIZE);<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; shared =3D handle_z=
haoxin (_SC_LEVEL3_CACHE_SIZE);<br></div><div>++<br></div><div>++&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; get_common_cache_info (&amp;shared, &amp;threads, core=
);<br></div><div>++&nbsp;&nbsp;&nbsp; }<br></div><div>++&nbsp; else if (cpu=
_features-&gt;basic.kind =3D=3D arch_kind_amd)<br></div><div>++&nbsp;&nbsp;=
&nbsp; {<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data&nbsp;&nbsp; =
=3D handle_amd (_SC_LEVEL1_DCACHE_SIZE);<br></div><div>++&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; long int core =3D handle_amd (_SC_LEVEL2_CACHE_SIZE);<br></di=
v><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; shared =3D handle_amd (_SC_LEVEL3_C=
ACHE_SIZE);<br></div><div>++<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 /* Get maximum extended function. */<br></div><div>++&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; __cpuid (0x80000000, max_cpuid_ex, ebx, ecx, edx);<br></div><div>=
++<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (shared &lt;=3D 0)<br>=
</div><div>++	/* No shared L3 cache.&nbsp; All we have is the L2 cache.&nbs=
p; */<br></div><div>++	shared =3D core;<br></div><div>++&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; else<br></div><div>++	{<br></div><div>++	&nbsp; /* Figure out t=
he number of logical threads that share L3.&nbsp; */<br></div><div>++	&nbsp=
; if (max_cpuid_ex &gt;=3D 0x80000008)<br></div><div>++	&nbsp;&nbsp;&nbsp; =
{<br></div><div>++	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Get width of APIC ID.&=
nbsp; */<br></div><div>++	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __cpuid (0x8000000=
8, max_cpuid_ex, ebx, ecx, edx);<br></div><div>++	&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; threads =3D 1 &lt;&lt; ((ecx &gt;&gt; 12) &amp; 0x0f);<br></div><div>=
++	&nbsp;&nbsp;&nbsp; }<br></div><div>++<br></div><div>++	&nbsp; if (thread=
s =3D=3D 0 || cpu_features-&gt;basic.family &gt;=3D 0x17)<br></div><div>++	=
&nbsp;&nbsp;&nbsp; {<br></div><div>++	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* If =
APIC ID width is not available, use logical<br></div><div>++	=09 processor =
count.&nbsp; */<br></div><div>++	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __cpuid (0x=
00000001, max_cpuid_ex, ebx, ecx, edx);<br></div><div>++<br></div><div>++	&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((edx &amp; (1 &lt;&lt; 28)) !=3D 0)<br></=
div><div>++	=09threads =3D (ebx &gt;&gt; 16) &amp; 0xff;<br></div><div>++	&=
nbsp;&nbsp;&nbsp; }<br></div><div>++<br></div><div>++	&nbsp; /* Cap usage o=
f highest cache level to the number of<br></div><div>++	&nbsp;&nbsp;&nbsp;&=
nbsp; supported threads.&nbsp; */<br></div><div>++	&nbsp; if (threads &gt; =
0)<br></div><div>++	&nbsp;&nbsp;&nbsp; shared /=3D threads;<br></div><div>+=
+<br></div><div>++	&nbsp; /* Get shared cache per ccx for Zen architectures=
.&nbsp; */<br></div><div>++	&nbsp; if (cpu_features-&gt;basic.family &gt;=
=3D 0x17)<br></div><div>++	&nbsp;&nbsp;&nbsp; {<br></div><div>++	&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; unsigned int eax;<br></div><div>++<br></div><div>++	&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Get number of threads share the L3 cache i=
n CCX.&nbsp; */<br></div><div>++	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __cpuid_cou=
nt (0x8000001D, 0x3, eax, ebx, ecx, edx);<br></div><div>++<br></div><div>++=
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int threads_per_ccx =3D ((eax &gt;=
&gt; 14) &amp; 0xfff) + 1;<br></div><div>++	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
shared *=3D threads_per_ccx;<br></div><div>++	&nbsp;&nbsp;&nbsp; }<br></div=
><div>++	&nbsp; else<br></div><div>++	&nbsp;&nbsp;&nbsp; {<br></div><div>++=
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Account for exclusive L2 and L3 caches.&=
nbsp; */<br></div><div>++	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; shared +=3D core;<=
br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; }<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br></div><div>++=
&nbsp;&nbsp;&nbsp; }<br></div><div>++<br></div><div>++&nbsp; /* Prefer cach=
e size configure via tuning.&nbsp; */<br></div><div>++&nbsp; if (cpu_featur=
es-&gt;data_cache_size !=3D 0)<br></div><div>++&nbsp;&nbsp;&nbsp; data =3D =
cpu_features-&gt;data_cache_size;<br></div><div>++<br></div><div>++&nbsp; i=
f (data &gt; 0)<br></div><div>++&nbsp;&nbsp;&nbsp; {<br></div><div>++&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; __x86_raw_data_cache_size_half =3D data / 2;<br></=
div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __x86_raw_data_cache_size =3D dat=
a;<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Round data cache size =
to multiple of 256 bytes.&nbsp; */<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; data =3D data &amp; ~255L;<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; __x86_data_cache_size_half =3D data / 2;<br></div><div>++&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; __x86_data_cache_size =3D data;<br></div><div>++&nbsp;&n=
bsp;&nbsp; }<br></div><div>++<br></div><div>++&nbsp; /* Prefer cache size c=
onfigure via tuning.&nbsp; */<br></div><div>++&nbsp; if (cpu_features-&gt;s=
hared_cache_size !=3D 0)<br></div><div>++&nbsp;&nbsp;&nbsp; shared =3D cpu_=
features-&gt;shared_cache_size;<br></div><div>++<br></div><div>++&nbsp; if =
(shared &gt; 0)<br></div><div>++&nbsp;&nbsp;&nbsp; {<br></div><div>++&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; __x86_raw_shared_cache_size_half =3D shared / 2;<b=
r></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __x86_raw_shared_cache_size =
=3D shared;<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Round shared=
 cache size to multiple of 256 bytes.&nbsp; */<br></div><div>++&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; shared =3D shared &amp; ~255L;<br></div><div>++&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; __x86_shared_cache_size_half =3D shared / 2;<br></div=
><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __x86_shared_cache_size =3D shared;<=
br></div><div>++&nbsp;&nbsp;&nbsp; }<br></div><div>++<br></div><div>++&nbsp=
; /* The default setting for the non_temporal threshold is 3/4 of one<br></=
div><div>++&nbsp;&nbsp;&nbsp;&nbsp; thread's share of the chip's cache. For=
 most Intel and AMD processors<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp; wit=
h an initial release date between 2017 and 2020, a thread's typical<br></di=
v><div>++&nbsp;&nbsp;&nbsp;&nbsp; share of the cache is from 500 KBytes to =
2 MBytes. Using the 3/4<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp; threshold =
leaves 125 KBytes to 500 KBytes of the thread's data<br></div><div>++&nbsp;=
&nbsp;&nbsp;&nbsp; in cache after a maximum temporal copy, which will maint=
ain<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp; in cache a reasonable portion =
of the thread's stack and other<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp; ac=
tive data. If the threshold is set higher than one thread's<br></div><div>+=
+&nbsp;&nbsp;&nbsp;&nbsp; share of the cache, it has a substantial risk of =
negatively<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp; impacting the performan=
ce of other threads running on the chip. */<br></div><div>+&nbsp;&nbsp; __x=
86_shared_non_temporal_threshold<br></div><div>+-&nbsp;&nbsp;&nbsp; =3D cpu=
_features-&gt;non_temporal_threshold;<br></div><div>++&nbsp;&nbsp;&nbsp; =
=3D (cpu_features-&gt;non_temporal_threshold !=3D 0<br></div><div>++&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ? cpu_features-&gt;non_temporal_threshold<br=
></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : __x86_shared_cache_siz=
e * 3 / 4);<br></div><div>++<br></div><div>++&nbsp; /* NB: The REP MOVSB th=
reshold must be greater than VEC_SIZE * 8.&nbsp; */<br></div><div>++&nbsp; =
unsigned int minimum_rep_movsb_threshold;<br></div><div>++&nbsp; /* NB: The=
 default REP MOVSB threshold is 2048 * (VEC_SIZE / 16).&nbsp; */<br></div><=
div>++&nbsp; unsigned int rep_movsb_threshold;<br></div><div>++&nbsp; if (C=
PU_FEATURE_USABLE_P (cpu_features, AVX512F)<br></div><div>++&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; &amp;&amp; !CPU_FEATURE_PREFERRED_P (cpu_features, Prefer_N=
o_AVX512))<br></div><div>++&nbsp;&nbsp;&nbsp; {<br></div><div>++&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; rep_movsb_threshold =3D 2048 * (64 / 16);<br></div><div=
>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; minimum_rep_movsb_threshold =3D 64 * 8;<b=
r></div><div>++&nbsp;&nbsp;&nbsp; }<br></div><div>++&nbsp; else if (CPU_FEA=
TURE_PREFERRED_P (cpu_features,<br></div><div>++	=09	=09&nbsp;&nbsp;&nbsp; =
AVX_Fast_Unaligned_Load))<br></div><div>++&nbsp;&nbsp;&nbsp; {<br></div><di=
v>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rep_movsb_threshold =3D 2048 * (32 / 16)=
;<br></div><div>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; minimum_rep_movsb_threshol=
d =3D 32 * 8;<br></div><div>++&nbsp;&nbsp;&nbsp; }<br></div><div>++&nbsp; e=
lse<br></div><div>++&nbsp;&nbsp;&nbsp; {<br></div><div>++&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; rep_movsb_threshold =3D 2048 * (16 / 16);<br></div><div>++&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; minimum_rep_movsb_threshold =3D 16 * 8;<br></div=
><div>++&nbsp;&nbsp;&nbsp; }<br></div><div>++&nbsp; if (cpu_features-&gt;re=
p_movsb_threshold &gt; minimum_rep_movsb_threshold)<br></div><div>++&nbsp;&=
nbsp;&nbsp; __x86_rep_movsb_threshold =3D cpu_features-&gt;rep_movsb_thresh=
old;<br></div><div>++&nbsp; else<br></div><div>++&nbsp;&nbsp;&nbsp; __x86_r=
ep_movsb_threshold =3D rep_movsb_threshold;<br></div><div>+&nbsp;<br></div>=
<div>+-&nbsp; __x86_rep_movsb_threshold =3D cpu_features-&gt;rep_movsb_thre=
shold;<br></div><div>++# if HAVE_TUNABLES<br></div><div>+&nbsp;&nbsp; __x86=
_rep_stosb_threshold =3D cpu_features-&gt;rep_stosb_threshold;<br></div><di=
v>++# endif<br></div><div>+ }<br></div><div>+-#endif<br></div><div>+diff --=
git a/sysdeps/x86/cpu-features.c b/sysdeps/x86/cpu-features.c<br></div><div=
>+index 73b0a4dc9a..c9e51b5e5a 100644<br></div><div>+--- a/sysdeps/x86/cpu-=
features.c<br></div><div>++++ b/sysdeps/x86/cpu-features.c<br></div><div>+@=
@ -16,13 +16,22 @@<br></div><div>+&nbsp;&nbsp;&nbsp; License along with the=
 GNU C Library; if not, see<br></div><div>+&nbsp;&nbsp;&nbsp; &lt;<a href=
=3D"https://www.gnu.org/licenses/">https://www.gnu.org/licenses/</a>&gt;.&=
nbsp; */<br></div><div>+&nbsp;<br></div><div>++#include &lt;cpuid.h&gt;<br>=
</div><div>+ #include &lt;dl-hwcap.h&gt;<br></div><div>+ #include &lt;libc-=
pointer-arith.h&gt;<br></div><div>+ #include &lt;get-isa-level.h&gt;<br></d=
iv><div>+-#include &lt;cacheinfo.h&gt;<br></div><div>+-#include &lt;dl-cach=
einfo.h&gt;<br></div><div>++#if IS_IN (libc) &amp;&amp; !defined SHARED<br>=
</div><div>++# include &lt;assert.h&gt;<br></div><div>++# include &lt;unist=
d.h&gt;<br></div><div>++# include &lt;dl-cacheinfo.h&gt;<br></div><div>++# =
include &lt;cacheinfo.h&gt;<br></div><div>++#endif<br></div><div>+&nbsp;<br=
></div><div>+ #if HAVE_TUNABLES<br></div><div>++# define TUNABLE_NAMESPACE =
cpu<br></div><div>++# include &lt;unistd.h&gt;	=09/* Get STDOUT_FILENO for =
_dl_printf.&nbsp; */<br></div><div>++# include &lt;elf/dl-tunables.h&gt;<br=
></div><div>++<br></div><div>+ extern void TUNABLE_CALLBACK (set_hwcaps) (t=
unable_val_t *)<br></div><div>+&nbsp;&nbsp; attribute_hidden;<br></div><div=
>+&nbsp;<br></div><div>+@@ -639,14 +648,24 @@ no_cpuid:<br></div><div>+&nbs=
p;&nbsp; cpu_features-&gt;basic.model =3D model;<br></div><div>+&nbsp;&nbsp=
; cpu_features-&gt;basic.stepping =3D stepping;<br></div><div>+&nbsp;<br></=
div><div>+-&nbsp; dl_init_cacheinfo (cpu_features);<br></div><div>+-<br></d=
iv><div>+ #if HAVE_TUNABLES<br></div><div>+&nbsp;&nbsp; TUNABLE_GET (hwcaps=
, tunable_val_t *, TUNABLE_CALLBACK (set_hwcaps));<br></div><div>+-#elif de=
fined SHARED<br></div><div>+-&nbsp; /* Reuse dl_platform, dl_hwcap and dl_h=
wcap_mask for x86.&nbsp; The<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp; glibc=
.cpu.hwcap_mask tunable is initialized already, so no<br></div><div>+-&nbsp=
;&nbsp;&nbsp;&nbsp; need to do this.&nbsp; */<br></div><div>++&nbsp; cpu_fe=
atures-&gt;non_temporal_threshold<br></div><div>++&nbsp;&nbsp;&nbsp; =3D TU=
NABLE_GET (x86_non_temporal_threshold, long int, NULL);<br></div><div>++&nb=
sp; cpu_features-&gt;rep_movsb_threshold<br></div><div>++&nbsp;&nbsp;&nbsp;=
 =3D TUNABLE_GET (x86_rep_movsb_threshold, long int, NULL);<br></div><div>+=
+&nbsp; cpu_features-&gt;rep_stosb_threshold<br></div><div>++&nbsp;&nbsp;&n=
bsp; =3D TUNABLE_GET (x86_rep_stosb_threshold, long int, NULL);<br></div><d=
iv>++&nbsp; cpu_features-&gt;data_cache_size<br></div><div>++&nbsp;&nbsp;&n=
bsp; =3D TUNABLE_GET (x86_data_cache_size, long int, NULL);<br></div><div>+=
+&nbsp; cpu_features-&gt;shared_cache_size<br></div><div>++&nbsp;&nbsp;&nbs=
p; =3D TUNABLE_GET (x86_shared_cache_size, long int, NULL);<br></div><div>+=
+#endif<br></div><div>++<br></div><div>++&nbsp; /* Reuse dl_platform, dl_hw=
cap and dl_hwcap_mask for x86.&nbsp; */<br></div><div>++#if !HAVE_TUNABLES =
&amp;&amp; defined SHARED<br></div><div>++&nbsp; /* The glibc.cpu.hwcap_mas=
k tunable is initialized already, so no need to do<br></div><div>++&nbsp;&n=
bsp;&nbsp;&nbsp; this.&nbsp; */<br></div><div>+&nbsp;&nbsp; GLRO(dl_hwcap_m=
ask) =3D HWCAP_IMPORTANT;<br></div><div>+ #endif<br></div><div>+&nbsp;<br><=
/div><div>+diff --git a/sysdeps/x86/dl-cacheinfo.h b/sysdeps/x86/dl-cachein=
fo.h<br></div><div>+index a31fa0783a..6adce4147c 100644<br></div><div>+--- =
a/sysdeps/x86/dl-cacheinfo.h<br></div><div>++++ b/sysdeps/x86/dl-cacheinfo.=
h<br></div><div>+@@ -476,463 +476,3 @@ handle_zhaoxin (int name)<br></div><=
div>+&nbsp;&nbsp; /* Nothing found.&nbsp; */<br></div><div>+&nbsp;&nbsp; re=
turn 0;<br></div><div>+ }<br></div><div>+-<br></div><div>+-static void<br><=
/div><div>+-get_common_cache_info (long int *shared_ptr, unsigned int *thre=
ads_ptr,<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; long int core)<br></div><div>+-{<b=
r></div><div>+-&nbsp; unsigned int eax;<br></div><div>+-&nbsp; unsigned int=
 ebx;<br></div><div>+-&nbsp; unsigned int ecx;<br></div><div>+-&nbsp; unsig=
ned int edx;<br></div><div>+-<br></div><div>+-&nbsp; /* Number of logical p=
rocessors sharing L2 cache.&nbsp; */<br></div><div>+-&nbsp; int threads_l2;=
<br></div><div>+-<br></div><div>+-&nbsp; /* Number of logical processors sh=
aring L3 cache.&nbsp; */<br></div><div>+-&nbsp; int threads_l3;<br></div><d=
iv>+-<br></div><div>+-&nbsp; const struct cpu_features *cpu_features =3D __=
get_cpu_features ();<br></div><div>+-&nbsp; int max_cpuid =3D cpu_features-=
&gt;basic.max_cpuid;<br></div><div>+-&nbsp; unsigned int family =3D cpu_fea=
tures-&gt;basic.family;<br></div><div>+-&nbsp; unsigned int model =3D cpu_f=
eatures-&gt;basic.model;<br></div><div>+-&nbsp; long int shared =3D *shared=
_ptr;<br></div><div>+-&nbsp; unsigned int threads =3D *threads_ptr;<br></di=
v><div>+-&nbsp; bool inclusive_cache =3D true;<br></div><div>+-&nbsp; bool =
support_count_mask =3D true;<br></div><div>+-<br></div><div>+-&nbsp; /* Try=
 L3 first.&nbsp; */<br></div><div>+-&nbsp; unsigned int level =3D 3;<br></d=
iv><div>+-<br></div><div>+-&nbsp; if (cpu_features-&gt;basic.kind =3D=3D ar=
ch_kind_zhaoxin &amp;&amp; family =3D=3D 6)<br></div><div>+-&nbsp;&nbsp;&nb=
sp; support_count_mask =3D false;<br></div><div>+-<br></div><div>+-&nbsp; i=
f (shared &lt;=3D 0)<br></div><div>+-&nbsp;&nbsp;&nbsp; {<br></div><div>+-&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Try L2 otherwise.&nbsp; */<br></div><div>+=
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; level&nbsp; =3D 2;<br></div><div>+-&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; shared =3D core;<br></div><div>+-&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; threads_l2 =3D 0;<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; threads_l3 =3D -1;<br></div><div>+-&nbsp;&nbsp;&nbsp; }<br></div><div>+-&=
nbsp; else<br></div><div>+-&nbsp;&nbsp;&nbsp; {<br></div><div>+-&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; threads_l2 =3D 0;<br></div><div>+-&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; threads_l3 =3D 0;<br></div><div>+-&nbsp;&nbsp;&nbsp; }<br></div><=
div>+-<br></div><div>+-&nbsp; /* A value of 0 for the HTT bit indicates the=
re is only a single<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp; logical proces=
sor.&nbsp; */<br></div><div>+-&nbsp; if (HAS_CPU_FEATURE (HTT))<br></div><d=
iv>+-&nbsp;&nbsp;&nbsp; {<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*=
 Figure out the number of logical threads that share the<br></div><div>+-&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; highest cache level.&nbsp; *=
/<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (max_cpuid &gt;=3D 4)<b=
r></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br></div><div>+=
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i =3D 0;<br></d=
iv><div>+-<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; /* Query until cache level 2 and 3 are enumerated.&nbsp; */<br></div=
><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int check =
=3D 0x1 | (threads_l3 =3D=3D 0) &lt;&lt; 1;<br></div><div>+-&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do<br></div><div>+-&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br></div><div>+-&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _=
_cpuid_count (4, i++, eax, ebx, ecx, edx);<br></div><div>+-<br></div><div>+=
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; /* There seems to be a bug in at least some Pentium Ds<br></div><div>+=
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; which sometimes fail to iterate all cache parameters=
.<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Do not loop indefinitely here, stop=
 in this case and<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assume there is no =
such information.&nbsp; */<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (cpu_features-&gt;basic.k=
ind =3D=3D arch_kind_intel<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp=
;&amp; (eax &amp; 0x1f) =3D=3D 0 )<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto int=
el_bug_no_cache_info;<br></div><div>+-<br></div><div>+-&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch ((eax &gt=
;&gt; 5) &amp; 0x7)<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br></div><div>+-&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; default:<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; break;<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case 2:<br>=
</div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((check &amp; 0x1))=
<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br><=
/div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 /* Get maximum number of logical processors<br></div><div>+-&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sharing=
 L2 cache.&nbsp; */<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; threads_l2 =3D (eax &gt;&gt; 14) &amp; 0x3ff;<br><=
/div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 check &amp;=3D ~0x1;<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; }<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; br=
eak;<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case 3:<br></div><div>+-&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((check &amp; (0x1 &lt;&lt; 1)))<b=
r></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br></d=
iv><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /=
* Get maximum number of logical processors<br></div><div>+-&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sharing L=
3 cache.&nbsp; */<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; threads_l3 =3D (eax &gt;&gt; 14) &amp; 0x3ff;<br></d=
iv><div>+-<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; /* Check if L2 and L3 caches are inclusive.&nbsp; */<br></d=
iv><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
nclusive_cache =3D (edx &amp; 0x2) !=3D 0;<br></div><div>+-&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; check &amp;=3D ~(0x1 &lt;&l=
t; 1);<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
}<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br></div><=
div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (check);<br></div><div>+-<br></div><div=
>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* If max_cpuid &=
gt;=3D 11, THREADS_L2/THREADS_L3 are the maximum<br></div><div>+-&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; numbers of a=
ddressable IDs for logical processors sharing<br></div><div>+-&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the cache, inst=
ead of the maximum number of threads<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sharing the cache.&nbsp;=
 */<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
if (max_cpuid &gt;=3D 11 &amp;&amp; support_count_mask)<br></div><div>+-&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br></div>=
<div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* Find the number of logical processors shipped in<br></div><di=
v>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; one core and apply count mask.&nbsp; */<br></div>=
<div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; i =3D 0;<br></div><div>+-<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Count SMT only =
if there is L3 cache.&nbsp; Always count<br></div><div>+-&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; core if there is no L3 cache.&nbsp; */<br></div><div>+-&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int count =
=3D ((threads_l2 &gt; 0 &amp;&amp; level =3D=3D 3)<br></div><div>+-&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
| ((threads_l3 &gt; 0<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; || (th=
reads_l2 &gt; 0 &amp;&amp; level =3D=3D 2)) &lt;&lt; 1));<br></div><div>+-<=
br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; while (count)<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br></di=
v><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __cpuid_count (11, i++, eax, ebx, ecx,=
 edx);<br></div><div>+-<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int shi=
pped =3D ebx &amp; 0xff;<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ty=
pe =3D ecx &amp; 0xff00;<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (sh=
ipped =3D=3D 0 || type =3D=3D 0)<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; break;<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (t=
ype =3D=3D 0x100)<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {=
<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Cou=
nt SMT.&nbsp; */<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; if ((count &amp; 0x1))<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br></div><div>+-&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int count_mask;<br=
></div><div>+-<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Compute count mask.&nbsp; */<br></div><d=
iv>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; asm ("bsr %1, %0"<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : "=
=3Dr" (count_mask) : "g" (threads_l2));<br></div><div>+-&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; count_mask =3D ~(=
-1 &lt;&lt; (count_mask + 1));<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; threads_l2 =3D (shipped - 1=
) &amp; count_mask;<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; count &amp;=3D ~0x1;<br></div><div>+-&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br></div><=
div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br></div><div>+-&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; else if (type =3D=3D 0x200)<br></div><div>+-&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; {<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; /* Count core.&nbsp; */<br></div><div>+-&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((count &amp; (0x1 &lt;&lt; 1)))<b=
r></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; {<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; int count_mask;<br></div><div>+-&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int threads_core<br=
></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; =3D (level =3D=3D 2 ? threads_l2 : threads_l3);<=
br></div><div>+-<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Compute count mask.&nbsp; */<br></div>=
<div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; asm ("bsr %1, %0"<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : =
"=3Dr" (count_mask) : "g" (threads_core));<br></div><div>+-&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; count_mask =3D =
~(-1 &lt;&lt; (count_mask + 1));<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; threads_core =3D (shipped=
 - 1) &amp; count_mask;<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (level =3D=3D 2)<br></div><div>=
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; threads_l2 =3D threads_core;<br></div><div>+-&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br></div>=
<div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; threads_l3 =3D threads_core;<br></div><div>+-&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; count &am=
p;=3D ~(0x1 &lt;&lt; 1);<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; }<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br></div><div>+-&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br></div><div>+-=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (threads_l2 &gt; =
0)<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; threads_l2 +=3D 1;<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if (threads_l3 &gt; 0)<br></div><div>+-&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; threads_l3 +=3D 1;=
<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if =
(level =3D=3D 2)<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; {<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (threads_l2)<br></div><di=
v>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; {<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; threads =
=3D threads_l2;<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (cpu_featur=
es-&gt;basic.kind =3D=3D arch_kind_intel<br></div><div>+-&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; threads &gt; 2<br></div><div>+=
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; family =3D=
=3D 6)<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (mod=
el)<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<b=
r></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; case 0x37:<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; case 0x4a:<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case 0x4d:<br></div><div>+-&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case 0x5a:<br></div><di=
v>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case 0x=
5d:<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; /* Silvermont has L2 cache shared by 2 cores.&nbsp; */=
<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; threads =3D 2;<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br></div><div>+-&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br><=
/div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; break;<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; }<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br></div><div>+-&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br></div><div>+-=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (threads_l3)=
<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; threads =3D threads_l3;<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br><=
/div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br></div><div>+-in=
tel_bug_no_cache_info:<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; /* Assume that all logical threads share the highest cac=
he<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; level.&nbsp; */<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; threads<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D ((cpu_features-&gt;feature=
s[CPUID_INDEX_1].cpuid.ebx &gt;&gt; 16)<br></div><div>+-	&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; &amp; 0xff);<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; }<br></div><div>+-<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; /* Cap usage of highest cache level to the number of sup=
ported<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; threads.&nbsp; */<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (shared &gt; 0 &amp;&amp; threads &gt; 0)<br></div><div>+-&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; shared /=3D threads;<br=
></div><div>+-&nbsp;&nbsp;&nbsp; }<br></div><div>+-<br></div><div>+-&nbsp; =
/* Account for non-inclusive L2 and L3 caches.&nbsp; */<br></div><div>+-&nb=
sp; if (!inclusive_cache)<br></div><div>+-&nbsp;&nbsp;&nbsp; {<br></div><di=
v>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (threads_l2 &gt; 0)<br></div><div>+-&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; core /=3D threads_l2;<br></div><d=
iv>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; shared +=3D core;<br></div><div>+-&nbsp=
;&nbsp;&nbsp; }<br></div><div>+-<br></div><div>+-&nbsp; *shared_ptr =3D sha=
red;<br></div><div>+-&nbsp; *threads_ptr =3D threads;<br></div><div>+-}<br>=
</div><div>+-<br></div><div>+-static void<br></div><div>+-dl_init_cacheinfo=
 (struct cpu_features *cpu_features)<br></div><div>+-{<br></div><div>+-&nbs=
p; /* Find out what brand of processor.&nbsp; */<br></div><div>+-&nbsp; uns=
igned int ebx;<br></div><div>+-&nbsp; unsigned int ecx;<br></div><div>+-&nb=
sp; unsigned int edx;<br></div><div>+-&nbsp; int max_cpuid_ex;<br></div><di=
v>+-&nbsp; long int data =3D -1;<br></div><div>+-&nbsp; long int shared =3D=
 -1;<br></div><div>+-&nbsp; long int core;<br></div><div>+-&nbsp; unsigned =
int threads =3D 0;<br></div><div>+-&nbsp; unsigned long int level1_icache_s=
ize =3D -1;<br></div><div>+-&nbsp; unsigned long int level1_dcache_size =3D=
 -1;<br></div><div>+-&nbsp; unsigned long int level1_dcache_assoc =3D -1;<b=
r></div><div>+-&nbsp; unsigned long int level1_dcache_linesize =3D -1;<br><=
/div><div>+-&nbsp; unsigned long int level2_cache_size =3D -1;<br></div><di=
v>+-&nbsp; unsigned long int level2_cache_assoc =3D -1;<br></div><div>+-&nb=
sp; unsigned long int level2_cache_linesize =3D -1;<br></div><div>+-&nbsp; =
unsigned long int level3_cache_size =3D -1;<br></div><div>+-&nbsp; unsigned=
 long int level3_cache_assoc =3D -1;<br></div><div>+-&nbsp; unsigned long i=
nt level3_cache_linesize =3D -1;<br></div><div>+-&nbsp; unsigned long int l=
evel4_cache_size =3D -1;<br></div><div>+-<br></div><div>+-&nbsp; if (cpu_fe=
atures-&gt;basic.kind =3D=3D arch_kind_intel)<br></div><div>+-&nbsp;&nbsp;&=
nbsp; {<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data =3D handle_inte=
l (_SC_LEVEL1_DCACHE_SIZE, cpu_features);<br></div><div>+-&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; core =3D handle_intel (_SC_LEVEL2_CACHE_SIZE, cpu_features);<=
br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; shared =3D handle_intel (_SC=
_LEVEL3_CACHE_SIZE, cpu_features);<br></div><div>+-<br></div><div>+-&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; level1_icache_size<br></div><div>+-	=3D handle_inte=
l (_SC_LEVEL1_ICACHE_SIZE, cpu_features);<br></div><div>+-&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; level1_dcache_size =3D data;<br></div><div>+-&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; level1_dcache_assoc<br></div><div>+-	=3D handle_intel (_SC_L=
EVEL1_DCACHE_ASSOC, cpu_features);<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; level1_dcache_linesize<br></div><div>+-	=3D handle_intel (_SC_LEVEL1=
_DCACHE_LINESIZE, cpu_features);<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; level2_cache_size =3D core;<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; level2_cache_assoc<br></div><div>+-	=3D handle_intel (_SC_LEVEL2_CACHE=
_ASSOC, cpu_features);<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; level=
2_cache_linesize<br></div><div>+-	=3D handle_intel (_SC_LEVEL2_CACHE_LINESI=
ZE, cpu_features);<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; level3_ca=
che_size =3D shared;<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; level3_=
cache_assoc<br></div><div>+-	=3D handle_intel (_SC_LEVEL3_CACHE_ASSOC, cpu_=
features);<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; level3_cache_line=
size<br></div><div>+-	=3D handle_intel (_SC_LEVEL3_CACHE_LINESIZE, cpu_feat=
ures);<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; level4_cache_size<br>=
</div><div>+-	=3D handle_intel (_SC_LEVEL4_CACHE_SIZE, cpu_features);<br></=
div><div>+-<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; get_common_cache=
_info (&amp;shared, &amp;threads, core);<br></div><div>+-&nbsp;&nbsp;&nbsp;=
 }<br></div><div>+-&nbsp; else if (cpu_features-&gt;basic.kind =3D=3D arch_=
kind_zhaoxin)<br></div><div>+-&nbsp;&nbsp;&nbsp; {<br></div><div>+-&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; data =3D handle_zhaoxin (_SC_LEVEL1_DCACHE_SIZE);<br=
></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; core =3D handle_zhaoxin (_SC_L=
EVEL2_CACHE_SIZE);<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; shared =
=3D handle_zhaoxin (_SC_LEVEL3_CACHE_SIZE);<br></div><div>+-<br></div><div=
>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; level1_icache_size =3D handle_zhaoxin (_S=
C_LEVEL1_ICACHE_SIZE);<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; level=
1_dcache_size =3D data;<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; leve=
l1_dcache_assoc =3D handle_zhaoxin (_SC_LEVEL1_DCACHE_ASSOC);<br></div><div=
>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; level1_dcache_linesize =3D handle_zhaoxin=
 (_SC_LEVEL1_DCACHE_LINESIZE);<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; level2_cache_size =3D core;<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; level2_cache_assoc =3D handle_zhaoxin (_SC_LEVEL2_CACHE_ASSOC);<br></div=
><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; level2_cache_linesize =3D handle_zha=
oxin (_SC_LEVEL2_CACHE_LINESIZE);<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; level3_cache_size =3D shared;<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; level3_cache_assoc =3D handle_zhaoxin (_SC_LEVEL3_CACHE_ASSOC);<br>=
</div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; level3_cache_linesize =3D handl=
e_zhaoxin (_SC_LEVEL3_CACHE_LINESIZE);<br></div><div>+-<br></div><div>+-&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; get_common_cache_info (&amp;shared, &amp;thread=
s, core);<br></div><div>+-&nbsp;&nbsp;&nbsp; }<br></div><div>+-&nbsp; else =
if (cpu_features-&gt;basic.kind =3D=3D arch_kind_amd)<br></div><div>+-&nbsp=
;&nbsp;&nbsp; {<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data&nbsp; =
=3D handle_amd (_SC_LEVEL1_DCACHE_SIZE);<br></div><div>+-&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; core =3D handle_amd (_SC_LEVEL2_CACHE_SIZE);<br></div><div>+-=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; shared =3D handle_amd (_SC_LEVEL3_CACHE_SIZE=
);<br></div><div>+-<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; level1_i=
cache_size =3D handle_amd (_SC_LEVEL1_ICACHE_SIZE);<br></div><div>+-&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; level1_dcache_size =3D data;<br></div><div>+-&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; level1_dcache_assoc =3D handle_amd (_SC_LEVEL1_DCA=
CHE_ASSOC);<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; level1_dcache_li=
nesize =3D handle_amd (_SC_LEVEL1_DCACHE_LINESIZE);<br></div><div>+-&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; level2_cache_size =3D core;<br></div><div>+-&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; level2_cache_assoc =3D handle_amd (_SC_LEVEL2_CACHE=
_ASSOC);<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; level2_cache_linesi=
ze =3D handle_amd (_SC_LEVEL2_CACHE_LINESIZE);<br></div><div>+-&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; level3_cache_size =3D shared;<br></div><div>+-&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; level3_cache_assoc =3D handle_amd (_SC_LEVEL3_CACHE_AS=
SOC);<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; level3_cache_linesize =
=
=3D handle_amd (_SC_LEVEL3_CACHE_LINESIZE);<br></div><div>+-<br></div><div=
>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Get maximum extended function. */<br><=
/div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __cpuid (0x80000000, max_cpuid_e=
x, ebx, ecx, edx);<br></div><div>+-<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (shared &lt;=3D 0)<br></div><div>+-	/* No shared L3 cache.&nbsp;=
 All we have is the L2 cache.&nbsp; */<br></div><div>+-	shared =3D core;<br=
></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br></div><div>+-	{<br></d=
iv><div>+-	&nbsp; /* Figure out the number of logical threads that share L3=
.&nbsp; */<br></div><div>+-	&nbsp; if (max_cpuid_ex &gt;=3D 0x80000008)<br>=
</div><div>+-	&nbsp;&nbsp;&nbsp; {<br></div><div>+-	&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; /* Get width of APIC ID.&nbsp; */<br></div><div>+-	&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; __cpuid (0x80000008, max_cpuid_ex, ebx, ecx, edx);<br></div>=
<div>+-	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; threads =3D 1 &lt;&lt; ((ecx &gt;&gt=
; 12) &amp; 0x0f);<br></div><div>+-	&nbsp;&nbsp;&nbsp; }<br></div><div>+-<b=
r></div><div>+-	&nbsp; if (threads =3D=3D 0 || cpu_features-&gt;basic.famil=
y &gt;=3D 0x17)<br></div><div>+-	&nbsp;&nbsp;&nbsp; {<br></div><div>+-	&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; /* If APIC ID width is not available, use logica=
l<br></div><div>+-	=09 processor count.&nbsp; */<br></div><div>+-	&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; __cpuid (0x00000001, max_cpuid_ex, ebx, ecx, edx);<br=
></div><div>+-<br></div><div>+-	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((edx &am=
p; (1 &lt;&lt; 28)) !=3D 0)<br></div><div>+-	=09threads =3D (ebx &gt;&gt; 1=
6) &amp; 0xff;<br></div><div>+-	&nbsp;&nbsp;&nbsp; }<br></div><div>+-<br></=
div><div>+-	&nbsp; /* Cap usage of highest cache level to the number of<br>=
</div><div>+-	&nbsp;&nbsp;&nbsp;&nbsp; supported threads.&nbsp; */<br></div=
><div>+-	&nbsp; if (threads &gt; 0)<br></div><div>+-	&nbsp;&nbsp;&nbsp; sha=
red /=3D threads;<br></div><div>+-<br></div><div>+-	&nbsp; /* Get shared ca=
che per ccx for Zen architectures.&nbsp; */<br></div><div>+-	&nbsp; if (cpu=
_features-&gt;basic.family &gt;=3D 0x17)<br></div><div>+-	&nbsp;&nbsp;&nbsp=
; {<br></div><div>+-	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int eax;<br></=
div><div>+-<br></div><div>+-	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Get number o=
f threads share the L3 cache in CCX.&nbsp; */<br></div><div>+-	&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; __cpuid_count (0x8000001D, 0x3, eax, ebx, ecx, edx);<br>=
</div><div>+-<br></div><div>+-	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int =
threads_per_ccx =3D ((eax &gt;&gt; 14) &amp; 0xfff) + 1;<br></div><div>+-	&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; shared *=3D threads_per_ccx;<br></div><div>+-=
	&nbsp;&nbsp;&nbsp; }<br></div><div>+-	&nbsp; else<br></div><div>+-	&nbsp;&=
nbsp;&nbsp; {<br></div><div>+-	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Account fo=
r exclusive L2 and L3 caches.&nbsp; */<br></div><div>+-	&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; shared +=3D core;<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br></div><div>+-	}<br></div><div>+-=
&nbsp;&nbsp;&nbsp; }<br></div><div>+-<br></div><div>+-&nbsp; cpu_features-&=
gt;level1_icache_size =3D level1_icache_size;<br></div><div>+-&nbsp; cpu_fe=
atures-&gt;level1_dcache_size =3D level1_dcache_size;<br></div><div>+-&nbsp=
; cpu_features-&gt;level1_dcache_assoc =3D level1_dcache_assoc;<br></div><d=
iv>+-&nbsp; cpu_features-&gt;level1_dcache_linesize =3D level1_dcache_lines=
ize;<br></div><div>+-&nbsp; cpu_features-&gt;level2_cache_size =3D level2_c=
ache_size;<br></div><div>+-&nbsp; cpu_features-&gt;level2_cache_assoc =3D l=
evel2_cache_assoc;<br></div><div>+-&nbsp; cpu_features-&gt;level2_cache_lin=
esize =3D level2_cache_linesize;<br></div><div>+-&nbsp; cpu_features-&gt;le=
vel3_cache_size =3D level3_cache_size;<br></div><div>+-&nbsp; cpu_features-=
&gt;level3_cache_assoc =3D level3_cache_assoc;<br></div><div>+-&nbsp; cpu_f=
eatures-&gt;level3_cache_linesize =3D level3_cache_linesize;<br></div><div>=
+-&nbsp; cpu_features-&gt;level4_cache_size =3D level4_cache_size;<br></div=
><div>+-<br></div><div>+-&nbsp; /* The default setting for the non_temporal=
 threshold is 3/4 of one<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp; thread's =
share of the chip's cache. For most Intel and AMD processors<br></div><div>=
+-&nbsp;&nbsp;&nbsp;&nbsp; with an initial release date between 2017 and 20=
20, a thread's typical<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp; share of th=
e cache is from 500 KBytes to 2 MBytes. Using the 3/4<br></div><div>+-&nbsp=
;&nbsp;&nbsp;&nbsp; threshold leaves 125 KBytes to 500 KBytes of the thread=
's data<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp; in cache after a maximum t=
emporal copy, which will maintain<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp; =
in cache a reasonable portion of the thread's stack and other<br></div><div=
>+-&nbsp;&nbsp;&nbsp;&nbsp; active data. If the threshold is set higher tha=
n one thread's<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp; share of the cache,=
 it has a substantial risk of negatively<br></div><div>+-&nbsp;&nbsp;&nbsp;=
&nbsp; impacting the performance of other threads running on the chip. */<b=
r></div><div>+-&nbsp; unsigned long int non_temporal_threshold =3D shared *=
 3 / 4;<br></div><div>+-<br></div><div>+-#if HAVE_TUNABLES<br></div><div>+-=
&nbsp; /* NB: The REP MOVSB threshold must be greater than VEC_SIZE * 8.&nb=
sp; */<br></div><div>+-&nbsp; unsigned int minimum_rep_movsb_threshold;<br>=
</div><div>+-#endif<br></div><div>+-&nbsp; /* NB: The default REP MOVSB thr=
eshold is 2048 * (VEC_SIZE / 16).&nbsp; */<br></div><div>+-&nbsp; unsigned =
int rep_movsb_threshold;<br></div><div>+-&nbsp; if (CPU_FEATURE_USABLE_P (c=
pu_features, AVX512F)<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&=
amp; !CPU_FEATURE_PREFERRED_P (cpu_features, Prefer_No_AVX512))<br></div><d=
iv>+-&nbsp;&nbsp;&nbsp; {<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; re=
p_movsb_threshold =3D 2048 * (64 / 16);<br></div><div>+-#if HAVE_TUNABLES<b=
r></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; minimum_rep_movsb_threshold =
=3D 64 * 8;<br></div><div>+-#endif<br></div><div>+-&nbsp;&nbsp;&nbsp; }<br=
></div><div>+-&nbsp; else if (CPU_FEATURE_PREFERRED_P (cpu_features,<br></d=
iv><div>+-	=09	=09&nbsp;&nbsp;&nbsp; AVX_Fast_Unaligned_Load))<br></div><di=
v>+-&nbsp;&nbsp;&nbsp; {<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rep=
_movsb_threshold =3D 2048 * (32 / 16);<br></div><div>+-#if HAVE_TUNABLES<br=
></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; minimum_rep_movsb_threshold =
=3D 32 * 8;<br></div><div>+-#endif<br></div><div>+-&nbsp;&nbsp;&nbsp; }<br=
></div><div>+-&nbsp; else<br></div><div>+-&nbsp;&nbsp;&nbsp; {<br></div><di=
v>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rep_movsb_threshold =3D 2048 * (16 / 16)=
;<br></div><div>+-#if HAVE_TUNABLES<br></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; minimum_rep_movsb_threshold =3D 16 * 8;<br></div><div>+-#endif<br><=
/div><div>+-&nbsp;&nbsp;&nbsp; }<br></div><div>+-<br></div><div>+-&nbsp; /*=
 The default threshold to use Enhanced REP STOSB.&nbsp; */<br></div><div>+-=
&nbsp; unsigned long int rep_stosb_threshold =3D 2048;<br></div><div>+-<br>=
</div><div>+-#if HAVE_TUNABLES<br></div><div>+-&nbsp; long int tunable_size=
;<br></div><div>+-<br></div><div>+-&nbsp; tunable_size =3D TUNABLE_GET (x86=
_data_cache_size, long int, NULL);<br></div><div>+-&nbsp; /* NB: Ignore the=
 default value 0.&nbsp; */<br></div><div>+-&nbsp; if (tunable_size !=3D 0)<=
br></div><div>+-&nbsp;&nbsp;&nbsp; data =3D tunable_size;<br></div><div>+-<=
br></div><div>+-&nbsp; tunable_size =3D TUNABLE_GET (x86_shared_cache_size,=
 long int, NULL);<br></div><div>+-&nbsp; /* NB: Ignore the default value 0.=
&nbsp; */<br></div><div>+-&nbsp; if (tunable_size !=3D 0)<br></div><div>+-&=
nbsp;&nbsp;&nbsp; shared =3D tunable_size;<br></div><div>+-<br></div><div>+=
-&nbsp; tunable_size =3D TUNABLE_GET (x86_non_temporal_threshold, long int,=
 NULL);<br></div><div>+-&nbsp; /* NB: Ignore the default value 0.&nbsp; */<=
br></div><div>+-&nbsp; if (tunable_size !=3D 0)<br></div><div>+-&nbsp;&nbsp=
;&nbsp; non_temporal_threshold =3D tunable_size;<br></div><div>+-<br></div>=
<div>+-&nbsp; tunable_size =3D TUNABLE_GET (x86_rep_movsb_threshold, long i=
nt, NULL);<br></div><div>+-&nbsp; if (tunable_size &gt; minimum_rep_movsb_t=
hreshold)<br></div><div>+-&nbsp;&nbsp;&nbsp; rep_movsb_threshold =3D tunabl=
e_size;<br></div><div>+-<br></div><div>+-&nbsp; /* NB: The default value of=
 the x86_rep_stosb_threshold tunable is the<br></div><div>+-&nbsp;&nbsp;&nb=
sp;&nbsp; same as the default value of __x86_rep_stosb_threshold and the<br=
></div><div>+-&nbsp;&nbsp;&nbsp;&nbsp; minimum value is fixed.&nbsp; */<br>=
</div><div>+-&nbsp; rep_stosb_threshold =3D TUNABLE_GET (x86_rep_stosb_thre=
shold,<br></div><div>+-	=09	=09&nbsp;&nbsp;&nbsp;&nbsp; long int, NULL);<br=
></div><div>+-<br></div><div>+-&nbsp; TUNABLE_SET_WITH_BOUNDS (x86_data_cac=
he_size, long int, data,<br></div><div>+-	=09	&nbsp;&nbsp; 0, (long int) -1=
);<br></div><div>+-&nbsp; TUNABLE_SET_WITH_BOUNDS (x86_shared_cache_size, l=
ong int, shared,<br></div><div>+-	=09	&nbsp;&nbsp; 0, (long int) -1);<br></=
div><div>+-&nbsp; TUNABLE_SET_WITH_BOUNDS (x86_non_temporal_threshold, long=
 int,<br></div><div>+-	=09	&nbsp;&nbsp; non_temporal_threshold, 0, (long in=
t) -1);<br></div><div>+-&nbsp; TUNABLE_SET_WITH_BOUNDS (x86_rep_movsb_thres=
hold, long int,<br></div><div>+-	=09	&nbsp;&nbsp; rep_movsb_threshold,<br><=
/div><div>+-	=09	&nbsp;&nbsp; minimum_rep_movsb_threshold, (long int) -1);<=
br></div><div>+-&nbsp; TUNABLE_SET_WITH_BOUNDS (x86_rep_stosb_threshold, lo=
ng int,<br></div><div>+-	=09	&nbsp;&nbsp; rep_stosb_threshold, 1, (long int=
) -1);<br></div><div>+-#endif<br></div><div>+-<br></div><div>+-&nbsp; cpu_f=
eatures-&gt;data_cache_size =3D data;<br></div><div>+-&nbsp; cpu_features-&=
gt;shared_cache_size =3D shared;<br></div><div>+-&nbsp; cpu_features-&gt;no=
n_temporal_threshold =3D non_temporal_threshold;<br></div><div>+-&nbsp; cpu=
_features-&gt;rep_movsb_threshold =3D rep_movsb_threshold;<br></div><div>+-=
&nbsp; cpu_features-&gt;rep_stosb_threshold =3D rep_stosb_threshold;<br></d=
iv><div>+-}<br></div><div>+diff --git a/sysdeps/x86/include/cpu-features.h =
b/sysdeps/x86/include/cpu-features.h<br></div><div>+index 624736b40e..fb02f=
0607b 100644<br></div><div>+--- a/sysdeps/x86/include/cpu-features.h<br></d=
iv><div>++++ b/sysdeps/x86/include/cpu-features.h<br></div><div>+@@ -872,28=
 +872,6 @@ struct cpu_features<br></div><div>+&nbsp;&nbsp; unsigned long in=
t rep_movsb_threshold;<br></div><div>+&nbsp;&nbsp; /* Threshold to use "rep=
 stosb".&nbsp; */<br></div><div>+&nbsp;&nbsp; unsigned long int rep_stosb_t=
hreshold;<br></div><div>+-&nbsp; /* _SC_LEVEL1_ICACHE_SIZE.&nbsp; */<br></d=
iv><div>+-&nbsp; unsigned long int level1_icache_size;<br></div><div>+-&nbs=
p; /* _SC_LEVEL1_DCACHE_SIZE.&nbsp; */<br></div><div>+-&nbsp; unsigned long=
 int level1_dcache_size;<br></div><div>+-&nbsp; /* _SC_LEVEL1_DCACHE_ASSOC.=
&nbsp; */<br></div><div>+-&nbsp; unsigned long int level1_dcache_assoc;<br>=
</div><div>+-&nbsp; /* _SC_LEVEL1_DCACHE_LINESIZE.&nbsp; */<br></div><div>+=
-&nbsp; unsigned long int level1_dcache_linesize;<br></div><div>+-&nbsp; /*=
 _SC_LEVEL2_CACHE_ASSOC.&nbsp; */<br></div><div>+-&nbsp; unsigned long int =
level2_cache_size;<br></div><div>+-&nbsp; /* _SC_LEVEL2_DCACHE_ASSOC.&nbsp;=
 */<br></div><div>+-&nbsp; unsigned long int level2_cache_assoc;<br></div><=
div>+-&nbsp; /* _SC_LEVEL2_CACHE_LINESIZE.&nbsp; */<br></div><div>+-&nbsp; =
unsigned long int level2_cache_linesize;<br></div><div>+-&nbsp; /* /_SC_LEV=
EL3_CACHE_SIZE.&nbsp; */<br></div><div>+-&nbsp; unsigned long int level3_ca=
che_size;<br></div><div>+-&nbsp; /* _SC_LEVEL3_CACHE_ASSOC.&nbsp; */<br></d=
iv><div>+-&nbsp; unsigned long int level3_cache_assoc;<br></div><div>+-&nbs=
p; /* _SC_LEVEL3_CACHE_LINESIZE.&nbsp; */<br></div><div>+-&nbsp; unsigned l=
ong int level3_cache_linesize;<br></div><div>+-&nbsp; /* /_SC_LEVEL4_CACHE_=
SIZE.&nbsp; */<br></div><div>+-&nbsp; unsigned long int level4_cache_size;<=
br></div><div>+ };<br></div><div>+&nbsp;<br></div><div>+ /* Get a pointer t=
o the CPU features structure.&nbsp; */<br></div><div>diff --git a/meta/reci=
pes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb<br></d=
iv><div>index e0002e6046..dd4087f80b 100644<br></div><div>--- a/meta/recipe=
s-core/glibc/glibc_2.33.bb<br></div><div>+++ b/meta/recipes-core/glibc/glib=
c_2.33.bb<br></div><div>@@ -15,11 +15,10 @@ NATIVESDKFIXES_class-nativesdk =
=
=3D "\<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; file://faccessat2-perm.patch \<br></div><div>"<br></div><div>=
&nbsp;<br></div><div>-SRC_URI =3D&nbsp; "${GLIBC_GIT_URI};branch=3D${SRCBRA=
NCH};name=3Dglibc \<br></div><div>+SRC_URI =3D "${GLIBC_GIT_URI};branch=3D$=
{SRCBRANCH};name=3Dglibc \<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://etc/ld.so.conf \<br></div><div>&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://gener=
ate-supported.mk \<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; file://makedbs.sh \<br></div><div>-&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br></div><div>&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${NATIVESDKFIXES} \<b=
r></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; file://0008-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch \<br>=
</div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; file://0009-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch \<br=
></div><div>@@ -44,6 +43,7 @@ SRC_URI =3D&nbsp; "${GLIBC_GIT_URI};branch=3D=
${SRCBRANCH};name=3Dglibc \<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://0029-wordsize.h-Unify-the-header-b=
etween-arm-and-aarch64.patch \<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://0030-powerpc-Do-not-ask-compile=
r-for-finding-arch.patch \<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://0031-x86-Require-full-ISA-support-f=
or-x86-64-level-marker.patch \<br></div><div>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://0032-Revert-x86-Move-x86-processor-c=
ache-info-to-cpu_feat.patch \<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "<br></div><div>S =3D "${WORKDIR}/git"<=
br></div><div>B =3D "${WORKDIR}/build-${TARGET_SYS}"<br></div><div>--&nbsp;=
<br></div><div>2.30.1<br></div><div><br></div><div><br></div><div><br></div=
><div><br></div><div><br></div><div><br></div></blockquote><div><br></div><=
/body></html>

--ee7ab90d0f784260aa6cc2310d81e97f--
