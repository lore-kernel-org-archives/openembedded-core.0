Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id AA3FB71B1D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 19:15:20 +0000 (UTC)
Received: from svr-orw-fem-04.mgc.mentorg.com ([147.34.97.41])
	by relay1.mentorg.com with esmtps (TLSv1:ECDHE-RSA-AES256-SHA:256)
	id 1e2MTP-0003jG-Ic from Joe_MacDonald@mentor.com ;
	Wed, 11 Oct 2017 12:15:19 -0700
Received: from burninator.cal.mentorg.com (147.34.91.1) by
	svr-orw-fem-04.mgc.mentorg.com (147.34.97.41) with Microsoft SMTP
	Server id 14.3.224.2; Wed, 11 Oct 2017 12:15:19 -0700
Received: by burninator.cal.mentorg.com (Postfix, from userid 1000)	id
	6A4985927FD; Wed, 11 Oct 2017 15:15:18 -0400 (EDT)
Date: Wed, 11 Oct 2017 15:15:18 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Lennart Sorensen <lsorense@csclub.uwaterloo.ca>
Message-ID: <20171011191518.avvpmvug6pr7hafj@mentor.com>
References: <20171011190313.ptqnubjcszlo23ns@csclub.uwaterloo.ca>
MIME-Version: 1.0
In-Reply-To: <20171011190313.ptqnubjcszlo23ns@csclub.uwaterloo.ca>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-800 http://www.vim.org
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Why is dnrd blacklisted?
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
X-List-Received-Date: Wed, 11 Oct 2017 19:15:20 -0000
X-Groupsio-MsgNum: 103856
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jct6co5ddsik2ipt"
Content-Disposition: inline

--jct6co5ddsik2ipt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Why is dnrd blacklisted?] On 17.10.11 (Wed 15:03) Lennart Sorensen wrote:

> There is a blacklist entry in the recipe for dnrd claiming there are QA
> issues in the package.
>=20
> However when the blacklist is removed and the package is built, there
> are no QA warnings at all from the package and it seems to be working
> perfectly fine.
>=20
> Could this blacklist be removed since it makes it harder to build than
> it has to be and there is apparently nothing wrong with the recipe in
> the first place.

Even more so since it was actually removed about a month ago from the
tree.  :-)

But yes, I'm happy to consider a patch that resurrects it if it seems to
be working now.  I couldn't find the discussion around the QA error in
the mailing list, so it was probably something that came up over IRC.  I
don't know.  If it was something the world build found there's (almost?)
always a link to the build log.

--=20
-Joe MacDonald.
:wq

--jct6co5ddsik2ipt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEkMd/b97HINT8/zEqSfx99yw59pYFAlnebcUACgkQSfx99yw5
9paa8QgAnqzXBH083TZ2IabgIBgm7NTG95v5VXZyv478AEg4KGxcka1JOFps81Ty
iYkUCp/F+2do1jN0dmLf9i5yATKGjgDjlF3agRYPngcFigfIDjIVdXCkrghWmsVl
B52hbj8O3jGEZt6Bmo06H4Ne60qTysgzNRj7CKVtfrBVoaO0SKptnu+/BoGwz8SZ
zqCSjR70+sVwnwzrwVRMOp2/PNkqVBdvgBP8pyGR1BbacK8jQWtt/+AWNCRoCUl8
etcLqbl23cQjNLHQn+1CcsfXXxJtfSyubIdJHGgkIAAZUNpKqDe82IL/cB/VFlmz
3QbUA3Tc6maYfk1aR/ZYzY2Heb9Kow==
=IqCA
-----END PGP SIGNATURE-----

--jct6co5ddsik2ipt--
