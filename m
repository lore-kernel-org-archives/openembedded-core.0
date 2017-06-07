Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id BE31460107
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 01:39:54 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id v18so11148963pgb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Jun 2017 18:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=i0LAii0nPukAu2UjvMxFObVvdftRY2McTnIDnTgmsv4=;
	b=nalkvWnGz/p2Qc8x55/tdrEsQnkhIQYiBLsoqJDntlW8X85DD+OmMX9XOzrTjFuj2w
	U2Og3vBxEY4sKWofVrcG9aycJlErX1Oj1mitykOX7PvHXeVoN20Eb17p+iYk1w+V3o/n
	RGVVpu3caE/9nDVQr+F6C6LuWN4yGNNrD5Ys6HfRlL7g5Obzox47uRNjMsm4nvMNcoA2
	WA7nWsfmuKY2sqrWsfTx0OvL3fhgurdq0YSBdagXPEyNNzUg8kkRtNEpSNLEb+5e02xD
	6h8W9dnfsNU1UDRLnMbT0UHBFuiEkj/6KMduPUZwLUnEy/Wg/+oUBY+lUZxxV8tBD64i
	DveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=i0LAii0nPukAu2UjvMxFObVvdftRY2McTnIDnTgmsv4=;
	b=rtNqcvcH4a1WH7TJiAlwVeB8YknqqTaZLQ1y/8qxsbUW4KAVLZEd2kFBzdQA/GcwQQ
	ncOV5mf9wjpYwf76oQ73XxriN/OwLtfXWhtq4DSqTolpAvnYgJm5zfaRRQMakeeNas7v
	ZQIHJKRMYTZQeuwutSx4XdTKqzqmXNhQlQ2FVF/VqQnWg2zEKNCn/AnKFCGdtrt7mrhM
	sL1F+vu2B70iziQpBAvqBI9uXPZbRwM9v52e0FYcNdfpgUf49o0qHjFdLMKXMr2W8lKi
	5ggTPd2QVA/IjYy/mxSIsITXz1ctitF9/8uQZ6o2zV0rZ14IvRoZG6/asjiFdVoYebkE
	gmtA==
X-Gm-Message-State: AODbwcCdFrs2nGyWUUHu1iZemBiycEZqXkSOomCZpMtjWxQdJyph3tyo
	b2Xwjd6Uv8krH0Ojgl4=
X-Received: by 10.99.143.9 with SMTP id n9mr3734776pgd.145.1496799595730;
	Tue, 06 Jun 2017 18:39:55 -0700 (PDT)
Received: from [10.43.100.234] (50-233-148-156-static.hfc.comcastbusiness.net.
	[50.233.148.156])
	by smtp.gmail.com with ESMTPSA id q20sm186990pfa.58.2017.06.06.18.39.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Jun 2017 18:39:55 -0700 (PDT)
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1496696005-28913-1-git-send-email-ross.burton@intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <7c2056f3-f791-4480-da59-3999e6b09f14@gmail.com>
Date: Tue, 6 Jun 2017 18:39:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1496696005-28913-1-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH] libunwind: fix build failure on MIPS
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
X-List-Received-Date: Wed, 07 Jun 2017 01:39:55 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 06/05/2017 01:53 PM, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---

under what conditions is this failing? or what is the build failure 
message. The subject makes it sound like your host is a Mips system.


- armin
>   .../libunwind/libunwind/fix-mips.patch             | 134 +++++++++++++++++++++
>   meta/recipes-support/libunwind/libunwind_1.2.bb    |   1 +
>   2 files changed, 135 insertions(+)
>   create mode 100644 meta/recipes-support/libunwind/libunwind/fix-mips.patch
>
> diff --git a/meta/recipes-support/libunwind/libunwind/fix-mips.patch b/meta/recipes-support/libunwind/libunwind/fix-mips.patch
> new file mode 100644
> index 0000000..0022237
> --- /dev/null
> +++ b/meta/recipes-support/libunwind/libunwind/fix-mips.patch
> @@ -0,0 +1,134 @@
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +From 5f354cb7b9c84dae006f0ebd8ad7a78d7e2aad0c Mon Sep 17 00:00:00 2001
> +From: Dave Watson <davejwatson@fb.com>
> +Date: Wed, 25 Jan 2017 16:18:02 -0800
> +Subject: [PATCH] mips/tilegx: Add missing unwind_i.h header file
> +
> +reported-by: John Knight <John.Knight@belkin.com>
> +---
> + src/Makefile.am | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/Makefile.am b/src/Makefile.am
> +index 5d874755..7de4c425 100644
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -280,7 +280,7 @@ libunwind_hppa_la_SOURCES_hppa = $(libunwind_la_SOURCES_hppa_common)	\
> + 	hppa/Gresume.c hppa/Gstep.c
> +
> + # The list of files that go info libunwind and libunwind-mips:
> +-noinst_HEADERS += mips/init.h mips/offsets.h
> ++noinst_HEADERS += mips/init.h mips/offsets.h mips/unwind_i.h
> + libunwind_la_SOURCES_mips_common = $(libunwind_la_SOURCES_common)	    \
> + 	mips/is_fpreg.c mips/regname.c
> +
> +@@ -299,7 +299,7 @@ libunwind_mips_la_SOURCES_mips = $(libunwind_la_SOURCES_mips_common)	    \
> + 	mips/Gis_signal_frame.c mips/Gregs.c mips/Gresume.c mips/Gstep.c
> +
> + # The list of files that go info libunwind and libunwind-tilegx:
> +-noinst_HEADERS += tilegx/init.h tilegx/offsets.h
> ++noinst_HEADERS += tilegx/init.h tilegx/offsets.h tilegx/unwind_i.h
> + libunwind_la_SOURCES_tilegx_common = $(libunwind_la_SOURCES_common)	    \
> + 	tilegx/is_fpreg.c tilegx/regname.c
> +
> +diff --git a/src/mips/unwind_i.h b/src/mips/unwind_i.h
> +new file mode 100644
> +index 0000000..3382dcf
> +--- /dev/null
> ++++ b/src/mips/unwind_i.h
> +@@ -0,0 +1,43 @@
> ++/* libunwind - a platform-independent unwind library
> ++   Copyright (C) 2008 CodeSourcery
> ++
> ++This file is part of libunwind.
> ++
> ++Permission is hereby granted, free of charge, to any person obtaining
> ++a copy of this software and associated documentation files (the
> ++"Software"), to deal in the Software without restriction, including
> ++without limitation the rights to use, copy, modify, merge, publish,
> ++distribute, sublicense, and/or sell copies of the Software, and to
> ++permit persons to whom the Software is furnished to do so, subject to
> ++the following conditions:
> ++
> ++The above copyright notice and this permission notice shall be
> ++included in all copies or substantial portions of the Software.
> ++
> ++THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> ++EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> ++MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> ++NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
> ++LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
> ++OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
> ++WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
> ++
> ++#ifndef unwind_i_h
> ++#define unwind_i_h
> ++
> ++#include <stdint.h>
> ++
> ++#include <libunwind-mips.h>
> ++
> ++#include "libunwind_i.h"
> ++
> ++#define mips_lock                       UNW_OBJ(lock)
> ++#define mips_local_resume               UNW_OBJ(local_resume)
> ++#define mips_local_addr_space_init      UNW_OBJ(local_addr_space_init)
> ++
> ++extern int mips_local_resume (unw_addr_space_t as, unw_cursor_t *cursor,
> ++                             void *arg);
> ++
> ++extern void mips_local_addr_space_init (void);
> ++
> ++#endif /* unwind_i_h */
> +diff --git a/src/tilegx/unwind_i.h b/src/tilegx/unwind_i.h
> +new file mode 100644
> +index 0000000..aac7be3
> +--- /dev/null
> ++++ b/src/tilegx/unwind_i.h
> +@@ -0,0 +1,44 @@
> ++/* libunwind - a platform-independent unwind library
> ++   Copyright (C) 2008 CodeSourcery
> ++
> ++This file is part of libunwind.
> ++
> ++Permission is hereby granted, free of charge, to any person obtaining
> ++a copy of this software and associated documentation files (the
> ++"Software"), to deal in the Software without restriction, including
> ++without limitation the rights to use, copy, modify, merge, publish,
> ++distribute, sublicense, and/or sell copies of the Software, and to
> ++permit persons to whom the Software is furnished to do so, subject to
> ++the following conditions:
> ++
> ++The above copyright notice and this permission notice shall be
> ++included in all copies or substantial portions of the Software.
> ++
> ++THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> ++EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> ++MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> ++NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
> ++LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
> ++OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
> ++WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
> ++
> ++#ifndef unwind_i_h
> ++#define unwind_i_h
> ++
> ++#include <memory.h>
> ++#include <stdint.h>
> ++
> ++#include <libunwind-tilegx.h>
> ++
> ++#include "libunwind_i.h"
> ++
> ++#define tilegx_local_resume            UNW_OBJ(local_resume)
> ++#define tilegx_local_addr_space_init   UNW_OBJ(local_addr_space_init)
> ++
> ++extern int tilegx_local_resume (unw_addr_space_t as,
> ++                                unw_cursor_t *cursor,
> ++                                void *arg);
> ++
> ++extern void tilegx_local_addr_space_init (void);
> ++
> ++#endif /* unwind_i_h */
> diff --git a/meta/recipes-support/libunwind/libunwind_1.2.bb b/meta/recipes-support/libunwind/libunwind_1.2.bb
> index a398d33..e598e40 100644
> --- a/meta/recipes-support/libunwind/libunwind_1.2.bb
> +++ b/meta/recipes-support/libunwind/libunwind_1.2.bb
> @@ -11,6 +11,7 @@ SRC_URI = "http://download.savannah.nongnu.org/releases/libunwind/libunwind-${PV
>              file://0001-add-knobs-to-disable-enable-tests.patch \
>              file://0001-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch \
>              file://libunwind-1.1-x32.patch \
> +           file://fix-mips.patch \
>              "
>   
>   SRC_URI_append_libc-musl = " file://musl-header-conflict.patch"


