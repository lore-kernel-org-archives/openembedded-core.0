Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8A7BE6B2BC;
	Fri,  3 Jan 2014 10:44:04 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b57so6566810eek.26
	for <multiple recipients>; Fri, 03 Jan 2014 02:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=zTUUK9ck78Ow2z0n+EH19KB+NE3b1s62IWLr09aifAk=;
	b=Ujqt1y+b31e96vsaQk/DhpzAGp77M4d5mNK1acdD6hX5ecJTc87NR5AD3gTv0t9+Et
	UBANUfqAlA6/LrPs3wMVgOzIclbES2kOW7ZY0pgZpkVSQRJgNa2Qukm7ZgjvZW5eyXkB
	uq9hzGNhUUTb0sVLqhrZqJEa7WL9y8sDRxWiTt12OqOp1YqynrbwPv33dj63jFQc4d4D
	auBa+W0MKJXf1OSR7NCEjC35Wcdv1MGzVOIlEK4itrEj470o1q26fHH5NjW13AjZ2mTF
	hSlDBznbb540ePUlMRrL3gPdWaJAU+d4SMM4Y1aToCo6d5vSRrESPyG5lBu9XlaDA3My
	pd0A==
X-Received: by 10.14.110.134 with SMTP id u6mr1572636eeg.87.1388745845305;
	Fri, 03 Jan 2014 02:44:05 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	g47sm143821335eeo.19.2014.01.03.02.44.04 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Jan 2014 02:44:04 -0800 (PST)
Date: Fri, 3 Jan 2014 11:44:08 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140103104408.GC3707@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: State of bitbake world, Failed tasks 2014-01-03
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
X-List-Received-Date: Fri, 03 Jan 2014 10:44:06 -0000
X-Groupsio-MsgNum: 48578
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WplhKdTI2c8ulnbP"
Content-Disposition: inline

--WplhKdTI2c8ulnbP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

With git branches and breakage from freetype upgrade fixed we're back to more
common list of issues.

ajenti will probably be removed from meta-weboserver
webkit-efl is broken because of freetype upgrade, I'm working on efl upgrade to 1.8.*
so I'll probably fix it later together with efl upgrade.

http://www.openembedded.org/wiki/Bitbake_World_Status

== Failed tasks Fri Jan  3 10:39:04 UTC 2014 ==

=== common (10) ===
    * meta-openembedded/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb, do_configure
    * meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb, do_fetch
    * meta-openembedded/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb, do_compile
    * meta-openembedded/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb, do_compile
    * meta-openembedded/meta-oe/recipes-core/libxml/libxml++_2.35.3.bb, do_compile
    * meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_compile
    * meta-openembedded/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb, do_configure
    * meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb, do_compile
    * meta-openembedded/meta-webserver/recipes-webadmin/ajenti/ajenti_git.bb, do_fetch
    * meta-qt5/recipes-qt/qt5/qtwayland_git.bb, do_compile

=== common-x86 (4) ===
    * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
    * meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compile
    * meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configure
    * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package

=== qemuarm (0) ===

=== qemux86 (1) ===
    * meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.14.bb, do_compile

=== qemux86_64 (3) ===
    * meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb, do_fetch
    * meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb, do_configure
    * meta-openembedded/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb, do_compile

=== Number of failed tasks ===
{| class=wikitable
|-
||qemuarm       ||10    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.world.20140102_115856.log/
|-
||qemux86       ||15    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.world.20140102_160608.log/
|-
||qemux86_64    ||17    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.world.20140102_200840.log/
|}

--WplhKdTI2c8ulnbP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEUEARECAAYFAlLGlHgACgkQN1Ujt2V2gBzX8gCdE8LWA2A2jaeRdrOYmZpkp0TX
KSsAliz+Q8YjUV91wcpcxv0zUhHS+XI=
=Qxd+
-----END PGP SIGNATURE-----

--WplhKdTI2c8ulnbP--
