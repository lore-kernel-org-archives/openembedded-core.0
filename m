Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.5173.1603497547027441405
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2020 16:59:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jk4o8Avp;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id b8so4487547wrn.0
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2020 16:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CwWz8YPnBY79/w3z3tuTZhZY2Vpz3xO0LNCP3JvJUyE=;
        b=jk4o8AvpEV+s7BelIwsmDgxC3Cm0fgu+4r3rFegSWYQXtEoQwT+BaoYleQuh1Wb3eP
         DxPVY++LPgLg1j4wUt7yqdSxXQVwLnZl8B654zh5NTdR+6m6ZMZHrT7ypBB/45j+a0Sf
         PBfeMfSA7NpgZVL7FsazkbuvzB3DOFb3rao/dRQ4W6rEdyGMM2kTj9ZO4/mRAj3g5H+q
         H0RKSdFngQ74uCFkiQqVvkLuig8j2oF1Y3gWEegoWXOYIpwCMbAoN7oW4FFHpW4tPML6
         eibEw0C2jJ+6Z0XiulVzdRFLM7LKGsqDzjELtnpNAgsfHe8mD4ygasI2de+UZ1dkP7FF
         GYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CwWz8YPnBY79/w3z3tuTZhZY2Vpz3xO0LNCP3JvJUyE=;
        b=tqscaW5esKlgyT6RgZb46tCA4M5B7f/XFlMoIxcpN9X3r7RudyhTWT+MpLKJDfCbf+
         LgnNhkEy0gQLQx7vr3aQXO1flPM6fU1EsH/WFzjDXrVG2srx8mLk9K+sfdi+vZxE6FWD
         ZC77S7OFRSr2Hagr7lxXrKxmTeyNLhc8E3NiDNvKty8ecemUFOtTFF89wJpWuTh4gNve
         w5yQw1JMGD8AmK8GsxYxUvkdih+4tDb3MzKsh0Vce7WEH2CPARNBFRzNSieznDgvYJON
         5g80xn47mRB94WOITLERpzGJ6BURror/fGpUPqNBU8Ahq5YwutfmHqiZi8vN7m49S+dY
         ilsQ==
X-Gm-Message-State: AOAM531HxxLVFMQDhuNdrvWW1JObMzXIt8qsYD2lDdidfty4JzfQuJ8i
	Q0XDJJelTa9zhcM6V/vOfQjrTF6iXyWklm9Y2U0=
X-Google-Smtp-Source: ABdhPJxvw0CzyvZ0bxVta83MWoI5ayldofC5t7cYR2S+HMKWZDXVJw1Uag8EWpu5MB+AMbyBcRsnz/dTVkXYEhSPoKg=
X-Received: by 2002:a5d:654e:: with SMTP id z14mr5028466wrv.361.1603497545446;
 Fri, 23 Oct 2020 16:59:05 -0700 (PDT)
MIME-Version: 1.0
References: <BY5PR11MB3992E2FBAD8DAF232D5321B5881A0@BY5PR11MB3992.namprd11.prod.outlook.com>
 <458056c7-059c-4801-ad6d-7637e22f9ea7@gherzan.ro>
In-Reply-To: <458056c7-059c-4801-ad6d-7637e22f9ea7@gherzan.ro>
From: "Joshua Watt" <JPEWhacker@gmail.com>
Date: Fri, 23 Oct 2020 18:58:53 -0500
Message-ID: <CAJdd5GbicQEf-qCpYOGcjEi-Z0W5mAhrMhUHbmE=tb7aE_CJkQ@mail.gmail.com>
Subject: Re: [OE-core] git repo vs archive for source
To: Andrei Gherzan <andrei@gherzan.ro>
Cc: Joe Slater <joe.slater@windriver.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000098382505b25f5dcf"

--00000000000098382505b25f5dcf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2020, 5:17 PM Andrei Gherzan <andrei@gherzan.ro> wrote:

>
> 23 Oct 2020 22:56:28 Joe Slater <joe.slater@windriver.com>:
>
> > When updating versions, like for ruby, say, is it desirable to switch
> from using =E2=80=9Creleased=E2=80=9D archives to using the git(hub) rep=
o with the
> corresponding branch/tag?
>
> I think git is usually the preferred way mainly because it matches code
> directly as opposed to a packaged payload.
>
> The exception that I found is when people are using git to store binarie=
s.
>

Right. You don't want to use the archives that github creates automaticall=
y
because the checksums are not stable and they can change over time. If som=
e
one is manually attaching an archive to a release, that's usually ok to us=
e


> --
>
> Andrei Gherzan
>
>=20
>
>

--00000000000098382505b25f5dcf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Oct 23, 2020, 5:17 PM Andrei Gherzan &lt;<a hr=
ef=3D"mailto:andrei@gherzan.ro">andrei@gherzan.ro</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">=20
  
 <div>=20
  <br> <span style=3D"font-family:sans-serif">23 Oct 2020 22:56:28 Joe Sla=
ter &lt;<a href=3D"mailto:joe.slater@windriver.com" target=3D"_blank" rel=
=3D"noreferrer">joe.slater@windriver.com</a>&gt;:</span>=20
  <br>=20
  <br> <span style=3D"font-family:sans-serif">&gt; When updating versions,=
 like for ruby, say, is it desirable to switch from using =E2=80=9Creleased=
=
=E2=80=9D archives to using the git(hub) repo with the corresponding branc=
h/tag?</span>=20
  <br>=20
  <br> <span style=3D"font-family:sans-serif">I think git is usually the p=
referred way mainly because it matches code directly as opposed to a packag=
ed payload.</span>=20
  <br>=20
  <br> <span style=3D"font-family:sans-serif">The exception that I found i=
s when people are using git to store binaries. </span></div></blockquote></=
div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Right. You don&#39;=
t want to use the archives that github creates automatically because the ch=
ecksums are not stable and they can change over time. If some one is manual=
ly attaching an archive to a release, that&#39;s usually ok to use</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><div>=20
  <br>=20
  <div> <span dir=3D"ltr" style=3D"margin-top:0;margin-bottom:0">--</span>=
=
=20
   <br>=20
   <br> <span dir=3D"ltr" style=3D"margin-top:0;margin-bottom:0">Andrei Gh=
erzan</span>=20
   <br>=20
  </div>  
 </div>

<br>
<br>
<br>
</blockquote></div></div></div>

--00000000000098382505b25f5dcf--
