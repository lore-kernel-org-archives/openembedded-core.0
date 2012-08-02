Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwyT1-0005c6-N4
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 18:41:43 +0200
Received: by wgbds1 with SMTP id ds1so5161110wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 09:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bhPXcUpr+QffYwN7NdH1uXMB8gjus911ZL+DDIZgB2Q=;
	b=q3I2rNZqRClM9rmL5sv+Xf1EBS6Ja2pQsvU7nX3UVq8BBMsN6EAa+jESdupDQysAef
	8tu4ouHGjO9vdStiC4sTkkdiOWQYYP/jcXrKHO8vPboNDV8EifcM/xnpZZo6RQGNoMYW
	TAHt13pde3VXS/RaYq2SYJDhtMZYXGShEoRPBj6ek9hPyv0CO1N+mi7qfDKeiO5pX5j/
	eSM8wa/KYiz+irTV3JZsKRRtcmnBpSRm0CDn5vggDpThqsDWKmIdVr2YdzPVfTbGzqLe
	1QUXgxY70gMASEgpaxc+/r8lY5Ue+uDv16ZMJj7r91ZU3QIcPO2HGOT48n2Qmw+kZwtV
	rOtg==
Received: by 10.216.134.40 with SMTP id r40mr5413279wei.88.1343925004106;
	Thu, 02 Aug 2012 09:30:04 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id eu4sm34380124wib.2.2012.08.02.09.30.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 09:30:03 -0700 (PDT)
Date: Thu, 2 Aug 2012 18:30:01 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20120802163001.GW16306@jama.jama.net>
References: <1343924683-21970-1-git-send-email-Martin.Jansa@gmail.com>
	<2026871.yolgERni9t@helios>
MIME-Version: 1.0
In-Reply-To: <2026871.yolgERni9t@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC] bitbake.conf: store cooker logs in TMPDIR subdirectory
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Aug 2012 16:41:43 -0000
X-Groupsio-MsgNum: 26813
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1AtvaQRkIQxkm1Oe"
Content-Disposition: inline

--1AtvaQRkIQxkm1Oe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 02, 2012 at 05:27:38PM +0100, Paul Eggleton wrote:
> On Thursday 02 August 2012 18:24:43 Martin Jansa wrote:
> > * we should probably wait until
> > =20
> > http://git.openembedded.org/bitbake/commit/?id=3D1e06d8012868ba5a31503d=
c99cbf
> > 18570be629d9 is in next required bitbake version, but error message if =
the
> > directory doesn't exist is quite clear * people with new enough bitbake
> > could just change this in their local.conf
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/conf/bitbake.conf |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >=20
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index d5a43e9..ff1cbd6 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -754,7 +754,7 @@ DISTRO[unexport] =3D "1"
> >  TRANSLATED_TARGET_ARCH ??=3D "${@d.getVar('TARGET_ARCH', True).replace=
("_",
> > "-")}"
> >=20
> >  # Complete output from bitbake, if you're changing it, make sure to use
> > existing directory -BB_CONSOLELOG ?=3D "${TMPDIR}/cooker.log.${DATETIME=
}"
> > +BB_CONSOLELOG ?=3D "${TMPDIR}/cooker/${MACHINE}/${DATETIME}"
>=20
> I was thinking about this the other day - shouldn't we be using LOG_DIR f=
or=20
> this?

Yes, makes sense. And I've also forgot to remove that comment above
BB_CONSOLELOG"

>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1AtvaQRkIQxkm1Oe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAaqwkACgkQN1Ujt2V2gBwzTQCgkcIdD7I0Skq060pGQSeZEsQr
Pt8AoIZvPkl1et4k3YkW4ZYDPZHu6s8s
=4q3x
-----END PGP SIGNATURE-----

--1AtvaQRkIQxkm1Oe--
