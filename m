Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T3nQR-0004AM-1e
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 14:19:15 +0200
Received: by weyr6 with SMTP id r6so4806748wey.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2012 05:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/xuvvbOLG/jJ80QVSwOkj6mDqO/5T6mlvzp2i+Ini6s=;
	b=BG2/mSsJadrFee9ekCeor24sXzoWLHqXcz85k3fjc1XDo31lgZU0ecD72UI8F83AZ5
	g4lnrTX3/dapXUYpj5EW0ndw4QqvXwsZhNp++ugSNufbauJVBZpN2HjcrfAXVUSVvbdC
	nj/eireH8VIya9ekJWjEEMRGxjY4ToNJnTMlNDMnH3XwbtzdW4uF1uwD1OmNIYvSgiIv
	+uzCGGMwxmHgfAvSCKVOBX2mg1obqNdgx45RBWDE8mIjN9StP1pKwguOf069H0M0guo8
	lFV10TkQo37vRTkBNTb5fmbnqJBGBWIm1AcAZqGx9MynSV/NFrX/aH0HzX+/WPPxIY6u
	YcRQ==
Received: by 10.216.239.207 with SMTP id c57mr8699603wer.3.1345550831474;
	Tue, 21 Aug 2012 05:07:11 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t8sm33332135wiy.3.2012.08.21.05.07.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Aug 2012 05:07:09 -0700 (PDT)
Date: Tue, 21 Aug 2012 14:07:14 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Phil Blundell <philb@gnu.org>
Message-ID: <20120821120714.GC3029@jama.jama.net>
References: <CAMKF1srjqDsesRcWP7oGzouPj9aOt_Ln0aOWE9cEQwpUQ7Unuw@mail.gmail.com>
	<50337719.7040801@linaro.org>
	<1345550404.2673.23.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1345550404.2673.23.camel@phil-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Toolchain rework, call for testing
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
X-List-Received-Date: Tue, 21 Aug 2012 12:19:15 -0000
X-Groupsio-MsgNum: 27976
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bu8it7iiRSEf40bY"
Content-Disposition: inline

--Bu8it7iiRSEf40bY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 21, 2012 at 01:00:03PM +0100, Phil Blundell wrote:
> On Tue, 2012-08-21 at 13:55 +0200, Marcin Juszkiewicz wrote:
> > W dniu 17.08.2012 06:47, Khem Raj pisze:
> > > Hi All
> > >=20
> > > Recently glibc build has been simplified upstream. It has dropped the
> > > dependency on libgcc_s and libgcc_eh for building glibc itself.
> > > This means that we can simplify our toolchain bootstrap a bit by
> > > dropping 1 of the 3 cross gcc build stages. We do not need
> > > gcc-cross-intermediate anymore.=20
> >=20
> > Please adapt also toolchain-layer in meta-oe for those stuck with gcc 4=
=2E6.
>=20
> Why is it that gcc-4.7 doesn't work for those people?

At least it should parse for people who have toolchain-layer enabled..

Parsing recipes...ERROR: ParseError at
/OE/shr-core/meta-openembedded/toolchain-layer/recipes-devtools/gcc/gcc-cro=
ss-intermediate_4.6.bb:2:
Could not include required file
recipes-devtools/gcc/gcc-cross-intermediate.inc

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Bu8it7iiRSEf40bY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAzefIACgkQN1Ujt2V2gBzr5gCguqu4H9tuqHSvP7atAEjMfWY8
trQAoK8gb8g3BT83W/MICuR3peI+jt5X
=ytUZ
-----END PGP SIGNATURE-----

--Bu8it7iiRSEf40bY--
