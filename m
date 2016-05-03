Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 53CA973167
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 16:39:52 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id a17so49720273wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2016 09:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=PZHJBRlKvj4zaRnaXWD41hsD3rM2bkbqH8RdK43OgBA=;
	b=HWpypb86qZ+Nvixnt6QmKtc5P0bXO50jMRuZTHr8N/5c5Qu0WiiBTuRkcS1WIBKaFo
	ytFmQpkFqMHdtJCxrGAxigKTYNpnHayh+Y1EihXt3yb5cBwhBhG0FqoqElSFNn006rqH
	7l2fk7gaM2G6V1HAP+G8ELeLhqNUkvAKSpqqC6qVQKX3/sQVrXim2vt1TZPPIK+mT1Bv
	Wk1zq4jV3YGFT1MSDIDpvjVVHvnXJi3NchJx1doKq4UOdFP70EXbfZ8FDm3rbfFt+ek1
	OmaDDU6tgodKvFYlxAUBkpqeX8eYhFLhkjqdaTT//rdgDZ1aYYkBv+PzmfCk4CDSclCl
	B9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=PZHJBRlKvj4zaRnaXWD41hsD3rM2bkbqH8RdK43OgBA=;
	b=J+wO++5r67VU49KBqKpvTyqoMoeVP8w74mQbVKEtRF9rvOKHVmWWy88B25adQLNNVk
	Q47ZDv2t8G9U+28fEEnn1KMwI/xeRIxCUg+JSQgUqphINTXYvKKwPHKCsuCI45fF6X2M
	wAP6UJFB/bqwPR1DnpkMG8ugEj7fecHo3PujN1QL5vGuX7bl4jDJXZSwIuTK1u7WCGob
	PBJDuTNrsTBY+JO3NhFx3uKulY4yGKohIXTGXZY3eNx/YS41ydAErlmQrV4v0qxdkNx4
	2CIKH1gnHHIWbLbNjzNkhXNME9+0vqpl7CNOcdUqw/8P8aUyDMy1F4mJRBPYUpAJNGFX
	0Asw==
X-Gm-Message-State: AOPr4FViDA8XpjQAbDWFgFeBL5pbjwmY1RlMRv5zq8yo1Lf7TL19k4JHPOQtQlqvobGJzA==
X-Received: by 10.194.201.37 with SMTP id jx5mr3894303wjc.60.1462293592985;
	Tue, 03 May 2016 09:39:52 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id i11sm9933wjn.36.2016.05.03.09.39.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 May 2016 09:39:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 3 May 2016 18:41:01 +0200
To: "Maxin B. John" <maxin.john@intel.com>
Message-ID: <20160503164101.GA20238@jama>
References: <1462286989-22848-1-git-send-email-maxin.john@intel.com>
	<1462286989-22848-7-git-send-email-maxin.john@intel.com>
MIME-Version: 1.0
In-Reply-To: <1462286989-22848-7-git-send-email-maxin.john@intel.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 06/10] mc: upgrade to 4.8.16
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
X-List-Received-Date: Tue, 03 May 2016 16:39:56 -0000
X-Groupsio-MsgNum: 81523
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Content-Disposition: inline

--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 03, 2016 at 05:49:45PM +0300, Maxin B. John wrote:
> 4.8.15 -> 4.8.16

Can you please use -M when sending the patches, it's much easier to
review.

> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  meta/recipes-extended/mc/mc_4.8.15.bb | 49 -----------------------------=
------
>  meta/recipes-extended/mc/mc_4.8.16.bb | 49 +++++++++++++++++++++++++++++=
++++++
>  2 files changed, 49 insertions(+), 49 deletions(-)
>  delete mode 100644 meta/recipes-extended/mc/mc_4.8.15.bb
>  create mode 100644 meta/recipes-extended/mc/mc_4.8.16.bb
>=20
> diff --git a/meta/recipes-extended/mc/mc_4.8.15.bb b/meta/recipes-extende=
d/mc/mc_4.8.15.bb
> deleted file mode 100644
> index 6c3a16a..0000000
> --- a/meta/recipes-extended/mc/mc_4.8.15.bb
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -SUMMARY =3D "Midnight Commander is an ncurses based file manager"
> -HOMEPAGE =3D "http://www.midnight-commander.org/"
> -LICENSE =3D "GPLv3"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D270bbafe360e73f9840bd7981621f=
9c2"
> -SECTION =3D "console/utils"
> -DEPENDS =3D "ncurses glib-2.0 util-linux"
> -RDEPENDS_${PN} =3D "ncurses-terminfo"
> -
> -SRC_URI =3D "http://www.midnight-commander.org/downloads/${BPN}-${PV}.ta=
r.bz2 \
> -           "
> -SRC_URI[md5sum] =3D "db48ce26ba425a61edc51930e94227fd"
> -SRC_URI[sha256sum] =3D "f74e3da70410975cdeb27ee9a66d1dd812250b6d3ede364b=
ca728dd5a48e5471"
> -
> -inherit autotools gettext pkgconfig
> -
> -#
> -# Both Samba (smb) and sftp require package delivered from meta-openembe=
dded
> -#
> -PACKAGECONFIG ??=3D ""
> -PACKAGECONFIG[smb] =3D "--enable-vfs-smb,--disable-vfs-smb,samba,"
> -PACKAGECONFIG[sftp] =3D "--enable-vfs-sftp,--disable-vfs-sftp,libssh2,"
> -
> -EXTRA_OECONF =3D "--with-screen=3Dncurses --without-gpm-mouse --without-=
x"
> -
> -do_install_append () {
> -	sed -i -e '1s,#!.*perl,#!${bindir}/env perl,' ${D}${libexecdir}/mc/extf=
s.d/*
> -	sed -i -e '1s,#!.*python,#!${bindir}/env python,' ${D}${libexecdir}/mc/=
extfs.d/*
> -}
> -
> -PACKAGES =3D+ "${BPN}-helpers-perl ${BPN}-helpers-python ${BPN}-helpers =
${BPN}-fish"
> -
> -SUMMARY_${BPN}-helpers-perl =3D "Midnight Commander Perl-based helper sc=
ripts"
> -FILES_${BPN}-helpers-perl =3D "${libexecdir}/mc/extfs.d/a+ ${libexecdir}=
/mc/extfs.d/apt+ \
> -                             ${libexecdir}/mc/extfs.d/deb ${libexecdir}/=
mc/extfs.d/deba \
> -                             ${libexecdir}/mc/extfs.d/debd ${libexecdir}=
/mc/extfs.d/dpkg+ \
> -                             ${libexecdir}/mc/extfs.d/mailfs ${libexecdi=
r}/mc/extfs.d/patchfs \=20
> -                             ${libexecdir}/mc/extfs.d/rpms+ ${libexecdir=
}/mc/extfs.d/ulib \=20
> -                             ${libexecdir}/mc/extfs.d/uzip"
> -RDEPENDS_${BPN}-helpers-perl =3D "perl"
> -
> -SUMMARY_${BPN}-helpers-python =3D "Midnight Commander Python-based helpe=
r scripts"
> -FILES_${BPN}-helpers-python =3D "${libexecdir}/mc/extfs.d/s3+ ${libexecd=
ir}/mc/extfs.d/uc1541"
> -RDEPENDS_${BPN}-helpers-python =3D "python"
> -
> -SUMMARY_${BPN}-helpers =3D "Midnight Commander shell helper scripts"
> -FILES_${BPN}-helpers =3D "${libexecdir}/mc/extfs.d/* ${libexecdir}/mc/ex=
t.d/*"
> -
> -SUMMARY_${BPN}-fish =3D "Midnight Commander Fish scripts"
> -FILES_${BPN}-fish =3D "${libexecdir}/mc/fish"
> diff --git a/meta/recipes-extended/mc/mc_4.8.16.bb b/meta/recipes-extende=
d/mc/mc_4.8.16.bb
> new file mode 100644
> index 0000000..16ed6a9
> --- /dev/null
> +++ b/meta/recipes-extended/mc/mc_4.8.16.bb
> @@ -0,0 +1,49 @@
> +SUMMARY =3D "Midnight Commander is an ncurses based file manager"
> +HOMEPAGE =3D "http://www.midnight-commander.org/"
> +LICENSE =3D "GPLv3"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D270bbafe360e73f9840bd7981621f=
9c2"
> +SECTION =3D "console/utils"
> +DEPENDS =3D "ncurses glib-2.0 util-linux"
> +RDEPENDS_${PN} =3D "ncurses-terminfo"
> +
> +SRC_URI =3D "http://www.midnight-commander.org/downloads/${BPN}-${PV}.ta=
r.bz2 \
> +           "
> +SRC_URI[md5sum] =3D "b93706dfe66ffe4f61c1a2650798d207"
> +SRC_URI[sha256sum] =3D "c37ea495df93f6d375a3ce59cdcf0f3a3690338526205347=
b03a316daebdaaf8"
> +
> +inherit autotools gettext pkgconfig
> +
> +#
> +# Both Samba (smb) and sftp require package delivered from meta-openembe=
dded
> +#
> +PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG[smb] =3D "--enable-vfs-smb,--disable-vfs-smb,samba,"
> +PACKAGECONFIG[sftp] =3D "--enable-vfs-sftp,--disable-vfs-sftp,libssh2,"
> +
> +EXTRA_OECONF =3D "--with-screen=3Dncurses --without-gpm-mouse --without-=
x"
> +
> +do_install_append () {
> +	sed -i -e '1s,#!.*perl,#!${bindir}/env perl,' ${D}${libexecdir}/mc/extf=
s.d/*
> +	sed -i -e '1s,#!.*python,#!${bindir}/env python,' ${D}${libexecdir}/mc/=
extfs.d/*
> +}
> +
> +PACKAGES =3D+ "${BPN}-helpers-perl ${BPN}-helpers-python ${BPN}-helpers =
${BPN}-fish"
> +
> +SUMMARY_${BPN}-helpers-perl =3D "Midnight Commander Perl-based helper sc=
ripts"
> +FILES_${BPN}-helpers-perl =3D "${libexecdir}/mc/extfs.d/a+ ${libexecdir}=
/mc/extfs.d/apt+ \
> +                             ${libexecdir}/mc/extfs.d/deb ${libexecdir}/=
mc/extfs.d/deba \
> +                             ${libexecdir}/mc/extfs.d/debd ${libexecdir}=
/mc/extfs.d/dpkg+ \
> +                             ${libexecdir}/mc/extfs.d/mailfs ${libexecdi=
r}/mc/extfs.d/patchfs \=20
> +                             ${libexecdir}/mc/extfs.d/rpms+ ${libexecdir=
}/mc/extfs.d/ulib \=20
> +                             ${libexecdir}/mc/extfs.d/uzip"
> +RDEPENDS_${BPN}-helpers-perl =3D "perl"
> +
> +SUMMARY_${BPN}-helpers-python =3D "Midnight Commander Python-based helpe=
r scripts"
> +FILES_${BPN}-helpers-python =3D "${libexecdir}/mc/extfs.d/s3+ ${libexecd=
ir}/mc/extfs.d/uc1541"
> +RDEPENDS_${BPN}-helpers-python =3D "python"
> +
> +SUMMARY_${BPN}-helpers =3D "Midnight Commander shell helper scripts"
> +FILES_${BPN}-helpers =3D "${libexecdir}/mc/extfs.d/* ${libexecdir}/mc/ex=
t.d/*"
> +
> +SUMMARY_${BPN}-fish =3D "Midnight Commander Fish scripts"
> +FILES_${BPN}-fish =3D "${libexecdir}/mc/fish"
> --=20
> 2.4.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlco1J0ACgkQN1Ujt2V2gBz/4wCcC56asX3P9dUwCGxA7zKgMgWN
gX0Anio7s4tW0XquRh4BGvBdscBAo6RQ
=TSMN
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--
