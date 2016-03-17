Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 504FC6FF72;
	Thu, 17 Mar 2016 11:30:51 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id l124so81227302wmf.1;
	Thu, 17 Mar 2016 04:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=9VX4ImFHuqJ5wPy3u7ik49F7Zb0d4ucm0WDR0qqYK14=;
	b=RP/rhL1WvqkrbgBtWqBSjXjbB/cJ1rgHRGQii2LP5+QRZBxsiqwDsrLXnor4jpxGbm
	Fl9SNnMijhqzObfUnF6Fph9MkbvmumpQsr5iHfN7g15oTdxDYSYGld7XN2/qDliGccYI
	iN4ZGYixClcpSLizuwqxsR+dT4qDS5sTsC5emWczELOGVIlFzXE85N9olBkpH6H9aMiG
	8gPyT4utaP2KG0sARD+o6jnjQRmt+WRNOSLF/FYOIWvJcQlUFSBnS9ESqWVFCCoQp25/
	6HwYiPnV65A/lEYpOD53aBpQmis/8fCSCfESNXrV/1+/bUizW8neM1r4HsM0Km29rg8n
	ef5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=9VX4ImFHuqJ5wPy3u7ik49F7Zb0d4ucm0WDR0qqYK14=;
	b=LyY16CW39ptBN79TotSw3v0jDBveBeOahMibSdEqMCf4wxB+CrLlg8N2Z3xmlaEiEx
	XnGAWlZ+oQUK6VMjzFo+Ji4bEJuHXgCg+97i8IQDUr++mbiMm0FIR6OKGR9KzaLt+mYF
	IQv+NTikyLwenVyNZh8NX3fpFKNwgfadNFQJTN5p/NY68iueTvaHFO2FlgJcRNlgW9YF
	gYoPSlGVpTrcqS4V65EmiSukuF8uRBy2KGPw4/yDgVRp4Q09k08tOVsZtfgErbbbEjag
	i3b9EEzBU0FheX/IJWiCa5dkOWyR6hlry4S6ilDZSRbTZozEt08TZFoYY5i6Q9gHDMEE
	E9/g==
X-Gm-Message-State: AD7BkJLOdRHnIraF6fdNUfuMKCp5yYsH2Z6h1HxqlmZqdy7rmrxZkze7vzPymyFdfSO4Xw==
X-Received: by 10.28.186.214 with SMTP id k205mr36263851wmf.23.1458214251321; 
	Thu, 17 Mar 2016 04:30:51 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	73sm29828110wmy.22.2016.03.17.04.30.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Mar 2016 04:30:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 17 Mar 2016 12:34:34 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20160317113434.GA2553@jama>
References: <20160316152007.GA2557@jama>
MIME-Version: 1.0
In-Reply-To: <20160316152007.GA2557@jama>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: State of bitbake world, test-dependencies 2016-03-14
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
X-List-Received-Date: Thu, 17 Mar 2016 11:30:52 -0000
X-Groupsio-MsgNum: 79728
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline

--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 16, 2016 at 04:20:07PM +0100, Martin Jansa wrote:
> On Thu, Mar 10, 2016 at 11:34:56AM +0100, Martin Jansa wrote:
> > On Wed, Feb 24, 2016 at 02:20:51PM +0100, Martin Jansa wrote:
> > > On Mon, Dec 14, 2015 at 08:03:47PM +0100, Martin Jansa wrote:
> > > > This time full build (testing all recipes available in "my world" -=
 2503
> > > > recipes), it took record-breaking 25days to finish.
> > > >=20
> > > > Complete log:
> > > > http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.201=
51120_144802.log/
> > > > =20
> > > > I've already sent patches for few of them, will send one for pulsea=
udio-lirc as well
> > > > as I already have it in out local recipes. For the rest I would app=
reciate some help
> > > > from people actually using these recipes.
> > > >=20
> > > > I'll trigger new incremental build after that huge meta-oe patch qu=
eue from master-next
> > > > is in master.
> > > >=20
> > > > ERROR: 34 issues were found in these recipes: clutter-gst-3.0 crypt=
odev-module ctdb gnome-panel jasper lcdproc libftdi mpd places pulseaudio p=
ython python3 rain rygel samba shr-e-gadgets shr-wizard snort sysdig tmux u=
ptime vboxguestdrivers xfce4-clipman-plugin
> > >=20
> > > Complete log:
> > > http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20160=
223_111019.log/
> > >=20
> > > There are many issues in current master, but as a bonus we get separa=
te
> > > build log for each issue so it's easier for any contributor to check =
his
> > > favourite recipe and send fix for it (please do).
> > >=20
> > > ERROR: 111 issues were found in these recipes:
> > > android-image-utils-native chkconfig-alternatives-native
> > > compat-wireless-all core-image-rt core-image-rt-sdk core-image-sato-d=
ev
> > > core-image-sato-sdk core-image-testmaster cryptodev-module
> > > dfu-util-native efivar ffmpeg firefox gnome-panel iksemel iscsitarget
> > > libconnman-qt5 libetpan libftdi libgdata libnice ltp-ddt netmap
> > > netmap-modules nodejs perf pidgin proxy-libintl pty-forward-native
> > > python python-feedparser python-flufl-enum python-mock python-monoton=
ic
> > > python-msgpack python-tornado-redis python-txws python-ujson python3
> > > qt4-x11-free remake samba samsung-modem-mgr samsung-rfs-mgr shr-image
> > > shr-image-all shr-lite-image snort synergy system-config-keyboard thr=
ift
> > > tracker xfce4-clipman-plugin
> >=20
> > Complete log:
> > http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.2016030=
7_041519.log/
> >=20
> > There are still almost issues reported last time
> >=20
> > ERROR: 88 issues were found in these recipes: android-image-utils-native
> > chkconfig-alternatives-native compat-wireless-all core-image-rt
> > core-image-rt-sdk core-image-sato-dev core-image-sato-sdk
> > core-image-testmaster cryptodev-module dfu-util-native efivar
> > gnome-panel iksemel iscsitarget libetpan libftdi ltp-ddt luajit netmap
> > netmap-modules nodejs perf pidgin proxy-libintl pty-forward-native
> > python python-cryptography python3 qt4-x11-free remake samba
> > samsung-modem-mgr samsung-rfs-mgr shr-image shr-image-all shr-lite-image
> > snort synergy system-config-keyboard xfce4-clipman-plugin
>=20
> Complete log:
> http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20160314_=
013628.log/
>=20
> Corresponding build for qemux86 is running now.
>=20
> Since last time I've fixed couple components:
>   android-image-utils-native
>   pty-forward-native
>   samsung-modem-mgr
>   synergy
>   system-config-keyboard
> but few new ones got broken
>   gnome-bluetooth (by introspection changes)
>   opencv (by ffmpeg upgrade)
>   umip (missing gram.h)
>=20
> WARN: python3: python3-tkinter rdepends on glibc, but it isn't a build de=
pendency?
> WARN: python3: python3-tkinter rdepends on libpython3, but it isn't a bui=
ld dependency?
> WARN: python3: python3-tkinter rdepends on tcl-lib, but it isn't a build =
dependency?
> WARN: samba: samba rdepends on libpam, but it isn't a build dependency?
> WARN: libftdi: libftdi rdepends on libgcc, but it isn't a build dependenc=
y?
> WARN: libftdi: libftdi rdepends on libstdc++, but it isn't a build depend=
ency?
> WARN: gnome-panel: gnome-panel rdepends on dbus-lib, but it isn't a build=
 dependency?
> WARN: xfce4-clipman-plugin: xfce4-clipman-plugin rdepends on qrencode, bu=
t it isn't a build dependency?
> WARN: python: python-tkinter rdepends on glibc, but it isn't a build depe=
ndency?
> WARN: python: python-tkinter rdepends on libpython2, but it isn't a build=
 dependency?
> WARN: python: python-tkinter rdepends on tcl-lib, but it isn't a build de=
pendency?
>=20
> 3_min/failed/compat-wireless-all.log
> 3_min/failed/core-image-sato-dev.log
> 3_min/failed/core-image-sato-sdk.log
> 3_min/failed/core-image-testmaster.log
> 3_min/failed/dfu-util-native.log
> 3_min/failed/efivar.log
> 3_min/failed/gnome-bluetooth.log
> 3_min/failed/ltp-ddt.log
> 3_min/failed/luajit.log
> 3_min/failed/opencv.log
> 3_min/failed/perf.log
> 3_min/failed/proxy-libintl.log
> 3_min/failed/python-cryptography.log
> 3_min/failed/samsung-rfs-mgr.log
> 3_min/failed/shr-image-all.log
> 3_min/failed/shr-image.log
> 3_min/failed/shr-lite-image.log
> 3_min/failed/umip.log
>=20
> 2_max/failed/chkconfig-alternatives-native.log
> 2_max/failed/compat-wireless-all.log
> 2_max/failed/core-image-sato-dev.log
> 2_max/failed/core-image-sato-sdk.log
> 2_max/failed/cryptodev-module.log
> 2_max/failed/dfu-util-native.log
> 2_max/failed/efivar.log
> 2_max/failed/gnome-bluetooth.log
> 2_max/failed/ltp-ddt.log
> 2_max/failed/luajit.log
> 2_max/failed/netmap-modules.log
> 2_max/failed/netmap.log
> 2_max/failed/opencv.log
> 2_max/failed/proxy-libintl.log
> 2_max/failed/python-cryptography.log
> 2_max/failed/remake.log
> 2_max/failed/shr-image-all.log
> 2_max/failed/shr-image.log
> 2_max/failed/shr-lite-image.log
> 2_max/failed/umip.log

Complete log:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20160315_06=
0937.log/

qemux86 results are almost identical, few more failures, because qemux86 is=
 compatible with more recipes

WARN: jasper: jasper-bin rdepends on libgl-mesa, but it isn't a build depen=
dency?
WARN: jasper: jasper-bin rdepends on libglu, but it isn't a build dependenc=
y?
WARN: jasper: jasper-bin rdepends on mesa-glut, but it isn't a build depend=
ency?
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

ERROR: 96 issues were found in these recipes: chkconfig-alternatives-native=
 compat-wireless-all core-image-rt core-image-rt-sdk core-image-sato-dev co=
re-image-sato-sdk core-image-testmaster cryptodev-module dfu-util-native gn=
ome-bluetooth gnome-panel grub grub-efi iksemel iscsitarget jasper libetpan=
 libftdi ltp-ddt luajit netmap netmap-modules opencv perf pidgin proxy-libi=
ntl python python-cryptography python3 qwt-e remake samba samsung-rfs-mgr s=
hr-image shr-image-all shr-lite-image snort umip vboxguestdrivers xfce4-cli=
pman-plugin

2_max/failed/chkconfig-alternatives-native.log
2_max/failed/compat-wireless-all.log
2_max/failed/core-image-rt-sdk.log
2_max/failed/core-image-rt.log
2_max/failed/core-image-sato-dev.log
2_max/failed/core-image-sato-sdk.log
2_max/failed/cryptodev-module.log
2_max/failed/dfu-util-native.log
2_max/failed/gnome-bluetooth.log
2_max/failed/grub-efi.log
2_max/failed/grub.log
2_max/failed/iksemel.log
2_max/failed/iscsitarget.log
2_max/failed/libetpan.log
2_max/failed/ltp-ddt.log
2_max/failed/luajit.log
2_max/failed/netmap-modules.log
2_max/failed/netmap.log
2_max/failed/opencv.log
2_max/failed/pidgin.log
2_max/failed/proxy-libintl.log
2_max/failed/python-cryptography.log
2_max/failed/qwt-e.log
2_max/failed/remake.log
2_max/failed/shr-image-all.log
2_max/failed/shr-image.log
2_max/failed/shr-lite-image.log
2_max/failed/snort.log
2_max/failed/umip.log
2_max/failed/vboxguestdrivers.log

3_min/failed/compat-wireless-all.log
3_min/failed/core-image-rt-sdk.log
3_min/failed/core-image-rt.log
3_min/failed/core-image-sato-dev.log
3_min/failed/core-image-sato-sdk.log
3_min/failed/core-image-testmaster.log
3_min/failed/dfu-util-native.log
3_min/failed/gnome-bluetooth.log
3_min/failed/grub-efi.log
3_min/failed/grub.log
3_min/failed/iksemel.log
3_min/failed/iscsitarget.log
3_min/failed/libetpan.log
3_min/failed/ltp-ddt.log
3_min/failed/luajit.log
3_min/failed/opencv.log
3_min/failed/perf.log
3_min/failed/pidgin.log
3_min/failed/proxy-libintl.log
3_min/failed/python-cryptography.log
3_min/failed/qwt-e.log
3_min/failed/samsung-rfs-mgr.log
3_min/failed/shr-image-all.log
3_min/failed/shr-image.log
3_min/failed/shr-lite-image.log
3_min/failed/snort.log
3_min/failed/umip.log

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbqlkIACgkQN1Ujt2V2gBzPnwCdHLgpPQixdEV7h26FpMF0uOiI
hBoAnjH9VPOEre2HZiwlHTzzlriVYv1+
=VqdD
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--
