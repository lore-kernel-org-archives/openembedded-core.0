Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5550CCAC5B8
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 15:31:43 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.20336.1758900694075458324
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Sep 2025 08:31:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kS0shmLv;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-71d60501806so24248157b3.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 08:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758900693; x=1759505493; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgmKWarsUWOS/1LDHcf6/g8yZjjznkuQZNZLBvvVW68=;
        b=kS0shmLvVPpzrhE82uYYLE7BD2utwZCY73O78SboxMd62BxHvSvlfTRlBkdOULwtGm
         P065GDI3v+p/hvkOyggPpez65mhaXXFhMUBQs5dCZAr8biL/guNz3Qdk9tuyqovwCUSU
         DEYri41A+mD4mCP++PBf5T7LLjsBIbXT3UAdgXTVm2V0DeNJJkGGddA8KH9F0HUs9aXA
         y79X/IrtIQSMlFdb78uLedUjZs54nzxRANXJXOwNLrzIzODeV/Fmw7mF3h8R6e6ov93K
         J1Tn2yOtGSfw/A+A/x9AHqJMEq9lYRlhw8KGZQwLBhe0r1WlVLM42cJ6jCVXN/hX1xDH
         yfog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758900693; x=1759505493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lgmKWarsUWOS/1LDHcf6/g8yZjjznkuQZNZLBvvVW68=;
        b=B+jpow/+xbMnY5iB7aCre83549R+nizryEREoMofQDftoQeWIxFQpylUIevw9f+CFU
         clePogteUqAlq4Dgh24TU8hfBRuY1I1EHYSZ9nQQnpNRXl4VlE7qNFf2W5BYZ2ZsfhcC
         C9LbGf056p8nkpQ1n9Y1xjLWaGWuLWzTM10HlCJba9GC2zyApMO7xaZ+f9kZxE28Ahcr
         SNpMjGpYL8qmsJ6qLL6yFij12O0pp4M6eflMahax1SomlzKIjcQj9AEKX2IAFTmPmAYX
         zDd5l9KENraU07DYrvBFJzitZIIulSsEEsK2yKZUUK1KcREBs1pMtj5+9HF/3P+ZtHhJ
         14sQ==
X-Gm-Message-State: AOJu0YxnWTFQNwWQUALQ17JhR/XBhA3UjZ2H14jMStMSGk/fsJk15bm+
	MDyLCzH3ETaTqnJUdOrmDQCCBN4YqPmNNM7L/mCjMr4kQ/Qd+n/M5wr2baUvMD1gjUnuUXE+mVO
	qU+neEJgo23MOc2iyB9IL7xFRMSrhcJI=
X-Gm-Gg: ASbGncuqxw2HxjBARkxIPucm3EClTcKp7n30TzH9JTsPEDsd5iORElLYK36hNRM2MCA
	bn5ZH0cMpP1y3a0/50ZDmwSMXaAEVHSAWhXY5adFxz4mmpI+WwT20qAwCNsLp4IIOG2dOwByINt
	ENXX8tcjwhZV7/gIg0VTXAwL0icGJp8EwpeuLAxgHtAIYclp3HjJI8Mxow5m24gA14VXkUT76/4
	MVj0RUldms9zoNAdisDFDc1KCE/PLb2pFFJysMdNybazFvuEWmGWDIiv6Zo5h7Zora/qVTbDaUL
	BItjek6NRA06+m5SHczpa3qUVP9MJOv2upU8C7Y7vBdiWwdq7holdPH08g==
X-Google-Smtp-Source: AGHT+IERRGQIK5pVVR2v/h6ubiZiyangB3qePrBe0CsMw9l8h12xy/JyPgTj+OkzPRHY41934XBouLsPMiuE1b/rURA=
X-Received: by 2002:a05:690e:2402:b0:635:4ecd:5fcc with SMTP id
 956f58d0204a3-6361a88aff4mr6591985d50.41.1758900692541; Fri, 26 Sep 2025
 08:31:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250926143339.3542389-1-ross.burton@arm.com>
In-Reply-To: <20250926143339.3542389-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 26 Sep 2025 08:31:06 -0700
X-Gm-Features: AS18NWCSM_UKhz_k3Voj9YsmhoiAwdG6B9r1pecwNp3UxMcodSTSHv-tr38ihYI
Message-ID: <CAMKF1sq7WtMH_GJnsc4oVDVgx4BqpqVU1qQadjJZOChCG0p94A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] classes/cmake: unset LDFLAGS in toolchain-native.bbclass
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 15:31:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224085

Thanks for adding more context. LGTM

On Fri, Sep 26, 2025 at 7:33=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> If a recipe is using toolchain-native.cmake to build native portion in a
> non-native build, the target LDFLAGS from the environment will leak into
> the native build.
>
> This was noticed as building a SDK with clang means that LDFLAGS contains
> a --dynamic-loader argument, so native binaries were trying to use the
> target loader.
>
> There are several variables that are set from LDFLAGS[1] so instead of
> setting them all, we can simply unset the environment variable in the
> toolchain.
>
> [1] https://cmake.org/cmake/help/latest/envvar/LDFLAGS.html
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes-recipe/cmake.bbclass | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmak=
e.bbclass
> index b8cd622c2df..4f59966521e 100644
> --- a/meta/classes-recipe/cmake.bbclass
> +++ b/meta/classes-recipe/cmake.bbclass
> @@ -212,6 +212,15 @@ set( CMAKE_LIBRARY_PATH ${STAGING_BASE_LIBDIR_NATIVE=
} ${STAGING_LIBDIR_NATIVE})
>  list(APPEND CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES ${STAGING_INCDIR_NATIVE=
})
>  list(APPEND CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES ${STAGING_INCDIR_NATI=
VE})
>
> +# The assignmens above override CFLAGS and CXXFLAGS from the environment=
 but
> +# not LDFLAGS, which ends up in CMAKE_EXE_LINKER_FLAGS. This then means =
our
> +# native builds use target flags, and can fail.
> +#
> +# As there are a number of variables that are set from LDFLAGS,
> +# clear it at source.
> +#
> +# https://cmake.org/cmake/help/latest/envvar/LDFLAGS.html
> +unset(ENV{LDFLAGS})
>  EOF
>  }
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224082): https://lists.openembedded.org/g/openembedde=
d-core/message/224082
> Mute This Topic: https://lists.openembedded.org/mt/115449745/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

