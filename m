Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web11.24857.1596983070923765313
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2020 07:24:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jUuVGMKX;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id x12so4930556qtp.1
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2020 07:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SYCIaS7pikopeDDcDbAhodq/7iYjB0tY8clfroQMKkA=;
        b=jUuVGMKXoSIA/N1CWIzHb9Yx/clCVx2rLP+jGXQVWs8oyGjxSoyaJ81RAX0Q3ZmxIi
         eXCGK3DhoY5rwyyfcFszMdAEBYV1NUqL2Ah9NUKVC2gQis4t6roPNAnaSl5x2p/1kXPG
         r7l9SqMnTkHQ5wGSP3Ji1bRHu7lonHe2dz7heokm4WG1r/rBFIH6Z1Fto8eFIqITd/7+
         vovyoLSuq5ac/4MNlqwfnlTrprGYWHmdMRZO+SI6crg/uZD4OaIhMtETFI3pX9SOJHct
         5MV960XZAaQVENYZHmkBc8JwWkfjPa7wD6EzikFsl/IFsHG3EfY2QMhzywuoX9+Xrx83
         2cow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SYCIaS7pikopeDDcDbAhodq/7iYjB0tY8clfroQMKkA=;
        b=VXbC+5a03lWY51stqJstWpJu7SElqeNwQGqrPZE7Mlwpmci5qVYoIRfxep4XrAnzGg
         pH7tLdqEifedLiHvIg53mJqQsgE9UNWrFXwIcKHpAfr4BUXJHzFMOVs4r9XWafqdH+vZ
         o48RJ8p1dWooE8UIhfo0IWKwsjF9QTE/U3+AkeX1+djTBeoVkbVjjOaAn/H1YNPXrefO
         Dg2hiuLPznk1qEE97GGQq8Z/lxYVZQt9ROubkmN72rl4khG3EEpW8/8IRK6aUadxamvU
         F0tfQtN/Y7smkFfNr435utq48lvtegd9qJgGOBNTJCJpyo90MUVU38MBzB87tpDM8BPu
         0sVA==
X-Gm-Message-State: AOAM5323iv1lOen7aWweO3n+7Ix+n2M62qBDg1MFTEPW31/sCxYpvcrO
	cRehlwsDEe9JDdxWGbaUUbAr9HJJmtxDMflYOz8=
X-Google-Smtp-Source: ABdhPJw86hxLhol4+mrsNYs1rZLUj4IOfO0EOdQ+G79a65+3GMAE3XFYf6a/fawHb0MdzEtExnk5vKGzVC0uCHwaBRo=
X-Received: by 2002:ac8:4097:: with SMTP id p23mr21634720qtl.316.1596983070080;
 Sun, 09 Aug 2020 07:24:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200807164249.32605-1-alex.kiernan@gmail.com>
 <CAMKF1spoj_R_-=CvzV6OE==jpEb0SiGj6FXPi17LoNZjivCOWA@mail.gmail.com>
 <16299320E916D773.23035@lists.openembedded.org> <CAO5Uq5Qc+rVRjAiK6vTiZzG8Ayd3RU0Pko==FXB-OF=krXkLqQ@mail.gmail.com>
In-Reply-To: <CAO5Uq5Qc+rVRjAiK6vTiZzG8Ayd3RU0Pko==FXB-OF=krXkLqQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 9 Aug 2020 07:24:19 -0700
Message-ID: <CAMKF1sp4LUgBiEVYZMYOD9gJaNZePTOG56Xk+ovM1D0bzJDg6Q@mail.gmail.com>
Subject: Re: [OE-Core][PATCH] systemd: upgrade v245.6 -> v246
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009ac37f05ac7298ca"

--0000000000009ac37f05ac7298ca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2020 at 4:04 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:

> On Sun, Aug 9, 2020 at 11:35 AM Alex Kiernan via
> lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > On Sun, Aug 9, 2020 at 7:22 AM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > Hi Alex
> > >
> > > I am seeing a packaging failure for iwd
> > >
> > > http://errors.yoctoproject.org/Errors/Details/459665/
> > >
> > >  which seems to originate from this patch
> > > iwd configure detects path to systemd modules load directory if
> > > --with-systemd-modloaddir is not specified using pkgconfing to enquir=
e
> > > modulesloaddir variable from systemd.pc
> > > and the value for this has changed in latest systemd via this patch
> > >
> > >
> https://github.com/systemd/systemd/commit/4a56315a990b802860170ecd1bbd3eb=
68e14a38b
> > >
> > > as a result now
> > >
> > > modules_load_dir=3D${rootprefix}/lib/modules-load.d
> > > modulesloaddir=3D${modules_load_dir}
> > >
> > > but rootprefix is empty in OE version of systemd.pc i systemd < 246
> had
> > >
> > > modulesloaddir=3D${prefix}/lib/modules-load.d
> > >
> > > and prefix=3D/usr
> > >
> > > I could have easily fixed it in iwd by adding the additional configur=
e
> > > option but it seems that systemd recipe should rather be fixed to use
> > > proper value for ROOTPREFIX
> > >
> >
> > Presumably this is building with usrmerge?
> >
>
> Having dug a bit more, I suspect this is without usrmerge?


That=E2=80=99s correct


>
> It looks to me like that upstream change is just wrong for the !usrmerge
> case.


I am not sure perhaps best to ask upstream Via comments to systemd commit


>
> --
> Alex Kiernan
>

--0000000000009ac37f05ac7298ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Aug 9, 2020 at 4:04 AM Alex Kiernan &lt;<a href=3D"=
mailto:alex.kiernan@gmail.com">alex.kiernan@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">On Sun, Aug 9, 2020 at 11:35 AM Alex Kier=
nan via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;alex.kiernan=3D<a href=3D"mailto:gmail.c=
om@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.o=
rg</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; On Sun, Aug 9, 2020 at 7:22 AM Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hi Alex<br>
&gt; &gt;<br>
&gt; &gt; I am seeing a packaging failure for iwd<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"http://errors.yoctoproject.org/Errors/Details/459665/"=
 rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org/Errors=
/Details/459665/</a><br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 which seems to originate from this patch<br>
&gt; &gt; iwd configure detects path to systemd modules load directory if<b=
r>
&gt; &gt; --with-systemd-modloaddir is not specified using pkgconfing to en=
quire<br>
&gt; &gt; modulesloaddir variable from systemd.pc<br>
&gt; &gt; and the value for this has changed in latest systemd via this pat=
ch<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://github.com/systemd/systemd/commit/4a56315a990b=
802860170ecd1bbd3eb68e14a38b" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/systemd/systemd/commit/4a56315a990b802860170ecd1bbd3eb68e14a38b<=
/a><br>
&gt; &gt;<br>
&gt; &gt; as a result now<br>
&gt; &gt;<br>
&gt; &gt; modules_load_dir=3D${rootprefix}/lib/modules-load.d<br>
&gt; &gt; modulesloaddir=3D${modules_load_dir}<br>
&gt; &gt;<br>
&gt; &gt; but rootprefix is empty in OE version of systemd.pc i systemd &lt=
; 246=C2=A0 had<br>
&gt; &gt;<br>
&gt; &gt; modulesloaddir=3D${prefix}/lib/modules-load.d<br>
&gt; &gt;<br>
&gt; &gt; and prefix=3D/usr<br>
&gt; &gt;<br>
&gt; &gt; I could have easily fixed it in iwd by adding the additional conf=
igure<br>
&gt; &gt; option but it seems that systemd recipe should rather be fixed to=
 use<br>
&gt; &gt; proper value for ROOTPREFIX<br>
&gt; &gt;<br>
&gt;<br>
&gt; Presumably this is building with usrmerge?<br>
&gt;<br>
<br>
Having dug a bit more, I suspect this is without usrmerge?</blockquote><div=
 dir=3D"auto"><br></div><div dir=3D"auto">That=E2=80=99s correct</div><div =
dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
It looks to me like that upstream change is just wrong for the !usrmerge ca=
se.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I am not sure=
 perhaps best to ask upstream Via comments to systemd commit</div><div dir=
=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
-- <br>
Alex Kiernan<br>
</blockquote></div></div>

--0000000000009ac37f05ac7298ca--
