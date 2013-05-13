Received: from mail-pb0-f46.google.com ([209.85.160.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UbtFy-0008Br-9u
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 15:57:46 +0200
Received: by mail-pb0-f46.google.com with SMTP id rq13so897238pbb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 06:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=cSIrTmSxyN9unxjEhO+A9dPlKuffV/UVhTCqYSX36w0=;
	b=dUFtdKfWyBvsAFzW65pM1W8ijhxBhwVm1bijQww4r95OullKYRyIexdU4YzkalUtzp
	/rOfVAanqbbVuq8iK3yy9mtybJ36ZPcC3Cx3NoLUKV39C1bolOyEA8kUGAnhG9Qon3ll
	rd85FYfR9gdArXEyEA4HPq8Oo/6z6kJWd0zeRXwcM0ivOf13xkIw4VjZW1eqr2ErI859
	2bKxQm7wEQPBXUUzKTWL84wNS6FAgiWYF8h8Jeg2TjUScYxuy2eRHHn/is3GQkBbECX0
	Fz9y28lbtFMYArPs1P4ep3hWbdeYJ/gkd3kwwZmO7g6DsbnSgtU3NlpVFhSu2rlaUyog
	D9lQ==
X-Received: by 10.66.220.10 with SMTP id ps10mr30342826pac.117.1368452367889; 
	Mon, 13 May 2013 06:39:27 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	ya4sm14123199pbb.24.2013.05.13.06.39.25 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 13 May 2013 06:39:26 -0700 (PDT)
Date: Mon, 13 May 2013 15:39:24 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Jukka Rissanen <jukka.rissanen@linux.intel.com>
Message-ID: <20130513133924.GB3187@jama>
References: <1368449357-3191-1-git-send-email-jukka.rissanen@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1368449357-3191-1-git-send-email-jukka.rissanen@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 0/5] Enable VPN support in ConnMan
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
X-List-Received-Date: Mon, 13 May 2013 13:58:14 -0000
X-Groupsio-MsgNum: 39131
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CdrF4e02JqNVZeln"
Content-Disposition: inline

--CdrF4e02JqNVZeln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 13, 2013 at 03:49:12PM +0300, Jukka Rissanen wrote:
> Hi,
>=20
> v2:
> - removed the DISTRO_FEATURES as suggested by Ross,
>   now PACKAGECONFIG is used instead in connman.inc
> - all generic vpn files are placed into connman-vpn package
>   and vpn plugins rdepend on it
>=20
> v1:
> this patchset enables OpenVPN, vpnc, L2TP and PPTP VPN
> technogies in ConnMan and fixes this bug
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4456
>=20
>=20
> Cheers,
> Jukka
>=20
>=20
> Jukka Rissanen (5):
>   connman: Add VPN support
>   connman: Add OpenVPN support
>   connman: Add vpnc support
>   connman: Add L2TP support
>   connman: Add PPTP support

I think that 2-5 are missing

PACKAGES =3D+ "${PN}-vpn-foo"

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--CdrF4e02JqNVZeln
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlGQ7QwACgkQN1Ujt2V2gByt8QCfSKCiVSLB8KgpmNFaLHCsho4/
5qwAn3QFJM+U/0SbG3x4lHebQkR0Pf3p
=o+Ri
-----END PGP SIGNATURE-----

--CdrF4e02JqNVZeln--
