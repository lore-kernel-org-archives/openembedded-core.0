Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 76E0660765
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 04:09:50 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id k15so586189wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Jun 2017 21:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9f0w6m/4rhfX0Q/1I2LVV+5pKrJsO+nDbE+Epy1zcMU=;
	b=BoQSDFrVzFbFyq6KTFveTg32n/ZApD0OmREJS5jj27CuzQh1+as+ZPPEF4PB4rH8F7
	BLB2I6Oh/dIkbJd/SovxVReZocY9UxE2I6EsGV3SnsP5uwzEICNxXrgx217RDwxB5Sc4
	O3zSpeuWitJ4lLVLoZ6jNMtZ3y1JGkREnqOX7zB4BV99+y0frArA9KQoYbEVghewqH7B
	qGBpHCnba3aXFot18QzD6H9lEfDY3eRS50XEc4bzKzw64XRVut/LWiNFM/w1OFEsnwnW
	b6iLldd2AUEKTGcADgqxLUIwym2Z2A/LnopHH1/0YfgwsfgpvBUEvZRMPHCP1OCBhxOp
	xZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9f0w6m/4rhfX0Q/1I2LVV+5pKrJsO+nDbE+Epy1zcMU=;
	b=d3YO68v0XwnhaEzsUa4RxHlY1o/gOsJxTnWMuit7qPhHrmONAiawTJea4T4Cb+/mjG
	fWivJAdSFEhliT0oA4AaGdPk80LWhRnl+XnbraUOVPuSivRIHvsiQowSgPP/jV4A4GAA
	zI0fZIrjGG38EY5uUBCjNh7aGXxX3N56hGaO/ZjbPMGvtiATp5WkpJz86GsC4oX4AZY6
	tQuvfIf2vwLfnN7/j3AkL13freE9WjJOitzTLGs6poseyxAK2GKROozahHCbBany6xPx
	gVRqyY3Alav0NIAjK2EAqVnmwjHxmiOcaiP0TqhVos5KA1oAuM61f2E+6EU9COFqMjU6
	sKQw==
X-Gm-Message-State: AODbwcD0MynCGf0b9c3kQWvIfWsISPpFB1PyYu8lvIfU8PrlQX7MDUDc
	CWzAS1YzBwP5LmLE3q/WGyzcOygALw==
X-Received: by 10.80.180.155 with SMTP id w27mr23063813edd.42.1496808591077;
	Tue, 06 Jun 2017 21:09:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.153.222 with HTTP; Tue, 6 Jun 2017 21:09:20 -0700 (PDT)
In-Reply-To: <7c2056f3-f791-4480-da59-3999e6b09f14@gmail.com>
References: <1496696005-28913-1-git-send-email-ross.burton@intel.com>
	<7c2056f3-f791-4480-da59-3999e6b09f14@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Jun 2017 21:09:20 -0700
Message-ID: <CAMKF1srcxxFiJUQwxr4xzTyLmwKOxFYqYnRpE5_4fQax8sZ+_w@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 07 Jun 2017 04:09:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 6, 2017 at 6:39 PM, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 06/05/2017 01:53 PM, Ross Burton wrote:
>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>
>
> under what conditions is this failing? or what is the build failure message.
> The subject makes it sound like your host is a Mips system.

Realistically mips desktops are rare moreover OE is a cross
build system so I would think its mips target

>
>
> - armin
>
>>   .../libunwind/libunwind/fix-mips.patch             | 134
>> +++++++++++++++++++++
>>   meta/recipes-support/libunwind/libunwind_1.2.bb    |   1 +
>>   2 files changed, 135 insertions(+)
>>   create mode 100644
>> meta/recipes-support/libunwind/libunwind/fix-mips.patch
>>
>> diff --git a/meta/recipes-support/libunwind/libunwind/fix-mips.patch
>> b/meta/recipes-support/libunwind/libunwind/fix-mips.patch
>> new file mode 100644
>> index 0000000..0022237
>> --- /dev/null
>> +++ b/meta/recipes-support/libunwind/libunwind/fix-mips.patch
>> @@ -0,0 +1,134 @@
>> +Upstream-Status: Backport
>> +Signed-off-by: Ross Burton <ross.burton@intel.com>
>> +
>> +From 5f354cb7b9c84dae006f0ebd8ad7a78d7e2aad0c Mon Sep 17 00:00:00 2001
>> +From: Dave Watson <davejwatson@fb.com>
>> +Date: Wed, 25 Jan 2017 16:18:02 -0800
>> +Subject: [PATCH] mips/tilegx: Add missing unwind_i.h header file
>> +
>> +reported-by: John Knight <John.Knight@belkin.com>
>> +---
>> + src/Makefile.am | 4 ++--
>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/src/Makefile.am b/src/Makefile.am
>> +index 5d874755..7de4c425 100644
>> +--- a/src/Makefile.am
>> ++++ b/src/Makefile.am
>> +@@ -280,7 +280,7 @@ libunwind_hppa_la_SOURCES_hppa =
>> $(libunwind_la_SOURCES_hppa_common)       \
>> +       hppa/Gresume.c hppa/Gstep.c
>> +
>> + # The list of files that go info libunwind and libunwind-mips:
>> +-noinst_HEADERS += mips/init.h mips/offsets.h
>> ++noinst_HEADERS += mips/init.h mips/offsets.h mips/unwind_i.h
>> + libunwind_la_SOURCES_mips_common = $(libunwind_la_SOURCES_common)
>> \
>> +       mips/is_fpreg.c mips/regname.c
>> +
>> +@@ -299,7 +299,7 @@ libunwind_mips_la_SOURCES_mips =
>> $(libunwind_la_SOURCES_mips_common)           \
>> +       mips/Gis_signal_frame.c mips/Gregs.c mips/Gresume.c mips/Gstep.c
>> +
>> + # The list of files that go info libunwind and libunwind-tilegx:
>> +-noinst_HEADERS += tilegx/init.h tilegx/offsets.h
>> ++noinst_HEADERS += tilegx/init.h tilegx/offsets.h tilegx/unwind_i.h
>> + libunwind_la_SOURCES_tilegx_common = $(libunwind_la_SOURCES_common)
>> \
>> +       tilegx/is_fpreg.c tilegx/regname.c
>> +
>> +diff --git a/src/mips/unwind_i.h b/src/mips/unwind_i.h
>> +new file mode 100644
>> +index 0000000..3382dcf
>> +--- /dev/null
>> ++++ b/src/mips/unwind_i.h
>> +@@ -0,0 +1,43 @@
>> ++/* libunwind - a platform-independent unwind library
>> ++   Copyright (C) 2008 CodeSourcery
>> ++
>> ++This file is part of libunwind.
>> ++
>> ++Permission is hereby granted, free of charge, to any person obtaining
>> ++a copy of this software and associated documentation files (the
>> ++"Software"), to deal in the Software without restriction, including
>> ++without limitation the rights to use, copy, modify, merge, publish,
>> ++distribute, sublicense, and/or sell copies of the Software, and to
>> ++permit persons to whom the Software is furnished to do so, subject to
>> ++the following conditions:
>> ++
>> ++The above copyright notice and this permission notice shall be
>> ++included in all copies or substantial portions of the Software.
>> ++
>> ++THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>> ++EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>> ++MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>> ++NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
>> ++LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
>> ++OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
>> ++WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
>> ++
>> ++#ifndef unwind_i_h
>> ++#define unwind_i_h
>> ++
>> ++#include <stdint.h>
>> ++
>> ++#include <libunwind-mips.h>
>> ++
>> ++#include "libunwind_i.h"
>> ++
>> ++#define mips_lock                       UNW_OBJ(lock)
>> ++#define mips_local_resume               UNW_OBJ(local_resume)
>> ++#define mips_local_addr_space_init      UNW_OBJ(local_addr_space_init)
>> ++
>> ++extern int mips_local_resume (unw_addr_space_t as, unw_cursor_t *cursor,
>> ++                             void *arg);
>> ++
>> ++extern void mips_local_addr_space_init (void);
>> ++
>> ++#endif /* unwind_i_h */
>> +diff --git a/src/tilegx/unwind_i.h b/src/tilegx/unwind_i.h
>> +new file mode 100644
>> +index 0000000..aac7be3
>> +--- /dev/null
>> ++++ b/src/tilegx/unwind_i.h
>> +@@ -0,0 +1,44 @@
>> ++/* libunwind - a platform-independent unwind library
>> ++   Copyright (C) 2008 CodeSourcery
>> ++
>> ++This file is part of libunwind.
>> ++
>> ++Permission is hereby granted, free of charge, to any person obtaining
>> ++a copy of this software and associated documentation files (the
>> ++"Software"), to deal in the Software without restriction, including
>> ++without limitation the rights to use, copy, modify, merge, publish,
>> ++distribute, sublicense, and/or sell copies of the Software, and to
>> ++permit persons to whom the Software is furnished to do so, subject to
>> ++the following conditions:
>> ++
>> ++The above copyright notice and this permission notice shall be
>> ++included in all copies or substantial portions of the Software.
>> ++
>> ++THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>> ++EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>> ++MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>> ++NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
>> ++LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
>> ++OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
>> ++WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
>> ++
>> ++#ifndef unwind_i_h
>> ++#define unwind_i_h
>> ++
>> ++#include <memory.h>
>> ++#include <stdint.h>
>> ++
>> ++#include <libunwind-tilegx.h>
>> ++
>> ++#include "libunwind_i.h"
>> ++
>> ++#define tilegx_local_resume            UNW_OBJ(local_resume)
>> ++#define tilegx_local_addr_space_init   UNW_OBJ(local_addr_space_init)
>> ++
>> ++extern int tilegx_local_resume (unw_addr_space_t as,
>> ++                                unw_cursor_t *cursor,
>> ++                                void *arg);
>> ++
>> ++extern void tilegx_local_addr_space_init (void);
>> ++
>> ++#endif /* unwind_i_h */
>> diff --git a/meta/recipes-support/libunwind/libunwind_1.2.bb
>> b/meta/recipes-support/libunwind/libunwind_1.2.bb
>> index a398d33..e598e40 100644
>> --- a/meta/recipes-support/libunwind/libunwind_1.2.bb
>> +++ b/meta/recipes-support/libunwind/libunwind_1.2.bb
>> @@ -11,6 +11,7 @@ SRC_URI =
>> "http://download.savannah.nongnu.org/releases/libunwind/libunwind-${PV
>>              file://0001-add-knobs-to-disable-enable-tests.patch \
>>
>> file://0001-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch \
>>              file://libunwind-1.1-x32.patch \
>> +           file://fix-mips.patch \
>>              "
>>     SRC_URI_append_libc-musl = " file://musl-header-conflict.patch"
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

