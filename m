Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web12.1421.1616688134422102911
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 09:02:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pTMvmJfp;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id 7so2253286qka.7
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 09:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9Bh/dRSUIC/utGqROe501mglHg2iZcXxhj7Pbhk+K7U=;
        b=pTMvmJfpichU64QE9AGPUnzcqr/I9IHI+dhgqZq/WuE9bLdxCxpcWo7lf+etnGurfE
         SuDdUHyNex+/088IBAzkif2lCpOIeq9edGUaZ67sREZwwjt/4gz1tMlfWXGnmQaAlMqu
         duvIFO7WoDHuDprw6u5USE22peHeIiSRTRyF92ITDr2grZMffU6bCXppEB1MYGrDxpDf
         h/BJesJ4hkumA3aOTmzU9rf1HR6mI+fjCP4LmZvmf67E1oj4dAJ+HcPguhfzGDFm+IS3
         yVRCzSfbGw/Nk2gqHeWVqt1J8zxj+UDt7Ta/qKgn7ChaMIGIlP5P7Uw+n80mZR4Fi4uu
         d/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9Bh/dRSUIC/utGqROe501mglHg2iZcXxhj7Pbhk+K7U=;
        b=mTJsb9d/3dt/JjqUzKxaNuAfppmYeZlfv9vnYimthhB/uPYKUeRfcV5WjSo1Gcly6e
         184TfM6CR8et/mtcy+hgZ8DRnBHcFU76mdihspa7j7YV7cst6S6yHlk0wh1/mhdr8lt4
         ErhcIjXwMGqbaKTfug1Lsh1bwU3ljkyfV66oHyJwvFFWroMi+G1+EibcW04Q/Wgo4IAs
         SRzMpZonH4oZX1RpirqvdHd1ZwRvGifqPftBRrTtLS70sE/Qb+Wt6VuzEwncOrg3B39E
         p0bFlVrgBcOqoIGhdqM0JYH8PgASIOP9BsCVCPJ9sV/yoQOStRSmAWCTC8Jd1dxNXzHl
         hMvw==
X-Gm-Message-State: AOAM530bRIhrdKkx5R9xU/WFJiT//tJO5op8PxF9MBmmGChXBNEbv1dp
	tdDZ/+ZkywRFl4XrMWLH71ef9245Er7CuGR0p5U=
X-Google-Smtp-Source: ABdhPJxh1prq6ZpJ/iOnM9rhJ7yqc6Q5mxGU2h2noLmveCyLiH+sh+gVoav15SH8aZurXaiS8h0czZ+wQrNJUksOacM=
X-Received: by 2002:a05:620a:a12:: with SMTP id i18mr8776893qka.119.1616688133522;
 Thu, 25 Mar 2021 09:02:13 -0700 (PDT)
MIME-Version: 1.0
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
 <20210311150959.782186-1-luca.boccassi@gmail.com> <PH0PR11MB49023E90CAB5E58C2B603899D7629@PH0PR11MB4902.namprd11.prod.outlook.com>
 <070d63d34bd6936df1e94c620103e2759dae0427.camel@linuxfoundation.org>
 <5f37ee174e3f45e094ee2bb71c3c0422@XBOX03.axis.com> <85dec47e7a6bf2533fe619fc391915d838e8924e.camel@linuxfoundation.org>
 <c34e80a010fb54e47762534049ff9c80791f0d41.camel@gmail.com>
In-Reply-To: <c34e80a010fb54e47762534049ff9c80791f0d41.camel@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 25 Mar 2021 09:01:46 -0700
Message-ID: <CAMKF1srEs0s6=Fp8tkCHkySAsBfL3JA+aq5uq9-9NT5OVjbAxw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v11] util-linux: split uuid in separate recipe to allow bootstrapping
To: Luca Boccassi <luca.boccassi@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC at Cisco)" <oobitots@cisco.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"bluelightning@bluelightning.org" <bluelightning@bluelightning.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 25, 2021 at 8:45 AM Luca Boccassi <luca.boccassi@gmail.com> wrote:
>
> On Thu, 2021-03-25 at 14:27 +0000, Richard Purdie wrote:
> > On Thu, 2021-03-25 at 14:22 +0000, Peter Kjellerstedt wrote:
> > > > -----Original Message-----
> > > > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > Sent: den 25 mars 2021 10:34
> > > > To: Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC at Cisco)
> > > > <oobitots@cisco.com>; Luca Bocassi <luca.boccassi@gmail.com>;
> > > > openembedded-core@lists.openembedded.org
> > > > Cc: bluelightning@bluelightning.org; Peter Kjellerstedt
> > > > <peter.kjellerstedt@axis.com>; Khem Raj <raj.khem@gmail.com>
> > > > Subject: Re: [OE-core] [PATCH v11] util-linux: split uuid in separate
> > > > recipe to allow bootstrapping
> > > >
> > > > On Thu, 2021-03-25 at 09:17 +0000, Oleksiy Obitotskyi -X (oobitots -
> > > > GLOBALLOGIC INC at Cisco) wrote:
> > > > > Could you look into this warning.
> > > > >
> > > > > WARNING: util-linux-2.36.2-r0 do_package_qa: QA Issue: util-linux-dev
> > > > rdepends on util-linux-libuuid-dev, but it isn't a build dependency?
> > > > [build-deps]
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/3226
> > > >
> > > > That failure was my fault when testing some fixes.
> > > >
> > > > I've sent out a patch which renames util-linux-uuid to util-linux-libuuid
> > > > and sorts out the license issue Peter reported.
> > >
> > > I don't mind the recipe being renamed and cleaned up, but I would prefer
> > > to see my entire patch for the license parts being either integrated before
> > > this or squashed into it, whichever you prefer. It does not make sense to
> > > use the same LIC_FILES_CHKSUM for util-linux-libuuid as for util-linux,
> > > and setting the other LICENSE variables in util-linux.inc no longer makes
> > > sense as they are only relevant for util-linux.
> >
> > I'm torn on that. Code with the other licenses is present, just not used
> > in the final output and I personally suspect that having one LIC_FILES_CHKSUM
> > is going to be easier to maintain in the future rather than two separate ones.
>
> FWIW, in Debian the license definitions always cover the _sources_, not
> the built binaries. IOW: even if you don't build and distribute a
> subtool, the license metadata must cover it. I'd think this would be
> even more important for Yocto since you exclusively distribute sources,
> not binaries.

ideally, it would be good to have both expressed distinctly since we also have
tooling for end users to create manifests for whats strictly on target
images. we perhaps
need source license which is perhaps at recipe level and then target
license which is at package level.

>
> --
> Kind regards,
> Luca Boccassi
>
