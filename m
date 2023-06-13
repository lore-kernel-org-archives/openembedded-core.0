Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81958EB64D8
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 20:59:41 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.2226.1686689980056697825
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jun 2023 13:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=SA8Q9r50;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f8ca80e889so14685e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 13:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686689978; x=1689281978;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IqzK42LBWcVcq6z0L3VaDy818wFgKLBEp3zk/TQt5wE=;
        b=SA8Q9r50nfbLaTP2mhSuCYPSIE0KzZ0D7tCjlGPM2/4a/8/Ml7duNNMpxe19mliAoy
         DpelVSSdHUuHpgvknbLEWEH9EWjnAWo97jWotiIyzUtP7L+jIy+3FszL45InLRxU3/Tu
         veqP0+uaJ842QflSE/v6LaZqszJFzTfA9fZks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686689978; x=1689281978;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IqzK42LBWcVcq6z0L3VaDy818wFgKLBEp3zk/TQt5wE=;
        b=Zg5pk16I+/wsy6zBRZxqEOZ3tIZ7x8L40CWXNWGog5UyEKgflsj+0BzhgrE8CPjUyR
         NDq98Uw9OMQXaB38pWw4YDontDmsB7gKuNyzqlsIaTGA3LJVO6ptJIUrnvJd1udQJTTE
         wRSqaAvnewskjJ/Mb8Y5p/C408126TSp9Zg6tSQlqriRDcXuqWumKwX3hr1iLUqJ80jX
         gkyS8trAmR18+gHBDjo2+NW620/KlZZa9hxRCSSVckWEbCgD1x2qxyCn3DEtuN6szJTt
         K6+Ly19IvMurby2Lg6sbgJvjfXNYtsrVDOwBND3XGMYtNuQjOGHhE4tlXLmRaxoA6wAK
         QUhA==
X-Gm-Message-State: AC+VfDyXDumNOaVQzryPQ3Am7rTs7WuqqtDPdiZUoIAkwY7CFc/RfnBp
	1sacSnvYx1COJEisP3lHDak0mH1dhr5wt/6R6Jw=
X-Google-Smtp-Source: ACHHUZ4YnbFvzadekAuXYX554A7HGYLO52id1dHozkWEC3KxeSsTv68LCvrYoNzAeicPoo9c9nAY7Q==
X-Received: by 2002:a05:600c:cf:b0:3f6:41f:5a68 with SMTP id u15-20020a05600c00cf00b003f6041f5a68mr9508060wmm.29.1686689978506;
        Tue, 13 Jun 2023 13:59:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5d56:2e19:9720:bd3b? ([2001:8b0:aba:5f3c:5d56:2e19:9720:bd3b])
        by smtp.gmail.com with ESMTPSA id n26-20020a1c721a000000b003f78fd2cf5esm15431966wmc.40.2023.06.13.13.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 13:59:38 -0700 (PDT)
Message-ID: <fcb088b53c6635a6289c3d7d6fdbc6930de634a6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] python_mesonpy: New class
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Zoltan Boszormenyi <zboszor@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Date: Tue, 13 Jun 2023 21:59:37 +0100
In-Reply-To: <20230602074419.2450399-3-zboszor@gmail.com>
References: <20230602074419.2450399-1-zboszor@gmail.com>
	 <20230602074419.2450399-3-zboszor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 20:59:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182725

On Fri, 2023-06-02 at 09:44 +0200, Zoltan Boszormenyi wrote:
> This is a new PEP517 compatible build class for python modules
> that use pyproject.toml and this:
>=20
> [build-system]
> build-backend =3D 'mesonpy'
>=20
> The new class uses python3-meson-python-native.
>=20
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  meta/classes-recipe/python_mesonpy.bbclass | 54 ++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 meta/classes-recipe/python_mesonpy.bbclass
>=20
> diff --git a/meta/classes-recipe/python_mesonpy.bbclass b/meta/classes-re=
cipe/python_mesonpy.bbclass
> new file mode 100644
> index 0000000000..1da8b005ab
> --- /dev/null
> +++ b/meta/classes-recipe/python_mesonpy.bbclass
> @@ -0,0 +1,54 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +inherit meson setuptools3-base python3targetconfig python_pep517
> +
> +# Filter out meson_do_qa_configure from do_configure[postfuncs]
> +DOCONFIGUREPOSTFUNCS :=3D "${@d.getVarFlag('do_configure', 'postfuncs')}=
"
> +DOCONFIGUREPOSTFUNCS:remove =3D "meson_do_qa_configure"
> +do_configure[postfuncs] :=3D "${@'' if d.getVar('DOCONFIGUREPOSTFUNCS') =
is None else d.getVar('DOCONFIGUREPOSTFUNCS') }"
> +
> +# This prevents the meson error:
> +# ERROR: Got argument buildtype as both -Dbuildtype and --buildtype. Pic=
k one.
> +MESONOPTS:remove =3D "--buildtype ${MESON_BUILDTYPE}"
> +
> +CONFIGURE_FILES =3D "pyproject.toml"
> +
> +DEPENDS +=3D "python3-wheel-native python3-meson-python-native"
> +
> +def mesonpy_get_args(d):
> +    vars =3D ['MESONOPTS', 'MESON_CROSS_FILE', 'EXTRA_OEMESON']
> +    varlist =3D []
> +    for var in vars:
> +        value =3D d.getVar(var)
> +        vallist =3D value.split()
> +        for elem in vallist:
> +            varlist.append("-Csetup-args=3D" + elem)
> +    return ' '.join(varlist)
> +
> +PEP517_BUILD_OPTS =3D "-Cbuilddir=3D'${B}' ${@mesonpy_get_args(d)}"
> +
> +# Python pyx -> c -> so build leaves absolute build paths in the code
> +INSANE_SKIP:${PN} +=3D "buildpaths"
> +INSANE_SKIP:${PN}-src +=3D "buildpaths"

This is not ready for core as the output is not reproducible. I am not
taking patches which skip buildpaths warnings.

This also shows that the code is not being tested in OE-Core. Until it
is needed by and being used by something in core, I don't think it
should be there.

Cheers,

Richard


