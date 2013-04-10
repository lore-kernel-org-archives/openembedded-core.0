Received: from mail-pb0-f43.google.com ([209.85.160.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UPqDv-0007ut-RH
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 10:17:45 +0200
Received: by mail-pb0-f43.google.com with SMTP id md4so127733pbc.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2013 01:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=yBTIM/bsAPtgw9zrKxbacplpXZqlrgU8JQSVD8LR74E=;
	b=Xc9bQeCum3KNrJF43950F+xQP7JrmjkaRKxRez5DWvGLE2rmYIAtPTDIVriWcNktKa
	KK5VGzRdgfs/f4gPs/JKqou2PA92jLGpkVfvuwCe+37BeJT0yu4bNK59Xx31FmUTnGk1
	H9FACnOISd+rdb1JEz6jDyNNlU4oMEJIIFi7TPu14RX19ntEpx6jDIeNMdX44vrM3dsk
	A0Ocn7ZWLE9BsvxeWDTHVsOW3rlzkyJERV0a5FaXyrvbrWZPIErFjqyW+0ce2DLjsz5T
	M4AEJg3i64DUtErkAlcNut+9DA7ij6f+4f3Q75YsNDpqdJh1zXmCDuTYgC25u5dND3Ut
	+7Ew==
X-Received: by 10.66.149.73 with SMTP id ty9mr2103083pab.66.1365580821763;
	Wed, 10 Apr 2013 01:00:21 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id mm9sm5513437pbc.43.2013.04.10.01.00.18
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 10 Apr 2013 01:00:20 -0700 (PDT)
Date: Wed, 10 Apr 2013 10:00:12 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: wenzong.fan@windriver.com
Message-ID: <20130410080012.GA2471@jama>
References: <cover.1365564103.git.wenzong.fan@windriver.com>
	<1365564397-2851-1-git-send-email-wenzong.fan@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1365564397-2851-1-git-send-email-wenzong.fan@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] xcursor-transparent-theme: install index.theme explicitly
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
X-List-Received-Date: Wed, 10 Apr 2013 08:17:47 -0000
X-Groupsio-MsgNum: 37714
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline

--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2013 at 11:26:35AM +0800, wenzong.fan@windriver.com wrote:
> The xcursor-transparent-theme doesn't install index.theme by default,
> this might cause below command fails on target:
>=20
>     $ gtk-update-icon-cache -q /usr/share/icons/xcursor-transparent
>     Error: "gtk-update-icon-cache: No theme index file"
>=20
> Just install index.theme explicitly to remove those error, its content
> is from xcursor-transparent-theme's README file.

Wasn't this discussed and fixed before? IIRC the conclusion was that
postinst should check if there is index.theme or ignore it missing, not
adding index.theme.

>=20
> [YOCTO #4234]
>=20
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>  .../xcursor-transparent-theme-0.1.1/index.theme       |    2 ++
>  .../xcursor-transparent-theme_0.1.1.bb                |   17 +++++++++++=
+++---
>  2 files changed, 16 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-graphics/xcursor-transparent-theme/xcurs=
or-transparent-theme-0.1.1/index.theme
>=20
> diff --git a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-tran=
sparent-theme-0.1.1/index.theme b/meta/recipes-graphics/xcursor-transparent=
-theme/xcursor-transparent-theme-0.1.1/index.theme
> new file mode 100644
> index 0000000..5300850
> --- /dev/null
> +++ b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent=
-theme-0.1.1/index.theme
> @@ -0,0 +1,2 @@
> +[Icon Theme]
> +Inherits=3Dxcursor-transparent
> diff --git a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-tran=
sparent-theme_0.1.1.bb b/meta/recipes-graphics/xcursor-transparent-theme/xc=
ursor-transparent-theme_0.1.1.bb
> index fecc8ea..93770c1 100644
> --- a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent=
-theme_0.1.1.bb
> +++ b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent=
-theme_0.1.1.bb
> @@ -6,14 +6,25 @@ LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> =20
>  SECTION =3D "x11/base"
> -PR =3D "r4"
> +PR =3D "r5"
> =20
>  SRC_URI =3D "http://downloads.yoctoproject.org/releases/matchbox/utils/x=
cursor-transparent-theme-${PV}.tar.gz \
>  	   file://use-relative-symlinks.patch \
> -	   file://fix_watch_cursor.patch"
> +	   file://fix_watch_cursor.patch \
> +	   file://index.theme"
> =20
>  SRC_URI[md5sum] =3D "7b0c623049d4aab20600d6473f8aab23"
>  SRC_URI[sha256sum] =3D "b26adf2d503d01299718390ae39dab4691a67220de09423b=
e0364e9a060bf7e4"
> -FILES_${PN} =3D "${datadir}/icons/xcursor-transparent/cursors/*"
> +FILES_${PN} =3D "${datadir}/icons/xcursor-transparent/cursors/* \
> +	   ${datadir}/icons/xcursor-transparent/index.theme"
> =20
>  inherit autotools allarch
> +
> +# This package doesn't provide index.theme by default, this might cause
> +# below command fails on target with error: "No theme index file".
> +#
> +#    gtk-update-icon-cache -q /usr/share/icons/xcursor-transparent
> +#
> +do_install_append(){
> +    install -m 0644 -D ${WORKDIR}/index.theme ${D}${datadir}/icons/xcurs=
or-transparent/index.theme
> +}
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFlHAwACgkQN1Ujt2V2gBx+xwCgo60hmDvf6whMTE4UDZx6gP3D
k2oAoKbC4Tsdnprydsm4Xrn6WTWSU8pi
=bhtu
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
