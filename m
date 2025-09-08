Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E58CA1016
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 15:55:43 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.1326.1757346937641481708
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Sep 2025 08:55:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XLx6h1g1;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-71d5fb5e34cso48613617b3.0
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 08:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757346937; x=1757951737; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrgIuqnEjGx8WwniIuZn9irqqsCzGXSj5PirqLVyOuY=;
        b=XLx6h1g1TSUnyI1wzoLX/mOG/OuKMJ+mYH2I0LifhrMVzEiQJb7DkBMiGqrDIhv9T/
         cu/s/0d740GU9f31+igFZKitHabs6K0d0l6/I0zh9zcGIXP0Gu5dpoSqBlDoD68EKXjP
         +QKYcITonJk4+zjHp5BkYK7xS2NuMtMeeg4F4vAsQaWJdvkgsFxWHMXNZzyN5wJZayyg
         ad9wKfmkBYiFtgKuMgvhT+IcUszRZFUQtSJK3il+SF4JDQSdTsetlyii1nKPfpX9ZBPS
         FOi85vmzW+YFw4/sgZ21evsMdnM5GhceSBqY8pero2srsSsj3BarIVqFu+j7gVObn2jh
         6yyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757346937; x=1757951737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xrgIuqnEjGx8WwniIuZn9irqqsCzGXSj5PirqLVyOuY=;
        b=PS5Ua16Hxdyt2tmTrXcVbtjbpmloda1id1B7VHydGLOosTy9B3KkbTfXGOONIh1rtf
         HV3ITrZBa+J7SnqRGvPBFt1CwoI5W6oArEtsqqhcjNzfyg3h8v+3KVGJ+EUm2VvyCF06
         9cgGP1WWaMG/91Ir6iCBdNrVpOk3XM3oF6htmG0uX6QUt0R/Y/Bz1bQLbSl+i7MGJT/H
         Dh09ncMc6plfVwVz98oSZgHMIB4JAE44HrcDJnUV/aAlneLFQMKT7aHOUasxuOrtEc9a
         vJdlIuRMmklMgiXi7yF9UBieH6zjaihl7MHnlob/EeAqeNVINcAJqX9DGe/dyo3Oz+Vw
         ILwQ==
X-Gm-Message-State: AOJu0YzgMXT1PyWyLoQHZqG0O/IMxYdGYvxIXhpbc46mbTUvd9yEQF1N
	P6QkobRv9usMaECb3DX4mdGBs2tS7KSzTVdMrJSj3K21G9ezh3VNT4/uOw8KYfQ3SPnD13a5uva
	/R2PABb8cDLXB0a0j9uj7cdqbDkCjqQ3Z1vkC
X-Gm-Gg: ASbGncvu9Df3ABfwTC6o78HXU20oI9m12W8v5nbyrAaJ7tzGjus9XFkEBauSEfPWl18
	sdSLUe0mN+bb+j65JidieDhdtccA+DJXwBUse7vCfO7hkIORiCrCAd7UDTyjXkrjT2sxDq36HyL
	TbIqkRJ5VpL1ILzTiDk2J640Ts2CwriaZwHnpHBF6qjf34ZGHpz5OPpBKnnLIQEoW6Jl3E7do8O
	KXm5JkguqkY6hASNWeGmRbRcP8ar3SmwAgYudKrgm8dWjchs0PlUYHI6p/CM+soMRd31+FMQHV7
	MkZ7a6fY9k7t16t/NtC966rIiPb7xKnVRX5KOmBouCOlgsZcmgLSag93GA==
X-Google-Smtp-Source: AGHT+IGSAp7VkZhlw9RAtwjT+W9+NqoqkaloO4bv7L3q3zARuCVmudI6IgEQv4G2/3WgrSzP7eoca37sg8a4felJvGE=
X-Received: by 2002:a05:690c:4b93:b0:71f:c5f0:3385 with SMTP id
 00721157ae682-72808e50e21mr70860697b3.12.1757346936347; Mon, 08 Sep 2025
 08:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sqtEcW-wzC3uP7mmiTqAJCVCqzg_Fy5H3anpVUnkg-QDw@mail.gmail.com>
 <4495.1756900180442086216@lists.openembedded.org>
In-Reply-To: <4495.1756900180442086216@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Sep 2025 08:55:09 -0700
X-Gm-Features: Ac12FXy8qJuLH6eqXn29FxksJY9dVfdC1crUs12XvFLVvj30BsnOBp390xGXarE
Message-ID: <CAMKF1soPJXvzXoqKz6oGfdZKsJOMi2aEeYjyU9XX+eTpoNBe4w@mail.gmail.com>
Subject: Re: [OE-core] [walnascar 3/3] bitbake.conf: Switch prefix mapping to
 use -ffile-prefix-map
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 15:55:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223073

On Wed, Sep 3, 2025 at 4:49=E2=80=AFAM Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>
> Hi Khem,
>
> We backported this patch due to a specific use case on our end. We set th=
e TMPDIR
> path length to 399 characters (just under the 400-character limit) and at=
tempted
> to build lib32-gcc. While this works fine on the master branch, we encoun=
tered the
> following error on the walnascar branch:
>
> make: /bin/bash: Argument list too long
> make: *** [Makefile:4701: all-gcc] Error 127
> ERROR: oe_runmake failed
>
> Upon comparing the logs between the master and walnascar branches, we not=
iced that
> in walnascar, the following flags were passed multiple times:
>
> -fmacro-prefix-map
> -fdebug-prefix-map
> -fcanon-prefix-map
>
> Since our TMPDIR path is quite long, passing it repeatedly via these flag=
s seems
> to be the root cause of the issue.
>
> In the master branch, these were replaced with the more concise "-ffile-p=
refix-map"
> flag, significantly reducing the number of times the long TMPDIR path is =
passed to
> the compiler. This change resolved the error, which is why we backported =
the patch
> to walnascar.
>
> So, can we backport this for walnascar branch in future or do you suggest=
 us to wait for
> october release.
>

these fixes also needed fixed in other layers so they will need to
backport needed patches
as well. I can speak for meta-oe layers but I am sure there are more,
so I would think it
is not an easy cherry-pick,

The issue of duplicate options is at the root of it, perhaps finding
that out and trying to solve
is a good fix even for master. Backporting this is just a workaround
to overcome the real issue.

> Regards,
> Deepesh
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222856): https://lists.openembedded.org/g/openembedde=
d-core/message/222856
> Mute This Topic: https://lists.openembedded.org/mt/114665450/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

