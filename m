Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 00EFD6F179;
	Sat, 22 Feb 2014 18:09:06 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id d10so1018110eaj.28
	for <multiple recipients>; Sat, 22 Feb 2014 10:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2lr2M935Fmyf0X1w2RSPGe+dA/Z2JA2Hbk1ijG9UCqE=;
	b=EjsMEIs/eVFvMX3a8FydAtP16hahBGmTELkfdTaaYmKNmujBvc2Gd664vkNcHoEkpj
	bin6jvlnYse6E3gL6AUnvTyL4wFti+ngyRKgjS8pF9pNHvknnX8ivYApZum+gYahHDUV
	pAO3rsMOF9wjzmdBn6gwuDY8c2nDXOLCuOhvr343TBpriNxibN1gXNIRVVAzKNAzDhPI
	b8tGB80ipqEC//Q1ZvC+xiTEh63bHhhh2iwJwRdxm8GtXXXbKoFoHU6T3NiEWNZkfh2d
	iDqRCCMaq5jWO6HTM1afz6KUtjJ0BOKHSBYGSsEm9kSHl7b9cYczHanbElv62j2eSPRv
	xH4w==
X-Received: by 10.14.179.129 with SMTP id h1mr15698122eem.26.1393092546910;
	Sat, 22 Feb 2014 10:09:06 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	n48sm20690176eew.0.2014.02.22.10.09.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 22 Feb 2014 10:09:05 -0800 (PST)
Date: Sat, 22 Feb 2014 19:09:42 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140222180942.GP3854@jama>
References: <20140221160142.GH3854@jama>
MIME-Version: 1.0
In-Reply-To: <20140221160142.GH3854@jama>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: State of bitbake world, Failed tasks 2014-02-21
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
X-List-Received-Date: Sat, 22 Feb 2014 18:09:12 -0000
X-Groupsio-MsgNum: 50448
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tZCmRiovzb4sxAVa"
Content-Disposition: inline

--tZCmRiovzb4sxAVa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2014 at 05:01:42PM +0100, Martin Jansa wrote:
> http://www.openembedded.org/wiki/Bitbake_World_Status
>=20
> =3D=3D Failed tasks 2014-02-21 =3D=3D
>=20
> =3D=3D=3D common (20) =3D=3D=3D
>     * meta-openembedded/meta-efl/recipes-efl/e17/e-tasks_git.bb, do_compi=
le

Fixed.

>     * meta-openembedded/meta-efl/recipes-efl/e17/emprint_svn.bb, do_compi=
le
>     * meta-openembedded/meta-efl/recipes-efl/e17/news_svn.bb, do_compile
>     * meta-openembedded/meta-efl/recipes-efl/e17/rage_svn.bb, do_compile

Removed (see efl-1.8 thread in oe-devel ML)

>     * meta-openembedded/meta-efl/recipes-efl/webkit/webkit-efl_2.3.2+svnr=
159807.bb, do_configure

Missing icu in harfbuzz PACKAGECONFIG.

>     * meta-openembedded/meta-gnome/recipes-gnome/devilspie/devilspie2_0.2=
4.bb, do_compile
>     * meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_12.=
2.bb, do_fetch
>     * meta-openembedded/meta-multimedia/recipes-multimedia/musicbrainz/li=
bmusicbrainz_git.bb, do_configure
>     * meta-openembedded/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11=
=2Ebb, do_compile

Most likely broken by
commit 85ac4d82c77e3cab6a5867e4ec110ba07023838b
Author: Cristian Iorga <cristian.iorga@intel.com>
Date:   Wed Feb 12 18:42:32 2014 +0200

    flac: upgrade to 1.3.0

I'm working on this.

>     * meta-openembedded/meta-networking/recipes-support/traceroute/tracer=
oute_2.0.18.bb, do_compile
>     * meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb, do=
_install
>     * meta-openembedded/meta-oe/recipes-core/libxml/libxml++_2.35.3.bb, d=
o_compile
>     * meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.=
8.13.bb, do_configure
>     * meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_co=
mpile
>     * meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb, do=
_compile
>     * meta-openembedded/meta-oe/recipes-support/inih/libinih_git.bb, do_i=
nstall
>     * meta-qt5/recipes-qt/qt5/qtwayland_git.bb, do_compile

fixed compilation without gles2 (with gl only), patches in meta-qt5/master-=
next

>     * meta-smartphone/meta-fso/recipes-freesmartphone/freesmartphone/zhon=
e_git.bb, do_compile

Fixed.

>     * meta-smartphone/meta-shr/recipes-shr/themes/e-wm-theme-illume-neo_g=
it.bb, do_compile

Fixed.

>     * openembedded-core/meta/recipes-graphics/wayland/weston_1.4.0.bb, do=
_configure

Probably fixed by adding wayland to jenkins's DISTRO_FEATURES

The rest is free for other people to blitz during this bug squashing
weekend.

If you start working on some of these, please leave an message here,
I'll do the same if I find time to work on some more.

> =3D=3D=3D common-x86 (5) =3D=3D=3D
>     * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_comp=
ile
>     * meta-openembedded/meta-initramfs/recipes-bsp/images/initramfs-kexec=
boot-klibc-image.bb, do_rootfs
>     * meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_c=
ompile
>     * meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_config=
ure
>     * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
>=20
> =3D=3D=3D qemuarm (2) =3D=3D=3D
>     * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb, d=
o_compile
>     * openembedded-core/meta/recipes-bsp/grub/grub_git.bb, do_package
>=20
> =3D=3D=3D qemux86 (1) =3D=3D=3D
>     * meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-g=
eode_2.11.14.bb, do_compile
>=20
> =3D=3D=3D qemux86_64 (1) =3D=3D=3D
>     * meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/lib=
imobiledevice_1.1.4.bb, do_configure
>=20
> =3D=3D=3D Number of failed tasks =3D=3D=3D
> {| class=3Dwikitable
> |-
> ||qemuarm       ||22    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr=
-core-branches//log.world.20140219_131156.log/
> |-
> ||qemux86       ||26    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr=
-core-branches//log.world.20140220_075930.log/
> |-
> ||qemux86_64    ||26    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr=
-core-branches//log.world.20140218_180012.log/
> |}
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tZCmRiovzb4sxAVa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMI5+YACgkQN1Ujt2V2gBwImwCfc3q/EUP5BF6lXEGInJL/k/qU
uKEAnA/AhIHD3EVvTyGbTR+lFn/HHFDy
=Burs
-----END PGP SIGNATURE-----

--tZCmRiovzb4sxAVa--
