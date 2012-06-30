Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Skxum-00009v-IE
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 15:40:44 +0200
Received: by werg55 with SMTP id g55so2588067wer.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jun 2012 06:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CdcDOGjHLR15fXkBcGTDO8n2wGAuuko39Ly1J+XkakY=;
	b=TaFrai2cqPbosYYCATlZw+YLN13b6hU5lIpBNGazrezFUTm2da6G4Ftgof4XzJOiZ7
	h593hLNtbQUz3fIz+UnMdcdubTUBq+vhve6T1YNCJskefbwDGuN3P7JoZKBHN4pVdvk3
	gagwS6yV7RLzRJ6SeZbIVXYpCnzRAJ9gsnKYNi+pNa29u9QoDU9cT8UW+j48jFRXsjrl
	5UHamHvye31tX2sUX+mldOM2DQu1Me7dEBs93B0Le2cEb/NTJ3CDX08z5qU4UaubBGP1
	GFRA6lHqVdUBb1zgj1/EUrVvhfZ0jxkRFe3azYLGKiJ/LE1UpL6ctlPACP0RuIRFA0cN
	G/pw==
Received: by 10.180.109.129 with SMTP id hs1mr4945509wib.0.1341062987403;
	Sat, 30 Jun 2012 06:29:47 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fw4sm12207446wib.0.2012.06.30.06.29.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 30 Jun 2012 06:29:46 -0700 (PDT)
Date: Sat, 30 Jun 2012 15:29:35 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120630132935.GA3689@jama.jama.net>
References: <alpine.DEB.2.02.1206300923060.17865@oneiric>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1206300923060.17865@oneiric>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: is it best practice to use ${sysconfdir} rather than hard-coding "/etc"?
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
X-List-Received-Date: Sat, 30 Jun 2012 13:40:44 -0000
X-Groupsio-MsgNum: 24413
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline

--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 30, 2012 at 09:25:57AM -0400, Robert P. J. Day wrote:
>=20
>   i suspect i know the answer to this, but in the recipe file
> usbinit.bb, we have:
>=20
> do_install() {
>     install -d ${D}/etc
>     install -d ${D}/etc/init.d
>     install usb-gether ${D}/etc/init.d
> }
>=20
>   i'm guessing that would more properly be coded:
>=20
> do_install() {
>     install -d ${D}${sysconfdir}
>     install -d ${D}${sysconfdir}/init.d
>     install usb-gether ${D}${sysconfdir}/init.d
> }
>=20
>   the end result is functionally identical, of course, it's all just a
> matter of style.

using sysconfdir is better as someone can define it to different value
then 'etc' and the later will still work (be consistent across image)

Cheers,

>=20
> rday
>=20
> --=20
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>=20
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/u/z8ACgkQN1Ujt2V2gBzaUACdHVov6plvz7nuu0tSSoOBECbv
6VUAn11drp+P+ohyYrB7rGfH0/cpo81t
=N/J5
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
