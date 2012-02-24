Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0sbT-0007EP-8M
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 11:42:19 +0100
Received: by eekd41 with SMTP id d41so1045326eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 02:33:57 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.37.69 as permitted sender) client-ip=10.14.37.69; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.37.69 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.37.69])
	by 10.14.37.69 with SMTP id x45mr1101977eea.43.1330079637112 (num_hops
	= 1); Fri, 24 Feb 2012 02:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RSwOb6r5DZBczGfVhpquYfOacIKF1ni59owxmHjdCTw=;
	b=NHSnt5274q9NOoMXVSDqSpJaZBmUE6T49TaJbPGhlfl8vXp7P38oOlAThqjM4XPy4m
	wRwBYrOmg4Ruhtz6H10BFJmKuOCB0Q1JpEjw13V36W989oMUY+1Y1lmtNs1Y0VITfy7z
	jVvVAEf7bykqJdxtQg4VEDQZhIxSCwC2A90Tk=
Received: by 10.14.37.69 with SMTP id x45mr838146eea.43.1330079637019;
	Fri, 24 Feb 2012 02:33:57 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u11sm9366111eeb.1.2012.02.24.02.33.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 02:33:55 -0800 (PST)
Date: Fri, 24 Feb 2012 11:33:52 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120224103352.GH3769@jama.jama.net>
References: <4F4645CC.4050403@opendreambox.org>
	<20120223140409.GT3769@jama.jama.net>
	<4F466F3D.8060504@opendreambox.org>
	<20120223210101.GB3769@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120223210101.GB3769@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: bug in recipe version priorities across layers?
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
X-List-Received-Date: Fri, 24 Feb 2012 10:42:19 -0000
X-Groupsio-MsgNum: 17897
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6ZcLte273om6Oiqd"
Content-Disposition: inline

--6ZcLte273om6Oiqd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2012 at 10:01:01PM +0100, Martin Jansa wrote:
> please just send patch removing python-setuptools from meta-oe,
> NATIVE_INSTALL_WORKS isn't needed in oe-core world.. and now with
> python-setuptools_0.6c11.bb in oe-core it doesn't make sense to keep
> both :).
>=20
> > Another strange one, this time with unequal versions:
> >=20
> > mpfr:
> >   meta-oe              3.0.0-r4
> >   meta                 3.1.0-r0
> > mpfr-native:
> >   meta                 3.1.0-r0
> >   meta-oe              3.0.0-r4
>=20
> This also looks like candidate for removal or at least conversion to
> .bbappend if there is significant diff between meta-oe and oe-core.

I've checked the diff and there was just patch for newer patchset P4 and
small patch for thumb (long-long-thumb.patch) which is not yet in
upstream 3.1.0, I'll test 3.1.0 on armv4t and send patch adding
long-long-thumb.patch to oe-core version and drop it from meta-oe.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6ZcLte273om6Oiqd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9HZ5AACgkQN1Ujt2V2gBzS1gCcCIezTvdRncOU23QzUV40/fMb
ozMAniaUgKijSdbGV9zGx2f6WpkXnjCM
=MQ0+
-----END PGP SIGNATURE-----

--6ZcLte273om6Oiqd--
