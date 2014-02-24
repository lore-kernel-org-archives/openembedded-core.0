Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id BDD266E8E2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 16:09:57 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id z10so2882789ead.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 08:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=a5yvQFoNgAX2Zd/hxa0K/5ga8g+Cj2jnQeMLsSgiYUo=;
	b=OqKjJYEu22PO/8zlWGu/f57NX0coP/FAdmgJ9rrAkzfJZWljDWYxOoZdpYMUdO6Eyy
	Ppi0JwykDYySCQktfAftD6zqgJukZ7eADj6uxYpGyo2h6vw4HQE4aYCJlSJgYkBQ6KI0
	/288k8JLvEWxp++zZ587PfsH3jm5XjWwtIn9MILofes4ViDWKdFjFwZl5WrQgOU05QKx
	DF6SSKctMLd0tRk0PkukVLKXxv7wyklSh0o0x/g1+SI2f3N7L/GhZHR68Rvd1RNg2bUz
	DiefEZXV8sOYOol0ppdFNO/PS73erK4KRNHeaSBX9J3CrO3UJNlZ0rK1YyaV7QAjQS9W
	50PA==
X-Received: by 10.15.34.71 with SMTP id d47mr1093223eev.107.1393258198054;
	Mon, 24 Feb 2014 08:09:58 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	n48sm44475004eew.0.2014.02.24.08.09.55 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Feb 2014 08:09:56 -0800 (PST)
Date: Mon, 24 Feb 2014 17:09:54 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20140224160954.GI26981@jama>
References: <1393253881.31769.6.camel@ted> <20140224152753.GG26981@jama>
	<CAJTo0LYBuZv5NDyM1gsQEL5KQfOvMsRpvOn5kjFaYBi5XL8wCw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYBuZv5NDyM1gsQEL5KQfOvMsRpvOn5kjFaYBi5XL8wCw@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Separate build dir for autotools
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Feb 2014 16:09:58 -0000
X-Groupsio-MsgNum: 50523
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RwxaKO075aXzzOz0"
Content-Disposition: inline

--RwxaKO075aXzzOz0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2014 at 03:41:11PM +0000, Burton, Ross wrote:
> On 24 February 2014 15:27, Martin Jansa <martin.jansa@gmail.com> wrote:
> > Can we start by adding
> > include conf/distro/include/seperatebuilddir.inc
> > to
> > conf/distro/defaultsetup.conf
> > ? so that more people start using it and possibly report issues in their
> > builds?
>=20
> That list is opt-in and mainly covers oe-core, so this gets tested
> every time the YP autobuilder does a world build.  We need a meta-oe
> world build where autotools.bbclass sets B=3D"${WORKDIR}/build": it's
> literally just this one-line patch.

But doesn't cover oe-core built with different combinations for
PACKAGECONFIGs, .bbappends etc, so including this file in
defaultsetup.conf can still reveal few issues in oe-core recipes.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RwxaKO075aXzzOz0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMLbtIACgkQN1Ujt2V2gBx0gwCfWCyYbnvegnfVLS5KlnJctkge
YHQAnR0bh+omfp6N0dNRX+JXda+thWh1
=yBQu
-----END PGP SIGNATURE-----

--RwxaKO075aXzzOz0--
