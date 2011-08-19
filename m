Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QuQK8-00050J-O6
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 16:45:28 +0200
Received: by fxg11 with SMTP id 11so2200879fxg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 07:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wjP5YzziIRGj245H385W4X7Hbg6ahN5XmiW4zMitd1A=;
	b=m0KeSoW0arvIRtbHlI7Zvz8wTeF6C4+dZR6uvj5YSNqqtBb6qmtMdSxdqoopK1FuCC
	NVcUbJUV7uU1TcWu9ERI+abMMbePPX1OvnnNg1rf6ukkxzzJZCOHdE03LC2vNmnXbmxA
	BUUpqehAOyVAELpjhBpMD+9DVEk8PQCR4UL5c=
Received: by 10.223.55.205 with SMTP id v13mr3012754fag.88.1313764848030;
	Fri, 19 Aug 2011 07:40:48 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 22sm2616699fat.41.2011.08.19.07.40.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Aug 2011 07:40:47 -0700 (PDT)
Date: Fri, 19 Aug 2011 16:40:40 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110819144040.GB22251@jama.jama.net>
References: <cover.1313700595.git.sgw@linux.intel.com>
	<883d56eb74a8f3b1913e7334c9ea70f2f1e562e9.1313700595.git.sgw@linux.intel.com>
	<1313764041.13995.101.camel@rex>
	<1313764419.6733.296.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1313764419.6733.296.camel@phil-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [CONSOLIDATED PULL 12/32] libxkbcommon: new
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
X-List-Received-Date: Fri, 19 Aug 2011 14:45:28 -0000
X-Groupsio-MsgNum: 8492
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pvezYHf7grwyp3Bc"
Content-Disposition: inline

--pvezYHf7grwyp3Bc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 19, 2011 at 03:33:38PM +0100, Phil Blundell wrote:
> On Fri, 2011-08-19 at 09:27 -0500, Richard Purdie wrote:
> > What isthe version getting set to for this recipe?
>=20
> Just "git" at the moment, which I suppose is a bit suboptimal.  What's
> the recommended string for packages that don't have any upstream
> release?

http://cgit.freedesktop.org/xorg/lib/libxkbcommon/tree/configure.ac
says:
AC_INIT([libxkbcommon], [0.1.0], [https://bugs.freedesktop.org/enter_bug.cg=
i?product=3Dxorg])

In such cases I'm using
PV =3D "0.1.0+gitr${SRCPV}"

even when there isn't any 0.1.0 tarball yet

problem is when content of such repo is realease as 0.1.0 tarball
later..

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pvezYHf7grwyp3Bc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5OdegACgkQN1Ujt2V2gBzxrgCfQvdnT7plUCZvfxk0QApxeisz
P3oAn2mjqD9VeHHWsiYvJ4XiMUD87ECp
=fIQc
-----END PGP SIGNATURE-----

--pvezYHf7grwyp3Bc--
