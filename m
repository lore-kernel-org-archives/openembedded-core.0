Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.70943.1597770996481580339
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2020 10:16:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bx/+HBio;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id i20so4744050qkk.8
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2020 10:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kt9gGqUisVhBqkEOR/3XXx6lIiSRPBAz6vJPTBo0dy8=;
        b=bx/+HBio7rYkEWAeddZpLHeSoCVewp9wGSclFJLD78Dsau498puTtIt7QN1axrlywj
         43OUxUGdUS05QsR5AAxGqkfaQ2AD6vzFmGXOC+ZoGX8P1QdbmPhFaLkuoUBrVQZah4CL
         ShJ+O1q+ab01VoaXeyM5KiJS2fGC4py1gyPb+Rnrm/nIReHrLAWJf5h1/cYOOXCKx6oY
         8+HdJ38b8MK3bYxTezHNwbGcSZ8AoFOkOmIr5w4HlVo5t/Yo3G78Mynh6U8b/jLMSN1q
         veizhNtRC8Wxn812ESFq/F8Bz8HrqsfTmg9kPHfuh4U/ioCTMttiQhG8Y20VFvND29Xg
         LKUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kt9gGqUisVhBqkEOR/3XXx6lIiSRPBAz6vJPTBo0dy8=;
        b=VBNDiPp4Px1UniU9iQSQ3kTnu/c9qMgfvQsT0Qi6+5jnIgWlIUJBoAMBL2dtJk4Lc0
         FFDlNt207NaLCJP9MDlbrcmccqmTyYolliV0NZzgSFoFdUXR2jd6YynmePhI0mNh7EsE
         S9sWYNjt914jFLcvY6F/06Wbnn3rK3PCP9zqPZHuv3ilbkBZ5WKv3TLwlB77DhZMgnke
         mdkzhEmNRANoRx0PiYggmFIstP4UqRrefFticP7bnOk4JkVAS7cy1wSb/Ctt3B+e5FXx
         zxgpQiq3W/oDcBSAbI/Pw8BmupRlauf/rGFTDIzbP00B4OdylzU9bSZBP6HVR2UG8jNv
         NuCQ==
X-Gm-Message-State: AOAM531UD5+Nb2NPlkKj5g0RNZlFxUH3FdMgEUtbQzOlbqcgHyItYLr6
	fgeCde14rcj4urvreRTqeZ0lJkUY6cGeLhgb1Yk=
X-Google-Smtp-Source: ABdhPJzeI8FOZJ1cwqwAJEfzx0rhXmCXtWJMVKI6Z1hhSMqhrWYwu40VIaHhBnr2pcr/8N6IuGwL1guJDm4t8GH2Dok=
X-Received: by 2002:a05:620a:209b:: with SMTP id e27mr17522222qka.431.1597770995542;
 Tue, 18 Aug 2020 10:16:35 -0700 (PDT)
MIME-Version: 1.0
References: <162C5AD9D44F999B.7353@lists.openembedded.org> <20200818160409.244099-1-Martin.Jansa@gmail.com>
In-Reply-To: <20200818160409.244099-1-Martin.Jansa@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 18 Aug 2020 10:16:09 -0700
Message-ID: <CAMKF1srbTdp_Qf+rWvn-W=VAP0qzmS8bRv3e50EDx0-MqfVfnA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] perf: backport a fix for confusing non-fatal error
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2020 at 9:04 AM Martin Jansa <Martin.Jansa@gmail.com> wrote=
:
>
> * add V=3D1 to make log.do_compile a bit more useful, with this it shows=
:
>   /bin/sh '/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/perf/1.0=
-r9/perf-1.0/tools/perf/trace/beauty/arch_errno_names.sh' x86_64-oe-linux-g=
cc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/O=
E/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/perf/1.0-r9/recipe-sysro=
ot /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/perf/1.0-r9/perf-1.=
0/tools > /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/perf/1.0-r9/=
perf-1.0/trace/beauty/generated/arch_errno_name_array.c
>   find: unknown predicate `-m64/arch'
>   x86_64-oe-linux-gcc: error: unrecognized command-line option '-m64/inc=
lude/uapi/asm-generic/errno.h'
>   x86_64-oe-linux-gcc: fatal error: no input files
>   compilation terminated.
>   x86_64-oe-linux-gcc: error: unrecognized command-line option '-m64/inc=
lude/uapi/asm-generic/errno.h'
>   x86_64-oe-linux-gcc: fatal error: no input files
>   compilation terminated.
>
> * apply https://github.com/torvalds/linux/commit/e4ffd066ff440a57097e914=
0fa9e16ceef905de8
>   with sed call to fix this
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-kernel/perf/perf.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf=
/perf.bb
> index cf95df710f..868cde7353 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -70,6 +70,7 @@ SPDX_S =3D "${S}/tools/perf"
>  LDFLAGS=3D"-ldl -lutil"
>
>  EXTRA_OEMAKE =3D '\
> +    V=3D1 \
>      -C ${S}/tools/perf \
>      O=3D${B} \
>      CROSS_COMPILE=3D${TARGET_PREFIX} \
> @@ -201,6 +202,9 @@ do_configure_prepend () {
>              ${S}/tools/perf/Makefile.perf
>          sed -i -e "s,prefix=3D'\$(DESTDIR_SQ)/usr'$,prefix=3D'\$(DESTDI=
R_SQ)/usr' --install-lib=3D'\$(DESTDIR)\$(PYTHON_SITEPACKAGES_DIR)',g" \
>              ${S}/tools/perf/Makefile.perf
> +        # backport https://github.com/torvalds/linux/commit/e4ffd066ff4=
40a57097e9140fa9e16ceef905de8
> +        sed -i -e 's,\($(Q)$(SHELL) .$(arch_errno_tbl).\) $(CC) $(arch_=
errno_hdr_dir),\1 $(firstword $(CC)) $(arch_errno_hdr_dir),g' \
> +            ${S}/tools/perf/Makefile.perf

This is good instead of patching every BSP kernel
how far back will it go patching ?

>      fi
>      sed -i -e "s,--root=3D'/\$(DESTDIR_SQ)',--prefix=3D'\$(DESTDIR_SQ)/=
usr' --install-lib=3D'\$(DESTDIR)\$(PYTHON_SITEPACKAGES_DIR)',g" \
>          ${S}/tools/perf/Makefile*
> --
> 2.25.1
>
>=20
