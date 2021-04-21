Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.8063.1618982547230233988
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 22:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MiWOIQu1;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id z25so7730548qtn.8
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Apr 2021 22:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iO8QDG6P/Y8kT0i5SVHwBGLQo+x0y+Q9q8j0+P+xphs=;
        b=MiWOIQu1LFICt8sx1cEnLLXv7tOp4gbXokqgjfDoKQM1N/wsn3DflM+cn/AlXer5me
         2Jf1cnxBlyQcoU+HUGnIL7leaMyEP4TWKVd6Ny/3LbQ1kNlEMeiSO5C9/mw0PtofrgLe
         X3KPxwku0xW/LfjE4AMUujjkiQ6KisOa7S/MJMd9Fe0w/y8cnHF8/XbQ+DDsUh5AMZQH
         ttv0bYR+BqTYQ2oDvEsBzNS9WBSTzrGewc4ezn0HQh7GSyeai6qdw965XwPzb9siiFbZ
         seoIcu8yDEE6BkbubGpRxFkke8p+MCRcceh+clwd7x5G9oKrQVpv4UAam5Ri0GmoH2yF
         zqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iO8QDG6P/Y8kT0i5SVHwBGLQo+x0y+Q9q8j0+P+xphs=;
        b=E1ENQFXd+Josr7zXlm2RdFto+Js1UMWFARY+sFP44aYEFTf7ITcOOwludddf4VPGtS
         uNB1IzPRXzjemYDjQt2lR3Z6CliKmQtN2PAkHU0DZq2RuBl2T8gzqdsorLBm5QEliaqV
         Bbn4aBjlgiyFeYI0xkYCBP34whUHBGpjflRV7OgJoa2ve+B/W2kPMx39CLtqrsnC7lY2
         y6JD1+oF6Y6wP0gqcSQq74b4L+aHBAv/byeZ2UKEAAeLrYq0ONe7t3DIlQKi97bMQtMX
         brXa0YVJsJ9K9PcjtvZ5HK6bhdPlqKNK/xZQXlC7PMSPrPd2j9SEd94j0X4YNjmjvoD3
         pXaA==
X-Gm-Message-State: AOAM530gEZyhXxa4KQeyuxh7FAZ2/HU0Jk1XxOlF0AGdZUFpXFOhFSSr
	iFJrRjCHiRqTODXHShRtUSDyYblKia6v908E6G4=
X-Google-Smtp-Source: ABdhPJxH9lNAa2jYLuKTIIuYkQNUr0swRe/TcVly1yFD7gfMHZvIqtmb9Jdk0TpeIT5YVdat29iu7DWw6baYsuZ8rZs=
X-Received: by 2002:ac8:534a:: with SMTP id d10mr5115374qto.299.1618982546284;
 Tue, 20 Apr 2021 22:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210329151442.86306-1-devendra.tewari@gmail.com>
 <9e81b71466b771c55d8859e7d156b662e1c3d4f7.camel@linuxfoundation.org>
 <CBEFAFBB-3A73-41E2-A177-BBE047E615D1@gmail.com> <CAJ86T=Xn9tLHWrqqr1ZV9rAwZD7sG6x0QsyVRkUSKLwiGQKL8g@mail.gmail.com>
 <5d0a0ca838cba8fd43d3e2b5a3288f03f6ff8c96.camel@linuxfoundation.org>
 <0121485F-194F-4521-82BA-E878B7DC3521@gmail.com> <11AB69BD-5B82-4674-A447-598985EE074C@gmail.com>
In-Reply-To: <11AB69BD-5B82-4674-A447-598985EE074C@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 20 Apr 2021 22:21:59 -0700
Message-ID: <CAMKF1sqYpfoFeThNAJDyhH5KZgpbBS2TRj8CSmiiyK_edqBkJw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Use shutil.move when os.rename fails
To: Devendra Tewari <devendra.tewari@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Andre McCurdy <armccurdy@gmail.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

None of my images are bootable when this patch is applied, because
symlinks that busybox should provide arent created in the image. This
patch should be looked into a bit further,  how was it tested ?

On Mon, Apr 19, 2021 at 11:43 AM Devendra Tewari
<devendra.tewari@gmail.com> wrote:
>
>
>
> > On 30 Mar 2021, at 08:55, Devendra Tewari <devendra.tewari@gmail.com> =
wrote:
> >
> > I understand that parallel tasks can result in such issues, but would =
expect some kind of dependency graph that would prevent them from happening=
. I wish I had more time to understand the issue fully.
> >
> > Here=E2=80=99s the last version of my patch that still uses os.rename,=
 and on error uses shutil.move, with the reasoning explained in the commit =
message. There are tons of os.rename in code elsewhere, and I=E2=80=99ve en=
countered similar issues when doing incremental builds, but I=E2=80=99ll le=
ave fixing them to those with more time at hand. Cheers.
>
> Here=E2=80=99s a patch that catches error with all os.rename in the code=
, and retries with shutil.move when that happens.
>
>
> >
> > From aeba1f9728f69cdf2ce4ba285be86761d8024f9d Mon Sep 17 00:00:00 2001
> > From: Devendra Tewari <devendra.tewari@gmail.com>
> > Date: Tue, 30 Mar 2021 08:27:40 -0300
> > Subject: [PATCH] Use shutil.move when os.rename fails
> >
> > Incremental build in Docker fails with
> >
> > OSError: [Errno 18] Invalid cross-device link
> >
> > When source and destination are on different overlay filesystems.
> >
> > This change handles error with os.rename and retries with shutil.move.
> > The reason os.rename is still used is because shutil.move is too slow
> > for speed sensitive sections of code.
> > ---
> > meta/classes/sstate.bbclass | 22 ++++++++++++++++++----
> > 1 file changed, 18 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> > index f579168162..301dfc27db 100644
> > --- a/meta/classes/sstate.bbclass
> > +++ b/meta/classes/sstate.bbclass
> > @@ -384,6 +384,7 @@ def sstate_installpkg(ss, d):
> > def sstate_installpkgdir(ss, d):
> >     import oe.path
> >     import subprocess
> > +    import shutil
> >
> >     sstateinst =3D d.getVar("SSTATE_INSTDIR")
> >     d.setVar('SSTATE_FIXMEDIR', ss['fixmedir'])
> > @@ -401,7 +402,10 @@ def sstate_installpkgdir(ss, d):
> >
> >     for state in ss['dirs']:
> >         prepdir(state[1])
> > -        os.rename(sstateinst + state[0], state[1])
> > +        try:
> > +            os.rename(sstateinst + state[0], state[1])
> > +        except OSError:
> > +            shutil.move(sstateinst + state[0], state[1])
> >     sstate_install(ss, d)
> >
> >     for plain in ss['plaindirs']:
> > @@ -413,7 +417,10 @@ def sstate_installpkgdir(ss, d):
> >         dest =3D plain
> >         bb.utils.mkdirhier(src)
> >         prepdir(dest)
> > -        os.rename(src, dest)
> > +        try:
> > +            os.rename(src, dest)
> > +        except OSError:
> > +            shutil.move(src, dest)
> >
> >     return True
> >
> > @@ -638,6 +645,7 @@ python sstate_hardcode_path () {
> >
> > def sstate_package(ss, d):
> >     import oe.path
> > +    import shutil
> >
> >     tmpdir =3D d.getVar('TMPDIR')
> >
> > @@ -664,7 +672,10 @@ def sstate_package(ss, d):
> >                     continue
> >                 bb.error("sstate found an absolute path symlink %s poi=
nting at %s. Please replace this with a relative link." % (srcpath, link))
> >         bb.debug(2, "Preparing tree %s for packaging at %s" % (state[1=
], sstatebuild + state[0]))
> > -        os.rename(state[1], sstatebuild + state[0])
> > +        try:
> > +            os.rename(state[1], sstatebuild + state[0])
> > +        except OSError:
> > +            shutil.move(state[1], sstatebuild + state[0])
> >
> >     workdir =3D d.getVar('WORKDIR')
> >     sharedworkdir =3D os.path.join(d.getVar('TMPDIR'), "work-shared")
> > @@ -674,7 +685,10 @@ def sstate_package(ss, d):
> >             pdir =3D plain.replace(sharedworkdir, sstatebuild)
> >         bb.utils.mkdirhier(plain)
> >         bb.utils.mkdirhier(pdir)
> > -        os.rename(plain, pdir)
> > +        try:
> > +            os.rename(plain, pdir)
> > +        except OSError:
> > +            shutil.move(plain, pdir)
> >
> >     d.setVar('SSTATE_BUILDDIR', sstatebuild)
> >     d.setVar('SSTATE_INSTDIR', sstatebuild)
> > --
> > 2.29.2
> >
> >
> >> On 30 Mar 2021, at 08:10, Richard Purdie <richard.purdie@linuxfoundat=
ion.org> wrote:
> >>
> >> On Mon, 2021-03-29 at 16:00 -0700, Andre McCurdy wrote:
> >>> On Mon, Mar 29, 2021 at 3:45 PM Devendra Tewari
> >>> <devendra.tewari@gmail.com> wrote:
> >>>>
> >>>> Thanks! My bad. The example I looked up in Python docs had a break =
and I just realized it was a looping example.
> >>>>
> >>>> Here=E2=80=99s the updated patch (or should I submit it again via g=
it send-email?)
> >>>
> >>> It would be better to use shutil.move unconditionally in all cases,
> >>> rather than have a separate shutil.move code path which only gets
> >>> tested by people doing incremental builds in docker.
> >>
> >> This is a speed sensitive section of code and shutil has traditionall=
y proved
> >> to be slow so I disagree with that, rename is very much preferred her=
e where
> >> we can.
> >>
> >> Cheers,
> >>
> >> Richard
> >>
> >>
> >
>
>
>=20
>
