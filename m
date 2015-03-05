Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 15F017388F;
	Thu,  5 Mar 2015 21:22:07 +0000 (UTC)
Received: by wggy19 with SMTP id y19so56059081wgg.13;
	Thu, 05 Mar 2015 13:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0hssuX8HJzxd0fJPf+nxUm3m3QHv9R8I/0Y9ykxXm50=;
	b=VWA4jjhiASevHuQOGKjc8EdrY1cnyuEOd9iaxEJ6sv+Lq4AzPDyT0nWBubXxcVgmoT
	R/2xmRQbnYHn4hi5QBkBsMS5nDkb+O98dZicgNpVgLMsTajWQPZIEN7335gkosNJtJgv
	INB4ZEIKPTVLNnRBguFCq3FAdMLwuD4bg99K5nUbFOf7v7/J4fuezwncXPru1YQeizJT
	2uSaQV9IFHbtGGZWOWo6sQVRbb1bEMmKIlb34wxeYRMKIUZzD3dSOb+uly31MbfVQsgA
	Va55bRXcI1lPWV8/1PaUiDrlML+gYNLW9KSgnk5Cj1h5aSAtZUFbP/yiBDcjEiu1vLZN
	9V9g==
X-Received: by 10.194.175.164 with SMTP id cb4mr2168068wjc.14.1425590528364;
	Thu, 05 Mar 2015 13:22:08 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	e18sm12151923wjz.27.2015.03.05.13.22.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Mar 2015 13:22:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 5 Mar 2015 22:22:12 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20150305212212.GZ2337@jama>
References: <20141211092332.GA2467@jama>
MIME-Version: 1.0
In-Reply-To: <20141211092332.GA2467@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, test-dependencies 2015-03-05
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
X-List-Received-Date: Thu, 05 Mar 2015 21:22:08 -0000
X-Groupsio-MsgNum: 63022
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MziYxCZO8WOaTd4I"
Content-Disposition: inline

--MziYxCZO8WOaTd4I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2014 at 10:23:32AM +0100, Martin Jansa wrote:
> On Sat, Aug 09, 2014 at 11:01:10AM +0200, Martin Jansa wrote:
> > Complete logs:
> > http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.2014080=
8_063907.log/
> >=20
> > ERROR: 483 issues were found in these recipes: directfb engrave epiphan=
y expedite gd gmtk gnome-disk-utility gst-ffmpeg guile leptonica libarchive=
 libmicrohttpd libmikmod libungif libwebp libwmf mariadb midori mpd mpeg2de=
c mpg123 openal-soft opendataplane oscam piglit protobuf snort sox stunnel =
synergy tesseract tracker
>=20
> Complete logs;
> http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20141210_=
162427.log/
>=20
> This was only partial build, so the results don't look so bad.
> ERROR: 27 issues were found in these recipes: android-audiosystem
> collectd fbida gnome-bluetooth gst-plugins-bad mongodb opencv
> polkit-gnome qtbase tcpdump udisks xbmc xfce4-vala
>=20
> Found differences:=20
> WARN: collectd: collectd rdepends on libcrypto, but it isn't a build depe=
ndency?
> WARN: collectd: collectd rdepends on libesmtp, but it isn't a build depen=
dency?
> WARN: collectd: collectd rdepends on libssl, but it isn't a build depende=
ncy?
> WARN: fbida: fbida rdepends on libwebp, but it isn't a build dependency?
> WARN: gst-plugins-bad: gst-plugins-bad-meta rdepends on gst-plugins-bad-r=
tmp, but it isn't a build dependency?
> WARN: opencv: libopencv-highgui rdepends on jasper, but it isn't a build =
dependency?
> WARN: opencv: libopencv-highgui rdepends on libdc1394, but it isn't a bui=
ld dependency?
> WARN: qtbase: qtbase-plugins rdepends on cups-lib, but it isn't a build d=
ependency?
> WARN: tcpdump: tcpdump rdepends on libsmi, but it isn't a build dependenc=
y?
> WARN: udisks: udisks rdepends on lvm2, but it isn't a build dependency?
>=20
> Found errors:=20
> ERROR: gst-plugins-bad: gst-plugins-bad-rtmp package isn't created when b=
uilding with minimal dependencies?
> ERROR: gst-plugins-bad: gst-plugins-bad-rtmp-dev package isn't created wh=
en building with minimal dependencies?

I've another partial build which basically confirmed that some of these
issues are still there.

Found differences:=20
WARN: fbida: fbida rdepends on libwebp, but it isn't a build dependency?
WARN: fbida: fbida rdepends on lirc, but it isn't a build dependency?
WARN: qt5-creator: qt5-creator rdepends on qt-creator, but it isn't a build=
 dependency?
WARN: tcpdump: tcpdump rdepends on libsmi, but it isn't a build dependency?
WARN: udisks: udisks rdepends on lvm2, but it isn't a build dependency?

Logs weren't uploaded this time, because we've run out of space on
logs.nslu2-linux.org/buildlogs/

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MziYxCZO8WOaTd4I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT4yQQACgkQN1Ujt2V2gBx0VQCbB4379xlYcLbYIL5rfr7zZOgH
bwgAoIl+rT6Sxq8NdWJwHXizH3aJ0ouZ
=1ESb
-----END PGP SIGNATURE-----

--MziYxCZO8WOaTd4I--
