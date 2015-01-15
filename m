Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 076C37226D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 16:19:24 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id l15so18937239wiw.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 08:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GDC/Ai4VN/ggcvS8fA5lrZZmQ+kyavFUO4hIaEMxryU=;
	b=FJszj75X8sb12lUMJQjPgBDapu+f7QQkQ+SbXk9WVlYNZ6blUa4ONjG0J54ZpJYu4E
	861HU/CkLsNd8/YoMj0gg4ujuc8JXpUvDQEabO0oLuIC/ij95ds+wzij4qyFb2LgFyPp
	EdCBJBdBTKcJ5pRMc7t+p+DPhZMqcO5ApgzEp4ozCnsRQR/9EXs6+o5s/227quNtTXPI
	ssm2LZi/Czk9ozEbO8UNAjjww5W8ljGb+DusG4iJ7CkUA9iUORnn/22VPAkJJOQnHDQl
	bFgQJi35S3QBuhCYU5mp0uBG5hxQDMTSmwZuW+0T7Nlfe9VMNJtVravTI5klVGbtP20H
	6etg==
X-Received: by 10.194.71.203 with SMTP id x11mr19689840wju.131.1421338763944; 
	Thu, 15 Jan 2015 08:19:23 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id 7sm2654418wjq.29.2015.01.15.08.19.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Jan 2015 08:19:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 15 Jan 2015 17:19:27 +0100
To: "Maxin B. John" <maxin.john@enea.com>
Message-ID: <20150115161927.GD2482@jama>
References: <1421338127-1158-1-git-send-email-maxin.john@enea.com>
MIME-Version: 1.0
In-Reply-To: <1421338127-1158-1-git-send-email-maxin.john@enea.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] fuse-exfat: upgrade to 1.1.0
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
X-List-Received-Date: Thu, 15 Jan 2015 16:19:33 -0000
X-Groupsio-MsgNum: 61419
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="P+33d92oIH25kiaB"
Content-Disposition: inline

--P+33d92oIH25kiaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2015 at 05:08:47PM +0100, Maxin B. John wrote:
> Bump to 1.1.0
> 1. Updated LICENSE from GPLv3 to GPLv2 or later
> 2. Misc. spelling fix

Please resend to oe-devel ML.

>=20
> Signed-off-by: Maxin B. John <maxin.john@enea.com>
> ---
>  .../fuse-exfat/{fuse-exfat_1.0.1.bb =3D> fuse-exfat_1.1.0.bb}  | 12 ++++=
++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>  rename meta-filesystems/recipes-filesystems/fuse-exfat/{fuse-exfat_1.0.1=
=2Ebb =3D> fuse-exfat_1.1.0.bb} (60%)
>=20
> diff --git a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1=
=2E0.1.bb b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.1.=
0.bb
> similarity index 60%
> rename from meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.=
0.1.bb
> rename to meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.1.=
0.bb
> index f984c4b..6a83ab2 100644
> --- a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.0.1.bb
> +++ b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.1.0.bb
> @@ -1,12 +1,12 @@
>  SUMMARY =3D "read and write exFAT driver for FUSE"
>  DESCRIPTION =3D "fuse-exfat is a read and write driver implementing the \
>  extended file allocation table as a filesystem in userspace. A mounthelp=
er \
> -is provided unter the name mount.exfat-fuse. \
> +is provided under the name mount.exfat-fuse. \
>  "
>  HOMEPAGE =3D "http://code.google.com/p/exfat/"
>  SECTION =3D "universe/otherosfs"
> -LICENSE =3D "GPLv3"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> +LICENSE =3D "GPLv2+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
>  SRC_URI =3D "${DEBIAN_MIRROR}/main/f/fuse-exfat/fuse-exfat_${PV}.orig.ta=
r.gz \
>  "
>  DEPENDS =3D "fuse virtual/libc"
> @@ -14,11 +14,11 @@ RRECOMMENDS_${PN} =3D "util-linux-mount"
> =20
>  inherit scons
> =20
> -SRC_URI[md5sum] =3D "7988a5111841593231f20af22153362d"
> -SRC_URI[sha256sum] =3D "12ac1ba1b7d4343bef64e7898176705a41cfe3b5a7a179e2=
8549d242e2854758"
> +SRC_URI[md5sum] =3D "b2a23c032661cb1c1da4514e7af33916"
> +SRC_URI[sha256sum] =3D "198c520e417e955dc5c08687c278e63eefa56719da4452aa=
4a605be0327f953e"
> =20
>  EXTRA_OESCONS =3D " \
> -    DESTDIR=3D${D}/${base_sbindir} \
> +    CCFLAGS=3D'${CCFLAGS} -std=3Dc99' DESTDIR=3D${D}/${base_sbindir} \
>  "
> =20
>  do_install_prepend() {
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--P+33d92oIH25kiaB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlS36I8ACgkQN1Ujt2V2gBwJjgCeI+JPtIr49m6CIf8YMp2+qdsP
q98Anieu642iO8nxslOHWc/oOJ0/EZmd
=OEUs
-----END PGP SIGNATURE-----

--P+33d92oIH25kiaB--
