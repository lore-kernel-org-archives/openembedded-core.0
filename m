Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.9788.1624464145638465938
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jun 2021 09:02:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=F02fktHn;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id n20so4180049edv.8
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Jun 2021 09:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fW9JiE/1QWqUSDumDKtD0CNC0XbMgCuqNABeKaF04BY=;
        b=F02fktHncceb1j5SM3cFYv/gj1F2Oe8uPnCni1wd8XSo9WbOtNv2z6L7Vvtapvhc7H
         GbNAifnyRpVk2vEPRAkHToWT1ccHNHPaKx9sx25JxjdolbHbfv4NpHwyj/6EwV9JuJzN
         lR+0cv9giFEgxJSfWAmOs/4kGUGG0J9oKGSMm1QZW/CNXMPnXLG7tIkvdfl2K0V80ViI
         KxTFcj6UB50/xQCgtZe7NSLKJrve+GNQOropb4LBKaxXZYJ17R+4Vd77w6w4lYbi5TeK
         B1P/dkZapcLfdZKbvviC8AXCFNeGbkEAmxZX2NLujcw4Io74jqngylhMiJ54VTpISAeJ
         iXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fW9JiE/1QWqUSDumDKtD0CNC0XbMgCuqNABeKaF04BY=;
        b=jyxGoyz29wwCm3dtlhOhbIeGTkbiaN7gSl+8PVikh+WrD2mm3tqmUTeWXhZWRJ8snp
         iWKM8D1O3OErDkjpN6Eug3AxGZ4nDCtIoQh/lt3b34j4PPnqclRn7JROsH3ZUw20PdH8
         zfhbv32imuoEP8gIeL2q+2UcrTIbtsGz548nDTMPrRhaND7t2picY1VDZ4rF6gIW7QHI
         peWbuTeYxNq0+gMgO/KbgxBIcyM6+2h+woJZ+NKNmw9lgLqBnESOx8ysY2yQQQrbpLp2
         7Y8eSINPyhsbQrT3ZQEGmn0Y9SJKynm/ixRix5qghbFvlLXMLhFDyBUMCptd5zSgeevM
         9mgA==
X-Gm-Message-State: AOAM532lXoCTJYzG/TNfWG0NqZiaIREe4jDTK2HPMgd/wuUPZgqeiPYU
	X7XvTP6UZ0iysXw1KvaUo+8=
X-Google-Smtp-Source: ABdhPJwGS7z7v2uM4pjfYtJaR3FpBQy+C8D3XdlcFrvZK8cyFES2PEMQQ//IbcRm7eW5TNAiPSX+AA==
X-Received: by 2002:a05:6402:31a5:: with SMTP id dj5mr569032edb.229.1624464144233;
        Wed, 23 Jun 2021 09:02:24 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id f14sm255063edd.69.2021.06.23.09.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 09:02:23 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Jun 2021 18:02:22 +0200
To: Andrea Adami <andrea.adami@gmail.com>
Cc: Andrey Zhizhikin <andrey.z@gmail.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH 2/2] kernel.bbclass: inherit kernel_devicetree only if KERNEL_DEVICETREE is set
Message-ID: <20210623160222.ftqara6lcqmn4vgj@jama>
References: <20210622221818.4613-1-andrea.adami@gmail.com>
 <20210622221818.4613-2-andrea.adami@gmail.com>
 <e7a7a1a335404229b99a7815b2b6e15b@XBOX03.axis.com>
 <CAAQYJAtBoiaX180FxOKzXPwm0hciYQths0eOYiTRSyZypmdrkA@mail.gmail.com>
 <CAHtQpK5erwo++s8pLwHdkjbBvuwwZzNZb6ejjPvxx5g=w1dNdQ@mail.gmail.com>
 <CAAQYJAv9ear6oUz8c1c5QaFyMfxuVG7xN==dfpC+yXPQJNdgwg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAQYJAv9ear6oUz8c1c5QaFyMfxuVG7xN==dfpC+yXPQJNdgwg@mail.gmail.com>
X-Groupsio-MsgNum: 153244
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4pj76scsiaccc6um"
Content-Disposition: inline

--4pj76scsiaccc6um
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 23, 2021 at 05:22:21PM +0200, Andrea Adami wrote:
> On Wed, Jun 23, 2021 at 3:51 PM Andrey Zhizhikin <andrey.z@gmail.com> wr=
ote:
> >
> > Hello Andrea,
> >
> > On Wed, Jun 23, 2021 at 3:16 PM Andrea Adami <andrea.adami@gmail.com> =
wrote:
> > >
> > > On Wed, Jun 23, 2021 at 11:32 AM Peter Kjellerstedt
> > > <peter.kjellerstedt@axis.com> wrote:
> > > >
> > > > > -----Original Message-----
> > > > > From: openembedded-core@lists.openembedded.org <openembedded-
> > > > > core@lists.openembedded.org> On Behalf Of Andrea Adami
> > > > > Sent: den 23 juni 2021 00:18
> > > > > To: openembedded-core@lists.openembedded.org
> > > > > Subject: [OE-core][PATCH 2/2] kernel.bbclass: inherit kernel_dev=
icetree
> > > > > only if KERNEL_DEVICETREE is set
> > > > >
> > > > > Now it unconditionally tries to create package kernel-devicetre =
even for
> > > > > legacy devices w/out DT.
> > > > >
> > > > > Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> > > > > ---
> > > > >  meta/classes/kernel.bbclass | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.b=
bclass
> > > > > index 06e6446a08..68369e3791 100644
> > > > > --- a/meta/classes/kernel.bbclass
> > > > > +++ b/meta/classes/kernel.bbclass
> > > > > @@ -779,4 +779,4 @@ addtask deploy after do_populate_sysroot
> > > > > do_packagedata
> > > > >  EXPORT_FUNCTIONS do_deploy
> > > > >
> > > > >  # Add using Device Tree support
> > > > > -inherit kernel-devicetree
> > > > > +inherit ${@ "" if d.getVar("KERNEL_DEVICETREE" =3D=3D "") else =
"kernel-devicetree" }
> > > >
> > > > That doesn't look correct. Don't you mean something like this:
> > > >
> > > > inherit ${@ "kernel-devicetree" if d.getVar("KERNEL_DEVICETREE") e=
lse "" }
> > > >
> > >
> > > As you prefer, I don't think bitbake has likely/unlikely optimizatio=
n.
> > > I took the style-example from line 6 where it reads
> > >
> > > KERNEL_DEPLOYSUBDIR ??=3D "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME"=
) =3D=3D
> > > "kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"
> > >
> > > I am for any option providing a guard.
> >
> > I guess you've missed the closing bracket in your statement, please
> > take a look at the comparison operator.
>=20
> The code as it is doesn't raise any parse error.
> There is opening bracket and closing bracket, what more?

d.getVar("KERNEL_DEVICETREE" =3D=3D "")
vs
d.getVar("KERNEL_DEVICETREE") =3D=3D ""

> We can discuss about the form, someone suggested anonymous python for
> both patches.
>=20
> Thanks for reviewing
> A.A.
>=20
> >
> > As yet another option, maybe even something like this:
> > inherit ${@oe.utils.ifelse(d.getVar('KERNEL_DEVICETREE') =3D=3D '', ''=
,
> > 'kernel-devicetree')}
> >
> > However, I'm not sure what would happened if KERNEL_DEVICETREE is
> > undefined, as in this case bitbake should return "None" according to
> > the documentation.
> >
> > >
> > > Cheers
> > > A.A.
> > >
> > >
> > > > > --
> > > > > 2.17.1
> > > >
> > > > //Peter
> > > >
> > >
> > >=20
> > >
> >
> >
> > --
> > Regards,
> > Andrey.

>=20
>=20
>=20


--4pj76scsiaccc6um
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYNNbDQAKCRA3VSO3ZXaA
HGV3AJ9BcUsXdx0ySr63HuaXq4KOH8qRWwCfcoqBR8LmjxcZLjj6mPoZgCA3dps=
=Du8Q
-----END PGP SIGNATURE-----

--4pj76scsiaccc6um--
