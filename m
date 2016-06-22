Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
	[74.201.84.163])
	by mail.openembedded.org (Postfix) with ESMTP id EF46260107
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 16:34:09 +0000 (UTC)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
	with SMTPS id 146661324849173.4208188908442;
	Wed, 22 Jun 2016 09:34:08 -0700 (PDT)
Date: Wed, 22 Jun 2016 11:34:06 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: openembedded-core@lists.openembedded.org
Message-ID: <20160622163406.GA20922@asimov.austin.ibm.com>
References: <1466611683-25298-1-git-send-email-patrick@stwcx.xyz>
	<1466613106-26550-1-git-send-email-patrick@stwcx.xyz>
MIME-Version: 1.0
In-Reply-To: <1466613106-26550-1-git-send-email-patrick@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
Subject: Re: [PATCH v2] linux-libc-headers: Update doc for recipe depends
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
X-List-Received-Date: Wed, 22 Jun 2016 16:34:10 -0000
X-Groupsio-MsgNum: 83746
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline

--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 22, 2016 at 11:31:46AM -0500, Patrick Williams wrote:
> The previous documentation has not been accurate since at least
> commit 6a1ff0e.  Recipes that follow the old documentation will
> not correctly build when sstate is enabled because the kernel
> source will not actually be available.
>=20
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> ---

I referenced a Yocto commit number instead of an OECore one in v1,
hence v2 fixes that.  Sorry for the extra noise.

--=20
Patrick Williams

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXar3+AAoJEKsDR8wtAMEZJIQP/0EUzm6xf8tz3hMMnLw/dk0Z
vx+b5Fmxj8rnSEzXB6hNqsrp+LvP/++MI4i6d93cGtDg5csNhtJFvUw1sTMdUTgy
mIsAHt8OLDDPEnCzZU5C4T+umZjciFzsbtKMHnytyT8R+0MYW8PMCuUqOaX/ysW9
6sLW6pxKDZb5pk6PMjQQ8/cyJ9PqUQOZmHKdiSHPiTDbvPYWpmYh10HyX3RBn9lk
RyWTgrLMDAxH0rgMkGjgXU4pz5qgBAMBAtVmCOStF2NFZQJF5SgKC5DDzPvteOuN
I0AdC7IAWFbiADiBNyHI8hCefSRxsi9oA9IRbzEKmrWE0Nf+hwMGe1oPsDQ1MhGO
O7IUFe7csmUl8Bt9ByZ1uP/u7HQQDewcWlTPN5ccUapxhUbG0zWbbsoQm8QbREAK
abwvy5Zttkkkx+s+Yt2wDLXzu6ZCBuaFZB7JWunrj2e58tq4boNt73Wsc18coxXO
I00RoAvwEDxiFMA0pXB7CjqpauhSbZKm3GagX8gsr8Cb5yN4sTLG8mF9mgqIlEmR
DBi5OglAuyiQ7H0oM2cyNtwoww2TYMhg6AHWcWjv7etKipAHsWxEL0l+j311DjTr
Jiu8r8lA5v1keT4Oznxwz7IgyLE83kn//NlcdDzp07ZICPp3xN0+buCUWp1pQzFj
BHHpTiUvVWC/Qb5g0W1k
=dyIl
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--
