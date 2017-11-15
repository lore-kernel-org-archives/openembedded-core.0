Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 43CED780F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 08:21:59 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id x68so1217827lff.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 00:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iVOBOmyKQjl9m/uGN/Ffi8CUcuHZZMKQ/CXvUyVjrPc=;
	b=IpeeffU1rxCJy+v63Cx2/IrvMUopClq5Gs2D3Wem9zD6eTyrOtRy7RBJR2hpVS038b
	Dv2+4SNg3Kv9gHgcbKizLEtr0ETFOhtuDDC7WPpgIL0T7+8F/f/zHO/knzW5CWZWmUXw
	uemE7rIBEl7omKxLWuK/Xfd74R/xnLAXFDZZzPyL73Mej/f0XTdzsin2et3xHqOOPIbr
	x+M1Yg1tNHcPFh0Ea/JXWqhegLMBaIGW6ZbfU1EPKuv21QmN1aU8CI3IqMIN2wVd1zXr
	PGT2u/Ns8UrvAWxoYZRnjnnSmLn2CeKX1GBnWB7rvT35g/lT0U3BsPXrZjtqbpMsD7eO
	8lpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iVOBOmyKQjl9m/uGN/Ffi8CUcuHZZMKQ/CXvUyVjrPc=;
	b=od4Xcilr/dPcGaBZSKzFbNtchyy8CyBGg/+UzNQGZxjBcQBpprej7hRRx0H81lMfpi
	NKp3PgO3Vv8VcUZWXMfgnv9ICi7wHLYxt5Ba18nslMA3wi4E32+y0d/7UFe2zZYfJTAR
	wWGFDXV55j0MKnrlTXgp3FS5mRggih727nCpiwMERwRKjFTsWEnE/xcXWDC1+IAmzpci
	Z1sVnugxO3kjyJ8iImcXZd/PHCE2FITJgIZSPVyi7bCr0VhbOUx7ch7+E9WNCwkKpcXv
	jsjb6vulsNp0IOiAnytMKkNDydpX5YcPxh7YcfNFLUAJaIksrVT/ifCN/Gm7ZhaXvEwa
	D5DQ==
X-Gm-Message-State: AJaThX6nk2AkH+eW1XcvQ6Z5bT3+ZeypHJ6iuZQKJ6kqv//ZZjGSC1Bg
	+n/jkLSUKiUW/1JXAul5SD6xlXS6o4wyDesmErc=
X-Google-Smtp-Source: AGs4zMbL5Y1jwh5RTeg5EK7OMTvh981nMxhSRk7svKfcyd53bHizV5lV3CehmQd08Bsx5xSc0YyF5D1s1751cx/D4Ek=
X-Received: by 10.25.163.11 with SMTP id m11mr5263015lfe.179.1510734120695;
	Wed, 15 Nov 2017 00:22:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.143.11 with HTTP; Wed, 15 Nov 2017 00:21:39 -0800 (PST)
In-Reply-To: <CAMKF1so_ciNyeNbo9GuxcT6qCw7XgykYGEY5LQ23ikqCJiMx4A@mail.gmail.com>
References: <20171113125714.21427-1-ricardo.ribalda@gmail.com>
	<CAMKF1so_ciNyeNbo9GuxcT6qCw7XgykYGEY5LQ23ikqCJiMx4A@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 15 Nov 2017 09:21:39 +0100
Message-ID: <CAPybu_1ajU788qR3J9buKf9CZ+FbGvGoYQX7nNAz0VwAMe6cJQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Wed, 15 Nov 2017 08:22:00 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Khem

I already did it on july
https://patchwork.openembedded.org/patch/141497/

but the patch is lost on the internet cracks :)

On Wed, Nov 15, 2017 at 4:35 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Nov 13, 2017 at 4:57 AM, Ricardo Ribalda Delgado
> <ricardo.ribalda@gmail.com> wrote:
>> Without this patch libbacktrace cannot be included/link during
>> libgfortran build.
>>
>> libbtool: link: cannot find the library
>> `../libbacktrace/libbacktrace.la'
>> or unhandled argument `../libbacktrace/libbacktrace.la
>>
>
> This patch is ok.
> while here, can you please backport this patch to gcc6 as well ?
>
>
>> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>> ---
>>  meta/recipes-devtools/gcc/gcc-7.2.inc              |  1 +
>>  .../gcc/gcc-7.2/0051-Fix-gfortran-build.patch      | 53 ++++++++++++++++++++++
>>  2 files changed, 54 insertions(+)
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.2/0051-Fix-gfortran-build.patch
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-7.2.inc b/meta/recipes-devtools/gcc/gcc-7.2.inc
>> index 1d40cba73175..ae3ed02d6ce3 100644
>> --- a/meta/recipes-devtools/gcc/gcc-7.2.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-7.2.inc
>> @@ -75,6 +75,7 @@ SRC_URI = "\
>>             file://0048-gcc-Enable-static-PIE.patch \
>>             file://fix-segmentation-fault-precompiled-hdr.patch \
>>             file://0050-RISC-V-Handle-non-legitimate-address-in-riscv_legiti.patch \
>> +          file://0051-Fix-gfortran-build.patch \
>>             ${BACKPORTS} \
>>  "
>>  BACKPORTS = "\
>> diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0051-Fix-gfortran-build.patch b/meta/recipes-devtools/gcc/gcc-7.2/0051-Fix-gfortran-build.patch
>> new file mode 100644
>> index 000000000000..a71b6b0bee0e
>> --- /dev/null
>> +++ b/meta/recipes-devtools/gcc/gcc-7.2/0051-Fix-gfortran-build.patch
>> @@ -0,0 +1,53 @@
>> +Without this patch libbacktrace cannot be included/link during
>> +libgfortran build.
>> +
>> +libbtool: link: cannot find the library `../libbacktrace/libbacktrace.la'
>> +or unhandled argument `../libbacktrace/libbacktrace.la'
>> +
>> +Upstream-Status: Inappropriate [OE specific]
>> +Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>> +
>> +diff --git a/libgfortran/Makefile.am b/libgfortran/Makefile.am
>> +index 2857af5943f9..e07760069a3c 100644
>> +--- a/libgfortran/Makefile.am
>> ++++ b/libgfortran/Makefile.am
>> +@@ -37,7 +37,7 @@ toolexeclib_LTLIBRARIES = libgfortran.la
>> + toolexeclib_DATA = libgfortran.spec
>> + libgfortran_la_LINK = $(LINK) $(libgfortran_la_LDFLAGS)
>> + libgfortran_la_LDFLAGS = -version-info `grep -v '^\#' $(srcdir)/libtool-version` \
>> +-      $(LTLDFLAGS) $(LIBQUADLIB) ../libbacktrace/libbacktrace.la \
>> ++      $(LTLDFLAGS) $(LIBQUADLIB) ../../libbacktrace/libbacktrace.la \
>> +       $(HWCAP_LDFLAGS) \
>> +       -lm $(extra_ldflags_libgfortran) \
>> +       $(version_arg) -Wc,-shared-libgcc
>> +@@ -64,7 +64,7 @@ AM_CPPFLAGS = -iquote$(srcdir)/io -I$(srcdir)/$(MULTISRCTOP)../gcc \
>> +             -I$(MULTIBUILDTOP)../libgcc \
>> +             -I$(srcdir)/$(MULTISRCTOP)../libbacktrace \
>> +             -I$(MULTIBUILDTOP)../libbacktrace \
>> +-            -I../libbacktrace
>> ++            -I../../libbacktrace
>> +
>> + # Fortran rules for complex multiplication and division
>> + AM_CFLAGS += -fcx-fortran-rules
>> +diff --git a/libgfortran/Makefile.in b/libgfortran/Makefile.in
>> +index 05b183dcadb0..c9e0280e412c 100644
>> +--- a/libgfortran/Makefile.in
>> ++++ b/libgfortran/Makefile.in
>> +@@ -581,7 +581,7 @@ toolexeclib_LTLIBRARIES = libgfortran.la
>> + toolexeclib_DATA = libgfortran.spec
>> + libgfortran_la_LINK = $(LINK) $(libgfortran_la_LDFLAGS)
>> + libgfortran_la_LDFLAGS = -version-info `grep -v '^\#' $(srcdir)/libtool-version` \
>> +-      $(LTLDFLAGS) $(LIBQUADLIB) ../libbacktrace/libbacktrace.la \
>> ++      $(LTLDFLAGS) $(LIBQUADLIB) ../../libbacktrace/libbacktrace.la \
>> +       $(HWCAP_LDFLAGS) \
>> +       -lm $(extra_ldflags_libgfortran) \
>> +       $(version_arg) -Wc,-shared-libgcc
>> +@@ -602,7 +602,7 @@ AM_CPPFLAGS = -iquote$(srcdir)/io -I$(srcdir)/$(MULTISRCTOP)../gcc \
>> +             -I$(MULTIBUILDTOP)../libgcc \
>> +             -I$(srcdir)/$(MULTISRCTOP)../libbacktrace \
>> +             -I$(MULTIBUILDTOP)../libbacktrace \
>> +-            -I../libbacktrace
>> ++            -I../../libbacktrace
>> +
>> + gfor_io_src = io/size_from_kind.c $(am__append_2)
>> + gfor_io_headers = \
>> --
>> 2.15.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Ricardo Ribalda

