Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3B6A5772FE;
	Wed, 24 Feb 2016 13:19:46 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id b205so34175419wmb.1;
	Wed, 24 Feb 2016 05:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=lixVhoYzzaZj+EI94MFw7fEn7ScTJz3DBqYCLkwBZ3E=;
	b=L5aDD6kPxwMGbMVh9tpyhznqI+r+sJ88rBLJdVRCHvcafW0FEyDx7sIWlaoiuJL1zP
	tpcA+AOM/QHviDPKyt4vSqSbDKkrknEOUcWioTJHTilcjnNJF1n/RJlVtMSiXkmIQ3YI
	aOpa6ad5wp47hDHwKygHY77du/+T6GGDkA888+t3XyQ5/D6VX+njaD/WQjRFs5KmhCSY
	4C1FRy0yEGeO4i2tdKBVhE/iV6+5m9mCkra7TL8YbPD9T4aMtapwes8rMbs7oUsupP/W
	m3FRethMvsXhooAAChKjNSC4VCYc5b5v6KScjF7w5TDTdGfCpzfTCsdVN9PriB19lIdf
	5xww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=lixVhoYzzaZj+EI94MFw7fEn7ScTJz3DBqYCLkwBZ3E=;
	b=bDKTlXFM/+nh9SCouyhIAWztOnp/5ZMeogWJBwJOm3WrKYcffcMIUTEjFpoUV4tVCZ
	gxBbKl3drdcG40PepT4aMC8JDoc0hEc5lMJz+P0enZy1UOFjZtzWFoUFuoaEsmqRsgMj
	gvbyAXkg9Ih65ziXCGXeM3+BX9L+TxpLMMq4tSO+542rhLRxdZtQAx9MfthaQYGR6VMd
	z4EKuzwamf4fHJxnvYRBLOLDCmVq6FBMxSNBZFtby2oVjb7TBwdbHnhG8p3UYLPLI6me
	UyPnTLRLo04tIAtoGBr+TMs0CO0/Wkf9lRUYWHRUASOc8jb4arNLqC+dnSV0eNSblVNz
	ed+g==
X-Gm-Message-State: AG10YOTZC8ninWR5e/gV037a/UiXVP6z1dCYclRJdTSwg+Pi+aiFVOIJUF8EwTrRQpzd5A==
X-Received: by 10.28.98.84 with SMTP id w81mr23163493wmb.57.1456319987174;
	Wed, 24 Feb 2016 05:19:47 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	c136sm31109998wmd.3.2016.02.24.05.19.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Feb 2016 05:19:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 24 Feb 2016 14:20:51 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20160224132051.GA2560@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: State of bitbake world, test-dependencies 2016-02-24
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
X-List-Received-Date: Wed, 24 Feb 2016 13:19:48 -0000
X-Groupsio-MsgNum: 78594
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline

--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 14, 2015 at 08:03:47PM +0100, Martin Jansa wrote:
> This time full build (testing all recipes available in "my world" - 2503
> recipes), it took record-breaking 25days to finish.
>=20
> Complete log:
> http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20151120_=
144802.log/
> =20
> I've already sent patches for few of them, will send one for pulseaudio-l=
irc as well
> as I already have it in out local recipes. For the rest I would appreciat=
e some help
> from people actually using these recipes.
>=20
> I'll trigger new incremental build after that huge meta-oe patch queue fr=
om master-next
> is in master.
>=20
> ERROR: 34 issues were found in these recipes: clutter-gst-3.0 cryptodev-m=
odule ctdb gnome-panel jasper lcdproc libftdi mpd places pulseaudio python =
python3 rain rygel samba shr-e-gadgets shr-wizard snort sysdig tmux uptime =
vboxguestdrivers xfce4-clipman-plugin

Complete log:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20160223_11=
1019.log/

There are many issues in current master, but as a bonus we get separate
build log for each issue so it's easier for any contributor to check his
favourite recipe and send fix for it (please do).

ERROR: 111 issues were found in these recipes:
android-image-utils-native chkconfig-alternatives-native
compat-wireless-all core-image-rt core-image-rt-sdk core-image-sato-dev
core-image-sato-sdk core-image-testmaster cryptodev-module
dfu-util-native efivar ffmpeg firefox gnome-panel iksemel iscsitarget
libconnman-qt5 libetpan libftdi libgdata libnice ltp-ddt netmap
netmap-modules nodejs perf pidgin proxy-libintl pty-forward-native
python python-feedparser python-flufl-enum python-mock python-monotonic
python-msgpack python-tornado-redis python-txws python-ujson python3
qt4-x11-free remake samba samsung-modem-mgr samsung-rfs-mgr shr-image
shr-image-all shr-lite-image snort synergy system-config-keyboard thrift
tracker xfce4-clipman-plugin

Found differences:=20
WARN: gnome-panel: gnome-panel rdepends on dbus-lib, but it isn't a build d=
ependency?
WARN: libftdi: libftdi rdepends on libgcc, but it isn't a build dependency?
WARN: libftdi: libftdi rdepends on libstdc++, but it isn't a build dependen=
cy?
WARN: python: python-tkinter rdepends on glibc, but it isn't a build depend=
ency?
WARN: python: python-tkinter rdepends on libpython2, but it isn't a build d=
ependency?
WARN: python: python-tkinter rdepends on tcl-lib, but it isn't a build depe=
ndency?
WARN: python3: python3-tkinter rdepends on glibc, but it isn't a build depe=
ndency?
WARN: python3: python3-tkinter rdepends on libpython3, but it isn't a build=
 dependency?
WARN: python3: python3-tkinter rdepends on tcl-lib, but it isn't a build de=
pendency?
WARN: samba: samba rdepends on libpam, but it isn't a build dependency?
WARN: xfce4-clipman-plugin: xfce4-clipman-plugin rdepends on qrencode, but =
it isn't a build dependency?

Recipes failing with TMPDIR empty:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20160223_11=
1019.log/3_min/failed/
3_min/failed/android-image-utils-native.log
3_min/failed/compat-wireless-all.log
3_min/failed/core-image-rt-sdk.log
3_min/failed/core-image-rt.log
3_min/failed/core-image-sato-dev.log
3_min/failed/core-image-sato-sdk.log
3_min/failed/core-image-testmaster.log
3_min/failed/dfu-util-native.log
3_min/failed/efivar.log
3_min/failed/ffmpeg.log
3_min/failed/firefox.log
3_min/failed/iksemel.log
3_min/failed/iscsitarget.log
3_min/failed/libconnman-qt5.log
3_min/failed/libetpan.log
3_min/failed/libgdata.log
3_min/failed/libnice.log
3_min/failed/ltp-ddt.log
3_min/failed/nodejs.log
3_min/failed/perf.log
3_min/failed/pidgin.log
3_min/failed/proxy-libintl.log
3_min/failed/pty-forward-native.log
3_min/failed/python-feedparser.log
3_min/failed/python-flufl-enum.log
3_min/failed/python-mock.log
3_min/failed/python-monotonic.log
3_min/failed/python-msgpack.log
3_min/failed/python-tornado-redis.log
3_min/failed/python-txws.log
3_min/failed/python-ujson.log
3_min/failed/qt4-x11-free.log
3_min/failed/samsung-modem-mgr.log
3_min/failed/samsung-rfs-mgr.log
3_min/failed/shr-image-all.log
3_min/failed/shr-image.log
3_min/failed/shr-lite-image.log
3_min/failed/snort.log
3_min/failed/synergy.log
3_min/failed/system-config-keyboard.log
3_min/failed/tracker.log

Recipes failing even with TMPDIR already populated:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20160223_11=
1019.log/2_max/failed/
2_max/failed/chkconfig-alternatives-native.log
2_max/failed/compat-wireless-all.log
2_max/failed/core-image-rt-sdk.log
2_max/failed/core-image-rt.log
2_max/failed/core-image-sato-dev.log
2_max/failed/core-image-sato-sdk.log
2_max/failed/cryptodev-module.log
2_max/failed/dfu-util-native.log
2_max/failed/efivar.log
2_max/failed/ffmpeg.log
2_max/failed/firefox.log
2_max/failed/iksemel.log
2_max/failed/iscsitarget.log
2_max/failed/libconnman-qt5.log
2_max/failed/libetpan.log
2_max/failed/libgdata.log
2_max/failed/libnice.log
2_max/failed/ltp-ddt.log
2_max/failed/netmap-modules.log
2_max/failed/netmap.log
2_max/failed/nodejs.log
2_max/failed/pidgin.log
2_max/failed/proxy-libintl.log
2_max/failed/pty-forward-native.log
2_max/failed/python-feedparser.log
2_max/failed/python-flufl-enum.log
2_max/failed/python-mock.log
2_max/failed/python-monotonic.log
2_max/failed/python-msgpack.log
2_max/failed/python-tornado-redis.log
2_max/failed/python-txws.log
2_max/failed/python-ujson.log
2_max/failed/qt4-x11-free.log
2_max/failed/remake.log
2_max/failed/samsung-modem-mgr.log
2_max/failed/samsung-rfs-mgr.log
2_max/failed/shr-image-all.log
2_max/failed/shr-image.log
2_max/failed/shr-lite-image.log
2_max/failed/snort.log
2_max/failed/thrift.log
2_max/failed/tracker.log

I've sent couple more PNBLACKLISTs based on this.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbNrjIACgkQN1Ujt2V2gByzjACeNYO2VfvLEcFaMtWsuZHyYfOk
r5EAn24N8Car/8ASPvAWC93NIkqAINVi
=6Opl
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
