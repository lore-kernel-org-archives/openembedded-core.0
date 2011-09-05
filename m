Received: from mail-ey0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R0TON-0005pv-1W
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Sep 2011 09:14:51 +0200
Received: by eyb7 with SMTP id 7so3460457eyb.18
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Sep 2011 00:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=B7G0nXC6XAocd8D+4DQjILDCSGkGirXsJL0ctaclv34=;
	b=wyF/FS/MxXwfMYmhc21aOPyIlGWi3ymnBYfTWg659b5kmwVmHfuJdkASjXCsS/D9Ru
	D7Tzqa144n+skCq2zK9QcV+k/U8c8bX5EyZUlu88DkW53Y6sjsiunsGL6XYBhDJMOLM4
	Fa9GdYef4H0jtT8ge3pjRmBB12ytqPNBnhKP8=
Received: by 10.14.7.14 with SMTP id 14mr1099450eeo.18.1315206591300;
	Mon, 05 Sep 2011 00:09:51 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d12sm8464996eeb.8.2011.09.05.00.09.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Sep 2011 00:09:50 -0700 (PDT)
Date: Mon, 5 Sep 2011 09:09:43 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20110905070943.GA31057@jama.jama.net>
References: <1314970267-20365-2-git-send-email-denis@eukrea.com>
	<1314979795-13537-1-git-send-email-denis@eukrea.com>
	<20110905070522.GA8690@chargestorm.se>
MIME-Version: 1.0
In-Reply-To: <20110905070522.GA8690@chargestorm.se>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [RESEND] bitbake.conf: fix ubi images creation
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
X-List-Received-Date: Mon, 05 Sep 2011 07:14:51 -0000
X-Groupsio-MsgNum: 9110
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Content-Disposition: inline

--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 05, 2011 at 09:05:22AM +0200, Anders Darander wrote:
> * Denis Carikli <denis@eukrea.com> [110902 18:19]:
> > Without that commit ubinize.cfg lack a volume name value,
> >   and the related ubinize.cfg line looks like that:
> >     vol_name=3D
> >   which result in a broken ubi image,which after beeing flashed produce
> >   the following error:
> >     UBI error: vtbl_check: volume table check failed: record 0, error 11
> >   wich result in a kernel panic because the rootfs can't be mounted.
>=20
> I've recently spent some time debugging this very same issue, when
> converting an on-going project from oe-dev to oe-core.
>=20
> > Signed-off-by: Denis Carikli <denis@eukrea.com>
>=20
> Acked-by: Anders Darander <anders@chargestorm.se>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> > ---
> >  meta/conf/bitbake.conf |    2 ++
> >  1 files changed, 2 insertions(+), 0 deletions(-)
> >=20
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index a68be07..14ee90c 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -382,6 +382,8 @@ IMAGE_BASENAME =3D "${PN}"
> >  IMAGE_NAME =3D "${IMAGE_BASENAME}-${MACHINE}-${DATETIME}"
> >  IMAGE_LINK_NAME =3D "${IMAGE_BASENAME}-${MACHINE}"
> > =20
> > +UBI_VOLNAME ?=3D "${MACHINE}-rootfs"
> > +
> >  # This option allows for a percentage overage of the actual image size=
 rather than a
> >  # fixed extra space, this is space needed for initial startup and basi=
c operations.
> >  IMAGE_OVERHEAD_FACTOR ?=3D 1.3
> --=20
> Anders Darander
> ChargeStorm AB
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5kdbcACgkQN1Ujt2V2gBxMQQCfSa6DGjlpXBseccfo6RDC3VLp
6d8AoKsNDnCkOqNhLcO6UKBXBCzEeqpd
=mlea
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
