Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web11.77.1598978047075101284
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 09:34:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fLFLD/Ny;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id nv17so888159pjb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2020 09:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BhodZ5EiGxr3138noGwt3F0DIylS/vHUYzBwDI8X72g=;
        b=fLFLD/NyQZgo/Y3toM/+YaKIhlpPGO+fE+nEK6nZLlF7Gk3zcueCs2saWMyT9TKwKh
         i1ExowBpuJuTOwtdmtocKc+ca0pp6IzGPTGSD9LGKzzmL8tDDLaM+Om34a5AWzUxEhLX
         27JAFgTTiTDCW32EA0G6/Ac5gcMe7h5v4uKBzV+BtLwsFIAzCGSleaFte2+0hElRPgxK
         Ahfxvqo7Emtu8Z3Kxq7YxFw59c0OaGcHgljNF+9tjurnGOcGNYxyE291+M1I9rFlk++L
         2vfQ2y7hsbWnRdGjEEz5FxpTVTb2dYdQs8VtkJPdlK0DVgVbb2omXgIxZPUPuBA4t4Mm
         nxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BhodZ5EiGxr3138noGwt3F0DIylS/vHUYzBwDI8X72g=;
        b=r+++kNfeguyOW9Xo+E9wjeSU+xdFZRCcBaMklo0CzHwfgBOCZuGN8zjS0aBD+lYB2/
         194uzwtTlUgJ6v+1H4DqVSC4NlSpYKiZJPIh6tcE/Lto2em8y08Vvah4LOowfmpM+sk5
         03A75ecv9GPjIIjoQS0MjUDwS4jbzuSjvzYx/4GacYvzqar4xoLv8ksCLRENhEAoruyH
         VI21VZAz0foUgt6CemlouOJwyf/g8FgQo6t0ng9OcWnOCS4tTeIqBcGJjNl25BpR+zZa
         XR01uqRA22jFUul3PNbpSaz+ApMbsENlEl/43Uv7MC2hPga0tWP59Khrw1+w/nv8au1P
         eLeA==
X-Gm-Message-State: AOAM531aJnbBnr8Hvk++spqaUhr6nD5YP/vjIbLL5H45ke6cbUllfXGt
	v/jl/+u0NtJLX9PqvewaY4DsX3f4+9i1oMEOWCU=
X-Google-Smtp-Source: ABdhPJxXBf4/2h8nGMnSVcAGXDzJQN0dEMiTRuV0PN/a4/PaGyn0YWFM5i31j3HdJDCnvk3G7E+OXLOCLf5qAKB0C+k=
X-Received: by 2002:a17:902:a70c:: with SMTP id w12mr2123124plq.80.1598978046530;
 Tue, 01 Sep 2020 09:34:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200320180420.32303-1-pkj@axis.com> <16025BE698C394B5.19764@lists.openembedded.org>
 <16090558444D87E6.18576@lists.openembedded.org> <16130CCABBD4F064.18282@lists.openembedded.org>
 <1617D89C6070B90C.14082@lists.openembedded.org> <737d657e7eb7486fa2d0f1dbbbbad07f@XBOX03.axis.com>
In-Reply-To: <737d657e7eb7486fa2d0f1dbbbbad07f@XBOX03.axis.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Tue, 1 Sep 2020 18:33:55 +0200
Message-ID: <CALbNGRRrk-BYdw=7kmhZzw4H7wByXPdvCc==tNvJaeQhUT+zig@mail.gmail.com>
Subject: Re: [OE-core] [master][zeus][PATCH] relocatable.bbclass: Avoid an exception if an empty pkgconfig dir exist
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Steve Sakoman <steve@sakoman.com>, akuster <akuster808@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 17, 2020 at 3:50 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> This has been integrated to master now (commit f9c5df6d).
> Please cherry-pick it to Dunfell and Zeus.
>
> //Peter
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> > Sent: den 12 juni 2020 18:26
> > To: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [master][zeus][PATCH] relocatable.bbclass: Avoid
> > an exception if an empty pkgconfig dir exist
> >
> > *ping* *ping* *ping* *ping*
> >
> > Ok, it was only two weeks since I pinged this the last time, but
> > since I'm going on vacation in a week I thought I'd give it a shot
> > before then. I am still waiting for any kind of reaction to this
> > patch...
> >
> > //Peter
> >
> > > -----Original Message-----
> > > From: openembedded-core@lists.openembedded.org <openembedded-
> > > core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> > > Sent: den 28 maj 2020 03:26
> > > To: openembedded-core@lists.openembedded.org
> > > Subject: Re: [OE-core] [master][zeus][PATCH] relocatable.bbclass: Avoid
> > > an exception if an empty pkgconfig dir exist
> > >
> > > *ping* *ping* *ping*
> > >
> > > I am not sure why this is being ignored. It is two months since I
> > > first sent it and the third time I ping it. I have not received any
> > > objections, yet it has never made it even to master-next as far as
> > > I know.
> > >
> > > This should not be taken as a complaint. I know there has been
> > > problems with the autobuilder and that patch integration has been
> > > slowed, and during this time all other patches I have sent have
> > > been applied on the first try. So it just seems to be this one that
> > > has been left out, and I would like to know if there is a reason or
> > > if it just has fallen between the cracks.
> > >
> > > //Peter
> > >
> > > PS. The patch of course applies to Dunfell now too in addition to
> > > master and Zeus since it has been released in the meantime.
> > >
> > > > -----Original Message-----
> > > > From: openembedded-core@lists.openembedded.org <openembedded-
> > > core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> > > > Sent: den 25 april 2020 11:17
> > > > To: openembedded-core@lists.openembedded.org
> > > > Subject: Re: [OE-core] [master][zeus][PATCH] relocatable.bbclass:
> > Avoid
> > > an exception if an empty pkgconfig dir exist
> > > >
> > > > *ping again*
> > > >
> > > > //Peter
> > > >
> > > > > -----Original Message-----
> > > > > From: openembedded-core@lists.openembedded.org <openembedded-
> > > core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> > > > > Sent: den 3 april 2020 18:24
> > > > > To: openembedded-core@lists.openembedded.org
> > > > > Subject: Re: [OE-core] [master][zeus][PATCH] relocatable.bbclass:
> > > Avoid an exception if an empty pkgconfig dir exist
> > > > >
> > > > > *ping*
> > > > >
> > > > > //Peter
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: openembedded-core-bounces@lists.openembedded.org
> > > <openembedded-core-bounces@lists.openembedded.org> On Behalf Of Peter
> > > Kjellerstedt
> > > > > > Sent: den 20 mars 2020 19:04
> > > > > > To: openembedded-core@lists.openembedded.org
> > > > > > Subject: [OE-core] [master][zeus][PATCH] relocatable.bbclass:
> > Avoid
> > > an exception if an empty pkgconfig dir exist
> > > > > >
> > > > > > Rewrite relocatable_native_pcfiles() so that it can handle that
> > any
> > > of
> > > > > > the checked pkgconfig directories are empty without causing an
> > > > > > exception.
> > > > > >
> > > > > > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > > > > ---
> > > > > >  meta/classes/relocatable.bbclass | 20 +++++++++++---------
> > > > > >  1 file changed, 11 insertions(+), 9 deletions(-)
> > > > > >
> > > > > > diff --git a/meta/classes/relocatable.bbclass
> > > b/meta/classes/relocatable.bbclass
> > > > > > index 582812c1cf..af04be5cca 100644
> > > > > > --- a/meta/classes/relocatable.bbclass
> > > > > > +++ b/meta/classes/relocatable.bbclass
> > > > > > @@ -6,13 +6,15 @@ python relocatable_binaries_preprocess() {
> > > > > >      rpath_replace(d.expand('${SYSROOT_DESTDIR}'), d)
> > > > > >  }
> > > > > >
> > > > > > -relocatable_native_pcfiles () {
> > > > > > -     if [ -d ${SYSROOT_DESTDIR}${libdir}/pkgconfig ]; then
> > > > > > -             rel=${@os.path.relpath(d.getVar('base_prefix'),
> > > d.getVar('libdir') + "/pkgconfig")}
> > > > > > -             sed -i -e "s:${base_prefix}:\${pcfiledir}/$rel:g"
> > > ${SYSROOT_DESTDIR}${libdir}/pkgconfig/*.pc
> > > > > > -     fi
> > > > > > -     if [ -d ${SYSROOT_DESTDIR}${datadir}/pkgconfig ]; then
> > > > > > -             rel=${@os.path.relpath(d.getVar('base_prefix'),
> > > d.getVar('datadir') + "/pkgconfig")}
> > > > > > -             sed -i -e "s:${base_prefix}:\${pcfiledir}/$rel:g"
> > > ${SYSROOT_DESTDIR}${datadir}/pkgconfig/*.pc
> > > > > > -     fi
> > > > > > +relocatable_native_pcfiles() {
> > > > > > +     for dir in ${libdir}/pkgconfig ${datadir}/pkgconfig; do
> > > > > > +             files_template=${SYSROOT_DESTDIR}$dir/*.pc
> > > > > > +             # Expand to any files matching $files_template
> > > > > > +             files=$(echo $files_template)
> > > > > > +             # $files_template and $files will differ if any
> > > files were found
> > > > > > +             if [ "$files_template" != "$files" ]; then
> > > > > > +                     rel=$(realpath -m --relative-to=$dir
> > > ${base_prefix})
> > > > > > +                     sed -i -e
> > > "s:${base_prefix}:\${pcfiledir}/$rel:g" $files
> > > > > > +             fi
> > > > > > +     done
> > > > > >  }
> > > > > > --
> > > > > > 2.21.1
> > > > >
> > > > > //Peter
Bisected it: Since this one is in dunfell I am unable to build on
autobuilder. I see

|  virtual:native:/home/jenkins/workspace/Weekly-4-MT310s2-COM5003/sources/openembedded-core/meta/recipes-extended/libnsl/libnsl2_git.bb:do_compile
|  virtual:native:/home/jenkins/workspace/Weekly-4-MT310s2-COM5003/sources/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_compile
|  virtual:native:/home/jenkins/workspace/Weekly-4-MT310s2-COM5003/sources/meta-openembedded/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.17.bb:do_compile

Makefile says (don't have *.pc at the moment):

LIBUSB_CFLAGS =
-I/home/jenkins/workspace/Weekly-4-MT310s2-COM5003/build/tmp-glibc/work/x86_64-linux/libmtp-native/1.1.17-r0/recipe-sysroot-native/usr/lib/pkgconfig//usr/include/libusb-1.0
LIBUSB_LIBS = -L/home/jenkins/workspace/Weekly-4-MT310s2-COM5003/build/tmp-glibc/work/x86_64-linux/libmtp-native/1.1.17-r0/recipe-sysroot-native/usr/lib/pkgconfig//usr/lib
-lusb-1.0

so libusb.h is not found (yes the path is wrong). Why do we replace by
${pcfiledir} exactly?

Andreas
