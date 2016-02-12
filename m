Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id BBB24731C7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 14:20:51 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id g62so2948376wme.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 06:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zk80NpcX6s58DHmqYJj5ofHfliTqFb0yCfDCa6hLhdg=;
	b=ykA22hWCFfdZPzoh92V01Jfj9jUeYlcY+SUld19aRQDyTihLM+C5vQQdSwGeOzvxzM
	iKNLNL+tTS64GCA6u0C/FNDGUkhJODahjZE+N6GzsBPdbfLL7nxiL5n1+LxMqo8FWDPp
	w2SLsY17+fSSdvf1jbZRZ5+uOqcvJoArOVhL8fMeHibOqow1IPPRTb0lnDWaECipjTSk
	uyqXX5VfoxrlxQRsCEm8Xf/H9BXGV1/Hd0e9bKlL8BH1yohBoKhf/ZmagT+tQLdwbR4Q
	dI78U4lPVz43pubuUNWMetZxj1V42ZWg/wV4rG6Bjm60WqNRrPQ/XHSvFQdfBeB2sSnb
	2jlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=zk80NpcX6s58DHmqYJj5ofHfliTqFb0yCfDCa6hLhdg=;
	b=QHunHff9PuxrDJzwwmNrZ5KseNPPK4TcWwn2TDkRb8gFcDpDFZdCM8pRM5+QvIn6WP
	gIatYhxwiQYou75wk26tc/grzpwKPkP6E8o9lDjLUyJ8zgFqM9nGK0CrdN831iLQa04d
	X6ImPXlpVQ6LU6rwqiEG16yihg+wKuhGcAaGd3c1/d9jmBWHePzY4uoxYxqfBEUp/ULg
	sQTAK1RghC9u2wI/Vsiosv677uS9xIJwKNois9bB3+UuJ81gR6dfgCB3K3/X61REt94U
	taQYD12iPIaMbhl9FhHXlhRCsf6A4r9lzL9rNwmh3FR2PhAOH7z6GdpzjS81Dt+kWa6Q
	OaXw==
X-Gm-Message-State: AG10YOR/73ZLHd+rfw7lRPxYNlVPXbuNkFZ4iqAglBSwMzjZBfhDBUtJ5G6C1ssbAWDWEQ==
X-Received: by 10.28.3.131 with SMTP id 125mr4998539wmd.14.1455286851974;
	Fri, 12 Feb 2016 06:20:51 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	os7sm12355264wjc.18.2016.02.12.06.20.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Feb 2016 06:20:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 12 Feb 2016 15:25:01 +0100
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Message-ID: <20160212142501.GD2607@jama>
References: <1455203936-28150-1-git-send-email-adrian.ratiu@ni.com>
	<20160211164154.GB2595@jama>
	<20160212155857.759685c6@adi-pc-linux.emea.corp.natinst.com>
MIME-Version: 1.0
In-Reply-To: <20160212155857.759685c6@adi-pc-linux.emea.corp.natinst.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] tune-cortexa9.inc: add vfpv3 tunes
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
X-List-Received-Date: Fri, 12 Feb 2016 14:20:52 -0000
X-Groupsio-MsgNum: 78078
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d01dLTUuW90fS44H"
Content-Disposition: inline

--d01dLTUuW90fS44H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 12, 2016 at 03:58:57PM +0200, Ioan-Adrian Ratiu wrote:
> Hello
>=20
> On Thu, 11 Feb 2016 17:41:54 +0100
> Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > On Thu, Feb 11, 2016 at 05:18:56PM +0200, Ioan-Adrian Ratiu wrote:
> > > From: Richard Tollerton <rich.tollerton@ni.com>
> > >=20
> > > Define tunnings to enable 32 register VFPv3 for cortexa9 processor co=
res =20
> >=20
> > Can you execute the test from:
> > http://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/tu=
ne2-test
> > just to verify that all these new combinations work ok and to update the
> > test results for next person modifying the tune files?
>=20
>  I've tested with that script and everything looks ok (it took a while fo=
r all those openssl builds to run the first time).

Thanks, it doesn't build them, only parses.

> I also had to modify that hardcoded path to the openembedded-core locatio=
n in the script. I asume this test script was created for the poky layout?

No I don't use poky, but the layout isn't set in stone, I'm not
surprised you're using different.

> (also I've done a  grep "\(-vfpv3\)" on the AVAILTUNES var, but I don't t=
hink it matters that much though, run the test without it also)

You mean in this line:
AVAILTUNES=3D`grep '^AVAILTUNES=3D' ${TUNE_TEST_DIR}/env.${M} | sed 's/^[^"=
]*"\([^"]*\)"/\1/g' | tr ' ' '\n'`;

to restrict the testing only to new -vfpv3 tune?

> There is also a discrepancy between the value of TUNE_PKGARCH =3D=3D armv=
7athf and the file name from the env.fake-cortexa9.armv7athf-vfpv3. I belie=
ve there may be a typo in one of the tunes, ommited the "t" for thumb.

I'm not sure where the typo is, can you push your results somewhere? So
it's easy to see the diff with latest jansa/tune2-test ?

Regards,

> > > More details: http://www.arm.com/products/processors/technologies/vec=
tor-floating-point.php
> > >=20
> > > Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> > > Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > > ---
> > >  meta/conf/machine/include/tune-cortexa9.inc | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > >=20
> > > diff --git a/meta/conf/machine/include/tune-cortexa9.inc b/meta/conf/=
machine/include/tune-cortexa9.inc
> > > index 965f2d9..3d8dc1d 100644
> > > --- a/meta/conf/machine/include/tune-cortexa9.inc
> > > +++ b/meta/conf/machine/include/tune-cortexa9.inc
> > > @@ -34,3 +34,18 @@ PACKAGE_EXTRA_ARCHS_tune-cortexa9hf             =
=3D "${PACKAGE_EXTRA_ARCHS_tune-ar
> > >  PACKAGE_EXTRA_ARCHS_tune-cortexa9thf            =3D "${PACKAGE_EXTRA=
_ARCHS_tune-armv7athf} cortexa9hf-vfp cortexa9t2hf-vfp"
> > >  PACKAGE_EXTRA_ARCHS_tune-cortexa9hf-neon        =3D "${PACKAGE_EXTRA=
_ARCHS_tune-armv7ahf-neon}  cortexa9hf-vfp cortexa9hf-neon"
> > >  PACKAGE_EXTRA_ARCHS_tune-cortexa9thf-neon       =3D "${PACKAGE_EXTRA=
_ARCHS_tune-armv7athf-neon} cortexa9hf-vfp cortexa9hf-neon cortexa9t2hf-vfp=
 cortexa9t2hf-neon"
> > > +
> > > +# VFPv3 Tunes
> > > +AVAILTUNES +=3D "cortexa9-vfpv3 cortexa9t-vfpv3 cortexa9hf-vfpv3 cor=
texa9thf-vfpv3"
> > > +ARMPKGARCH_tune-cortexa9-vfpv3          =3D "cortexa9"
> > > +ARMPKGARCH_tune-cortexa9t-vfpv3         =3D "cortexa9"
> > > +ARMPKGARCH_tune-cortexa9hf-vfpv3        =3D "cortexa9"
> > > +ARMPKGARCH_tune-cortexa9thf-vfpv3       =3D "cortexa9"
> > > +TUNE_FEATURES_tune-cortexa9-vfpv3           =3D "${TUNE_FEATURES_tun=
e-armv7a-vfpv3}          cortexa9"
> > > +TUNE_FEATURES_tune-cortexa9t-vfpv3          =3D "${TUNE_FEATURES_tun=
e-armv7at-vfpv3}         cortexa9"
> > > +TUNE_FEATURES_tune-cortexa9hf-vfpv3         =3D "${TUNE_FEATURES_tun=
e-armv7ahf-vfpv3}        cortexa9"
> > > +TUNE_FEATURES_tune-cortexa9thf-vfpv3        =3D "${TUNE_FEATURES_tun=
e-armv7athf-vfpv3}       cortexa9"
> > > +PACKAGE_EXTRA_ARCHS_tune-cortexa9-vfpv3           =3D "${PACKAGE_EXT=
RA_ARCHS_tune-armv7a-vfpv3}  cortexa9-vfp cortexa9-vfpv3"
> > > +PACKAGE_EXTRA_ARCHS_tune-cortexa9t-vfpv3          =3D "${PACKAGE_EXT=
RA_ARCHS_tune-armv7at-vfpv3} cortexa9-vfp cortexa9-vfpv3 cortexa9t2-vfp cor=
texa9t2-vfpv3"
> > > +PACKAGE_EXTRA_ARCHS_tune-cortexa9hf-vfpv3         =3D "${PACKAGE_EXT=
RA_ARCHS_tune-armv7ahf-vfpv3}  cortexa9hf-vfp cortexa9hf-vfpv3"
> > > +PACKAGE_EXTRA_ARCHS_tune-cortexa9thf-vfpv3        =3D "${PACKAGE_EXT=
RA_ARCHS_tune-armv7athf-vfpv3} cortexa9hf-vfp cortexa9hf-vfpv3 cortexa9t2hf=
-vfp cortexa9t2hf-vfpv3"
> > > --=20
> > > 2.7.0
> > >=20
> > > --=20
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core =20
> >=20
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--d01dLTUuW90fS44H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAla96zwACgkQN1Ujt2V2gByofgCdFYjGSgXcneO8SJkvt2KgPpI5
H8EAn2s+UQwBPfiRr2sU1BK2rTTJtWFp
=3woj
-----END PGP SIGNATURE-----

--d01dLTUuW90fS44H--
