Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web10.1384.1593110593803911191
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 11:43:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=R2FcdetM;
 spf=pass (domain: konsulko.com, ip: 209.85.210.44, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f44.google.com with SMTP id k4so3066797otr.7
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2020 11:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UmIRFA9izaCxEs6TOeXEKhi4sDZoqUtMKXLRGOAob5c=;
        b=R2FcdetM0TPymTLEDDXR9mIQ+zRlFUAKX+V1JGNZloLEDLnzjsIqYupniLaFFpvS42
         gwfARIF726YEW3MVRT1C/W5C75cKLczvRlwtClvKzZo7hRpzEsaC2UYGxmukHH8JzjAx
         q/kEfZI5Ty53+y2WxyvU2htRdZmx3To/PFMRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UmIRFA9izaCxEs6TOeXEKhi4sDZoqUtMKXLRGOAob5c=;
        b=siRkuoiMt5OSrizKDz7ruCRjIGRNqzFAShCJN23xDSimXFY0Xny9iM7fopUSA94Q5A
         Y/X4PuFwbuKeqFcWF1yQaKTzjMvKlSDmLTZ5FPnEzMSFptEjGLVFPG5AdetkgOSHyWwg
         lmfQtNRb+K6U1bxvWNrLHM8RGgPNul5TqKPHN7wJXe8G8Hb83vlzW7WfgShxzDAwNdTB
         QYPNX23GlZ57XIYE0CPTh0dDEo7sVooxz7IkoGAX7KoqWIJZaJTmeP17yJDWr4tcjZCy
         deDg7mEg/Ro0HzxXetVLCMNBKnB5VcYTgR5dTDuNgbjRmsu6f34O/VKdmnzHhiTs51fs
         OOcw==
X-Gm-Message-State: AOAM53316mccH2wbnXwkMT66zMvGFvsMyQ4pfhpuMmgXBOgP9VAt5Dh0
	NIf3Tjhgua+jsPHnaLyooXsbvfcUlpwMlcj6LDrkgw==
X-Google-Smtp-Source: ABdhPJw+eb1vRFi/mfBKz4M87zFRGIVjoGhEiQCFN4PFxQ4s7Ly0z4A6CSE6SEw4TjwdDVcHuMK5PhhG4/tA6SCfG1I=
X-Received: by 2002:a9d:6c02:: with SMTP id f2mr13414126otq.258.1593110593106;
 Thu, 25 Jun 2020 11:43:13 -0700 (PDT)
MIME-Version: 1.0
References: <c207ad43-fba6-d5ff-085a-f6be1231e230@herbrechtsmeier.net>
 <CAP9ODKoR_JOt6UQFTMNJYv_fh4d-vuVyy-5k_cd6ZgjsiLcA0Q@mail.gmail.com>
 <CAMKF1srKPeNpoX0uRPSHQM3VDuqe+C=adNsDFZ85L+irrs6xDQ@mail.gmail.com>
 <2f176c09-1647-6d46-548c-e58fff7559b6@herbrechtsmeier.net>
 <c0aee660-78e1-d6b0-00d1-687853b89578@gmail.com> <9f3cf7b6-7240-f1ea-6c4f-27dde0dbdc6a@herbrechtsmeier.net>
 <CAP9ODKpQ+ZgNqoZvWtHRF_RyrvpXan4v-ZM=U9fiHXj8o8Daww@mail.gmail.com> <6c1c02b9-842a-1d33-2727-932d7a46f702@herbrechtsmeier.net>
In-Reply-To: <6c1c02b9-842a-1d33-2727-932d7a46f702@herbrechtsmeier.net>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Thu, 25 Jun 2020 19:43:02 +0100
Message-ID: <CAM9ZRVss31=qStjgLFh4ZOGcMiYHs1Z7CMxo7TWXH-xF_9YVow@mail.gmail.com>
Subject: Re: [OE-core] Status of Go support
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>, Khem Raj <raj.khem@gmail.com>, 
	Otavio Salvador <otavio@ossystems.com.br>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 25 Jun 2020 at 16:36, Stefan Herbrechtsmeier
<stefan@herbrechtsmeier.net> wrote:
>
> Am 24.06.20 um 22:24 schrieb Otavio Salvador:
> > Em qua., 24 de jun. de 2020 =C3=A0s 17:17, Stefan Herbrechtsmeier
> > <stefan@herbrechtsmeier.net> escreveu:
> >> The go-mod.bbclass download data from the internet during do_compile. =
If
> >> you cut the internet connection after a do_fetch the do_compile failed=
:
> >
> > Yes, this was the better we could get without hacking go mod tool
> > itself. It would be nice if you can provide an alternative way to
> > improve it.
> >
>
> What are the alternative?
>
> a) Add a fetcher to bitbake to create a vendor directory via `go mod
> vendor`?
> b) Add a `create_go.py` to recipetool and create a recipe per module?
>
> The solutions are related to the npm (a) and python (b) solution.
>
> I don't like a) because it breaks the best practices of OE (for example
> one major version per project and avoid embedded dependencies). On the
> other side b) isn't so simple because of the circular dependency between
> go projects. This means we need a package (recipe) for the source and
> the binary.

(a) may not be in line with past best practices but I think it's
better than no change. It at least gives the archiver and licensing
classes a chance to capture the relevant artifacts (if configured
correctly) and so do proper license compliance and/or maintain a
source mirror.

I think the Python method of one recipe per dependency works well for
Python since it's not common to distribute a built artifact which
statically links all those dependencies together. That's often not the
case with rust and golang projects though. I still think one recipe
per upstream project with dependencies fully expressed in the bitbake
recipes would be ideal but as others have said that's fighting a
losing battle.

--=20
Paul Barker
Konsulko Group
