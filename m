Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3869.1794347541864795506
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 13:52:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=LoNzV9fp;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-714d57774d8so1619388eaf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 13:52:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794347541; cv=none;
        d=google.com; s=arc-20260327;
        b=NI/CUqhgoSo3iEsuR70jEIt6ZnotESByMC6xS1cfglvLKhWyhVCfPA0RJYY8dkKUbw
         hxFAA0uexEnV1F9bY0hF/lsP06SIMBTVtho97dIs1/Op9MKX80nRDcevuEvoj0sJ9KGI
         +LCc4qPvO/7Eq/6ioTy8c72o6RNiN2SdSObcDmtdV/HW70Mf1tU3KZP92WkPUv/E1nw4
         vSGXoPnkfV1snB9B4lx1HMY+no2c3Eegg37QeW/COkz3J5h1aWpyq8Wh3XnvfJMOmc68
         SvkTLmIK5KkitYK3FSM7Srq0rGosPb4aa2i7AFQ4M2aK6MHLHhCr3iOn3gPzg9+ESExu
         LWQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qBxlsxtfPhLYlgf1i7JJePrz2PCTypbfPChjyPItXBE=;
        fh=TGF7TVa5Eshw5M6K2XLmjdIMKFhrsPaliuC+tv7wzuY=;
        b=ZzQyLDA19Iy/cELbzjsq92WFCqCqs1wCZm05Cp4cPep7tnpHPVDsIz1KeJWwUzs8Js
         RFNwn3MlvzZBO/a6aZSTxXWp9w4ZW3jnV3Q8L+i9WFo/mrTi/sZBuYNUFtk28ER4sNRJ
         ruOc7kun2cPjjY5E7aKP0V9izRmyLyA0MXoBVIlNmSC+bQbGRZjicZ/fZaKMPhWBW4z5
         9HUqk0Xh6h02ZgCTZ50dPKNzoQ/xo2raMMlP5sUuKb5WS9vx1d7y+JAV1QRx92RP9+By
         2yOspu56DBe936mZ7KOLfTiEWwmwHrMIfdqS3UmUohoZ6HYul55mBoAf0fo+Oiz+sGmc
         S9AQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794347541; x=1794952341; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qBxlsxtfPhLYlgf1i7JJePrz2PCTypbfPChjyPItXBE=;
        b=LoNzV9fpxZ+ffD31yJawHwDxVLx1aPEuxnxwRxAaZqHOrUpjT6fLPG/ex8SzgNG8yp
         0peTij3uKQHSaAHJoIzTHCs4ZSisCBrZ8gIZ3fKzcAub78RQKIzTpfzU7Kk8XezyoL5C
         lH7INGS6Mtv5QcMJE2b+8pJVVfcOyKogvtq+ED/Aq6fu0cCQNQ9t4UM5QkL8kc9B9ApW
         7U3Sn2ZOSasmvz//2cJ0bwymdDrhduIoT4wWSZzM3/LCnKupoIDwwsnCmQ5U4OJ2pMWQ
         0hXV/FDNpYfFtm1KU6p88FM7ga+7O1INDNhLnpI4FLOox4PYOSg4y6m7zRhaD9GOaE3o
         gX9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347541; x=1794952341;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qBxlsxtfPhLYlgf1i7JJePrz2PCTypbfPChjyPItXBE=;
        b=TLd3rYApz/b/ItpFXDRdO9emJnstKhRFbPAek1Rj5Wojhi8sGr0DqMAdow5piKp2GK
         Y1N8vT+YEyQ+C7IUcCpxWnlVJQDKC7IUHB7LWvkyLy8ZqMMWIDl+gkHSBZvmClOBcsVr
         8FWzjxTGDdEd2I/EYLzjoQzzy5RnqC/QUx9OgmJJzIuroAIMXOmQxopESaUaVAqeCulJ
         7oN4oYNkZkmDGjU3yabX0WiHYjI/+toDsJ8lcOSahmoL8PRMBunqRmgRe9KblZDGGxON
         dXLC1stvVx9RvrS+DOwxVhxdSRDAQpQ8I/2wD/8sMJr4ucupCwffcjgruOqWl2Iu17U8
         kxrw==
X-Gm-Message-State: APuU4Z+7UShdax0D9KyapmJ2kHklcc4hQY8pKqOM765hihrzg7Guvdd+
	r7riEMctRValx5jb8lx458NvoXW59RgwpYZ66NWBSb+r3XT+eefpl5p0rfi47jkUHxYt3sLl7UD
	LeWM3vvKJvRYkbrP83+Ehi8dMUtVWvvPVX+TT
X-Gm-Gg: AYBFou2TxrTgn4wEdfDOrNYdqrnMj7gib1TxaXC7I37ekNpkMDtQz99EZAUSAEyhsSy
	uCgb/00UVSmqRcCPvb7hxvcU/tMaQOMOK7ewYqCKe2uWZwKj+LctPV92YpxXDEN/8fk4bVG2ftJ
	rL44tMtegDsORvBnWQ8UUIzhAgqLpG4rhFEBDlPfLrMNqulG/RyG4DaBEhTtTRhMtHAfn0s/RPZ
	DS8Nm4ArxNSomssnbNjxTkerivNj3S6d+eeiWVP5fIgyHBxIwk0MISGOUFRfyiiKGucyi/nbz6T
	5DzzvLRuAIuY+KeJYxwSRyFBOuzUanMjtFwT33SFdj+gttKURaLLpdGrwlnKXYtRX81f6nqMrmT
	NmQUzrHeAt1I5vqCUgzZuTm7kJDDZkjjWRFxwJDY5Z/uUKyoQj7GRaGAEjFE=
X-Received: by 2002:a05:6820:1351:b0:719:150a:4366 with SMTP id
 006d021491bc7-7191781852amr303339eaf.32.1794347540951; Tue, 10 Nov 2026
 13:52:20 -0800 (PST)
MIME-Version: 1.0
References: <20261110035229.2940188-1-ankur.tyagi85@gmail.com> <DMROQGZJRL7N.3QN1UPWBZNROY@bootlin.com>
In-Reply-To: <DMROQGZJRL7N.3QN1UPWBZNROY@bootlin.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 11 Nov 2026 10:52:08 +1300
X-Gm-Features: AclHuK-xd8U2hRXaOXrhL4wXuNg_P5DW5oKiKsU-lJoMIQuZrUxQTNPKWgaINco
Message-ID: <CADySD0H_ZxzEsdo0LuhBED3QK1W6zRX_dNcAFfVPc5PzKWSHww@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/7] bluez5: upgrade 5.87 -> 5.88
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 21:52:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249935

On Wed, Nov 11, 2026 at 5:52=E2=80=AFAM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Tue Nov 10, 2026 at 4:52 AM CET, Ankur Tyagi via openembedded-core wro=
te:
> > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >
> > - Upstream deprecated gatttool[1]
> > - Dropped patches that are merged in the upstream version
> > - Refreshed 0001-tests-add-a-target-for-building-tests-without-runnin.p=
atch
> >
> > Changelog:
> > https://github.com/bluez/bluez/releases/tag/5.88
> >
> > [1]https://github.com/bluez/bluez/commit/a7da60ed45e9b7aea429f1472588c9=
070ebecdf7
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
>
> Hi Ankur,
>
> Thanks for the upgrade.
>
> I can see some failing ptest:
>
> WARNING: core-image-ptest-bluez5-1.0-r0 do_testimage: There were failing =
ptests.
> Traceback (most recent call last):
>   File "/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/layers/openem=
bedded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_=
f
>     return func(*args, **kwargs)
>   File "/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/layers/openem=
bedded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_=
f
>     return func(*args, **kwargs)
>   File "/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/layers/openem=
bedded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_=
f
>     return func(*args, **kwargs)
>   File "/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/layers/openem=
bedded-core/meta/lib/oeqa/runtime/cases/ptest.py", line 27, in test_ptestru=
nner_expectfail
>     self.do_ptestrunner()
>     ~~~~~~~~~~~~~~~~~~~^^
>   File "/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/layers/openem=
bedded-core/meta/lib/oeqa/runtime/cases/ptest.py", line 121, in do_ptestrun=
ner
>     self.fail(failmsg)
>     ~~~~~~~~~^^^^^^^^^
> AssertionError:
> Failed ptests:
> {'bluez5': ['test-sdp-xml']}
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/1540
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1560
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2769
>
> Can you have a look at the issue?

Thanks Mathieu, have sent v2 with the fix.

>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
