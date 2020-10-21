Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.13893.1603295669735450999
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2020 08:54:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Nb6WAU3W;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id c5so2504366qtw.3
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2020 08:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NfzsJ0i51cTP65W6pkjDGY9XyAwOMAQU9wZcPFDO7aU=;
        b=Nb6WAU3WIMR1gGxdSNH66b/mwqTTIhT7WIqNCKPw7rJt4EgIJdFUK4g6A05PV8Mx34
         ZW8NApYavnmGMkpzQXlhSgSPGcotaGhWdv3076r79xWNr1mflUXcuqKk/9AxZg3TDnHk
         YSG3IVlRF43o32ryDoaZsK9ZM302/fth10EhXLVYLNuzefEXvzBKDkpU+s/fCWfAyVdF
         JuSVpvPmFNhUpij1qpNc9VXkmg4yV3VfLkfxhjZd+QbH0qhVya1CDgBG//BLb5bUq2nz
         1z/tZSSK5aGExbR79MEuu7w7LgrLjzd1DkuvgBlK0Co652z1NcFctBENfNAcryVnhiLa
         87EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NfzsJ0i51cTP65W6pkjDGY9XyAwOMAQU9wZcPFDO7aU=;
        b=czOLNIo5Ue7REBg5cE9enU5gdcYxkJsB/HV7E0OGibVpPUCugZ/0d4uMOmvlzhn03w
         /J4tY9ZAqstzmMC87e5+TgeuJ+Hf6RCFU0d2OBKDN+ASzPUzVvldMt9V5enpymGAB4bL
         v77osrDmGY8OnZ2iLUTUx4MtMg64+a38A1Zwe34nAZMQIKh7Ay4xgcJxOGz7lrCMjj9g
         QV3S8UxlYgX7QrEwioXqUx4jPPadgzkM8OHvyHOiNTWjCuJvggZiS5AgEHcNEerg6wqJ
         A4pcYO2y9KtNf9rgrzGNwP64Tc4WyGKaSdcvDXTudITC8RoMZdENiU+E0w44e9r+AHw8
         Batg==
X-Gm-Message-State: AOAM530jZqWOLzyKRmhqLyo2oD7on3DyfhGbXyHq7tXsehM4AMupNstE
	kHTGa/+pjNwDlzEjI+T75jtfQGZrC9DZ/1qAU68=
X-Google-Smtp-Source: ABdhPJwY7bs8TNhMEt1VfnlS7rAuZPXxJ/yZd3zLnclwat/URZ2eOudrcF4RQZTQdbmVef29f+lv2uUeLeIZEfozNdA=
X-Received: by 2002:ac8:57d1:: with SMTP id w17mr3665347qta.194.1603295668837;
 Wed, 21 Oct 2020 08:54:28 -0700 (PDT)
MIME-Version: 1.0
References: <20201020200945.3089-1-petr.vorel@gmail.com> <CAMKF1soztA23jZxjfmvU5Yc5BWAhYV4qen412ZcTdwjjkVDxyg@mail.gmail.com>
 <20201021090015.GA4194@x230>
In-Reply-To: <20201021090015.GA4194@x230>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 21 Oct 2020 08:53:43 -0700
Message-ID: <CAMKF1sp9he=PVoU+R_33W_bB3BWft4vRX9kO6YoxiVVVCe=phA@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] ltp: Update to 20200930
To: Petr Vorel <petr.vorel@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Anuj Mittal <anuj.mittal@intel.com>, He Zhe <zhe.he@windriver.com>, 
	Anders Roxell <anders.roxell@linaro.org>, Yi Zhao <yi.zhao@windriver.com>, 
	=?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 21, 2020 at 2:00 AM Petr Vorel <petr.vorel@gmail.com> wrote:
>
> Hi Khem,
>
> > > Dropped patches (not applicable)
> > > * 0001-sigwaitinfo-Do-not-run-invalid-undefined-test-cases.patch
>
> > these tests still hang on musl and seems to be incorrect. So I would
> > suggest to keep this patch on until the tests are fixed.
> Could you please rebase it to current master?
> These tests have been completely rewritten and I have no time investigate it
> further. Ideally please send a new patch to upstream (LTP mailing list).
>

OK I think I should give it another shot on rpi4 and see if rewritten
ones are better.

> Kind regards,
> Petr
