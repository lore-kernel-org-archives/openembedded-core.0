Received: from mail-pd0-f182.google.com ([209.85.192.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQbuh-0000G6-7x
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 13:13:06 +0200
Received: by mail-pd0-f182.google.com with SMTP id 3so1358827pdj.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2013 03:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=W3DlXqBx+vM+XMGtGygSsQ0tzwNhDUKcv8CS4qwBjtE=;
	b=sAUbykVinCzF5QCdrHqaiC6dcbBub306dh+apXo9yITgjliaWJSkuQr5YpkEqTDgxF
	+mH2CfFLDkw3Z0mzX1nqJU7CrlwSzxBuYkv1dqltvzduKwzJMnmcnGFh1Sfgw9n7v63m
	AeR4lrb4b6Hqnoxy6MFMDCXLHu2kUIAqCk+jKwiVQ6jrvRQNscxG3ZFb4WZOv89vOjs/
	JRU2DHw5csBrv9xtgKgd0/gXgwVArRkQlHcWuNxx0xrkaouZ0VZHL/7yQSbnAF0N/gWD
	xYeT3p6wTeE/q2YPwWl02FCykl1ByHjbI4Wbv1HmzG5BgY+GnpQpT++1tGnsmNgphtsc
	iFIw==
X-Received: by 10.68.102.2 with SMTP id fk2mr14186928pbb.168.1365764138106;
	Fri, 12 Apr 2013 03:55:38 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id jw10sm8160719pbb.3.2013.04.12.03.55.35
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 03:55:37 -0700 (PDT)
Date: Fri, 12 Apr 2013 12:55:30 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130412105530.GL2477@jama>
References: <CALbNGRRgm8MspqB0ouUFp2s+y_7CGL+qEFFWRZLC+6bh9sJOGg@mail.gmail.com>
	<CAJTo0LZWKopuBHzAp5g7Uj03kmqfTDzTF8Aq+mWax27wHz11wA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZWKopuBHzAp5g7Uj03kmqfTDzTF8Aq+mWax27wHz11wA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: systemd/sysvinit switches (was [meta-systemd][PATCH 1/2] Delete systemd class)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Apr 2013 11:13:31 -0000
X-Groupsio-MsgNum: 37822
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WuT04sMzYDXq8et0"
Content-Disposition: inline

--WuT04sMzYDXq8et0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2013 at 11:46:16AM +0100, Burton, Ross wrote:
> Hi Andreas,
>=20
> On 12 April 2013 09:56, Andreas M=FCller <schnitzeltony@googlemail.com> w=
rote:
> > OK - just in case I have spare cycles to start this: I am afraid I
> > lost overview regarding distro features. I found systemd and sysvinit
> > which can be set both - still correct?
> >
> > Ross could you please link me to the information how the use case 'I
> > want to build for both init-systems but let image decide which one to
> > use' is set up.
> > Sorry I didn't follow the last changes in detail because of other
> > issues (and personally I just use sysvinit).
>=20
> It's in the manual!  Okay, only just, and it's still being worked on:
>=20
> http://www.yoctoproject.org/docs/1.4/dev-manual/dev-manual.html#selecting=
-an-initialization-manager
>=20
> (obviously the DISTRO_FEATURES =3D "systemd" bit is wrong, but you can
> see what the intention is)

for systemd-only case it should also recommend:

# sysvinit scripts are often missing in recipe
BAD_RECOMMENDATIONS +=3D "update-rc.d"

Because at least dbus/udev are missing sysvinit scripts without sysvinit in
DISTRO_FEATURES and postinst scripts are failing when there is
udpate-rc.d but not script which it is trying to enable..

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WuT04sMzYDXq8et0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFn6CIACgkQN1Ujt2V2gBx1IgCeMrRspI/Mg1u0gHd1w4v6wxwX
CFkAoIzqFARtRpeOLvowpyixZpXxeQoI
=phUZ
-----END PGP SIGNATURE-----

--WuT04sMzYDXq8et0--
