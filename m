Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6284F60053
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 14:31:10 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id p9so18121709pgc.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 06:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uvrhu+BngB4ILF/bxHE+3Yy/bH41kGJHG4j4Ih5b8Vg=;
	b=nmC5kndFHjHesIVPRvpHCLxnxpZy32mcVi9D1GRN04aVeYvIO+GuQ+JPYSnO7VuxA7
	WXGqHQ7IkOb9lH/FwE6BfdfC/2zDIZi6i7zf9g6H3lY7M0MRcxDoPm7kBEhWJr9IOhsf
	PY/bARVdZXbpMKZSip1Ngk+gPAdklu8ukw1fHnNQwemvxk1/wi3+znie9M9FMAjj34df
	4irPRh5629VuG2oW6UcSIM+zEsZqo55ecnB7eB01oJ0/zJyXBP7hecZX8j7tV2swtrOS
	Pm4qLhM58b6/9QlwAnU1c0qU+Fpb9YQcU6/mOnBOEUQ3TeM4YUTG5vIuCfZ7tkOVDvCq
	Amcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uvrhu+BngB4ILF/bxHE+3Yy/bH41kGJHG4j4Ih5b8Vg=;
	b=XjOzkag9UPm842cFastRUO7x3iW1ijVORg52ErGSzDnuXwMN46Y7pJ1ByJhVtKnw/N
	gVigWxd1m871h0X+fKDkHWCFtS+46qnrDrS5FCCT9XcF66O8adUzkflF4iEmB1YwMjZB
	5l5GQsKkcwi84hu1TRTghDL4/KvUlq02lbVXrW/oqWuf62f9xSsTs1wbnkwdI+g4MwtV
	Bl/ErFCVWtGupEGr697pgZy8iqQtnUbJmewtc/d4l1ParbNWexL+PIcVz1aQkNCUVhbl
	EFgfHLu77ptCbc8Ycc+Yhnt24lFKV6ljh2OkdxPkXwaMvxrh16RKjxv3/zzbtNUGHxcj
	iTmA==
X-Gm-Message-State: AJaThX67IP9+SOxatsMBKkzeCFX5CqdoldlpPV0CeEgxhV9HOiOvEPht
	w7ie0chpwxUAIdR2Trk08JMpO9aNwHfcEI0hTPs=
X-Google-Smtp-Source: AGs4zMbtTedWEv78ij5X9Y3ULcbBUQXYSTgi1I6dpVYgunrwJdevK1kth2P0dabULxpEHR510PBDzyH0OaygifTHVE0=
X-Received: by 10.98.105.134 with SMTP id e128mr18046009pfc.29.1510756271273; 
	Wed, 15 Nov 2017 06:31:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.167.106 with HTTP; Wed, 15 Nov 2017 06:30:40 -0800 (PST)
In-Reply-To: <CAPybu_1ajU788qR3J9buKf9CZ+FbGvGoYQX7nNAz0VwAMe6cJQ@mail.gmail.com>
References: <20171113125714.21427-1-ricardo.ribalda@gmail.com>
	<CAMKF1so_ciNyeNbo9GuxcT6qCw7XgykYGEY5LQ23ikqCJiMx4A@mail.gmail.com>
	<CAPybu_1ajU788qR3J9buKf9CZ+FbGvGoYQX7nNAz0VwAMe6cJQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Nov 2017 06:30:40 -0800
Message-ID: <CAMKF1sqR5zdw=im51h92Jv1ZKrw24__Ov1791517fX85fKN8cQ@mail.gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-7.2: Fix libgfortran build
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
X-List-Received-Date: Wed, 15 Nov 2017 14:31:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 15, 2017 at 12:21 AM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> Hello Khem
>
> I already did it on july
> https://patchwork.openembedded.org/patch/141497/
>
> but the patch is lost on the internet cracks :)
>

No problem, can you revive it and include with this request.

> On Wed, Nov 15, 2017 at 4:35 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Mon, Nov 13, 2017 at 4:57 AM, Ricardo Ribalda Delgado
>> <ricardo.ribalda@gmail.com> wrote:
>>> Without this patch libbacktrace cannot be included/link during
>>> libgfortran build.
>>>
>>> libbtool: link: cannot find the library
>>> `../libbacktrace/libbacktrace.la'
>>> or unhandled argument `../libbacktrace/libbacktrace.la
>>>
>>
>> This patch is ok.
>> while here, can you please backport this patch to gcc6 as well ?
>>
>>
>>> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>>> ---
>>>  meta/recipes-devtools/gcc/gcc-7.2.inc              |  1 +
>>>  .../gcc/gcc-7.2/0051-Fix-gfortran-build.patch      | 53 ++++++++++++++++++++++
>>>  2 files changed, 54 insertions(+)
>>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.2/0051-Fix-gfortran-build.patch
>>>
>>> diff --git a/meta/recipes-devtools/gcc/gcc-7.2.inc b/meta/recipes-devtools/gcc/gcc-7.2.inc
>>> index 1d40cba73175..ae3ed02d6ce3 100644
>>> --- a/meta/recipes-devtools/gcc/gcc-7.2.inc
>>> +++ b/meta/recipes-devtools/gcc/gcc-7.2.inc
>>> @@ -75,6 +75,7 @@ SRC_URI = "\
>>>             file://0048-gcc-Enable-static-PIE.patch \
>>>             file://fix-segmentation-fault-precompiled-hdr.patch \
>>>             file://0050-RISC-V-Handle-non-legitimate-address-in-riscv_legiti.patch \
>>> +          file://0051-Fix-gfortran-build.patch \
>>>             ${BACKPORTS} \
>>>  "
>>>  BACKPORTS = "\
>>> diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0051-Fix-gfortran-build.patch b/meta/recipes-devtools/gcc/gcc-7.2/0051-Fix-gfortran-build.patch
>>> new file mode 100644
>>> index 000000000000..a71b6b0bee0e
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/gcc/gcc-7.2/0051-Fix-gfortran-build.patch
>>> @@ -0,0 +1,53 @@
>>> +Without this patch libbacktrace cannot be included/link during
>>> +libgfortran build.
>>> +
>>> +libbtool: link: cannot find the library `../libbacktrace/libbacktrace.la'
>>> +or unhandled argument `../libbacktrace/libbacktrace.la'
>>> +
>>> +Upstream-Status: Inappropriate [OE specific]
>>> +Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>>> +
>>> +diff --git a/libgfortran/Makefile.am b/libgfortran/Makefile.am
>>> +index 2857af5943f9..e07760069a3c 100644
>>> +--- a/libgfortran/Makefile.am
>>> ++++ b/libgfortran/Makefile.am
>>> +@@ -37,7 +37,7 @@ toolexeclib_LTLIBRARIES = libgfortran.la
>>> + toolexeclib_DATA = libgfortran.spec
>>> + libgfortran_la_LINK = $(LINK) $(libgfortran_la_LDFLAGS)
>>> + libgfortran_la_LDFLAGS = -version-info `grep -v '^\#' $(srcdir)/libtool-version` \
>>> +-      $(LTLDFLAGS) $(LIBQUADLIB) ../libbacktrace/libbacktrace.la \
>>> ++      $(LTLDFLAGS) $(LIBQUADLIB) ../../libbacktrace/libbacktrace.la \
>>> +       $(HWCAP_LDFLAGS) \
>>> +       -lm $(extra_ldflags_libgfortran) \
>>> +       $(version_arg) -Wc,-shared-libgcc
>>> +@@ -64,7 +64,7 @@ AM_CPPFLAGS = -iquote$(srcdir)/io -I$(srcdir)/$(MULTISRCTOP)../gcc \
>>> +             -I$(MULTIBUILDTOP)../libgcc \
>>> +             -I$(srcdir)/$(MULTISRCTOP)../libbacktrace \
>>> +             -I$(MULTIBUILDTOP)../libbacktrace \
>>> +-            -I../libbacktrace
>>> ++            -I../../libbacktrace
>>> +
>>> + # Fortran rules for complex multiplication and division
>>> + AM_CFLAGS += -fcx-fortran-rules
>>> +diff --git a/libgfortran/Makefile.in b/libgfortran/Makefile.in
>>> +index 05b183dcadb0..c9e0280e412c 100644
>>> +--- a/libgfortran/Makefile.in
>>> ++++ b/libgfortran/Makefile.in
>>> +@@ -581,7 +581,7 @@ toolexeclib_LTLIBRARIES = libgfortran.la
>>> + toolexeclib_DATA = libgfortran.spec
>>> + libgfortran_la_LINK = $(LINK) $(libgfortran_la_LDFLAGS)
>>> + libgfortran_la_LDFLAGS = -version-info `grep -v '^\#' $(srcdir)/libtool-version` \
>>> +-      $(LTLDFLAGS) $(LIBQUADLIB) ../libbacktrace/libbacktrace.la \
>>> ++      $(LTLDFLAGS) $(LIBQUADLIB) ../../libbacktrace/libbacktrace.la \
>>> +       $(HWCAP_LDFLAGS) \
>>> +       -lm $(extra_ldflags_libgfortran) \
>>> +       $(version_arg) -Wc,-shared-libgcc
>>> +@@ -602,7 +602,7 @@ AM_CPPFLAGS = -iquote$(srcdir)/io -I$(srcdir)/$(MULTISRCTOP)../gcc \
>>> +             -I$(MULTIBUILDTOP)../libgcc \
>>> +             -I$(srcdir)/$(MULTISRCTOP)../libbacktrace \
>>> +             -I$(MULTIBUILDTOP)../libbacktrace \
>>> +-            -I../libbacktrace
>>> ++            -I../../libbacktrace
>>> +
>>> + gfor_io_src = io/size_from_kind.c $(am__append_2)
>>> + gfor_io_headers = \
>>> --
>>> 2.15.0
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> Ricardo Ribalda

