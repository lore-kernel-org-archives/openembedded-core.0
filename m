Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id A44216BA1D;
	Fri, 13 Dec 2013 15:40:28 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id o10so962025eaj.4
	for <multiple recipients>; Fri, 13 Dec 2013 07:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=wzjA75DwzwVcyG6A9BeIYg51AsJ7+dADzIjROkjNcbo=;
	b=VLntxe2Q7EDVWKibImdqDMutxLIUyxxcExG5c4snNZZYzHRZK9/ArWtVoZvIGUpHsm
	79iB0otp+0uDZO6yu112tP9CtWnTb2x4k1lrbRaByEkQYmdYcNkPEWaYXqb8bK/m1H3k
	fNbkhW2FUbftWW0pQL280mf6RuPagvRiy3FiIO8A0RbR4lLwj9vmcegdJzuuYMnXnKxv
	oD+kt+MUCeLz0FcCTciyZ6zEPMnREbVTBLT4msE9NoqKjZ4KOK2N+Aa/jv7U/Tc2EMr2
	Vk21ui+jkCDzKBzMNQOTGXevd4ExZRHYar27HyT4iaaWbakAMr1bLFbH7/4DM0/Wf3kR
	LtCQ==
X-Received: by 10.15.63.77 with SMTP id l53mr3547170eex.89.1386949227729;
	Fri, 13 Dec 2013 07:40:27 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id a51sm8036401eeh.8.2013.12.13.07.40.26
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Dec 2013 07:40:26 -0800 (PST)
Date: Fri, 13 Dec 2013 16:40:51 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	openembedded-core@lists.openembedded.org
Message-ID: <20131213154051.GD3715@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: State of bitbake world, Failed tasks Fri Dec 13
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
X-List-Received-Date: Fri, 13 Dec 2013 15:40:29 -0000
X-Groupsio-MsgNum: 48205
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VMt1DrMGOVs3KQwf"
Content-Disposition: inline

--VMt1DrMGOVs3KQwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks Fri Dec 13 15:36:19 UTC 2013 =3D=3D

=3D=3D=3D common (26) =3D=3D=3D
    * meta-openembedded/meta-efl/recipes-efl/efl/evas_1.7.9.bb, do_compile
    * meta-openembedded/meta-filesystems/recipes-filesystems/smbnetfs/smbne=
tfs_git.bb, do_packagedata
    * meta-openembedded/meta-gnome/recipes-gnome/eds/evolution-data-server_=
git.bb, do_fetch
    * meta-openembedded/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.7=
=2Ebb, do_compile
    * meta-openembedded/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git=
=2Ebb, do_install
    * meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.b=
b, do_fetch
    * meta-openembedded/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.b=
b, do_compile
    * meta-openembedded/meta-networking/recipes-connectivity/inetutils/inet=
utils_1.9.1.bb, do_compile
    * meta-openembedded/meta-oe/recipes-core/libxml/libxml++_2.35.3.bb, do_=
compile
    * meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb, do_f=
etch
    * meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.8.=
13.bb, do_compile
    * meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_comp=
ile
    * meta-openembedded/meta-oe/recipes-graphics/gimp/gimp_2.8.2.bb, do_com=
pile
    * meta-openembedded/meta-oe/recipes-kernel/ktap/ktap-module_0.3.bb, do_=
fetch
    * meta-openembedded/meta-oe/recipes-kernel/ktap/ktap_0.3.bb, do_fetch
    * meta-openembedded/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb, do_=
configure
    * meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb, do_c=
ompile
    * meta-openembedded/meta-oe/recipes-navigation/navit/navit_svn.bb, do_c=
ompile
    * meta-openembedded/meta-oe/recipes-qt/qconnman/qconnman-e_git.bb, do_f=
etch
    * meta-openembedded/meta-oe/recipes-qt/qconnman/qconnman_git.bb, do_fet=
ch
    * meta-openembedded/meta-oe/recipes-qt/qtserialport/qtserialport-e_5.1.=
0.bb, do_fetch
    * meta-openembedded/meta-oe/recipes-support/freerdp/freerdp_git.bb, do_=
fetch
    * meta-openembedded/meta-webserver/recipes-webadmin/ajenti/ajenti_git.b=
b, do_fetch
    * meta-qt5/recipes-qt/qt5/qtwayland_git.bb, do_compile
    * openembedded-core/meta/recipes-devtools/python/python-imaging_1.1.7.b=
b, do_compile
    * openembedded-core/meta/recipes-support/ca-certificates/ca-certificate=
s_20130610.bb, do_packagedata

=3D=3D=3D common-x86 (6) =3D=3D=3D
    * meta-browser/recipes-devtools/ninja/ninja-native_1.4.0.bb, do_fetch
    * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
    * meta-openembedded/meta-initramfs/recipes-bsp/images/initramfs-kexecbo=
ot-klibc-image.bb, do_rootfs
    * meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_com=
pile
    * meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configure
    * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package

=3D=3D=3D qemuarm (6) =3D=3D=3D
    * meta-openembedded/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.=
bb, do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb, do_i=
nstall
    * meta-qt5/recipes-qt/qt5/qtconnectivity_git.bb, do_fetch
    * meta-qt5/recipes-qt/qt5/qtlocation_git.bb, do_fetch
    * meta-qt5/recipes-qt/qt5/qtsystems_git.bb, do_fetch
    * openembedded-core/meta/recipes-kernel/linux/linux-yocto_3.10.bb, do_f=
etch

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-geo=
de_2.11.14.bb, do_compile

=3D=3D=3D qemux86_64 (4) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs=
_git.bb, do_fetch
    * meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libim=
obiledevice_1.1.4.bb, do_configure
    * meta-openembedded/meta-oe/recipes-devtools/python/python-m2crypto_0.2=
1.1.bb, do_compile
    * meta-qt5/recipes-qt/qt5/qtlocation_git.bb, do_compile

=3D=3D=3D Number of failed tasks =3D=3D=3D
{| class=3Dwikitable
|-
||qemuarm       ||32    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20131212_013114.log/
|-
||qemux86       ||36    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20131212_104746.log/
|-
||qemux86_64    ||38    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20131212_160129.log/
|}

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VMt1DrMGOVs3KQwf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKrKoMACgkQN1Ujt2V2gBx6NQCgqLl0PfkvTuh3tchjmYQ/Rntr
Qq4AmgJJR/psG4gzUvITLzfS4Rhiwdj4
=EUnr
-----END PGP SIGNATURE-----

--VMt1DrMGOVs3KQwf--
