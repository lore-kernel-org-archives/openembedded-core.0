Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1StDyy-0007Qg-3f; Mon, 23 Jul 2012 10:27:12 +0200
Received: by wibhq4 with SMTP id hq4so2255308wib.6
	for <multiple recipients>; Mon, 23 Jul 2012 01:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gD+3/g0W4zPFwaavZd5XlD4YjfFPBbbzYojr7u61vWg=;
	b=RmOBypNKBUGe09eIq9AETiXjldTgQNTO5CXeD9TO/JK5L4U50+Iz6U3jvmTUjNkDAt
	Mxw/JeVkeXAywoWXFC1reFbt/cNmLOahn0QPbvuLUNQ/Y/2IsjrbxIM9HyRH09l0dHa3
	lJQi76nGy8z6RamBtCAdKMsFNS24pyoXX24IAILb9lf9N3DKk84EdlYXiiqdLtljFFid
	bUOUBjnxKSNyDUMLuVVB1fzKEjxJfSCAipryS3IFjErJ5n9Z76taLIyRSbK/bgOWa/BB
	vkuEj6FzfqB7EhaxQTsfceZQrVHctAJJtheNR08wRtTX43CFXl7SaX65B+OaP7hcZvtj
	2gEg==
Received: by 10.180.81.193 with SMTP id c1mr46819978wiy.12.1343031345382;
	Mon, 23 Jul 2012 01:15:45 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id df4sm15797141wib.4.2012.07.23.01.15.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jul 2012 01:15:44 -0700 (PDT)
Date: Mon, 23 Jul 2012 10:15:43 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120723081543.GA3271@jama.jama.net>
References: <20120722104320.C057610218@opal>
MIME-Version: 1.0
In-Reply-To: <20120722104320.C057610218@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Ross Burton : Add gtk-doc-stub
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
X-List-Received-Date: Mon, 23 Jul 2012 08:27:12 -0000
X-Groupsio-MsgNum: 25970
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Content-Disposition: inline

--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 22, 2012 at 10:43:20AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: dd5d1104fde0418c18f9b18ab23837bf23e5b45b
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Ddd5d1104fde0418c18f9b18ab23837bf23e5b45b
>=20
> Author: Ross Burton <ross.burton@intel.com>
> Date:   Wed Jul 18 16:58:51 2012 +0100
>=20
> Add gtk-doc-stub
>=20
> This is a maintained stub for gtk-doc (and gobject-introspection) that was
> created by Colin Walters for his Poky-powered ostree project.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>

This has couple of unpackaged files:

NOTE: package gtk-doc-stub-0.0+git1+3dfd0a09de696ec8c544762747f8a0f77153622=
e-r0: task do_package: Started
WARNING: QA Issue: gtk-doc-stub: Files/directories were installed but not s=
hipped
  /usr/share/gtk-doc-devel
  /usr/share/gobject-introspection-1.0
  /usr/share/gtk-doc-devel/gtk-doc.make
  /usr/share/gobject-introspection-1.0/Makefile.introspection
NOTE: package gtk-doc-stub-0.0+git1+3dfd0a09de696ec8c544762747f8a0f77153622=
e-r0: task do_package: Succeeded

Cheers,

>=20
> ---
>=20
>  .../recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb |   19 ++++++++++++++=
+++++
>  1 files changed, 19 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb b/meta/r=
ecipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb
> new file mode 100644
> index 0000000..195fc41
> --- /dev/null
> +++ b/meta/recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb
> @@ -0,0 +1,19 @@
> +SUMMARY =3D "Stub implementation of gtk-doc"
> +DESCRIPTION =3D "Stub implementation of gtk-doc, as we don't want to bui=
ld the API documentation"
> +SECTION =3D "x11/base"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> +
> +PROVIDES =3D "gtk-doc"
> +
> +SRCREV =3D "3dfd0a09de696ec8c544762747f8a0f77153622e"
> +PV =3D "0.0+git${SRCPV}"
> +PR =3D "r0"
> +
> +SRC_URI =3D "git://git.gnome.org/${BPN};protocol=3Dgit"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools
> +
> +BBCLASSEXTEND =3D "native"
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlANCC8ACgkQN1Ujt2V2gBz1DACgqsciEY4CJU0xcHaKbbF4742P
/jUAn2ukLxeT9F19enEjm/rpLlq1NUFi
=XjXv
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
