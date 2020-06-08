Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web11.71.1591649102117441670
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 13:45:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jlIfCg9J;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id w9so15903983qtv.3
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 13:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HMNYm6pMQsaMYwLPzMZosEkLtIdtmcZhZX0twN2esOQ=;
        b=jlIfCg9J8Fm8ZlatdlYAqBO+Vj18Wx/TCxN465x4S+mf06Z9SLMvA6tugLmodCxvmw
         emr1TEbm5q4QWkvy5R3yoEsHi8EC2Hg510mCew9eiH56CG1RsHcuo1CU+iUPmLh/rza4
         q6AJveuHyROyXucnEV/fPhf4wtYSIQ8A/Am2jAzuOfEZAk2bkU02dztk0JmCmieLJvVL
         y7NRFVoYIJIJsp5fxlfrg4BRAh1GpGJsGNSuJw/ELEg61QWlf6S+XvU79tD69ZE7/1/2
         rPX+orUeae2ZRW3SWXCXqS+XHxlcyoxcQbPjeyh4HSdCCu2yu2o0LbH2TRT7MF9f5TYo
         JBXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HMNYm6pMQsaMYwLPzMZosEkLtIdtmcZhZX0twN2esOQ=;
        b=fNVIMs/F0V1TEuREhovM//UZ0fHwWCijST+6rHXimVUIl7aGCw7ZEy0pDplRwfnc+c
         oGyHRF3SQVobITSD+G5NbrRrPrQZ6SjueO3s6xJsCrEC2ypFXtINYOJk9lO9cOe5NXEu
         3cf+tiGEdcBBVd0I4shOAWlMF1VxCAFn9BDjon3gtdifok2iJFY9jcVkyEHOPSj0Py36
         73+3BH7h+u4dTAJKUiSnLik+Kty0X+eZ5y7/nhXw3WEjy52/m/HuxE1/x5HpQbu+y07T
         MneKFJrQdOUb0o3+1kcxtue7T0Zh0kp4yqAFwJcK2LccnTrjJDQQmZYFVkLIpR2LOO3x
         aaRw==
X-Gm-Message-State: AOAM533mgDgcFrLQKLitJw5xO6lEopE+rsAGM/DQh8ZFw2HG323HG+24
	UfbVp5f5hGqyW6XJXQuxfbrsGSUzox/Yk/sQ8RQ=
X-Google-Smtp-Source: ABdhPJwGFM9tyE2ChnTbNYBUcXYIU3PfT2cmvN1ZL3HdKF97fAkjIcSFGG47ItaJeV1+ES4M/Y0wvvejm8d0E2ESFUw=
X-Received: by 2002:ac8:5148:: with SMTP id h8mr23862367qtn.316.1591649100895;
 Mon, 08 Jun 2020 13:45:00 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LFD.2.21.2005271027490.2161832@localhost.localdomain>
 <0d663371-0bb1-9ae8-a50b-bc4ed7fda412@gmail.com> <CAMKF1spsARiB5ibBVZ2AF5sLGw9cAakGos-yqbfn=NG6B+nw9A@mail.gmail.com>
 <2cf81259a8f75130bc7dfbb473ab92017d054ae4.camel@pengutronix.de>
In-Reply-To: <2cf81259a8f75130bc7dfbb473ab92017d054ae4.camel@pengutronix.de>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 8 Jun 2020 13:44:34 -0700
Message-ID: <CAMKF1srP+ngMLz2-Rid7Hs7MD3BrAdaGdQ63rbni+OKCOvuorQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] remove unused DEPLOY_DIR_TOOLS variable from bitbake.conf
To: =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>
Cc: Jacob Kroon <jacob.kroon@gmail.com>, "Robert P. J. Day" <rpjday@crashcourse.ca>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>, Jan Luebbe <jlu@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2020 at 1:15 PM Enrico J=C3=B6rns <ejo@pengutronix.de> wrote=
:
>
> Hi,
>
> Am Donnerstag, den 28.05.2020, 19:02 -0700 schrieb Khem Raj:
> > On Wed, May 27, 2020 at 7:36 AM Jacob Kroon <jacob.kroon@gmail.com>
> > wrote:
> > > On 5/27/20 4:31 PM, Robert P. J. Day wrote:
> > > > Variable DEPLOY_DIR_TOOLS was introduced in 2007:
> > > >
> > > >    commit f751a20152c651a33f08ceda0502fa1d4f11c005
> > > >    Author: Richard Purdie <richard@openedhand.com>
> > > >    Date:   Wed Aug 8 21:02:39 2007 +0000
> > > >
> > > >        bitbake.conf: Sync with OE.dev
> > > >
> > > > apparently never used so get rid of it.
> > > >
> > > > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> > > >
> > >
> > > meta-openembedded/meta-oe/recipes-support/dfu-util/dfu-util-
> > > native_0.9.bb:do_deploy[sstate-outputdirs]
> > > =3D "${DEPLOY_DIR_TOOLS}"
>
> this was removed now in meta-oe commit
> af3fc04cfb64d9f229be26f47b4dec892ff919dc ("dfu-util-native: Remove
> DEPLOY_DIR_TOOLS from sstate-outputdirs") apparantely.
>
> However, I do not get the argumentation for that:
>
> >    In commit 1ef92d2423d6d6546e4f0585478540212b26f3a0 deploying the nat=
ive
> >    tool was changed to use DEPLOYDIR, so setting DEPLOY_DIR_TOOLS for s=
state-outputdir
> >    dependency should have been changed as well.
>
> Setting do_deploy[sstate-outputdirs] to something different than its defa=
ult appears to be valid for me and has nothing to do with DEPLOYDIR, which =
is only the sstate intermediate directory name.
> And the result of this is, that the tool now lands in DEPLOY_DIR_IMAGE in=
stead.
>
>
> My motivation of questioning is, that we have in our RAUC recipe a simila=
r usage:
>
> https://github.com/rauc/meta-rauc/blob/master/recipes-core/rauc/rauc-nati=
ve_1.3.bb#L5
>
> The idea behind that was that one might give some convenience to use the =
tool manually to manipulate update bundles, re-sign them, obtain meta infor=
mation, etc.
>
> What is the now suggested way of placing these kind of binaries? Simply i=
n DEPLOY_DIR_IMAGES as the above-mentioned commit does (silently)?
> Or is there maybe still some motivation to keep DEPLOY_DIR_TOOLS?
>

Just use DEPLOY_DIR_IMAGES

>
> Thanks and best regards
>
> Enrico
>
> --
> Pengutronix e.K.                           | Enrico J=C3=B6rns           =
     |
> Embedded Linux Consulting & Support        | https://www.pengutronix.de/
>  |
> Steuerwalder Str. 21                       | Phone: +49-5121-206917-180  =
|
> 31137 Hildesheim, Germany                  | Fax:   +49-5121-206917-9    =
|
>
