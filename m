Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RYKdx-0002uN-9M
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 17:46:53 +0100
Received: by eaao14 with SMTP id o14so626188eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2011 08:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fnV1PGV1/dIYuBeNo1Y1fLgM+DAuPfhrKXFnRQvBEUI=;
	b=u9zAChloaYUoC6Eu8reGOkNCv4bsRgXLFL2oLXlY1Oddz4v7mmp93/mkKbw1qOtykR
	hghWnc5E01ovaSrYCZLJ5ls3sxwlasTlT3+r4AOR+xToxf5z4Khcnc+CXm89/d53o//C
	5aZUyZH+7eBUti/gdWaB03tAgySRh2qe/9U9Q=
Received: by 10.213.29.68 with SMTP id p4mr710793ebc.41.1323276004612;
	Wed, 07 Dec 2011 08:40:04 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 65sm7609813eeg.8.2011.12.07.08.40.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Dec 2011 08:40:02 -0800 (PST)
Date: Wed, 7 Dec 2011 17:39:50 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: ulf@emagii.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111207163950.GH3897@jama.jama.net>
References: <4EDF9468.309@emagii.com>
MIME-Version: 1.0
In-Reply-To: <4EDF9468.309@emagii.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: bitbake core-image-sato fails:
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
X-List-Received-Date: Wed, 07 Dec 2011 16:46:53 -0000
X-Groupsio-MsgNum: 13753
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/Gk0KcsbyUMelFU1"
Content-Disposition: inline

--/Gk0KcsbyUMelFU1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 07, 2011 at 05:29:28PM +0100, Ulf Samuelsson wrote:
> Got the following error message when building core-image-sato:
>=20
> | Collected errors:
> |  * satisfy_dependencies_for: Cannot satisfy the following dependencies=
=20
> for task-core-x11-sato:
> |  *     ofono *
> |  * opkg_install_cmd: Cannot install package task-core-x11-sato.
> NOTE: package core-image-sato-1.0-r0: task do_rootfs: Failed
> ERROR: Task 8=20
> (/home/ulf/projects/OE_atmel/sources/openembedded-core/meta/recipes-sato/=
images/core-image-sato.bb,=20
> do_rootfs) failed with exit code '1'
>=20
> I then did
>=20
> $ bitbake ofono
>=20
> which built without problem.
>=20
> Repeated
>=20
> $ bitbake core-image-sato
>=20
> which then succeeded.

I can confirm, the same here (every time).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/Gk0KcsbyUMelFU1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7fltYACgkQN1Ujt2V2gBzzsQCfTdtq8Nucc+owsViwCwTbXuMi
l2IAn2iNsvwVHjsuTLkxwgNznMZhdo9H
=0NTg
-----END PGP SIGNATURE-----

--/Gk0KcsbyUMelFU1--
