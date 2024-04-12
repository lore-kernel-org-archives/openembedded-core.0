Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F05AC4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 14:06:14 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web10.47858.1712930768146158439
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Apr 2024 07:06:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ljrhm2pr;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5aa3af24775so666624eaf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 07:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712930767; x=1713535567; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B96CwHqTvkkt99erFQW1NFduhL4AYm9Vj87D6TPWT5s=;
        b=ljrhm2pr1cpii4e9Tu2Q2P+nZ94s0wPJVhkQYcxXJahs1v+/VOm5OlZ3W4a8xHXPkN
         ja0eEyMvHgcUPWOQVXcQro+3uqrHBQ/ykL7hmfRuzibc8GZtyQH0s8yUWu0N7RHzyFsu
         XNdO7UPXuje6BKi2LEIrCsQFlmD/m7G3FQDAtLPv1tqCzKQqwW16dPY8fEqurbmfzZ8t
         lJxMcE2vlxywIRoYYfmpjV0o2huyYOLAIJafQf9W+qNvX9qAZ2+lpFU98ol0FbDho025
         dH9OwN/IHgD+7ft+srXMg9T1UvXMrtjx5YYl5S0bduTsq5kHwmaon+HVVy8FhLRDeiUB
         2MYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712930767; x=1713535567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B96CwHqTvkkt99erFQW1NFduhL4AYm9Vj87D6TPWT5s=;
        b=xRpNi3iWvLHs7P+BHnxUS8Onorgx4oK74YMl1yVTgA76e7LYkn0VGxmnPINt9Ri/9O
         DV/mujTxY2t45vfonjBdsQXsY55iLmkOuvG4Pm0vhF18xJKVD3q93fML0ksATyP7nza8
         LLPPE9a7S7da8iWmzfOUeCfD2+Xz4rjjR1zEAzNkjuiROb989bVCxoEyQBnahk5BxxxI
         LWmbq36kWMzw8/BgPl8vYTi7NIl/dHKeb8GHds6iseosx09VFsX7KJuIXlRr0m9O/9Ha
         zYfERBWmLMN7F2x1NzOTJR1Emg6lIlP3ecOzEMVsBxW6P1bOthpE5IVJ3GhHxEDpMIkd
         +dgw==
X-Gm-Message-State: AOJu0YwqKFcs20f8loAiRR4/a9baWNzqFMFfBC2pXol/kHgrPrZxiIpm
	Qckj1prB88kdsIXq0mH72z4O7A7Cq/pLpefHbV0nNwUCw9kdnK8HK+6VSdN4CERJGledRG+MCtq
	7JKPlWZIwXQ1i3ltjzu4AEv1pyQQ=
X-Google-Smtp-Source: AGHT+IG3drP/bBgEI6jDp6h4XoqIcq5aMlKtbzKcMTUhQ/XVZLtdkQdkNUAkAFlWU4gLlq+a90HK/eGFfHKoNJ0s0rs=
X-Received: by 2002:a05:6870:178e:b0:229:fd7a:d728 with SMTP id
 r14-20020a056870178e00b00229fd7ad728mr3107248oae.24.1712930767289; Fri, 12
 Apr 2024 07:06:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240412110837.2253822-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20240412110837.2253822-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Apr 2024 07:05:40 -0700
Message-ID: <CAMKF1srhQY+C+=i872hXb=9w_LHnpX_w+Ot5NNULhkkB4VZDRw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] python3-websockets: Import from meta-python
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 14:06:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198169

we need a patch to remove it from meta-python at same time

On Fri, Apr 12, 2024 at 4:08=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> For the newer hash equivlance servers we need websockets. Import it
> from meta-oe so we can easily include it in buildtools tarball.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/distro/include/maintainers.inc         |  1 +
>  .../python/python3-websockets_12.0.bb            | 16 ++++++++++++++++
>  2 files changed, 17 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-websockets_12.0.=
bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index 2d1f9fdec55..20eb3a04468 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -729,6 +729,7 @@ RECIPE_MAINTAINER:pn-python3-urllib3 =3D "Tim Orling =
<tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-vcversioner =3D "Bruce Ashfield <bruce.ashf=
ield@gmail.com>"
>  RECIPE_MAINTAINER:pn-python3-wcwidth =3D "Tim Orling <tim.orling@konsulk=
o.com>"
>  RECIPE_MAINTAINER:pn-python3-webcolors =3D "Bruce Ashfield <bruce.ashfie=
ld@gmail.com>"
> +RECIPE_MAINTAINER:pn-python3-websockets =3D "Tim Orling <tim.orling@kons=
ulko.com>"
>  RECIPE_MAINTAINER:pn-python3-wheel =3D "Tim Orling <tim.orling@konsulko.=
com>"
>  RECIPE_MAINTAINER:pn-python3-xmltodict =3D "Leon Anavi <leon.anavi@konsu=
lko.com>"
>  RECIPE_MAINTAINER:pn-python3-yamllint =3D "Tim Orling <tim.orling@konsul=
ko.com>"
> diff --git a/meta/recipes-devtools/python/python3-websockets_12.0.bb b/me=
ta/recipes-devtools/python/python3-websockets_12.0.bb
> new file mode 100644
> index 00000000000..f89c3b629ee
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-websockets_12.0.bb
> @@ -0,0 +1,16 @@
> +SUMMARY =3D "An implementation of the WebSocket Protocol (RFC 6455)"
> +HOMEPAGE =3D "https://github.com/aaugustin/websockets"
> +
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D51924a6af4495b8cfaee1b1da869b=
6f4"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[sha256sum] =3D "81df9cbcbb6c260de1e007e58c011bfebe2dafc8435107b0=
537f393dd38c8b1b"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> +
> +RDEPENDS:${PN} =3D " \
> +    python3-asyncio \
> +    python3-profile \
> +"
> --
> 2.40.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198163): https://lists.openembedded.org/g/openembedde=
d-core/message/198163
> Mute This Topic: https://lists.openembedded.org/mt/105480053/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

