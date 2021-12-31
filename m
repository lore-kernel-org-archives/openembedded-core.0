Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC5FC433EF
	for <webhook@archiver.kernel.org>; Fri, 31 Dec 2021 06:26:36 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.9087.1640931995450330634
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 22:26:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OEfxuRqQ;
 spf=pass (domain: gmail.com, ip: 209.85.216.42,
 mailfrom: sundeep.kokkonda@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 a11-20020a17090a854b00b001b11aae38d6so24974515pjw.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 22:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=4+cMS+aWrnpDh5ofP49EDZjKnE2+RwLpHwToXrelKQU=;
        b=OEfxuRqQmqZ5k3OaE9ofDkkp0zPY03O9JGS3NbbMcOSeDKxJGijKHbF+S6meEpBwa2
         8H2jVlePZG312UZyIkGFGzj0PXPpv4ps+2heK7dzcGZfFEa9vov9EZzvhtPt5y9/Q0cX
         bdO2hN58usd6LAWez30+8F4WwLCZngqT4H4n3xviAIByEeHbpOksQMgwx1zMfAlAu9P9
         9ZvEwElmxCHNm8tCL95xRJCvK7tQT3zR36ocoeZqIwIBcspI64XOur6bJPC1MyMpm/yK
         USIpEYMq7OgpuUZPJMjs98wGs3+JLefah1onPgcB+NGsCB5vY/2TQBHB7LClXIdL5qFf
         4BeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
         :message-id:mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=4+cMS+aWrnpDh5ofP49EDZjKnE2+RwLpHwToXrelKQU=;
        b=DVg4Hnno5Fp/iL9I/laEo+Xi4P61uETS7KHgtWCp6azkLrtsFbYy2AleJfgcYfOAbS
         oog9iBgjVTQPgLKaii3EtIARjIcnD+o7wieE9S+JC8DbtqdBrlcJsxzxHDqxSAgyHdCy
         sRAAZ3dBbJPUfDNpe37CNsxxn4e2u3WuNpjHxN47oz9PK7GpIN68fcGV6zO3k3dX9kQG
         tqkoYnx1Qxl8RJ2zwDS2cSR9txypvFA+0xoUzSWe0YCPTmyV/FZWjay92dmMLb973dD/
         rftVkeKFj0WyfhtsicYUx6+IokvCVT04URntWjBxbUAInjl2mWtFWRoivIsgAQeqfeuS
         rldw==
X-Gm-Message-State: AOAM531m301mv7wd7+NccshNa/WtKFawTMSIYoDii4GHyH06BOzSKEmH
	9cgNHkxQs/FD/syRLp2TL2c=
X-Google-Smtp-Source: 
 ABdhPJy2v6GDnZyDs6x/8A1sn1+fYeN9LGk1QVto5p057T/GD4WbKVin71L1KrqNdkgZVV222Shvbg==
X-Received: by 2002:a17:90b:1bc3:: with SMTP id
 oa3mr42288890pjb.0.1640931994936;
        Thu, 30 Dec 2021 22:26:34 -0800 (PST)
Received: from SundeepGBF6NW2 ([43.241.120.81])
        by smtp.gmail.com with ESMTPSA id
 d23sm24836895pgm.37.2021.12.30.22.26.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Dec 2021 22:26:34 -0800 (PST)
From: <sundeep.kokkonda@gmail.com>
To: "'Mittal, Anuj'" <anuj.mittal@intel.com>,
	<openembedded-core@lists.openembedded.org>
Cc: <rwmacleod@gmail.com>,
	<umesh.kalappa0@gmail.com>
References: <20211231060446.78187-1-sundeep.kokkonda@gmail.com>
 <e6ef2c2c47fa5a325fdffbc3712ddea98017076f.camel@intel.com>
In-Reply-To: <e6ef2c2c47fa5a325fdffbc3712ddea98017076f.camel@intel.com>
Subject: RE: [hardknott][PATCH] binutils: Fix CVE-2021-45078
Date: Fri, 31 Dec 2021 11:56:20 +0530
Message-ID: <020901d7fe0f$5b770410$12650c30$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQIAAV9e/WegxU5O4d791lIaTploBgJpBvZHq+jSrRA=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Dec 2021 06:26:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160088

Hi,

Subject line wrong, instead of [hardknott] it should be [mainline]. =
Changes are listed below.
https://lists.openembedded.org/g/openembedded-core/message/160086


Thanks,
Sundeep K.

-----Original Message-----
From: Mittal, Anuj <anuj.mittal@intel.com>=20
Sent: Friday, December 31, 2021 11:48 AM
To: openembedded-core@lists.openembedded.org; sundeep.kokkonda@gmail.com
Cc: rwmacleod@gmail.com; umesh.kalappa0@gmail.com
Subject: Re: [hardknott][PATCH] binutils: Fix CVE-2021-45078

What is different in this version?

Thanks,

Anuj

On Fri, 2021-12-31 at 11:34 +0530, Sundeep KOKKONDA wrote:
> Upstream-Status: Backport
> =
[https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dpatch;h=3D161e87d12=
16
> 7b1e36193385485c1f6ce92f74f02]
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
> ---
>  .../binutils/binutils-2.37.inc                |   1 +
>  .../binutils/0001-CVE-2021-45078.patch        | 253
> ++++++++++++++++++
>  2 files changed, 254 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0001-CVE-
> 2021-45078.patch
>=20
> diff --git a/meta/recipes-devtools/binutils/binutils-2.37.inc
> b/meta/recipes-devtools/binutils/binutils-2.37.inc
> index 043f7f8235..62e2e31e3c 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.37.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.37.inc
> @@ -34,5 +34,6 @@ SRC_URI =3D "\
>     =20
> file://0017-bfd-Close-the-file-descriptor-if-there-is-no-archive.patch
>  \
>     =20
> file://0001-elf-Discard-input-.note.gnu.build-id-sections.patch \
>       file://0001-CVE-2021-42574.patch \
> +     file://0001-CVE-2021-45078.patch \
>  "
>  S  =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/0001-CVE-2021-
> 45078.patch b/meta/recipes-devtools/binutils/binutils/0001-CVE-2021-
> 45078.patch
> new file mode 100644
> index 0000000000..907543fce0
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0001-CVE-2021-
> 45078.patch
> @@ -0,0 +1,253 @@
> +From 161e87d12167b1e36193385485c1f6ce92f74f02 Mon Sep 17 00:00:00
> 2001
> +From: Alan Modra <amodra@gmail.com>
> +Date: Wed, 15 Dec 2021 11:48:42 +1030
> +Subject: [PATCH] PR28694, Out-of-bounds write in
> stab_xcoff_builtin_type
> +
> +       PR 28694
> +       * stabs.c (stab_xcoff_builtin_type): Make typenum unsigned.
> +       Negate typenum earlier, simplifying bounds checking.  Correct
> +       off-by-one indexing.  Adjust switch cases.
> +
> +CVE: CVE-2021-45078
> +Upstream-Status: Backport
> =
[https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dpatch;h=3D161e87d12=
16
> 7b1e36193385485c1f6ce92f74f02]
> +
> +Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
> +---
> + binutils/stabs.c | 87 ++++++++++++++++++++++++---------------------
> ---
> + 1 file changed, 43 insertions(+), 44 deletions(-)
> +
> +diff --git a/binutils/stabs.c b/binutils/stabs.c index=20
> +274bfb0e7fa..83ee3ea5fa4 100644
> +--- a/binutils/stabs.c
> ++++ b/binutils/stabs.c
> +@@ -202,7 +202,7 @@ static debug_type stab_find_type (void *, struct
> stab_handle *, const int *);
> + static bool stab_record_type
> +   (void *, struct stab_handle *, const int *, debug_type);  static=20
> +debug_type stab_xcoff_builtin_type
> +-  (void *, struct stab_handle *, int);
> ++  (void *, struct stab_handle *, unsigned int);
> + static debug_type stab_find_tagged_type
> +   (void *, struct stab_handle *, const char *, int, enum
> debug_type_kind);
> + static debug_type *stab_demangle_argtypes @@ -3496,166 +3496,167 @@=20
> +stab_record_type (void *dhandle
> ATTRIBUTE_UNUSED, struct stab_handle *info,
> +=20
> + static debug_type
> + stab_xcoff_builtin_type (void *dhandle, struct stab_handle *info,
> +-                       int typenum)
> ++                       unsigned int typenum)
> + {
> +   debug_type rettype;
> +   const char *name;
> +=20
> +-  if (typenum >=3D 0 || typenum < -XCOFF_TYPE_COUNT)
> ++  typenum =3D -typenum - 1;
> ++  if (typenum >=3D XCOFF_TYPE_COUNT)
> +     {
> +-      fprintf (stderr, _("Unrecognized XCOFF type %d\n"), typenum);
> ++      fprintf (stderr, _("Unrecognized XCOFF type %d\n"), -typenum
> - 1);
> +       return DEBUG_TYPE_NULL;
> +     }
> +-  if (info->xcoff_types[-typenum] !=3D NULL)
> +-    return info->xcoff_types[-typenum];
> ++  if (info->xcoff_types[typenum] !=3D NULL)
> ++    return info->xcoff_types[typenum];
> +=20
> +-  switch (-typenum)
> ++  switch (typenum)
> +     {
> +-    case 1:
> ++    case 0:
> +       /* The size of this and all the other types are fixed,
> defined
> +        by the debugging format.  */
> +       name =3D "int";
> +       rettype =3D debug_make_int_type (dhandle, 4, false);
> +       break;
> +-    case 2:
> ++    case 1:
> +       name =3D "char";
> +       rettype =3D debug_make_int_type (dhandle, 1, false);
> +       break;
> +-    case 3:
> ++    case 2:
> +       name =3D "short";
> +       rettype =3D debug_make_int_type (dhandle, 2, false);
> +       break;
> +-    case 4:
> ++    case 3:
> +       name =3D "long";
> +       rettype =3D debug_make_int_type (dhandle, 4, false);
> +       break;
> +-    case 5:
> ++    case 4:
> +       name =3D "unsigned char";
> +       rettype =3D debug_make_int_type (dhandle, 1, true);
> +       break;
> +-    case 6:
> ++    case 5:
> +       name =3D "signed char";
> +       rettype =3D debug_make_int_type (dhandle, 1, false);
> +       break;
> +-    case 7:
> ++    case 6:
> +       name =3D "unsigned short";
> +       rettype =3D debug_make_int_type (dhandle, 2, true);
> +       break;
> +-    case 8:
> ++    case 7:
> +       name =3D "unsigned int";
> +       rettype =3D debug_make_int_type (dhandle, 4, true);
> +       break;
> +-    case 9:
> ++    case 8:
> +       name =3D "unsigned";
> +       rettype =3D debug_make_int_type (dhandle, 4, true);
> +       break;
> +-    case 10:
> ++    case 9:
> +       name =3D "unsigned long";
> +       rettype =3D debug_make_int_type (dhandle, 4, true);
> +       break;
> +-    case 11:
> ++    case 10:
> +       name =3D "void";
> +       rettype =3D debug_make_void_type (dhandle);
> +       break;
> +-    case 12:
> ++    case 11:
> +       /* IEEE single precision (32 bit).  */
> +       name =3D "float";
> +       rettype =3D debug_make_float_type (dhandle, 4);
> +       break;
> +-    case 13:
> ++    case 12:
> +       /* IEEE double precision (64 bit).  */
> +       name =3D "double";
> +       rettype =3D debug_make_float_type (dhandle, 8);
> +       break;
> +-    case 14:
> ++    case 13:
> +       /* This is an IEEE double on the RS/6000, and different
> machines
> +        with different sizes for "long double" should use different
> +        negative type numbers.  See stabs.texinfo.  */
> +       name =3D "long double";
> +       rettype =3D debug_make_float_type (dhandle, 8);
> +       break;
> +-    case 15:
> ++    case 14:
> +       name =3D "integer";
> +       rettype =3D debug_make_int_type (dhandle, 4, false);
> +       break;
> +-    case 16:
> ++    case 15:
> +       name =3D "boolean";
> +       rettype =3D debug_make_bool_type (dhandle, 4);
> +       break;
> +-    case 17:
> ++    case 16:
> +       name =3D "short real";
> +       rettype =3D debug_make_float_type (dhandle, 4);
> +       break;
> +-    case 18:
> ++    case 17:
> +       name =3D "real";
> +       rettype =3D debug_make_float_type (dhandle, 8);
> +       break;
> +-    case 19:
> ++    case 18:
> +       /* FIXME */
> +       name =3D "stringptr";
> +       rettype =3D NULL;
> +       break;
> +-    case 20:
> ++    case 19:
> +       /* FIXME */
> +       name =3D "character";
> +       rettype =3D debug_make_int_type (dhandle, 1, true);
> +       break;
> +-    case 21:
> ++    case 20:
> +       name =3D "logical*1";
> +       rettype =3D debug_make_bool_type (dhandle, 1);
> +       break;
> +-    case 22:
> ++    case 21:
> +       name =3D "logical*2";
> +       rettype =3D debug_make_bool_type (dhandle, 2);
> +       break;
> +-    case 23:
> ++    case 22:
> +       name =3D "logical*4";
> +       rettype =3D debug_make_bool_type (dhandle, 4);
> +       break;
> +-    case 24:
> ++    case 23:
> +       name =3D "logical";
> +       rettype =3D debug_make_bool_type (dhandle, 4);
> +       break;
> +-    case 25:
> ++    case 24:
> +       /* Complex type consisting of two IEEE single precision
> values.  */
> +       name =3D "complex";
> +       rettype =3D debug_make_complex_type (dhandle, 8);
> +       break;
> +-    case 26:
> ++    case 25:
> +       /* Complex type consisting of two IEEE double precision
> values.  */
> +       name =3D "double complex";
> +       rettype =3D debug_make_complex_type (dhandle, 16);
> +       break;
> +-    case 27:
> ++    case 26:
> +       name =3D "integer*1";
> +       rettype =3D debug_make_int_type (dhandle, 1, false);
> +       break;
> +-    case 28:
> ++    case 27:
> +       name =3D "integer*2";
> +       rettype =3D debug_make_int_type (dhandle, 2, false);
> +       break;
> +-    case 29:
> ++    case 28:
> +       name =3D "integer*4";
> +       rettype =3D debug_make_int_type (dhandle, 4, false);
> +       break;
> +-    case 30:
> ++    case 29:
> +       /* FIXME */
> +       name =3D "wchar";
> +       rettype =3D debug_make_int_type (dhandle, 2, false);
> +       break;
> +-    case 31:
> ++    case 30:
> +       name =3D "long long";
> +       rettype =3D debug_make_int_type (dhandle, 8, false);
> +       break;
> +-    case 32:
> ++    case 31:
> +       name =3D "unsigned long long";
> +       rettype =3D debug_make_int_type (dhandle, 8, true);
> +       break;
> +-    case 33:
> ++    case 32:
> +       name =3D "logical*8";
> +       rettype =3D debug_make_bool_type (dhandle, 8);
> +       break;
> +-    case 34:
> ++    case 33:
> +       name =3D "integer*8";
> +       rettype =3D debug_make_int_type (dhandle, 8, false);
> +       break;
> +@@ -3664,9 +3665,7 @@ stab_xcoff_builtin_type (void *dhandle, struct
> stab_handle *info,
> +     }
> +=20
> +   rettype =3D debug_name_type (dhandle, name, rettype);
> +-
> +-  info->xcoff_types[-typenum] =3D rettype;
> +-
> ++  info->xcoff_types[typenum] =3D rettype;
> +   return rettype;
> + }
> +=20
> +--
> +2.27.0
> +



