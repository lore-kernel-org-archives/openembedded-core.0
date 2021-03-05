Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web09.10688.1614945053361796386
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 03:50:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ux4uMDqX;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id b7so2164209edz.8
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 03:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6sZR1yfPiG7f6ylz6B/iu9BaIRl36OcqZbjw7erNJ+Q=;
        b=ux4uMDqXquNwOy8mI82QddxjPnHuLqF268a8a1ulViNte4YRfrFFn5D5ctjWl3J0u7
         d5akWNzt0s5es/h0LYCnzGDfMfDPk4xoqmawfFTyHOxNG66Z8hqCHuau2B35fAvTwVNv
         qWBoNi8tmWOWYZKIRbF9Xp36W3FkB2kymy85crJ+/xgMf7nMH/IsquhUcZ8ddzDWC3y4
         6o/hFyQtU0JM0LPu619w4aPg2HPrYDhMUYZn+ujpaEHFld55b/cgNIfp+2u9xgLsATDw
         juV7fy7cBYLHV0K2/fR7ZVrHyDnQDc7fPBGnP1o6ATKyIFlP9aUnglhZ1YsdRWBX7dG8
         rMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6sZR1yfPiG7f6ylz6B/iu9BaIRl36OcqZbjw7erNJ+Q=;
        b=RcPxHmsiyk8E9aZgbHd89lIqtSlGnoPj53G8AtkFE/v9frd5dHkOJhJAIGakU6nBUj
         ixJbl/BlUSAAuidg/NFpyEF92OMFYJ10xgQ88kgraJSIogw5Ix0LmeMxmF7+7EEYCfXo
         xq2vuXIaXFYT7p22S0Au+z9NHevfEmnEErqsr4awVdB+hqUmt+zQhTaChqSWCQcpDIYH
         0bdbhb/fBDjYiAlOGMh5s6h+cWFuPeQVpH4+YCAZDCzqEGfzwjnX01iOyuBtbVAuakq3
         YG5X4R8U+fi8OoK5jpjtv3+zy1qF+RTMcFvTayBr6BcCKPeKxAhid+sMAX6tAcvG9zoo
         YDLg==
X-Gm-Message-State: AOAM530ExLdmVJPBi2PoKREXOuMXVyUOMqjf/NXqzJtE66ucpuNDNdc2
	Sv7Ky7HJcjaIC0oMemwUeKs=
X-Google-Smtp-Source: ABdhPJz4U7tW8+8LL3MafVi942mgLabzlSREo9RMukVAv2+Zk8GPBWSCEQt/tucQqsyHoeytY+9mIQ==
X-Received: by 2002:a05:6402:34c4:: with SMTP id w4mr9044914edc.367.1614945051723;
        Fri, 05 Mar 2021 03:50:51 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id dg26sm1473876edb.88.2021.03.05.03.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 03:50:51 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 5 Mar 2021 12:50:50 +0100
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	"anibal.limon@linaro.org" <anibal.limon@linaro.org>,
	"geoffhp@gmail.com" <geoffhp@gmail.com>
Subject: Re: [OE-core] [PATCH] glib-2.0: call os.path.normpath on THISDIR
Message-ID: <20210305115050.chhf5zf357wns3xl@jama>
References: <20210302193229.175044-1-Martin.Jansa@gmail.com>
 <16696CDA6651CD2C.16425@lists.openembedded.org>
 <0c5fb27d35c142d488642d21d24a37c4@XBOX03.axis.com>
MIME-Version: 1.0
In-Reply-To: <0c5fb27d35c142d488642d21d24a37c4@XBOX03.axis.com>
X-Groupsio-MsgNum: 149026
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nirhoqt4srjfbpja"
Content-Disposition: inline

--nirhoqt4srjfbpja
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 05, 2021 at 11:20:11AM +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists=
=2Eopenembedded.org> On Behalf Of Peter Kjellerstedt
> > Sent: den 5 mars 2021 11:54
> > To: Martin Jansa <Martin.Jansa@gmail.com>; openembedded-core@lists.open=
embedded.org
> > Cc: anibal.limon@linaro.org; geoffhp@gmail.com
> > Subject: Re: [OE-core] [PATCH] glib-2.0: call os.path.normpath on THISD=
IR
> >=20
> > > -----Original Message-----
> > > From: openembedded-core@lists.openembedded.org <openembedded-core@lis=
ts.openembedded.org> On Behalf Of Martin Jansa
> > > Sent: den 2 mars 2021 20:32
> > > To: openembedded-core@lists.openembedded.org
> > > Cc: anibal.limon@linaro.org; geoffhp@gmail.com; Martin Jansa <Martin.=
Jansa@gmail.com>
> > > Subject: [OE-core] [PATCH] glib-2.0: call os.path.normpath on THISDIR
> > >
> > > * some build environments have relative paths in THISDIR, e.g. from O=
EROOT set in:
> > >   https://github.com/96boards/oe-rpb-manifest/blob/1e3345c26c56f77f3a=
15a3978f412a25955d2606/conf/bblayers.conf#L4
> > >   and then the paths in filename normalized in:
> > >   filename =3D os.path.normpath(os.path.join(path, meson.cross.d, ele=
ment))
> > >   don't match.
> > >
> > > * COREBASE used here before didn't have this issue because the value =
is already
> > >   normalized when set in:
> > >   meta/conf/layer.conf:COREBASE =3D
> > '${@os.path.normpath("${LAYERDIR}/../")}'
> >=20
> > That is not the only problem with the change to use ${THISDIR}. We get=
=20
> > a million errors because we have bbappend files for glib-2.0. This is=
=20
> > because bitbake will now give an error for any potential cross-files=20
> > from those layers, regardless if they exist or not (they don't).
> >=20
> > I will send a patch that I believe solves this in a way that also=20
> > avoids the need for the bb.error().
> >=20
> > //Peter
>=20
> Actually, thinking a bit more on this, I believe that with my patch=20
> applied, this patch should _not_ be applied. That is because it makes=20
> the paths relative to thisdir, but then uses ${THISDIR} when using=20
> them. Thus if thisdir is normalized, it may no longer match ${THISDIR}=20
> and the relative paths will not work as intended.

I'm sorry I've tested and wrote that part of commit message when I had
if os.path.exists(filename):
at the beginning of this whole section, which I've then re-wrote to just
store only existing filenames in files as a list instead of a map (to
simplify the rest of this function as well), but then I was wondering
why Ross used the map in the initial implementation here:
https://git.openembedded.org/openembedded-core/commit/?id=3D5acd9cbc9d5c635=
5010775250fb25f043441c5cd
and assumed it was needed to get all possible filenames in
do_configure[file-checksums] in case they are created later.

So I've removed all my cleanups and returned to smallest change to just
replace COREBASE with THISDIR.

What about checking the existence before showing the error, that will
show an error only when matching file exists while keeping all
not-skipped paths in do_configure[file-checksums] even when they don't
exist yet.

Will send a patch for this shortly.

>=20
> //Peter
>=20
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
> > b/meta/recipes-
> > > core/glib-2.0/glib-2.0_2.66.7.bb
> > > index 882a89da7a..a2fa5345b4 100644
> > > --- a/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
> > > +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
> > > @@ -31,7 +31,7 @@ def find_meson_cross_files(d):
> > >      if bb.data.inherits_class('native', d):
> > >          return ""
> > >
> > > -    thisdir =3D d.getVar("THISDIR")
> > > +    thisdir =3D os.path.normpath(d.getVar("THISDIR"))
> > >      import collections
> > >      sitedata =3D siteinfo_data(d)
> > >      # filename -> found
> > > --
> > > 2.30.0
>=20

--nirhoqt4srjfbpja
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYEIbGAAKCRA3VSO3ZXaA
HBRRAJ9qTiRXV1JCsXOCHU4Y2e9lGRK78QCgr+qeYauOIhIsBU+0U3TrYCS8hy8=
=74wz
-----END PGP SIGNATURE-----

--nirhoqt4srjfbpja--
