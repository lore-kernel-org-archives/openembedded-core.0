Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 65826601F6;
	Thu, 10 Mar 2016 10:31:58 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id n186so23458259wmn.1;
	Thu, 10 Mar 2016 02:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=9OTFbXbRKWyTUR/KO9y71VkyPika5PCL8NqvkdT7Skk=;
	b=SXv0au5rNKa23fDA9E7OKst2jMOXfxkT9lwsioTEijuhvQO5DFyiH4GYPdExRkK2+W
	0VX4+tCppj13DKLhIqaEe/4guFhPbqEFCix+im9E+aJyIbSmnox9E2RM4A9c+Q7JUI4q
	WhwV97Le9Sxt/1Q7LeKUxErcU2z6on+XhpalX0Fih2jTklubAxufbEHHvRvAnqZ9x5lu
	K1ekGG215S5sukbLwf7a6EJBvPhJApisZLpC1FG1swqCaJjoh6W1vxfhDajTYGGMMKlz
	431JgDQ4n8IAEVinRX8rpCFN+hXU3KVaoJXZMvphvTISMPx3X01CdkKx19tXHzD5zyIt
	YpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=9OTFbXbRKWyTUR/KO9y71VkyPika5PCL8NqvkdT7Skk=;
	b=JCwpicmvaCgR0a0VD22r77qm3zuwmv+YVIPtQLgOWF/mQx9HfbzK4ufPd93fiUPie2
	9G8PZH9bnmpjHXLSOS2fJSiuJQ6HRoSyKZgtAlL5KBQCTHmra0RnB4B+YEh52TkrcXA6
	o6MT7KET+qiJDUIttE+gaQpjYb7m5yxm4RnhbAMjp2GGwtr7dheVRUo+A4mVy+5cfW4B
	MCe1oKyFFIh+TJMFnnVzQ1DMG5LXbzAV2/qYRy4g69TPonIidvYhpOVB7GPbzKaSvjjW
	/cwE7wd1UlFXCptSNIV5nSXRyoCBgMSI6aghDe1P/GqWj3KMI+dQZjkDKexzz4SdRoX0
	gFvA==
X-Gm-Message-State: AD7BkJIPH/EyHmgAVhhaK3XtKH9cUZEr92C83RxMwn+ve6SycpAWCnM5Ty8D3bL5KGR3zA==
X-Received: by 10.194.191.4 with SMTP id gu4mr2760844wjc.93.1457605919083;
	Thu, 10 Mar 2016 02:31:59 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	j10sm2798059wjb.46.2016.03.10.02.31.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Mar 2016 02:31:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 10 Mar 2016 11:34:56 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20160310103456.GA2573@jama>
References: <20160224132051.GA2560@jama>
MIME-Version: 1.0
In-Reply-To: <20160224132051.GA2560@jama>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: State of bitbake world, test-dependencies 2016-02-24
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
X-List-Received-Date: Thu, 10 Mar 2016 10:32:00 -0000
X-Groupsio-MsgNum: 79400
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Content-Disposition: inline

--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2016 at 02:20:51PM +0100, Martin Jansa wrote:
> On Mon, Dec 14, 2015 at 08:03:47PM +0100, Martin Jansa wrote:
> > This time full build (testing all recipes available in "my world" - 2503
> > recipes), it took record-breaking 25days to finish.
> >=20
> > Complete log:
> > http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.2015112=
0_144802.log/
> > =20
> > I've already sent patches for few of them, will send one for pulseaudio=
-lirc as well
> > as I already have it in out local recipes. For the rest I would appreci=
ate some help
> > from people actually using these recipes.
> >=20
> > I'll trigger new incremental build after that huge meta-oe patch queue =
=66rom master-next
> > is in master.
> >=20
> > ERROR: 34 issues were found in these recipes: clutter-gst-3.0 cryptodev=
-module ctdb gnome-panel jasper lcdproc libftdi mpd places pulseaudio pytho=
n python3 rain rygel samba shr-e-gadgets shr-wizard snort sysdig tmux uptim=
e vboxguestdrivers xfce4-clipman-plugin
>=20
> Complete log:
> http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20160223_=
111019.log/
>=20
> There are many issues in current master, but as a bonus we get separate
> build log for each issue so it's easier for any contributor to check his
> favourite recipe and send fix for it (please do).
>=20
> ERROR: 111 issues were found in these recipes:
> android-image-utils-native chkconfig-alternatives-native
> compat-wireless-all core-image-rt core-image-rt-sdk core-image-sato-dev
> core-image-sato-sdk core-image-testmaster cryptodev-module
> dfu-util-native efivar ffmpeg firefox gnome-panel iksemel iscsitarget
> libconnman-qt5 libetpan libftdi libgdata libnice ltp-ddt netmap
> netmap-modules nodejs perf pidgin proxy-libintl pty-forward-native
> python python-feedparser python-flufl-enum python-mock python-monotonic
> python-msgpack python-tornado-redis python-txws python-ujson python3
> qt4-x11-free remake samba samsung-modem-mgr samsung-rfs-mgr shr-image
> shr-image-all shr-lite-image snort synergy system-config-keyboard thrift
> tracker xfce4-clipman-plugin

Complete log:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20160307_04=
1519.log/

There are still almost issues reported last time

ERROR: 88 issues were found in these recipes: android-image-utils-native
chkconfig-alternatives-native compat-wireless-all core-image-rt
core-image-rt-sdk core-image-sato-dev core-image-sato-sdk
core-image-testmaster cryptodev-module dfu-util-native efivar
gnome-panel iksemel iscsitarget libetpan libftdi ltp-ddt luajit netmap
netmap-modules nodejs perf pidgin proxy-libintl pty-forward-native
python python-cryptography python3 qt4-x11-free remake samba
samsung-modem-mgr samsung-rfs-mgr shr-image shr-image-all shr-lite-image
snort synergy system-config-keyboard xfce4-clipman-plugin

Found differences:=20
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

http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20160307_04=
1519.log/3_min/failed/
android-image-utils-native.log  core-image-sato-sdk.log    iscsitarget.log =
 perf.log                 qt4-x11-free.log       shr-lite-image.log
compat-wireless-all.log         core-image-testmaster.log  libetpan.log    =
 pidgin.log               samsung-modem-mgr.log  snort.log
core-image-rt.log               dfu-util-native.log        ltp-ddt.log     =
 proxy-libintl.log        samsung-rfs-mgr.log    synergy.log
core-image-rt-sdk.log           efivar.log                 luajit.log      =
 pty-forward-native.log   shr-image-all.log      system-config-keyboard.log
core-image-sato-dev.log         iksemel.log                nodejs.log      =
 python-cryptography.log  shr-image.log

http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20160307_04=
1519.log/2_max/failed/
chkconfig-alternatives-native.log  core-image-sato-sdk.log  iscsitarget.log=
  netmap-modules.log      python-cryptography.log  shr-image-all.log
compat-wireless-all.log            cryptodev-module.log     libetpan.log   =
  nodejs.log              qt4-x11-free.log         shr-image.log
core-image-rt.log                  dfu-util-native.log      ltp-ddt.log    =
  pidgin.log              remake.log               shr-lite-image.log
core-image-rt-sdk.log              efivar.log               luajit.log     =
  proxy-libintl.log       samsung-modem-mgr.log    snort.log
core-image-sato-dev.log            iksemel.log              netmap.log     =
  pty-forward-native.log  samsung-rfs-mgr.log

I've a fix for android-image-utils-native samsung-modem-mgr samsung-rfs-mgr=
 dfu-util-native pty-forward-native
and will exclude already blacklisted recipes from next build.

Regards,

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbhSRQACgkQN1Ujt2V2gByErgCfRGm7hBKLg0TkBuhqf0n9oztf
+l8AnA4vkqkye0IJz3bzB1XUCJqKu49G
=6umV
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--
