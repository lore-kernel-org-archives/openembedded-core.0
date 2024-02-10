Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60859C48260
	for <webhook@archiver.kernel.org>; Sat, 10 Feb 2024 12:03:31 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.12465.1707566603956438897
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Feb 2024 04:03:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CoIhviBq;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51168addef1so3245693e87.1
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 04:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707566602; x=1708171402; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LI7vPc6+CRomFB15kjmoqab0jsrFhtQt+qKWHj3hCY4=;
        b=CoIhviBqKsmEX50EtlCGvGB1+QujbauY2C5Bz3nmNxTDVltIuuTdN0XtB5mgLjOSHy
         U2LndzBiehrIbnl+Ws0Vjnk2TCvwC66NZETJavyQpbSx/RZQG8ls61z59bpff5bIjhbB
         JUrST3kVcMWTbjO1zqgrEJ6Cgm0cOoXmT3+VVdYcD8mOwUjY+sKcx6O4WZtR3gAxFSUM
         ELhlj1Sb2MdK5li2uful1AuuCluCy/FBF8725FSUdkCRX7GpT0s1BymkQhS7+TI4mzs6
         BpQJiC9yC/AnizcwJXLCOYG8FruCyw17Yk1SFuy+pBdRdaCxcz6Y3iJA3GC9AtZTPNsr
         UwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707566602; x=1708171402;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LI7vPc6+CRomFB15kjmoqab0jsrFhtQt+qKWHj3hCY4=;
        b=NbrLSsTYTM81IMnAieZ/pYSQJZ86+Y08vTg6pvpYW9BR1n0kbgRpnYXo4C9+tz518n
         M17YWIylPMBDxrOzmPpdkuQ+WizG/+Kr7WbOnSwM1/v5EgDOBVMJwfxbgzdLBhGUNG50
         iATaqPeahwIh8JfqvY2agGIPwFRNabf7yvzK3vmXCrCu6+mFTCUedsLmggT1XUtqivHo
         N3llKmrOAD9Sla2lP6ORNoYT1vcLSXhBzAcBiAUdI62NdVFVn/sbUYZUeHzRetlI0ArN
         9mqgv8ng1tUCt5629mhI718m2bWmUJomOWVKJ1FRBORO/hdzQE91Hg0R0VYamo5ZUjh3
         IZdg==
X-Gm-Message-State: AOJu0YzwFJkUs4gUhCV9QVuG3C9mxW3HrktvT07Gblgn1UinfWNqSFWr
	swjjKTjswyPLjbfd8Vnlelk1ON5cvJy4oN/rrc0C+182HgRQUpZIYOy9pAEP2iKOhDKgF1BYQ2t
	JAA2ASDjxc4LAb17LlTgPaPfGG3hP4yNtdHk=
X-Google-Smtp-Source: AGHT+IEhMGOvzlu5x9GjDZo6/l0atjjCyhmYqOi0lQKuuRPeYkx9MjTXRPXzaWMi8bDPdwlWDJcgEt79fw5bW4BbOBs=
X-Received: by 2002:a05:6512:ea7:b0:511:8617:276e with SMTP id
 bi39-20020a0565120ea700b005118617276emr336452lfb.40.1707566601567; Sat, 10
 Feb 2024 04:03:21 -0800 (PST)
MIME-Version: 1.0
References: <CAO5Uq5TfNcuKkYX2krym5uN5t+ThbQ29Y8gfhq9kmLwYyHXfjQ@mail.gmail.com>
 <26286.1704984874999023341@lists.openembedded.org> <17AA2B18BB6DAD55.13033@lists.openembedded.org>
In-Reply-To: <17AA2B18BB6DAD55.13033@lists.openembedded.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sat, 10 Feb 2024 12:03:07 +0000
Message-ID: <CAO5Uq5QnLcc54Hu4_hEtcxgAO9ap-82caQMpWoFBCj_rbJbdVg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] rust: Upgrade 1.74.1 -> 1.75.0
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 12:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195263

On Sun, Jan 14, 2024 at 9:00=E2=80=AFAM Alex Kiernan via
lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.org>
wrote:
>
>
>
> On Thu, Jan 11, 2024 at 2:54=E2=80=AFPM Sundeep KOKKONDA via lists.openem=
bedded.org <sundeep.kokkonda=3Dwindriver.com@lists.openembedded.org> wrote:
> >
> > On Tue, Jan 2, 2024 at 02:54 PM, Alex Kiernan wrote:
> >
> > Closing this off - for whatever reason the buildpaths check wasn't
> > getting run when I was testing stuff, so what I thought was a fix,
> > wasn't.
> >
> > Hello Alex,
> >
> > Are you working on fixing this issue?
> >
>
> I'm not at the moment and I don't think I've anything useful as a directi=
on at this point.
>

FWIW I pulled in 1.76.0, we're still seeing the same reproducibility issues=
:

WARNING: rust-1.76.0-r0 do_package_qa: QA Issue: File
/usr/lib/libderive_more-1faee1ce80838df0.so in package rust contains
reference to TMPDIR
File /usr/lib/libdisplaydoc-c60c5da2941c7f1c.so in package rust
contains reference to TMPDIR
File /usr/lib/libicu_provider_macros-503ba5e62e8977cc.so in package
rust contains reference to TMPDIR
File /usr/lib/libzerovec_derive-02237fc3421c90c4.so in package rust
contains reference to TMPDIR
File /usr/lib/libderivative-58d493bafc99c13f.so in package rust
contains reference to TMPDIR
File /usr/lib/libserde_derive-a1b27683d4bd4bd3.so in package rust
contains reference to TMPDIR
File /usr/lib/libproc_macro_hack-f0b1af1c81588855.so in package rust
contains reference to TMPDIR
File /usr/lib/libyoke_derive-c488be35990c06f4.so in package rust
contains reference to TMPDIR
File /usr/lib/libunic_langid_macros_impl-01f309d5ed553f7b.so in
package rust contains reference to TMPDIR
File /usr/lib/librustc_fluent_macro-3554f4fe539dac9e.so in package
rust contains reference to TMPDIR
File /usr/lib/libthiserror_impl-d74aaa58e138729b.so in package rust
contains reference to TMPDIR
File /usr/lib/librustc_index_macros-4bc894c1875c7c9b.so in package
rust contains reference to TMPDIR
File /usr/lib/libtracing_attributes-7e254d62927f0d68.so in package
rust contains reference to TMPDIR
File /usr/lib/libthiserror_core_impl-f6328e975dbf41e3.so in package
rust contains reference to TMPDIR
File /usr/lib/libderive_setters-095386c54d928d42.so in package rust
contains reference to TMPDIR
File /usr/lib/libzerofrom_derive-23d9112afea1dfeb.so in package rust
contains reference to TMPDIR
File /usr/lib/librustc_macros-66ca7e6161e7a266.so in package rust
contains reference to TMPDIR
File /usr/lib/libdarling_macro-11d884e730198868.so in package rust
contains reference to TMPDIR [buildpaths]
WARNING: rust-1.76.0-r0 do_package_qa: QA Issue: File
/usr/lib/.debug/libderive_more-1faee1ce80838df0.so in package rust-dbg
contains reference to TMPDIR
File /usr/lib/.debug/libdisplaydoc-c60c5da2941c7f1c.so in package
rust-dbg contains reference to TMPDIR
File /usr/lib/.debug/libicu_provider_macros-503ba5e62e8977cc.so in
package rust-dbg contains reference to TMPDIR
File /usr/lib/.debug/libzerovec_derive-02237fc3421c90c4.so in package
rust-dbg contains reference to TMPDIR
File /usr/lib/.debug/libderivative-58d493bafc99c13f.so in package
rust-dbg contains reference to TMPDIR
File /usr/lib/.debug/libserde_derive-a1b27683d4bd4bd3.so in package
rust-dbg contains reference to TMPDIR
File /usr/lib/.debug/libproc_macro_hack-f0b1af1c81588855.so in package
rust-dbg contains reference to TMPDIR
File /usr/lib/.debug/libyoke_derive-c488be35990c06f4.so in package
rust-dbg contains reference to TMPDIR
File /usr/lib/.debug/libunic_langid_macros_impl-01f309d5ed553f7b.so in
package rust-dbg contains reference to TMPDIR
File /usr/lib/.debug/librustc_fluent_macro-3554f4fe539dac9e.so in
package rust-dbg contains reference to TMPDIR
File /usr/lib/.debug/libthiserror_impl-d74aaa58e138729b.so in package
rust-dbg contains reference to TMPDIR
File /usr/lib/.debug/librustc_index_macros-4bc894c1875c7c9b.so in
package rust-dbg contains reference to TMPDIR
File /usr/lib/.debug/libtracing_attributes-7e254d62927f0d68.so in
package rust-dbg contains reference to TMPDIR
File /usr/lib/.debug/libthiserror_core_impl-f6328e975dbf41e3.so in
package rust-dbg contains reference to TMPDIR
File /usr/lib/.debug/libderive_setters-095386c54d928d42.so in package
rust-dbg contains reference to TMPDIR
File /usr/lib/.debug/libzerofrom_derive-23d9112afea1dfeb.so in package
rust-dbg contains reference to TMPDIR
File /usr/lib/.debug/librustc_macros-66ca7e6161e7a266.so in package
rust-dbg contains reference to TMPDIR
File /usr/lib/.debug/libdarling_macro-11d884e730198868.so in package
rust-dbg contains reference to TMPDIR [buildpaths]

Tree is here https://github.com/akiernan/poky though I'm not able to
look at it more at the the moment.

--
Alex Kiernan

