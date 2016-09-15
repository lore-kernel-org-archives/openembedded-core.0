Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
	[74.201.84.163])
	by mail.openembedded.org (Postfix) with ESMTP id 2247C7318D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 02:21:06 +0000 (UTC)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
	[76.250.84.236]) by mx.zohomail.com
	with SMTPS id 1473906063736845.6003193286251;
	Wed, 14 Sep 2016 19:21:03 -0700 (PDT)
Date: Wed, 14 Sep 2016 21:21:02 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20160915022102.GA25351@heinlein.lan>
References: <20160914162519.16212-1-patrick@stwcx.xyz>
	<CAKUP++va+C=1wLQPMdb+=Pd-CLGigC=RREQb0OfnFnwh5fzJJA@mail.gmail.com>
	<CA+chaQfb_L2VZUXiK07rd4aBUn508CjtWp1R1R8weYHUaJHRSg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQfb_L2VZUXiK07rd4aBUn508CjtWp1R1R8weYHUaJHRSg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] e2fsprogs: configure with enable-symlink
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
X-List-Received-Date: Thu, 15 Sep 2016 02:21:07 -0000
X-Groupsio-MsgNum: 87134
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline

--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 14, 2016 at 11:23:47PM +0200, Martin Jansa wrote:
> It was also proposed and discussed some 15 months ago and it was packaging
> issue not handling hardlinks correctly:
> http://lists.openembedded.org/pipermail/openembedded-core/2015-April/1039=
39.html
>=20
> I believe this was fixed then, but maybe it got broken again?

Sorry, this is my fault.  I didn't think about hard-links.  I was just
skimming the cpio extract for parts that could be trimmed out and
noticed it.

    $ ls -i *fsck*
    19455718 e2fsck
    19455671 fsck
    19455718 fsck.ext2
    19455718 fsck.ext3
    19455718 fsck.ext4
    19455718 fsck.ext4dev
    19455679 fsck.minix
    19455695 fsck.minix.util-linux
    19455675 fsck.util-linux

Is there a reason to prefer hardlinks over softlinks, for my own
education?  My desktop system used softlinks for fsck.

--=20
Patrick Williams

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX2gWOAAoJEKsDR8wtAMEZhsMP/1oHb4T1OLHZkABs46TG+bv0
td5rKECb6D+mDPiniEB/USldydvG7XfYS8HuJzYxcwVGU4vjLJ8gRSVGL+uA2Alb
XetWdmmOvRaPjNjbImFV/xzFBJbvp/WzuR8X9GWkaGGys+T6pPHez0JWyIlC9YD/
+Dnq5/9iGEyxaSipJz3PgQNK27YZNrEzrg6n0yFw/AZOdkkovfFEwKfgN/F8HTuH
GdDmKRVF3v04FPGEQ5dqdWhJSbWKaDd6Fv5OncPNnDuWSTVsDRY+uNBBdQIBxPnV
/ohHHnzk49Iag5ttsvMrttBKfJSjBd+TjLytc6J70sga87csnhYtvA7G06qNjF3c
G785gjm/GcoqSc5wXhpehWWiKUugMpxSZJ8BIafrhXg5/gGVO3Qxlly3pnWXvjuZ
HKrMKhoAQUYP3cQlewe0yuWFZPpFFl0zzdhpO11ZIIXqa/5sG6d0ukZwEbB4CmpJ
4sqDQyg77kqNduoUOUUucUuZs+DX0CyXl5+Xz+3d5vKkt3yrWpL3nsMp9EKPA71l
BGNRD1zZwqW7IuVM3dWQdkOC8l/ITbsBboidLfjqQDWJZHO2Q/MbFHp4wyauheME
yF+diqgdoimAodDRH4b3E1Ds0FZwl5UzFdAwaZZWV1+/r7ApekdU4XkfayqDcfr9
X8Rw6z6NErBMBDvg3dBS
=ao9E
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
