Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 818996013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 11:43:17 +0000 (UTC)
Received: by wgxm20 with SMTP id m20so56196394wgx.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 04:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dhFZ0mXL6R+PUpn+/0hVIUUveNOHrE+2PNaZSFvkFYE=;
	b=yo8ixaKwZcgTPw21itAs3mu2OgtrIVCkKVc+fEUoyQiz+lbY830p4/j2wHTdZJiBoi
	b+NcFx7jpS5UpTZ4aN6acvn01HJ8TvtAR1twlodLS3SjpwPHOpNamtq11KX8motubFcK
	zCgTxFTnzBbR6+DVcBxLcvbod87tpN635paAWsWopngn0NA8aGsdU/GTR98pxn58l/Jk
	jAt0F+GynnGZ4dwhjM+q0qwE7uxAje9UL8ar4FkKVCdEygkiwh2rV9Xxdsx2GIDGuucy
	14iuvO5OIz1KSEUhFIAhXUX+xuyPC2seHNJE+Um7b4PuTYrvv3gUJLckkxNDRvzdKMgt
	ghlQ==
X-Received: by 10.180.23.69 with SMTP id k5mr6083609wif.3.1437046996950;
	Thu, 16 Jul 2015 04:43:16 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	q19sm2705761wik.16.2015.07.16.04.43.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Jul 2015 04:43:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 16 Jul 2015 13:43:44 +0200
To: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
Message-ID: <20150716114344.GA2134@jama>
References: <1434080436-1650-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<20150612082902.GA23164@ad.chargestorm.se>
	<A8FC939F80655644A89BB21CCD3741E87390E153@G08CNEXMBPEKD02.g08.fujitsu.local>
MIME-Version: 1.0
In-Reply-To: <A8FC939F80655644A89BB21CCD3741E87390E153@G08CNEXMBPEKD02.g08.fujitsu.local>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Anders Darander <anders@chargestorm.se>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] curl: Modify PACKAGECONFIG to enable openssl
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
X-List-Received-Date: Thu, 16 Jul 2015 11:43:21 -0000
X-Groupsio-MsgNum: 68036
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline

--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2015 at 03:54:04AM +0000, Li, Xin wrote:
> Hi, Anders
>=20
> Thanks for your replay.
>=20
> > Subject: Re: [OE-core] [PATCH] curl: Modify PACKAGECONFIG to enable ope=
nssl
> >=20
> > * Li xin <lixin.fnst@cn.fujitsu.com> [150612 05:41]:
> >=20
> > > Enabled openssl defalutly to use https, just like Ubuntu and Red Hat =
do.
> >=20
> > > Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> > > ---
> >=20
> > > -PACKAGECONFIG ??=3D "${@bb.utils.contains("DISTRO_FEATURES", "ipv6",=
 "ipv6",
> > "", d)} gnutls zlib"
> > > +PACKAGECONFIG ??=3D "${@bb.utils.contains("DISTRO_FEATURES", "ipv6",=
 "ipv6",
> > "", d)} ssl zlib"
> >=20
> > I think you need to motivate why you're changing from gnutls to ssl
> > (openssl) here.
> >=20
> > Not that I'm personally against it. I've occasionally done the same thi=
ng locally. But
> > this is a change of the defaults, and the default dependencies. Thus, i=
t needs to
> > have a good motivation.
>=20
> The motivation is as following:
> Curl depends on gnutls and gnutls depends on gmp, but the LICENSE of gmp =
is LGPLv3.
> If the users do not want to use the LGPLv3 recipes(the rpm of gmp is not =
be installed), there will be an error when using https.
> Such as:
> ----------------
> # curl -k https://192.168.246.1
> curl: error while loading shared libraries: libgmp.so.10: cannot open sha=
red object file: No such file or directory=20
> ----------------
> But after changing gnutls to ssl in PACKAGECONFIG, there will be no error=
s.

What about returning gmp v4.2.1 which was last LGPLv2 version?

This says, it's OK to remove v4.2.1, because v6.0.0 is dual licensed:
http://git.openembedded.org/openembedded-core/commit/?id=3Df181c6ce8b364fbf=
761a456d998ab78fbd751f35

but it's dual licensed under GPLv2+ | LGPLv3+ and using GPLv2 libraries
isn't acceptable by some projects.

So I would vote for returning v4.2.1.

> >=20
> > >  PACKAGECONFIG_class-native =3D "ipv6 ssl zlib"
> > >  PACKAGECONFIG_class-nativesdk =3D "ipv6 ssl zlib"
> >=20
> > > @@ -36,6 +36,7 @@ EXTRA_OECONF =3D "--without-libidn \
> > >                  --disable-ldap \
> > >                  --disable-ldaps \
> > >
> > > --with-ca-bundle=3D${sysconfdir}/ssl/certs/ca-certificates.crt \
> > > +                --with-libssh2 \
> >=20
> > NACK.
> >=20
> > We have a PACKAGECONFIG f=F6r libssh2, which defaults to off. Do /not/ =
enable it
> > directly in EXTRA_OECONF. This will break builds (at least the determin=
ism of
> > builds).
> >=20
> Yes.
> Enabling -with-libssh2 in EXTRA_OECONF is not right.
> My goal is to let sftp supported by curl, by adding libssh2 in PACKAGECON=
FIG.
> But libssh2 is not in OE-core by default.=20
> And I think there may be someone else want to use libssh2.
> So how about moving libssh2 recipe from Meta-oe to OE-core? :)
>=20
> Thank you very much.
>=20
> Regards,
> Li
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWnmO8ACgkQN1Ujt2V2gBwCxACeKPDDtX9eCiaH8V1KoF4+1X9q
6kkAn3dWl7fcZQba6tJZbcOczQ7gXg7d
=JzWT
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
