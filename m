Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F94C5478C
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 06:19:37 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.14989.1708928372336092370
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 22:19:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NgkEzm05;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-22007fe465bso420462fac.1
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 22:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708928371; x=1709533171; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pPv8+G0Le5ihfUsAu+X/32hnuEyG677x49BQ5UZKyo=;
        b=NgkEzm05yl68/6lZZQWdqafVGFGWjsrD6rN+5LCV4IUCOJ0J2scGmWgB1GZ8EMGgrm
         ypZqW6z1Pftgelec1M0GGzGJu4vhxlYpydA4U/hdMv5otwsqYh0OKQQU1G5omKAJAjhv
         JLnN1XS/oZ8bhKfWzCVYscVa0/r2socgJkTr4f34YVsy9vTC+r0EqNzNxwFqzhSILIuJ
         1pU2QvlIejvG3A2Jew+T7sQVQXeFth5RVPfjZ+wCDeXFnZPLSB1x4UPeiGqsda0gLcgg
         hgo5yk1f5eLQuFPm9Q9GW/vW7J93PFjFOh/30aVpznZQuqMSL81z0so37nZK/ZBBjO5J
         k4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708928371; x=1709533171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8pPv8+G0Le5ihfUsAu+X/32hnuEyG677x49BQ5UZKyo=;
        b=cdxUto7FQcm3W6GPeaQ6BFlXm3+wJn3ZCxj3XSET4j/QYS2N0AzpNdORU63AZOi5GD
         gWwx9UJnrBAqnSOJTdbOnTqE6aNTezxceAmJEzZWgiWrD8eSEKANG08KxG13IwsKrYbc
         Sf/jVc3+UA8H0vmmpcPJngOqf9mCzjZIjhRzSCmszBJQft8LenmqEg5k9r696uAj7bKO
         wAEUQYQh7TBOJcWIPVUu6hSYpctK9igPqVCm6GxKgIIGGjAY2bTOhyf5sipFmvbcvwDn
         tu4k/k+alkCaB+KgC5kIU7cH3BNNKHduOTzYpqFB6rRT9QBJgaRUeI5/ARtJ84j/Akxm
         bSfg==
X-Gm-Message-State: AOJu0Yx3YkG5GRxe6rnKUObHF06Tt86zGR/LN7EYnmWVVgRlJQzYCh16
	SJD0etILRRBeHuTOLeMz4WUcl3BvGXaLYc2aThmIxm4cf7LlhFvaPzaTuo+oriNVkeRS2xBT3kJ
	t2Qe1f2ORp+QiPXD3XMwl3hcSYkU=
X-Google-Smtp-Source: AGHT+IFcn55XqDvS2vA+jbmHbtjqs1awMSqx8vFrbtM7rvwcQQXL/ge4QOA+wcRnNn72qGMzKmnmD8ejZTRHHPJevGo=
X-Received: by 2002:a05:6870:64a6:b0:21e:8c19:f716 with SMTP id
 cz38-20020a05687064a600b0021e8c19f716mr7713924oab.49.1708928371524; Sun, 25
 Feb 2024 22:19:31 -0800 (PST)
MIME-Version: 1.0
References: <20240226053210.3501-1-leimaohui@fujitsu.com>
In-Reply-To: <20240226053210.3501-1-leimaohui@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 25 Feb 2024 22:19:05 -0800
Message-ID: <CAMKF1sqh5ngJdQfKvgQ-9Omc6U6SeKE2DzV6127-ep2iyS=8Jg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: Fix conflict error when enbale multilib
 on aarch64.
To: leimaohui@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 06:19:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196180

lgtm.

On Sun, Feb 25, 2024 at 9:32=E2=80=AFPM leimaohui via lists.openembedded.or=
g
<leimaohui=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Lei Maohui <leimaohui@fujitsu.com>
>
> Error: Transaction test error:
>   file /usr/include/finclude/math-vector-fortran.h from install of lib32-=
libc6-dev-2.39+git0+312e159626-r0.armv7ahf_neon conflicts with file from pa=
ckage libc6-dev-2.39+git0+312e159626-r0.aarch64
>
> The difference of math-vector-fortran.h between 32bit and 64bit is as
> the following:
>
> --- tmp/work/aarch64-linux/glibc/2.39+git/image/usr/include/finclude/math=
-vector-fortran.h    2024-02-26 03:41:59.560000000 +0000
> +++ tmp/work/armv7ahf-neon-xmllib32-linux-gnueabi/lib32-glibc/2.39+git/im=
age/usr/include/finclude/math-vector-fortran.h 2024-02-26 02:22:28.59200000=
0 +0000
> @@ -15,33 +15,5 @@
>  !   You should have received a copy of the GNU Lesser General Public
>  !   License along with the GNU C Library; if not, see
>  !   <https://www.gnu.org/licenses/>.
> -!GCC$ builtin (acos) attributes simd (notinbranch)
> -!GCC$ builtin (acosf) attributes simd (notinbranch)
> -!GCC$ builtin (asin) attributes simd (notinbranch)
> -!GCC$ builtin (asinf) attributes simd (notinbranch)
> -!GCC$ builtin (atan) attributes simd (notinbranch)
> -!GCC$ builtin (atanf) attributes simd (notinbranch)
> -!GCC$ builtin (atan2) attributes simd (notinbranch)
> -!GCC$ builtin (atan2f) attributes simd (notinbranch)
> -!GCC$ builtin (cos) attributes simd (notinbranch)
> -!GCC$ builtin (cosf) attributes simd (notinbranch)
> -!GCC$ builtin (exp) attributes simd (notinbranch)
> -!GCC$ builtin (expf) attributes simd (notinbranch)
> -!GCC$ builtin (exp10) attributes simd (notinbranch)
> -!GCC$ builtin (exp10f) attributes simd (notinbranch)
> -!GCC$ builtin (exp2) attributes simd (notinbranch)
> -!GCC$ builtin (exp2f) attributes simd (notinbranch)
> -!GCC$ builtin (expm1) attributes simd (notinbranch)
> -!GCC$ builtin (expm1f) attributes simd (notinbranch)
> -!GCC$ builtin (log) attributes simd (notinbranch)
> -!GCC$ builtin (logf) attributes simd (notinbranch)
> -!GCC$ builtin (log10) attributes simd (notinbranch)
> -!GCC$ builtin (log10f) attributes simd (notinbranch)
> -!GCC$ builtin (log1p) attributes simd (notinbranch)
> -!GCC$ builtin (log1pf) attributes simd (notinbranch)
> -!GCC$ builtin (log2) attributes simd (notinbranch)
> -!GCC$ builtin (log2f) attributes simd (notinbranch)
> -!GCC$ builtin (sin) attributes simd (notinbranch)
> -!GCC$ builtin (sinf) attributes simd (notinbranch)
> -!GCC$ builtin (tan) attributes simd (notinbranch)
> -!GCC$ builtin (tanf) attributes simd (notinbranch)
> +
> +! No SIMD math functions are available for this platform.
>
> Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> ---
>  meta/recipes-core/glibc/glibc-package.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-cor=
e/glibc/glibc-package.inc
> index 1ef987be0a..19eb7afa81 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -167,6 +167,7 @@ do_install_armmultilib () {
>         oe_multilib_header fpu_control.h gnu/lib-names.h gnu/stubs.h ieee=
754.h
>
>         oe_multilib_header sys/elf.h sys/procfs.h sys/ptrace.h sys/uconte=
xt.h sys/user.h
> +       oe_multilib_header finclude/math-vector-fortran.h
>  }
>
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196179): https://lists.openembedded.org/g/openembedde=
d-core/message/196179
> Mute This Topic: https://lists.openembedded.org/mt/104577604/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

