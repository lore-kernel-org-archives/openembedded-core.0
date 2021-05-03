Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web08.30883.1620031643361284924
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 May 2021 01:47:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Jp0yvzCB;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id h10so5333243edt.13
        for <openembedded-core@lists.openembedded.org>; Mon, 03 May 2021 01:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iHEj19ujtqnBkVG7vLu2Xt5/fn4IuSiL2v0/wm6AqR4=;
        b=Jp0yvzCB0i/jWkyc1kh6KX3dEbgxPgX1Fa1Jh7JydMKzuBMgXeSuTrMsg3LTD9dmg8
         8SHnBBUHrjkLOzQqzsQBIW1BVvSm+M3jaHAmwJATFbuOv6fmP3HOIQ5S2ZpY3OciXZq9
         R7fpCsbKvitJ9BzXe1M+gxJpeUgPAgLXPPmfdNakScWBdx5u4st7iH03dN0FxArlH5me
         c3MWleQomqgW8bR9cuxxEGI0OWmFz/3qa1EPG94kyzbn3cX31G+WcCx3QgSGb1x/euXZ
         yMo1Pm9K7oeQi3olr2uE8cf0VpHCFLs1BdkM3fTljKh0DMFNbdWMepzQs0HVY2M7uv2N
         t/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iHEj19ujtqnBkVG7vLu2Xt5/fn4IuSiL2v0/wm6AqR4=;
        b=d6U8HyQOg+JxT2TmaMmZJSmnRLkc2+cpRZizFWHN2Ys7LlHpZg9pywqq43w+wc1nK/
         tSpZJLxEM0dHSX9q8L1sQsdOpG4ndDtYYxypNh79mdJGt/Rw3njw8BEJmm7HRIHmOgkD
         XrowdwGZuoo9mrw3hySIvr400Uvtuactz/AjBQYXZsTidxb0UY+Ki33tGQuhDF+Mdas+
         Z+QSqtiyd3qAcW5vA3jZbntKelhBkmDYsUYz1tPv43iTl0ubzIy46rOonQ3AuB87c/wN
         Z2HpWzSBcPuqZ3TReqdn4XdIdeqmAGYihaw0rkr54iNUBlo9cOWTgBCBM5libENBkxL/
         bI5w==
X-Gm-Message-State: AOAM530yBshWZwhT7tyd6TqfWF7SDAEzq902vnZLgxcIdPwFz66bH7CB
	uN2vzECnEW6c/gqgxCI6AvIUeWZ7/YvH8sdgUig=
X-Google-Smtp-Source: ABdhPJxC1t5T5jLfPVE5dLs8bwGCMFiAmQ5hmKrDz7Yn36q81P6GlgR24MBxtmU//PebPCYzVNW1VOfAsn3J+7M7cEY=
X-Received: by 2002:a05:6402:b91:: with SMTP id cf17mr19234570edb.19.1620031641763;
 Mon, 03 May 2021 01:47:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210502175441.368688-1-quaresma.jose@gmail.com> <92a0e558-be52-b9d0-77fe-58c42a308a2d@gmail.com>
In-Reply-To: <92a0e558-be52-b9d0-77fe-58c42a308a2d@gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Mon, 3 May 2021 09:48:38 +0100
Message-ID: <CANPvuRnTQuPM3zDTFwwDwq9fNp8tvfxcQ3hGPU4UqcGHMtht-w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] ptest-runner: libgcc must be installed for pthread_cancel to work
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

Khem Raj <raj.khem@gmail.com> escreveu no dia domingo, 2/05/2021 =C3=A0(s)=
 22:06:
>
>
>
> On 5/2/21 10:54 AM, Jose Quaresma wrote:
> > found on runqemu core-image-minimal with gstreamer ptest-runner
> >
> > STOP: ptest-runner
> > libgcc_s.so.1 must be installed for pthread_cancel to work
> > Aborted
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >   meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb b=
/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb
> > index 57a3ae005b..fe6ef2a43f 100644
> > --- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb
> > +++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb
> > @@ -26,3 +26,5 @@ do_compile () {
> >   do_install () {
> >       install -D -m 0755 ${S}/ptest-runner ${D}${bindir}/ptest-runner
> >   }
> > +
> > +RDEPENDS_${PN} +=3D "libgcc"
> >
>
> this is a workaround needed for glibc systems, we do not need this for
> musl so lets mark it accordingly
>
> RDEPENDS_${PN}_append_libc-glibc =3D " libgcc"

I will change this, thank you.

>
> >
> >
> >=20
> >



--=20
Best regards,

Jos=C3=A9 Quaresma
