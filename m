Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8A0106FF73;
	Mon, 14 Dec 2015 19:01:45 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id p66so76836409wmp.1;
	Mon, 14 Dec 2015 11:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=AXUeFjRt6eehEFOtPBtkkodqFqYpZQM2SYeL+RmbwQI=;
	b=YchchgKaif1gWI5AS+IblitrrpLZjSaeH8FhFkLAQdxCfcxl0gXFdlcXYS/uxLWGAi
	G+8JJ1Cc4SZe4Fe/BQ15ZOJfXqAkfc+m7A7g+jofBxMQNbI6lK9oEXh3W5nss8jiNElU
	heTVxERn9cZxI5AD6j+/L0o+1k61r0OaZ71NC0qo8rEHueMa8yZ0Y5EprabxNKIkzmDW
	7SttIU110SO25ALDZPcecW8zAUTinN/qroGNcTB6a+9saOFGDP7q0L/d92E9/SIbjAkZ
	CuXACDC8+9T+EkQimi/KSs5ZEPhG9ggtx8NvVDsQ/pAAtwTzx3Oy3QOFUd8jVldZkkUm
	c0Ig==
X-Received: by 10.28.88.5 with SMTP id m5mr27137468wmb.54.1450119706276;
	Mon, 14 Dec 2015 11:01:46 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	u205sm17370170wmb.12.2015.12.14.11.01.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Dec 2015 11:01:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 14 Dec 2015 20:03:47 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20151214190347.GB2212@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: State of bitbake world, test-dependencies 2015-11-19
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
X-List-Received-Date: Mon, 14 Dec 2015 19:01:49 -0000
X-Groupsio-MsgNum: 74741
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WhfpMioaduB5tiZL"
Content-Disposition: inline

--WhfpMioaduB5tiZL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This time full build (testing all recipes available in "my world" - 2503
recipes), it took record-breaking 25days to finish.

Complete log:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20151120_14=
4802.log/
=20
I've already sent patches for few of them, will send one for pulseaudio-lir=
c as well
as I already have it in out local recipes. For the rest I would appreciate =
some help
=66rom people actually using these recipes.

I'll trigger new incremental build after that huge meta-oe patch queue from=
 master-next
is in master.

ERROR: 34 issues were found in these recipes: clutter-gst-3.0 cryptodev-mod=
ule ctdb gnome-panel jasper lcdproc libftdi mpd places pulseaudio python py=
thon3 rain rygel samba shr-e-gadgets shr-wizard snort sysdig tmux uptime vb=
oxguestdrivers xfce4-clipman-plugin

Found differences:
WARN: clutter-gst-3.0: clutter-gst-3.0 rdepends on libcap, but it isn't a b=
uild dependency?
WARN: clutter-gst-3.0: clutter-gst-3.0 rdepends on libgudev, but it isn't a=
 build dependency?
WARN: clutter-gst-3.0: clutter-gst-3.0 rdepends on libudev, but it isn't a =
build dependency?
WARN: ctdb: ctdb rdepends on libtdb, but it isn't a build dependency?
WARN: gnome-panel: gnome-panel rdepends on dbus-lib, but it isn't a build d=
ependency?
WARN: jasper: jasper-bin rdepends on libgl-mesa, but it isn't a build depen=
dency?
WARN: jasper: jasper-bin rdepends on libglu, but it isn't a build dependenc=
y?
WARN: jasper: jasper-bin rdepends on mesa-glut, but it isn't a build depend=
ency?
WARN: libftdi: libftdi rdepends on libgcc, but it isn't a build dependency?
WARN: libftdi: libftdi rdepends on libstdc++, but it isn't a build dependen=
cy?
WARN: mpd: mpd rdepends on libupnp, but it isn't a build dependency?
WARN: places: places rdepends on luajit, but it isn't a build dependency?
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
WARN: rain: rain rdepends on luajit, but it isn't a build dependency?
WARN: rygel: rygel-plugin-media-export rdepends on libunistring, but it isn=
't a build dependency?
WARN: samba: samba rdepends on libpam, but it isn't a build dependency?
WARN: shr-e-gadgets: shr-e-gadgets rdepends on luajit, but it isn't a build=
 dependency?
WARN: shr-wizard: shr-wizard rdepends on luajit, but it isn't a build depen=
dency?
WARN: snort: snort rdepends on liblzma, but it isn't a build dependency?
WARN: sysdig: sysdig rdepends on luajit, but it isn't a build dependency?
WARN: tmux: tmux rdepends on libutempter, but it isn't a build dependency?
WARN: uptime: uptime rdepends on luajit, but it isn't a build dependency?
WARN: xfce4-clipman-plugin: xfce4-clipman-plugin rdepends on qrencode, but =
it isn't a build dependency?
WARN: cryptodev-module: kernel-module-cryptodev rdepends on kernel-3.19.5-y=
octo-tiny, but it isn't a build dependency?
WARN: vboxguestdrivers: kernel-module-vboxguest rdepends on kernel-3.19.5-y=
octo-tiny, but it isn't a build dependency?
WARN: vboxguestdrivers: kernel-module-vboxsf rdepends on kernel-3.19.5-yoct=
o-tiny, but it isn't a build dependency?
WARN: vboxguestdrivers: kernel-module-vboxvideo rdepends on kernel-3.19.5-y=
octo-tiny, but it isn't a build dependency?
Found errors:
ERROR: lcdproc: lcdd-driver-lirc package isn't created when building with m=
inimal dependencies?
ERROR: pulseaudio: pulseaudio-module-lirc package isn't created when buildi=
ng with minimal dependencies?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WhfpMioaduB5tiZL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZvEpIACgkQN1Ujt2V2gBwnYwCfU1Qa/0GeqC5Ha87B9/kv14br
i4MAniqPPNItTrusOVne5fL3qIv/yfHl
=SLwE
-----END PGP SIGNATURE-----

--WhfpMioaduB5tiZL--
