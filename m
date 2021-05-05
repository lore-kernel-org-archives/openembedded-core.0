Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.web09.507.1620253290170369250
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 15:21:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RaPprlG6;
 spf=pass (domain: gmail.com, ip: 209.85.217.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f50.google.com with SMTP id b4so1903850vst.13
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 15:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SKNQ4knYca7GKJ0PakDJxHCY3O5uM/pWAR/ZWh2JIlM=;
        b=RaPprlG6VKJzvk6MHBsrBpjACAzy3K1//sE58KL9u5i8JD22p0+TfjiZKV6XtycyYc
         JVsPsMLVXlJVcVi02mGS7EJVTfdzzYbVaM9jMLBbBFGVFDIPN1sCGK3dtFa8z91upUge
         BYEKY0NUcBB4ZFe17obdvapCp/WMaI9rtQ1+KjP26FrmKXbh+Ed/dCARcTDKrE6uuAxi
         pmX/kJb94SfSUujA4wed7x39aNgkCMtITAFec22GFPAKq0s5P1hi3eWOvWe5F/ynBIQc
         noyyKEpUFIulMOTFOA2ZDHgJATW0I60y4IWjHIGvrz0VEuT6fGNeHq0GrRZOCdhuHpTa
         kRTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SKNQ4knYca7GKJ0PakDJxHCY3O5uM/pWAR/ZWh2JIlM=;
        b=h5IBPHwxAlXgK39uOuPDUYStgjDHFbe5IA1NHKFwP8lYIdyKrmTNRO74Cmrcu2WJaz
         bZcGKrzXWpB+LYE0jdvq7vmAPFlvpVoWq+LZLnWiF03Mhx4wM5OnkTdA5eyKLEQZ/Kxu
         9pPPts4XdTKY+7jHiNWwbAJslGR2BEOH+IR7z29vy7SGNKV/mYRhqFtuqG98j4qGPE7C
         FHUxmenv0NBVOOuTPizAscJnLBrttbz5Rn1tTupGSQ38/aq+rUooLXdXmO9z1EBU6xb3
         VvRWxgPuOOMx8+ey93MxqusQZ1o0Ta2GLDKdAVKhhZoHniHRE591kX+BIBZ72H0dIjLy
         JaMA==
X-Gm-Message-State: AOAM533crOM0GZmAelE+jVfSSeZUIqWOSbxtlFx3AsEzP5q+zpqbFdCm
	BrX/49YSD6iTSioLgyUwhjuaDewTEP2TEidpFiA=
X-Google-Smtp-Source: ABdhPJwkYUa1r4Ipf2IFomG7dOZ8OtV3IEoK9xIb5jpw7JyWQgWGCEAm1OX8RCL1CrwUCljH/6+0tu9OGJDVlsPytJc=
X-Received: by 2002:a67:8c1:: with SMTP id 184mr1064637vsi.31.1620253289286;
 Wed, 05 May 2021 15:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
 <20210505151850.660512-23-alex.kanavin@gmail.com> <CAMKF1srGBpzk-BiFnSM_+1pEoCByUkcPrJo2VDmSRUwGgbn18Q@mail.gmail.com>
 <CANNYZj8Q7GLF_6oLZQ9oZYO3nMKkThZnj7CZGL=duS1u_wQicA@mail.gmail.com>
 <46ffd119-9523-cb0f-d582-ced91ccccef6@gmail.com> <CANNYZj8iZrEC0kc5GGJSb6ddBH77Tz_pN+pFzuD0Hhbdjhpjbw@mail.gmail.com>
 <CAMKF1sozSbDLB08dWLOTnSAFFpgp3j7rkoQ-7NGe5fYF7f+ceQ@mail.gmail.com>
 <CANNYZj85oAj0YAZVo7J4=5d1Zti=aLmaT+-_gftA-ZWdg8JYxQ@mail.gmail.com> <CAMKF1spJ3sJnhT59PGeaGwfsoSbS1QuZEqFdgY0bxBVbES=fVQ@mail.gmail.com>
In-Reply-To: <CAMKF1spJ3sJnhT59PGeaGwfsoSbS1QuZEqFdgY0bxBVbES=fVQ@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 6 May 2021 00:21:18 +0200
Message-ID: <CANNYZj_-boTZn5hxaEZvdfQmGauNpZ6LFkm=GLo78Uzgz7zSaA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 23/61] powertop: update 2.13 -> 2.14
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c1117e05c19c9dbc"

--000000000000c1117e05c19c9dbc
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 May 2021 at 00:02, Khem Raj <raj.khem@gmail.com> wrote:

>
> order is, look for ncursesw first so this sed operation removes ncursesw
> from search paths.
> and this commits mentions this change was intentional
>
> https://git.openembedded.org/openembedded-core/commit/?id=188862de64b
>
> so why should it be dropped without understanding the repercussions of it?
>

PKG_CHECK_MODULES does not check for things in order listed (first second
or whatever), it checks for all of them as a set, or it errors out
otherwise if anything in the set is not available.

Besides, you're asking the question backwards. It should be: why should we
change the upstream choice if we don't understand the repercussions of
doing that?

Alex

--000000000000c1117e05c19c9dbc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 6 May 2021 at 00:02, Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_quote"><br><div style=3D"font-family:monospace,monospace">order i=
s, look for ncursesw first so this sed operation removes ncursesw from sear=
ch paths.</div><div style=3D"font-family:monospace,monospace">and this comm=
its mentions this change was intentional</div><div style=3D"font-family:mon=
ospace,monospace"><br></div><div style=3D"font-family:monospace,monospace">=
<a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3D1888=
62de64b" target=3D"_blank">https://git.openembedded.org/openembedded-core/c=
ommit/?id=3D188862de64b</a><br></div><div style=3D"font-family:monospace,mo=
nospace"><br></div><div style=3D"font-family:monospace,monospace">so why sh=
ould it be dropped without understanding the repercussions=C2=A0of it?</div=
></div></div></blockquote><div><br></div>PKG_CHECK_MODULES does not check f=
or things in order listed (first second or whatever), it checks for all of =
them as a set, or it errors out otherwise if anything in the set is not ava=
ilable. <br></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_=
quote">Besides, you&#39;re asking the question backwards. It should be: why=
 should we change the upstream choice if we don&#39;t understand the reperc=
ussions of doing that?</div><div class=3D"gmail_quote"><br></div><div class=
=3D"gmail_quote"></div><div class=3D"gmail_quote">Alex<br></div></div>

--000000000000c1117e05c19c9dbc--
