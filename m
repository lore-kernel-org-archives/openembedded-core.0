Return-Path: <martin.jansa@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id EF9EC76FE2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 20:13:02 +0000 (UTC)
Received: by qgeo38 with SMTP id o38so124722386qge.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 13:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+09sm0G47icg9oKcAFctJb+LFECVdJiyTA7k0+qTM+g=;
	b=HcT8NL1pKT92WoI7Eqt4H+9UmxxbIpVkC7CsSAY2oCdgivq93iH6FX+e9noTJ0pujd
	bu2pChob0ORJaiElK3xvAQ63urZXuyUa4fGhbq9HBhBDqqQvOXsob5gOcK4mXjLs+ti8
	vnVe4qCU2McpyJ8D1DKbblJ2MCMKAv8L1v6v7upe8TUcjFWSy7mj2Fx0+ye6D+ZlAFA9
	pZVsHzQbEzVDsjmUvx51qSHxT/J35rSVp4XQVU/NbWb+8NGpMkcJhuewJ2iTjQ+L8Og2
	vrffWSmtmCn5sIa3wa8TRbKKAdYkB1d1B8kpbbyq5wwak5clni6La5xWcgYeCYW+YWl+
	Q2rw==
X-Received: by 10.180.92.201 with SMTP id co9mr14997737wib.9.1445285582144;
	Mon, 19 Oct 2015 13:13:02 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ht5sm16335404wib.10.2015.10.19.13.13.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Oct 2015 13:13:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 19 Oct 2015 22:13:08 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20151019201308.GA2872@jama>
References: <1444138615-5618-1-git-send-email-Martin.Jansa@gmail.com>
	<1445277812-3941-1-git-send-email-Martin.Jansa@gmail.com>
	<CAMKF1sqz7-0GYeuqR5foRyhDA4fFOgu1AS6PjscqqD66r3imrA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqz7-0GYeuqR5foRyhDA4fFOgu1AS6PjscqqD66r3imrA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][WIP[[PATCH] feature-arm-vfp.inc: respect vfpv4 when setting -mfloat-abi andARMPKGSFX_EABI
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Oct 2015 20:13:03 -0000
X-Groupsio-MsgNum: 72370
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Content-Disposition: inline

--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2015 at 12:40:05PM -0700, Khem Raj wrote:
> Why doesnt vfpv4 also imply vfp ? Isnt it a super set

As it's now adding it to TUNE_FEATURES it would duplicate -mfpu options
with different values, this change should probably cover vfpv3 and
vfpv3d16 as well as added in:

commit f9de9521477a1de8f6a399bcdc8260e28e34dfb3
Author: Andr=E9 Draszik <git@andred.net>
Date:   Fri Jul 24 14:14:30 2015 +0100

    arch-armv7a.inc, feature-arm-vfp.inc: add tunes for vfpv3 and
vfpv3d16

vfpv4 as separate TUNE_FEATURE was added in:

commit e97d152ca13556b41a236c1a4cfb11e77ff857d7
Author: Kristof Robot <krirobo@gmail.com>
Date:   Sun Jan 26 10:03:56 2014 +0100

    Add Cortex A7 support for NEONv2 & FPv4

So you should probably ask Kristof or Andre why they didn't include vfp
as well. I'm just trying to fix missing -mfloat-abi=3Dhard when switching f=
rom
vfp to vfpv4.

Regards,

> On Oct 19, 2015 11:03 AM, "Martin Jansa" <martin.jansa@gmail.com> wrote:
>=20
> > * without this change it wasn't possible to use call-convention hard
> >   together with vfpv4
> > * also use ' inside quoted values
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/conf/machine/include/arm/feature-arm-vfp.inc | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc
> > b/meta/conf/machine/include/arm/feature-arm-vfp.inc
> > index 13927ff..440950a 100644
> > --- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
> > +++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
> > @@ -1,9 +1,10 @@
> >  TUNEVALID[vfp] =3D "Enable Vector Floating Point (vfp) unit."
> > -ARMPKGSFX_FPU .=3D "${@bb.utils.contains("TUNE_FEATURES", "vfp", "-vfp=
", ""
> > ,d)}"
> > +ARMPKGSFX_FPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfp', '-vfp=
', ''
> > ,d)}"
> >
> >  TUNEVALID[vfpv4] =3D "Enable Vector Floating Point Version 4 (vfpv4) u=
nit."
> > -ARMPKGSFX_FPU .=3D "${@bb.utils.contains("TUNE_FEATURES", "vfpv4",
> > "-vfpv4", "" ,d)}"
> > +ARMPKGSFX_FPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfpv4',
> > '-vfpv4', '' ,d)}"
> >
> >  TUNEVALID[callconvention-hard] =3D "Enable EABI hard float call conven=
tion,
> > requires VFP."
> > -TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "vfp",
> > bb.utils.contains("TUNE_FEATURES", "callconvention-hard", "
> > -mfloat-abi=3Dhard", " -mfloat-abi=3Dsoftfp", d), "" ,d)}"
> > -ARMPKGSFX_EABI .=3D "${@bb.utils.contains("TUNE_FEATURES", [
> > "callconvention-hard", "vfp" ], "hf", "", d)}"
> > +TUNE_CCARGS .=3D "${@bb.utils.contains_any('TUNE_FEATURES', [ 'vfp',
> > 'vfpv4' ], bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', '
> > -mfloat-abi=3Dhard', ' -mfloat-abi=3Dsoftfp', d), '' ,d)}"
> > +ARMPKGSFX_EABI .=3D "${@bb.utils.contains('TUNE_FEATURES', [
> > 'callconvention-hard', 'vfp' ], 'hf', '', d)}"
> > +ARMPKGSFX_EABI .=3D "${@bb.utils.contains('TUNE_FEATURES', [
> > 'callconvention-hard', 'vfpv4' ], 'hf', '', d)}"
> > --
> > 2.6.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYlTsYACgkQN1Ujt2V2gBy9oACgrv1kOqfS8DDvPIweXeVG9I37
MH0AnRoAWDOt/UUs1Xp8EeVkOrXHya/E
=0y7W
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--
