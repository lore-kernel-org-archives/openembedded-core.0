Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C325EC04A95
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 10:56:28 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.5590.1666695375167664494
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Oct 2022 03:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DlRfzVI9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id y16so9665847wrt.12
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Oct 2022 03:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+jjjwyZFQj+60xylafzjnGJew8AdVsst4f2GPygV58=;
        b=DlRfzVI96tiw9Gg8sFUPYRuBIL2xqdzkXt/DvA6+Xx2m4dkyH4Vk8WPc9SfUqJozV8
         caH/78uMx4opYYDVHMYTS2oo0vpEPnWyxgrhAGXLubLAtkGOobjP8TBE3zWTLlEgCFvz
         CVFZkplRS/hLfUNAo252Ew2JyHJnGOgwuO9CM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p+jjjwyZFQj+60xylafzjnGJew8AdVsst4f2GPygV58=;
        b=bxSP7SYKtvVG/fToTwVSH47Ltnn61aqzO+EMUYHNPdjSTX4v1xzelEDqh+/ZE3uUxq
         YfNqDGqDqCUHV+rlic1J09ntuSCl9iO03GDEwOdcPXbvV9dyEiSxAZ+AvECw+1+pvj7z
         167DFF7hntcZxuw0jI2Hh+GOT4oaap0Vf0ptNv8A7Hvb70NSv1qVanZpSKrJDaHeOEoM
         HK2jT1u0iPzcgqygdb8vC1mckVNrOTNxorFJ8MEAZh3K1bPNbhkhzmWs4OChhZpewpoG
         83E79su8gkdIE5cO5+Y5ZZ4Vf+aZPRSSg27Vub0se6Lu4tOJyT66cNJk7cLeAVrl/JPG
         R5eg==
X-Gm-Message-State: ACrzQf2DSHgBuVa+wLLwpfFFh8+928AcFmBSl3GDcADr+k7Lxqisuqpa
	Aflvfv6o1EckrKBaYa7RC7D1Rg==
X-Google-Smtp-Source: AMsMyM4jIG936kRStgosu7ZMTFdhOJ5JIkmNKNgiLHXgPPX4UDlHNn8JhuE8hZIRdnEQS5entadApA==
X-Received: by 2002:a5d:5a8c:0:b0:22c:bc97:6fe2 with SMTP id bp12-20020a5d5a8c000000b0022cbc976fe2mr24327641wrb.640.1666695373280;
        Tue, 25 Oct 2022 03:56:13 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:46a:60c6:26a1:e0b0? ([2001:8b0:aba:5f3c:46a:60c6:26a1:e0b0])
        by smtp.gmail.com with ESMTPSA id da3-20020a056000408300b002365730eae8sm2230939wrb.55.2022.10.25.03.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 03:56:12 -0700 (PDT)
Message-ID: <f2681c2921cabc8fb5daca99d599096a566249a6.camel@linuxfoundation.org>
Subject: Re: [OE-core] rust: conflicts between Yocto and CC-RS compiler
 parameters
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Anton Antonov <anton.antonov@arm.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 25 Oct 2022 11:56:10 +0100
In-Reply-To: <Byab.1666631419068358312.NzkU@lists.openembedded.org>
References: <Byab.1666631419068358312.NzkU@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Oct 2022 10:56:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172128

On Mon, 2022-10-24 at 10:10 -0700, Anton Antonov wrote:
> Hi all,
> =C2=A0
> =C2=A0After this change (using RUST_HOST_SYS instead of
> HOST_SYS):=C2=A0https://github.com/yoctoproject/poky/commit/5c45b73c8fa44=
5
> b5192bb9fac1bc80b038b44c0d=C2=A0 builds of parsec-service recipe for
> qemuarm machine started to fail:
> cc1: error: switch '-mcpu=3Dcortex-a15' conflicts with switch '-
> march=3Darmv7-a+fp' [-Werror]
> Full log can be seen here:
> https://gitlab.com/akuster/meta-security/-/jobs/3204450989#L2086
>=20
> =C2=A0=C2=A0This is the cargo build command before the change:
> cargo build -v --target arm-poky-linux-gnueabi =20
> =C2=A0=C2=A0and this is after:
> cargo build -v --target armv7-poky-linux-gnueabihf
> =C2=A0=C2=A0
> =C2=A0 The problem is that some Rust crates build dependency C libraries
> using "cc-rs" crate.
> This crate adds some compiler parameters depending on target =E2=80=9Carc=
h=E2=80=9D
> and for =E2=80=9Carmv7" these parameters conflicts with compiler paramete=
r
> defined by Yocto via TUNE_CCARGS:
> https://github.com/rust-lang/cc-rs/blob/53fb72c87e5769a299f1886ead831901b=
9c775d6/src/lib.rs#L1700We
>  noticed it with qemuarm, but there might be other conflicts as well.
> (If=C2=A0-Werror=C2=A0is used then builds would fail, otherwise it would =
be
> just a warning which is easy to miss)
>=20
> =C2=A0=C2=A0To fix the issue in our recipe we can define =E2=80=9CCRATE_C=
C_NO_DEFAULTS=E2=80=9D
> env variable which disables adding compiler flags in "cc-rs":=C2=A0
> https://github.com/rust-lang/cc-rs#external-configuration-via-environment=
-variables
> =C2=A0 So, my questions is: shouldn=E2=80=99t =E2=80=9CCRATE_CC_NO_DEFAUL=
TS=E2=80=9D be defined in
> the Rust bbclass instead of expecting that owners of all Rust apps
> recipes would be aware about this issue for some machines and would
> add workarounds in their recipes?
> =C2=A0=C2=A0 I've tried to add "CRATE_CC_NO_DEFAULTS" into rust-target-
> config.bbclass, but it breaks building rust-native. Looks like we
> don=E2=80=99t define all the required parameters for native builds and re=
ly
> (maybe not even intentionally) on parameters defined by cc-rs crate.
> Therefore to do it properly there should be some logic around
> defining of "CRATE_CC_NO_DEFAULTS" in rust-target-config.bbclass. I
> would be happy to hear ideas or recommendations.

I'm a bit worried that we're seeing conflicting flags, it makes me
wonder whether we have the right ones in our tune, or, are we mapping
between RUST_HOST_SYS and HOST_SYS correctly.

I'm guessing this is from "-mfpu=3Dvfpv3-d16" and that we choose a
different fpu option?

If the difference really is something that rust simply made a different
choice on, we should set CRATE_CC_NO_DEFAULTS. rust-native is a bit
messy and whilst I would prefer we found out why the flags don't work,
I think setting the value for target and probably nativesdk might at
least be an improvement:

CRATE_CC_NO_DEFAULTS:class-target =3D "X"
CRATE_CC_NO_DEFAULTS:class-nativesdk =3D "X"

or we could just clear it for native:

CRATE_CC_NO_DEFAULTS:class-native =3D ""

Cheers,

Richard



