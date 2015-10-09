Return-Path: <andrew.shadura@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id F056473CBD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Oct 2015 12:24:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: andrewsh) with ESMTPSA id E65586082B0
From: Andrew Shadura <andrew.shadura@collabora.co.uk>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Organization: Collabora Limited
Message-ID: <5617B211.80002@collabora.co.uk>
Date: Fri, 9 Oct 2015 14:24:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
Cc: Joe Slater <jslater@windriver.com>
Subject: Re: [PATCH 1/2] ifupdown: import recipe
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
X-List-Received-Date: Fri, 09 Oct 2015 12:24:59 -0000
X-Groupsio-MsgNum: 72048
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="6WrSvNIkc4G2t6K6MaieUxKefAAfNdf1B"

--6WrSvNIkc4G2t6K6MaieUxKefAAfNdf1B
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

I just wanted to comment on this patch pulled with the recipe:

> +From 74152ac74a3e1ea0f3be292aa1eeca5ad1fe69c0 Mon Sep 17 00:00:00 2001=

> +From: Paul Gortmaker <paul.gortmaker@windriver.com>
> +Date: Wed, 6 Aug 2014 15:12:11 -0400
> +Subject: [PATCH 2/2] inet[6].defn: fix inverted checks for loopback

I have already commented on this patch when I still was an upstream
developer for ifupdown, see <https://bugs.debian.org/757291>. The issue
led to this patch was caused by Ubuntu maintainer trying to remove one
of the features he deemed as not yet ready for Ubuntu release, but he
didn't do it properly on the first attempt, thus leading to broken
loopback (which didn't really matter for Ubuntu, as the loopback
interface was configured by upstart there back then).

The correct fix for the issue would be rebasing to the Debian version of
the package which, by the way, has a new active developer, Guus Sliepen.
Then the patch could be dropped.

--=20
Cheers,
  Andrew




--6WrSvNIkc4G2t6K6MaieUxKefAAfNdf1B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWF7IWAAoJEEFnG7NKhJOB8OQP/AkjakRVHj3BmSDR/0AexgSm
9MSal4HxN1v/jCFViVhEEiHYvPcwxGDtMgS8carIaFhISX86mxs/nGh7J/Vtnvre
6tW3qHCL/IKYSXJUv9YXlPgaxvr3PdCnVKhp5quJXpX2FCsRje48Itl3Bg8pqv2G
A/6pqUJMEZoIu1q6UxclZVUYyeATlZpF+eb7Ow8nvhHzPgSB1MdIxmYl6zVuIYiB
snQOyEXpZpTy5OGn8TpHb5i+H64uMhiOBplOLtphjiPD0EzeW22SpuMVV8FiuORG
ZDbq55AB9ClKrOUW7cJkzieZdmNLZ1C6wfGJ448DQCaNu6mejt/VtGtqYvEAanN3
pJJjILXluXCRAOaFYihF/EKIB+92YtqieEMPFm83PIktVVTnT4K5S2vJw4KkfdYp
+Pv8tcfi6hGG3PcebFkvG5gCvzWbn5nFLbSEHqY//ImwR9gkbEbLrAZDldNGtoMd
Cz/Hygz5VbYHxCDCRoqePtQXAnYa0qZ5C0yPybkjSnHrt64NhRqM1FSuFJF+0dS5
2CGCNslo4Yf9S4hSfNX/cAQLL6M5zyNAxr1FzRTA1g7BOxgdTg9RrCoUBt4Dbs/o
c3bPPntcwcD03CCvFqHm2HqaFqfu5EP0b03/8G82XxOus+skiOps1lCc28B2Jl8z
tYZ6JbK28rTX3S4n0dDQ
=C4ib
-----END PGP SIGNATURE-----

--6WrSvNIkc4G2t6K6MaieUxKefAAfNdf1B--
