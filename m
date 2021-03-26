Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.1511.1616782974112574198
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Mar 2021 11:22:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J6xnLvqu;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id o10so8991507lfb.9
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Mar 2021 11:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F9YerBtKfbrbHG1aoWpRtddLp+8vNuTnQhGpKCSCxUc=;
        b=J6xnLvqu7j5BKWjgI2ITMGXhjubKz3R+whu6pcLDC1OI13tVEz93VW16+xYmM1SrZl
         1pqdPV7CEPjG9IlGpZNhlS7OwziDj6x891B3/EeYUIt0+T8d6ZeQpmCROPQHyZUKzDVi
         syQjChMXIzJaMRJcC0wurALp6zUPIGIEjYIv9GX8x6A5rrQEHf6lVzWWfiGI/ZqB0xtu
         ZyAcUy7vU1JToTBQQLSiWJiCd+efLI0TItao3cy4BhE/dy1Tr9iQzGDNMuuvHOQGdWZZ
         I8VEcdPIsJ4NeMx9FOWZY2eIrvBfhBuytP2ppHZop9W8fMtjB5bbzq8OQ6u1hJ0wpI72
         2ODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F9YerBtKfbrbHG1aoWpRtddLp+8vNuTnQhGpKCSCxUc=;
        b=a0/OJuPRldJbSK5F6bcUBEsqtHgNOciXC3RSESgyzx+CENy0v0mVB71pcypT66oQ1V
         TQ+aYHjRU/gdXNx2O7Y+LGDuPv0D74FJVyxOh7qkDa13XSnsBFZoQ1gTcZgLs8b0R/vc
         ey+n1RUWtEzo/WwRr4M2No4El7hMYPg8R0lK0Ryqizdr8/qHakX8+zg+q6+bn0gDAym2
         cul1sL4BAo2nKTZ8xOaQlrq4iu0rAocun85cGLrmtG65F31zXELqXA5s0pEnfLOJG1Dk
         wFhrr7SV60wK4j7RZp0j5dzLTwiFb1WTe5XItQQ2ky2xnIhhpp2diF5HKDkJO7Qs/ajg
         hycQ==
X-Gm-Message-State: AOAM530A10IZ+oe5KDg91yKfmZqPr2fb2Y1HoM62cbiApKCEFZr0iv7x
	yTxO2NOO8Z+diFIGQqI3F6GZ+1qeAav2SVeYyfc=
X-Google-Smtp-Source: ABdhPJyH7YMOdpChAzXP5ir7Wlwd100JJI0v/hXzFVHkrL8DV+Go3k5CZH20BzsS4CUgRkWQxiySSwjnOVp9MN7KprY=
X-Received: by 2002:ac2:532c:: with SMTP id f12mr9601127lfh.73.1616782972233;
 Fri, 26 Mar 2021 11:22:52 -0700 (PDT)
MIME-Version: 1.0
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
 <20210311150959.782186-1-luca.boccassi@gmail.com> <PH0PR11MB49023E90CAB5E58C2B603899D7629@PH0PR11MB4902.namprd11.prod.outlook.com>
 <070d63d34bd6936df1e94c620103e2759dae0427.camel@linuxfoundation.org>
 <5f37ee174e3f45e094ee2bb71c3c0422@XBOX03.axis.com> <85dec47e7a6bf2533fe619fc391915d838e8924e.camel@linuxfoundation.org>
 <bffd569338fe4f9f9e5671443d6cdbc6@XBOX03.axis.com> <4b0c1bc6bb1ae476cdba3ce5848b0bf7008de1d7.camel@linuxfoundation.org>
 <6fd89e2f790a4a39832907f1832b1d92@XBOX03.axis.com> <b247e3521ddc2f0fc4cb20471c9b72956bc93c32.camel@linuxfoundation.org>
In-Reply-To: <b247e3521ddc2f0fc4cb20471c9b72956bc93c32.camel@linuxfoundation.org>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Fri, 26 Mar 2021 11:22:39 -0700
Message-ID: <CAJ86T=V_y-yZTnGXwawigbVBcESf5mTpiFAxzF6ofUNNUagNgQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v11] util-linux: split uuid in separate recipe to allow bootstrapping
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC at Cisco)" <oobitots@cisco.com>, Luca Bocassi <luca.boccassi@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"bluelightning@bluelightning.org" <bluelightning@bluelightning.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 26, 2021 at 11:12 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2021-03-26 at 18:06 +0000, Peter Kjellerstedt wrote:
> > > -----Original Message-----
> > > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > Sent: den 25 mars 2021 17:52
> > > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Oleksiy Obitotskyi -
> > > X (oobitots - GLOBALLOGIC INC at Cisco) <oobitots@cisco.com>; Luca Bocassi
> > > <luca.boccassi@gmail.com>; openembedded-core@lists.openembedded.org
> > > Cc: bluelightning@bluelightning.org; Khem Raj <raj.khem@gmail.com>
> > > Subject: Re: [OE-core] [PATCH v11] util-linux: split uuid in separate
> > > recipe to allow bootstrapping
> > >
> > > On Thu, 2021-03-25 at 16:19 +0000, Peter Kjellerstedt wrote:
> > > > > -----Original Message-----
> > > > > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > > Sent: den 25 mars 2021 15:27
> > > > > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Oleksiy
> > > Obitotskyi -
> > > > > X (oobitots - GLOBALLOGIC INC at Cisco) <oobitots@cisco.com>; Luca
> > > Bocassi
> > > > > <luca.boccassi@gmail.com>; openembedded-core@lists.openembedded.org
> > > > > Cc: bluelightning@bluelightning.org; Khem Raj <raj.khem@gmail.com>
> > > > > Subject: Re: [OE-core] [PATCH v11] util-linux: split uuid in separate
> > > > > recipe to allow bootstrapping
> > > > >
> > > > > On Thu, 2021-03-25 at 14:22 +0000, Peter Kjellerstedt wrote:
> > > > > > > -----Original Message-----
> > > > > > > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > > > > Sent: den 25 mars 2021 10:34
> > > > > > > To: Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC at Cisco)
> > > > > > > <oobitots@cisco.com>; Luca Bocassi <luca.boccassi@gmail.com>;
> > > > > > > openembedded-core@lists.openembedded.org
> > > > > > > Cc: bluelightning@bluelightning.org; Peter Kjellerstedt
> > > > > > > <peter.kjellerstedt@axis.com>; Khem Raj <raj.khem@gmail.com>
> > > > > > > Subject: Re: [OE-core] [PATCH v11] util-linux: split uuid in
> > > separate
> > > > > > > recipe to allow bootstrapping
> > > > > > >
> > > > > > > On Thu, 2021-03-25 at 09:17 +0000, Oleksiy Obitotskyi -X (oobitots
> > > -
> > > > > > > GLOBALLOGIC INC at Cisco) wrote:
> > > > > > > > Could you look into this warning.
> > > > > > > >
> > > > > > > > WARNING: util-linux-2.36.2-r0 do_package_qa: QA Issue: util-
> > > linux-
> > > > > dev
> > > > > > > rdepends on util-linux-libuuid-dev, but it isn't a build
> > > dependency?
> > > > > > > [build-deps]
> > > > > > > >
> > > > > > > >
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/3226
> > > > > > >
> > > > > > > That failure was my fault when testing some fixes.
> > > > > > >
> > > > > > > I've sent out a patch which renames util-linux-uuid to util-linux-
> > > > > libuuid
> > > > > > > and sorts out the license issue Peter reported.
> > > > > >
> > > > > > I don't mind the recipe being renamed and cleaned up, but I would
> > > prefer
> > > > > > to see my entire patch for the license parts being either integrated
> > > > > before
> > > > > > this or squashed into it, whichever you prefer. It does not make
> > > sense
> > > > > to
> > > > > > use the same LIC_FILES_CHKSUM for util-linux-libuuid as for util-
> > > linux,
> > > > > > and setting the other LICENSE variables in util-linux.inc no longer
> > > > > makes
> > > > > > sense as they are only relevant for util-linux.
> > > > >
> > > > > I'm torn on that. Code with the other licenses is present, just not
> > > used
> > > > > in the final output and I personally suspect that having one
> > > LIC_FILES_CHKSUM
> > > > > is going to be easier to maintain in the future rather than two
> > > separate
> > > > > ones.
> > > >
> > > > I actually checked all the files that go into -dev and -src before
> > > suggesting
> > > > this change, and all files are either marked as public domain or use a
> > > > BSD-3-Clause license.
> > >
> > > There is a difference between what ends up in ${S} and what ends up in the
> > > binary packages. LICENSE clearly governs the latter. Its the scope of
> > > LIC_FILES_CHECKSUM which there are differences of opinion on.
> >
> > Well, the latter governs what ends up in ${PN}-lic, so having a lot of
> > unrelated (to the installed packages) license files in LIC_FILES_CHECKSUM
> > does not make sense (to me). If everything that is built and (possibly)
> > installed and thus distributed is covered by BSD-3-Clause licenses, why
> > should ${PN}-lic include a lot of license files for unrelated code?
>
> I hadn't considered ${PN}-lic :(.
>
> We can't win. If we change LIC_FILES_CHKSUM we'll see complaints from
> people scanning the code that there are licenses present in WORKDIR that
> are not in LIC_FILES_CHKSUM.

If there's code in the upstream tar file etc which is not involved at
all in the build of the one particular sub component you're interested
in then this type of complaint can be solved by removing the unused
code from ${S} as part of do_patch.

> If we don't change it, ${PN}-lic does give
> more information than necessary. I still think the latter is probably
> safer and makes recipe upgrades easier.
>
> Licensing in general needs a step back and an overhaul. Sadly people are
> generally only prepared to do this piecemeal solving their specific
> issue rather than the general case and big picture.
>
> Cheers,
>
> Richard
>
>
>
>
> 
>
