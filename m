Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id DD9A3721CC;
	Fri, 21 Nov 2014 14:07:55 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id y19so6609304wgg.28
	for <multiple recipients>; Fri, 21 Nov 2014 06:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Zdx8CagBE4QK2aWM20bxR86lwHKSGgri5tTV8jjWI14=;
	b=woRW0DXEN0eent2NhW4tprlUXEGFH5XfiH96RV4bNXdjOyVkwrD52JGFKzv9Id0RUU
	ZyAucy8lFWLf9/jC55Zq/O8dUe5Zy/8Xoew7nu265XaZUN3PviTqBjzkKJmvcb2mIuKF
	izvcvuhLWcdY7ip6EEPn5ytizhuiu4SPD+H6iNj5i6dQ6uejRYpPxC2h7AD2/w15Vd3F
	oXUY2UwqNEC79+xykryPf9UrA6JaZuD64O6GK5Pps1XpFPKlHyf1chHmjMaHxfosoHLA
	r+mtQ2VxNoZHw4oLWDxyqqwsHvZyTZeIkl4iSgl6nODQyouts9mFLw/7fIDUJBJV1lbK
	vKJw==
X-Received: by 10.194.172.4 with SMTP id ay4mr8094856wjc.13.1416578491675;
	Fri, 21 Nov 2014 06:01:31 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id c5sm6615wik.3.2014.11.21.06.01.30
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Nov 2014 06:01:30 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 21 Nov 2014 15:01:33 +0100
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
Message-ID: <20141121140133.GE2163@jama>
References: <20141112153903.E7E7F50273@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20141112153903.E7E7F50273@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Ross Burton : vala: upgrade to 0.26.1
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
X-List-Received-Date: Fri, 21 Nov 2014 14:07:58 -0000
X-Groupsio-MsgNum: 59823
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Q8BnQc91gJZX4vDc"
Content-Disposition: inline

--Q8BnQc91gJZX4vDc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2014 at 03:39:03PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 3562603044e908aacece86985bc8e4d7338622ac
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D3562603044e908aacece86985bc8e4d7338622ac
>=20
> Author: Ross Burton <ross.burton@intel.com>
> Date:   Mon Oct 27 23:21:53 2014 +0000
>=20
> vala: upgrade to 0.26.1
>=20
> vapigen can't be disabled anymore, so remove --disable-vapigen.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Was this needed and tested with some real world applications?

Or was it tested only because package index was showing possible
upgrade?

Causes couple failures in world builds:

  /home/jenkins/oe/world/shr-core/meta-smartphone/meta-fso/recipes-freesmar=
tphone/cornucopia/fsogsmd_git.bb, do_compile
  /home/jenkins/oe/world/shr-core/meta-smartphone/meta-shr/recipes-shr/3rdp=
arty/ffalarms_git.bb, do_compile
  /home/jenkins/oe/world/shr-core/meta-smartphone/meta-shr/recipes-shr/3rdp=
arty/iliwi_git.bb, do_compile
  /home/jenkins/oe/world/shr-core/meta-smartphone/meta-shr/recipes-shr/3rdp=
arty/sensmon_git.bb, do_compile
  /home/jenkins/oe/world/shr-core/meta-smartphone/meta-shr/recipes-shr/3rdp=
arty/valacompass_git.bb, do_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-xfce/recipes-bindi=
ngs/vala/xfce4-vala_4.10.3.bb, do_configure

> ---
>=20
>  meta/recipes-devtools/vala/vala.inc       | 5 ++---
>  meta/recipes-devtools/vala/vala_0.24.0.bb | 6 ------
>  meta/recipes-devtools/vala/vala_0.26.1.bb | 6 ++++++
>  3 files changed, 8 insertions(+), 9 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/=
vala/vala.inc
> index cac8728..63056fd 100644
> --- a/meta/recipes-devtools/vala/vala.inc
> +++ b/meta/recipes-devtools/vala/vala.inc
> @@ -13,7 +13,6 @@ SHRT_VER =3D "${@d.getVar('PV',1).split('.')[0]}.${@d.g=
etVar('PV',1).split('.')[1]
>  SRC_URI =3D "http://ftp.gnome.org/pub/GNOME/sources/${BPN}/${SHRT_VER}/$=
{BP}.tar.xz"
>  inherit autotools pkgconfig
> =20
> -EXTRA_OECONF =3D "--disable-vapigen"
> -
> +FILES_${PN} +=3D "${datadir}/${BPN}-${SHRT_VER}/vapi ${libdir}/${BPN}-${=
SHRT_VER}/"
>  FILES_${PN}-doc +=3D "${datadir}/devhelp"
> -FILES_${PN} +=3D "${datadir}/${BPN}-${SHRT_VER}/vapi"
> +FILES_${PN}-dbg +=3D "${libdir}/${BPN}-${SHRT_VER}/.debug"
> diff --git a/meta/recipes-devtools/vala/vala_0.24.0.bb b/meta/recipes-dev=
tools/vala/vala_0.24.0.bb
> deleted file mode 100644
> index 342a875..0000000
> --- a/meta/recipes-devtools/vala/vala_0.24.0.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require ${BPN}.inc
> -
> -SRC_URI +=3D " file://0001-git-version-gen-don-t-append-dirty-if-we-re-n=
ot-in-g.patch"
> -
> -SRC_URI[md5sum] =3D "beddeff9c06d3c278988b237da0e7401"
> -SRC_URI[sha256sum] =3D "22a37c977512c19cd29c373eaaef96cb2c994795d491106f=
32387f3f9d1e899c"
> diff --git a/meta/recipes-devtools/vala/vala_0.26.1.bb b/meta/recipes-dev=
tools/vala/vala_0.26.1.bb
> new file mode 100644
> index 0000000..3df9cd4
> --- /dev/null
> +++ b/meta/recipes-devtools/vala/vala_0.26.1.bb
> @@ -0,0 +1,6 @@
> +require ${BPN}.inc
> +
> +SRC_URI +=3D " file://0001-git-version-gen-don-t-append-dirty-if-we-re-n=
ot-in-g.patch"
> +
> +SRC_URI[md5sum] =3D "723a03b822d4cc47abc4019685970a3e"
> +SRC_URI[sha256sum] =3D "8407abb19ab3a58bbfc0d288abb47666ef81f76d0540258c=
03965e7545f59e6b"
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Q8BnQc91gJZX4vDc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRvRb0ACgkQN1Ujt2V2gBzqmACfdO0oHJiJc0JTpODm32w8kKGV
BOcAn2RURnX9PuSCkmArsiMgFlCfRvp+
=ICO4
-----END PGP SIGNATURE-----

--Q8BnQc91gJZX4vDc--
