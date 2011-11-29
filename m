Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVJJu-00075d-BI
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 09:45:42 +0100
Received: by eaad13 with SMTP id d13so2781653eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 00:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=L+IawQBkHjoha73go3iP637MI4xQcJH77UQWVAx10XI=;
	b=lk6ZeLr73W7JE668f+hLR2UuWfza0s3/5aB8bun8DuydMO4mLXEyjlLK9ck+r/LCuT
	JwT5xvqMWgx9Lz8WBN4dbYPjXH+0cO+s5kNTK9K5pkEvfH5EV/eWXrS3I/oiA5Xw5qvs
	WVw4N+7Nli3TG+6PPjVNk+46TReIWyWI9TczI=
Received: by 10.213.13.218 with SMTP id d26mr3105266eba.84.1322555943777;
	Tue, 29 Nov 2011 00:39:03 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d6sm102934215eec.10.2011.11.29.00.39.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 00:39:03 -0800 (PST)
Date: Tue, 29 Nov 2011 09:38:51 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20111129083851.GD7441@jama.jama.net>
References: <1b0811e1547c7b7e81372248e233867a7df2e2e4.1322554983.git.sgw@linux.intel.com>
	<1322555768-9095-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1322555768-9095-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] mesa-common: allow empty PN
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
X-List-Received-Date: Tue, 29 Nov 2011 08:45:42 -0000
X-Groupsio-MsgNum: 13066
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d01dLTUuW90fS44H"
Content-Disposition: inline

--d01dLTUuW90fS44H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2011 at 09:36:08AM +0100, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-graphics/mesa/mesa-common.inc |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-gr=
aphics/mesa/mesa-common.inc
> index 7d729b4..df035e6 100644
> --- a/meta/recipes-graphics/mesa/mesa-common.inc
> +++ b/meta/recipes-graphics/mesa/mesa-common.inc
> @@ -38,6 +38,9 @@ EXTRA_OECONF =3D "--enable-glu \
>  # Multiple virtual/gl providers being built breaks staging
>  EXCLUDE_FROM_WORLD =3D "1"
> =20
> +# ie mesa-dri could be empty and mesa-dri-dev RDEPENDS on it
> +ALLOW_EMPTY_${PN} =3D "1"
> +
>  PACKAGES =3D+ "libegl libegl-dev libegl-dbg libglu libglu-dev libosmesa =
libosmesa-dev libgl libgl-dev"
>  FILES_libegl =3D "${libdir}/libEGL.so.* ${libdir}/egl/*.so"
>  FILES_libgl =3D "${libdir}/libGL.so.*"
> --=20
> 1.7.8.rc4
>=20

This is needed because
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-November/012580=
=2Ehtml

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--d01dLTUuW90fS44H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7UmhsACgkQN1Ujt2V2gByapgCfZACPVSJ9MgZBnS0bS9JEgbW2
3OcAnRE4JKOfZxEshZcG9E/HQe9HyFtN
=kpEU
-----END PGP SIGNATURE-----

--d01dLTUuW90fS44H--
