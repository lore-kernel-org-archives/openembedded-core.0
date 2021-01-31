Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web12.16362.1612086921380145637
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jan 2021 01:55:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GNl1WZXc;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id f1so15422790edr.12
        for <openembedded-core@lists.openembedded.org>; Sun, 31 Jan 2021 01:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xmslhAeTS63yYB/rR9mBcfMNgRz3L3xQyngzBnepEDA=;
        b=GNl1WZXc2q2Ab5q9fxDuvQ03WNvrODLOs/BA4QSMYFlwee0xyQEa6CfGIhKEz5UTSF
         M3KNF/5vfUtfylCrpsMHLSQBUoV0KNLdrOM2D9fva5meHH4tuweEXFeIJ35ts8AmCBBP
         cHhd2hJ2vEh0Or7OknOTRVwQh2RGtgvfQm3uj3AoglTTQCJsP8BjweFmp3KiUrlfJZ/w
         L3zkUQvIdZXYFy8LWPQI0FTHwCvwVFv1/A9vkktLYqvQhFmJrXLy9COye3NR5/q1OhSy
         Qrh3rvLDITVfSvDZanWj4xzhWX7QtV9rqDdNuJBU+ZtR2hUDgEa+dDfEUAoYWOXcVmGw
         UF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xmslhAeTS63yYB/rR9mBcfMNgRz3L3xQyngzBnepEDA=;
        b=sny6+inQKbAMIlafxmN4fN5KqF1/EC2YHUx5scgbQJ1sHV5lZrUuTSDWJyXCwm/yCw
         8SFoW7wPM/j9xmK+yY8cIMqk/qo6XPK06pxomsahBAVXepn4mKcQtAF6uHmn6+1qm0Zp
         HbIg3+Ot9lFTkH68IWy0TZ0UNC/Y0fx43/++EPtEG2EHMS31oJ0XnFH+crgHZ9fpi3mK
         qMlRBNqIn5uUZDQUPYt5P5AqO+wjBoMDEioHWFwVhT8eRyowwgVn/JEqFIEHU76gzgbU
         BiVGICHxF9akg+c/QimQSMdCUWNKhRHm8A4bFdgd8lueOzgMswkBtEMaAPG3boRd6D5v
         4F3w==
X-Gm-Message-State: AOAM533u390XmgoEcV3qmtXdSjZFFMt/ralB7bk9XVi3oq6NwB7ueL6L
	497K4UkdFoLhncl/jaIEDMg=
X-Google-Smtp-Source: ABdhPJwqaziFkC4ieHlbkQsMEdv74H3RQc+z2pAxma4DG25ZUK38dErPdtcPCio8YFrlZQ9ZB5JGaw==
X-Received: by 2002:a05:6402:1b91:: with SMTP id cc17mr13903066edb.259.1612086919769;
        Sun, 31 Jan 2021 01:55:19 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id qq23sm6190417ejb.5.2021.01.31.01.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 01:55:18 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 31 Jan 2021 10:55:18 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 6/7] native: Stop clearing PACKAGES
Message-ID: <20210131095518.iqqi2lrx7n5b2csp@jama>
References: <20210127172753.1286275-1-richard.purdie@linuxfoundation.org>
 <20210127172753.1286275-6-richard.purdie@linuxfoundation.org>
 <CA+chaQdc7P6NsTno6oCcB4HmoseMziAXA57f646=YWWDPyEH8w@mail.gmail.com>
 <d29734c79a8d5712f4c2cc720e11071dedb68383.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <d29734c79a8d5712f4c2cc720e11071dedb68383.camel@linuxfoundation.org>
X-Groupsio-MsgNum: 147484
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3ezafj45shserxdk"
Content-Disposition: inline

--3ezafj45shserxdk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 31, 2021 at 09:07:50AM +0000, Richard Purdie wrote:
> On Sat, 2021-01-30 at 17:15 +0100, Martin Jansa wrote:
> >=20
> >=20
> > On Wed, Jan 27, 2021 at 6:28 PM Richard Purdie <
> > richard.purdie@linuxfoundation.org> wrote:
> > > Some now unneeded code in python3-setuptools is dropped, there are
> > > further
> > > changes like this which can follow.
> > >=20
> > > This change was verified with OE-Core by comparing task-depends.dot
> > > generated
> > > by "bitbake world -g" before and after the change, the files were
> > > identical.
> > >=20
> > > diff --git a/meta/recipes-
> > > devtools/python/python3-setuptools_51.0.0.bb b/meta/recipes-
> > > devtools/python/python3-setuptools_51.0.0.bb
> > > index 6ee935f8f79..db336bfa13b 100644
> > > --- a/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb
> > > +++ b/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb
> > > @@ -58,8 +58,3 @@ RDEPENDS_${PYTHON_PN}-pkg-resources =3D "\
> > > =A0 =A0${PYTHON_PN}-plistlib \
> > > =A0 =A0${PYTHON_PN}-pprint \
> > > =A0"
> > > -# Due to the way OE-Core implemented native recipes, the native
> > > class cannot
> > > -# have a dependency on something that is not a recipe name. Work
> > > around that by
> > > -# manually setting RPROVIDES.
> > > -RDEPENDS_${PN}_append =3D " ${PYTHON_PN}-pkg-resources"
> > > -RPROVIDES_append_class-native =3D " ${PYTHON_PN}-pkg-resources-
> > > native"
> > >=20
> > =A0
> > The runtime dependency on=A0${PYTHON_PN}-pkg-resources isn't needed
> > anymore? I don't see how it would get still included as you said that
> > bitbake -g files were the same.
>=20
> I think you're right and I shouldn't have removed the RDEPENDS, only
> the RPROVIDES. bitbake -g are task dependencies and the task
> dependencies still showed up so this didn't highlight any issue.
>=20
> I'll test a patch to fix that and add it back, probably in the main
> RDEPENDS list.

OK, I've sent similar fix for meta-python2:
https://lists.openembedded.org/g/openembedded-devel/message/89200

> > I'm asking because meta-python2 has the same issue in:
> > https://git.openembedded.org/meta-python2/tree/recipes-devtools/python/=
python-setuptools.inc#n49
> >=20
> > and my fix I was planing to send was to replace it with:
> > RDEPENDS_${PN}_append_class-target =3D " ${PYTHON_PN}-pkg-resources"
> > and drop the RPROVIDES, because it unfortunately causes bitbake to
> > get stuck after reporting parsing error as:
> >=20
> > ERROR: meta-python2/recipes-devtools/python/python-
> > setuptools_42.0.2.bb: QA Issue: meta-python2/recipes-
> > devtools/python/python-setuptools_42.0.2.bb: Variable RPROVIDES is
> > set as not being package specific, please fix this. [pkgvarcheck]
> > ERROR: meta-python2/recipes-devtools/python/python-
> > setuptools_42.0.2.bb: Fatal QA errors found, failing task.
> > ERROR: Failed to parse recipe: meta-python2/recipes-
> > devtools/python/python-setuptools_42.0.2.bb
>=20
> Are you saying that it does that with the RPROVIDES removed? That seems
> odd :/

No, this was before removing RPROVIDES in meta-python2, I was just
surprised that bitbake got stuck after reporting parsing failure, I'm
seeing bitbake getting stuck in dunfell builds quite often, but don't
remember seeing it with gatesgarth and newer (and was believing that you
have already fixed most if not all cases there). But it's also true that
our jenkins runs 1000x more builds based on dunfell, so it's much more
likely to happen there.

Cheers,

--3ezafj45shserxdk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYBZ+hAAKCRA3VSO3ZXaA
HGdzAJ48xD698xlRSg6CvinwlBwvz0ANGACgiGULLwBRXDMUZgSPZOf/znEXFdg=
=tllZ
-----END PGP SIGNATURE-----

--3ezafj45shserxdk--
