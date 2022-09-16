Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDE09ECAAD8
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 17:48:40 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web09.9279.1663350515504049305
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 10:48:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j6Mxic4D;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id
 w22-20020a056830061600b006546deda3f9so15338602oti.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 10:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=E4DmVvv9RoLralOxXwEbz9tJjllRNTRQHEMNmiXiGPw=;
        b=j6Mxic4DDi5EoKIUPudLjvbYSnmk5dwxA9beU/kpkfb1qHh6tufT4oKxZmj98oxJt6
         3/dYFcaKTY/yvULMejOtKdClqF1cCISQzdvk6rAN6E+MdJ2JXUGdO3C3PxVfe/BGpEbe
         hZZCnTSGENxJfGcNozXgPadt6kaeueTE62URbS2mGASOfL6tW7S2AehgScPRx0gRjDp+
         cgyJehPe6zw57EJtCWs1h1gWxuu5pTHTNfK9d39cn5KjldC7QD7Mwp97KR397EoYQmMJ
         9IOO3CHAd/LwtOYosB//nmPFOvZI1VNKZLNjVCUhiqw08BkPA1SeHVeu4OmyZcoy/mep
         zcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=E4DmVvv9RoLralOxXwEbz9tJjllRNTRQHEMNmiXiGPw=;
        b=vu7vIhMG+TzBkmJIIIdwVQUJ4LJEvM6kLOcsWAQ+93Ji5Z14V+Tk14EpxieA1i+g9D
         2ML2Vvne0CPoTQhCglp6kWXvPmu5MV5i592jbtX6jPlWgNtnKulXNP5Z+qA2Ln80V9at
         8oLU37bvLPqdg6mh9Q8ikxOL1lC7m/ASV1S/Jrdfiv3mUUiYXVk9QfAMS05UCY69P1m3
         NRZqroeP7JamNpFL/IgFVYucEyk3B+O26RJomdWU8sSBr+6wOx5jf36JjiYxAOEGUzhd
         7l52Ag+YXc16HKnSDXbrsKFys62xqnbilxVGpXNEW+80RqUrU95m2ryKBAapXVYr8ObK
         b98g==
X-Gm-Message-State: ACrzQf3B5whQYkI5qVKssCTdYPEXP2mPp3Bo7+POPH8jT+M4WB3BmDX6
	cakzPjOyhgPt8IR4BGeK+D1mKkA4MU+BQefk8u4=
X-Google-Smtp-Source: 
 AMsMyM7+rPaO+fD5J19fcFCOzO7uGPn9UTjfqP3j2GC3YoOBs3g/nksBv5kVggQEcQKE6USmxnW+EbeebXlvcBe0w6o=
X-Received: by 2002:a05:6830:3901:b0:658:fff4:51b8 with SMTP id
 br1-20020a056830390100b00658fff451b8mr2749540otb.55.1663350514666; Fri, 16
 Sep 2022 10:48:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220916074105.215147-1-samuli.piippo@qt.io>
 <20220916074105.215147-2-samuli.piippo@qt.io>
In-Reply-To: <20220916074105.215147-2-samuli.piippo@qt.io>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Sep 2022 10:48:08 -0700
Message-ID: 
 <CAMKF1spMsTrQvZZN4WHg3rZyMaMgeOFP8NUKYSX+TUOn+kqiUg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] gcc-cross-canadian: add default plugin
 linker
To: Samuli Piippo <samuli.piippo@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 17:48:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170796

On Fri, Sep 16, 2022 at 12:41 AM Samuli Piippo <samuli.piippo@gmail.com> wr=
ote:
>
> Fix multilib sdk issue where gcc is unable to find linker. Previous
> fix was in cdd86896c8d29135f937968e9aa07f919cf543d3 using real-ld
> symlink, but that prevented switching between bfd and gold linkers.
>
> Running compiler with debug arguments shows that collect2 tries and
> fails to find linker using the multilib triples:
>
>   $ $CC -v -Wl,-debug
>   ...
>   Looking for 'real-ld'
>   Looking for 'collect-ld'
>   Looking for 'mips-oemllib32-linux-ld'
>   Looking for 'mips-oe-linux-mips-oemllib32-linux-ld'
>   ...
>   collect2 version 12.2.0
>   ld_file_name        =3D not found
>   ...
>   collect2: fatal error: cannot find =E2=80=98ld=E2=80=99
>
> Using --with-plugin-ld=3Dld in gcc-cross-canadian builds to set default
> linker name for collect2, lets it find the linker correctly:
>
>   Looking for 'real-ld'
>   Looking for 'collect-ld'
>   Looking for 'ld'
>   ...
>   collect2 version 12.2.0
>   ld_file_name        =3D /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-=
linux/usr/libexec/mips-oe-linux/gcc/mips-oe-linux/12.2.0/ld
>
> Swith between bfd and gold linker works as expected now:
>
>   $ $CC -v -Wl,-debug -fuse-ld=3Dgold
>   ...
>   Looking for 'real-ld'
>   Looking for 'collect-ld'
>   Looking for 'ld.gold'
>   ...
>   collect2 version 12.2.0
>   ld_file_name        =3D /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-=
linux/usr/libexec/i686-oe-linux/gcc/i686-oe-linux/12.2.0/ld.gold
>
> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> ---
>  meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/reci=
pes-devtools/gcc/gcc-cross-canadian.inc
> index 38c972aa7c..c36e4cba81 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> @@ -9,6 +9,7 @@ GCCMULTILIB =3D "--enable-multilib"
>
>  require gcc-configure-common.inc
>
> +EXTRA_OECONF +=3D "--with-plugin-ld=3Dld"

this looks fine to me. Pointing to ld is good here because then if ld
is bfd/gold/lld it always works.

>  EXTRA_OECONF_PATHS =3D "\
>      --with-gxx-include-dir=3D/not/exist${target_includedir}/c++/${BINV} =
\
>      --with-build-time-tools=3D${STAGING_DIR_NATIVE}${prefix_native}/${TA=
RGET_SYS}/bin \
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170781): https://lists.openembedded.org/g/openembedde=
d-core/message/170781
> Mute This Topic: https://lists.openembedded.org/mt/93718003/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

