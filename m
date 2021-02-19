Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web10.554.1613778850148419178
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Feb 2021 15:54:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=FzuETcqo;
 spf=pass (domain: gherzan.com, ip: 66.111.4.26, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 53B215C00FD;
	Fri, 19 Feb 2021 18:54:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 19 Feb 2021 18:54:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=fm1; bh=h8Evz4vJmVHJB1TLSANZticu4z
	wCOYRUdSLT4d0C5XQ=; b=FzuETcqo31/sSvSrhCrbBkFrr+RX61/LPoE8AfZHfU
	A7fFlSA0ZALmwEZI4wtDbylOEB5TPuipmwWLvvtwjiSXZY/FtnMW+ri28E5RLK+X
	aSNSP7GRgQuZ55okXNzFP/W6BB2nv5jkDuaP/qK6U/KL/RvtwNWeIuMXEI28oTcg
	pJKwcvkdvexYncBiIWiigAmMG+7D3jDUrtl/H0GF8FkTVbBVZ7wVSJu4Xa+02jJ5
	RlZWsqNxpmJFIzv0HAx5wEpXaHSq3GyoJSbqfHA0huXTnin8Zqqpr/sejKdVbzof
	qd9YAhika+XWSg59o/9GyaSkB7bIf2qwOoxnnCPZ07nA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:message-id:mime-version:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=h8Evz4
	vJmVHJB1TLSANZticu4zwCOYRUdSLT4d0C5XQ=; b=aTSUUe4fh3Fo39eqt6m1h7
	88eaEL2o08S4aLP2AsL09Mb+hxPMUtFpCZqsV8UwtHCaDq5jU+Yl3Vz8PMdNe862
	5KpbcS9SaHzLr6AJwphjQJ7y1guexMs3iWswLwo1KKugB7SGLjiccSAiMsd3Z4Tf
	UqN2Qgj4ozWkTbmRQxmIc1D43T6LMMjgYBDFEld1tlcUeMiOeyaSspM1B1mJizT2
	HuRwQCmNsw7/J60eRWEc5herA7+FGCRFrTVM/6zSfXWkJBpY8r42C4lT/heNr/70
	EaDXOsMKPcO429/lHcuMj+dOCEJeTcAOfTowUv240Pqc6rtoDl1v5tK6XjnG6MTg
	==
X-ME-Sender: <xms:oE8wYFUUkPJm_v1D9D5u0_wR6ErTeKbKRIMKynnfRD-ceo71VvB8Fw>
    <xme:oE8wYFki73WmDhP_KrE-o7QYFVHUjMJPFDrX8WY_dI7PAQJgOIqkXyYzPXd4cTcjb
    QOKmHSBRWjvUcCiHEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeejgdduhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffogggtgfesthekredtre
    dtjeenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghisehghhgv
    rhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpeelfefhieehheejueduueeutefgte
    fhhfehteevhedugfdvgfdtfeffieehvddvueenucffohhmrghinhepghhnuhdrohhrghen
    ucfkphepkeeirddufedtrddugeeirdduvddvnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:oE8wYBbuGd_AI1KMH52g0BftP206lsRv0nFS-pF6fNjwyrwz4QNqWA>
    <xmx:oE8wYIWPHR_KiAFyzOkpROO5M5s-nM3qhwnwYyjMXsrEKekF8eNxTA>
    <xmx:oE8wYPldZ68Lzn-fvRJLQEmIMmQ8fbxiRKJNj7uB4c6tb2skNIBnkQ>
    <xmx:oU8wYFTnyWc1eCqBFSNPZIYsRVnWC0P22LZJhcAP71KuHzwTHPEJyw>
Received: from qwirkle.internal (host86-130-146-122.range86-130.btcentralplus.com [86.130.146.122])
	by mail.messagingengine.com (Postfix) with ESMTPA id 23EDB24005B;
	Fri, 19 Feb 2021 18:54:04 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [PATCH] glibc: Bring back L1 icache line size
Date: Fri, 19 Feb 2021 23:53:51 +0000
Message-Id: <20210219235351.2577085-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andrei Gherzan <andrei.gherzan@huawei.com>

It was observerd that with glibc 2.33, sysconf reports unsupported
option (-1) for _SC_LEVEL1_ICACHE_LINESIZE.

This can be reproduced with sysconf tool:

```
└─❯  docker run -ti --rm archlinux:base-20210214.0.15477 getconf -a |
grep "GNU_LIBC_VERSION\|LEVEL1_ICACHE_LINESIZE"
GNU_LIBC_VERSION                   glibc 2.33
LEVEL1_ICACHE_LINESIZE
└─❯  docker run -ti --rm archlinux:base-20210131.0.14634 getconf -a |
grep "GNU_LIBC_VERSION\|LEVEL1_ICACHE_LINESIZE"
GNU_LIBC_VERSION                   glibc 2.32
LEVEL1_ICACHE_LINESIZE             64
```

The offending patch in glibc is:

commit 2d651eb9265d1366d7b9e881bfddd46db9c1ecc4
Author: H.J. Lu <hjl.tools@gmail.com>
Date:   Fri Sep 18 07:55:14 2020 -0700
    x86: Move x86 processor cache info to cpu_features

This patch reverts the above mentioned glibc change. It was tested on
qemux86.

Extra small cosmetic tweaks brought you by devtool (a superflous newline
and whitespace).

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 ...x86-processor-cache-info-to-cpu_feat.patch | 1074 +++++++++++++++++
 meta/recipes-core/glibc/glibc_2.33.bb         |    4 +-
 2 files changed, 1076 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc/0032-Revert-x86-Move-x86-processor-cache-info-to-cpu_feat.patch

diff --git a/meta/recipes-core/glibc/glibc/0032-Revert-x86-Move-x86-processor-cache-info-to-cpu_feat.patch b/meta/recipes-core/glibc/glibc/0032-Revert-x86-Move-x86-processor-cache-info-to-cpu_feat.patch
new file mode 100644
index 0000000000..0ff1eba82b
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0032-Revert-x86-Move-x86-processor-cache-info-to-cpu_feat.patch
@@ -0,0 +1,1074 @@
+From 961d681e38d30a4de06c980de0a96464fa3b4d74 Mon Sep 17 00:00:00 2001
+From: Andrei Gherzan <andrei@gherzan.com>
+Date: Fri, 19 Feb 2021 23:06:50 +0000
+Subject: [PATCH] Revert "x86: Move x86 processor cache info to cpu_features"
+
+This reverts commit 2d651eb9265d1366d7b9e881bfddd46db9c1ecc4.
+
+Upstream-Status: Pending
+Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
+---
+ sysdeps/x86/cacheinfo.c            |  46 +--
+ sysdeps/x86/cacheinfo.h            | 400 +++++++++++++++++++++++--
+ sysdeps/x86/cpu-features.c         |  35 ++-
+ sysdeps/x86/dl-cacheinfo.h         | 460 -----------------------------
+ sysdeps/x86/include/cpu-features.h |  22 --
+ 5 files changed, 412 insertions(+), 551 deletions(-)
+
+diff --git a/sysdeps/x86/cacheinfo.c b/sysdeps/x86/cacheinfo.c
+index 7b8df45e3b..948dbea3db 100644
+--- a/sysdeps/x86/cacheinfo.c
++++ b/sysdeps/x86/cacheinfo.c
+@@ -18,8 +18,11 @@
+ 
+ #if IS_IN (libc)
+ 
++#include <assert.h>
+ #include <unistd.h>
++#include <cpuid.h>
+ #include <ldsodefs.h>
++#include <dl-cacheinfo.h>
+ 
+ /* Get the value of the system variable NAME.  */
+ long int
+@@ -27,45 +30,20 @@ attribute_hidden
+ __cache_sysconf (int name)
+ {
+   const struct cpu_features *cpu_features = __get_cpu_features ();
+-  switch (name)
+-    {
+-    case _SC_LEVEL1_ICACHE_SIZE:
+-      return cpu_features->level1_icache_size;
+ 
+-    case _SC_LEVEL1_DCACHE_SIZE:
+-      return cpu_features->level1_dcache_size;
++  if (cpu_features->basic.kind == arch_kind_intel)
++    return handle_intel (name, cpu_features);
+ 
+-    case _SC_LEVEL1_DCACHE_ASSOC:
+-      return cpu_features->level1_dcache_assoc;
++  if (cpu_features->basic.kind == arch_kind_amd)
++    return handle_amd (name);
+ 
+-    case _SC_LEVEL1_DCACHE_LINESIZE:
+-      return cpu_features->level1_dcache_linesize;
++  if (cpu_features->basic.kind == arch_kind_zhaoxin)
++    return handle_zhaoxin (name);
+ 
+-    case _SC_LEVEL2_CACHE_SIZE:
+-      return cpu_features->level2_cache_size;
++  // XXX Fill in more vendors.
+ 
+-    case _SC_LEVEL2_CACHE_ASSOC:
+-      return cpu_features->level2_cache_assoc;
+-
+-    case _SC_LEVEL2_CACHE_LINESIZE:
+-      return cpu_features->level2_cache_linesize;
+-
+-    case _SC_LEVEL3_CACHE_SIZE:
+-      return cpu_features->level3_cache_size;
+-
+-    case _SC_LEVEL3_CACHE_ASSOC:
+-      return cpu_features->level3_cache_assoc;
+-
+-    case _SC_LEVEL3_CACHE_LINESIZE:
+-      return cpu_features->level3_cache_linesize;
+-
+-    case _SC_LEVEL4_CACHE_SIZE:
+-      return cpu_features->level4_cache_size;
+-
+-    default:
+-      break;
+-    }
+-  return -1;
++  /* CPU not known, we have no information.  */
++  return 0;
+ }
+ 
+ # ifdef SHARED
+diff --git a/sysdeps/x86/cacheinfo.h b/sysdeps/x86/cacheinfo.h
+index 68c253542f..736189f7f2 100644
+--- a/sysdeps/x86/cacheinfo.h
++++ b/sysdeps/x86/cacheinfo.h
+@@ -18,16 +18,7 @@
+ 
+ #include <assert.h>
+ #include <unistd.h>
+-#include <cpuid.h>
+-#include <cpu-features.h>
+ 
+-#if HAVE_TUNABLES
+-# define TUNABLE_NAMESPACE cpu
+-# include <unistd.h>		/* Get STDOUT_FILENO for _dl_printf.  */
+-# include <elf/dl-tunables.h>
+-#endif
+-
+-#if IS_IN (libc)
+ /* Data cache size for use in memory and string routines, typically
+    L1 size, rounded to multiple of 256 bytes.  */
+ long int __x86_data_cache_size_half attribute_hidden = 32 * 1024 / 2;
+@@ -54,30 +45,385 @@ long int __x86_rep_movsb_threshold attribute_hidden = 2048;
+ /* Threshold to use Enhanced REP STOSB.  */
+ long int __x86_rep_stosb_threshold attribute_hidden = 2048;
+ 
++static void
++get_common_cache_info (long int *shared_ptr, unsigned int *threads_ptr,
++		       long int core)
++{
++  unsigned int eax;
++  unsigned int ebx;
++  unsigned int ecx;
++  unsigned int edx;
++
++  /* Number of logical processors sharing L2 cache.  */
++  int threads_l2;
++
++  /* Number of logical processors sharing L3 cache.  */
++  int threads_l3;
++
++  const struct cpu_features *cpu_features = __get_cpu_features ();
++  int max_cpuid = cpu_features->basic.max_cpuid;
++  unsigned int family = cpu_features->basic.family;
++  unsigned int model = cpu_features->basic.model;
++  long int shared = *shared_ptr;
++  unsigned int threads = *threads_ptr;
++  bool inclusive_cache = true;
++  bool support_count_mask = true;
++
++  /* Try L3 first.  */
++  unsigned int level = 3;
++
++  if (cpu_features->basic.kind == arch_kind_zhaoxin && family == 6)
++    support_count_mask = false;
++
++  if (shared <= 0)
++    {
++      /* Try L2 otherwise.  */
++      level  = 2;
++      shared = core;
++      threads_l2 = 0;
++      threads_l3 = -1;
++    }
++  else
++    {
++      threads_l2 = 0;
++      threads_l3 = 0;
++    }
++
++  /* A value of 0 for the HTT bit indicates there is only a single
++     logical processor.  */
++  if (HAS_CPU_FEATURE (HTT))
++    {
++      /* Figure out the number of logical threads that share the
++         highest cache level.  */
++      if (max_cpuid >= 4)
++        {
++          int i = 0;
++
++          /* Query until cache level 2 and 3 are enumerated.  */
++          int check = 0x1 | (threads_l3 == 0) << 1;
++          do
++            {
++              __cpuid_count (4, i++, eax, ebx, ecx, edx);
++
++              /* There seems to be a bug in at least some Pentium Ds
++                 which sometimes fail to iterate all cache parameters.
++                 Do not loop indefinitely here, stop in this case and
++                 assume there is no such information.  */
++              if (cpu_features->basic.kind == arch_kind_intel
++                  && (eax & 0x1f) == 0 )
++                goto intel_bug_no_cache_info;
++
++              switch ((eax >> 5) & 0x7)
++                {
++                  default:
++                    break;
++                  case 2:
++                    if ((check & 0x1))
++                      {
++                        /* Get maximum number of logical processors
++                           sharing L2 cache.  */
++                        threads_l2 = (eax >> 14) & 0x3ff;
++                        check &= ~0x1;
++                      }
++                    break;
++                  case 3:
++                    if ((check & (0x1 << 1)))
++                      {
++                        /* Get maximum number of logical processors
++                           sharing L3 cache.  */
++                        threads_l3 = (eax >> 14) & 0x3ff;
++
++                        /* Check if L2 and L3 caches are inclusive.  */
++                        inclusive_cache = (edx & 0x2) != 0;
++                        check &= ~(0x1 << 1);
++                      }
++                    break;
++                }
++            }
++          while (check);
++
++          /* If max_cpuid >= 11, THREADS_L2/THREADS_L3 are the maximum
++             numbers of addressable IDs for logical processors sharing
++             the cache, instead of the maximum number of threads
++             sharing the cache.  */
++          if (max_cpuid >= 11 && support_count_mask)
++            {
++              /* Find the number of logical processors shipped in
++                 one core and apply count mask.  */
++              i = 0;
++
++              /* Count SMT only if there is L3 cache.  Always count
++                 core if there is no L3 cache.  */
++              int count = ((threads_l2 > 0 && level == 3)
++                           | ((threads_l3 > 0
++                               || (threads_l2 > 0 && level == 2)) << 1));
++
++              while (count)
++                {
++                  __cpuid_count (11, i++, eax, ebx, ecx, edx);
++
++                  int shipped = ebx & 0xff;
++                  int type = ecx & 0xff00;
++                  if (shipped == 0 || type == 0)
++                    break;
++                  else if (type == 0x100)
++                    {
++                      /* Count SMT.  */
++                      if ((count & 0x1))
++                        {
++                          int count_mask;
++
++                          /* Compute count mask.  */
++                          asm ("bsr %1, %0"
++                               : "=r" (count_mask) : "g" (threads_l2));
++                          count_mask = ~(-1 << (count_mask + 1));
++                          threads_l2 = (shipped - 1) & count_mask;
++                          count &= ~0x1;
++                        }
++                    }
++                  else if (type == 0x200)
++                    {
++                      /* Count core.  */
++                      if ((count & (0x1 << 1)))
++                        {
++                          int count_mask;
++                          int threads_core
++                            = (level == 2 ? threads_l2 : threads_l3);
++
++                          /* Compute count mask.  */
++                          asm ("bsr %1, %0"
++                               : "=r" (count_mask) : "g" (threads_core));
++                          count_mask = ~(-1 << (count_mask + 1));
++                          threads_core = (shipped - 1) & count_mask;
++                          if (level == 2)
++                            threads_l2 = threads_core;
++                          else
++                            threads_l3 = threads_core;
++                          count &= ~(0x1 << 1);
++                        }
++                    }
++                }
++            }
++          if (threads_l2 > 0)
++            threads_l2 += 1;
++          if (threads_l3 > 0)
++            threads_l3 += 1;
++          if (level == 2)
++            {
++              if (threads_l2)
++                {
++                  threads = threads_l2;
++                  if (cpu_features->basic.kind == arch_kind_intel
++                      && threads > 2
++                      && family == 6)
++                    switch (model)
++                      {
++                        case 0x37:
++                        case 0x4a:
++                        case 0x4d:
++                        case 0x5a:
++                        case 0x5d:
++                          /* Silvermont has L2 cache shared by 2 cores.  */
++                          threads = 2;
++                          break;
++                        default:
++                          break;
++                      }
++                }
++            }
++          else if (threads_l3)
++            threads = threads_l3;
++        }
++      else
++        {
++intel_bug_no_cache_info:
++          /* Assume that all logical threads share the highest cache
++             level.  */
++          threads
++	    = ((cpu_features->features[CPUID_INDEX_1].cpuid.ebx >> 16)
++		& 0xff);
++        }
++
++        /* Cap usage of highest cache level to the number of supported
++           threads.  */
++        if (shared > 0 && threads > 0)
++          shared /= threads;
++    }
++
++  /* Account for non-inclusive L2 and L3 caches.  */
++  if (!inclusive_cache)
++    {
++      if (threads_l2 > 0)
++        core /= threads_l2;
++      shared += core;
++    }
++
++  *shared_ptr = shared;
++  *threads_ptr = threads;
++}
++
+ static void
+ init_cacheinfo (void)
+ {
++  /* Find out what brand of processor.  */
++  unsigned int ebx;
++  unsigned int ecx;
++  unsigned int edx;
++  int max_cpuid_ex;
++  long int data = -1;
++  long int shared = -1;
++  long int core;
++  unsigned int threads = 0;
+   const struct cpu_features *cpu_features = __get_cpu_features ();
+-  long int data = cpu_features->data_cache_size;
+-  __x86_raw_data_cache_size_half = data / 2;
+-  __x86_raw_data_cache_size = data;
+-  /* Round data cache size to multiple of 256 bytes.  */
+-  data = data & ~255L;
+-  __x86_data_cache_size_half = data / 2;
+-  __x86_data_cache_size = data;
+-
+-  long int shared = cpu_features->shared_cache_size;
+-  __x86_raw_shared_cache_size_half = shared / 2;
+-  __x86_raw_shared_cache_size = shared;
+-  /* Round shared cache size to multiple of 256 bytes.  */
+-  shared = shared & ~255L;
+-  __x86_shared_cache_size_half = shared / 2;
+-  __x86_shared_cache_size = shared;
+ 
++  /* NB: In libc.so, cpu_features is defined in ld.so and is initialized
++     by DL_PLATFORM_INIT or IFUNC relocation before init_cacheinfo is
++     called by IFUNC relocation.  In libc.a, init_cacheinfo is called
++     from init_cpu_features by ARCH_INIT_CPU_FEATURES.  */
++  assert (cpu_features->basic.kind != arch_kind_unknown);
++
++  if (cpu_features->basic.kind == arch_kind_intel)
++    {
++      data = handle_intel (_SC_LEVEL1_DCACHE_SIZE, cpu_features);
++      core = handle_intel (_SC_LEVEL2_CACHE_SIZE, cpu_features);
++      shared = handle_intel (_SC_LEVEL3_CACHE_SIZE, cpu_features);
++
++      get_common_cache_info (&shared, &threads, core);
++    }
++  else if (cpu_features->basic.kind == arch_kind_zhaoxin)
++    {
++      data = handle_zhaoxin (_SC_LEVEL1_DCACHE_SIZE);
++      core = handle_zhaoxin (_SC_LEVEL2_CACHE_SIZE);
++      shared = handle_zhaoxin (_SC_LEVEL3_CACHE_SIZE);
++
++      get_common_cache_info (&shared, &threads, core);
++    }
++  else if (cpu_features->basic.kind == arch_kind_amd)
++    {
++      data   = handle_amd (_SC_LEVEL1_DCACHE_SIZE);
++      long int core = handle_amd (_SC_LEVEL2_CACHE_SIZE);
++      shared = handle_amd (_SC_LEVEL3_CACHE_SIZE);
++
++      /* Get maximum extended function. */
++      __cpuid (0x80000000, max_cpuid_ex, ebx, ecx, edx);
++
++      if (shared <= 0)
++	/* No shared L3 cache.  All we have is the L2 cache.  */
++	shared = core;
++      else
++	{
++	  /* Figure out the number of logical threads that share L3.  */
++	  if (max_cpuid_ex >= 0x80000008)
++	    {
++	      /* Get width of APIC ID.  */
++	      __cpuid (0x80000008, max_cpuid_ex, ebx, ecx, edx);
++	      threads = 1 << ((ecx >> 12) & 0x0f);
++	    }
++
++	  if (threads == 0 || cpu_features->basic.family >= 0x17)
++	    {
++	      /* If APIC ID width is not available, use logical
++		 processor count.  */
++	      __cpuid (0x00000001, max_cpuid_ex, ebx, ecx, edx);
++
++	      if ((edx & (1 << 28)) != 0)
++		threads = (ebx >> 16) & 0xff;
++	    }
++
++	  /* Cap usage of highest cache level to the number of
++	     supported threads.  */
++	  if (threads > 0)
++	    shared /= threads;
++
++	  /* Get shared cache per ccx for Zen architectures.  */
++	  if (cpu_features->basic.family >= 0x17)
++	    {
++	      unsigned int eax;
++
++	      /* Get number of threads share the L3 cache in CCX.  */
++	      __cpuid_count (0x8000001D, 0x3, eax, ebx, ecx, edx);
++
++	      unsigned int threads_per_ccx = ((eax >> 14) & 0xfff) + 1;
++	      shared *= threads_per_ccx;
++	    }
++	  else
++	    {
++	      /* Account for exclusive L2 and L3 caches.  */
++	      shared += core;
++            }
++      }
++    }
++
++  /* Prefer cache size configure via tuning.  */
++  if (cpu_features->data_cache_size != 0)
++    data = cpu_features->data_cache_size;
++
++  if (data > 0)
++    {
++      __x86_raw_data_cache_size_half = data / 2;
++      __x86_raw_data_cache_size = data;
++      /* Round data cache size to multiple of 256 bytes.  */
++      data = data & ~255L;
++      __x86_data_cache_size_half = data / 2;
++      __x86_data_cache_size = data;
++    }
++
++  /* Prefer cache size configure via tuning.  */
++  if (cpu_features->shared_cache_size != 0)
++    shared = cpu_features->shared_cache_size;
++
++  if (shared > 0)
++    {
++      __x86_raw_shared_cache_size_half = shared / 2;
++      __x86_raw_shared_cache_size = shared;
++      /* Round shared cache size to multiple of 256 bytes.  */
++      shared = shared & ~255L;
++      __x86_shared_cache_size_half = shared / 2;
++      __x86_shared_cache_size = shared;
++    }
++
++  /* The default setting for the non_temporal threshold is 3/4 of one
++     thread's share of the chip's cache. For most Intel and AMD processors
++     with an initial release date between 2017 and 2020, a thread's typical
++     share of the cache is from 500 KBytes to 2 MBytes. Using the 3/4
++     threshold leaves 125 KBytes to 500 KBytes of the thread's data
++     in cache after a maximum temporal copy, which will maintain
++     in cache a reasonable portion of the thread's stack and other
++     active data. If the threshold is set higher than one thread's
++     share of the cache, it has a substantial risk of negatively
++     impacting the performance of other threads running on the chip. */
+   __x86_shared_non_temporal_threshold
+-    = cpu_features->non_temporal_threshold;
++    = (cpu_features->non_temporal_threshold != 0
++       ? cpu_features->non_temporal_threshold
++       : __x86_shared_cache_size * 3 / 4);
++
++  /* NB: The REP MOVSB threshold must be greater than VEC_SIZE * 8.  */
++  unsigned int minimum_rep_movsb_threshold;
++  /* NB: The default REP MOVSB threshold is 2048 * (VEC_SIZE / 16).  */
++  unsigned int rep_movsb_threshold;
++  if (CPU_FEATURE_USABLE_P (cpu_features, AVX512F)
++      && !CPU_FEATURE_PREFERRED_P (cpu_features, Prefer_No_AVX512))
++    {
++      rep_movsb_threshold = 2048 * (64 / 16);
++      minimum_rep_movsb_threshold = 64 * 8;
++    }
++  else if (CPU_FEATURE_PREFERRED_P (cpu_features,
++				    AVX_Fast_Unaligned_Load))
++    {
++      rep_movsb_threshold = 2048 * (32 / 16);
++      minimum_rep_movsb_threshold = 32 * 8;
++    }
++  else
++    {
++      rep_movsb_threshold = 2048 * (16 / 16);
++      minimum_rep_movsb_threshold = 16 * 8;
++    }
++  if (cpu_features->rep_movsb_threshold > minimum_rep_movsb_threshold)
++    __x86_rep_movsb_threshold = cpu_features->rep_movsb_threshold;
++  else
++    __x86_rep_movsb_threshold = rep_movsb_threshold;
+ 
+-  __x86_rep_movsb_threshold = cpu_features->rep_movsb_threshold;
++# if HAVE_TUNABLES
+   __x86_rep_stosb_threshold = cpu_features->rep_stosb_threshold;
++# endif
+ }
+-#endif
+diff --git a/sysdeps/x86/cpu-features.c b/sysdeps/x86/cpu-features.c
+index 73b0a4dc9a..c9e51b5e5a 100644
+--- a/sysdeps/x86/cpu-features.c
++++ b/sysdeps/x86/cpu-features.c
+@@ -16,13 +16,22 @@
+    License along with the GNU C Library; if not, see
+    <https://www.gnu.org/licenses/>.  */
+ 
++#include <cpuid.h>
+ #include <dl-hwcap.h>
+ #include <libc-pointer-arith.h>
+ #include <get-isa-level.h>
+-#include <cacheinfo.h>
+-#include <dl-cacheinfo.h>
++#if IS_IN (libc) && !defined SHARED
++# include <assert.h>
++# include <unistd.h>
++# include <dl-cacheinfo.h>
++# include <cacheinfo.h>
++#endif
+ 
+ #if HAVE_TUNABLES
++# define TUNABLE_NAMESPACE cpu
++# include <unistd.h>		/* Get STDOUT_FILENO for _dl_printf.  */
++# include <elf/dl-tunables.h>
++
+ extern void TUNABLE_CALLBACK (set_hwcaps) (tunable_val_t *)
+   attribute_hidden;
+ 
+@@ -639,14 +648,24 @@ no_cpuid:
+   cpu_features->basic.model = model;
+   cpu_features->basic.stepping = stepping;
+ 
+-  dl_init_cacheinfo (cpu_features);
+-
+ #if HAVE_TUNABLES
+   TUNABLE_GET (hwcaps, tunable_val_t *, TUNABLE_CALLBACK (set_hwcaps));
+-#elif defined SHARED
+-  /* Reuse dl_platform, dl_hwcap and dl_hwcap_mask for x86.  The
+-     glibc.cpu.hwcap_mask tunable is initialized already, so no
+-     need to do this.  */
++  cpu_features->non_temporal_threshold
++    = TUNABLE_GET (x86_non_temporal_threshold, long int, NULL);
++  cpu_features->rep_movsb_threshold
++    = TUNABLE_GET (x86_rep_movsb_threshold, long int, NULL);
++  cpu_features->rep_stosb_threshold
++    = TUNABLE_GET (x86_rep_stosb_threshold, long int, NULL);
++  cpu_features->data_cache_size
++    = TUNABLE_GET (x86_data_cache_size, long int, NULL);
++  cpu_features->shared_cache_size
++    = TUNABLE_GET (x86_shared_cache_size, long int, NULL);
++#endif
++
++  /* Reuse dl_platform, dl_hwcap and dl_hwcap_mask for x86.  */
++#if !HAVE_TUNABLES && defined SHARED
++  /* The glibc.cpu.hwcap_mask tunable is initialized already, so no need to do
++     this.  */
+   GLRO(dl_hwcap_mask) = HWCAP_IMPORTANT;
+ #endif
+ 
+diff --git a/sysdeps/x86/dl-cacheinfo.h b/sysdeps/x86/dl-cacheinfo.h
+index a31fa0783a..6adce4147c 100644
+--- a/sysdeps/x86/dl-cacheinfo.h
++++ b/sysdeps/x86/dl-cacheinfo.h
+@@ -476,463 +476,3 @@ handle_zhaoxin (int name)
+   /* Nothing found.  */
+   return 0;
+ }
+-
+-static void
+-get_common_cache_info (long int *shared_ptr, unsigned int *threads_ptr,
+-                long int core)
+-{
+-  unsigned int eax;
+-  unsigned int ebx;
+-  unsigned int ecx;
+-  unsigned int edx;
+-
+-  /* Number of logical processors sharing L2 cache.  */
+-  int threads_l2;
+-
+-  /* Number of logical processors sharing L3 cache.  */
+-  int threads_l3;
+-
+-  const struct cpu_features *cpu_features = __get_cpu_features ();
+-  int max_cpuid = cpu_features->basic.max_cpuid;
+-  unsigned int family = cpu_features->basic.family;
+-  unsigned int model = cpu_features->basic.model;
+-  long int shared = *shared_ptr;
+-  unsigned int threads = *threads_ptr;
+-  bool inclusive_cache = true;
+-  bool support_count_mask = true;
+-
+-  /* Try L3 first.  */
+-  unsigned int level = 3;
+-
+-  if (cpu_features->basic.kind == arch_kind_zhaoxin && family == 6)
+-    support_count_mask = false;
+-
+-  if (shared <= 0)
+-    {
+-      /* Try L2 otherwise.  */
+-      level  = 2;
+-      shared = core;
+-      threads_l2 = 0;
+-      threads_l3 = -1;
+-    }
+-  else
+-    {
+-      threads_l2 = 0;
+-      threads_l3 = 0;
+-    }
+-
+-  /* A value of 0 for the HTT bit indicates there is only a single
+-     logical processor.  */
+-  if (HAS_CPU_FEATURE (HTT))
+-    {
+-      /* Figure out the number of logical threads that share the
+-         highest cache level.  */
+-      if (max_cpuid >= 4)
+-        {
+-          int i = 0;
+-
+-          /* Query until cache level 2 and 3 are enumerated.  */
+-          int check = 0x1 | (threads_l3 == 0) << 1;
+-          do
+-            {
+-              __cpuid_count (4, i++, eax, ebx, ecx, edx);
+-
+-              /* There seems to be a bug in at least some Pentium Ds
+-                 which sometimes fail to iterate all cache parameters.
+-                 Do not loop indefinitely here, stop in this case and
+-                 assume there is no such information.  */
+-              if (cpu_features->basic.kind == arch_kind_intel
+-                  && (eax & 0x1f) == 0 )
+-                goto intel_bug_no_cache_info;
+-
+-              switch ((eax >> 5) & 0x7)
+-                {
+-                  default:
+-                    break;
+-                  case 2:
+-                    if ((check & 0x1))
+-                      {
+-                        /* Get maximum number of logical processors
+-                           sharing L2 cache.  */
+-                        threads_l2 = (eax >> 14) & 0x3ff;
+-                        check &= ~0x1;
+-                      }
+-                    break;
+-                  case 3:
+-                    if ((check & (0x1 << 1)))
+-                      {
+-                        /* Get maximum number of logical processors
+-                           sharing L3 cache.  */
+-                        threads_l3 = (eax >> 14) & 0x3ff;
+-
+-                        /* Check if L2 and L3 caches are inclusive.  */
+-                        inclusive_cache = (edx & 0x2) != 0;
+-                        check &= ~(0x1 << 1);
+-                      }
+-                    break;
+-                }
+-            }
+-          while (check);
+-
+-          /* If max_cpuid >= 11, THREADS_L2/THREADS_L3 are the maximum
+-             numbers of addressable IDs for logical processors sharing
+-             the cache, instead of the maximum number of threads
+-             sharing the cache.  */
+-          if (max_cpuid >= 11 && support_count_mask)
+-            {
+-              /* Find the number of logical processors shipped in
+-                 one core and apply count mask.  */
+-              i = 0;
+-
+-              /* Count SMT only if there is L3 cache.  Always count
+-                 core if there is no L3 cache.  */
+-              int count = ((threads_l2 > 0 && level == 3)
+-                           | ((threads_l3 > 0
+-                               || (threads_l2 > 0 && level == 2)) << 1));
+-
+-              while (count)
+-                {
+-                  __cpuid_count (11, i++, eax, ebx, ecx, edx);
+-
+-                  int shipped = ebx & 0xff;
+-                  int type = ecx & 0xff00;
+-                  if (shipped == 0 || type == 0)
+-                    break;
+-                  else if (type == 0x100)
+-                    {
+-                      /* Count SMT.  */
+-                      if ((count & 0x1))
+-                        {
+-                          int count_mask;
+-
+-                          /* Compute count mask.  */
+-                          asm ("bsr %1, %0"
+-                               : "=r" (count_mask) : "g" (threads_l2));
+-                          count_mask = ~(-1 << (count_mask + 1));
+-                          threads_l2 = (shipped - 1) & count_mask;
+-                          count &= ~0x1;
+-                        }
+-                    }
+-                  else if (type == 0x200)
+-                    {
+-                      /* Count core.  */
+-                      if ((count & (0x1 << 1)))
+-                        {
+-                          int count_mask;
+-                          int threads_core
+-                            = (level == 2 ? threads_l2 : threads_l3);
+-
+-                          /* Compute count mask.  */
+-                          asm ("bsr %1, %0"
+-                               : "=r" (count_mask) : "g" (threads_core));
+-                          count_mask = ~(-1 << (count_mask + 1));
+-                          threads_core = (shipped - 1) & count_mask;
+-                          if (level == 2)
+-                            threads_l2 = threads_core;
+-                          else
+-                            threads_l3 = threads_core;
+-                          count &= ~(0x1 << 1);
+-                        }
+-                    }
+-                }
+-            }
+-          if (threads_l2 > 0)
+-            threads_l2 += 1;
+-          if (threads_l3 > 0)
+-            threads_l3 += 1;
+-          if (level == 2)
+-            {
+-              if (threads_l2)
+-                {
+-                  threads = threads_l2;
+-                  if (cpu_features->basic.kind == arch_kind_intel
+-                      && threads > 2
+-                      && family == 6)
+-                    switch (model)
+-                      {
+-                        case 0x37:
+-                        case 0x4a:
+-                        case 0x4d:
+-                        case 0x5a:
+-                        case 0x5d:
+-                          /* Silvermont has L2 cache shared by 2 cores.  */
+-                          threads = 2;
+-                          break;
+-                        default:
+-                          break;
+-                      }
+-                }
+-            }
+-          else if (threads_l3)
+-            threads = threads_l3;
+-        }
+-      else
+-        {
+-intel_bug_no_cache_info:
+-          /* Assume that all logical threads share the highest cache
+-             level.  */
+-          threads
+-            = ((cpu_features->features[CPUID_INDEX_1].cpuid.ebx >> 16)
+-	       & 0xff);
+-        }
+-
+-        /* Cap usage of highest cache level to the number of supported
+-           threads.  */
+-        if (shared > 0 && threads > 0)
+-          shared /= threads;
+-    }
+-
+-  /* Account for non-inclusive L2 and L3 caches.  */
+-  if (!inclusive_cache)
+-    {
+-      if (threads_l2 > 0)
+-        core /= threads_l2;
+-      shared += core;
+-    }
+-
+-  *shared_ptr = shared;
+-  *threads_ptr = threads;
+-}
+-
+-static void
+-dl_init_cacheinfo (struct cpu_features *cpu_features)
+-{
+-  /* Find out what brand of processor.  */
+-  unsigned int ebx;
+-  unsigned int ecx;
+-  unsigned int edx;
+-  int max_cpuid_ex;
+-  long int data = -1;
+-  long int shared = -1;
+-  long int core;
+-  unsigned int threads = 0;
+-  unsigned long int level1_icache_size = -1;
+-  unsigned long int level1_dcache_size = -1;
+-  unsigned long int level1_dcache_assoc = -1;
+-  unsigned long int level1_dcache_linesize = -1;
+-  unsigned long int level2_cache_size = -1;
+-  unsigned long int level2_cache_assoc = -1;
+-  unsigned long int level2_cache_linesize = -1;
+-  unsigned long int level3_cache_size = -1;
+-  unsigned long int level3_cache_assoc = -1;
+-  unsigned long int level3_cache_linesize = -1;
+-  unsigned long int level4_cache_size = -1;
+-
+-  if (cpu_features->basic.kind == arch_kind_intel)
+-    {
+-      data = handle_intel (_SC_LEVEL1_DCACHE_SIZE, cpu_features);
+-      core = handle_intel (_SC_LEVEL2_CACHE_SIZE, cpu_features);
+-      shared = handle_intel (_SC_LEVEL3_CACHE_SIZE, cpu_features);
+-
+-      level1_icache_size
+-	= handle_intel (_SC_LEVEL1_ICACHE_SIZE, cpu_features);
+-      level1_dcache_size = data;
+-      level1_dcache_assoc
+-	= handle_intel (_SC_LEVEL1_DCACHE_ASSOC, cpu_features);
+-      level1_dcache_linesize
+-	= handle_intel (_SC_LEVEL1_DCACHE_LINESIZE, cpu_features);
+-      level2_cache_size = core;
+-      level2_cache_assoc
+-	= handle_intel (_SC_LEVEL2_CACHE_ASSOC, cpu_features);
+-      level2_cache_linesize
+-	= handle_intel (_SC_LEVEL2_CACHE_LINESIZE, cpu_features);
+-      level3_cache_size = shared;
+-      level3_cache_assoc
+-	= handle_intel (_SC_LEVEL3_CACHE_ASSOC, cpu_features);
+-      level3_cache_linesize
+-	= handle_intel (_SC_LEVEL3_CACHE_LINESIZE, cpu_features);
+-      level4_cache_size
+-	= handle_intel (_SC_LEVEL4_CACHE_SIZE, cpu_features);
+-
+-      get_common_cache_info (&shared, &threads, core);
+-    }
+-  else if (cpu_features->basic.kind == arch_kind_zhaoxin)
+-    {
+-      data = handle_zhaoxin (_SC_LEVEL1_DCACHE_SIZE);
+-      core = handle_zhaoxin (_SC_LEVEL2_CACHE_SIZE);
+-      shared = handle_zhaoxin (_SC_LEVEL3_CACHE_SIZE);
+-
+-      level1_icache_size = handle_zhaoxin (_SC_LEVEL1_ICACHE_SIZE);
+-      level1_dcache_size = data;
+-      level1_dcache_assoc = handle_zhaoxin (_SC_LEVEL1_DCACHE_ASSOC);
+-      level1_dcache_linesize = handle_zhaoxin (_SC_LEVEL1_DCACHE_LINESIZE);
+-      level2_cache_size = core;
+-      level2_cache_assoc = handle_zhaoxin (_SC_LEVEL2_CACHE_ASSOC);
+-      level2_cache_linesize = handle_zhaoxin (_SC_LEVEL2_CACHE_LINESIZE);
+-      level3_cache_size = shared;
+-      level3_cache_assoc = handle_zhaoxin (_SC_LEVEL3_CACHE_ASSOC);
+-      level3_cache_linesize = handle_zhaoxin (_SC_LEVEL3_CACHE_LINESIZE);
+-
+-      get_common_cache_info (&shared, &threads, core);
+-    }
+-  else if (cpu_features->basic.kind == arch_kind_amd)
+-    {
+-      data  = handle_amd (_SC_LEVEL1_DCACHE_SIZE);
+-      core = handle_amd (_SC_LEVEL2_CACHE_SIZE);
+-      shared = handle_amd (_SC_LEVEL3_CACHE_SIZE);
+-
+-      level1_icache_size = handle_amd (_SC_LEVEL1_ICACHE_SIZE);
+-      level1_dcache_size = data;
+-      level1_dcache_assoc = handle_amd (_SC_LEVEL1_DCACHE_ASSOC);
+-      level1_dcache_linesize = handle_amd (_SC_LEVEL1_DCACHE_LINESIZE);
+-      level2_cache_size = core;
+-      level2_cache_assoc = handle_amd (_SC_LEVEL2_CACHE_ASSOC);
+-      level2_cache_linesize = handle_amd (_SC_LEVEL2_CACHE_LINESIZE);
+-      level3_cache_size = shared;
+-      level3_cache_assoc = handle_amd (_SC_LEVEL3_CACHE_ASSOC);
+-      level3_cache_linesize = handle_amd (_SC_LEVEL3_CACHE_LINESIZE);
+-
+-      /* Get maximum extended function. */
+-      __cpuid (0x80000000, max_cpuid_ex, ebx, ecx, edx);
+-
+-      if (shared <= 0)
+-	/* No shared L3 cache.  All we have is the L2 cache.  */
+-	shared = core;
+-      else
+-	{
+-	  /* Figure out the number of logical threads that share L3.  */
+-	  if (max_cpuid_ex >= 0x80000008)
+-	    {
+-	      /* Get width of APIC ID.  */
+-	      __cpuid (0x80000008, max_cpuid_ex, ebx, ecx, edx);
+-	      threads = 1 << ((ecx >> 12) & 0x0f);
+-	    }
+-
+-	  if (threads == 0 || cpu_features->basic.family >= 0x17)
+-	    {
+-	      /* If APIC ID width is not available, use logical
+-		 processor count.  */
+-	      __cpuid (0x00000001, max_cpuid_ex, ebx, ecx, edx);
+-
+-	      if ((edx & (1 << 28)) != 0)
+-		threads = (ebx >> 16) & 0xff;
+-	    }
+-
+-	  /* Cap usage of highest cache level to the number of
+-	     supported threads.  */
+-	  if (threads > 0)
+-	    shared /= threads;
+-
+-	  /* Get shared cache per ccx for Zen architectures.  */
+-	  if (cpu_features->basic.family >= 0x17)
+-	    {
+-	      unsigned int eax;
+-
+-	      /* Get number of threads share the L3 cache in CCX.  */
+-	      __cpuid_count (0x8000001D, 0x3, eax, ebx, ecx, edx);
+-
+-	      unsigned int threads_per_ccx = ((eax >> 14) & 0xfff) + 1;
+-	      shared *= threads_per_ccx;
+-	    }
+-	  else
+-	    {
+-	      /* Account for exclusive L2 and L3 caches.  */
+-	      shared += core;
+-            }
+-	}
+-    }
+-
+-  cpu_features->level1_icache_size = level1_icache_size;
+-  cpu_features->level1_dcache_size = level1_dcache_size;
+-  cpu_features->level1_dcache_assoc = level1_dcache_assoc;
+-  cpu_features->level1_dcache_linesize = level1_dcache_linesize;
+-  cpu_features->level2_cache_size = level2_cache_size;
+-  cpu_features->level2_cache_assoc = level2_cache_assoc;
+-  cpu_features->level2_cache_linesize = level2_cache_linesize;
+-  cpu_features->level3_cache_size = level3_cache_size;
+-  cpu_features->level3_cache_assoc = level3_cache_assoc;
+-  cpu_features->level3_cache_linesize = level3_cache_linesize;
+-  cpu_features->level4_cache_size = level4_cache_size;
+-
+-  /* The default setting for the non_temporal threshold is 3/4 of one
+-     thread's share of the chip's cache. For most Intel and AMD processors
+-     with an initial release date between 2017 and 2020, a thread's typical
+-     share of the cache is from 500 KBytes to 2 MBytes. Using the 3/4
+-     threshold leaves 125 KBytes to 500 KBytes of the thread's data
+-     in cache after a maximum temporal copy, which will maintain
+-     in cache a reasonable portion of the thread's stack and other
+-     active data. If the threshold is set higher than one thread's
+-     share of the cache, it has a substantial risk of negatively
+-     impacting the performance of other threads running on the chip. */
+-  unsigned long int non_temporal_threshold = shared * 3 / 4;
+-
+-#if HAVE_TUNABLES
+-  /* NB: The REP MOVSB threshold must be greater than VEC_SIZE * 8.  */
+-  unsigned int minimum_rep_movsb_threshold;
+-#endif
+-  /* NB: The default REP MOVSB threshold is 2048 * (VEC_SIZE / 16).  */
+-  unsigned int rep_movsb_threshold;
+-  if (CPU_FEATURE_USABLE_P (cpu_features, AVX512F)
+-      && !CPU_FEATURE_PREFERRED_P (cpu_features, Prefer_No_AVX512))
+-    {
+-      rep_movsb_threshold = 2048 * (64 / 16);
+-#if HAVE_TUNABLES
+-      minimum_rep_movsb_threshold = 64 * 8;
+-#endif
+-    }
+-  else if (CPU_FEATURE_PREFERRED_P (cpu_features,
+-				    AVX_Fast_Unaligned_Load))
+-    {
+-      rep_movsb_threshold = 2048 * (32 / 16);
+-#if HAVE_TUNABLES
+-      minimum_rep_movsb_threshold = 32 * 8;
+-#endif
+-    }
+-  else
+-    {
+-      rep_movsb_threshold = 2048 * (16 / 16);
+-#if HAVE_TUNABLES
+-      minimum_rep_movsb_threshold = 16 * 8;
+-#endif
+-    }
+-
+-  /* The default threshold to use Enhanced REP STOSB.  */
+-  unsigned long int rep_stosb_threshold = 2048;
+-
+-#if HAVE_TUNABLES
+-  long int tunable_size;
+-
+-  tunable_size = TUNABLE_GET (x86_data_cache_size, long int, NULL);
+-  /* NB: Ignore the default value 0.  */
+-  if (tunable_size != 0)
+-    data = tunable_size;
+-
+-  tunable_size = TUNABLE_GET (x86_shared_cache_size, long int, NULL);
+-  /* NB: Ignore the default value 0.  */
+-  if (tunable_size != 0)
+-    shared = tunable_size;
+-
+-  tunable_size = TUNABLE_GET (x86_non_temporal_threshold, long int, NULL);
+-  /* NB: Ignore the default value 0.  */
+-  if (tunable_size != 0)
+-    non_temporal_threshold = tunable_size;
+-
+-  tunable_size = TUNABLE_GET (x86_rep_movsb_threshold, long int, NULL);
+-  if (tunable_size > minimum_rep_movsb_threshold)
+-    rep_movsb_threshold = tunable_size;
+-
+-  /* NB: The default value of the x86_rep_stosb_threshold tunable is the
+-     same as the default value of __x86_rep_stosb_threshold and the
+-     minimum value is fixed.  */
+-  rep_stosb_threshold = TUNABLE_GET (x86_rep_stosb_threshold,
+-				     long int, NULL);
+-
+-  TUNABLE_SET_WITH_BOUNDS (x86_data_cache_size, long int, data,
+-			   0, (long int) -1);
+-  TUNABLE_SET_WITH_BOUNDS (x86_shared_cache_size, long int, shared,
+-			   0, (long int) -1);
+-  TUNABLE_SET_WITH_BOUNDS (x86_non_temporal_threshold, long int,
+-			   non_temporal_threshold, 0, (long int) -1);
+-  TUNABLE_SET_WITH_BOUNDS (x86_rep_movsb_threshold, long int,
+-			   rep_movsb_threshold,
+-			   minimum_rep_movsb_threshold, (long int) -1);
+-  TUNABLE_SET_WITH_BOUNDS (x86_rep_stosb_threshold, long int,
+-			   rep_stosb_threshold, 1, (long int) -1);
+-#endif
+-
+-  cpu_features->data_cache_size = data;
+-  cpu_features->shared_cache_size = shared;
+-  cpu_features->non_temporal_threshold = non_temporal_threshold;
+-  cpu_features->rep_movsb_threshold = rep_movsb_threshold;
+-  cpu_features->rep_stosb_threshold = rep_stosb_threshold;
+-}
+diff --git a/sysdeps/x86/include/cpu-features.h b/sysdeps/x86/include/cpu-features.h
+index 624736b40e..fb02f0607b 100644
+--- a/sysdeps/x86/include/cpu-features.h
++++ b/sysdeps/x86/include/cpu-features.h
+@@ -872,28 +872,6 @@ struct cpu_features
+   unsigned long int rep_movsb_threshold;
+   /* Threshold to use "rep stosb".  */
+   unsigned long int rep_stosb_threshold;
+-  /* _SC_LEVEL1_ICACHE_SIZE.  */
+-  unsigned long int level1_icache_size;
+-  /* _SC_LEVEL1_DCACHE_SIZE.  */
+-  unsigned long int level1_dcache_size;
+-  /* _SC_LEVEL1_DCACHE_ASSOC.  */
+-  unsigned long int level1_dcache_assoc;
+-  /* _SC_LEVEL1_DCACHE_LINESIZE.  */
+-  unsigned long int level1_dcache_linesize;
+-  /* _SC_LEVEL2_CACHE_ASSOC.  */
+-  unsigned long int level2_cache_size;
+-  /* _SC_LEVEL2_DCACHE_ASSOC.  */
+-  unsigned long int level2_cache_assoc;
+-  /* _SC_LEVEL2_CACHE_LINESIZE.  */
+-  unsigned long int level2_cache_linesize;
+-  /* /_SC_LEVEL3_CACHE_SIZE.  */
+-  unsigned long int level3_cache_size;
+-  /* _SC_LEVEL3_CACHE_ASSOC.  */
+-  unsigned long int level3_cache_assoc;
+-  /* _SC_LEVEL3_CACHE_LINESIZE.  */
+-  unsigned long int level3_cache_linesize;
+-  /* /_SC_LEVEL4_CACHE_SIZE.  */
+-  unsigned long int level4_cache_size;
+ };
+ 
+ /* Get a pointer to the CPU features structure.  */
diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb
index e0002e6046..dd4087f80b 100644
--- a/meta/recipes-core/glibc/glibc_2.33.bb
+++ b/meta/recipes-core/glibc/glibc_2.33.bb
@@ -15,11 +15,10 @@ NATIVESDKFIXES_class-nativesdk = "\
            file://faccessat2-perm.patch \
 "
 
-SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
+SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://etc/ld.so.conf \
            file://generate-supported.mk \
            file://makedbs.sh \
-           \
            ${NATIVESDKFIXES} \
            file://0008-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch \
            file://0009-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch \
@@ -44,6 +43,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch \
            file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
            file://0031-x86-Require-full-ISA-support-for-x86-64-level-marker.patch \
+           file://0032-Revert-x86-Move-x86-processor-cache-info-to-cpu_feat.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.30.1

