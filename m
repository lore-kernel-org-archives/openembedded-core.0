Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web08.8530.1632235441389577135
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Sep 2021 07:44:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kARMoKT/;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id b20so23894067lfv.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Sep 2021 07:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6riOlNcsO3q093aReVRU49WzS39yJJeCZVKhb2j7wKQ=;
        b=kARMoKT/AzYrpbt941Y/N0U6oQCGVnwUUPhmfHYPaLbGGPZJofhfiU+NnZjTphCMYK
         BKZH5C78lcTSdfgsGcWOZja+xKjoBrqqe7vwRfxKnizxPLSyJOBiuOLLNP+C7VxNzqMW
         Bks13TKmoGOxvxaC6Ts5zEpeucLgFobNejSP9qKchquKqpSKO7/Q5O7BqtWKltfVji6O
         Q5uhZ+xKU/DP4PdodPlkMjhLLPiAkmzQMY3UU6xc0rAmSjxduH0Nl7hP/b4spOjLNNln
         uaXKwd/2eUPY7VdZG140cxz65LGyysSfJ+07T3WkoM/f/5EkygMNZBUFPTqWQ1YY/YQ7
         l2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6riOlNcsO3q093aReVRU49WzS39yJJeCZVKhb2j7wKQ=;
        b=jgXINkIrTGpsHGFn+yNAnZqV3mZRFD4ypeQkIKZIXbAUI2B51zCOslueUv6O4jCwof
         oVy0lkB9uk87CD58mkxxnP9SuBtu3HRgGUfE+xdmDBvazT3h6NKTF24ZrJA8j0nq3EZ1
         QhMj6xw22UETX4PFR81Wr7lIe1KYF1Blp2b9h8DlZnSdBwhUY8ejFdefeA7Sg4O/yxeq
         0d8iWOL4V5xQdSIEGxALGiZw7y+YQXz5ZtDQYfBIQovalnw9O7cbPSTowXpjC5f78bqA
         M05FTAM6DKNTIaOVKGwskHcrE/8FIZ/Rr1OBChBrXByJmsBV/+KGHw5Du0YCGucVRT5t
         l4Uw==
X-Gm-Message-State: AOAM531wzhFUUsBplqz44c64NKNs285DtlvmpQl5wyYCkgRJKH9ykmga
	JmP/0HCAmjwCUomuO9gVrfTI7gGcnZM3IY5L6k8=
X-Google-Smtp-Source: ABdhPJw8nAlC3+8sUgU+P8VRxG3+9tidMKjgSv7CJx0+GO0tauLIYv3t9UrIheXnjhcd+TfeJU2GB/Xje740bUTmiKs=
X-Received: by 2002:a19:6512:: with SMTP id z18mr23771769lfb.106.1632235418166;
 Tue, 21 Sep 2021 07:43:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210919205112.183447-1-quaresma.jose@gmail.com> <YUm3SyaxRMR/JMwZ@piout.net>
In-Reply-To: <YUm3SyaxRMR/JMwZ@piout.net>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Tue, 21 Sep 2021 15:43:29 +0100
Message-ID: <CANPvuRkpf+9D2jb_Su2C-nV7WWG6JgpE7rCbfOzfvqDMnkg_-A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] sstate.bbclass: track found files on mirrors with a counter
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

I've had some problems in the past with this patchset and this time I
removed what I considered the most problematic.
I can't see the problems that are present here. Any help in the review
is welcome.

Jose

Alexandre Belloni <alexandre.belloni@bootlin.com> escreveu no dia
ter=C3=A7a, 21/09/2021 =C3=A0(s) 11:43:
>
> Hello Jose,
>
> On 19/09/2021 21:51:11+0100, Jose Quaresma wrote:
> > We don't need extra python collections to count the found files
> > on the sstate cache and sstate mirrors.
> > The main found collections provides all the files that were found,
> > then we only need to count the files on sstate mirror
> >
>
> I believe this is the cause of:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/3999
> https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/4039
> https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/4019
> https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/3338
> https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/4012
> https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/4004
> https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/4009
> https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/4004
>
> I removed both patches and all the builds passed
>
>
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >  meta/classes/sstate.bbclass | 11 +++++------
> >  1 file changed, 5 insertions(+), 6 deletions(-)
> >
> > diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> > index 29679e6a5e..fc156ac81a 100644
> > --- a/meta/classes/sstate.bbclass
> > +++ b/meta/classes/sstate.bbclass
> > @@ -893,8 +893,6 @@ BB_HASHCHECK_FUNCTION =3D "sstate_checkhashes"
> >
> >  def sstate_checkhashes(sq_data, d, siginfo=3DFalse, currentcount=3D0, =
summary=3DTrue, **kwargs):
> >      found =3D set()
> > -    foundLocal =3D set()
> > -    foundNet =3D set()
> >      missed =3D set()
> >
> >      def gethash(task):
> > @@ -927,12 +925,12 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFals=
e, currentcount=3D0, summary=3DTrue,
> >          if os.path.exists(sstatefile):
> >              bb.debug(2, "SState: Found valid sstate file %s" % sstatef=
ile)
> >              found.add(tid)
> > -            foundLocal.add(tid)
> >              continue
> >          else:
> > -            missed.add(tid)
> >              bb.debug(2, "SState: Looked for but didn't find file %s" %=
 sstatefile)
> > +            missed.add(tid)
> >
> > +    foundMirrors =3D 0
> >      mirrors =3D d.getVar("SSTATE_MIRRORS")
> >      if mirrors:
> >          # Copy the data object and override DL_DIR and SRC_URI
> > @@ -972,8 +970,8 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse,=
 currentcount=3D0, summary=3DTrue,
> >                              connection_cache=3Dthread_worker.connectio=
n_cache)
> >                  fetcher.checkstatus()
> >                  bb.debug(2, "SState: Successful fetch test for %s" % s=
rcuri)
> > +                foundMirrors +=3D 1
> >                  found.add(tid)
> > -                foundNet.add(tid)
> >                  if tid in missed:
> >                      missed.remove(tid)
> >              except:
> > @@ -1034,7 +1032,8 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFals=
e, currentcount=3D0, summary=3DTrue,
> >          match =3D 0
> >          if total:
> >              match =3D len(found) / total * 100
> > -        bb.plain("Sstate summary: Wanted %d Local %d Network %d Missed=
 %d Current %d (%d%% match, %d%% complete)" % (total, len(foundLocal), len(=
foundNet),len(missed), currentcount, match, complete))
> > +        bb.plain("Sstate summary: Wanted %d Local %d Mirrors %d Missed=
 %d Current %d (%d%% match, %d%% complete)" %
> > +            (total, len(found)-foundMirrors, foundMirrors, len(missed)=
, currentcount, match, complete))
> >
> >      if hasattr(bb.parse.siggen, "checkhashes"):
> >          bb.parse.siggen.checkhashes(sq_data, missed, found, d)
> > --
> > 2.33.0
> >
>
> >
> >=20
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



--=20
Best regards,

Jos=C3=A9 Quaresma
