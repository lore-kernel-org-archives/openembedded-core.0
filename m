Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4B130731B9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 15:12:33 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id p63so3210927wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 07:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Tr3WcoQeP6STegKyJGpm4udoobZEr6oQvRiNQcJWqCY=;
	b=Qzlg8E+BGQDMcR1wnjK3H5/X+mWB8GUQYL0gSy/N1gS7cK7zqIeO80ii0p3JPIHXGd
	bcUzAZVTNbKhdtNXyhjr9w8295BZEXFqynHJl+W/nXF1qI9+oIlcnaadVeDkzrgWIvWA
	g3S+MNjZh023Skr0DPy6AODwz/tqZLQofQpjXOXVFO8lpygPIG0wTKxqyUUBhHAGZUgH
	XVMqhU5xGU9eIMzAcZ4fJ1QPqBe1KhQC2vuOziMXHoDdJ3nixcoIMthMlASC1aHAqCZG
	UAsjCt8TpjRhxKlwUcnEPF15KIlVdCx4WYppWNtjMKMKTLvyoVgvHOe4x2pGTgyAAMmp
	dOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=Tr3WcoQeP6STegKyJGpm4udoobZEr6oQvRiNQcJWqCY=;
	b=X9CkxWDGYMNfZIb0tTdoqFhWq0eiNnRDqOpsKuI5kPDo816DBeVZJXYbGKgfKgJ9Zf
	QcIpLviRazjUdHM1QbmMQfjx+fR4XLtl+Q+EjYM+hOSh2qGi/Xere0AJHvOAvdD8nhaV
	qDwcWf9yAkmhFGUzNSI0IOvfWWd+/EAkCpfBGtNUmjzwYXlQnsqOZ/KnqTQrV0osy4/b
	+lQsvtm/LNsYnE2Tw2Sck7iIkKak7GBmAhG+oTorjb6PbOfaeFEVTObzkQC4uEmFSJJa
	qiNjAmU7FUgAjsZ8eWTeTxeRBYPkjVH0Tm1QHmlCsthuXzZlHzXQcQ54DYjig88Kr+lB
	Np0Q==
X-Gm-Message-State: AG10YOSld3AR0pJq1EAXHZum4GzyWw9wlfSfIRdOni1slZ5aF39XGqFByCAkdcOqy24tOA==
X-Received: by 10.194.2.76 with SMTP id 12mr2349715wjs.28.1455289953540;
	Fri, 12 Feb 2016 07:12:33 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	e77sm2795439wma.18.2016.02.12.07.12.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Feb 2016 07:12:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 12 Feb 2016 16:16:42 +0100
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Message-ID: <20160212151642.GA3028@jama>
References: <1455203936-28150-1-git-send-email-adrian.ratiu@ni.com>
	<20160211164154.GB2595@jama>
	<20160212155857.759685c6@adi-pc-linux.emea.corp.natinst.com>
	<20160212142501.GD2607@jama>
	<20160212170512.72f80444@adi-pc-linux.emea.corp.natinst.com>
MIME-Version: 1.0
In-Reply-To: <20160212170512.72f80444@adi-pc-linux.emea.corp.natinst.com>
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
X-List-Received-Date: Fri, 12 Feb 2016 15:12:33 -0000
X-Groupsio-MsgNum: 78082
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Content-Disposition: inline

--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 12, 2016 at 05:05:12PM +0200, Ioan-Adrian Ratiu wrote:
> On Fri, 12 Feb 2016 15:25:01 +0100
> Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > On Fri, Feb 12, 2016 at 03:58:57PM +0200, Ioan-Adrian Ratiu wrote:
> > > Hello
> > >=20
> > > On Thu, 11 Feb 2016 17:41:54 +0100
> > > Martin Jansa <martin.jansa@gmail.com> wrote:
> > >  =20
> > > > On Thu, Feb 11, 2016 at 05:18:56PM +0200, Ioan-Adrian Ratiu wrote: =
=20
> > > > > From: Richard Tollerton <rich.tollerton@ni.com>
> > > > >=20
> > > > > Define tunnings to enable 32 register VFPv3 for cortexa9 processo=
r cores   =20
> > > >=20
> > > > Can you execute the test from:
> > > > http://git.openembedded.org/openembedded-core-contrib/log/?h=3Djans=
a/tune2-test
> > > > just to verify that all these new combinations work ok and to updat=
e the
> > > > test results for next person modifying the tune files? =20
> > >=20
> > >  I've tested with that script and everything looks ok (it took a whil=
e for all those openssl builds to run the first time). =20
> >=20
> > Thanks, it doesn't build them, only parses.
> >=20
> > > I also had to modify that hardcoded path to the openembedded-core loc=
ation in the script. I asume this test script was created for the poky layo=
ut? =20
> >=20
> > No I don't use poky, but the layout isn't set in stone, I'm not
> > surprised you're using different.
> >=20
> > > (also I've done a  grep "\(-vfpv3\)" on the AVAILTUNES var, but I don=
't think it matters that much though, run the test without it also) =20
> >=20
> > You mean in this line:
> > AVAILTUNES=3D`grep '^AVAILTUNES=3D' ${TUNE_TEST_DIR}/env.${M} | sed 's/=
^[^"]*"\([^"]*\)"/\1/g' | tr ' ' '\n'`;
> >=20
> > to restrict the testing only to new -vfpv3 tune?
>=20
> Yes, at the commit pointed by the URL in your previous mail the line had =
a grep neon-vfpv4 appended:
>=20
> AVAILTUNES=3D`grep '^AVAILTUNES=3D' ${TUNE_TEST_DIR}/env.${M} | sed 's/^[=
^"]*"\([^"]*\)"/\1/g' | tr ' ' '\n' | grep "\(neon-vfpv4\)"`;
>=20
> >=20
> > > There is also a discrepancy between the value of TUNE_PKGARCH =3D=3D =
armv7athf and the file name from the env.fake-cortexa9.armv7athf-vfpv3. I b=
elieve there may be a typo in one of the tunes, ommited the "t" for thumb. =
=20
> >=20
> > I'm not sure where the typo is, can you push your results somewhere? So
> > it's easy to see the diff with latest jansa/tune2-test ?
>=20
> I did some more digging and that divergence seems to be caused by the fol=
lowing line in arch-armv7a.inc:
>=20
> PACKAGE_EXTRA_ARCHS_tune-armv7athf            =3D "${PACKAGE_EXTRA_ARCHS_=
tune-armv6thf} armv7ahf-vfp armv7at2hf-vfp"=20
>=20
> Shouldn't it be the following: (add a t for thumb)?
>=20
> PACKAGE_EXTRA_ARCHS_tune-armv7athf            =3D "${PACKAGE_EXTRA_ARCHS_=
tune-armv6thf} armv7athf-vfp armv7at2hf-vfp"=20
>=20
> The same applies to other armv7athf tunes like armv7athf-vfpv3d16, they a=
ll seem to be missing a t.

No they aren't missing "t", because thumb for armv7 is appended as "t2"
which is already there and tune-armv7athf needs to include arm tune,
otherwise recipes which set ARM_INSTRUCTION_SET to "arm" won't be in
PACKAGE_EXTRA_ARCHS and image build will fail.

> > > > > More details: http://www.arm.com/products/processors/technologies=
/vector-floating-point.php
> > > > >=20
> > > > > Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> > > > > Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > > > > ---
> > > > >  meta/conf/machine/include/tune-cortexa9.inc | 15 +++++++++++++++
> > > > >  1 file changed, 15 insertions(+)
> > > > >=20
> > > > > diff --git a/meta/conf/machine/include/tune-cortexa9.inc b/meta/c=
onf/machine/include/tune-cortexa9.inc
> > > > > index 965f2d9..3d8dc1d 100644
> > > > > --- a/meta/conf/machine/include/tune-cortexa9.inc
> > > > > +++ b/meta/conf/machine/include/tune-cortexa9.inc
> > > > > @@ -34,3 +34,18 @@ PACKAGE_EXTRA_ARCHS_tune-cortexa9hf           =
  =3D "${PACKAGE_EXTRA_ARCHS_tune-ar
> > > > >  PACKAGE_EXTRA_ARCHS_tune-cortexa9thf            =3D "${PACKAGE_E=
XTRA_ARCHS_tune-armv7athf} cortexa9hf-vfp cortexa9t2hf-vfp"
> > > > >  PACKAGE_EXTRA_ARCHS_tune-cortexa9hf-neon        =3D "${PACKAGE_E=
XTRA_ARCHS_tune-armv7ahf-neon}  cortexa9hf-vfp cortexa9hf-neon"
> > > > >  PACKAGE_EXTRA_ARCHS_tune-cortexa9thf-neon       =3D "${PACKAGE_E=
XTRA_ARCHS_tune-armv7athf-neon} cortexa9hf-vfp cortexa9hf-neon cortexa9t2hf=
-vfp cortexa9t2hf-neon"
> > > > > +
> > > > > +# VFPv3 Tunes
> > > > > +AVAILTUNES +=3D "cortexa9-vfpv3 cortexa9t-vfpv3 cortexa9hf-vfpv3=
 cortexa9thf-vfpv3"
> > > > > +ARMPKGARCH_tune-cortexa9-vfpv3          =3D "cortexa9"
> > > > > +ARMPKGARCH_tune-cortexa9t-vfpv3         =3D "cortexa9"
> > > > > +ARMPKGARCH_tune-cortexa9hf-vfpv3        =3D "cortexa9"
> > > > > +ARMPKGARCH_tune-cortexa9thf-vfpv3       =3D "cortexa9"
> > > > > +TUNE_FEATURES_tune-cortexa9-vfpv3           =3D "${TUNE_FEATURES=
_tune-armv7a-vfpv3}          cortexa9"
> > > > > +TUNE_FEATURES_tune-cortexa9t-vfpv3          =3D "${TUNE_FEATURES=
_tune-armv7at-vfpv3}         cortexa9"
> > > > > +TUNE_FEATURES_tune-cortexa9hf-vfpv3         =3D "${TUNE_FEATURES=
_tune-armv7ahf-vfpv3}        cortexa9"
> > > > > +TUNE_FEATURES_tune-cortexa9thf-vfpv3        =3D "${TUNE_FEATURES=
_tune-armv7athf-vfpv3}       cortexa9"
> > > > > +PACKAGE_EXTRA_ARCHS_tune-cortexa9-vfpv3           =3D "${PACKAGE=
_EXTRA_ARCHS_tune-armv7a-vfpv3}  cortexa9-vfp cortexa9-vfpv3"
> > > > > +PACKAGE_EXTRA_ARCHS_tune-cortexa9t-vfpv3          =3D "${PACKAGE=
_EXTRA_ARCHS_tune-armv7at-vfpv3} cortexa9-vfp cortexa9-vfpv3 cortexa9t2-vfp=
 cortexa9t2-vfpv3"
> > > > > +PACKAGE_EXTRA_ARCHS_tune-cortexa9hf-vfpv3         =3D "${PACKAGE=
_EXTRA_ARCHS_tune-armv7ahf-vfpv3}  cortexa9hf-vfp cortexa9hf-vfpv3"
> > > > > +PACKAGE_EXTRA_ARCHS_tune-cortexa9thf-vfpv3        =3D "${PACKAGE=
_EXTRA_ARCHS_tune-armv7athf-vfpv3} cortexa9hf-vfp cortexa9hf-vfpv3 cortexa9=
t2hf-vfp cortexa9t2hf-vfpv3"
> > > > > --=20
> > > > > 2.7.0
> > > > >=20
> > > > > --=20
> > > > > _______________________________________________
> > > > > Openembedded-core mailing list
> > > > > Openembedded-core@lists.openembedded.org
> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core =
  =20
> > > >  =20
> > >  =20
> >=20
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAla990EACgkQN1Ujt2V2gBx7HACfVCIa5gqYIqBf3u/MA0S3yYqW
9nIAoIO4oSbuwRjNJJBrDRoWCCSUbkhf
=zHHC
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
