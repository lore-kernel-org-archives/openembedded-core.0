Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 424CD601B8;
	Wed, 16 Mar 2016 15:16:32 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id p65so194763746wmp.1;
	Wed, 16 Mar 2016 08:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=2CTvGJWdSmBYyr94ZIOEyp+wdbn32u98/Ic5n57l4GI=;
	b=oUT0+o/opxvbvT+G/UCD1GXDu2gwQXrY4egixt/PKfvxmN6UAgRxC9POtusYQ67PZn
	p6uMGkKhJnKaCtQNZjurvInbmkFkjG43yUx/Tk01GemnbnRC6+Zr4ZhVHnVcgnUAIP16
	N/X0Dzqn7tiXRgOPU5N1qGGgOXzChPFwAtvfbNcODxbRReppox86M7GfvIJKp8aTQ2T+
	Yx9YQm9x8wl9OxBg1IWGef9cPi1VOop49Zl4NHl/2R9EkTFnQUTpDy/py+RRoXqVWE7H
	LpR47r3Tvnhkz8rz2nqs8GOSfjJ67MQOkigTz9+W3igXoqqHT3kM7j9KY14uwclqMh1m
	sgGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=2CTvGJWdSmBYyr94ZIOEyp+wdbn32u98/Ic5n57l4GI=;
	b=KJwnW2rH06/JjNGblzZJfnNgIoLu7wwaOHeJTNo2cp9UXHzvu5t6NMbCnm/gVheztv
	JKKrgmphJEh/3mUD++m3+rI46hftzLMn2XbFMdBzYgDdp+tzCqUo9Ke26mmrJ6vXpHaH
	VIZDi558k1DEnLds7GssrHdjYWvo++MKkiMo/W2nqRBlMH4M3jNnMZzvuYs4O+aU1dqf
	6sqrg6XvxR0A5LnT7ua7QxCJT60YaA12KHUzFULioFEwkPIIkXOiYk7s1xBjwwGGNiRS
	gW7qZpqadTP4euXjLDCYn/6s+A0P0IAOwFNGwUqvykQRItstzYpLIp2sHezoGwaY1sQZ
	ReqA==
X-Gm-Message-State: AD7BkJKD9pAokfaJtmAASJxCT5Ndkmn0U+jq6icniGF/RRuTeRvlw+lIZAja3q+NkVEClQ==
X-Received: by 10.194.58.169 with SMTP id s9mr4509767wjq.52.1458141392395;
	Wed, 16 Mar 2016 08:16:32 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	wr2sm3466144wjc.49.2016.03.16.08.16.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Mar 2016 08:16:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 16 Mar 2016 16:20:07 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20160316152007.GA2557@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: State of bitbake world, test-dependencies 2016-03-14
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
X-List-Received-Date: Wed, 16 Mar 2016 15:16:34 -0000
X-Groupsio-MsgNum: 79695
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DocE+STaALJfprDB"
Content-Disposition: inline

--DocE+STaALJfprDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 10, 2016 at 11:34:56AM +0100, Martin Jansa wrote:
> On Wed, Feb 24, 2016 at 02:20:51PM +0100, Martin Jansa wrote:
> > On Mon, Dec 14, 2015 at 08:03:47PM +0100, Martin Jansa wrote:
> > > This time full build (testing all recipes available in "my world" - 2=
503
> > > recipes), it took record-breaking 25days to finish.
> > >=20
> > > Complete log:
> > > http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20151=
120_144802.log/
> > > =20
> > > I've already sent patches for few of them, will send one for pulseaud=
io-lirc as well
> > > as I already have it in out local recipes. For the rest I would appre=
ciate some help
> > > from people actually using these recipes.
> > >=20
> > > I'll trigger new incremental build after that huge meta-oe patch queu=
e from master-next
> > > is in master.
> > >=20
> > > ERROR: 34 issues were found in these recipes: clutter-gst-3.0 cryptod=
ev-module ctdb gnome-panel jasper lcdproc libftdi mpd places pulseaudio pyt=
hon python3 rain rygel samba shr-e-gadgets shr-wizard snort sysdig tmux upt=
ime vboxguestdrivers xfce4-clipman-plugin
> >=20
> > Complete log:
> > http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.2016022=
3_111019.log/
> >=20
> > There are many issues in current master, but as a bonus we get separate
> > build log for each issue so it's easier for any contributor to check his
> > favourite recipe and send fix for it (please do).
> >=20
> > ERROR: 111 issues were found in these recipes:
> > android-image-utils-native chkconfig-alternatives-native
> > compat-wireless-all core-image-rt core-image-rt-sdk core-image-sato-dev
> > core-image-sato-sdk core-image-testmaster cryptodev-module
> > dfu-util-native efivar ffmpeg firefox gnome-panel iksemel iscsitarget
> > libconnman-qt5 libetpan libftdi libgdata libnice ltp-ddt netmap
> > netmap-modules nodejs perf pidgin proxy-libintl pty-forward-native
> > python python-feedparser python-flufl-enum python-mock python-monotonic
> > python-msgpack python-tornado-redis python-txws python-ujson python3
> > qt4-x11-free remake samba samsung-modem-mgr samsung-rfs-mgr shr-image
> > shr-image-all shr-lite-image snort synergy system-config-keyboard thrift
> > tracker xfce4-clipman-plugin
>=20
> Complete log:
> http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20160307_=
041519.log/
>=20
> There are still almost issues reported last time
>=20
> ERROR: 88 issues were found in these recipes: android-image-utils-native
> chkconfig-alternatives-native compat-wireless-all core-image-rt
> core-image-rt-sdk core-image-sato-dev core-image-sato-sdk
> core-image-testmaster cryptodev-module dfu-util-native efivar
> gnome-panel iksemel iscsitarget libetpan libftdi ltp-ddt luajit netmap
> netmap-modules nodejs perf pidgin proxy-libintl pty-forward-native
> python python-cryptography python3 qt4-x11-free remake samba
> samsung-modem-mgr samsung-rfs-mgr shr-image shr-image-all shr-lite-image
> snort synergy system-config-keyboard xfce4-clipman-plugin

Complete log:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20160314_01=
3628.log/

Corresponding build for qemux86 is running now.

Since last time I've fixed couple components:
  android-image-utils-native
  pty-forward-native
  samsung-modem-mgr
  synergy
  system-config-keyboard
but few new ones got broken
  gnome-bluetooth (by introspection changes)
  opencv (by ffmpeg upgrade)
  umip (missing gram.h)

WARN: python3: python3-tkinter rdepends on glibc, but it isn't a build depe=
ndency?
WARN: python3: python3-tkinter rdepends on libpython3, but it isn't a build=
 dependency?
WARN: python3: python3-tkinter rdepends on tcl-lib, but it isn't a build de=
pendency?
WARN: samba: samba rdepends on libpam, but it isn't a build dependency?
WARN: libftdi: libftdi rdepends on libgcc, but it isn't a build dependency?
WARN: libftdi: libftdi rdepends on libstdc++, but it isn't a build dependen=
cy?
WARN: gnome-panel: gnome-panel rdepends on dbus-lib, but it isn't a build d=
ependency?
WARN: xfce4-clipman-plugin: xfce4-clipman-plugin rdepends on qrencode, but =
it isn't a build dependency?
WARN: python: python-tkinter rdepends on glibc, but it isn't a build depend=
ency?
WARN: python: python-tkinter rdepends on libpython2, but it isn't a build d=
ependency?
WARN: python: python-tkinter rdepends on tcl-lib, but it isn't a build depe=
ndency?

3_min/failed/compat-wireless-all.log
3_min/failed/core-image-sato-dev.log
3_min/failed/core-image-sato-sdk.log
3_min/failed/core-image-testmaster.log
3_min/failed/dfu-util-native.log
3_min/failed/efivar.log
3_min/failed/gnome-bluetooth.log
3_min/failed/ltp-ddt.log
3_min/failed/luajit.log
3_min/failed/opencv.log
3_min/failed/perf.log
3_min/failed/proxy-libintl.log
3_min/failed/python-cryptography.log
3_min/failed/samsung-rfs-mgr.log
3_min/failed/shr-image-all.log
3_min/failed/shr-image.log
3_min/failed/shr-lite-image.log
3_min/failed/umip.log

2_max/failed/chkconfig-alternatives-native.log
2_max/failed/compat-wireless-all.log
2_max/failed/core-image-sato-dev.log
2_max/failed/core-image-sato-sdk.log
2_max/failed/cryptodev-module.log
2_max/failed/dfu-util-native.log
2_max/failed/efivar.log
2_max/failed/gnome-bluetooth.log
2_max/failed/ltp-ddt.log
2_max/failed/luajit.log
2_max/failed/netmap-modules.log
2_max/failed/netmap.log
2_max/failed/opencv.log
2_max/failed/proxy-libintl.log
2_max/failed/python-cryptography.log
2_max/failed/remake.log
2_max/failed/shr-image-all.log
2_max/failed/shr-image.log
2_max/failed/shr-lite-image.log
2_max/failed/umip.log

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DocE+STaALJfprDB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbpeaYACgkQN1Ujt2V2gByVPgCfaSIxVTCTqm5l0CqzS98FGaZ9
C9AAoI4dnIrnxu+7nPGM/iREB1FwWo+G
=ShGC
-----END PGP SIGNATURE-----

--DocE+STaALJfprDB--
