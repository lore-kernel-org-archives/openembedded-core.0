Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id E4F2270394;
	Mon, 14 Jul 2014 19:36:47 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id z12so4581064wgg.0
	for <multiple recipients>; Mon, 14 Jul 2014 12:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=f3T0zYG2cS2xVM2o8z+e3LxZFJRv7nYY0ASY3pxxh4s=;
	b=a3z6dSUwCu04co2omNrx56n/RYva6CoLV6jRQ5QJ/tmjxpkYEkE4zyY9YkqAdjsm8w
	9MEhM+wvp5JrhHHJGoAii78d7eVNzh2pmF1uKg8xhEEwVIgeAblNoemwRN2XJKjyoMhf
	U+E55K3xBxygdpjb6wQOqtd7wOGSjHcAqMFGiTBRlLE30xQrL8gppZFz/E0+Rr9j/gbP
	H2h2Gd5b4KzgON+oK5YZ1A2CL0+Dcr9b2+EDmj6bSPjwnlUPPynMqUEYY+r4LEyMDq6h
	q7Go5peKBEQQ4xsy6WijlMLPwBlro2Ur/DiNLZF2/KqQhDFC+mGme9aQEt2ctl6RXvB/
	XvOA==
X-Received: by 10.180.80.70 with SMTP id p6mr176251wix.22.1405366608919;
	Mon, 14 Jul 2014 12:36:48 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ub11sm34579465wib.1.2014.07.14.12.36.47 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jul 2014 12:36:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 14 Jul 2014 21:36:57 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140714193657.GJ2433@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, Failed tasks 2014-07-14
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
X-List-Received-Date: Mon, 14 Jul 2014 19:36:49 -0000
X-Groupsio-MsgNum: 54863
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k18oBAwMkTg3OUap"
Content-Disposition: inline

--k18oBAwMkTg3OUap
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2014-07-14 =3D=3D

=3D=3D=3D common (31) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
    * meta-openembedded/meta-filesystems/recipes-filesystems/owfs/owfs_2.9p=
1.bb, do_compile
    * meta-openembedded/meta-filesystems/recipes-filesystems/smbnetfs/smbne=
tfs_git.bb, do_configure
    * meta-openembedded/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5=
=2E9.0.bb, do_configure
    * meta-openembedded/meta-multimedia/recipes-multimedia/openal/openal-so=
ft_1.15.1.bb, do_compile
    * meta-openembedded/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb=
, do_configure
    * meta-openembedded/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1=
=2Ebb, do_install
    * meta-openembedded/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb, do_packag=
e_qa
    * meta-openembedded/meta-oe/recipes-devtools/python/python-cython_git.b=
b, do_package_qa
    * meta-openembedded/meta-oe/recipes-devtools/python/python-pyyaml_3.10.=
bb, do_compile
    * meta-openembedded/meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb,=
 do_compile
    * meta-openembedded/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.5.bb, =
do_compile
    * meta-openembedded/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb, do_=
install
    * meta-openembedded/meta-oe/recipes-navigation/orrery/orrery_2.7.bb, do=
_compile
    * meta-openembedded/meta-oe/recipes-support/daemonize/daemonize_git.bb,=
 do_configure
    * meta-openembedded/meta-oe/recipes-support/farsight/libnice_0.0.13.bb,=
 do_configure
    * meta-openembedded/meta-oe/recipes-support/fltk/fltk_1.1.10.bb, do_ins=
tall
    * meta-openembedded/meta-oe/recipes-support/pidgin/libotr_4.0.0.bb, do_=
compile
    * meta-openembedded/meta-webserver/recipes-webadmin/webmin/webmin_1.620=
=2Ebb, do_package
    * meta-openembedded/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb, do_=
configure
    * meta-smartphone/meta-aurora/recipes-aurora/aurora/aurora-daemon_git.b=
b, do_configure
    * meta-smartphone/meta-fso/recipes-freesmartphone/freesmartphone/zhone_=
git.bb, do_compile
    * meta-smartphone/meta-fso/recipes-freesmartphone/python/python-pyrtc_g=
it.bb, do_compile
    * meta-smartphone/meta-palm/recipes-bsp/tsmd/tsmd_git.bb, do_configure
    * meta-smartphone/meta-shr/recipes-shr/3rdparty/numptyphysics_svn.bb, d=
o_configure
    * meta-smartphone/meta-shr/recipes-shr/3rdparty/sensmon_git.bb, do_conf=
igure
    * meta-smartphone/meta-shr/recipes-shr/3rdparty/vagalume_0.8.5.bb, do_c=
onfigure
    * meta-smartphone/meta-shr/recipes-shr/3rdparty/valacompass_git.bb, do_=
configure
    * meta-smartphone/meta-shr/recipes-shr/games/mokomaze_0.5.5.bb, do_conf=
igure
    * meta-smartphone/meta-shr/recipes-shr/shr/phonefsod_git.bb, do_configu=
re
    * meta-smartphone/meta-shr/recipes-shr/shr/python-phoneutils_git.bb, do=
_compile

=3D=3D=3D common-x86 (4) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium_35.0.1916.114.bb, do_c=
ompile
    * meta-openembedded/meta-initramfs/recipes-kernel/linux/linux-yocto-tin=
y-kexecboot_3.10.bb, do_package_qa
    * meta-openembedded/meta-oe/recipes-devtools/concurrencykit/concurrency=
kit_git.bb, do_compile
    * meta-smartphone/meta-fso/recipes-freesmartphone/freesmartphone/mioctl=
_git.bb, do_configure

=3D=3D=3D qemuarm (14) =3D=3D=3D
    * meta-openembedded/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb,=
 do_configure
    * meta-openembedded/meta-networking/recipes-connectivity/snort/snort_2.=
9.6.0.bb, do_configure
    * meta-openembedded/meta-networking/recipes-support/lksctp-tools/lksctp=
-tools_1.0.16.bb, do_compile
    * meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs=
_git.bb, do_package_qa
    * meta-openembedded/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb, do_=
compile
    * meta-openembedded/meta-oe/recipes-extended/subsurface/subsurface_git.=
bb, do_compile
    * meta-openembedded/meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb, do_i=
nstall
    * meta-openembedded/meta-oe/recipes-support/flite/flite-alsa_1.3.bb, do=
_install
    * meta-openembedded/meta-oe/recipes-support/usbpath/usbpath_svn.bb, do_=
configure
    * meta-openembedded/meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb=
, do_package
    * meta-smartphone/meta-fso/recipes-freesmartphone/freesmartphone/fso-gp=
sd_git.bb, do_configure
    * meta-smartphone/meta-osmocombb/recipes-osmocombb/osmoconbb/osmocon_gi=
t.bb, do_configure
    * openembedded-core/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb, d=
o_compile
    * openembedded-core/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.1=
3.bb, do_configure

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * openembedded-core/meta/recipes-bsp/usbinit/usbinit.bb, do_install

=3D=3D=3D qemux86_64 (2) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs=
_git.bb, do_compile
    * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb, do_compile

=3D=3D=3D Number of failed tasks =3D=3D=3D
{| class=3Dwikitable
|-
||qemuarm       ||45    ||http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20140712_004121.log/||
|-
||qemux86       ||36    ||http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20140712_175359.log/||
|-
||qemux86_64    ||49    ||http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20140713_094108.log/||
|}


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--k18oBAwMkTg3OUap
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPEMVkACgkQN1Ujt2V2gBxf/gCfZcLMrqMYkJN22NSwMmTNDMaT
+hkAoIcLdGmCb1Q002M9VT4fB7P++nA1
=icnP
-----END PGP SIGNATURE-----

--k18oBAwMkTg3OUap--
