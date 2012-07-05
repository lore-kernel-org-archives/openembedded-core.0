Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SmuCH-0007LK-VZ
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 00:06:50 +0200
Received: by wibhm2 with SMTP id hm2so115617wib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2012 14:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6oRXamv+pTkGF9kuvwVx73M0fEh3I1gEECpz2/N6XzM=;
	b=mCtC/Pfe3zXbqknNA7M/jCL0L61vh4NKqKl/IuZHwaS6sL0zRc5s6rPnHObIn2igFG
	SJSH9uruvcbTQ353mcaLr73WS3gO1RnGTgs21n0z9ku6UNffO9gx1kpGCD7GAEd72DHd
	NXT5DZlfyX8nX8Tpgp+3Z/EG9dAyH6lNdeNtEyfXZdpwv0uzD7UzJ90jn5sN5CMpjspA
	/6zsNZixh/HSaOMwFToNV+Vcu+LF+B4Sz2xsogAtJ/NCQ6SZZ6Hd3tlXabFSw6rwK8wl
	17rd8z5B12ppF7ZKiumsoTJeMPAef96Pn5BL3K6Q89ir6/un4s/PMBfkkFqfvl9km5Sb
	VA3Q==
Received: by 10.180.19.169 with SMTP id g9mr2561814wie.9.1341525345208;
	Thu, 05 Jul 2012 14:55:45 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j6sm3571237wiy.4.2012.07.05.14.55.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jul 2012 14:55:43 -0700 (PDT)
Date: Thu, 5 Jul 2012 23:55:42 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120705215542.GF3708@jama.jama.net>
References: <cover.1341498745.git.raj.khem@gmail.com>
	<20120705202306.GD3708@jama.jama.net>
	<CAMKF1sr7c4c3vk3DsJCM-usUD9zvSdgrZKCM0OxKfnQWLPaeZw@mail.gmail.com>
	<20120705205709.GE3708@jama.jama.net> <4FF6086A.9000500@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4FF6086A.9000500@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 00/14] eglibc 2.16
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
X-List-Received-Date: Thu, 05 Jul 2012 22:06:50 -0000
X-Groupsio-MsgNum: 24768
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Wb5NtZlyOqqy58h0"
Content-Disposition: inline

--Wb5NtZlyOqqy58h0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 05, 2012 at 02:34:34PM -0700, Khem Raj wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 7/5/2012 1:57 PM, Martin Jansa wrote:
> > I was looking in meta/recipes-core/eglibc for switch forcing bfd
> > for it, but I haven't found it neither in 2.15 or 2.16..
>=20
> STAGINGCC is gcc-cross-intermediate for eglibc and gcc-cross-initial
> for eglibc-initial
>=20
> and if you look at gcc-cross-intermediate recipe then it uses
>=20
> in EXTRA_OECONF
>=20
> ${@base_contains('DISTRO_FEATURES', 'ld-is-gold',
> '--with-ld=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ld.bfd', '', d)}"
>=20
> which means it use ld.bfd when ld-is-gold is enabled.
>=20
> however we need something similar for gcc-cross-initial as well
> and thats why you see the problem with eglibc-initial
>=20
> I have created a patch and added it to the pull branch please
> try that out
>=20
> especially this one
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/eg=
libc-2.16&id=3D3b68cb3e23138c72e61771c50a4a4b08bb4d0865
>=20

yes this helps eglibc-initial:do_configre passed,

Thanks!

Cheers,

> Thanks
> - -Khem
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.12 (MingW32)
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/
>=20
> iEYEARECAAYFAk/2CGoACgkQuwUzVZGdMxSiXQCfT+LaNCf9iZAK1tr2fNsX8opW
> MAIAnihWe8FauLk+y3gmLMHcg8e+MfIf
> =3Dm9f1
> -----END PGP SIGNATURE-----
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Wb5NtZlyOqqy58h0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/2DV4ACgkQN1Ujt2V2gBwRCwCguwcYVwTWs3L3SsmI+rfdVqqc
TMQAoK113c6d7T01eIGWP0wJb08rN4sE
=ofIT
-----END PGP SIGNATURE-----

--Wb5NtZlyOqqy58h0--
