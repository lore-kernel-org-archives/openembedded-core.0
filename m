Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33BEEC27C6E
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 16:59:05 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web10.13797.1718297944301571825
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 09:59:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IPpwEVf9;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-25488f4e55aso467126fac.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 09:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718297943; x=1718902743; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OB4CKfxDk7a8Qgno5qIFuxDtJNylUA8bcqyS6iBAbFQ=;
        b=IPpwEVf9sTi1GLRYuwAasCJT9rNnmJ+zy0LDCpcj3x4BTbnYzSx0imBYEuwubNv5Xq
         6ESIHj93CLcOdbNrkP2ZPoruLGatWF+P5egq5jf0bdRJgBSeUENdP2HqmzmTiqPhq/xk
         8PXgyCben/O/HXdZtwFLoac6Lcwrr35qmRQDLSO8u5bScNoADG7wQT4wLpsLI69KMZlm
         DECm+9ux7/c5xVqXYDA/g7zvj4jOulyKTXL1N0/kRviE8eIPkcFhJ1FfEFTjr+Nl9FM9
         N0VkzKl+S/+eiTmJtOcfG+oSEULQHCgQk5DbEFePyMQ83wlfd5qzgZMrtQ6/xo2g12dg
         qY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718297943; x=1718902743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OB4CKfxDk7a8Qgno5qIFuxDtJNylUA8bcqyS6iBAbFQ=;
        b=OGzH8OfYz486fl3TswQqaeW2koq0qgMTGmMMaSg40jL/ZmjH7sRSFpgOLkvEh+Ttgr
         XpwarTSfLPPB7EafyAhO5Y4S4G0jHB3fc1mZp6jj7w82g0o3AykpbgliAlBsqMji65aP
         xQsUk+IILn1OKAK4tZAXe6W1W7d6aYsmRnMS0fVjjwHbBIWg2SNtKHVgUaS3ZMDEU3xn
         +yofG/ZkxPao7GAJEK1IyyrdVdF1ZM3tthvyXk6LTcJO8Wkebm/aTrOP7C3+Pbe887X1
         tCIHwM8Ovhkec+fC/FaFH8UE+DDZPkjWekQXz8ZIZVYSQpYXWiIrg/bqTle7jK3aBmQe
         K5rA==
X-Gm-Message-State: AOJu0YwUzp++Icq7+eLVZJ/CUZk+r8btfVC10Ho3X8hqCxkUZhfdJi9N
	SQk8NT3AHYwsiHbXalztkL1ZjnAu9mjVzGyRlSYCiLFpmU7h6uXvpNoLv+q7h1v6eAWLYu8whM6
	NCgRCzsKN+5Dx/WrmzeVWj8IFWgwP7Q==
X-Google-Smtp-Source: AGHT+IGku9nNv5GkFW/HprxKJRily2wXr6fghBizZKTLhstsPqxSdhob7w92rbPCNUQdyG64hMmufvSa11FaGFyZNiQ=
X-Received: by 2002:a05:6870:2c8:b0:254:94a4:35e2 with SMTP id
 586e51a60fabf-25842b83561mr135881fac.59.1718297943223; Thu, 13 Jun 2024
 09:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240613115159.3660790-1-kai.kang@windriver.com> <20240613115159.3660790-2-kai.kang@windriver.com>
In-Reply-To: <20240613115159.3660790-2-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Jun 2024 09:58:36 -0700
Message-ID: <CAMKF1sqKt13o1DbyVmw3OARQu5u=CP4z76PKdidfPqfridvYJw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] gcc: remove g77/f77
To: kai.kang@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 16:59:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200635

On Thu, Jun 13, 2024 at 4:53=E2=80=AFAM Kai Kang via lists.openembedded.org
<kai.kang=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> g77/f77 has been removed from gcc 4.0.0 via commit:
>
> * b4117c30610 Makefile.def, [...]: Remove all mention of libf2c.
>
> When set
>
>     FORTRAN =3D ",f77"
>
> it complains with error:
>
> | The following requested languages could not be built: f77
> | Supported languages are: c,c,c++,fortran,go,lto,m2,objc,obj-c++
>
> So remove g77/f77 from gcc recipes.

Looks fine to me.

>
> [1]: https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3Db4117c30610
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../gcc/gcc-configure-common.inc              |  2 +-
>  meta/recipes-devtools/gcc/gcc-runtime.inc     | 13 +------------
>  meta/recipes-devtools/gcc/gcc-target.inc      | 19 -------------------
>  3 files changed, 2 insertions(+), 32 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/re=
cipes-devtools/gcc/gcc-configure-common.inc
> index dba25eb754..d77b2ec3d1 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> @@ -6,7 +6,7 @@ require gcc-shared-source.inc
>  # These can be overridden by the version specific .inc file.
>
>  # gcc 3.x expects 'f77', 4.0 expects 'f95', 4.1 and 4.2 expect 'fortran'
> -FORTRAN ?=3D ",f77"
> +FORTRAN ?=3D ",fortran"
>  LANGUAGES ?=3D "c,c++${FORTRAN}"
>
>  EXTRA_OECONF_BASE ?=3D ""
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-dev=
tools/gcc/gcc-runtime.inc
> index 89b0bebcfb..ad9798530f 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -43,7 +43,7 @@ RUNTIMELIBSSP ?=3D ""
>  RUNTIMELIBSSP:mingw32 ?=3D "libssp"
>
>  RUNTIMETARGET =3D "${RUNTIMELIBSSP} libstdc++-v3 libgomp libatomic ${RUN=
TIMELIBITM} \
> -    ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'], 'libquadmat=
h', '', d)} \
> +    ${@bb.utils.contains('FORTRAN', ',fortran', 'libquadmath', '', d)} \
>  "
>  # Only build libstdc++ for newlib
>  RUNTIMETARGET:libc-newlib =3D "libstdc++-v3"
> @@ -164,8 +164,6 @@ PACKAGES =3D "\
>      libstdc++-precompile-dev \
>      libstdc++-dev \
>      libstdc++-staticdev \
> -    libg2c \
> -    libg2c-dev \
>      libssp \
>      libssp-dev \
>      libssp-staticdev \
> @@ -196,15 +194,6 @@ FILES:${PN}-dbg +=3D "\
>  # So it needs to be added manually to images sadly.
>  # RDEPENDS:${PN}-dbg +=3D "python3-datetime"
>
> -FILES:libg2c =3D "${target_libdir}/libg2c.so.*"
> -SUMMARY:libg2c =3D "Companion runtime library for g77"
> -FILES:libg2c-dev =3D "\
> -    ${libdir}/libg2c.so \
> -    ${libdir}/libg2c.a \
> -    ${libdir}/libfrtbegin.a \
> -"
> -SUMMARY:libg2c-dev =3D "Companion runtime library for g77 - development =
files"
> -
>  FILES:libstdc++ =3D "${libdir}/libstdc++.so.*"
>  SUMMARY:libstdc++ =3D "GNU standard C++ library"
>  FILES:libstdc++-dev =3D "\
> diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devt=
ools/gcc/gcc-target.inc
> index 6ab83449ea..42eac6fc43 100644
> --- a/meta/recipes-devtools/gcc/gcc-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-target.inc
> @@ -33,7 +33,6 @@ PACKAGES =3D "\
>      ${PN} ${PN}-plugins ${PN}-symlinks \
>      g++ g++-symlinks \
>      cpp cpp-symlinks \
> -    g77 g77-symlinks \
>      gfortran gfortran-symlinks \
>      gcov gcov-symlinks \
>      ${PN}-doc \
> @@ -81,19 +80,6 @@ FILES:${PN}-plugins =3D "\
>  "
>  ALLOW_EMPTY:${PN}-plugins =3D "1"
>
> -FILES:g77 =3D "\
> -    ${bindir}/${TARGET_PREFIX}g77 \
> -    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/f771 \
> -"
> -FILES:g77-symlinks =3D "\
> -    ${bindir}/g77 \
> -    ${bindir}/f77 \
> -"
> -RRECOMMENDS:g77 =3D "\
> -    libg2c \
> -    libg2c-dev \
> -"
> -
>  INSANE_SKIP:gfortran +=3D "dev-deps"
>  FILES:gfortran =3D "\
>      ${bindir}/${TARGET_PREFIX}gfortran \
> @@ -203,11 +189,6 @@ do_install () {
>         # Not sure why we end up with these but we don't want them...
>         rm -f ${TARGET_PREFIX}${TARGET_PREFIX}*
>
> -       # Symlinks so we can use these trivially on the target
> -       if [ -e ${TARGET_PREFIX}g77 ]; then
> -               ln -sf ${TARGET_PREFIX}g77 g77 || true
> -               ln -sf g77 f77 || true
> -       fi
>         if [ -e ${TARGET_PREFIX}gfortran ]; then
>                 ln -sf ${TARGET_PREFIX}gfortran gfortran || true
>                 ln -sf gfortran f95 || true
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200597): https://lists.openembedded.org/g/openembedde=
d-core/message/200597
> Mute This Topic: https://lists.openembedded.org/mt/106650042/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

