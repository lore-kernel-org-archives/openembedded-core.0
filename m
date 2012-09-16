Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TD8C2-0007zg-EF
	for openembedded-core@lists.openembedded.org;
	Sun, 16 Sep 2012 08:18:58 +0200
Received: by wgbdq11 with SMTP id dq11so1542011wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Sep 2012 23:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=aAvAx3L7C7/z2V4zt7AZOyy2jP9XnL3BIixmG1ETWQ8=;
	b=G82dNYy+5nFOfU+tF7F6oeU/jnz3/L7J1nt0bmlomLV/QtUHSIVXfqY3ZPCGkRBCLf
	fVj4/qFL9F1E5src4pQuOnQ/U52HpID0lhkAGs2SWlg2j3LrwC3YGPfsQ5FMGa6Y+xLX
	uiHbJlh/1zob9ki4yKk4jQzCrjFDIHCuh7mk7+0ugVl5/sk2jAB1gaDIqueX5aQi/DK/
	G+wgzR8veRRFhIrAgyk5THAIoXi/GoNhZAk/iyTL2KMyKH/Oi1KAAQ0n+iqOH2IDp+hP
	lFwey+hhgqsfvdyXzOIq8KrglUaINK59X+9raWHX2OaAJOyHJ03wD1Bnd2yp0aoGbo1X
	LnfQ==
Received: by 10.180.84.104 with SMTP id x8mr8154267wiy.20.1347775581382;
	Sat, 15 Sep 2012 23:06:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t7sm14041181wix.6.2012.09.15.23.06.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 15 Sep 2012 23:06:20 -0700 (PDT)
Date: Sun, 16 Sep 2012 08:06:26 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120916060626.GA3628@jama.jama.net>
References: <CAMKF1sokpajrms4PACKOSt8CYFt+6JEQ2Fre=QpzJfQF-KLrKA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sokpajrms4PACKOSt8CYFt+6JEQ2Fre=QpzJfQF-KLrKA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: binutils 2.23 call for testing the recipes
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
X-List-Received-Date: Sun, 16 Sep 2012 06:18:58 -0000
X-Groupsio-MsgNum: 29358
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline

--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 08, 2012 at 10:45:19AM -0700, Khem Raj wrote:
> Hi
>=20
> Binutils 2.23 branch has started upstream. Given that toolchain
> components require a lot of soak time, I have created the recipes
> for binutils 2.23 and pushed it here
>=20
> http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/binut=
ils-2.23

After last rebase of this branch, upgrade from 2.22.92* (or something
like that) to git with SRCREV d56d3537a00d85d9072156026f426c931ba21fba

I see errors like this
https://lists.gnu.org/archive/html/bug-binutils/2012-09/msg00036.html
when building 2.6.39 kernel for armv4t
| arch/arm/lib/copy_template.S: Assembler messages:
| arch/arm/lib/copy_template.S:100: Error: selected processor does not
support ARM mode `ldralt r3,[r1],#4'

Is it binutils bug or something needs to be changed in kernel again?

Cheers,

>=20
> If you are using angstrom set
>=20
> ANGSTROM_BINUTILS_VERSION =3D "2.23" in local.conf after pulling that bra=
nch
> for OE-Core it will work as it is
>=20
> Let me know if you see any errors.
>=20
> I will keep updating it until 2.23 release
>=20
> Thanks
> -Khem
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBVbGIACgkQN1Ujt2V2gBzo1gCeOFjwvOApVWcAc0oS1NsIEzIT
tQ0AmwX81/bgdV6z0p/0mlFv/adXTG3y
=usUM
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
