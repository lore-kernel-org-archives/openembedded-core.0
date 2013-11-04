Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5A0C26B238;
	Mon,  4 Nov 2013 13:02:44 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id e49so1088874eek.25
	for <multiple recipients>; Mon, 04 Nov 2013 05:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=i/O5HfKU13JSQMaAMoLdLPMiMYaAQW4ReHcN6+XE3xM=;
	b=YDZHqsFpr1CIUUa2orGgW0LxNlFwg8vJibY+iWoDflMc4AKwNdFMHhkvrliM0ntpWY
	Nly5BxFnQS+9BDfJ6jINsP+i0Mhj1teTtG0RoSaQ/+9D7m1igIzfYtxT/xdqZUxJgzMv
	mJ1BoaySCf6VHc1q/iSRrAOjV0EAN5I55wHyuwkxTRPCibKhWLoZC0zyjp+m6mrv87IZ
	2X4PZZYHV1B+t3mc2z7KyG2Wpg533qGDgysT4gwFstIPqMDy8j/GpK1IjBQFKVEHEBeK
	uhwi+KZJGMHgUx3Gm+Bp7P/mV9bP8c5m22tWlGOtHuF6coX1hjS/oRki7123eoZJZaaG
	juZQ==
X-Received: by 10.15.35.196 with SMTP id g44mr18398981eev.18.1383570165587;
	Mon, 04 Nov 2013 05:02:45 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id d7sm46340805eem.8.2013.11.04.05.02.44
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Nov 2013 05:02:44 -0800 (PST)
Date: Mon, 4 Nov 2013 14:02:53 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20131104130253.GD3684@jama>
References: <20131014154535.D40A750398@opal>
MIME-Version: 1.0
In-Reply-To: <20131014154535.D40A750398@opal>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Richard Purdie : gcc: Fix strange C++ repo issues
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
X-List-Received-Date: Mon, 04 Nov 2013 13:02:45 -0000
X-Groupsio-MsgNum: 46602
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="T7mxYSe680VjQnyC"
Content-Disposition: inline

--T7mxYSe680VjQnyC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2013 at 03:45:35PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 9f6c4edf40963d1f3fb9f7e2d2b7a866aa1afe57
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D9f6c4edf40963d1f3fb9f7e2d2b7a866aa1afe57
>=20
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Wed Oct  9 20:37:49 2013 +0000
>=20
> gcc: Fix strange C++ repo issues
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/recipes-devtools/gcc/gcc-4.8.inc              |    1 +
>  .../gcc/gcc-4.8/0047-repomembug.patch              |   53 ++++++++++++++=
++++++
>  2 files changed, 54 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtool=
s/gcc/gcc-4.8.inc
> index 4af98f8..8d50bf7 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.8.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
> @@ -76,6 +76,7 @@ SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.=
bz2 \
>  	   file://0044-gengtypes.patch \
>  	   file://0045-gcc-4.8-PR57717-PowerPC-E500v2.patch \
>  	   file://0046-libatomic-deptracking.patch \
> +	   file://0047-repomembug.patch \
>  	  "

Don't mix tabs and spaces in multiline variables.

All tabs in meta/recipes-devtools/gcc/gcc-4.8.inc are used incorrectly.

--T7mxYSe680VjQnyC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJ3mv0ACgkQN1Ujt2V2gBzWegCgp1bzZhGE0PYTXX/X+90E3KLj
jcIAn0HcLxZr0UHJ2MuBmzNfv7ubRpjS
=T8Oo
-----END PGP SIGNATURE-----

--T7mxYSe680VjQnyC--
