Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id D177B65C9F;
	Thu, 11 Dec 2014 09:23:28 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id r20so802137wiv.0;
	Thu, 11 Dec 2014 01:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=rtWX5moOjfODPEOSrdwOUI5JBGuGQCQSyS1ml5jqTJE=;
	b=Nzg0GQSjJkzzhteAA+1I5+WI5DhxF4OR6NFBaxoGIS21tav7lbL70rMS54Uc4l9YbD
	v9BHWbAVBozd+WpkHWumwPq6tF7uqyZjfY/Y52IUKJ7oa8EwfQYAWy3QtLL4dMddkqmP
	YWYFbq/ddIh3SkCnXXZmGhgfPkX0bzxgcblsLeYFsjvNYbuNK2KNPVAJwpfOidSKc7rT
	/6LFq/dUherwPghWz7wjSao9syjPozTZEJL/v+AJM9Jknqv0EvKrQBFgN9GqpMFFUxfs
	yunK/Fx2MmQsx36IjVKuLAi3fAvKC+BShS2nzv15eo9ysGvgZ/61Zr5EsYRjxxCSX9ew
	P2qw==
X-Received: by 10.180.109.46 with SMTP id hp14mr14232132wib.54.1418289809157; 
	Thu, 11 Dec 2014 01:23:29 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	mw7sm1534290wib.14.2014.12.11.01.23.28 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Dec 2014 01:23:28 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 11 Dec 2014 10:23:32 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20141211092332.GA2467@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, test-dependencies 2014-12-11
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
X-List-Received-Date: Thu, 11 Dec 2014 09:23:30 -0000
X-Groupsio-MsgNum: 60429
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Content-Disposition: inline

--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 09, 2014 at 11:01:10AM +0200, Martin Jansa wrote:
> Complete logs:
> http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20140808_=
063907.log/
>=20
> ERROR: 483 issues were found in these recipes: directfb engrave epiphany =
expedite gd gmtk gnome-disk-utility gst-ffmpeg guile leptonica libarchive l=
ibmicrohttpd libmikmod libungif libwebp libwmf mariadb midori mpd mpeg2dec =
mpg123 openal-soft opendataplane oscam piglit protobuf snort sox stunnel sy=
nergy tesseract tracker

Complete logs;
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20141210_16=
2427.log/

This was only partial build, so the results don't look so bad.
ERROR: 27 issues were found in these recipes: android-audiosystem
collectd fbida gnome-bluetooth gst-plugins-bad mongodb opencv
polkit-gnome qtbase tcpdump udisks xbmc xfce4-vala

Found differences:=20
WARN: collectd: collectd rdepends on libcrypto, but it isn't a build depend=
ency?
WARN: collectd: collectd rdepends on libesmtp, but it isn't a build depende=
ncy?
WARN: collectd: collectd rdepends on libssl, but it isn't a build dependenc=
y?
WARN: fbida: fbida rdepends on libwebp, but it isn't a build dependency?
WARN: gst-plugins-bad: gst-plugins-bad-meta rdepends on gst-plugins-bad-rtm=
p, but it isn't a build dependency?
WARN: opencv: libopencv-highgui rdepends on jasper, but it isn't a build de=
pendency?
WARN: opencv: libopencv-highgui rdepends on libdc1394, but it isn't a build=
 dependency?
WARN: qtbase: qtbase-plugins rdepends on cups-lib, but it isn't a build dep=
endency?
WARN: tcpdump: tcpdump rdepends on libsmi, but it isn't a build dependency?
WARN: udisks: udisks rdepends on lvm2, but it isn't a build dependency?

Found errors:=20
ERROR: gst-plugins-bad: gst-plugins-bad-rtmp package isn't created when bui=
lding with minimal dependencies?
ERROR: gst-plugins-bad: gst-plugins-bad-rtmp-dev package isn't created when=
 building with minimal dependencies?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSJYpQACgkQN1Ujt2V2gBy8vACguv8gJU7R9VXp18A1LR4WJwt3
tdIAnAk6OosQQhWUOIeRd350563Ict0v
=Zo46
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--
