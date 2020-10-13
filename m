Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.378.1602547597699495538
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 17:06:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qLnq//Oj;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id 140so17597861qko.2
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2020 17:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rQ7Hf7XyEjB2FbKydqZtGJr106cdAa8m42HLJmNF00E=;
        b=qLnq//OjN7z+55V3kze/dRBwOqe0HAyUS1vGPcBZQ073NfY/3VUf0x+AggYMun0/Z7
         4zVs91BOoFVpwXmdsS1M+92/x5ZM0mUFjMCvtLyaA+ozu7kG5iwMl8ymFoBKyA/OD2Cu
         ZVamQkE1sfIKc4QThV6yS6y3gqruAb+DjAfdgIYhNONYP/rWj+B663mwSiIWtzLI5yAH
         2hgavCFEgyljSY2Q+/0JMS39TvdHLngb70F3+0ujXLinICF5zjbW1mFjSyxv1291VlTs
         ehlJup2MfA9IwVg7XTFPUGmdpqKpeNs381NL3OgNuEw1YW8SRLTvLwcFLsXB3D2IMFZ/
         /4gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rQ7Hf7XyEjB2FbKydqZtGJr106cdAa8m42HLJmNF00E=;
        b=FDR3HRUxDCtTGAWlqQZBthRLxnaYtrVdZuCD+nLptNVxd6Ha2G3KdYxpOnZq1lHgH1
         m7LAT8cACm5XRZkcgovwY85tCNcH+gluE0C/4yCQkCOwJ5Ap/ALpkrMZrMLFgvf4wGs+
         57etogEmS1t2HwYxVBIXde4HXxv7DjaHgjw1vYWArQT+odlzOZ2L8YJeqIfI5dPft9Ap
         2R8bcKKboYRVX+4BNHJE57TADUew0th/VOPS72vKFgZt5N5ElE976eWcvpKj3wBJ+MyO
         1hQTUL1AlOJ4eVl4qOYWYNAyyMnmTNr2aA77C1z6VwvIvKEEzY7+ItglibSo5yTjaGaM
         waDA==
X-Gm-Message-State: AOAM533vTRbVsKtvXEt82DpiyfaOu+2f5aWDqlVGEcR0DvZlyP0woBuR
	+E68PAtnS2hZ9Mkl1Rb5dpW6eQ7LiWizNXoZjv8=
X-Google-Smtp-Source: ABdhPJyFwYxpg2tGL8T2gpkIUMBjaWChK1N7to9BZdjMvQIkM3S0eVpZOPf+2D1OgAH0jIJwHVd+P1JAb7llvpvypwg=
X-Received: by 2002:a37:4015:: with SMTP id n21mr12574911qka.212.1602547596653;
 Mon, 12 Oct 2020 17:06:36 -0700 (PDT)
MIME-Version: 1.0
References: <20201012123620.2095778-1-quaresma.jose@gmail.com>
 <20201012123620.2095778-5-quaresma.jose@gmail.com> <CANNYZj-gsTcYJjpwxeT7TwAj8QQptQUBSd6N5QmaoNR82JQRUA@mail.gmail.com>
 <CANPvuRmb_GnG0R2+6zRHxWJG0Hu4cAYD_6kKEyZRp+05+9E8Mw@mail.gmail.com>
 <CANNYZj-w+S4Zk0Vjav6KABUNwX3a=jCjDznHDHBch6sLOXpJnA@mail.gmail.com>
 <CAHtQpK5hq5dZVwwwxUq3hvgQ3zUfAibx5Qboh6Ju7VvxWA+n2Q@mail.gmail.com>
 <CANNYZj9Mr1VLAY5=ubgdYO08KWWUTPfd50CMqT-jcvZ44rPtMw@mail.gmail.com>
 <CAHtQpK7T7rqfACB7MSnTh701yPbPy2B51Em924-FueriejFXOA@mail.gmail.com>
 <CANNYZj_AqswY3JJnVu=vtNQPdgfd=tbE89WgRD4Fxm1O=msFFQ@mail.gmail.com> <CAP9ODKpfw=aamn2frhxT9mnUbCyPwG8smZaMLu70n2yrK_1gXQ@mail.gmail.com>
In-Reply-To: <CAP9ODKpfw=aamn2frhxT9mnUbCyPwG8smZaMLu70n2yrK_1gXQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 12 Oct 2020 17:06:10 -0700
Message-ID: <CAMKF1som7BPasoOX3Y0dDoYuUN9XitX5evxJpA9vqtm_=Dcy2Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/13] gstreamer1.0-plugins-bad: disable vulkan
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Andrey Zhizhikin <andrey.z@gmail.com>, 
	Jose Quaresma <quaresma.jose@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2020 at 4:38 PM Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>
> Em seg., 12 de out. de 2020 =C3=A0s 16:45, Alexander Kanavin
> <alex.kanavin@gmail.com> escreveu:
> > On Mon, 12 Oct 2020 at 20:20, Andrey Zhizhikin <andrey.z@gmail.com> wr=
ote:
> >>
> >>
> >> What I meant to point out was - there is a dependency in Vulkan on
> >> glslang, irrespective whether it is compiled standalone or as a
> >> dependency of another package. I believe this Vulkan <- glslang
> >> dependency should be solved first before Vulkan can be included
> >> anywhere further.
> >>
> >> As I know, it is currently solved locally in meta-freescale-distro
> >> layer, hence it was my question on whether it should be moved to
> >> OE-Core to solve the Vulkan dependency altogether?
> >
> >
> > Can you please point to where glslang is used in the vulkan source tre=
e? Is it something recently added, as vulkan bits and examples have been bu=
ilding fine without it in oe-core?
>
> It seems as a good addition to OE-Core as more SoCs require it; this
> also allow us to drop this from meta-freescale layers :-)
>


seems good to me. Please propose it for 3.3

>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
>
>=20
>
