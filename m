Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73335C47074
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 18:22:50 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web10.1294.1704392563442972938
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jan 2024 10:22:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ircsuXSp;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6dc53fc4b0dso447545a34.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 10:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704392563; x=1704997363; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVDjstNq8fNW3fqHmIdyMYnkZG+bGlITDXaJKsxiXRQ=;
        b=ircsuXSp/4SXOWjO2fFds2Ladn+5OV+DDFNWJNE6hlIxZQx1oT4KE9cNkTkCjDlvvt
         uKNneYkSdAGuGI3H94M+mNzz9HxXX9kS8AHT2zGZdIlpg965Q3fzBZr5CYITh+JunGYY
         lhouTOPFfzndG62YYW7Rs+wHbHR1DyHEGpEjdTL59XnTGJBuHGCeUmjcxtFeHxqKLim4
         c9iMoGbdxYbPiXc0DHZVOEyUm3wbKeIOgmPxfxmEL1D6E8A2OSMR1rExsJ0nblmATOfJ
         fMp6eaiV+vYyk89bQhxh7UCHJu9Pt61LjmJkatcylxzlC6wlFS/0nS0xeprUQ8+1OE4i
         5J9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704392563; x=1704997363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oVDjstNq8fNW3fqHmIdyMYnkZG+bGlITDXaJKsxiXRQ=;
        b=h2J/DusUOu2ZrcyeLTNeYPAmLZNopp2hRNDObfhYzb6cVPjZfwgLcA7tPu8tycTiJn
         JKEW2Sb80QYhCQXKABxXmTkHLDBDwwN0b2P4bpXf30CCpUtxTCXudhTn/dHcjYCcaEBW
         Lk8HGdODpnEZhsdV2EigV5YrbL2XJa/7jn/6Mb3XDSOshRQW5zX5cULZfL1F9HPDr/iL
         kEJPQGvf9UCLKHMu2lEf29xsPEIOFkrmolBD5i4cCQlXnmmkjtauD3QuqrS4S90evlmG
         KBpjLD4vw2qHf4m0Ecl/5JVnjex89o5aSMwt3Rb7k0O62fpzUFmm4L8kOdUO3jjX1yGo
         3+6Q==
X-Gm-Message-State: AOJu0Yz+zPcA+bVzk5wIuSkfxsZcZHuTqYReq3LAv1z0naOESd0H5TvZ
	P9qBEXvur5fMA70aTqlHLD/Lzw9+4pWo18ddGuchJUGlv50=
X-Google-Smtp-Source: AGHT+IFL/8Ui+QJAEjXeVNqQABolPt9fhvcFKXvEQ0G7XYHQpX/Hin9RlT26do8Xh1u/T7HJwEX5HxMAxY8SM+LXryA=
X-Received: by 2002:a05:6870:bf09:b0:1fb:75a:6d3c with SMTP id
 qh9-20020a056870bf0900b001fb075a6d3cmr1123386oab.99.1704392562580; Thu, 04
 Jan 2024 10:22:42 -0800 (PST)
MIME-Version: 1.0
References: <20240102060947.218414-1-Qi.Chen@windriver.com>
In-Reply-To: <20240102060947.218414-1-Qi.Chen@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 Jan 2024 10:22:16 -0800
Message-ID: <CAMKF1srdRBAzY=TWOK0+Q4Nx6FF2__fKCcnjGYQ7+=qjp9mBWg@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] gawk: upgrade from 5.2.2 to 5.3.0
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 18:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193335

I am seeing a ptest failure with this

    Failed ptests:
    {'gawk': ['cmdlinefsbacknl2']}

I guess it was also seen in previously posted patch
https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg18=
6875.html

On Mon, Jan 1, 2024 at 10:10=E2=80=AFPM Chen Qi via lists.openembedded.org
<Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-extended/gawk/{gawk_5.2.2.bb =3D> gawk_5.3.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-extended/gawk/{gawk_5.2.2.bb =3D> gawk_5.3.0.bb} (97=
%)
>
> diff --git a/meta/recipes-extended/gawk/gawk_5.2.2.bb b/meta/recipes-exte=
nded/gawk/gawk_5.3.0.bb
> similarity index 97%
> rename from meta/recipes-extended/gawk/gawk_5.2.2.bb
> rename to meta/recipes-extended/gawk/gawk_5.3.0.bb
> index 3c18b6911a..3d652da6e5 100644
> --- a/meta/recipes-extended/gawk/gawk_5.2.2.bb
> +++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb
> @@ -19,7 +19,7 @@ SRC_URI =3D "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
>             file://run-ptest \
>             "
>
> -SRC_URI[sha256sum] =3D "945aef7ccff101f20b22a10802bc005e994ab2b8ea3e724c=
c1a197c62f41f650"
> +SRC_URI[sha256sum] =3D "378f8864ec21cfceaa048f7e1869ac9b4597b449087caf1e=
b55e440d30273336"
>
>  inherit autotools gettext texinfo update-alternatives
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193205): https://lists.openembedded.org/g/openembedde=
d-core/message/193205
> Mute This Topic: https://lists.openembedded.org/mt/103477344/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

