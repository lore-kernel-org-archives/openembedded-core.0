Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.245.1614104007495723929
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Feb 2021 10:13:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f9h/Ugqj;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: zbodek@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id t11so35932663ejx.6
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Feb 2021 10:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mGaBt1z4C21lypDB/ljj75JWfk9hV/A97G102rQ9jnc=;
        b=f9h/UgqjKIsjBSqnwnl2EdG12hfxrJ4/4SHvYQW0HjbESbTOjd4paeGF27o1gXtjnY
         0vpuz9/XR34JjWs91iP3cYqIOJ/8TByxvAawloNMARE0i/j5gzFEm0pnN+cKImSwn+MT
         heXWMzKW5MEPUBc6XPIHGOCHK4WlJuiAMhuoyxel5f4084v2mJdd4/EQfsIRoO26HWZg
         +zknAwwULQgEPFg2+L8FgkoYQnSq4X8gdDWTN0K0uP1r7RxP0ZKaBx4MkmgQGHI/wNXj
         kxEke2pgONBH9WjHFdcbMOxTokN3S3G0htHT00Uec7oyrc6z9XOzTOc5XkLWjOiaHSpH
         SKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mGaBt1z4C21lypDB/ljj75JWfk9hV/A97G102rQ9jnc=;
        b=r7brFqpn2T9sFsuMT5XMLTQd6a9cEJbn3aTSVe2yJqVK1oi84iarqtGwic5LLMFdE1
         jWqkpjhdllLnt+MTWBBg5L4ULhDGlyXpFsfPN51LmtfUR1N2ObU6pA0K9AkI0hTU8QTM
         bgD9V/d6DdlC95Uwz/iIop+EE1VsTfGQ73ASkl0naYclfuwNxo3HdyHmSwLvl9owcjmg
         xiA0aO1k0T+tB71e++8r1ZWZv/+uyE/Y6jzujdMffQg9V5hR9rDlEzilbRoJC90LHIAW
         dDSZZtc+LR6rKsYK1GCGgLbyGs+79bvvDqh5kkHpjEpciTlenHwUJUSHHgE6wKBEyZ57
         MBMg==
X-Gm-Message-State: AOAM530blPSqHbeyjGtXYaVacZSxx/Pch9yEMTQCF+ZnFOF4wd9fRlXA
	x6UsoTILDMXVY8bklGK71M232kKPXF7lUxkt7io=
X-Google-Smtp-Source: ABdhPJyndy+JACoonsK6ec5E2mAYRTgy3LD8OnlAydAKVhwXoM6MVWadbchjGxV8RSl4B/wD5RIK/NoSaYqS77wpKtM=
X-Received: by 2002:a17:906:a293:: with SMTP id i19mr2114203ejz.267.1614104005801;
 Tue, 23 Feb 2021 10:13:25 -0800 (PST)
MIME-Version: 1.0
References: <166535D1ACD90C64.29685@lists.openembedded.org>
 <CALF_Tx=HuN128b_jKfo_rCxYepLMQa-k1TGfV2b9hiXtf4W4tw@mail.gmail.com> <8dd288691c4ec3dc0843a365cd45fa50102d0e99.camel@intel.com>
In-Reply-To: <8dd288691c4ec3dc0843a365cd45fa50102d0e99.camel@intel.com>
From: "Zbigniew Bodek" <zbodek@gmail.com>
Date: Tue, 23 Feb 2021 19:13:14 +0100
Message-ID: <CALF_Tx=o7ZSZGT49+HomCVoWmJOSFBkARamOZpXKtzm04JhpRA@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] wpebackend-fdo: Fix missing .so symlink when using dev package
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"andrei.gherzan@huawei.com" <andrei.gherzan@huawei.com>, 
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, "steve@sakoman.com" <steve@sakoman.com>, 
	"wojciech.zmuda@huawei.com" <wojciech.zmuda@huawei.com>, 
	"zbigniew.bodek@huawei.com" <zbigniew.bodek@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Anuj,

I just checked and yes, it's needed for gatesgarth too.

Kind regards
Zbigniew

wt., 23 lut 2021 o 16:33 Mittal, Anuj <anuj.mittal@intel.com> napisa=C5=82=
(a):
>
> Is this change needed for the version in gatesgarth too?
>
> Thanks,
>
> Anuj
>
> On Tue, 2021-02-23 at 13:24 +0100, Zbigniew Bodek wrote:
> > Any comments, questions, remarks to that?
> >
> > Kind regards
> > Zbigniew
> >
> > pt., 19 lut 2021 o 18:20 Zbigniew Bodek via lists.openembedded.org
> > <zbodek=3Dgmail.com@lists.openembedded.org> napisa=C5=82(a):
> > >
> > > From: Zbigniew Bodek <zbigniew.bodek@huawei.com>
> > >
> > > Problem spotted on dunfell-23.0.4
> > >
> > > Normally, unversioned .so is removed from -dev (default) package
> > > however it is still being referred by other agents, such as
> > > webkitgtk.
> > > That can be observed while executing i.e. Epiphany Browser.
> > >
> > > For instance:
> > > platformInitializeWebProcess()
> > > calls
> > > wpe_loader_init("libWPEBackend-fdo-1.0.so")
> > >
> > > as a result one can see:
> > > --------------------
> > > wpe_loader_init could not load the library 'libWPEBackend-fdo-
> > > 1.0.so':
> > > libWPEBackend-fdo-1.0.so: cannot open shared object file:
> > > No such file or directory
> > > --------------------
> > >
> > > "master" branch contains a bumped-up version of webkitgtk
> > > to which this issue does not apply (the code has changed).
> > >
> > > Forcefully keep this .so symlink to resolve the problem in dunfell.
> > >
> > > Signed-off-by: Zbigniew Bodek <zbigniew.bodek@huawei.com>
> > > ---
> > >  meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
> > > b/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
> > > index cd2f7fabda..165fc74dde 100644
> > > --- a/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
> > > +++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
> > > @@ -15,3 +15,6 @@ REQUIRED_DISTRO_FEATURES =3D "opengl"
> > >  SRC_URI =3D "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
> > >  SRC_URI[sha256sum] =3D
> > > "6249a0b7cbfa662206a8d2fa24e2c574e75c681ad0e93468091f1dc68ddb299d"
> > >
> > > +FILES_${PN} +=3D "${libdir}/libWPEBackend-fdo-1.0.so"
> > > +FILES_SOLIBSDEV =3D ""
> > > +INSANE_SKIP_${PN} +=3D "dev-so"
> > > --
> > > 2.17.1
> > >
> > >
> > >
> > >
> >
> >=20
> >
>
