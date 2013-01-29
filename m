Received: from mail-pb0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U09Xd-0007SK-4I
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 12:39:53 +0100
Received: by mail-pb0-f53.google.com with SMTP id un1so223539pbc.40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 03:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=4YDKZfvFs8VtpsivwRgTReHKrYhnB8xJW5FXEyAEMtI=;
	b=U86Ao6jbsfARf7OOWT4qUs6UxecmwIZRfRklbNNUk3w7UWdkbK6nSEwR/yduEz9zPP
	X9cAU9njJtGTgPz/8uNvhhK1fuSEf94cPjFRtP9TnQQpQjD4rKDU2NX2qLRseK830Mpe
	fsKOW+GhonTu5vxaaR5xQsrbTk5+7146GvauYM0ItB5TkZfxE27jF/+E+IYGFgSsIEoK
	xjPvwHjExMZV4iLE7GJ4wgLH7ymGMXMaUwTVWnp0gsvq0TEDjVBP+MEXvjQ8eSwUJg5h
	Isyg5WkOZfHLXHF1wnZni/JVLIWs22LXh3LAVHwlXkTiYH4W/k1YMuepkzZYn7OYX1oa
	bHkg==
X-Received: by 10.66.72.97 with SMTP id c1mr1787680pav.48.1359458652612;
	Tue, 29 Jan 2013 03:24:12 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id i1sm8748110pav.35.2013.01.29.03.24.09
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 03:24:11 -0800 (PST)
Date: Tue, 29 Jan 2013 12:24:06 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20130129112406.GK16904@jama.palm1.palmone.com>
References: <alpine.DEB.2.02.1301290359260.12134@oneiric>
	<20130129094422.GJ16904@jama.palm1.palmone.com>
	<alpine.DEB.2.02.1301290453220.12871@oneiric>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1301290453220.12871@oneiric>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: BB_NO_NETWORK = "1" causes fetch to fail for unnecessary u-boot parsing
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
X-List-Received-Date: Tue, 29 Jan 2013 11:39:56 -0000
X-Groupsio-MsgNum: 34629
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x/TyKPcLwmKZr+b7"
Content-Disposition: inline

--x/TyKPcLwmKZr+b7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 29, 2013 at 04:54:30AM -0500, Robert P. J. Day wrote:
> On Tue, 29 Jan 2013, Martin Jansa wrote:
>=20
> > On Tue, Jan 29, 2013 at 04:08:10AM -0500, Robert P. J. Day wrote:
> > >
> > >   not sure if this is expected behaviour, but i'm using the meta-ti
> > > layer to build a core-image-minimal for a am180x-evm.  i'm using
> > > "own-mirrors" to use my own premirrors directory and i've collected
> > > all of the necessary tarballs and actually completed the build, after
> > > which i make sure i have saved all of the tarballs so i don't need
> > > to download anything for a subsequent build.
> > >
> > >   as a test, i totally delete my build and start over, but this time
> > > with
> > >
> > >   BB_NO_NETWORK =3D "1"
> > >
> > > which i assumed would still work.  instead, i almost immediately got
> > > this:
> > >
> > > $ bitbake -c fetch core-image-minimal
> > > Pseudo is not present but is required, building this first before the
> > > main build
> > > ERROR: ExpansionError during parsing
> > > /home/rpjday/oe/dist/layers/meta-ti/recipes-bsp/u-boot/u-boot_2013.01=
=2Ebb:
> > > Failure expanding variable SRCPV, expression was
> > > ${@bb.fetch2.get_srcrev(d)} which triggered exception NetworkAccess:
> > > Network access disabled through BB_NO_NETWORK but access requested
> > > with command git ls-remote
> > > git://arago-project.org/git/projects/u-boot-keystone.git
> > > DEV.MCSDK-03.00.00.06 (for url None)
> > > ERROR: Command execution failed: Exited with 1
> >
> > It's using tag instead of hash in SRCREV, so it behaves the same as
> > SRC_URI =3D "git://.*;tag=3Dfoo" and tries to access upstream repo to
> > convert tag name to hash (or check if it's still the same hash as when
> > you've built it last time.
>=20
>   ah ... so as a cheap hack to get around this, as long as i don't
> need that recipe, i guess i could just BBMASK it out.  is that the
> easiest solution?  thanks.

It would be better to change SRCREV to hash corresponding to that tag
and move tag only to comment above SRCREV. Such patch could be applied
in upstream...

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--x/TyKPcLwmKZr+b7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEHsVYACgkQN1Ujt2V2gBwDEwCglo00RULLryghJkxJCS1cWDqF
yx8An0mvKYwaGkdadp+zQ2pjZhETjaaA
=FOs2
-----END PGP SIGNATURE-----

--x/TyKPcLwmKZr+b7--
