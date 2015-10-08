Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id A3CBE60232;
	Thu,  8 Oct 2015 10:16:58 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so18430608wic.1;
	Thu, 08 Oct 2015 03:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=a7b9r/+a6yXmfKj09j27fTy/+1tcaelhScxVTNH5cqc=;
	b=TMoiolCoDEBsLHn6uIKLnJxbTwYuZZMfBdgfUy/gz6sB1/vbwUnJgQR+QQFRJlA0ZJ
	Kc1HY6NAt6Wl2vWlP1MrBjFIZB8KCmI1BqaYrD5KKknyhlU21VuHipvyaVKeyc9S1nsa
	sE9TzThK2Jv57vrrpgVPl+sT8Xc6Rlp27ezE/X0dXFcf41hkgT+4dx19q/VGEOS9Ej8N
	CmIIZSE9vK8Ds4hDndu+Xycq28Ol5636+GjXsnn5I9snAA7RHNVkOdwAVH3ScdNCNKCr
	f9zLW7f8CFecaA79Ljh1csQwu8Dq1VdlcOq7K571kiV6tRiTvLuIV37rkwxMGLUdwkfA
	wXnw==
X-Received: by 10.180.102.195 with SMTP id fq3mr3097709wib.7.1444299418175;
	Thu, 08 Oct 2015 03:16:58 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	cc8sm31770525wjc.46.2015.10.08.03.16.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Oct 2015 03:16:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 8 Oct 2015 12:17:09 +0200
To: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20151008101709.GH2385@jama>
References: <20150923134118.A8135504DC@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20150923134118.A8135504DC@opal.openembedded.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Alexander Kanavin : gcr: remove the recipe due to its move to oe-core
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
X-List-Received-Date: Thu, 08 Oct 2015 10:16:58 -0000
X-Groupsio-MsgNum: 71989
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gTtJ75FAzB1T2CN6"
Content-Disposition: inline

--gTtJ75FAzB1T2CN6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2015 at 01:41:18PM +0000, git@git.openembedded.org wrote:
> Module: meta-openembedded.git
> Branch: master
> Commit: 7e13bb138c5e9b66b77bf942c2add861356ffb66
> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit=
;h=3D7e13bb138c5e9b66b77bf942c2add861356ffb66
>=20
> Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> Date:   Mon Sep 14 15:26:43 2015 +0300
>=20
> gcr: remove the recipe due to its move to oe-core
>=20
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> ---
>=20
>  meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb | 24 ------------------------
>  1 file changed, 24 deletions(-)
>=20
> diff --git a/meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb b/meta-gnome/recip=
es-gnome/gcr/gcr_3.8.2.bb
> deleted file mode 100644
> index e9a837b..0000000
> --- a/meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -SUMMARY =3D "A library for bits of crypto UI and parsing etc"
> -HOMEPAGE =3D "http://www.gnome.org/"
> -BUGTRACKER =3D "https://bugzilla.gnome.org/"
> -
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9abc=
605"
> -
> -DEPENDS =3D "gtk+3 p11-kit glib-2.0 libgcrypt"
> -
> -PNBLACKLIST[gcr] ?=3D "CONFLICT: 4 files conflict with gnome-keyring"
> -# e.g. sysroots/qemux86-64/usr/share/glib-2.0/schemas/org.gnome.crypto.p=
gp.gschema.xml
> -#      sysroots/qemux86-64/usr/share/GConf/gsettings/org.gnome.crypto.pg=
p.convert

I don't see this issue resolved in the version moved to oe-core, why did
you remove PNBLACKLIST?

It's still failing:
http://errors.yoctoproject.org/Errors/Details/20244/


> -
> -inherit autotools gnomebase gtk-icon-cache gtk-doc
> -
> -GNOME_COMPRESS_TYPE=3D"xz"
> -
> -SRC_URI[archive.md5sum] =3D "f5e66afcab19897a0de0590735329fb1"
> -SRC_URI[archive.sha256sum] =3D "a1e615ce2cfd375f383bbdd289935a8e3e16901c=
3c6f032780847055e8bec2c1"
> -
> -FILES_${PN} +=3D " \
> -    ${datadir}/dbus-1 \
> -    ${datadir}/gcr-3 \
> -"
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gTtJ75FAzB1T2CN6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYWQqQACgkQN1Ujt2V2gBxjfACfZNcrjLBEPNumzrFlr/zd4Rhz
+zwAoIqo3V0eVVO4vBAjxXWdQD9wCOMQ
=tivd
-----END PGP SIGNATURE-----

--gTtJ75FAzB1T2CN6--
