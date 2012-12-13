Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tix5r-0002uj-Lh
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Dec 2012 01:56:13 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so873896eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2012 16:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=z2M65yP4jejx5aMxSu7LaCu7qCf9eObM2dsEMrWgCuI=;
	b=lwf4xQuGOJEqghO9IT/DoiaG5N8hCQg5ZhSUi2HePmn0M5aFTn3/Mg/YVkrihKCTXU
	YEpZIhWC0rHIPEC3Fr7QUhka2f9X2m4amZ/jrTY4qPStudWByyZeXWx6SJ6tdYNwbYDm
	0vrt8BSrOO7Sck5GAshCRxRzdffz7wR7y26SIf8yZxhk09JhPe5I/p0JJKliSpPndDdA
	mn6w/gKpfplLMujcFYJ3q3Y2QX9Vxc0fee9FZRb1zGM9gyaqAzdsMhG3SKX2aMo0lvVc
	+4gGnGhpDKHco7/1zULaDNKmiDmReiG/8oLeWGrDgXVHFtT1NIs6//v5JJrVCeyA1wAM
	54fA==
Received: by 10.14.174.198 with SMTP id x46mr68518eel.23.1355359293332;
	Wed, 12 Dec 2012 16:41:33 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 46sm59109467eeg.4.2012.12.12.16.41.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Dec 2012 16:41:32 -0800 (PST)
Date: Thu, 13 Dec 2012 01:41:47 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20121213004147.GA3413@jama.jama.net>
References: <alpine.DEB.2.02.1212121908030.31574@oneiric>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1212121908030.31574@oneiric>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: remaining few uses of "pnum=" for patches
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
X-List-Received-Date: Thu, 13 Dec 2012 00:56:13 -0000
X-Groupsio-MsgNum: 32595
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Content-Disposition: inline

--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 12, 2012 at 07:10:46PM -0500, Robert P. J. Day wrote:
>=20
>   just noticed that in all of the layers i have checked out (about a
> dozen), the usage of the deprecated "pnum=3D" is down to:
>=20
> meta-openembedded/meta-oe/recipes-support/vim/vim_7.2.446.bb:SRC_URI +=3D=
 "http://ftp.vim.org/pub/vim/patches/7.2/7.2.001-100.gz;name=3Dp001-100;app=
ly=3Dyes;patchdir=3D..;pnum=3D0"
> meta-openembedded/meta-oe/recipes-support/vim/vim_7.2.446.bb:SRC_URI +=3D=
 "http://ftp.vim.org/pub/vim/patches/7.2/7.2.101-200.gz;name=3Dp101-200;app=
ly=3Dyes;patchdir=3D..;pnum=3D0"
> meta-openembedded/meta-oe/recipes-support/vim/vim_7.2.446.bb:SRC_URI +=3D=
 "http://ftp.vim.org/pub/vim/patches/7.2/7.2.201-300.gz;name=3Dp201-300;app=
ly=3Dyes;patchdir=3D..;pnum=3D0"
> meta-openembedded/meta-oe/recipes-support/vim/vim_7.2.446.bb:SRC_URI +=3D=
 "http://ftp.vim.org/pub/vim/patches/7.2/7.2.301-400.gz;name=3Dp301-400;app=
ly=3Dyes;patchdir=3D..;pnum=3D0"
> meta-openembedded/meta-oe/recipes-support/vim/vim_7.2.446.bb:SRC_URI +=3D=
 "file://401-446.diff;patchdir=3D..;pnum=3D0"
>=20
>   given that that's a single recipe, what about fixing that recipe,

Good plan, please send patch.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDJJEsACgkQN1Ujt2V2gBzecQCff5Hbzn8lnJF5+5DnrfCZHuV1
/boAmwcOnbVnmkwkHzHsqJYHB/DsccGa
=AuAZ
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
