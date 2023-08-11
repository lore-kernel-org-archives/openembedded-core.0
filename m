Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC792C0015E
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 19:06:24 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.51214.1691780782213065982
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Aug 2023 12:06:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=GVep5Ypx;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.42, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-99bf3f59905so314067666b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 12:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691780780; x=1692385580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwTWDyPsOhlm2nk4t+VxqIf8k2vkTIiOtrbgVqPWgSs=;
        b=GVep5YpxhFZqbcaU29pDffFiOI21tLqr4JUochhxNg2U1hX4PTkZe/Ub7KzRwGz5TS
         bVTcCz0pu4HhGpkMPlIYpXsZRsTz0xLP7qkqYgCpXsIxh82+yssBQdTlS4ox5WHbqoZt
         wD784VM4E8eoHLcXhXhWZVGmyoBDSqwVj8PiCyvD1fMi61c1ByR1fgFUOystEGnEB07n
         Dlh2gf9BxTL/+mEdF+3HiPqxckL+2QlQMTN/FhHkXS7CBe82RPzlE6QxvNIQDCXGTPFM
         gZdfBVPNQ6KodGmYFNf427MaLcvTexfLheuTesApdUzx8n9q8rkl9P7cAeF2XC2n+wSH
         zQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691780780; x=1692385580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwTWDyPsOhlm2nk4t+VxqIf8k2vkTIiOtrbgVqPWgSs=;
        b=Pff8j+3SVo9aAwOCjgyPKLike9dS+6nQVXWD3zn5pGjKefkJT6BAV8Igf5qP5/IeQS
         4VEJxsEXlZK0zTJGibxfTt1Brs1Sf5H6wNhifwOE3imPijkZ8n2vAvPCF/jOEFoMlMkd
         bhHZfXPNEK2S8hlYDU9NsY4/+JHxeEmeopMo5HQkHX8HhNfHNJaERXZUxCgGQ9i6Lx4+
         mbbow5LLBCNmKtKyP2MzN75syLevQyq/LeMiKq6sSG+CzWX8mY0XPHhFrMgmW/d5VhXK
         vZQQebWNYzYB3cJjFkwVmEov77O5EOmd8omyyVOASZl0y42eJ2xZGYr2tIMc3E1R2lRH
         YV2A==
X-Gm-Message-State: AOJu0YxN/WWtpHP82rA+55vsaofVxMZQx6LVLDcp1E81SeUqfikF4Y2G
	LssaheNwQl2zaS7cPCIn4VcrVzAAlUetAq0B500Mzg==
X-Google-Smtp-Source: AGHT+IEjEqhc5xE1jxbmw4Jdy6xrvzn5H4+ZdoaANmMyTqzLBqsrfPxzx1eID0WVfy2vKO/uSUoyAdNSgtFMxU3nslI=
X-Received: by 2002:a17:906:20d0:b0:99b:4668:865f with SMTP id
 c16-20020a17090620d000b0099b4668865fmr2647536ejc.10.1691780780200; Fri, 11
 Aug 2023 12:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230808083242.3788723-1-narpat.mali@windriver.com> <3187f839-36f2-d226-2478-a6810ade6671@windriver.com>
In-Reply-To: <3187f839-36f2-d226-2478-a6810ade6671@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 11 Aug 2023 09:06:09 -1000
Message-ID: <CAOSpxdamLyMHmqiiZZmgxUPNiydtYNx2iO=cERT5s533VG=XKw@mail.gmail.com>
Subject: Re: [OE-core][mickledore][PATCH 1/1] python3-pygments: upgrade 2.14.0
 -> 2.15.1
To: randy.macleod@windriver.com
Cc: narpat.mali@windriver.com, openembedded-core@lists.openembedded.org, 
	Tim Orling <tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 19:06:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185851

On Fri, Aug 11, 2023 at 6:42=E2=80=AFAM Randy MacLeod via
lists.openembedded.org
<randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>
> Narpat,
>
> I don't see this in Steve's test branch:
>    https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable=
%2Fmickledore-nut&qt=3Dgrep&q=3Dpygments

Yes, for the reasons you discuss below.  I was intending to reply this
morning, but you beat me to it :-)

> which is good since for mickledore, I think that you need backport only t=
he fix commits
> because 2.15.1  has added features and build related changes. I'm not usi=
ng pygments
> so I've CCed Tim to ask him to confirm that this is the right approach.
>
> I think that since we've worked on chromium and maybe vim together, and s=
een my
> suggest an upgrade rather than a commit backport for dmidecode, you are
> under the mistaken impression that it's generally acceptable. It's not.
>
>
> Also you asked about kirkstone privately, so I'll quote that here:
>    "the current version of python3-pygments is 2.11.2 in LTS22 and
>     have tried back-porting these above fixes but, the source files
>     have been changed a lot and I am unable to back-port these.
>     So, upgrading this current version 2.11.2 -> 2.15.1 would be acceptab=
le or not ? "
>
> Here as well, the answer is no, we need you to backport the fixes. If it'=
s simply not
> practical to fix a CVE, in rare cases, you could tag the CVE with somethi=
ng like:
>
> meta/recipes-devtools/flex/flex_2.6.4.bb:CVE_STATUS[CVE-2019-6293] =3D "u=
pstream-wontfix:
> or =3D "backporting-not-sensible"
>
> but that's a last resort and others may rightfully object to that conclus=
ion.

Yes, same issue with a kirkstone upgrade!  However your suggestion to
consider CVE_STATUS isn't possible for any of the stable branches
since we won't be backporting that feature (it is too intrusive)

So for mickledore and kirkstone it would be CVE_CHECK_IGNORE and with
dunfell CVE_CHECK_WHITELIST. And of course comment explaining the
issue and why this is an appropriate resolution.

Steve

> On 2023-08-08 04:32, Narpat Mali via lists.openembedded.org wrote:
>
> From: Narpat Mali <narpat.mali@windriver.com>
>
> * Upstream has dropped setup.py
> * Inherit python_setuptools_build_meta instead of setuptools3
> * Add self as maintainer, as this is a dependency for python3-sphinx
>
> Adds some new lexers, updates a few others. A handful of bug fixes.
>
> https://github.com/pygments/pygments/blob/2.15.1/CHANGES#L6
> https://github.com/pygments/pygments/blob/2.15.1/CHANGES#L18
>
> Have cherry-picked the upgrade commit from upstream/master:
> https://git.openembedded.org/openembedded-core/commit/?id=3D22e2569ae4843=
071b2b48d026ca4742351baf6d1
>
> It's good that you amended the commit log to show where the work
> came from. It seems that you dropped these two SOB lines:
>
>     Signed-off-by: Tim Orling <tim.orling@konsulko.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> I'd keep them since it's part of the upstream commit.
>
>
>
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> ---
>  meta/conf/distro/include/maintainers.inc                      | 2 +-
>  ...{python3-pygments_2.14.0.bb =3D> python3-pygments_2.15.1.bb} | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-devtools/python/{python3-pygments_2.14.0.bb =3D> pyt=
hon3-pygments_2.15.1.bb} (76%)
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index 07498a23a9..c9d790ca32 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -666,7 +666,7 @@ RECIPE_MAINTAINER:pn-python3-pyasn1 =3D "Tim Orling <=
tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-pycairo =3D "Zang Ruochen <zangruochen@loon=
gson.cn>"
>  RECIPE_MAINTAINER:pn-python3-pycparser =3D "Tim Orling <tim.orling@konsu=
lko.com>"
>  RECIPE_MAINTAINER:pn-python3-pyelftools =3D "Joshua Watt <JPEWhacker@gma=
il.com>"
> -RECIPE_MAINTAINER:pn-python3-pygments =3D "Unassigned <unassigned@yoctop=
roject.org>"
> +RECIPE_MAINTAINER:pn-python3-pygments =3D "Tim Orling <tim.orling@konsul=
ko.com>"
>
> This came from the cherry-pick but clearly you should CC Tim and probably=
 email
>
> him first to see if he agrees on maintainership for the recipe in mickled=
ore.
>
>
> ../Randy
>
>
>  RECIPE_MAINTAINER:pn-python3-pygobject =3D "Zang Ruochen <zangruochen@lo=
ongson.cn>"
>  RECIPE_MAINTAINER:pn-python3-pyopenssl =3D "Tim Orling <tim.orling@konsu=
lko.com>"
>  RECIPE_MAINTAINER:pn-python3-pyparsing =3D "Unassigned <unassigned@yocto=
project.org>"
> diff --git a/meta/recipes-devtools/python/python3-pygments_2.14.0.bb b/me=
ta/recipes-devtools/python/python3-pygments_2.15.1.bb
> similarity index 76%
> rename from meta/recipes-devtools/python/python3-pygments_2.14.0.bb
> rename to meta/recipes-devtools/python/python3-pygments_2.15.1.bb
> index 16769e9263..e0e477100e 100644
> --- a/meta/recipes-devtools/python/python3-pygments_2.14.0.bb
> +++ b/meta/recipes-devtools/python/python3-pygments_2.15.1.bb
> @@ -4,8 +4,8 @@ HOMEPAGE =3D "http://pygments.org/"
>  LICENSE =3D "BSD-2-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D36a13c90514e2899f1eba7f41c3ee=
592"
>
> -inherit setuptools3
> -SRC_URI[sha256sum] =3D "b3ed06a9e8ac9a9aae5a6f5dbe78a8a58655d17b43b93c07=
8f094ddc476ae297"
> +inherit python_setuptools_build_meta
> +SRC_URI[sha256sum] =3D "8ace4d3c1dd481894b2005f560ead0f9f19ee64fe983366b=
e1a21e171d12775c"
>
>  DEPENDS +=3D "\
>              ${PYTHON_PN} \
>
>
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185850): https://lists.openembedded.org/g/openembedde=
d-core/message/185850
> Mute This Topic: https://lists.openembedded.org/mt/100618182/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

