Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.12803.1599066344273084686
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 10:05:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UL50H80Q;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id n10so4140599qtv.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 10:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zfp7dYhG24XxCTiddFxsFSCRQvrl99e2a4KtV8tdpWw=;
        b=UL50H80Qbcm6tWcoC/6i4zIiehsJDXuVVtwgyyWjT29Jg5RL8Eogk3ajq9+N1hMjFs
         3zp+zWBNhm1jwOKZuJ8shSPuSdpg6L8Xr2y4wePLsc+YBLAFa/ZBbeEYDabp3b06iKNh
         MM8QavcB21wD7nslNOfvw1PsunG3QCv05ifQCWTb0KPuGUchxBZU2E2+kJO2rGj37oOs
         5glJBC2lUOltD+bI2HbA1CsBRNClUbCjVnaG4nczYTCzLlRZSflVeS5BYEB3uDEtHB35
         xr+tPzOZZygnR8yXr04sNPynfyOOpPMtBINGSmgfdL/kXkZw2iutHE8P3f0gL4bHoIOr
         GjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zfp7dYhG24XxCTiddFxsFSCRQvrl99e2a4KtV8tdpWw=;
        b=lvbBR6wvYa8ql3BFd37aY7V2iTpUTzvuyKq4YW+DI88Nc01Td+GYRSFgHFp4m7ygve
         GpFIMKaLuZbRfhSo45MDFyY7C4nQtVGsCABMqhDim9JcH7ku+lX0n+T3yZ3IHJys5Yvq
         SMJ5XEfuflVmMV6AstyDiCkxkQe0+YEbPEI/NCJrK3qa41JjzPYlAeyP6SKZbqfOtQiP
         ddYSIFpAtotmSCWIrWNe+JiNxQBgvPigrI10eRDllPKws0dTe7ljna30gRcTZpvQt3ga
         NalCE8mX5Tt3m+TweHW+DTXLrezuPdVIAg91OiEWAFOculq+jnj13dScZH1eDQWNur8X
         tudg==
X-Gm-Message-State: AOAM5338AWzCEgbwD76Am+WfOBCg371pjUN+0Qtgttu85b/HlGbXL8KI
	6MWs+o6/O1lVKlqy40c/9c9AAolZC1ryPBFKOI0=
X-Google-Smtp-Source: ABdhPJw+hingl1GL7Cy3SKUKiUWliHx4eHTygQ7TGoGYRa7WudfSfpvEjoVLwPpJ7OJD1VVxcz9DkzQSZUG/5UYDEaY=
X-Received: by 2002:ac8:72d6:: with SMTP id o22mr7774696qtp.53.1599066343205;
 Wed, 02 Sep 2020 10:05:43 -0700 (PDT)
MIME-Version: 1.0
References: <AM0PR09MB25294C0942836994769068BB922F0@AM0PR09MB2529.eurprd09.prod.outlook.com>
In-Reply-To: <AM0PR09MB25294C0942836994769068BB922F0@AM0PR09MB2529.eurprd09.prod.outlook.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 2 Sep 2020 10:05:17 -0700
Message-ID: <CAMKF1sqXK0ABEZX4bXe9=VjbJD5WsapJ+HuKKQKW4LDUtUZA5w@mail.gmail.com>
Subject: Re: [OE-core] BUILDNAME issue
To: "Groeting, Claus" <claus.groeting@gigaset.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2020 at 1:31 AM Groeting, Claus
<claus.groeting@gigaset.com> wrote:
>
> Hi All!
>
> We are currently migrating towards dunfell and have an issue with our BU=
ILDNAME handling. We observe that the BUILDNAME is overwritten by rootfs_re=
producible function which is added to the ROOTFS_POSTPROCESS_COMMAND list i=
n the rootfs-postcommands.bbclass file with the timestamp.
> Why is the /etc/version file hardly coded here and why is the REPRODUCIB=
LE_TIMESTAMP_ROOTFS set from inside OE code and not configurable from outsi=
de?
> We still want to make usage of the BUILDNAME variable which results in t=
he /etc/version file of the rootfs. What did I miss?
>

if you are doing reproducible builds then BUILDNAME is not ideal for
reproducibility because BUILDNAME contains data and time. Maybe look
into REPRODUCIBLE_TIMESTAMP_ROOTFS settings.

> Thx,
> Claus
>
> Mit freundlichen Gr=C3=BC=C3=9Fen
> Claus Gr=C3=B6ting
> Senior Software Developer
>
>
> Gigaset Communications GmbH | Frankenstra=C3=9Fe 2 | 46395 Bocholt
> t: +49 (0)2871 91 1901
> claus.groeting@gigaset.com | www.gigaset.com
>
> Besuchen Sie uns auf Facebook | Twitter | YouTube | Instagram | Blog | X=
ing | LinkedIn
>
> Gesch=C3=A4ftsf=C3=BChrer: Klaus We=C3=9Fing | Aufsichtsrat: N.N. (Vorsi=
tzender).
> Sitz der Gesellschaft: Bocholt | Registergericht: Coesfeld, HRB 16595 | =
WEEE-Reg. Nr. DE 96349612.
>
>
>=20
