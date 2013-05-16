Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe@deserted.net>) id 1Ud03y-0005I3-II
	for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 17:25:52 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4GBb46h007622
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2013 04:37:05 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Thu, 16 May 2013 04:37:04 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 0E84F7FCE;
	Thu, 16 May 2013 07:36:50 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 7905443430; Thu,
	16 May 2013 07:37:03 -0400 (EDT)
Date: Thu, 16 May 2013 07:37:03 -0400
From: Joe MacDonald <joe@deserted.net>
To: Jesse Zhang <sen.zhang@windriver.com>
Message-ID: <20130516113702.GB11432@windriver.com>
References: <51948307.5070608@windriver.com>
MIME-Version: 1.0
In-Reply-To: <51948307.5070608@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Editor: Vim-703 http://www.vim.org
Cc: openembedded-core@lists.openembedded.org
Subject: Re: should perl modules go in oe-core? (possibly python and ruby ones too)
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
X-List-Received-Date: Thu, 16 May 2013 15:25:55 -0000
X-Groupsio-MsgNum: 39344
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BwCQnh7xodEAoBMC"
Content-Disposition: inline

--BwCQnh7xodEAoBMC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[OE-core] should perl modules go in oe-core? (possibly python and ruby one=
s too)] On 13.05.16 (Thu 14:56) Jesse Zhang wrote:

> Hi,
>=20
> We've accumulated quite a few perl modules and would like to contribute
> some/all of them to oe-core. But I think we'd better ask how everyone
> thinks before doing so, since the number of the modules are pretty
> large, and the policy may as well apply to python/ruby packages.
>=20
> Most of the modules are simple cpan recipes. They are easy to maintain,
> but do consume *some* manpower.
>=20
> I think there are a few alternatives.
>=20
> 1. decide on each module on a case-by-case basis.
>=20
> 2. keep all of them in some special layer other than oe-core.
>=20
> 3. everyone maintain what they need in-house.

Have you considered the possibility of a meta-perl or meta-cpan layer in
meta-openembedded?  It was the first thing that occurred to me and I see
both Phil and Richard making pretty similar suggestions.  There's
already a meta-ruby layer there and it may also help address some of the
perl dependency problems that crop up in recipes in meta-Openembedded.

-J.

>=20
> None of them seems perfect. Is there already some policy?
>=20
> jesse
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
-Joe MacDonald.
:wq

--BwCQnh7xodEAoBMC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlGUxN4ACgkQPN8S4W6ZZncPpQCfS2aSEvB0LqRa9rT1zob/Hn1M
QysAn26boAfsBgKmbIM1acnsH3inQ5it
=HiiP
-----END PGP SIGNATURE-----

--BwCQnh7xodEAoBMC--
