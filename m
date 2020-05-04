Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web11.5600.1588597602300670002
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 06:06:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oLsLpJDZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id s10so13419525edy.9
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 06:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KOZzRPeWHFoZeAKjvOl/xNdAIMhmgDOHvKgF/RFSvBc=;
        b=oLsLpJDZBVNkfjEEmogpTFBZh4oAKzbykKr0AODv7KBefO3m4F/+RHKmKl7RfL7jCY
         FYm6ifgpUNEyuATWTezlw/GXD/1ljkZ3FY8s2tp+mD3O+x3+pH4YeIoa9heNkS12UAv7
         F2UA5YA145BQ+2gxCp+SuthzkUqBDo8vCtD9ZukzEX1Choht+TnHMdRlM5LruZWprgp8
         tqolt8TnxgmmN9Hh5nfQ51XYyL00pMljInSqM9gqzGuAKBaLzaE168MiWQavGW2c+3FN
         XOhF3GZDf2YQ2FuOpAz0FdUCkmAxtChy+EQ2oG9JtfmJDJzSQ6X6rUBgBYX4RRDNg5m5
         4Ghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KOZzRPeWHFoZeAKjvOl/xNdAIMhmgDOHvKgF/RFSvBc=;
        b=mToDsKWt9yQvzEcm8CQ2/gyYxtGoxo0UJ/9lcotMcRK7mZF+5iz99zaJ5/Ug/6+eJD
         E2Jmu2PMonrqsNJjqZMLLyvwCArz1X1HS6rM/xxT/YgxLU5KpAM8vXeyu/L9onagIBR2
         suVq6ipPEswtxeYuySj5M978QQvSkoNr7X5QbGCm3B7jE3Xdh7WkJA8C8vT7daZc1J6+
         H2Y+vB41FyR+l8rzI/ee1NsbRprZA4/IQxUHwucsio3EiYLGF0Ox3Vr56M2LnkkrLAZ0
         ETFXEwcR8XAoXhpUg/Wi8bi7hb2rCz58pHlmsQRkgRIJPXB4X8YxOhvd+b1XdAEmWut0
         gKvw==
X-Gm-Message-State: AGi0PuZ/Ck0aycxN3WvTzGzCPifnoBGhTB81zTrbTOBL0R3GCul3cY0Y
	y0F52pJ0M18hp6SEi5h8oaxzC1zoKF0Dzwfdh2qAzJyf
X-Google-Smtp-Source: APiQypIaZTwt4Eu6QW0kfozqfTLwqeigUEHlpt9khgldziuFVTtd77p8mh0vTCROS5e1JK3scUZCUzTKNwQLvvkTdR0=
X-Received: by 2002:a05:6402:1611:: with SMTP id f17mr13593231edv.352.1588597600494;
 Mon, 04 May 2020 06:06:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588520452.git.bruce.ashfield@gmail.com>
 <70c6d988d291d1e2953d4b57cc9e88c146785d14.camel@linuxfoundation.org> <160BD489BF65999D.29536@lists.openembedded.org>
In-Reply-To: <160BD489BF65999D.29536@lists.openembedded.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 4 May 2020 09:06:29 -0400
Message-ID: <CADkTA4PjNUb8BcP3oS9Ey8atrvuP1YAhJzfoUES0Ya8eunddng@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/5] linux-yocto: consolidated pull request
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, steve@sakoman.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 4, 2020 at 8:56 AM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Mon, May 4, 2020 at 4:31 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > Hi Bruce,
> >
> > On Sun, 2020-05-03 at 11:44 -0400, bruce.ashfield@gmail.com wrote:
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >
> > > Hi all,
> > >
> > > Here are the -stable updates I've collected since m3 of dunfell. I
> > > ran things through the autobuilder, and no new kernel issues were
> > > picked up.
> > >
> > > The -dev bump is good for master, while all of the 5.4-stable bumps
> > > are good for both master and dunfell.
> >
> > I pulled these into master-next and saw reproducibility issues. I
> > wondered why your test build didn't show it, turns out it also did:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/1024
> >
> > 2020-05-04 05:18:46,863 - oe-selftest - INFO - =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > 2020-05-04 05:18:46,863 - oe-selftest - INFO - FAIL: reproducible.Repr=
oducibleTests.test_reproducible_builds (subunit.RemotedTestCase)
> > 2020-05-04 05:18:46,863 - oe-selftest - INFO - -----------------------=
-----------------------------------------------
> > 2020-05-04 05:18:46,864 - oe-selftest - INFO - testtools.testresult.re=
al._StringException:
> >
> > AssertionError: The following deb packages are missing or different: /=
home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-36044/reprodu=
cibleB/tmp/deploy/deb/./qemux86_64/kernel-module-kheaders-5.4.38-yocto-stan=
dard_5.4.38+git0+f405543442_6cb5b11e83-r0_amd64.deb
> > The following ipk packages are missing or different: /home/pokybuild/y=
octo-worker/oe-selftest-centos/build/build-st-36044/reproducibleB/tmp/deplo=
y/ipk/./qemux86_64/kernel-module-kheaders-5.4.38-yocto-standard_5.4.38+git0=
+f405543442_6cb5b11e83-r0_qemux86_64.ipk
> >
>
> I don't see any changes in the kernels that would have triggered it,
> but they never are obvious.

I am working on some kernel reproducibility changes that were
discussed about three weeks ago.

Is the default for reproducible builds in master-next different from
what it was before dunfell was releases ? If so, that might explain
why I'm not seeing a change that would have triggered it (i.e. this is
unrelated to my -stable changes).

Like I was mentioning before, if there's a document or pastebin of
steps I can follow, I can run the tests against my pending changes and
finish them for master. They of course would not necessarily be
suitable for dunfell.

Bruce

>
> I unfortunately have no idea how to run reproducibility tests on the
> kernels locally and my build server at home is brutally underpowered
> for more than one core-image build per arch a day (hence the
> autobuilder runs).
>
> Is there a cut and paste se of instructions about the tests that I
> could follow ?
>
> Bruce
>
> > master-next was:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/900
> >
> > and friends.
> >
> > Cheers,
> >
> > Richard
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>=20



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
