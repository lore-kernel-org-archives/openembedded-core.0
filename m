Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45340C61DA4
	for <webhook@archiver.kernel.org>; Sat, 11 Mar 2023 13:04:36 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.44109.1678539872359946420
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Mar 2023 05:04:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EUgwJXqH;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id i34so31308459eda.7
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 05:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678539871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VwhN9FyghheBnuoGN/PQM5bSJWGSKvFrfdcg8sE07jI=;
        b=EUgwJXqH4M1UycYOCP+lXfS4nsuHwQgxdK/XWEs2MJ1ogWOr9b1YVw7cDUjy9i4ISQ
         Kbk1Cpvi2dRhMtOp37nVOmpwXEXHgDj5qU4bZsgUjdIZbHUAf0IHHuWMIBY2RbJkHGF0
         /8FoSXG7PfCFCUJti0IZ6HjeSre936wmYukBvqR+Dp+L06S+CbYJQIom7qPlCUkohRBQ
         XxArJUJP0Un9IEB/ExxDdZCLylKR4G7e6E8p6pQunjs1nncukeNu5UfWMjVg+PcebzI1
         3xRr+p/ZYl7VxkTLbvS8s0g0aXjd+3jLAKRRkec7ef803Prc+nskpvLhulX74A7CvdLZ
         aNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678539871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VwhN9FyghheBnuoGN/PQM5bSJWGSKvFrfdcg8sE07jI=;
        b=CztYbxEPNZXPF2QckhHjs97lRsafCgtm1wWxYKhprr0GlgjdsfPTKTXrXrJ5FJO8/K
         rt3UwVtnIxjqkOZi4qrgGiVW0XcRisPdh+OtMIQvqF/Qjsvc+UmXma/c31Y9+eFv0iqk
         6wS6IZLRYKKtUr/qCWIuzphTs9nLXy1Ms1T1ARAv5/gQgNKmrpFsSH8t4FPPZST6C1Kk
         kTrYXepKkxEFPbQ01Lr7Ti+YI311K2yFS1ithon926UjQ+Y8OOXn0XhxcvbLUiPfP8E/
         3zjaLi+maMZ0FxBEvpkWDq8a3+6UOO43QdmRlxTy4Qo5tNHvIAugXo9HZH93lHmrhfVO
         4kFQ==
X-Gm-Message-State: AO0yUKX56mnnStFajvTvke1J414lo5TiLEpi8e0VR5vOhCND6jd810Up
	/5Jp+qqlpVRxRR4tlDLpfsXicRbfLgaY3a4MzTA=
X-Google-Smtp-Source: AK7set9FbW6eemRmlBD6KMlXX72EeUy41v9XLLZNXFr4SzTy1aQijKTPrO111AV4YMkX2JyfyF5b4V6CnZILHVdZ0NA=
X-Received: by 2002:a17:906:1850:b0:8b1:780d:e43d with SMTP id
 w16-20020a170906185000b008b1780de43dmr15043473eje.13.1678539870633; Sat, 11
 Mar 2023 05:04:30 -0800 (PST)
MIME-Version: 1.0
References: <20230302214744.1041422-1-sudipm.mukherjee@gmail.com> <A0A3131E-FCC9-4C84-A077-715368907A25@arm.com>
In-Reply-To: <A0A3131E-FCC9-4C84-A077-715368907A25@arm.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Sat, 11 Mar 2023 13:03:54 +0000
Message-ID: <CADVatmP+cSP4UzrdiqD67VGZoJ5FT3dqhzf-iJj5Px7hY=nazA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libgit2: update license information
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 13:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178366

Hi Ross,

On Wed, 8 Mar 2023 at 13:35, Ross Burton <Ross.Burton@arm.com> wrote:
>
> On 2 Mar 2023, at 21:47, Sudip Mukherjee via lists.openembedded.org <sudi=
pm.mukherjee=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > The LICENSE did not have complete information.
> > Some examples of missing license:
> >
> > Zlib: deps/zlib/
> > ISC: tests/clar/clar.c
> > LGPL-2.1-or-later: src/libgit2/xdiff/xdiffi.c
> > CC0-1.0: src/util/rand.c
> >
> > Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> > ---
> > meta/recipes-support/libgit2/libgit2_1.5.1.bb | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-support/libgit2/libgit2_1.5.1.bb b/meta/recip=
es-support/libgit2/libgit2_1.5.1.bb
> > index 59866ce385..eb7b538ece 100644
> > --- a/meta/recipes-support/libgit2/libgit2_1.5.1.bb
> > +++ b/meta/recipes-support/libgit2/libgit2_1.5.1.bb
> > @@ -1,6 +1,6 @@
> > SUMMARY =3D "the Git linkable library"
> > HOMEPAGE =3D "http://libgit2.github.com/"
> > -LICENSE =3D "GPL-2.0-with-GCC-exception & MIT & OpenSSL & BSD-3-Clause=
"
> > +LICENSE =3D "GPL-2.0-with-GCC-exception & MIT & OpenSSL & BSD-3-Clause=
 & Zlib & ISC & LGPL-2.1-or-later & CC0-1.0"
> > LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D112e6bb421dea73cd41de09e777f=
2d2c=E2=80=9D
>
> Can you also expand LIC_FILES_CHKSUM to cover these?

They are already mentioned in the COPYING file which is in the
"LIC_FILES_CHKSUM",
I guess they were overlooked when libgit2 was last updated.

Zlib: https://github.com/libgit2/libgit2/blob/maint/v1.5/COPYING#L366
ISC: https://github.com/libgit2/libgit2/blob/maint/v1.5/COPYING#L391
LGPL-2.1-or-later:
https://github.com/libgit2/libgit2/blob/maint/v1.5/COPYING#L441
CC0-1.0: https://github.com/libgit2/libgit2/blob/maint/v1.5/COPYING#L1137


--=20
Regards
Sudip

