Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D57C0E7D0D4
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 06:47:50 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.15657.1695365268068864843
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 23:47:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A4E5a1+O;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-401da71b85eso18994415e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 23:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695365266; x=1695970066; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3AN1U+xqCfaUjzKyFv08uFo79EslfcsAF5goBoup4PY=;
        b=A4E5a1+OS1u6ehbc8u6wZQUOE4uvVgV3Wr1sV192Ru0uZbarbhaO9yFhHJyfr67cmO
         mmFGydoWmfLU/nKHTr1dbYsfFIEZxKdOkcQwNWsMktcTTaoN5VDVyHCuLbrliuRZ2Sad
         gWVGt3APDQTz/sVNr2wavNU7efJV0UDyLBoAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695365266; x=1695970066;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3AN1U+xqCfaUjzKyFv08uFo79EslfcsAF5goBoup4PY=;
        b=w7X55w47ZIVVkDXl3obL1u6NRRdvuwOO3Pg+WZUfQKXnUDmJX7kiLkYCHavXIYL9q3
         5lTdyZdfgOkWtU52NmvEUNw28+XYBQa1Vn2vT75f687lQgbQbkGB+gPTjpEFb6ZxIOog
         3XCU7YCHWFt4WwKAJXWQr3AM5rgSX2KblDMkNL0MtLBiHQoEDSCgrd5wzL4vbC6b7dCu
         LnuMKIWO3daeYOdqNtH3JSWPaoeXdKBacFbVJOmI9u9KzarqOgH82/PDXf1uLQ3unuRo
         e8lhZgnjdV0HnI+vnJSyPB3W5NFZAUXbsqKug0rhReAppBsiXu+BE8RJfcuQ/oX0dnAK
         hZKQ==
X-Gm-Message-State: AOJu0Yw9NGK/P1Ldj5jz6Y+OAKHZLMvU6Dmz4MGEYGpTExZH4TNSSpAK
	RhisahJa3DI/sDN+B9RRJJsJmw==
X-Google-Smtp-Source: AGHT+IHK2Y89R9CNqppRKlFB2QBILfy7jxU3wdvBspVXpCZJqw2c02jBJ5C5OPq/ueP99fuVBBrgxA==
X-Received: by 2002:adf:a3c1:0:b0:321:7844:de44 with SMTP id m1-20020adfa3c1000000b003217844de44mr5401879wrb.45.1695365266261;
        Thu, 21 Sep 2023 23:47:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f6e4:1bee:736d:f9fd? ([2001:8b0:aba:5f3c:f6e4:1bee:736d:f9fd])
        by smtp.gmail.com with ESMTPSA id p5-20020a056000018500b0031980783d78sm3612557wrx.54.2023.09.21.23.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 23:47:45 -0700 (PDT)
Message-ID: <a4899d3917743e55691974ff5d20515ba9a82520.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] classes/create-spdx-2.2: Add missing import
 oe.packagedata
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: reatmon@ti.com, openembedded-core@lists.openembedded.org
Date: Fri, 22 Sep 2023 07:47:45 +0100
In-Reply-To: <20230920153049.13833-1-reatmon@ti.com>
References: <20230920153049.13833-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 06:47:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188043

On Wed, 2023-09-20 at 10:30 -0500, Ryan Eatmon via
lists.openembedded.org wrote:
> Add missing import statement to fix build failures:
>=20
> File: '/scratch/jenkins_builds/arago-master-wip/build/sources/oe-core/met=
a/classes/create-spdx-2.2.bbclass', lineno: 722, function: collect_package_=
providers
>      0718:    deps.append((d.getVar("PN"), d.getVar("BB_HASHFILENAME")))
>      0719:
>      0720:    for dep_pn, dep_hashfn in deps:
>      0721:        localdata =3D d
>  *** 0722:        recipe_data =3D oe.packagedata.read_pkgdata(dep_pn, loc=
aldata)
>      0723:        if not recipe_data:
>      0724:            localdata =3D bb.data.createCopy(d)
>      0725:            localdata.setVar("PKGDATA_DIR", "${PKGDATA_DIR_SDK}=
")
>      0726:            recipe_data =3D oe.packagedata.read_pkgdata(dep_pn,=
 localdata)
> Exception: AttributeError: module 'oe' has no attribute 'packagedata'
>=20
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta/classes/create-spdx-2.2.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-s=
pdx-2.2.bbclass
> index 9b28d124c7..ff319207f7 100644
> --- a/meta/classes/create-spdx-2.2.bbclass
> +++ b/meta/classes/create-spdx-2.2.bbclass
> @@ -708,6 +708,7 @@ def collect_package_providers(d):
>      from pathlib import Path
>      import oe.sbom
>      import oe.spdx
> +    import oe.packagedata
>      import json
> =20
>      deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))

We've realised that packagedata is missing in BBIMPORTS in
meta/lib/oe/__init__.py which should fix this but also add missing
dependency information so I'm likely to go with that change and this
one shouldn't be needed. Let me know if that isn't the case.

Cheers,

Richard

