Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web10.263.1598978502456566796
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 09:41:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bi26aWQY;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id h2so818550plr.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2020 09:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WbwOelYThrmaBpOetvCXzzdqn9CF2b4svgACTrxBLGw=;
        b=bi26aWQYnYwvnb6jNgJEaag9Cdne5h1CU7BiIb+FmwUyXswSh6BlUt9s5kz5qaHZad
         RMVRtzdKsRYkzrXAfjJ5f7EIrIta3Bxe8TBs+HPwdGfS/qo49VtvlzkaOlRkNEnU0h5O
         0A7VsQWZJkMoJKAJv1LP0WxtyJFQ8/sVD2e2S82cpInvckGno8hREmIpumaecV28b/pE
         G4XHC3ZWe8hhu5wWt32bO3q1gWR6M8qy3gVE7uIKXF6e/WR/hr2zkhJgYglcu5cZT0CY
         vilSPgSMVXaYUQ5EGOArJw5Jn7BFg2q28oNtie0tFYD6w+8bf1gKpYsqhB+D1eooYf6D
         F5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WbwOelYThrmaBpOetvCXzzdqn9CF2b4svgACTrxBLGw=;
        b=FBsLEnq2tZ5QAQhzKjH/uWvCESCUz71eiOkVyeNHiSX4oRF73lwkRkc/lVYyoTQxvE
         d9Jh6uH8LA7pCh4XjRFRyLFhwRIIIJaoO3xl7xRuQYfidsPQKuAE/likVY3A2mpZsVrT
         bc6fu+BrH+xjuS3rtCvRaaeBP3+qmFCGe8ddU9Yorut/Uin14/Ru237zT/KbbhjSIeU7
         4a3zKQA+vSGWiuMwt7jDQzi+VtUl1zr3OqofNmS2EwFXYs7kSWcV8fRuRuIUnD2cgjbi
         5n8g634+AsvO7bhNWIBChfBqcEFlbNw13ySLSDas/y5pe6+pTOUUUP6cJVYLAEZ3wrZG
         htuQ==
X-Gm-Message-State: AOAM530l5U+d/5NbKiiUCS2I4li0hjajs2RBV9ko2PQPl+J1dE6OWGOq
	LZ0nJbOktIF4QM5kVhD041tsieaQ3euoQiOhj3c=
X-Google-Smtp-Source: ABdhPJydNmSkm3kaecgrj5NWnqare/4N/68azykzoXvw3kk59sj0W4hyCDCpDfEtJ4uW3hc/WeXUbUQNtnOmjOhyHSA=
X-Received: by 2002:a17:902:aa91:: with SMTP id d17mr2110934plr.27.1598978501943;
 Tue, 01 Sep 2020 09:41:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200320180420.32303-1-pkj@axis.com> <16025BE698C394B5.19764@lists.openembedded.org>
 <16090558444D87E6.18576@lists.openembedded.org> <16130CCABBD4F064.18282@lists.openembedded.org>
 <1617D89C6070B90C.14082@lists.openembedded.org> <737d657e7eb7486fa2d0f1dbbbbad07f@XBOX03.axis.com>
 <CALbNGRRrk-BYdw=7kmhZzw4H7wByXPdvCc==tNvJaeQhUT+zig@mail.gmail.com>
In-Reply-To: <CALbNGRRrk-BYdw=7kmhZzw4H7wByXPdvCc==tNvJaeQhUT+zig@mail.gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Tue, 1 Sep 2020 18:41:30 +0200
Message-ID: <CALbNGRTQs+t3HVef60bNFMb-Z8pui8jDi2LiTFS6sUVN0WSMxw@mail.gmail.com>
Subject: Re: [OE-core] [master][zeus][PATCH] relocatable.bbclass: Avoid an exception if an empty pkgconfig dir exist
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Steve Sakoman <steve@sakoman.com>, akuster <akuster808@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2020 at 6:33 PM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>
> On Wed, Jun 17, 2020 at 3:50 AM Peter Kjellerstedt
> <peter.kjellerstedt@axis.com> wrote:
> >
> > This has been integrated to master now (commit f9c5df6d).
> > Please cherry-pick it to Dunfell and Zeus.
> >
> > //Peter
> >
> > > -----Original Message-----
> > > From: openembedded-core@lists.openembedded.org <openembedded-
> > > core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> > > Sent: den 12 juni 2020 18:26
> > > To: openembedded-core@lists.openembedded.org
> > > Subject: Re: [OE-core] [master][zeus][PATCH] relocatable.bbclass: Avo=
id
> > > an exception if an empty pkgconfig dir exist
> > >
> > > *ping* *ping* *ping* *ping*
> > >
> > > Ok, it was only two weeks since I pinged this the last time, but
> > > since I'm going on vacation in a week I thought I'd give it a shot
> > > before then. I am still waiting for any kind of reaction to this
> > > patch...
> > >
> > > //Peter
> > >
> > > > -----Original Message-----
> > > > From: openembedded-core@lists.openembedded.org <openembedded-
> > > > core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> > > > Sent: den 28 maj 2020 03:26
> > > > To: openembedded-core@lists.openembedded.org
> > > > Subject: Re: [OE-core] [master][zeus][PATCH] relocatable.bbclass: A=
void
> > > > an exception if an empty pkgconfig dir exist
> > > >
> > > > *ping* *ping* *ping*
> > > >
> > > > I am not sure why this is being ignored. It is two months since I
> > > > first sent it and the third time I ping it. I have not received any
> > > > objections, yet it has never made it even to master-next as far as
> > > > I know.
> > > >
> > > > This should not be taken as a complaint. I know there has been
> > > > problems with the autobuilder and that patch integration has been
> > > > slowed, and during this time all other patches I have sent have
> > > > been applied on the first try. So it just seems to be this one that
> > > > has been left out, and I would like to know if there is a reason or
> > > > if it just has fallen between the cracks.
> > > >
> > > > //Peter
> > > >
> > > > PS. The patch of course applies to Dunfell now too in addition to
> > > > master and Zeus since it has been released in the meantime.
> > > >
> > > > > -----Original Message-----
> > > > > From: openembedded-core@lists.openembedded.org <openembedded-
> > > > core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> > > > > Sent: den 25 april 2020 11:17
> > > > > To: openembedded-core@lists.openembedded.org
> > > > > Subject: Re: [OE-core] [master][zeus][PATCH] relocatable.bbclass:
> > > Avoid
> > > > an exception if an empty pkgconfig dir exist
> > > > >
> > > > > *ping again*
> > > > >
> > > > > //Peter
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: openembedded-core@lists.openembedded.org <openembedded-
> > > > core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> > > > > > Sent: den 3 april 2020 18:24
> > > > > > To: openembedded-core@lists.openembedded.org
> > > > > > Subject: Re: [OE-core] [master][zeus][PATCH] relocatable.bbclas=
s:
> > > > Avoid an exception if an empty pkgconfig dir exist
> > > > > >
> > > > > > *ping*
> > > > > >
> > > > > > //Peter
> > > > > >
> > > > > > > -----Original Message-----
> > > > > > > From: openembedded-core-bounces@lists.openembedded.org
> > > > <openembedded-core-bounces@lists.openembedded.org> On Behalf Of Pet=
er
> > > > Kjellerstedt
> > > > > > > Sent: den 20 mars 2020 19:04
> > > > > > > To: openembedded-core@lists.openembedded.org
> > > > > > > Subject: [OE-core] [master][zeus][PATCH] relocatable.bbclass:
> > > Avoid
> > > > an exception if an empty pkgconfig dir exist
> > > > > > >
> > > > > > > Rewrite relocatable_native_pcfiles() so that it can handle th=
at
> > > any
> > > > of
> > > > > > > the checked pkgconfig directories are empty without causing a=
n
> > > > > > > exception.
> > > > > > >
> > > > > > > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.co=
m>
> > > > > > > ---
> > > > > > >  meta/classes/relocatable.bbclass | 20 +++++++++++---------
> > > > > > >  1 file changed, 11 insertions(+), 9 deletions(-)
> > > > > > >
> > > > > > > diff --git a/meta/classes/relocatable.bbclass
> > > > b/meta/classes/relocatable.bbclass
> > > > > > > index 582812c1cf..af04be5cca 100644
> > > > > > > --- a/meta/classes/relocatable.bbclass
> > > > > > > +++ b/meta/classes/relocatable.bbclass
> > > > > > > @@ -6,13 +6,15 @@ python relocatable_binaries_preprocess() {
> > > > > > >      rpath_replace(d.expand('${SYSROOT_DESTDIR}'), d)
> > > > > > >  }
> > > > > > >
> > > > > > > -relocatable_native_pcfiles () {
> > > > > > > -     if [ -d ${SYSROOT_DESTDIR}${libdir}/pkgconfig ]; then
> > > > > > > -             rel=3D${@os.path.relpath(d.getVar('base_prefix'=
),
> > > > d.getVar('libdir') + "/pkgconfig")}
> > > > > > > -             sed -i -e "s:${base_prefix}:\${pcfiledir}/$rel:=
g"
> > > > ${SYSROOT_DESTDIR}${libdir}/pkgconfig/*.pc
> > > > > > > -     fi
> > > > > > > -     if [ -d ${SYSROOT_DESTDIR}${datadir}/pkgconfig ]; then
> > > > > > > -             rel=3D${@os.path.relpath(d.getVar('base_prefix'=
),
> > > > d.getVar('datadir') + "/pkgconfig")}
> > > > > > > -             sed -i -e "s:${base_prefix}:\${pcfiledir}/$rel:=
g"
> > > > ${SYSROOT_DESTDIR}${datadir}/pkgconfig/*.pc
> > > > > > > -     fi
> > > > > > > +relocatable_native_pcfiles() {
> > > > > > > +     for dir in ${libdir}/pkgconfig ${datadir}/pkgconfig; do
> > > > > > > +             files_template=3D${SYSROOT_DESTDIR}$dir/*.pc
> > > > > > > +             # Expand to any files matching $files_template
> > > > > > > +             files=3D$(echo $files_template)
> > > > > > > +             # $files_template and $files will differ if any
> > > > files were found
> > > > > > > +             if [ "$files_template" !=3D "$files" ]; then
> > > > > > > +                     rel=3D$(realpath -m --relative-to=3D$di=
r
> > > > ${base_prefix})
> > > > > > > +                     sed -i -e
> > > > "s:${base_prefix}:\${pcfiledir}/$rel:g" $files
> > > > > > > +             fi
> > > > > > > +     done
> > > > > > >  }
> > > > > > > --
> > > > > > > 2.21.1
> > > > > >
> > > > > > //Peter
> Bisected it: Since this one is in dunfell I am unable to build on
> autobuilder. I see
>
> |  virtual:native:/home/jenkins/workspace/Weekly-4-MT310s2-COM5003/source=
s/openembedded-core/meta/recipes-extended/libnsl/libnsl2_git.bb:do_compile
> |  virtual:native:/home/jenkins/workspace/Weekly-4-MT310s2-COM5003/source=
s/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:d=
o_compile
> |  virtual:native:/home/jenkins/workspace/Weekly-4-MT310s2-COM5003/source=
s/meta-openembedded/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.17.bb:do=
_compile
>
> Makefile says (don't have *.pc at the moment):
>
> LIBUSB_CFLAGS =3D
> -I/home/jenkins/workspace/Weekly-4-MT310s2-COM5003/build/tmp-glibc/work/x=
86_64-linux/libmtp-native/1.1.17-r0/recipe-sysroot-native/usr/lib/pkgconfig=
//usr/include/libusb-1.0
> LIBUSB_LIBS =3D -L/home/jenkins/workspace/Weekly-4-MT310s2-COM5003/build/=
tmp-glibc/work/x86_64-linux/libmtp-native/1.1.17-r0/recipe-sysroot-native/u=
sr/lib/pkgconfig//usr/lib
> -lusb-1.0
>
> so libusb.h is not found (yes the path is wrong). Why do we replace by
> ${pcfiledir} exactly?
>
Cross checked this with my local - more modern OS machine: That path
looks OK - seems I am in trouble with realpath...

Andreas
