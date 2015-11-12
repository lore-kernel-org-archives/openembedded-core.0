Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6B4D0766A3;
	Thu, 12 Nov 2015 11:42:56 +0000 (UTC)
Received: by wmww144 with SMTP id w144so84442260wmw.0;
	Thu, 12 Nov 2015 03:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=Is+QvXu/i62GcCm/A3eW5L10PgrRt3RtnGsFFcnXEjQ=;
	b=YBFRu0IPNbxL2tkQv5ZJmW90WpXNGqgW5r3zffWVn/L2vbM62vpXsVmcTy7qrxGoMj
	tPdFpoD7nVTaZgTAI4QbLpcqwGt22DjIv9UyudYzP9XkkCibxU02uyqXcOdpqSFttcka
	2F3Igw1XWGbB4K7VTwjNYVhfwCBVQUg+/yRYZzYjcTjVymY4swSkYpbdYmLj9SKWeKJI
	+RG3Bx3K8yMIi6qzrvYTb8nf5DKDRomnfDZ3uPDEHPHwr+V9QXsS+I6Jvh/8nXNP1O47
	OxM91IXNi4DhI1F5z3A60lkBZSoWdTzGUcZNXtIn24VV8w/KBB4Ud+THbvLSePma2Sj4
	JFCA==
X-Received: by 10.195.18.6 with SMTP id gi6mr14970431wjd.83.1447328576019;
	Thu, 12 Nov 2015 03:42:56 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	vr10sm14018763wjc.38.2015.11.12.03.42.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 03:42:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 12 Nov 2015 12:43:11 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20151112114311.GD2574@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: State of bitbake world, test-dependencies 2015-11-12
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
X-List-Received-Date: Thu, 12 Nov 2015 11:42:58 -0000
X-Groupsio-MsgNum: 73291
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+B+y8wtTXqdUj1xM"
Content-Disposition: inline

--+B+y8wtTXqdUj1xM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Another incremental test, only 26 recipes were tested, but it found enough
issues in just released Jethro.

Complete log:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20151111_11=
2937.log/

ERROR: 42 issues were found in these recipes: cifs-utils clutter-gst-3.0 de=
vicekit-power fbida gammu gst-plugins-good gstreamer1.0-plugins-bad gstream=
er1.0-plugins-good imsettings libsdl2 pinpoint qt-mobility-embedded qt-mobi=
lity-x11 samba sox

I'll send fix for pinpoint, gst* devicekit-power, fbida, gammu before re-tr=
iggering the testing for qemuarm.

Found differences:=20
WARN: cifs-utils: cifs-utils rdepends on samba, but it isn't a build depend=
ency?
WARN: clutter-gst-3.0: clutter-gst-3.0 rdepends on libcap, but it isn't a b=
uild dependency?
WARN: clutter-gst-3.0: clutter-gst-3.0 rdepends on libgudev, but it isn't a=
 build dependency?
WARN: clutter-gst-3.0: clutter-gst-3.0 rdepends on libudev, but it isn't a =
build dependency?
WARN: fbida: fbida rdepends on lirc, but it isn't a build dependency?
WARN: gammu: gammu rdepends on libgudev, but it isn't a build dependency?
WARN: gst-plugins-good: gst-plugins-good-meta rdepends on gst-plugins-good-=
1394, but it isn't a build dependency?
WARN: gstreamer1.0-plugins-bad: gstreamer1.0-plugins-bad-meta rdepends on g=
streamer1.0-plugins-bad-uvch264, but it isn't a build dependency?
WARN: gstreamer1.0-plugins-good: gstreamer1.0-plugins-good-video4linux2 rde=
pends on libcap, but it isn't a build dependency?
WARN: gstreamer1.0-plugins-good: gstreamer1.0-plugins-good-video4linux2 rde=
pends on libgudev, but it isn't a build dependency?
WARN: gstreamer1.0-plugins-good: gstreamer1.0-plugins-good-video4linux2 rde=
pends on libudev, but it isn't a build dependency?
WARN: gstreamer1.0-plugins-good: gstreamer1.0-plugins-good-video4linux2 rde=
pends on zlib, but it isn't a build dependency?
WARN: imsettings: imsettings rdepends on xfconf, but it isn't a build depen=
dency?
WARN: pinpoint: pinpoint rdepends on librsvg, but it isn't a build dependen=
cy?
WARN: qt-mobility-embedded: qt-mobility-embedded rdepends on glib-2.0, but =
it isn't a build dependency?
WARN: qt-mobility-embedded: qt-mobility-embedded rdepends on gstreamer, but=
 it isn't a build dependency?
WARN: qt-mobility-embedded: qt-mobility-embedded rdepends on libasound, but=
 it isn't a build dependency?
WARN: qt-mobility-embedded: qt-mobility-embedded rdepends on libgstapp-0.10=
, but it isn't a build dependency?
WARN: qt-mobility-embedded: qt-mobility-embedded rdepends on libgstvideo-0.=
10, but it isn't a build dependency?
WARN: qt-mobility-x11: qt-mobility-x11 rdepends on glib-2.0, but it isn't a=
 build dependency?
WARN: qt-mobility-x11: qt-mobility-x11 rdepends on gstreamer, but it isn't =
a build dependency?
WARN: qt-mobility-x11: qt-mobility-x11 rdepends on libasound, but it isn't =
a build dependency?
WARN: qt-mobility-x11: qt-mobility-x11 rdepends on libgstapp-0.10, but it i=
sn't a build dependency?
WARN: qt-mobility-x11: qt-mobility-x11 rdepends on libgstinterfaces-0.10, b=
ut it isn't a build dependency?
WARN: qt-mobility-x11: qt-mobility-x11 rdepends on libgstvideo-0.10, but it=
 isn't a build dependency?
WARN: qt-mobility-x11: qt-mobility-x11 rdepends on libxext, but it isn't a =
build dependency?
WARN: qt-mobility-x11: qt-mobility-x11 rdepends on libxv, but it isn't a bu=
ild dependency?
WARN: samba: samba rdepends on cyrus-sasl, but it isn't a build dependency?
WARN: samba: samba rdepends on dmapi, but it isn't a build dependency?
WARN: samba: samba rdepends on libaio, but it isn't a build dependency?
WARN: samba: samba rdepends on libbsd, but it isn't a build dependency?
WARN: samba: samba rdepends on libpam, but it isn't a build dependency?
WARN: samba: samba-python rdepends on libbsd, but it isn't a build dependen=
cy?
WARN: sox: sox rdepends on opencore-amr, but it isn't a build dependency?
Found errors:=20
ERROR: gst-plugins-good: gst-plugins-good-1394 package isn't created when b=
uilding with minimal dependencies?
ERROR: gst-plugins-good: gst-plugins-good-1394-dev package isn't created wh=
en building with minimal dependencies?
ERROR: gstreamer1.0-plugins-bad: gstreamer1.0-plugins-bad-uvch264 package i=
sn't created when building with minimal dependencies?
ERROR: gstreamer1.0-plugins-bad: gstreamer1.0-plugins-bad-uvch264-dev packa=
ge isn't created when building with minimal dependencies?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+B+y8wtTXqdUj1xM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZEe04ACgkQN1Ujt2V2gBwR0ACffn2Bp/UNWhSEcniDEYO76EPr
37AAnRAvMXvqHzMXKlKTkacgUIviNDP+
=kF+p
-----END PGP SIGNATURE-----

--+B+y8wtTXqdUj1xM--
