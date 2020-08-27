Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com [209.85.222.68])
 by mx.groups.io with SMTP id smtpd.web12.29760.1598564192155335328
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2020 14:36:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tp5nuyMv;
 spf=pass (domain: gmail.com, ip: 209.85.222.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f68.google.com with SMTP id h19so2135177ual.10
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2020 14:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GGH/7LggwgLFkDr34PUPehMS89ak2VWzQ9ibemFb7Ss=;
        b=tp5nuyMvp44tcz41oXpuU0KupUiDwSCVldjmLborKRm0xrQbZw+hjVoTeLxbIhq87i
         xT+tUUHFKmNxRX9q0QlYbmjKO4N1p485UplvQonIDHDKySgoCTt09rSVW2J8acgM8Pgi
         k07PVyPVQvax97O7KGJJvjv7Cgp+t6S3fRNY88vRj/2K4YLfqO7RCMTpyWVp+AwvsHsy
         cu0xvqpp4oJegmg+RWqbC32YEkYYJ5uyeLzupHWeDJNrnAGRRhoWgaIy8O4Sz92u9T/8
         flAghEQUKiKiajWG/IJHBb73Wp9MTXJmRWVtDWGyVATiqLZjP1QcLfGbIzj20NYW5bqt
         ANgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GGH/7LggwgLFkDr34PUPehMS89ak2VWzQ9ibemFb7Ss=;
        b=fvNNkzzzgmfZMFmeEVQTzheyulhDylsllZ2E53inmwNyQMG8g1ZJ48R2prYtTzN2+z
         Y/tkJKw/TZema8ago/Lv0tOXsYvJiW2DYBLoo5Ui4xEntimtKN7hZeU4T55Suu7U4krL
         ccw7RD1Wsgkwzi3LGdjD7l1fcS5uihPtVh80h1vCUnMqxCken2DUldDEMJIlz+jB7Nte
         OIvIhCMsMJlAPjjfO515o6k55AAYIhQtUZlbMLXDeLehXko6LjSnbXD8EuEv4gCngM6c
         Nl69hX9Y2haC2hjwU89hqy+VG1ZATL3ldDdUdmFvekrkIJ5Dag+18yr/xKCG0AU66nHr
         nAVA==
X-Gm-Message-State: AOAM5337VKM7kJvAUp1PwasZSdf4gysptSpnaXbUPIg3mdTGSqc5R/U/
	fYAHOO74+v7Vyq2a5nn3s84EeVBtFIddChJCD7E=
X-Google-Smtp-Source: ABdhPJxpf3lf/4aN1LmrIrKBecF26iqUfQBpLqHlIQWIqwj+pk50TABalvl7mHtBPWxUqM0YL6Yaucl5AQdhamf0JL0=
X-Received: by 2002:a9f:2c9a:: with SMTP id w26mr13303479uaj.89.1598564191343;
 Thu, 27 Aug 2020 14:36:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200827105933.3575-1-alex.kanavin@gmail.com> <20200827105933.3575-4-alex.kanavin@gmail.com>
 <CAMKF1sp8-t1KascRyh9KF3zYM5-3BDWcPHB-hQJ5bVZDCyaBuw@mail.gmail.com>
In-Reply-To: <CAMKF1sp8-t1KascRyh9KF3zYM5-3BDWcPHB-hQJ5bVZDCyaBuw@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 27 Aug 2020 23:36:19 +0200
Message-ID: <CANNYZj_COviOHYu8bgbOhfrP9xOzc8UeDdOP+dPxj0BNdKnqpg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/6] oeqa/x32lib: rework to use readelf from the host
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c69a3305ade2bae0"

--000000000000c69a3305ade2bae0
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Aug 2020 at 23:31, Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Aug 27, 2020 at 4:00 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > It is difficult and error-prone to ensure binutils gets
> > installed into target images where this test may run;
> > on the other hand readelf is always present on the
> > host, as it is a part of HOSTTOOLS.
> >
>
> this would mean that we are relying on build host provided binutils to
> be compiled with all bfd support
> since now we also have aarch64 build hosts it spreads he risk a bit
> more. maybe we can
> ignore this test if target does not have binutils installed or depend
> on binutils-native for providing readelf
>

The test needs to be explicitly enabled, and requires a very specific build
configuration (see config.json from the AB); it is unlikely someone will
stumble upon it randomly.

Alex

--000000000000c69a3305ade2bae0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 27 Aug 2020 at 23:31, Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<b=
r></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Thu, Aug 27, 2020 at 4:00 AM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; It is difficult and error-prone to ensure binutils gets<br>
&gt; installed into target images where this test may run;<br>
&gt; on the other hand readelf is always present on the<br>
&gt; host, as it is a part of HOSTTOOLS.<br>
&gt;<br>
<br>
this would mean that we are relying on build host provided binutils to<br>
be compiled with all bfd support<br>
since now we also have aarch64 build hosts it spreads he risk a bit<br>
more. maybe we can<br>
ignore this test if target does not have binutils installed or depend<br>
on binutils-native for providing readelf<br></blockquote><div><br></div><di=
v>The test needs to be explicitly enabled, and requires a very specific bui=
ld configuration (see config.json from the AB); it is unlikely someone will=
 stumble upon it randomly.</div><div><br></div><div>Alex<br></div></div></d=
iv>

--000000000000c69a3305ade2bae0--
