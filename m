Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tjlx4-0004PO-VP
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Dec 2012 08:14:29 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so2571482pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 22:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Mcf61TCnZnPU5/APU409dpKP+NKtshmqXkDk6ARL9gI=;
	b=WisviNPl829aZFlatB4znOGyZbWdhdsMYPOlj4npYGgqbrAULVhRYQJeYR8Uxfa/Np
	P0vd32NkiDt+cdepNPlJQXGMoNmo0vMLIq/uCQOM4K+VOCttvtudpY2iOeMeWjwCML+S
	vkLtSQFLvoC9zRfOYrlDACOL54izRBMnzxBMdM3qWbPKAZpg49pGYBK4Zctm2RCcM4fJ
	Az8K/C/OxkZmlT7sC9gktBRtX+N4ejidNmCwFYDXVqVFNCy4W081fTGNwMFODXidnZAs
	sj7zVoXO/CvJ8FCz5Ag17KdgZzAbRiZ6LBDR/JvnMW0Xk8sQ0jKUuLBPN9n4AqmK41Rm
	+3nQ==
Received: by 10.66.89.9 with SMTP id bk9mr22261389pab.67.1355554784645;
	Fri, 14 Dec 2012 22:59:44 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id rk9sm4268468pbc.24.2012.12.14.22.59.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 22:59:43 -0800 (PST)
Date: Sat, 15 Dec 2012 07:59:58 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Ciprian Ciubotariu <cheepeero@gmx.net>
Message-ID: <20121215065958.GA3113@jama.jama.net>
References: <4610754.7ihuexEZvz@helios>
	<1355532614-5923-1-git-send-email-cheepeero@gmx.net>
MIME-Version: 1.0
In-Reply-To: <1355532614-5923-1-git-send-email-cheepeero@gmx.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] packagegroup-base: use virtual runtime instead of keymap
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
X-List-Received-Date: Sat, 15 Dec 2012 07:14:29 -0000
X-Groupsio-MsgNum: 32728
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline

--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 15, 2012 at 02:50:14AM +0200, Ciprian Ciubotariu wrote:
> This makes it consistent with packagegroup-core-base, and also avoids
> unneeded dependencies towards sysvinit packages.
> ---
>  .../packagegroups/packagegroup-base.bb             |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/=
recipes-core/packagegroups/packagegroup-base.bb
> index 347a7e1..3e75190 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> @@ -141,7 +141,7 @@ RRECOMMENDS_packagegroup-machine-base =3D "${MACHINE_=
EXTRA_RRECOMMENDS}"
> =20
>  SUMMARY_packagegroup-base-keyboard =3D "Keyboard support"
>  RDEPENDS_packagegroup-base-keyboard =3D "\
> -    keymaps"
> +    ${VIRTUAL-RUNTIME_keymaps}"
> =20
>  SUMMARY_packagegroup-base-pci =3D "PCI bus support"
>  RDEPENDS_packagegroup-base-pci =3D "\

Same comment as last time:
http://patchwork.openembedded.org/patch/40649/

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDMH+4ACgkQN1Ujt2V2gBzMeQCgjcT1cgves5//EbIIR78CLGfO
sosAn1niylUz2+reL0VKRKaWVyFA+p3B
=xxbF
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
