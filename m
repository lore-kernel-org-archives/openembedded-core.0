Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web08.5226.1604568787107857188
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 01:33:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cJliXCuF;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id q3so524484edr.12
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2020 01:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kAUeIJ2UvPJx3Rg/v29zijHD3sAPDmoUemMsv7DK/JU=;
        b=cJliXCuF3p1jP5cBiN8Iop9K2DfHblyRJFAEUYyDUWMnnGlS5aPNKkPhQwSjqiYFVp
         4kvNrOFpLiozsqkCMIQQ/sCNkpDLMrkf2ZSV7UefkDRSR3pfhqgheI6nwEoL5wjGmYXN
         ydpAz9xPXXg30FqMWq8F3frhPqTHQkkSp5ImPjdxrcEAyYL7hwEuqIxY9VYffS6O8j88
         WgntK9GukDT81mp9TvoXBIJ6rjiZLKldQQllxAF4lSkRS+g7fT0RQyhxBrH79mA4yYRz
         8RHkrlLRVWh3iW4VF/dfxHsPwpIeAgDhdPm+BDhQ6J4zzk8oPUjvyG6hpUB31VeLP6CV
         iGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kAUeIJ2UvPJx3Rg/v29zijHD3sAPDmoUemMsv7DK/JU=;
        b=C1ClLFGvB5JZ5gZJb/mCSIb0gm/MQAqMRrDw/y0lD6AXJx+8Fd+TVVG6smXEwowt3L
         FMRsK1BpSQ7fXzV2DyJaD8nqka52eSndwg339n0lgl7/B0VTsTKe3ZY3HABY31GLj2kb
         3+mty3UlZwEyIJzkEB4v53rqliWSlbUKPy/fmFlEyuc9Tc7BhEwxS0c4pTfpFapuGGYY
         VppF0gn/EA1vOZdZEdEViyEYt7NbvgtdC4DTINXMEjz3o2snGzxnr+3W1piiUWVozstP
         grr1YCm3Qw+95n2aq478uTJpPYxpxcpxSG50UZrAab7HbDypic7rdwNKmtNd73lQRgRq
         udbA==
X-Gm-Message-State: AOAM533+lItVwYT4/Yxg3tFVdMvJv0sy9xo7UfyfwlRmGGjCvk5lHlfQ
	9VCS/qxTI42R7qElStbGT/4hboidI6tYGYEp7nE=
X-Google-Smtp-Source: ABdhPJzqAzxjXUeVR5oivafK+Ckt2bA2C0KrSw7ku9c3uJi4Np2EQWoy0Jjvl+XiCMFLYsP+E62Q2x+dMA1PbiRocM4=
X-Received: by 2002:aa7:dcd6:: with SMTP id w22mr1596233edu.19.1604568785692;
 Thu, 05 Nov 2020 01:33:05 -0800 (PST)
MIME-Version: 1.0
References: <20201030232256.624297-1-quaresma.jose@gmail.com>
 <aa090613e34863ee936811011d3019eafba3db81.camel@linuxfoundation.org>
 <CAP9ODKp5US_QbOxB_GQiCjnh9zPfpLeqNeSdD5hPgVxupJS97w@mail.gmail.com> <16437EE3A0B6A44A.10137@lists.openembedded.org>
In-Reply-To: <16437EE3A0B6A44A.10137@lists.openembedded.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Thu, 5 Nov 2020 09:32:54 +0000
Message-ID: <CANPvuRm9R-rfsuw=-3bFBA1sKtxUmyjWPzDe4Wm7KSWv-CV+Aw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gstreamer: use git to fetch the sources
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jose Quaresma via lists.openembedded.org
<quaresma.jose=3Dgmail.com@lists.openembedded.org> escreveu no dia
domingo, 1/11/2020 =C3=A0(s) 21:16:
>
> Otavio Salvador <otavio.salvador@ossystems.com.br> escreveu no dia
> s=C3=A1bado, 31/10/2020 =C3=A0(s) 20:30:
> >
> > Em sex., 30 de out. de 2020 =C3=A0s 21:32, Richard Purdie
> > <richard.purdie@linuxfoundation.org> escreveu:
> > > On Fri, 2020-10-30 at 23:22 +0000, Jose Quaresma wrote:
> > > > gstreamer has the code hosted on [1] and this repo as tags.
> > > > manage code with git its more convenient than with tarball archive=
s.
> > > >
> > > > [1] - https://gitlab.freedesktop.org/gstreamer
> > > >
> > > > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > >
> > > I'm not 100% sure about this. Tarballs tend to be less overhead for
> > > fetching and make for easier source archiving. The git repos are eas=
ier
> > > for day to day dev work but tend to be harder for the AUH to handle =
and
> > > slower to fetch for the users taking up more space to download and
> > > unpack. I'm therefore torn. I know where we have used git for other
> > > core components it has caused performance issues.
> >
> > We could tune the git fetcher to not download whole history, we it'd
> > be  a win win case no?
>
> I don't know if it is possible to use something like: git clone =E2=80=
=93depth 1
> but with a solution like this we reduce the download overhead to
> values close to the file archive.

There are an env variable to control this on the bitbake lib/bb/fetch2/git=
.py

BB_GIT_SHALLOW_DEPTH

Allow the user to explicitly adjust the depth for named urls/branches. The
un-suffixed BB_GIT_SHALLOW_DEPTH is used as the default.

When this is set to BB_GIT_SHALLOW_DEPTH =3D "1", it will use git clone
=E2=80=93depth 1 url

Can this be a solution to prefer git fetch over archives in some cases ?

>
> >
> > --
> > Otavio Salvador                             O.S. Systems
> > http://www.ossystems.com.br        http://code.ossystems.com.br
> > Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
>
>
>
> --
> best regards,
> Jos=C3=A9 Quaresma
>
>=20
>


--=20
best regards,
Jos=C3=A9 Quaresma
