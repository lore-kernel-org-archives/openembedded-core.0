Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web11.12590.1589464579117715876
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 06:56:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hLN2iVAz;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id c24so2869151qtw.7
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 06:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cwtVw1qOO2gm3DnUz0UHpLTtqXIrOYsECR5ytXkqZwo=;
        b=hLN2iVAzhqRq5S6dxIiz5Ji6/gQEr5zxz9qVO5/M+39PT5HSJHc7K4iE5LzXvOaRm0
         2YdQP2sMuYVN0GKPfX3S7TdcvVPq0I0l4wJFtpNCAuNY19WydkgmEhViRTAL0T/alJut
         6N2Gr8HVxPnmB3u254JVDNFbFCPQ8EwtSzu2FqMljANK2XovkDdDeQ0t9Qd75QBwVmQM
         ZQy9INbRyA7rGo5QlGC8m67kdEgMRyGvqhaMFpw7YmaPEt6GubQ1Aq/A4N9hc0dsjJpO
         TBZ96qTkkfvLCnEcflBdEy6MyJWV5c384xr+zeH7VVPWRkgMToegGgmwaqrjFnlUaKAi
         XcgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cwtVw1qOO2gm3DnUz0UHpLTtqXIrOYsECR5ytXkqZwo=;
        b=gwSWz660higBx1pkP1gFC4orlyOk2ZP8F7BWAfoLtpd2ub5djGKjnRS1mQH6Ct9XlL
         46XofMbfjUC1rYem7LwJLSJdf6bs5PnG7Oli1hiJS2xqfWFG1+GTn1D5btc+ruHwd5lF
         muGtCYv5098cwEe3lLZh2zu29PGc+QML0D+OObnzbX6fMJ4ApzM9R1ngvlGvf1R4gwHi
         rYpYCYGcdMD0J0eJb/q7qAarYtEdYGm1sWD+Ysd5toFY8GXcCVuf1jNeFQEZ6MKCyO+Z
         C5NbEUgxjb48eRQGgudG3NL3ULZXg0ew4D+4ZvduOcKoI+GVvQBrBa6+IzuCo+j84Rth
         9ZOA==
X-Gm-Message-State: AOAM532LKMsaptCI2I8wZItnqC9kTZTpr57lJnFKRymeDkegpBeU+T4N
	9AlfLc8Egad1gJUDgh6dRdmz2d83Kb3xKWstQOWsxOaC
X-Google-Smtp-Source: ABdhPJzZGeVa5s4XdAix/t79871O5hawn9o9L+nptSmQV8D6HYgNiWjIfrFXXsPJioyvLZ6fOqR2VLOWxGam9mWg/8Q=
X-Received: by 2002:aed:308e:: with SMTP id 14mr4612664qtf.146.1589464578025;
 Thu, 14 May 2020 06:56:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200511182812.441561-1-raj.khem@gmail.com> <20200511182812.441561-3-raj.khem@gmail.com>
 <20200514073821.GA16323@localhost> <CAMKF1sp0G_fz0Jjf5z4=qR5rTVK-miTABZjdkQn2FK2Ypm4v2g@mail.gmail.com>
 <20200514131606.GA17383@localhost>
In-Reply-To: <20200514131606.GA17383@localhost>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 14 May 2020 06:56:07 -0700
Message-ID: <CAMKF1sp_XsD7FSSogPWbYVNTV7uzOr9Ci15g3KgA7dbi7dkb_g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V3 3/3] gcc10: Revert using __getauxval in libgcc
To: Adrian Bunk <bunk@stusta.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008e6c1d05a59c0f5e"

--0000000000008e6c1d05a59c0f5e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2020 at 6:16 AM Adrian Bunk <bunk@stusta.de> wrote:

> On Thu, May 14, 2020 at 05:47:48AM -0700, Khem Raj wrote:
> > On Thu, May 14, 2020 at 12:38 AM Adrian Bunk <bunk@stusta.de> wrote:
> > > On Mon, May 11, 2020 at 11:28:12AM -0700, Khem Raj wrote:
> > > > This was added recently, but it seems be chewing more than what it
> > > > should and causes non glibc packages also depend on it.
> > > >...
> > >
> > > Is this only valgrind (there is a upstream bug open for that),
> > > or were there more recipes with a problem?
> >
> > Just valgrind but problem can happen with static linking with no defaul=
t
> > libs in general
>
> No, it cannot.
> The relevant part of "no default libs" is not linking with libc.
>
> Linking statically with libgcc and then providing own implementations
> of all libc functions used by libgcc instead of linking with libc is
> not a common situation.


Take a look At what=E2=80=99s going on in valgrind memcheck build if you ar=
e
interested perhaps you will find something which is not yet understood


>
> cu
> Adrian
>

--0000000000008e6c1d05a59c0f5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, May 14, 2020 at 6:16 AM Adrian Bunk &lt;<a href=3D"=
mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">On Thu, May 14, 2020 at 05:47:48AM -0700, Khem Raj wrote:=
<br>
&gt; On Thu, May 14, 2020 at 12:38 AM Adrian Bunk &lt;<a href=3D"mailto:bun=
k@stusta.de" target=3D"_blank">bunk@stusta.de</a>&gt; wrote:<br>
&gt; &gt; On Mon, May 11, 2020 at 11:28:12AM -0700, Khem Raj wrote:<br>
&gt; &gt; &gt; This was added recently, but it seems be chewing more than w=
hat it<br>
&gt; &gt; &gt; should and causes non glibc packages also depend on it.<br>
&gt; &gt; &gt;...<br>
&gt; &gt;<br>
&gt; &gt; Is this only valgrind (there is a upstream bug open for that),<br=
>
&gt; &gt; or were there more recipes with a problem?<br>
&gt; <br>
&gt; Just valgrind but problem can happen with static linking with no defau=
lt<br>
&gt; libs in general<br>
<br>
No, it cannot.<br>
The relevant part of &quot;no default libs&quot; is not linking with libc.<=
br>
<br>
Linking statically with libgcc and then providing own implementations<br>
of all libc functions used by libgcc instead of linking with libc is<br>
not a common situation.</blockquote><div dir=3D"auto"><br></div><div dir=3D=
"auto">Take a look At what=E2=80=99s going on in valgrind memcheck build if=
 you are interested perhaps you will find something which is not yet unders=
tood=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<br>
<br>
cu<br>
Adrian<br>
</blockquote></div></div>

--0000000000008e6c1d05a59c0f5e--
