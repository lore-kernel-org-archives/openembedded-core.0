Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web10.11424.1589460480099944949
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 05:48:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YtUEmY/n;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id b1so2704764qtt.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 05:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PRGGN5gmYGTYyjH+OuHedtWi25ziQrMrlxSfwE7vNn0=;
        b=YtUEmY/nfGIE1wilNA2F8EiGuO1X80pyyVrg50yNiQJf2F2hvS9/j+/KCbZ/wXewrP
         ClQzuuUF3px4yFObsFhngttxTL9dvYjE/ZG3uOJpqfD06hyNil0NK40enJdc63PwNKzd
         Ij5DiUu4BXiey6kqkaDwTMjyHkVQ5MLIoG+yYRDb0A5UcIYCQpzBPivLspqaipV+3CFi
         sODQYy9O1D4ty7tYEvdUQhhr1Te9FCAqqsJWV3R2vyFdkHsA3ES7OSUUvHBfr8Fg7CGm
         eOtZAWndE5Yd0MRjePxnv3yzQlLCpBZ/NQCdl23MU7ZG/LE91jvO/6kod1nA3GZdflrO
         S4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PRGGN5gmYGTYyjH+OuHedtWi25ziQrMrlxSfwE7vNn0=;
        b=fQCRt7foeeyZoDSYGQxfs2/dJpGU5DxxnrZSfkUKy/BJCY8WGLVnFC0JZ6R9YbCMO1
         CCxRaik3W+6MFz69/igTHLWezo4n+Y/6FxoWp9kt8a7b7D3q/eTaTuPUaFsbS8ZXTLsc
         EGI1HgOwK6Fa0b598zyE0C5WAfe7P8b7sT5+XZMu6jOdLGC9ZqT3swYrNwMSG5WelcOE
         sDMNoRIONQnmYYurzYz+6wAWI1XtQd+au4ABGAHgW5bc8xAcWQbS1cCccAxGGXgZ52Dt
         vIWDBL63H5q9zAXgfpmBl6mM5eXXVTMIBx9Hj6tFBEneXw9L/5y9EuPWmK5ZlPfcKt28
         KBMw==
X-Gm-Message-State: AOAM5310EjD1rJPTGMW/NzipHYxuf8X4+8h6Mf7If49dFx/hltglL5j2
	/95WdXMJtfQUhOn4Rbp/atiEH5EmaVo/pVQJ7WCukf7O
X-Google-Smtp-Source: ABdhPJxqaaiExWNct5TxHBfAjt/wH3mizoUkNk3MPDbkBLstiVARXbKMds9ysoxUrWcwRnSUmU2f64sXGYWadg+NZx4=
X-Received: by 2002:ac8:4e8d:: with SMTP id 13mr4198446qtp.293.1589460479137;
 Thu, 14 May 2020 05:47:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200511182812.441561-1-raj.khem@gmail.com> <20200511182812.441561-3-raj.khem@gmail.com>
 <20200514073821.GA16323@localhost>
In-Reply-To: <20200514073821.GA16323@localhost>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 14 May 2020 05:47:48 -0700
Message-ID: <CAMKF1sp0G_fz0Jjf5z4=qR5rTVK-miTABZjdkQn2FK2Ypm4v2g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V3 3/3] gcc10: Revert using __getauxval in libgcc
To: Adrian Bunk <bunk@stusta.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003e5a7905a59b1b97"

--0000000000003e5a7905a59b1b97
Content-Type: text/plain; charset="UTF-8"

On Thu, May 14, 2020 at 12:38 AM Adrian Bunk <bunk@stusta.de> wrote:

> On Mon, May 11, 2020 at 11:28:12AM -0700, Khem Raj wrote:
> > This was added recently, but it seems be chewing more than what it
> > should and causes non glibc packages also depend on it.
> >...
>
> Is this only valgrind (there is a upstream bug open for that),
> or were there more recipes with a problem?


Just valgrind but problem can happen with static linking with no default
libs in general

>
>
> cu
> Adrian
>

--0000000000003e5a7905a59b1b97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, May 14, 2020 at 12:38 AM Adrian Bunk &lt;<a href=3D=
"mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1=
px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,2=
04)">On Mon, May 11, 2020 at 11:28:12AM -0700, Khem Raj wrote:<br>
&gt; This was added recently, but it seems be chewing more than what it<br>
&gt; should and causes non glibc packages also depend on it.<br>
&gt;...<br>
<br>
Is this only valgrind (there is a upstream bug open for that),<br>
or were there more recipes with a problem?</blockquote><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Just valgrind but problem can happen with static =
linking with no default libs in general=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-le=
ft-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><br>
<br>
cu<br>
Adrian<br>
</blockquote></div></div>

--0000000000003e5a7905a59b1b97--
