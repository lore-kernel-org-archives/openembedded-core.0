Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 50BDF7029E;
	Wed, 16 Jul 2014 13:04:59 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id x48so906476wes.33
	for <multiple recipients>; Wed, 16 Jul 2014 06:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=ya/ZkydT49revPLE+8gN7cD3LTfmJwGesr6UcBF6hRs=;
	b=VhZ+8F04cibohbiK7fH18yiho3Yjdn9uX3BEHHkIrsLKjKq0pOKmOuzHVrsKSJREDw
	IARqggZ4MNcKb3+DOZyMYsFAxr89nwq4xRLIsDPOr4CbvRx2D7TLiLBlSrNI+uDrcSaa
	obu/v4iqyb0EsN0mppPzrLSrTYF6O7SqvfszAqxxr4yjkXeEBO+BSqvlsCEUcijWis9i
	uBjT+gwZ0igZqX/VRmDmz+Vl9FEnyWex3Aim5pV//5cuw0QKekzfES4UaTdQg0AUHR9Y
	t260dByoG0mxaTj9Zfi/RcsroXDuV7kGAc/m3bz5uyGF2dSwS7yEU9+PSRh9SkZxD+29
	eUSA==
X-Received: by 10.180.85.101 with SMTP id g5mr13490212wiz.51.1405515900580;
	Wed, 16 Jul 2014 06:05:00 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w10sm8813381wie.22.2014.07.16.06.04.59 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jul 2014 06:04:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 16 Jul 2014 15:05:03 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140716130503.GW2433@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, test-dependencies 2014-06-27
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
X-List-Received-Date: Wed, 16 Jul 2014 13:05:01 -0000
X-Groupsio-MsgNum: 55055
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/T7Ys/vy2qfZwzBO"
Content-Disposition: inline

--/T7Ys/vy2qfZwzBO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This was incremental build.

I've sent fix for xfconf which was causing many issues, but there is
still too many of them.

Complete logs:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20140714_13=
0534.log/

ERROR: 208 issues were found in these recipes: atd-over-fso
aurora-daemon clutter-box2d daemonize ecore efl exo farsight2 fbgrab
ffalarms firefox flite-alsa fltk frameworkd fso-gpsd gdal gst-ffmpeg
gwaterpas hexedit hplip lcdproc libgnomeprint libhugetlbfs libhybris
libnice liboauth libotr libxfce4ui lksctp-tools llvm3 lttng-modules
mcnavi mkvtoolnix mokomaze monkey numptyphysics openal-soft orage orrery
osmocon owfs packagegroup-shr packagegroup-shr-feed
packagegroup-shr-minimal packagegroup-xfce-base
packagegroup-xfce-multimedia phonefsod pidgin pidgin-otr python-cython
python-phoneutils python-pyrtc python-pyyaml rtorrent sensmon
shr-settings shr-wizard smbnetfs snort subsurface thunar
thunar-archive-plugin thunar-media-tags-plugin thunar-volman tsmd
usbpath vagalume valacompass vlc webmin wvdial wvstreams xfce4-appfinder
xfce4-battery-plugin xfce4-clipman-plugin xfce4-closebutton-plugin
xfce4-cpufreq-plugin xfce4-cpugraph-plugin xfce4-datetime-plugin
xfce4-diskperf-plugin xfce4-embed-plugin xfce4-equake-plugin
xfce4-eyes-plugin xfce4-fsguard-plugin xfce4-genmon-plugin xfce4-mixer
xfce4-mount-plugin xfce4-mpc-plugin xfce4-netload-plugin
xfce4-notes-plugin xfce4-notifyd xfce4-panel xfce4-places-plugin
xfce4-screenshooter xfce4-session xfce4-settings xfce4-systemload-plugin
xfce4-terminal xfce4-time-out-plugin xfce4-vala xfce4-wavelan-plugin
xfce4-weather-plugin xfce4-xkb-plugin xfconf xfdesktop xfmpc xfwm4 xwd
zeroc-ice zhone
INFO: Output written in: test-dependencies/1405343134

As bonus there is separate log file for each failing recipe, see
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20140714_13=
0534.log/3_min/failed/
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20140714_13=
0534.log/2_max/failed/

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/T7Ys/vy2qfZwzBO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPGeH8ACgkQN1Ujt2V2gBwK4ACgjZMH4zUsgmjHPCtHnDfIDY+u
JB0AnihaLrL82tyxLfU8FqE1VkxbPc/+
=uVOe
-----END PGP SIGNATURE-----

--/T7Ys/vy2qfZwzBO--
