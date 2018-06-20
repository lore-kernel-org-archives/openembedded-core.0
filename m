Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id D84757557F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 15:37:15 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id w7-v6so1783557pfn.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 08:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=kMpJKu5xcezH3DhaKOKvylMj7cFLWuK8iOfY7Uo09uQ=;
	b=KH4vlaIMAQvez4MHVrW3kb54ZSP+2j8scLPhe8/MWJSiJB5MSOwgmXy4+pvedU/Cmz
	PXMr/TaJZg3uwEslDKVy1LRGEeZZal3gYaVkj58UkCm8zbL68dIi6STVMy5DiczLrYE8
	setE8QgsMQUPsf7s2KIQnXkxbX6HNVP7GmMuA6JsfkNuYdhBEavtdzuEQ8h52+gfPMFI
	jhwpE0hWlBAukZn0sDiVrXnK5K6hhhV0clHEiFCAhO0kSdXnfP36UKklFx6yK+ng/Lcu
	7WxRFRvKErenimtq52jNlFg7VQZST5lOtcImdCUUDNyQP7gwjXgI7rGWaARFew34JWmA
	X+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=kMpJKu5xcezH3DhaKOKvylMj7cFLWuK8iOfY7Uo09uQ=;
	b=HBsHHCP1nJNB6BxvZ5e7+M7/KJ4dIevNi1W8BHL6NIFz73mg0JPkbDHDMPDEaL48Dq
	Xk3ViOqa3Jyw/bBL59m4Yo+WiQosoCEW9g1wUwjWYF2hEbJMK6EH9oo7dEG9uT0LgFif
	K9zPENSo+FIJr25huwSUlE1NwbpHKGBVQIEkXamNxpnziZkfaDhmWba6kxHAIIVXSTD3
	xE1F4o58qrubrkCuEJi2DC3qEvm2ozLkWGpdbBZt4NSHU/yZbOUrqFBSvKd6z35Jijwk
	+qOq0xazqpauSeQgcyotgzZfKVXObfF+zVwVXaaEAWJaD2+jEiPJ9kj9sJXH6tLpUcTX
	2VAw==
X-Gm-Message-State: APt69E0Zp6eTAY5egTPIlNz6VlNF6vywTnkJEfOtDW6Kytebfdm2zA2q
	cltLkUWnR/5Pf6o+fFGrnb329A==
X-Google-Smtp-Source: ADUXVKJOmfdNFNA9lNsPBJmadH6M3fDi+m+0vGCKDyltAetkETBJxXQGgsSTqXQ0NahUkFDXL6ephQ==
X-Received: by 2002:a62:9d58:: with SMTP id
	i85-v6mr23386601pfd.76.1529509036699; 
	Wed, 20 Jun 2018 08:37:16 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:3431:f53:d718:7f78?
	([2601:202:4000:1184:3431:f53:d718:7f78])
	by smtp.gmail.com with ESMTPSA id
	j127-v6sm3285339pgc.10.2018.06.20.08.37.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Jun 2018 08:37:15 -0700 (PDT)
To: "Lei, Maohui" <leimaohui@cn.fujitsu.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <20180607100153.98443-1-zhixiong.chi@windriver.com>
	<1B56A49860EB2D45ADE3731B15C959FD0170F9D06E@G08CNEXMBPEKD01.g08.fujitsu.local>
	<CAJTo0LZGr_pVJm909T+dxG0bDi=paA6VpdcohacLh=tOqEWwuw@mail.gmail.com>
	<1B56A49860EB2D45ADE3731B15C959FD0170F9E8D4@G08CNEXMBPEKD01.g08.fujitsu.local>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <6c429c9c-b8a4-f315-1a23-a4023154fbdd@gmail.com>
Date: Wed, 20 Jun 2018 08:37:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1B56A49860EB2D45ADE3731B15C959FD0170F9E8D4@G08CNEXMBPEKD01.g08.fujitsu.local>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: fix CVE-2017-18269 and CVE-2018-11236
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
X-List-Received-Date: Wed, 20 Jun 2018 15:37:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 06/19/2018 08:12 PM, Lei, Maohui wrote:
> Hi Ross
>
> Ok, I'll do it. Thank you for your reply.
>
> Best regards
> Lei

in my stable/sumo-nmut for testing

- armin
>
>> -----Original Message-----
>> From: Burton, Ross [mailto:ross.burton@intel.com]
>> Sent: Tuesday, June 19, 2018 7:40 PM
>> To: Lei, Maohui
>> Cc: openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH] glibc: fix CVE-2017-18269 and CVE-2018-11236
>>
>> If you submit it as a sumo backport, then yes.
>>
>> Ross
>>
>> On 19 June 2018 at 07:29, Lei, Maohui <leimaohui@cn.fujitsu.com> wrote:
>>> Hi,
>>>
>>> Is there any plan to merge this patch into sumo branch? It is also apply to
>> sumo branch.
>>> Best regards
>>> Lei
>>>
>>>> -----Original Message-----
>>>> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-
>>>> core-bounces@lists.openembedded.org] On Behalf Of Zhixiong Chi
>>>> Sent: Thursday, June 07, 2018 6:02 PM
>>>> To: openembedded-core@lists.openembedded.org
>>>> Subject: [OE-core] [PATCH] glibc: fix CVE-2017-18269 and CVE-2018-11236
>>>>
>>>> Backport two CVE patches from the upstream
>>>> https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=summary
>>>> commit 5460617d1567657621107d895ee2dd83bc1f88f2
>>>> commit cd66c0e584c6d692bc8347b5e72723d02b8a8ada
>>>>
>>>> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
>>>> ---
>>>>  meta/recipes-core/glibc/glibc/CVE-2017-18269.patch | 178
>> +++++++++++++++++++++
>>>>  meta/recipes-core/glibc/glibc/CVE-2018-11236.patch | 164
>> +++++++++++++++++++
>>>>  meta/recipes-core/glibc/glibc_2.27.bb              |   2 +
>>>>  3 files changed, 344 insertions(+)
>>>>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2017-18269.patch
>>>>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2018-11236.patch
>>>>
>>>> diff --git a/meta/recipes-core/glibc/glibc/CVE-2017-18269.patch
>> b/meta/recipes-
>>>> core/glibc/glibc/CVE-2017-18269.patch
>>>> new file mode 100644
>>>> index 0000000000..d873c51e60
>>>> --- /dev/null
>>>> +++ b/meta/recipes-core/glibc/glibc/CVE-2017-18269.patch
>>>> @@ -0,0 +1,178 @@
>>>> +From cd66c0e584c6d692bc8347b5e72723d02b8a8ada Mon Sep 17 00:00:00 2001
>>>> +From: Andrew Senkevich <andrew.n.senkevich@gmail.com>
>>>> +Date: Fri, 23 Mar 2018 16:19:45 +0100
>>>> +Subject: [PATCH] Fix i386 memmove issue (bug 22644).
>>>> +
>>>> +     [BZ #22644]
>>>> +     * sysdeps/i386/i686/multiarch/memcpy-sse2-unaligned.S: Fixed
>>>> +     branch conditions.
>>>> +     * string/test-memmove.c (do_test2): New testcase.
>>>> +
>>>> +Upstream-Status: Backport
>>>> +CVE: CVE-2017-18269
>>>> +Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
>>>> +---
>>>> + ChangeLog                                          |  8 +++
>>>> + string/test-memmove.c                              | 58
>>>> ++++++++++++++++++++++
>>>> + .../i386/i686/multiarch/memcpy-sse2-unaligned.S    | 12 ++---
>>>> + 3 files changed, 72 insertions(+), 6 deletions(-)
>>>> +
>>>> +diff --git a/ChangeLog b/ChangeLog
>>>> +index 18ed09e..afdb766 100644
>>>> +--- a/ChangeLog
>>>> ++++ b/ChangeLog
>>>> +@@ -1,3 +1,11 @@
>>>> ++2018-03-23  Andrew Senkevich  <andrew.senkevich@intel.com>
>>>> ++        Max Horn  <max@quendi.de>
>>>> ++
>>>> ++    [BZ #22644]
>>>> ++    * sysdeps/i386/i686/multiarch/memcpy-sse2-unaligned.S: Fixed
>>>> ++    branch conditions.
>>>> ++    * string/test-memmove.c (do_test2): New testcase.
>>>> ++
>>>> + 2018-02-22  Andrew Waterman <andrew@sifive.com>
>>>> +
>>>> +     [BZ # 22884]
>>>> +diff --git a/string/test-memmove.c b/string/test-memmove.c
>>>> +index edc7a4c..64e3651 100644
>>>> +--- a/string/test-memmove.c
>>>> ++++ b/string/test-memmove.c
>>>> +@@ -24,6 +24,7 @@
>>>> + # define TEST_NAME "memmove"
>>>> + #endif
>>>> + #include "test-string.h"
>>>> ++#include <support/test-driver.h>
>>>> +
>>>> + char *simple_memmove (char *, const char *, size_t);
>>>> +
>>>> +@@ -245,6 +246,60 @@ do_random_tests (void)
>>>> +     }
>>>> + }
>>>> +
>>>> ++static void
>>>> ++do_test2 (void)
>>>> ++{
>>>> ++  size_t size = 0x20000000;
>>>> ++  uint32_t * large_buf;
>>>> ++
>>>> ++  large_buf = mmap ((void*) 0x70000000, size, PROT_READ | PROT_WRITE,
>>>> ++                MAP_PRIVATE | MAP_ANON, -1, 0);
>>>> ++
>>>> ++  if (large_buf == MAP_FAILED)
>>>> ++    error (EXIT_UNSUPPORTED, errno, "Large mmap failed");
>>>> ++
>>>> ++  if ((uintptr_t) large_buf > 0x80000000 - 128
>>>> ++      || 0x80000000 - (uintptr_t) large_buf > 0x20000000)
>>>> ++    {
>>>> ++      error (0, 0, "Large mmap allocated improperly");
>>>> ++      ret = EXIT_UNSUPPORTED;
>>>> ++      munmap ((void *) large_buf, size);
>>>> ++      return;
>>>> ++    }
>>>> ++
>>>> ++  size_t bytes_move = 0x80000000 - (uintptr_t) large_buf;
>>>> ++  size_t arr_size = bytes_move / sizeof (uint32_t);
>>>> ++  size_t i;
>>>> ++
>>>> ++  FOR_EACH_IMPL (impl, 0)
>>>> ++    {
>>>> ++      for (i = 0; i < arr_size; i++)
>>>> ++        large_buf[i] = (uint32_t) i;
>>>> ++
>>>> ++      uint32_t * dst = &large_buf[33];
>>>> ++
>>>> ++#ifdef TEST_BCOPY
>>>> ++      CALL (impl, (char *) large_buf, (char *) dst, bytes_move);
>>>> ++#else
>>>> ++      CALL (impl, (char *) dst, (char *) large_buf, bytes_move);
>>>> ++#endif
>>>> ++
>>>> ++      for (i = 0; i < arr_size; i++)
>>>> ++    {
>>>> ++      if (dst[i] != (uint32_t) i)
>>>> ++        {
>>>> ++          error (0, 0,
>>>> ++                 "Wrong result in function %s dst \"%p\" src \"%p\" offset
>>>> \"%zd\"",
>>>> ++                 impl->name, dst, large_buf, i);
>>>> ++          ret = 1;
>>>> ++          break;
>>>> ++        }
>>>> ++    }
>>>> ++    }
>>>> ++
>>>> ++  munmap ((void *) large_buf, size);
>>>> ++}
>>>> ++
>>>> + int
>>>> + test_main (void)
>>>> + {
>>>> +@@ -284,6 +339,9 @@ test_main (void)
>>>> +     }
>>>> +
>>>> +   do_random_tests ();
>>>> ++
>>>> ++  do_test2 ();
>>>> ++
>>>> +   return ret;
>>>> + }
>>>> +
>>>> +diff --git a/sysdeps/i386/i686/multiarch/memcpy-sse2-unaligned.S
>>>> b/sysdeps/i386/i686/multiarch/memcpy-sse2-unaligned.S
>>>> +index 9c3bbe7..9aa17de 100644
>>>> +--- a/sysdeps/i386/i686/multiarch/memcpy-sse2-unaligned.S
>>>> ++++ b/sysdeps/i386/i686/multiarch/memcpy-sse2-unaligned.S
>>>> +@@ -72,7 +72,7 @@ ENTRY (MEMCPY)
>>>> +     cmp     %edx, %eax
>>>> +
>>>> + # ifdef USE_AS_MEMMOVE
>>>> +-    jg      L(check_forward)
>>>> ++    ja      L(check_forward)
>>>> +
>>>> + L(mm_len_0_or_more_backward):
>>>> + /* Now do checks for lengths. We do [0..16], [16..32], [32..64], [64..128]
>>>> +@@ -81,7 +81,7 @@ L(mm_len_0_or_more_backward):
>>>> +     jbe     L(mm_len_0_16_bytes_backward)
>>>> +
>>>> +     cmpl    $32, %ecx
>>>> +-    jg      L(mm_len_32_or_more_backward)
>>>> ++    ja      L(mm_len_32_or_more_backward)
>>>> +
>>>> + /* Copy [0..32] and return.  */
>>>> +     movdqu  (%eax), %xmm0
>>>> +@@ -92,7 +92,7 @@ L(mm_len_0_or_more_backward):
>>>> +
>>>> + L(mm_len_32_or_more_backward):
>>>> +     cmpl    $64, %ecx
>>>> +-    jg      L(mm_len_64_or_more_backward)
>>>> ++    ja      L(mm_len_64_or_more_backward)
>>>> +
>>>> + /* Copy [0..64] and return.  */
>>>> +     movdqu  (%eax), %xmm0
>>>> +@@ -107,7 +107,7 @@ L(mm_len_32_or_more_backward):
>>>> +
>>>> + L(mm_len_64_or_more_backward):
>>>> +     cmpl    $128, %ecx
>>>> +-    jg      L(mm_len_128_or_more_backward)
>>>> ++    ja      L(mm_len_128_or_more_backward)
>>>> +
>>>> + /* Copy [0..128] and return.  */
>>>> +     movdqu  (%eax), %xmm0
>>>> +@@ -132,7 +132,7 @@ L(mm_len_128_or_more_backward):
>>>> +     add     %ecx, %eax
>>>> +     cmp     %edx, %eax
>>>> +     movl    SRC(%esp), %eax
>>>> +-    jle     L(forward)
>>>> ++    jbe     L(forward)
>>>> +     PUSH (%esi)
>>>> +     PUSH (%edi)
>>>> +     PUSH (%ebx)
>>>> +@@ -269,7 +269,7 @@ L(check_forward):
>>>> +     add     %edx, %ecx
>>>> +     cmp     %eax, %ecx
>>>> +     movl    LEN(%esp), %ecx
>>>> +-    jle     L(forward)
>>>> ++    jbe     L(forward)
>>>> +
>>>> + /* Now do checks for lengths. We do [0..16], [0..32], [0..64], [0..128]
>>>> +     separately.  */
>>>> +--
>>>> +2.9.3
>>>> diff --git a/meta/recipes-core/glibc/glibc/CVE-2018-11236.patch
>> b/meta/recipes-
>>>> core/glibc/glibc/CVE-2018-11236.patch
>>>> new file mode 100644
>>>> index 0000000000..e2bb40b0de
>>>> --- /dev/null
>>>> +++ b/meta/recipes-core/glibc/glibc/CVE-2018-11236.patch
>>>> @@ -0,0 +1,164 @@
>>>> +From 5460617d1567657621107d895ee2dd83bc1f88f2 Mon Sep 17 00:00:00 2001
>>>> +From: Paul Pluzhnikov <ppluzhnikov@google.com>
>>>> +Date: Tue, 8 May 2018 18:12:41 -0700
>>>> +Subject: [PATCH] Fix BZ 22786: integer addition overflow may cause stack
>>>> + buffer overflow when realpath() input length is close to SSIZE_MAX.
>>>> +
>>>> +2018-05-09  Paul Pluzhnikov  <ppluzhnikov@google.com>
>>>> +
>>>> +     [BZ #22786]
>>>> +     * stdlib/canonicalize.c (__realpath): Fix overflow in path length
>>>> +     computation.
>>>> +     * stdlib/Makefile (test-bz22786): New test.
>>>> +     * stdlib/test-bz22786.c: New test.
>>>> +
>>>> +CVE: CVE-2018-11236
>>>> +Upstream-Status: Backport
>>>> +Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
>>>> +---
>>>> + ChangeLog             |  8 +++++
>>>> + stdlib/Makefile       |  2 +-
>>>> + stdlib/canonicalize.c |  2 +-
>>>> + stdlib/test-bz22786.c | 90
>>>> +++++++++++++++++++++++++++++++++++++++++++++++++++
>>>> + 4 files changed, 100 insertions(+), 2 deletions(-)
>>>> + create mode 100644 stdlib/test-bz22786.c
>>>> +
>>>> +diff --git a/ChangeLog b/ChangeLog
>>>> +--- a/ChangeLog
>>>> ++++ b/ChangeLog
>>>> +@@ -1,3 +1,11 @@
>>>> ++2018-05-09  Paul Pluzhnikov  <ppluzhnikov@google.com>
>>>> ++
>>>> ++    [BZ #22786]
>>>> ++    * stdlib/canonicalize.c (__realpath): Fix overflow in path length
>>>> ++    computation.
>>>> ++    * stdlib/Makefile (test-bz22786): New test.
>>>> ++    * stdlib/test-bz22786.c: New test.
>>>> ++
>>>> + 2018-03-23  Andrew Senkevich  <andrew.senkevich@intel.com>
>>>> +         Max Horn  <max@quendi.de>
>>>> +
>>>> +diff --git a/stdlib/Makefile b/stdlib/Makefile
>>>> +index af1643c..1ddb1f9 100644
>>>> +--- a/stdlib/Makefile
>>>> ++++ b/stdlib/Makefile
>>>> +@@ -84,7 +84,7 @@ tests              := tst-strtol tst-strtod testmb
>> testrand
>>>> testsort testdiv   \
>>>> +                tst-cxa_atexit tst-on_exit test-atexit-race              \
>>>> +                test-at_quick_exit-race test-cxa_atexit-race             \
>>>> +                test-on_exit-race test-dlclose-exit-race                 \
>>>> +-               tst-makecontext-align
>>>> ++               tst-makecontext-align test-bz22786
>>>> +
>>>> + tests-internal      := tst-strtod1i tst-strtod3 tst-strtod4 tst-strtod5i \
>>>> +                tst-tls-atexit tst-tls-atexit-nodelete
>>>> +diff --git a/stdlib/canonicalize.c b/stdlib/canonicalize.c
>>>> +index 4135f3f..390fb43 100644
>>>> +--- a/stdlib/canonicalize.c
>>>> ++++ b/stdlib/canonicalize.c
>>>> +@@ -181,7 +181,7 @@ __realpath (const char *name, char *resolved)
>>>> +             extra_buf = __alloca (path_max);
>>>> +
>>>> +           len = strlen (end);
>>>> +-          if ((long int) (n + len) >= path_max)
>>>> ++          if (path_max - n <= len)
>>>> +             {
>>>> +               __set_errno (ENAMETOOLONG);
>>>> +               goto error;
>>>> +diff --git a/stdlib/test-bz22786.c b/stdlib/test-bz22786.c
>>>> +new file mode 100644
>>>> +index 0000000..e7837f9
>>>> +--- /dev/null
>>>> ++++ b/stdlib/test-bz22786.c
>>>> +@@ -0,0 +1,90 @@
>>>> ++/* Bug 22786: test for buffer overflow in realpath.
>>>> ++   Copyright (C) 2018 Free Software Foundation, Inc.
>>>> ++   This file is part of the GNU C Library.
>>>> ++
>>>> ++   The GNU C Library is free software; you can redistribute it and/or
>>>> ++   modify it under the terms of the GNU Lesser General Public
>>>> ++   License as published by the Free Software Foundation; either
>>>> ++   version 2.1 of the License, or (at your option) any later version.
>>>> ++
>>>> ++   The GNU C Library is distributed in the hope that it will be useful,
>>>> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
>>>> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>>>> ++   Lesser General Public License for more details.
>>>> ++
>>>> ++   You should have received a copy of the GNU Lesser General Public
>>>> ++   License along with the GNU C Library; if not, see
>>>> ++   <http://www.gnu.org/licenses/>.  */
>>>> ++
>>>> ++/* This file must be run from within a directory called "stdlib".  */
>>>> ++
>>>> ++#include <errno.h>
>>>> ++#include <limits.h>
>>>> ++#include <stdio.h>
>>>> ++#include <stdlib.h>
>>>> ++#include <string.h>
>>>> ++#include <unistd.h>
>>>> ++#include <sys/stat.h>
>>>> ++#include <sys/types.h>
>>>> ++#include <support/test-driver.h>
>>>> ++#include <libc-diag.h>
>>>> ++
>>>> ++static int
>>>> ++do_test (void)
>>>> ++{
>>>> ++  const char dir[] = "bz22786";
>>>> ++  const char lnk[] = "bz22786/symlink";
>>>> ++
>>>> ++  rmdir (dir);
>>>> ++  if (mkdir (dir, 0755) != 0 && errno != EEXIST)
>>>> ++    {
>>>> ++      printf ("mkdir %s: %m\n", dir);
>>>> ++      return EXIT_FAILURE;
>>>> ++    }
>>>> ++  if (symlink (".", lnk) != 0 && errno != EEXIST)
>>>> ++    {
>>>> ++      printf ("symlink (%s, %s): %m\n", dir, lnk);
>>>> ++      return EXIT_FAILURE;
>>>> ++    }
>>>> ++
>>>> ++  const size_t path_len = (size_t) INT_MAX + 1;
>>>> ++
>>>> ++  DIAG_PUSH_NEEDS_COMMENT;
>>>> ++#if __GNUC_PREREQ (7, 0)
>>>> ++  /* GCC 7 warns about too-large allocations; here we need such
>>>> ++     allocation to succeed for the test to work.  */
>>>> ++  DIAG_IGNORE_NEEDS_COMMENT (7, "-Walloc-size-larger-than=");
>>>> ++#endif
>>>> ++  char *path = malloc (path_len);
>>>> ++  DIAG_POP_NEEDS_COMMENT;
>>>> ++
>>>> ++  if (path == NULL)
>>>> ++    {
>>>> ++      printf ("malloc (%zu): %m\n", path_len);
>>>> ++      return EXIT_UNSUPPORTED;
>>>> ++    }
>>>> ++
>>>> ++  /* Construct very long path = "bz22786/symlink/aaaa....."  */
>>>> ++  char *p = mempcpy (path, lnk, sizeof (lnk) - 1);
>>>> ++  *(p++) = '/';
>>>> ++  memset (p, 'a', path_len - (path - p) - 2);
>>>> ++  p[path_len - (path - p) - 1] = '\0';
>>>> ++
>>>> ++  /* This call crashes before the fix for bz22786 on 32-bit platforms.  */
>>>> ++  p = realpath (path, NULL);
>>>> ++
>>>> ++  if (p != NULL || errno != ENAMETOOLONG)
>>>> ++    {
>>>> ++      printf ("realpath: %s (%m)", p);
>>>> ++      return EXIT_FAILURE;
>>>> ++    }
>>>> ++
>>>> ++  /* Cleanup.  */
>>>> ++  unlink (lnk);
>>>> ++  rmdir (dir);
>>>> ++
>>>> ++  return 0;
>>>> ++}
>>>> ++
>>>> ++#define TEST_FUNCTION do_test
>>>> ++#include <support/test-driver.c>
>>>> +--
>>>> +2.9.3
>>>> diff --git a/meta/recipes-core/glibc/glibc_2.27.bb b/meta/recipes-
>>>> core/glibc/glibc_2.27.bb
>>>> index d3bdeaefc3..fe23eb6653 100644
>>>> --- a/meta/recipes-core/glibc/glibc_2.27.bb
>>>> +++ b/meta/recipes-core/glibc/glibc_2.27.bb
>>>> @@ -44,6 +44,8 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc
>> \
>>>>             file://0028-bits-siginfo-consts.h-enum-definition-for-
>>>> TRAP_HWBKP.patch \
>>>>             file://0029-Replace-strncpy-with-memccpy-to-fix-Wstringop-
>>>> trunca.patch \
>>>>             file://0030-plural_c_no_preprocessor_lines.patch \
>>>> +           file://CVE-2017-18269.patch \
>>>> +           file://CVE-2018-11236.patch \
>>>>  "
>>>>
>>>>  NATIVESDKFIXES ?= ""
>>>> --
>>>> 2.11.0
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>
>>>
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


