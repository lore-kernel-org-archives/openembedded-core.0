Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD74C001DF
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 22:07:39 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.44103.1690582055012810610
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jul 2023 15:07:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ecwfihgD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3fbc244d384so27186385e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 15:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690582053; x=1691186853;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/wVnm3EN1NjyLisolQ+1EUoCvmYp0nWPadG0VnlFFE=;
        b=ecwfihgDEkKJkrHxnahHagHajhnpc8VlLw/9lC9nNhzqHBnWRLKlv7J9cakI+/Y0hx
         AbMuKo2OOOw6/Z/NohYK0pZDBWn/3O+tRUJ57a5aQYBNdA9+B1jilyUWbeAKbIUaq84M
         aM/gkWBJjf8WJnhZoEn2bjSTz0iQa2dr8QWi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690582053; x=1691186853;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a/wVnm3EN1NjyLisolQ+1EUoCvmYp0nWPadG0VnlFFE=;
        b=lBLgCpKVcG1W+zXzSNBfoxXMy36oMXvsK7x9rxAEj8tnbOFSlkUMhOgLk6eqyDCjIO
         IZRfHfR11nuaESBSXCA/ntkPJLcHCbNZFm0T7jjz4MkJXG++bZo7c2yIXuV9qSHuZ8GS
         74mwlR3VTpiAwXXVdap/xXJE3V3dChL4VkYdd/yVXfynKuszS0Ulf+bUf3IoyPHxXeP9
         k7sET4dt3F6Btc6+Nq5beocimMcUOzSco6LMJRwNofmIZc4XpBR1va6S8luhvHb5vxiv
         ssgxIL/i90Ua8wZW8QHEU7HvO+Sdhp5lOA1dbY+8cDHbaa/Vcg3Flqh44XXsWQy8YmLp
         EFdw==
X-Gm-Message-State: ABy/qLbndKZCbGh/caf4G7uHeQt3NWvdVZ0b8DDGhw36CIUZuDTK5NIU
	Va08Yfi46PcIO6/iqKYI/ZwFhg==
X-Google-Smtp-Source: APBJJlHm+OQUHwhdevpIT1Bh/ybx9YjCvCb0NYAdp8tE1sfEqEwDpE/1bmFPPBcLfSUQdIJUXi9m2w==
X-Received: by 2002:a05:600c:2248:b0:3fb:ffa8:6d78 with SMTP id a8-20020a05600c224800b003fbffa86d78mr658167wmm.36.1690582053205;
        Fri, 28 Jul 2023 15:07:33 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f929:4921:3439:ee63? ([2001:8b0:aba:5f3c:f929:4921:3439:ee63])
        by smtp.gmail.com with ESMTPSA id i8-20020adfefc8000000b0030ada01ca78sm5845001wrp.10.2023.07.28.15.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 15:07:32 -0700 (PDT)
Message-ID: <22bef063b15a1dbd6232785bf4812eb13b06fdc5.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] multilib.conf: explicitly make
 MULTILIB_VARIANTS vardeps on MULTILIBS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Qi.Chen@windriver.com, openembedded-core@lists.openembedded.org
Date: Fri, 28 Jul 2023 23:07:31 +0100
In-Reply-To: <20230727061521.3626071-1-Qi.Chen@windriver.com>
References: <20230727061521.3626071-1-Qi.Chen@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 22:07:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185041

On Thu, 2023-07-27 at 14:15 +0800, Chen Qi via lists.openembedded.org
wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> This patch is to ensure recipes get rebuilt correctly and avoid
> incorrect sstate cache reuse when toggling multilib.
>=20
> The following steps show one example of such incorrect sstate cache reuse=
.
> 1. enable multilib && bitbake <some_image> -c populate_sdk
> 2. disable multilib && bitbake <some_image> -c populate_sdk
>=20
> The error message is as below:
> Error:
>  Problem: conflicting requests
>    - nothing provides binutils-cross-canadian-i686 needed by packagegroup=
-cross-canadian-intel-x86-64-1.0-r0.x86_64_nativesdk
>    - nothing provides gcc-cross-canadian-i686 needed by packagegroup-cros=
s-canadian-intel-x86-64-1.0-r0.x86_64_nativesdk
>    - nothing provides gdb-cross-canadian-i686 needed by packagegroup-cros=
s-canadian-intel-x86-64-1.0-r0.x86_64_nativesdk
>  (try to add '--skip-broken' to skip uninstallable packages)
>=20
> We get this error because packagegroup-cross-canadian recipe is
> not rebuilt when it should be.
>=20
> Current codes have tracked the dependency to MULTILIB_VARIANTS, as
> shown in the following chain:
> RDEPENDS:packagegroup-cross-canadian-intel-x86-64 ->
> all_multilib_tune_values -> MULTILIB_VARIANTS.
>=20
> However, MULTILIB_VARIANTS cannot automatically depend on MULTILIBS.
> See some results from 'bitbake-dumpsigs' below:
> List of dependencies for variable MULTILIB_VARIANTS is ['extend_variants'=
]
> Variable MULTILIB_VARIANTS value is ${@extend_variants(d,'MULTILIBS','mul=
tilib')}
>=20
> It's obvious that the value of MULTILIB_VARIANTS depend on the
> value of MULTILIBS, so let's set this dependency manually.
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/conf/multilib.conf | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
> index 7f3b9463ef..ef3605a73d 100644
> --- a/meta/conf/multilib.conf
> +++ b/meta/conf/multilib.conf
> @@ -2,6 +2,7 @@
>  baselib =3D "${@d.getVar('BASE_LIB:tune-' + (d.getVar('DEFAULTTUNE') or =
'INVALID')) or d.getVar('BASELIB')}"
> =20
>  MULTILIB_VARIANTS =3D "${@extend_variants(d,'MULTILIBS','multilib')}"
> +MULTILIB_VARIANTS[vardeps] +=3D "MULTILIBS"
>  MULTILIB_SAVE_VARNAME =3D "DEFAULTTUNE TARGET_ARCH TARGET_SYS TARGET_VEN=
DOR"
> =20
>  MULTILIBS ??=3D "multilib:lib32"

I suspect this resulted in this selftest failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5534/step=
s/15/logs/stdio

Cheers,

Richard

