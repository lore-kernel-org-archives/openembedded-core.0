Received: from mail-da0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1UVd5J-0006eE-8I; Fri, 26 Apr 2013 09:28:48 +0200
Received: by mail-da0-f51.google.com with SMTP id g27so772618dan.10
	for <multiple recipients>; Fri, 26 Apr 2013 00:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=EA1m3XJZBiTpdJqZbXOwEvmwQ5JeT86h0InU8CeDQnE=;
	b=jDfGv6grKA8D/Hc6Q4oz5+RaEhHdnRjSerbVDWGSEFyLBhGlbngnT1BC6M9kitwUfb
	Ri56S0HG/jpx/HyZgUmrB+nXpj6CrEl1wjCXrk0DEeUcd7Bh94MR6Hy5g07Fa5kinZdu
	VotiBhwnIW4o11Ppr5L07l8+EjJMphoGqm28tAcd32q/BptKE+lDvoYOX0VQu8kOxCfX
	4jedE+asiQGgKARl15KDNmr9D/PypxmhgLoYUscey/od1cwOLR4pk/Z681a9/tzo39lP
	8v2cIo2x56Eq48C15idLUiw0lVgm2DtBHMG71q5NifdhfPiXGTlQZFT5E5plqiI2lmQC
	dc0Q==
X-Received: by 10.68.221.1 with SMTP id qa1mr4102367pbc.125.1366960259850;
	Fri, 26 Apr 2013 00:10:59 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	tx9sm11562772pab.5.2013.04.26.00.10.56 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 26 Apr 2013 00:10:58 -0700 (PDT)
Date: Fri, 26 Apr 2013 09:11:09 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130426071109.GJ5538@jama.dyndns-home.com>
References: <3018EE95-32DD-40D0-8282-BB4DF78D93C6@gmail.com>
MIME-Version: 1.0
In-Reply-To: <3018EE95-32DD-40D0-8282-BB4DF78D93C6@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org oe-core layer"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: RFT: binutils 2.23.2 available
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
X-List-Received-Date: Fri, 26 Apr 2013 07:29:03 -0000
X-Groupsio-MsgNum: 38423
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pWOmaDnDlrCGjNh4"
Content-Disposition: inline

--pWOmaDnDlrCGjNh4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2013 at 08:44:16PM -0700, Khem Raj wrote:
> Hi
>=20
> I have pushed a binutils upgrade to contrib branch. I have booted systemd=
-image in all supported QEMUs using angstrom-next distro
>=20
> Pease help testing it out
>=20
> The branch is here
>=20
> http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/binut=
ils-2.23.2
>=20
> If you run into issues let me know

I'll run it on jenkins world.

It's worth mentioning that
--no-copy-dt-needed-entries is not only default, but also properly
working in this release, so new bunch of underlinking errors is expected.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pWOmaDnDlrCGjNh4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlF6KI0ACgkQN1Ujt2V2gBx3tQCeLseoqONpO7eukhzObq8whT4G
PWoAn3wHNHltLN+JYNLPXbgVB8am1bpo
=ysja
-----END PGP SIGNATURE-----

--pWOmaDnDlrCGjNh4--
