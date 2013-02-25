Received: from mail-ee0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U9sth-0007XD-1y
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Feb 2013 08:54:56 +0100
Received: by mail-ee0-f41.google.com with SMTP id c13so1221928eek.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Feb 2013 23:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=WuvbGNc+jCiJ/3a1MNdfn9utYTad0llkAo7xAFtTbcU=;
	b=k4gCJs4ACiWxj7JQympuBkAaQsNcZIw6OZVEcjI8Wio++4ExIK4xABGsaRjloKHFfG
	w67VAwE7y42TJJmpg0VurkVUiHKXYyrl6C5oumGXNh5lnss4BSYB67P/6qqk3iyHJaSf
	5kOaFjHy4P+3LyA6ofnZzxIGXUNfMxCek63SqR7fKGHWH1aGD2H8gAXKgSP11AUY1gJp
	zuqOI4fImqbEVNy7J3gdXr7kWZw/0elpb4L41g7j9O72JvhXH4OwxDW/94gov32sGwh3
	j/uBXP9l5ARY1M0OUJM6LHqkeoqDe2qdHp+H1hFo7lSvGU/ghKZERAD769OTVEr0A2G3
	ad4Q==
X-Received: by 10.14.218.71 with SMTP id j47mr35868205eep.28.1361777915735;
	Sun, 24 Feb 2013 23:38:35 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id o3sm16798129eem.15.2013.02.24.23.38.34
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 24 Feb 2013 23:38:35 -0800 (PST)
Date: Mon, 25 Feb 2013 08:38:52 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20130225073852.GD3300@jama>
References: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LYo_FLTkZ_OiFf6Tt_oYO6NoUAUB74s__2UcKv7ccdxaA@mail.gmail.com>
	<E79C80CE9122499B9C7D2D855CDF6319@intel.com>
	<CAP9ODKphcmassr66cE_=M5R20gEYVwbVLwyoZu5NnKi6W0T5Kg@mail.gmail.com>
	<399178DB9667444C94B177EA9AC61726@intel.com>
MIME-Version: 1.0
In-Reply-To: <399178DB9667444C94B177EA9AC61726@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFE: make the init manager an image feature (again)
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
X-List-Received-Date: Mon, 25 Feb 2013 07:54:56 -0000
X-Groupsio-MsgNum: 35769
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="j0LrB7C7xlgW/F3D"
Content-Disposition: inline

--j0LrB7C7xlgW/F3D
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 24, 2013 at 10:04:42PM +0000, Ross Burton wrote:
> On Sunday, 24 February 2013 at 14:06, Otavio Salvador wrote:
> > > DISTRO_FEATURES contains the init script *style* that you want: sysvi=
nit or systemd. These are not mutually exclusive so specifying both will ge=
t you both directly in packages that support both. I'm still not convinced =
we need to split these out into separate packages, the size impact is pract=
ically negligible and the dependencies are effectively redundant as you'll =
have trouble booting without an init system. Instead the postinsts should w=
rap the initscript fragments in checks.
> > =20
> > =20
> > The size impact it not negligible; specially for initramfs images but
> > what concerns me even more is the upgrade path from previous users of
> > meta-oe systemd.
>=20
>=20
> I obviously didn't make myself clear - the size impact is negligible when=
 you're talking about just the init script - the dependencies on systemd/up=
datercd could be recommends at most, as the postinst scripts could check wh=
at init system they have before calling any tools.  Either way a rescue ima=
ge that boots using busybox init shouldn't have systemd, clearly.
> > I'd like to have an upgrade path.
>=20
> Well, strictly speaking oe-core itself doesn't have an upgrade path to co=
nsider=E2=80=A6 Why can't any distros that shipped with meta-systemd (or ju=
st in meta-systemd) have an include that injects the RPROVIDES/RREPLACES/RC=
ONFLICTS for the packages that they enabled?

That would force multiple distro layers to maintain many .bbappends with
just RPROVIDES/RREPLACES/RCONFLICTS and PRINC bump maintaned forever.

It was pain to rename .bbappends in meta-systemd after each .bb upgrade,
so if we have to do that, then we should rather keep meta-systemd as
layer so that we can share .bbappend maintenance for all distributions in
one place.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--j0LrB7C7xlgW/F3D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlErFQwACgkQN1Ujt2V2gBwcywCfRa2X7/U0BKiKwTj+imRTrXsh
ku4AoJpGRr1JWVTNCelww/6pp4VITgU8
=gNNT
-----END PGP SIGNATURE-----

--j0LrB7C7xlgW/F3D--
