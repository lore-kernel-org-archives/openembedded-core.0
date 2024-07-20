Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A1FC3DA59
	for <webhook@archiver.kernel.org>; Sat, 20 Jul 2024 13:06:54 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.5752.1721480810521328235
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jul 2024 06:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=g/lwxsyL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4266f535e82so18160495e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jul 2024 06:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721480809; x=1722085609; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJN0mDcKv3nrFS1jl5kBjoQdUSM7G2KSDeOch3wCEtQ=;
        b=g/lwxsyL7zWuwSUrAlugDocOFTsVx0DzDeZoyENt05k8jKrb9MAOMrAr86Ang8dGsk
         dI4jRCfRs9iupZDuWXBmw0jjETXLj3LqRFfduyUpT3kSxuHOUEMvlFDtu6yMFELTMa+g
         Fk2gWB42cU/0xmnM5diX8GKl3++eV9n1ni1RE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721480809; x=1722085609;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NJN0mDcKv3nrFS1jl5kBjoQdUSM7G2KSDeOch3wCEtQ=;
        b=J0Wz0w/lgDoGruD5mZ370VXSgNz76JqwEtIlqwqBawx763yUP3LitsXckdvdfwMXrG
         s94ueSGPztblG9RUCpLgIFetkSoSWrqcmREqbpCSeBNh3TJPl9bw8I1XxnzinT0CCVwb
         ajKO74JWa99OeLn8iA4gxOAx8eWlH3XPggKic36TDkruMOtln5lBHJJEY4bLXBwgBpxX
         ytv9J/Bn0M+uGhWu1dG8yFhbqtY3RKO0MePffxUfXYiV/FCSlJkYp5+lJsZixlHgMAEb
         5xfykGNUHYWiuJsP3Q/wzIu/UC4F/YIcfCkCAajApi3jnGVMKYKhnsj3GHERpFKJkBGL
         /9lw==
X-Forwarded-Encrypted: i=1; AJvYcCXyCs0fcuN1YH0jmcS9z4HZtldrv6vsX79ksnw/MtI1yX/vgiNRFLBMxjRlx6iCR87R0PWfrvEOhHN8zuW6/JZ001KuFANUMw1M6ZGzD9KN4Ud2MMTFmPkQ
X-Gm-Message-State: AOJu0YxHlmuJZTJ7wPSigcT3ZRBRYS/BSneQGup1uOJp7nRLOlPe5upF
	drRLOn3M18veae0DmIvLDXAP9pTXEIbqJtaTLMWuU+CWGNdoDxknbUiJ5+67BMg=
X-Google-Smtp-Source: AGHT+IG3j61Dt7IbgD4/hztDhjh3Vrw4cIHUNK6yP86iix/tfa2ik9wZ61AhgZTlf9zdKDksxDkKhg==
X-Received: by 2002:a05:600c:83c8:b0:427:abf6:f0e6 with SMTP id 5b1f17b1804b1-427dc51f966mr10298995e9.9.1721480808774;
        Sat, 20 Jul 2024 06:06:48 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:47af:df48:475e:ef50? ([2001:8b0:aba:5f3c:47af:df48:475e:ef50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d690152esm56312675e9.13.2024.07.20.06.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jul 2024 06:06:48 -0700 (PDT)
Message-ID: <0a8d102337d8ae985340cc99033043190340b2a5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] meson: upgrade 1.4.0 -> 1.5.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Date: Sat, 20 Jul 2024 14:06:47 +0100
In-Reply-To: <20240719155039.3243662-1-ross.burton@arm.com>
References: <20240719155039.3243662-1-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jul 2024 13:06:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202285

On Fri, 2024-07-19 at 16:50 +0100, Ross Burton via lists.openembedded.org w=
rote:
> - Support for `bztar` in `meson dist`
> - Cargo dependencies names now include the API version
> - Added support `Cargo.lock` file
> - Meson now propagates its build type to CMake
> - compiler.run() method is now available for all languages
> - dependencies created by compiler.find_library implement the `name()` me=
thod
> - New version_argument kwarg for find_program
> - Meson configure handles changes to options in more cases
> - New meson format command
> - Added support for GCC's `null_terminated_string_arg` function attribute
> - A new dependency for ObjFW is now supported
> - Support of indexed `@PLAINNAME@` and `@BASENAME@`
> - Required kwarg on more `compiler` methods
> - The Meson test program supports a new "--interactive" argument
> - meson test now sets the `MESON_TEST_ITERATION` environment variable
> - The Meson test program supports a new "--max-lines" argument
> - Basic support for TI Arm Clang (tiarmclang)
> - Support for Texas Instruments C6000 C/C++ compiler
> - Wayland stable protocols can be versioned
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> =C2=A0.../meson/0001-Make-CPU-family-warnings-fatal.patch=C2=A0=C2=A0=C2=
=A0 | 10 +++++-----
> =C2=A0...module-do-not-manipulate-the-environment-when.patch |=C2=A0 8 ++=
++----
> =C2=A0.../0002-Support-building-allarch-recipes-again.patch=C2=A0 |=C2=A0=
 4 ++--
> =C2=A0.../meson/{meson_1.4.0.bb =3D> meson_1.5.0.bb}=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A04 files changed, 12 insertions(+), 12 deletions(-)
> =C2=A0rename meta/recipes-devtools/meson/{meson_1.4.0.bb =3D> meson_1.5.0=
.bb} (98%)

https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/9210/step=
s/13/logs/stdio

Cheers,

Richard

