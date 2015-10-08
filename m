Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 32D1760232;
	Thu,  8 Oct 2015 10:18:37 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so21164285wic.1;
	Thu, 08 Oct 2015 03:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XcmJuFIzdidoHCobEl/KBsgFdD5/u33VBmgraDVDXlA=;
	b=m2PGzqWJjpG5ZISPPe1m9n/xUGgzeOwkPEAFcc5dBXkxu4msE1jwYt1BdWh40/DLCi
	VTl1TBkLvKBNxURaKOzvf/pSooVkADpx3tjG6ZmNQFpwxgT8nCTRG4LTQ7vn7MENkmy3
	+HgA/7B5tsdfds4fYH17U977V0EGIXkZlEH8FZ/o5m/Mwk6VwwOy4iHQI7CqBvzeSj1s
	+/AlkFgQTUUL1p7Ph0lffN2TvAevKvQx3YI1bfH/PTpVAs0tXcMGNFhfOTROOa5hkGP8
	M7SBEK6bca21Upr7OF41jqQ+w89y+dsE/UpZfwUdO3sF51NsUOH3R61TQqSJqVAgr3GD
	v32A==
X-Received: by 10.180.11.212 with SMTP id s20mr2971886wib.40.1444299516443;
	Thu, 08 Oct 2015 03:18:36 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	jv5sm44304106wjb.16.2015.10.08.03.18.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Oct 2015 03:18:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 8 Oct 2015 12:18:47 +0200
To: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20151008101847.GI2385@jama>
References: <20150912215134.9DA455043A@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20150912215134.9DA455043A@opal.openembedded.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Alexander Kanavin : gcr: add a recipe from meta-gnome
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
X-List-Received-Date: Thu, 08 Oct 2015 10:18:38 -0000
X-Groupsio-MsgNum: 71990
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qLni7iB6Dl8qUSwk"
Content-Disposition: inline

--qLni7iB6Dl8qUSwk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2015 at 09:51:34PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 5bce77d2b3b822b741e67bbca236242285e091d1
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D5bce77d2b3b822b741e67bbca236242285e091d1
>=20
> Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> Date:   Thu Jun  4 13:17:51 2015 +0300
>=20
> gcr: add a recipe from meta-gnome
>=20
> gcr is a dependency of epiphany
>=20
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>=20
> ---
>=20
>  meta/recipes-gnome/gcr/gcr_3.16.0.bb | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/meta/recipes-gnome/gcr/gcr_3.16.0.bb b/meta/recipes-gnome/gc=
r/gcr_3.16.0.bb
> new file mode 100644
> index 0000000..8b5b6e4
> --- /dev/null
> +++ b/meta/recipes-gnome/gcr/gcr_3.16.0.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "A library for bits of crypto UI and parsing etc"
> +HOMEPAGE =3D "http://www.gnome.org/"
> +BUGTRACKER =3D "https://bugzilla.gnome.org/"
> +
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9abc=
605"
> +

meta-oe recipe had:
PNBLACKLIST[gcr] ?=3D "CONFLICT: 4 files conflict with gnome-keyring"
# e.g. sysroots/qemux86-64/usr/share/glib-2.0/schemas/org.gnome.crypto.pgp.=
gschema.xml
# sysroots/qemux86-64/usr/share/GConf/gsettings/org.gnome.crypto.pgp.convert

I don't see this issue resolved in the version moved to oe-core, why did
you remove PNBLACKLIST?

It's still failing:
http://errors.yoctoproject.org/Errors/Details/20244/

> +DEPENDS =3D "gtk+3 p11-kit glib-2.0 libgcrypt vala"
> +
> +inherit autotools gnomebase gtk-icon-cache gtk-doc
> +
> +SRC_URI[archive.md5sum] =3D "d5835680be0b6a838e02a528d5378d9c"
> +SRC_URI[archive.sha256sum] =3D "ecfe8df41cc88158364bb15addc670b11e539fe8=
44742983629ba2323888d075"
> +
> +FILES_${PN} +=3D " \
> +    ${datadir}/dbus-1 \
> +    ${datadir}/gcr-3 \
> +"
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qLni7iB6Dl8qUSwk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYWQwYACgkQN1Ujt2V2gBx4vQCeNAzlYi7fv6FfDftyBH+O5rWs
GhcAn2GbL2Ob0QH+tFFOkOy4oLzwPmzq
=6h+H
-----END PGP SIGNATURE-----

--qLni7iB6Dl8qUSwk--
