Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0306C6B988;
	Mon, 26 Aug 2013 19:55:10 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b15so1827179eek.40
	for <multiple recipients>; Mon, 26 Aug 2013 12:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qMmY1zGGYXs02aa5r1LTZiHJ6TrWzUBN0TZ4A9uuAMg=;
	b=wY71WdPwXbN9zmGLjzMqhPURPF+zZJxV4HQZFlEXU3jxnyfO65SnTf1XZvMfZI8MrE
	hh3Z+UIGhk7M6MSv/2oUN+w03tFgTwLaYwXGjWNd572bGuqI97JkEEB5aZdnhMm6nm0h
	ACFWKMh9kU6rf+ZiqWBIxLfcnOhdZ1fvt3wd4dq4ULx63Nb07QlPGP96m2IOB2pR+JQX
	MwiJK1iQsSMvXp1nA8YmLfkbcR3PWZRYZEh8Ixl7b+nGX1EGJ1EkqJ3IN4i9wFcUF4ve
	nOfYZ2zCzY7NHMiu3srlHMJLQl48zngkdSYwIokJm2OC/p6//Azk0j0o9YzSiYrft+1v
	+Nmg==
X-Received: by 10.14.225.199 with SMTP id z47mr28599944eep.24.1377546911354;
	Mon, 26 Aug 2013 12:55:11 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	j7sm23639328eeo.15.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 26 Aug 2013 12:55:10 -0700 (PDT)
Date: Mon, 26 Aug 2013 21:56:21 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20130826195621.GT3544@jama>
References: <20130826101859.6987E503D3@opal>
MIME-Version: 1.0
In-Reply-To: <20130826101859.6987E503D3@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Bruce Ashfield : linux-yocto: introduce v3.10
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
X-List-Received-Date: Mon, 26 Aug 2013 19:55:11 -0000
X-Groupsio-MsgNum: 44058
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4AfY4lbNVy6SI0IG"
Content-Disposition: inline

--4AfY4lbNVy6SI0IG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2013 at 10:18:59AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 6dc46834c6edaf358c18b26e4304bc9e7413eb60
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D6dc46834c6edaf358c18b26e4304bc9e7413eb60
>=20
> Author: Bruce Ashfield <bruce.ashfield@windriver.com>
> Date:   Fri Aug 23 14:08:20 2013 -0400
>=20
> linux-yocto: introduce v3.10
>=20
> Introduce the 3.10 kernel. This is based on the 3.10.9 upstream kernel
> and replaces the 3.8 recipes, which will be removed once all reference
> boards have been updated.
>=20
> 3.10 also the latest LTSI and will be updated with that content when it
> becomes available.
>=20
> Other features of the 3.10 kernel include:
>=20
>   - refreshed -rt support
>   - refreshed yaffs2, aufs3
>   - cryptodev
>   - bfs, edf, and OCF staged features
>   - scrubbed and updated meta data for v3.10
>   - improved tools support for meta data updates and queue maintenance
>   - patch carry forward from all previous linux-yocto kernels and
>     configuration.
>=20
> This kernel has been built and boot tested on all qemu machines and archi=
tectures.
>=20
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |   30 ++++++++++++++=
++++++
>  meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |   25 ++++++++++++++=
++
>  meta/recipes-kernel/linux/linux-yocto_3.10.bb      |   30 ++++++++++++++=
++++++
>  3 files changed, 85 insertions(+), 0 deletions(-)

This commit should introduce bc-native dependency at least in my
minimalistic chroot for OE builds this is first linux-yocto kernel which
is failing because of missing host bc.

|   BC      kernel/timeconst.h
| /bin/sh: bc: command not found
| make[3]: *** [kernel/timeconst.h] Error 127
| make[2]: *** [kernel] Error 2
| make[2]: *** Waiting for unfinished jobs....

--4AfY4lbNVy6SI0IG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIbsuUACgkQN1Ujt2V2gBwwzgCgtrnVhy9kjFfD8uRYNSOCTznR
yxYAn0ELcjvO6pThv7BSBWV3ZYNO3Zm9
=sQYb
-----END PGP SIGNATURE-----

--4AfY4lbNVy6SI0IG--
