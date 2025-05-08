Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A8CCC3ABC0
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 07:01:41 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web10.9670.1746687688840218036
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 00:01:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hAMaZo/c;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-72ec58e45baso463560a34.2
        for <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 00:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746687688; x=1747292488; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6PbHVokCPlaTH2ZtMgP5MdLvs+w360veaoU0YdkxAZ8=;
        b=hAMaZo/c8rPi+1G7nMktrskuaFMPvcM4tWKa7N6VplwDhU5J1Sse1Qc2GnQk4JGvDc
         t/aH+AyqKr5x77WocrJk+KUEtB9qCMZfpaBd4IeKTdKDHQ58MykmSszhr+yhMNIf/KIn
         N/7g9q3PNIfdCYyBtrIlFXiY6R79K/xkVPJzMrS82mdLkP+w34o1cIKQpvMTfCXBdqoc
         LUpB7FycVQLDTGrgAP5jjpKK4U4qUzEUxXtPgfZCCL/0m90VA2hvh2nGAJmftAlzbowX
         q+0Z3ljFpNfglI0OAE7bThNsnfqvxnVnuc7+7olLjc6APYfgFWAtT4ZtbGS/IDuqvuLK
         dvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746687688; x=1747292488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6PbHVokCPlaTH2ZtMgP5MdLvs+w360veaoU0YdkxAZ8=;
        b=b38EvDZi0Xoc2Wwz8ZtDiLPGn4wGTiz/dt+Wsk8njXKVFnphMg9AmhqCm7DNbgn6A5
         NeBQh/CPgAezFZucrGnDHtDuHCWDS6H3KyAhTOqb/LOdxCdDB9mJzZDElKULZYKXlUvo
         FZZW0xb47Q3no4VPRrSjcsUUd3YOepJIrB6Ej6hqw3XnGGnP6JvLx+Tk4OSFzxZky3ft
         8y2DIXR6QP6Ge15QqjbC//kzT98Jx5FCQ0Dz4RE2T8MeFaN/nJx6t47sFnXhhzaqt8Un
         U83fuP0w8DL2Vjq9VKQ2Xd2w8iGNtlfAExQfTf1R6FtVyF25dQPfmysOJR1yPxK06VcM
         ZHmg==
X-Forwarded-Encrypted: i=1; AJvYcCV9v/vErRC/kSvte/OP53/AlQ+NZ664g0pRs872uxJJ/RiP2rp51wxNnvrRh/Uy37cLG2LLMKmxknJoldb+XWBhgQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzng804aLrspTrJfahFy7gW+M6Y/kq3Az3QgEOHsXR5vlGd1FGu
	Ox1mzzgRT7UuB/qainudbZy+B1uolfWH0n8k/xhKDvKtO64PEyX73/eQJ0j/U7Ll7yZVGWz9EHT
	pTDLi3pHF94PzaMQ8ZA8KpOIJ2kLM+4RT
X-Gm-Gg: ASbGncu3Z79KBK1NUl/DkTQ7Znxa6raS2GPPwsfZOtKc6IVWr6a1CAbXVMf/uVCvd/E
	iLeOR/asm3IDyeHObOtva/rh9VNFAqHV20E1UhXBKhLaFWY2ed6Qkna6IIgYBvgWfGpuyZYU2gi
	hwEUHYg1MXsdFvTPb680iQpw==
X-Google-Smtp-Source: AGHT+IEhCznKOf2T0GqV3pamh92pWftpjBxjjgkhDHPbzhv0NA78nLjdeYNOQE9NFz79tGLNBTLRGgsEIWtS0Gek8GA=
X-Received: by 2002:a05:6808:14d5:b0:3fe:ab15:5ecb with SMTP id
 5614622812f47-4036f079e85mr3924104b6e.9.1746687677047; Thu, 08 May 2025
 00:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sqkw3xZpLqKw9aaOvike+6RPBsRsfoq+dXzeQf6Zpn1pg@mail.gmail.com>
 <CAHebdzTV7rRKkAJGzL79sngS3BDCEx2nNu8+jO1t5STM31bGeA@mail.gmail.com>
 <CAMKF1spEREKO0RL7d=RE9i-g0GDqWqPGcbR_Cr8pr=ET03AcFg@mail.gmail.com>
 <183D310FC8853D5E.1749@lists.openembedded.org> <aBtspIFmf7KoIZ_7@nuoska>
 <20250507182924.GA700@localhost> <B699294E-FA19-495C-9DFF-68AB3502240E@arm.com>
 <CAMKF1sq6ttpUeRCsSY9WbY8hixTkhaCOB61u6AB-=xVqhTVn+g@mail.gmail.com>
 <20250507190449.GA7882@localhost> <20250507191029.GA24048@localhost> <aBxNvW-JhKHitdWN@nuoska>
In-Reply-To: <aBxNvW-JhKHitdWN@nuoska>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 May 2025 00:00:51 -0700
X-Gm-Features: ATxdqUF5oHz_EBA9ncXr3T24GsVXL0RgxDPCrzCPRB3azJa6vuDH9y_2POET2ZE
Message-ID: <CAMKF1soNMk6B2cO5bUMV5a_NMegjr7KZozaZdeyCLE71fjCRFg@mail.gmail.com>
Subject: Re: [OE-core] systemd build failure with gcc 15 / tpm2 / aarch64: gcs required
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Trevor Woerner <twoerner@gmail.com>, Ross Burton <Ross.Burton@arm.com>, 
	Sathishkumar Duraisamy <sathishkumar.d.cbe@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 07:01:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216141

On Wed, May 7, 2025 at 11:22=E2=80=AFPM Mikko Rapeli <mikko.rapeli@linaro.o=
rg> wrote:
>
> Hi,
>
> On Wed, May 07, 2025 at 03:10:29PM -0400, Trevor Woerner wrote:
> > On Wed 2025-05-07 @ 03:04:49 PM, Trevor Woerner wrote:
> > > On Wed 2025-05-07 @ 11:38:12 AM, Khem Raj wrote:
> > > > On Wed, May 7, 2025 at 11:34=E2=80=AFAM Ross Burton <Ross.Burton@ar=
m.com> wrote:
> > > > >
> > > > > On 7 May 2025, at 19:29, Trevor Woerner via lists.openembedded.or=
g <twoerner=3Dgmail.com@lists.openembedded.org> wrote:
> > > > > >
> > > > > > I stumbled across this build issue via a completely different r=
oute than most
> > > > > > others, it seems, and certainly different than what you have de=
scribed. I'm
> > > > > > not using meta-security and I'm not using tpm2. Therefore your =
patch will do
> > > > > > little to solve my build, and others will likely stumble across=
 this issue by
> > > > > > other routes as well.
> > > > >
> > > > > For what it=E2=80=99s worth, we=E2=80=99re seeing this without me=
ta-security too.  This needs to be worked around in core (personally, I=E2=
=80=99d remove =E2=80=94fatal-warnings from systemd until openssl includes =
the GCS hints).
> > > > >
> > > >
> > > > thats a bigger hammer, I would suggest to apply
> > > > LDFLAGS:append:aarch64 =3D " -Wl,-z,gcs-report-dynamic=3Dnone"
> > > > in systemd recipe in core
> > >
> > > If we want to make the hammer smaller, it's only triggered when:
> > >
> > >     PACKAGECONFIG:append:pn-systemd =3D " openssl"
> > >
> >
> > diff --git a/meta/recipes-core/systemd/systemd_257.5.bb b/meta/recipes-=
core/systemd/systemd_257.5.bb
> > index acf97517a94a..995b55580e4a 100644
> > --- a/meta/recipes-core/systemd/systemd_257.5.bb
> > +++ b/meta/recipes-core/systemd/systemd_257.5.bb
> > @@ -240,6 +240,7 @@ RESOLV_CONF ??=3D ""
> >  # bpf-framework: pass the recipe-sysroot to the compiler used to build
> >  # the eBPFs, so that it can find needed system includes in there.
> >  CFLAGS:append =3D " --sysroot=3D${STAGING_DIR_TARGET}"
> > +LDFLAGS:append:aarch64 =3D " ${@bb.utils.contains('PACKAGECONFIG', 'op=
enssl', '-Wl,-z,gcs-report-dynamic=3Dnone', '', d)}"
> >
> >  EXTRA_OEMESON +=3D "-Dnobody-user=3Dnobody \
> >                    -Dnobody-group=3Dnogroup \
>
> I would prefer this but in the past I had trouble getting non-default
> config fixes to oe-core and thus I proposed the patch to meta-security/me=
ta-tpm
> only. I do understand that "openssl" in systemd PACKAGECONFIG can be enab=
led
> in a number of builds and setups, but it's not the default. Maybe
> it should be the default, together with "repart"? Another thread, hopeful=
ly
> shorter than "efi".
>

if there are more than one usecases that makes a stronger case to
apply it in recipe proper.
we also allowed inert code in core e.g. disabled package configs
checks in tasks to tweak something
if changes are made for a particular case that inserts itself in main
flow, it needs tests and those changes are
also have better changes to be accepted.

> There are a lot of corner cases and non-default configs which need fixes
> to oe-core. I would like to understand what the policy for fixes is.
>
> I think it would make sense to enable more features by default, but allow=
 them
> to be disabled. TPM support being one of them.

Enabling more can change behavior, so using a sane default is all we
strive for. there are
many combinations and we can not test all of them, so we have to stick
to a known set and above thoughts go into
deciding that.

>
> Cheers,
>
> -Mikko

