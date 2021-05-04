Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web12.9930.1620151486933957403
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 May 2021 11:04:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sdzKAGJy;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id o192so5220059vsd.7
        for <openembedded-core@lists.openembedded.org>; Tue, 04 May 2021 11:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d32+zBzlWez9n3knPPTh9vxGxd3tNo1FihGzso08iP0=;
        b=sdzKAGJytP40iOqY1yu5TFXqQihYMTM68WRyer5FVg7sFyGZQHiFQrQBRx7ns+h/BZ
         3Ch53kelL7YvpApOmEJX2YTmgfDwG8yj5G0fCf1dsp6MJRxqpt1Ig8fl7g6QUto8XkGy
         b2ZUxO+cybbes6RV54ywGEMVHrUBVbIZvW4NWQdUPqRM9WxyPm0+k3En6nmAWa7vFlH7
         TVJ3BYQ9TKBHor0KgRxnPLSU2oIonRiHdpb7kSkHwkfY0QcX2IjcQkYRL2pLE2JBEuD9
         4wdl6KnxVKbGmuqSqmbVT7gB1SbqaM1yKs+khIs5zq3099zSRQyAAfNB4mukDk4Tw8Ib
         2qFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d32+zBzlWez9n3knPPTh9vxGxd3tNo1FihGzso08iP0=;
        b=Mv6K9fAtdZ/HZbmKHUGXpGQOei1fEYhCSPQIP0vAX6+PD+rmcKv0WRbJJKo7XfxEje
         /fuYJyMMENZumUoxboVEd8MEgwYDr1syzePyJ+Oh2DFlz6/e7IOtViC02e/wehuaqKKI
         jNr+Q3zgXb6BA3fndFTlnMOS9Ngo8+dl4rrKSKHcQVuaSgeYhu1K61ZYFOUx//HT8eOh
         OpMBsi744+rb3N9nPbNeOeuMDWlwr3LDdlKJp7hVZVzBUzencf5EsR76/sWEPAL3vl5Z
         xv1PLRT3YX9nYmyzDkWR6WB9l7RFMY51xm+A+jqWOsn0tjazPZBERvmkKs7RWFqT7LpJ
         Vzmg==
X-Gm-Message-State: AOAM530SmcVyUi1appJ09kG2+zs5LQD+yJFY1oywu/QH4DBmBlNBy36G
	LqhsGdmmPf776NYUG/Ywg0iO35aMjKsoWUembKQ=
X-Google-Smtp-Source: ABdhPJyQVVVexL1dFxnxp23S/R9gN7V7F/0M7De4eyIrIhO/ZdDIgicCmiqNjMCcBb4NDhQRPX6F/VPLZZQ7kowEmWU=
X-Received: by 2002:a67:c401:: with SMTP id c1mr22324917vsk.51.1620151486088;
 Tue, 04 May 2021 11:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210423180254.706537-1-alex.kanavin@gmail.com>
 <20210423180254.706537-4-alex.kanavin@gmail.com> <CAAnfSTsz5L60dtRGqCAam_1DCV3Lhb40GZ+8HMvEGC8RitwgKA@mail.gmail.com>
In-Reply-To: <CAAnfSTsz5L60dtRGqCAam_1DCV3Lhb40GZ+8HMvEGC8RitwgKA@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 4 May 2021 20:04:35 +0200
Message-ID: <CANNYZj8p6061c24KP=0QxrXsAq+Qp0oAGSyaYzr10=Zq=BtvZw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/7] oeqa/selftest: transition to weston images
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000cf897405c184e94f"

--000000000000cf897405c184e94f
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 May 2021 at 19:01, Ross Burton <ross@burtonini.com> wrote:

> Hi Alex,
>
> First, I love to see this. :)
>
> However, using this as a convenient starting point: if both nodistro
> and Poky have OpenGL enabled then there's no test cases for the non-GL
> configuration anymore, which is important for headless systems, of
> which there are many.  Whilst I agree that graphical systems that
> don't support modern rendering in some way are on the way out, this
> trend isn't across all of our target platforms.
>
> Can you add a configuration to the autobuilder along the like of
> poky-altconfig that does at least one build without GL?
> core-image-base as a *minimum* but a core-image-sato should continue
> to work.
>

I already have a companion patchset for the autobuilder:
http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/log/?h=contrib/akanavin/transition-to-weston

I don't think it has the non-opengl build yet, but I could easily add that.
Can you take a look at the patches and maybe propose something specific to
add? I can simply add a patch to my set if you write one.

Alex

--000000000000cf897405c184e94f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 4 May 2021 at 19:01, Ross Burton &lt;<a href=3D"mailto:ross@=
burtonini.com">ross@burtonini.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi Alex,<br>
<br>
First, I love to see this. :)<br>
<br>
However, using this as a convenient starting point: if both nodistro<br>
and Poky have OpenGL enabled then there&#39;s no test cases for the non-GL<=
br>
configuration anymore, which is important for headless systems, of<br>
which there are many.=C2=A0 Whilst I agree that graphical systems that<br>
don&#39;t support modern rendering in some way are on the way out, this<br>
trend isn&#39;t across all of our target platforms.<br>
<br>
Can you add a configuration to the autobuilder along the like of<br>
poky-altconfig that does at least one build without GL?<br>
core-image-base as a *minimum* but a core-image-sato should continue<br>
to work.<br></blockquote><div></div><div><br></div><div>I already have a co=
mpanion patchset for the autobuilder:</div><div><a href=3D"http://git.yocto=
project.org/cgit/cgit.cgi/yocto-autobuilder-helper/log/?h=3Dcontrib/akanavi=
n/transition-to-weston">http://git.yoctoproject.org/cgit/cgit.cgi/yocto-aut=
obuilder-helper/log/?h=3Dcontrib/akanavin/transition-to-weston</a></div><di=
v><br></div><div>I don&#39;t think it has the non-opengl build yet, but I c=
ould easily add that. Can you take a look at the patches and maybe propose =
something specific to add? I can simply add a patch to my set if you write =
one.</div><div><br></div><div>Alex<br></div><div><br></div><div><br></div><=
div> <br></div></div></div>

--000000000000cf897405c184e94f--
