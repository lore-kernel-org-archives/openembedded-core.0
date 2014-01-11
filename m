Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id BD93060EB8;
	Sat, 11 Jan 2014 20:48:22 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id f15so2644259eak.39
	for <multiple recipients>; Sat, 11 Jan 2014 12:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RVfQs68sIm7B1K4wUYOrT0n80TifDyp7+C8v/FVUFH8=;
	b=eoYodk5GSMa3W75a3i+2oS6Sx2MkxfgVnJLSxzOxIouc3HYlVQ8nnL3ytBs1KKtPL1
	hRFWCr4reXX3uI6EGZU26TTOFBifheYR6XMzE9X/kqDVq10z2UbzA2/Ax18iwDcFeBQh
	eZM4IFFYodsv7zNqmRKpxAq3SedmlAWKbdJA56urFqrQ4MnRnhHdKyjlNoJkVKmxoIUO
	7nMHO2+Sg7g7OBxDwM35QvgmiXyr8gw/xyHbv0TCGB+aPv9YWuFThU8ohNOtWNUgOxV9
	HuLtMMZgULRzJJqXyIYLrlrbTGQRe0CO8fzoruNL7rOeANyAHdJFtorfp164JzUvFpN+
	pXJg==
X-Received: by 10.15.52.136 with SMTP id p8mr8562192eew.11.1389473303306;
	Sat, 11 Jan 2014 12:48:23 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	o47sm25726646eem.21.2014.01.11.12.48.21 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Jan 2014 12:48:22 -0800 (PST)
Date: Sat, 11 Jan 2014 21:48:37 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Cristian Iorga <cristian.iorga@intel.com>
Message-ID: <20140111204837.GB16995@jama>
References: <20131214090923.0609C50407@opal>
MIME-Version: 1.0
In-Reply-To: <20131214090923.0609C50407@opal>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Cristian Iorga : glib-2.0: upgrade to 2.38.2
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
X-List-Received-Date: Sat, 11 Jan 2014 20:48:23 -0000
X-Groupsio-MsgNum: 48867
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LyciRD1jyfeSSjG0"
Content-Disposition: inline

--LyciRD1jyfeSSjG0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 14, 2013 at 09:09:23AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: b445008484639d0d3e0e397019241466f4361b9e
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Db445008484639d0d3e0e397019241466f4361b9e
>=20
> Author: Cristian Iorga <cristian.iorga@intel.com>
> Date:   Wed Dec 11 19:24:03 2013 +0200
>=20
> glib-2.0: upgrade to 2.38.2
>=20
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

Not sure if it's since this upgrade, but it shows 2 QA warnings now:

WARNING: QA Issue: glib-2.0: Files/directories were installed but not shipp=
ed
  /usr/lib/glib-2.0/ptest
WARNING: QA Issue: glib-2.0-dbg: found library in wrong location: /usr/shar=
e/gdb/auto-load/usr/lib64/libglib-2.0.so.0.3800.2-gdb.py
glib-2.0-dbg: found library in wrong location: /usr/share/gdb/auto-load/usr=
/lib64/libgobject-2.0.so.0.3800.2-gdb.py

Can you fix it?

> ---
>=20
>  meta/recipes-core/glib-2.0/{glib-2.0_2.38.1.bb =3D> glib-2.0_2.38.2.bb} =
| 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.38.1.bb b/meta/recipes=
-core/glib-2.0/glib-2.0_2.38.2.bb
> similarity index 79%
> rename from meta/recipes-core/glib-2.0/glib-2.0_2.38.1.bb
> rename to meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb
> index a5db302..02730f1 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.38.1.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb
> @@ -15,5 +15,5 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV=
}.tar.xz \
> =20
>  SRC_URI_append_class-native =3D " file://glib-gettextize-dir.patch"
> =20
> -SRC_URI[md5sum] =3D "f3f6789151c1810f2fe23fe9ebb8b828"
> -SRC_URI[sha256sum] =3D "01906c62ac666d2ab3183cc07261b2536fab7b211c6129ab=
66b119c2af56d159"
> +SRC_URI[md5sum] =3D "26d1d08e478fc48c181ca8be44f5b69f"
> +SRC_URI[sha256sum] =3D "056a9854c0966a0945e16146b3345b7a82562a5ba4d5516f=
d10398732aea5734"
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LyciRD1jyfeSSjG0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLRriUACgkQN1Ujt2V2gBzHqwCfWiRj2/KTgHGvu/qKJfhLji6J
cM4AmgIPv9J35GaXKCLZH6KElfuAibP+
=riZK
-----END PGP SIGNATURE-----

--LyciRD1jyfeSSjG0--
