Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RGydj-0005bl-Sy
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 21:50:55 +0200
Received: by bkat8 with SMTP id t8so4162537bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 12:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EtGNRVMWwgKy43yYZzPD2YU77GROkRaqQ5ijUILqWsU=;
	b=Jj3Pybot29WpRp+oAwuu314kBy3Emzg3AiRprCG6B1Dn0zBV+wxRbunU4pe8kR8c1M
	NARoPdE6YSvQMedBJ56ikG782j5mpEfBmFSLOA4MLqnHniURVAqO1SVGCWCuzXj3E3nr
	ndIE5fqf0ZHBvBvW83yZcODLpVSn4m/efx4yE=
Received: by 10.204.7.199 with SMTP id e7mr8797757bke.40.1319139900263;
	Thu, 20 Oct 2011 12:45:00 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f7sm2188343bkc.1.2011.10.20.12.44.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Oct 2011 12:44:59 -0700 (PDT)
Date: Thu, 20 Oct 2011 21:44:53 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111020194453.GL3522@jama.jama.net>
References: <cover.1319139126.git.raj.khem@gmail.com>
	<15763124703d12326c8ba4d296a2b2680528c2da.1319139126.git.raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <15763124703d12326c8ba4d296a2b2680528c2da.1319139126.git.raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/4] xserver-xorg: Add mesa-dri to DEPENDS
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
X-List-Received-Date: Thu, 20 Oct 2011 19:50:56 -0000
X-Groupsio-MsgNum: 11365
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8cpS+6Cx+xtICsjy"
Content-Disposition: inline

--8cpS+6Cx+xtICsjy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2011 at 12:36:01PM -0700, Khem Raj wrote:
> Fixes the compile problems e.g.
>=20
> | checking for GL... yes
> | checking for DRIPROTO... yes
> | checking for DRI... no
> | configure: error: Package requirements (glproto >=3D 1.4.14 dri >=3D
> 7.8.0) were not met:
> |
> | No package 'dri' found
> |
> | Consider adjusting the PKG_CONFIG_PATH environment variable if you
> | installed software in a non-standard prefix.
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../xorg-xserver/xserver-xorg_1.11.1.bb            |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb b/=
meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb
> index 0f94fe2..2aa71e5 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb
> @@ -1,2 +1,3 @@
>  require xserver-xorg.inc
>  require xserver-xorg-${PV}.inc
> +DEPENDS +=3D "mesa-dri"

You can do this in xserver-xorg.inc
just change
LIB_DEPS +=3D "virtual/libgl" to
LIB_DEPS +=3D "mesa-dri"

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8cpS+6Cx+xtICsjy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6gejUACgkQN1Ujt2V2gBzgigCgmqI80bqxBv9VgF5C9J27wNTy
dKgAoKwD8VgbbgwvpnSrDEMSQz5ghI4B
=lRwA
-----END PGP SIGNATURE-----

--8cpS+6Cx+xtICsjy--
