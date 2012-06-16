Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sfn0d-00082Y-Of
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jun 2012 09:01:23 +0200
Received: by werg55 with SMTP id g55so2435706wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2012 23:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Adn1XRoDGnwTdid0EO8oVYu323HVLMsHC47aSWzTBh0=;
	b=oRWfBBzYh17ni/TB+sp34IEgzJ9a1szHWSNyWg7/i7+z+3iBvSVLTV+sTOq+kJPFPJ
	S9sjOYgEOogUQoMjbe8agRkUXW3jG2qNTv5D8mECIOy4gv+1QXhmUO2/52Mqcsefs3vx
	jAD8H37YjpQKlaTrDetjxjqlI2i6jXTQyHoCxfSQqaMc3Ex/mvKWWpRjNU0G2SETVQ4D
	i2J9MOXFK/lnRmZyu6PoGXWefhjbuqos48hdW/9nW6PQmeVmgSEpfMsXsWhhJ7RX2rxG
	dPP2lrslGqKhBCsJ/+MnXVjHltqROeYz0WrurIr4Op6DDGL2EWCK2SdU/K2ZebznoOco
	jUAQ==
Received: by 10.216.213.163 with SMTP id a35mr4798380wep.131.1339829444627;
	Fri, 15 Jun 2012 23:50:44 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f7sm14571176wiv.2.2012.06.15.23.50.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 15 Jun 2012 23:50:43 -0700 (PDT)
Date: Sat, 16 Jun 2012 08:51:04 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120616065104.GA3140@jama.jama.net>
References: <20120508180256.GB3138@jama.jama.net>
	<4FA971F0.8020406@windriver.com> <20120508142558.5837dc31@wrlaptop>
MIME-Version: 1.0
In-Reply-To: <20120508142558.5837dc31@wrlaptop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: CONFLICTS as keyword or just misspelled RCONFLICTS?
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
X-List-Received-Date: Sat, 16 Jun 2012 07:01:23 -0000
X-Groupsio-MsgNum: 23662
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XoSOsMJQ8mz74oyx"
Content-Disposition: inline

--XoSOsMJQ8mz74oyx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 08, 2012 at 02:25:58PM -0500, Peter Seebach wrote:
> On Tue, 8 May 2012 14:20:16 -0500
> Mark Hatle <mark.hatle@windriver.com> wrote:
>=20
> > > BTW: IIRC TUNE_CONFLICTS/TUNECONFLICTS inconsistency was discussed
> > > on ML already (I could not find that thread, but still it's used in
> > > meta/conf/machine/include/arm =20
> >=20
> > Ya, patches to fix these, and actually check them were sent to the
> > list, but I don't believe they have been merged yet.
>=20
> I hadn't noticed TUNE_CONFLICTS, just TUNECONFLICT and TUNECONFLICTS.
>=20
> As of this writing, I have two outstanding patches to do with that; I
> think the consistency patch is in, but we're still waiting on
> approval/more changes decisions on the sanity check implementation.

Any update on that?

OE @ ~/openembedded-core $ git grep TUNECONFLICTS
meta/classes/sanity.bbclass:    conflicts =3D data.getVarFlags('TUNECONFLIC=
TS') or {}
meta/conf/documentation.conf:TUNECONFLICTS[doc] =3D "List of conflicting fe=
atures for a given feature."
meta/conf/machine/include/README:TUNECONFLICTS[feature] - A list of feature=
s which conflict with <feature>.
meta/conf/machine/include/ia32/arch-ia32.inc:TUNECONFLICTS[m32] =3D "m64 mx=
32"
meta/conf/machine/include/ia32/arch-ia32.inc:TUNECONFLICTS[mx32] =3D "m64 m=
32"
meta/conf/machine/include/ia32/arch-ia32.inc:TUNECONFLICTS[m64] =3D "m32 mx=
32"
meta/conf/machine/include/mips/arch-mips.inc:TUNECONFLICTS[o32] =3D "n32 n6=
4"
meta/conf/machine/include/mips/arch-mips.inc:TUNECONFLICTS[n32] =3D "o32 n6=
4"
meta/conf/machine/include/mips/arch-mips.inc:TUNECONFLICTS[n64] =3D "o32 n3=
2"
meta/conf/machine/include/tune-c3.inc:TUNECONFLICTS[c3] =3D "m64 mx32"

OE @ ~/openembedded-core $ git grep TUNE_CONFLICTS
meta/conf/machine/include/arm/arch-armv5.inc:TUNE_CONFLICTS[armv5] =3D "arm=
v4"
meta/conf/machine/include/arm/arch-armv6.inc:TUNE_CONFLICTS[armv6] =3D "arm=
v4 armv5"
meta/conf/machine/include/arm/arch-armv7a.inc:TUNE_CONFLICTS[armv7a] =3D "a=
rmv4 armv5 armv6 armv7"
meta/conf/machine/include/powerpc/arch-powerpc64.inc:TUNE_CONFLICTS[m64] =
=3D "m32 nf"
meta/conf/machine/include/tune-mips32.inc:TUNE_CONFLICTS[mips32] =3D "n64 n=
32"

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XoSOsMJQ8mz74oyx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/cLNgACgkQN1Ujt2V2gBxhWgCdEAtqoZ6I4ObHZUTSessB2bdx
T6cAnjcTz+ZnUE7LTOHpDY2r+rvTKN1O
=jamj
-----END PGP SIGNATURE-----

--XoSOsMJQ8mz74oyx--
