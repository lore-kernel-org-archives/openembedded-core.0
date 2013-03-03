Received: from mail-pb0-f44.google.com ([209.85.160.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1UC8S6-0005Pd-9p; Sun, 03 Mar 2013 13:55:43 +0100
Received: by mail-pb0-f44.google.com with SMTP id wz12so2580266pbc.3
	for <multiple recipients>; Sun, 03 Mar 2013 04:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KoOcjRyr7gnD0IKddQlaSRECpQYlZAf91mcfnAJOG1I=;
	b=fIQRDZ0xC936oYY3ahDcvFGr4MYCof4cPAn7uXcxPt8TxSLQtq1b3o7G+xY3MhFbep
	R3d5OwSMKjvOnRyH7j0cJxRMihLf2A64zwRa49oB+BDU1ofd/GkKaa00FIkC5BGh0Ued
	iWg/oxfI8IYXBTSRpsO1OudUU/DZLQF9wBk6I3kyvi6a6Wo6ZvaPq3p459F+mm2o5GCl
	VTUuNDjFTG/skvWckTVRIkjekwbfo9lcRLrLL6HPMvtQ267eCr/nrrsF2qaLNU3zdJYW
	Bi4aP8Q0Mao9ZmbtztwN8523Yojg4T3QxFgeqeylZpJFlHcWdhNTYsBcPb2ZXixpuYmy
	pajw==
X-Received: by 10.66.52.50 with SMTP id q18mr27871224pao.16.1362314355001;
	Sun, 03 Mar 2013 04:39:15 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ub1sm18702722pbc.5.2013.03.03.04.39.11
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 03 Mar 2013 04:39:13 -0800 (PST)
Date: Sun, 3 Mar 2013 13:39:03 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Message-ID: <20130303123903.GC3285@jama>
References: <20121213174202.GE3356@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20121213174202.GE3356@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: State of bitbake world
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
X-List-Received-Date: Sun, 03 Mar 2013 12:56:02 -0000
X-Groupsio-MsgNum: 36155
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="S1BNGpv0yoYahz37"
Content-Disposition: inline

--S1BNGpv0yoYahz37
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Updated state of world builds on distroless=20
oe-core+meta-oe+meta-smartphone layers
this time also on qemux86 and qemux86-64:

qemuarm:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30301_160601.log/
qemux86:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30228_235947.log/
qemux86-64:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30302_074041.log/

all 3:
  meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb, d=
o_compile
  meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.26.0=
=2Ebb, do_compile
  meta-openembedded/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb, d=
o_compile
  meta-openembedded/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb,=
 do_compile
  meta-openembedded/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb, do_comp=
ile
  meta-openembedded/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb, do_co=
mpile
  meta-openembedded/meta-gnome/recipes-gnome/gnome-power-manager/gnome-powe=
r-manager_2.32.0.bb, do_compile
  meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb, do=
_compile
  meta-openembedded/meta-oe/recipes-kernel/compat-wireless/compat-wireless-=
all_3.6.8.bb, do_compile
  meta-openembedded/meta-oe/recipes-support/tbb/tbb_4.1.bb, do_fetch
  meta-openembedded/meta-oe/recipes-multimedia/minidlna/minidlna_1.0.25.bb,=
 do_compile
  meta-openembedded/meta-oe/recipes-devtools/geany/geany_1.22.bb, do_config=
ure
  meta-openembedded/meta-oe/recipes-support/gperftools/gperftools_2.0.bb, d=
o_install
  meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb, d=
o_compile
  meta-openembedded/meta-multimedia/recipes-dvb/wscan/wscan_20121111.bb, do=
_compile
  meta-openembedded/meta-networking/recipes-support/memcached/memcached_1.4=
=2E15.bb, do_configure

qemuarm:
  meta-openembedded/meta-gnome/recipes-support/atk/at-spi2-core_2.6.3.bb, d=
o_configure
  meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb=
, do_compile
  meta-openembedded/meta-oe/recipes-support/libunwind/libunwind_1.1.bb, do_=
compile
  meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5=
=2E0.bb, do_compile
  meta-openembedded/meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3=
=2E1.bb, do_compile
  openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb, do_comp=
ile

qemux86:
  meta-openembedded/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb, =
do_compile
  meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configure
  meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compile
  meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb=
, do_compile
  meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2=
=2E0.2.bb, do_configure
  meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5=
=2E0.bb, do_compile
  openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb, do_comp=
ile
  openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21=
=2E0.bb, do_compile

qemux86-64:
  meta-openembedded/meta-gnome/recipes-support/atk/at-spi2-core_2.6.3.bb, d=
o_configure
  meta-openembedded/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb, =
do_compile
  meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configure
  meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimobil=
edevice_1.1.4.bb, do_configure
  meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compile
  meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2=
=2E0.2.bb, do_compile
  meta-smartphone/meta-android/recipes-graphics/libhybris/libhybris_git.bb,=
 do_compile
  meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
  openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21=
=2E0.bb, do_compile

qemux86-64 has few new QA warnings:
usbmuxd-git: usbmuxd: Files/directories were installed but not shipped
  /usr/lib64
  /usr/lib64/libusbmuxd.so.1.0.8
  /usr/lib64/libusbmuxd.so.2
  /usr/lib64/libusbmuxd.so
  /usr/lib64/.debug
  /usr/lib64/pkgconfig
  /usr/lib64/.debug/libusbmuxd.so.1.0.8
  /usr/lib64/pkgconfig/libusbmuxd.pc
rpm-5.4.9: rpm: Files/directories were installed but not shipped
  /etc
  /etc/rcS.d
  /etc/rcS.d/S98run-postinsts

only qemux86 was able to build at-spi2-atk (because of site file), but with=
 QA warnings:
at-spi2-atk-2.6.2: at-spi2-atk: Files/directories were installed but not sh=
ipped
  /usr/share
  /usr/lib/gtk-2.0
  /usr/lib/gnome-settings-daemon-3.0
  /usr/lib/gtk-2.0/modules
  /usr/lib/gtk-2.0/modules/libatk-bridge.so
  /usr/lib/gtk-2.0/modules/libatk-bridge.la
  /usr/lib/gtk-2.0/modules/.debug
  /usr/lib/gtk-2.0/modules/.debug/libatk-bridge.so
  /usr/lib/gnome-settings-daemon-3.0/gtk-modules
  /usr/lib/gnome-settings-daemon-3.0/gtk-modules/at-spi2-atk.desktop
  /usr/share/glib-2.0
  /usr/share/glib-2.0/schemas
  /usr/share/glib-2.0/schemas/org.a11y.atspi.gschema.xml

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--S1BNGpv0yoYahz37
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEzRGcACgkQN1Ujt2V2gBxrDQCfSgYA/a3S7MO9cn8TTv/SP6u7
05AAn0QzRlKSYDOSXkuvXhF5l+SPnDmQ
=sDMg
-----END PGP SIGNATURE-----

--S1BNGpv0yoYahz37--
