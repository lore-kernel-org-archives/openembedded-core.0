Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1C110784DA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 14:19:41 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id u84so401470lff.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 06:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZporPqvbTZRmE6lwwV1GJOX6ZW3r5sb4JMKkZbKbcF8=;
	b=jMQ/iL0NozN2wCRblCyJMCNlNPExqvB+EbPpGn32fKppnpdEofa/eNWDPWX4wCH9hU
	qNy1bWuBZd9Vd+WKGuzMalqrOLKEjaXN5d7TohCeXeE8kzJsC22JolBCvYP93HeUJqRI
	qd8zzFXtojCPj0xDxTrP2UBC3a0/Eg/+uH0VyRXyW/v4nFPJNWvVtqOf0LBJaFMfMZcs
	Z9IzNvLn5SUmD55pQHCMw3FAbWpdDMjNNBgHTc1iov4wPl+wH2BMZTDAFtrGEILhlSHd
	hZwfVBymu8RDFiPBqRvxwgrXcM+eVB4vvXkJy7ah6DIr+lDqLUsz2LQGVHOkHZ29qoQ9
	lvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZporPqvbTZRmE6lwwV1GJOX6ZW3r5sb4JMKkZbKbcF8=;
	b=uC8Svbh/Cf3furRH8WyV5hGux9Ej439zj5h7qVyw+4Cm86eHNSnF8yMAMeG3+l3yTS
	iHHcQRKoRI77JM7WfyozMAWG6wqwSgFfxTUjIFE+wHMe6xq7iS89gSIiWdLc8BHbLHip
	hDr9aitn+ODOr3/Os3OO1eCrYchJpZkP4a8YGZPwM+Z8/89qeFAJDQvBNNfhtQW72kUq
	tBL8Fy3mehvZPrRaBCNveVwFkYFowdvvI3+OI53gqjNpPgle/FGFTydNq9ivpzLDZoj7
	tC4Gh7SkoU5m4bbm+FOT+ZRtANF65tF5I0uPmwrmj6qe1UZDhmRpTVam0V0U5MdoCBSv
	dvXA==
X-Gm-Message-State: AKGB3mK/JsQMmhl2MkdrvNCbOsF28VnNrBxbriVJ6xzVIhRuhW7/jR5f
	4TaS/LKeLUy5zdMUb/qB0KcnpVpoSpdo3Od1hc4=
X-Google-Smtp-Source: ACJfBoskLzHo7ENEp58IJCMM1YN+SKFWyCgtYUFjaHihTdoqo74jRhRTiDky4XSEKhvOpjNdvOXA+G/foVZw0AOAnkg=
X-Received: by 10.46.1.205 with SMTP id f74mr2331378lji.16.1513693182398; Tue,
	19 Dec 2017 06:19:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.228.202 with HTTP; Tue, 19 Dec 2017 06:19:21 -0800 (PST)
In-Reply-To: <1513681725.16507.62.camel@linuxfoundation.org>
References: <20171212172317.601-1-raj.khem@gmail.com>
	<20171212172317.601-8-raj.khem@gmail.com>
	<1513681725.16507.62.camel@linuxfoundation.org>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 19 Dec 2017 15:19:21 +0100
Message-ID: <CAPybu_3y6Cu8keZJOYzJ3DQA9=jLHQ=d8w7fwugZoisCbpZW1g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/9] gcc-7.2: Fix libgfortran build
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
X-List-Received-Date: Tue, 19 Dec 2017 14:19:42 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Richard

My target is a X86_64 camera, and I have only tried with it.

On Tue, Dec 19, 2017 at 12:08 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2017-12-12 at 09:23 -0800, Khem Raj wrote:
>> From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>>
>> Without this patch libbacktrace cannot be included/link during
>> libgfortran build.
>>
>> libbtool: link: cannot find the library
>> `../libbacktrace/libbacktrace.la'
>> or unhandled argument `../libbacktrace/libbacktrace.la
>>
>> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-devtools/gcc/gcc-7.2.inc              |  1 +
>>  .../gcc/gcc-7.2/0051-Fix-gfortran-build.patch      | 53
>> ++++++++++++++++++++++
>>  2 files changed, 54 insertions(+)
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.2/0051-Fix-
>> gfortran-build.patch
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-7.2.inc b/meta/recipes-
>> devtools/gcc/gcc-7.2.inc
>> index 1d40cba731..baf98aeba8 100644
>> --- a/meta/recipes-devtools/gcc/gcc-7.2.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-7.2.inc
>> @@ -75,6 +75,7 @@ SRC_URI = "\
>>             file://0048-gcc-Enable-static-PIE.patch \
>>             file://fix-segmentation-fault-precompiled-hdr.patch \
>>             file://0050-RISC-V-Handle-non-legitimate-address-in-
>> riscv_legiti.patch \
>> +           file://0051-Fix-gfortran-build.patch \
>>             ${BACKPORTS} \
>>  "
>>  BACKPORTS = "\
>> diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0051-Fix-gfortran-
>> build.patch b/meta/recipes-devtools/gcc/gcc-7.2/0051-Fix-gfortran-
>> build.patch
>> new file mode 100644
>> index 0000000000..a71b6b0bee
>> --- /dev/null
>> +++ b/meta/recipes-devtools/gcc/gcc-7.2/0051-Fix-gfortran-build.patch
>> @@ -0,0 +1,53 @@
>> +Without this patch libbacktrace cannot be included/link during
>> +libgfortran build.
>> +
>> +libbtool: link: cannot find the library
>> `../libbacktrace/libbacktrace.la'
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
>> + libgfortran_la_LDFLAGS = -version-info `grep -v '^\#'
>> $(srcdir)/libtool-version` \
>> +-    $(LTLDFLAGS) $(LIBQUADLIB) ../libbacktrace/libbacktrace.la
>> \
>> ++    $(LTLDFLAGS) $(LIBQUADLIB)
>> ../../libbacktrace/libbacktrace.la \
>> +     $(HWCAP_LDFLAGS) \
>> +     -lm $(extra_ldflags_libgfortran) \
>> +     $(version_arg) -Wc,-shared-libgcc
>> +@@ -64,7 +64,7 @@ AM_CPPFLAGS = -iquote$(srcdir)/io
>> -I$(srcdir)/$(MULTISRCTOP)../gcc \
>> +           -I$(MULTIBUILDTOP)../libgcc \
>> +           -I$(srcdir)/$(MULTISRCTOP)../libbacktrace \
>> +           -I$(MULTIBUILDTOP)../libbacktrace \
>> +-          -I../libbacktrace
>> ++          -I../../libbacktrace
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
>> + libgfortran_la_LDFLAGS = -version-info `grep -v '^\#'
>> $(srcdir)/libtool-version` \
>> +-    $(LTLDFLAGS) $(LIBQUADLIB) ../libbacktrace/libbacktrace.la
>> \
>> ++    $(LTLDFLAGS) $(LIBQUADLIB)
>> ../../libbacktrace/libbacktrace.la \
>> +     $(HWCAP_LDFLAGS) \
>> +     -lm $(extra_ldflags_libgfortran) \
>> +     $(version_arg) -Wc,-shared-libgcc
>> +@@ -602,7 +602,7 @@ AM_CPPFLAGS = -iquote$(srcdir)/io
>> -I$(srcdir)/$(MULTISRCTOP)../gcc \
>> +           -I$(MULTIBUILDTOP)../libgcc \
>> +           -I$(srcdir)/$(MULTISRCTOP)../libbacktrace \
>> +           -I$(MULTIBUILDTOP)../libbacktrace \
>> +-          -I../libbacktrace
>> ++          -I../../libbacktrace
>> +
>> + gfor_io_src = io/size_from_kind.c $(am__append_2)
>> + gfor_io_headers = \
>
> Did you try this for something other than x86_64? I think this won't
> work when cross compiling and host != target.
>
> I do have a better fix which might work in mind...
>
> Cheers,
>
> Richard
>



-- 
Ricardo Ribalda

