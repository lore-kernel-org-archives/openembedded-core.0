Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id A4AF765EEF;
	Mon, 28 Jul 2014 10:42:25 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id x48so7275154wes.33
	for <multiple recipients>; Mon, 28 Jul 2014 03:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=QotyzI2zNP5wvF4MQ+mB2PXubXPHWxC2Bw3bm536jn0=;
	b=kCZ++oKoxPptyJBQ0eRW8noDzsqb5BpJ91+TFMCc4SojwhTPl0aFNG/XusR4G6Hl13
	C+5pugiufBtCKR1ImYMYurc8GyBOFnf/wFK6lfUOYMp7Fq6JswBZQwy0yS0e1fwBj9m0
	DxXbUFu9sUI+IHUmbLWuL4lYxcT+obOnow5sjGYDaxCHdzofJKBRXRBlozUKs+LJSBI3
	HEp+EFr7SQy76kNwNUEDUwrGpwyi8hZH9ABER8yBDrfg0PaecJJY4kZANtiTcwb6tN2C
	BWCg2KuxMXHKkCjgQMItE67XwXoJMTzz2pV/pxz0cQ02b6qCqUB8ewwy1ivAOJjc5kJR
	VOKA==
X-Received: by 10.194.87.97 with SMTP id w1mr48361560wjz.42.1406544146460;
	Mon, 28 Jul 2014 03:42:26 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	r1sm28752090wia.21.2014.07.28.03.42.25 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jul 2014 03:42:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 28 Jul 2014 12:42:47 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140728104247.GC16445@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, Failed tasks 2014-07-28
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
X-List-Received-Date: Mon, 28 Jul 2014 10:42:28 -0000
X-Groupsio-MsgNum: 55637
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vv4Sf/kQfcwinyKX"
Content-Disposition: inline

--vv4Sf/kQfcwinyKX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

http://www.openembedded.org/wiki/Bitbake_World_Status

This time it was building without any sstate-cache, so we have complete qa.=
log files
(they are included in log dir)

Here are some stats:
$ cat log.world.2014072*/qa.log | sort -u | grep -c 'build-deps'
166
$ cat log.world.2014072*/qa.log | sort -u | grep -c 'textrel'
18
$ cat log.world.2014072*/qa.log | sort -u | grep -c 'unknown-configure-opti=
on'
21
$ cat log.world.2014072*/qa.log | sort -u | grep -c 'already-stripped'
4
$ cat log.world.2014072*/qa.log | sort -u | grep -c 'version-going-backward=
s'
23

=3D=3D Failed tasks 2014-07-28 =3D=3D

=3D=3D=3D common (2) =3D=3D=3D
    * meta-openembedded/meta-multimedia/recipes-multimedia/openal/openal-so=
ft_1.15.1.bb, do_compile
    * openembedded-core/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.1=
3.bb, do_compile

=3D=3D=3D common-x86 (3) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium_35.0.1916.114.bb, do_c=
ompile
    * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
    * meta-openembedded/meta-oe/recipes-devtools/concurrencykit/concurrency=
kit_git.bb, do_compile

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb, do_compile

=3D=3D=3D Number of failed tasks =3D=3D=3D
{| class=3Dwikitable
|-
||qemuarm       ||2     ||http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20140725_170016.log/||http://errors.yoctoproject.org:80/Errors/Sea=
rch/1/1474/
|-
||qemux86       ||5     ||http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20140726_131244.log/||
|-
||qemux86_64    ||6     ||http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20140727_084254.log/||
|}

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vv4Sf/kQfcwinyKX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPWKScACgkQN1Ujt2V2gBwRPgCfeOBmUrgzRbXK4K5vwBc0ja/L
PaUAn0KrcDIDmHIjgl6ynfim/P7hAN/O
=rqSN
-----END PGP SIGNATURE-----

--vv4Sf/kQfcwinyKX--
