Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 916B277323;
	Sat, 14 Nov 2015 09:57:07 +0000 (UTC)
Received: by wmec201 with SMTP id c201so60757949wme.1;
	Sat, 14 Nov 2015 01:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=uZSbtryJsspNQz4iDtT2DxyEzcp1HBs+KjrHndmYJhg=;
	b=bjhwsqIvKzlfEJ9ZR9s94Fzjd9mtm4VgbgyY1MzcHPLQjWAlb5WSezc1fsCyfLaFCk
	G1rZkAchJA3IAfk0AK1i7kuBJ2cva9Wv2hKxeV0h6QwO4rIW8ZqaGX5cIHjaRzQGSL1+
	8JMu3Bu4fKRqYjAT1qUaC9jBgjRQvSDOPYE+fdlJMvzmlAS7xwYlb7xoPOQbYm+HbAFN
	HAg4s/l6qNCKiLgW9FN5Zl727+LtGPkCNBhqBWVvApWCK4kOdk5IiIERS04NR04YJJ+2
	/FfxVOpP+R0ECUuPmBwDV5XMCXL95FVR+RfAj5FwbFcnrnwwpyGz93TRmCoBH2wra7HM
	NLzw==
X-Received: by 10.28.127.200 with SMTP id a191mr9131445wmd.27.1447495026952;
	Sat, 14 Nov 2015 01:57:06 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	da10sm1024182wjb.22.2015.11.14.01.57.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 14 Nov 2015 01:57:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 14 Nov 2015 10:57:39 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20151114095739.GD2564@jama>
References: <20151112114311.GD2574@jama>
MIME-Version: 1.0
In-Reply-To: <20151112114311.GD2574@jama>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: State of bitbake world, test-dependencies 2015-11-12
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
X-List-Received-Date: Sat, 14 Nov 2015 09:57:08 -0000
X-Groupsio-MsgNum: 73446
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tNQTSEo8WG/FKZ8E"
Content-Disposition: inline

--tNQTSEo8WG/FKZ8E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2015 at 12:43:11PM +0100, Martin Jansa wrote:
> Another incremental test, only 26 recipes were tested, but it found enough
> issues in just released Jethro.
>=20
> Complete log:
> http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20151111_=
112937.log/
>=20
> ERROR: 42 issues were found in these recipes: cifs-utils clutter-gst-3.0 =
devicekit-power fbida gammu gst-plugins-good gstreamer1.0-plugins-bad gstre=
amer1.0-plugins-good imsettings libsdl2 pinpoint qt-mobility-embedded qt-mo=
bility-x11 samba sox
>=20
> I'll send fix for pinpoint, gst* devicekit-power, fbida, gammu before re-=
triggering the testing for qemuarm.

Complete log:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20151113_16=
2451.log/

I've added few more recipes to this test run, so the results look worse
(because of many issues from efl-libunwind, I've already sent patch for
this), but they are actually better.

ERROR: 86 issues were found in these recipes: cifs-utils efl enjoy
imsettings linux-yocto qt-mobility-embedded qt-mobility-x11 samba sox
vlc

Found differences:=20
WARN: efl: ecore rdepends on libgcc, but it isn't a build dependency?
WARN: efl: ecore rdepends on libunwind, but it isn't a build dependency?
WARN: efl: ecore-audio rdepends on libgcc, but it isn't a build dependency?
WARN: efl: ecore-audio rdepends on libunwind, but it isn't a build dependen=
cy?
WARN: efl: ecore-con rdepends on libgcc, but it isn't a build dependency?
WARN: efl: ecore-con rdepends on libunwind, but it isn't a build dependency?
WARN: efl: ecore-evas rdepends on libgcc, but it isn't a build dependency?
WARN: efl: ecore-evas rdepends on libunwind, but it isn't a build dependenc=
y?
WARN: efl: ecore-file rdepends on libgcc, but it isn't a build dependency?
WARN: efl: ecore-file rdepends on libunwind, but it isn't a build dependenc=
y?
WARN: efl: ecore-imf rdepends on libgcc, but it isn't a build dependency?
WARN: efl: ecore-imf rdepends on libunwind, but it isn't a build dependency?
WARN: efl: ecore-imf-evas rdepends on libgcc, but it isn't a build dependen=
cy?
WARN: efl: ecore-imf-evas rdepends on libunwind, but it isn't a build depen=
dency?
WARN: efl: ecore-input rdepends on libgcc, but it isn't a build dependency?
WARN: efl: ecore-input rdepends on libunwind, but it isn't a build dependen=
cy?
WARN: efl: ecore-input-evas rdepends on libgcc, but it isn't a build depend=
ency?
WARN: efl: ecore-input-evas rdepends on libunwind, but it isn't a build dep=
endency?
WARN: efl: ecore-ipc rdepends on libgcc, but it isn't a build dependency?
WARN: efl: ecore-ipc rdepends on libunwind, but it isn't a build dependency?
WARN: efl: ecore-x rdepends on libgcc, but it isn't a build dependency?
WARN: efl: ecore-x rdepends on libunwind, but it isn't a build dependency?
WARN: efl: edje rdepends on libgcc, but it isn't a build dependency?
WARN: efl: edje rdepends on libunwind, but it isn't a build dependency?
WARN: efl: eeze rdepends on libgcc, but it isn't a build dependency?
WARN: efl: eeze rdepends on libunwind, but it isn't a build dependency?
WARN: efl: efl rdepends on libgcc, but it isn't a build dependency?
WARN: efl: efl rdepends on libunwind, but it isn't a build dependency?
WARN: efl: efreet-mime rdepends on libgcc, but it isn't a build dependency?
WARN: efl: efreet-mime rdepends on libunwind, but it isn't a build dependen=
cy?
WARN: efl: efreet-trash rdepends on libgcc, but it isn't a build dependency?
WARN: efl: efreet-trash rdepends on libunwind, but it isn't a build depende=
ncy?
WARN: efl: eina rdepends on libgcc, but it isn't a build dependency?
WARN: efl: eina rdepends on libunwind, but it isn't a build dependency?
WARN: efl: eio rdepends on libgcc, but it isn't a build dependency?
WARN: efl: eio rdepends on libunwind, but it isn't a build dependency?
WARN: efl: eldbus rdepends on libgcc, but it isn't a build dependency?
WARN: efl: eldbus rdepends on libunwind, but it isn't a build dependency?
WARN: efl: embryo rdepends on libgcc, but it isn't a build dependency?
WARN: efl: embryo rdepends on libunwind, but it isn't a build dependency?
WARN: efl: emotion rdepends on libgcc, but it isn't a build dependency?
WARN: efl: emotion rdepends on libunwind, but it isn't a build dependency?
WARN: efl: eo rdepends on libgcc, but it isn't a build dependency?
WARN: efl: eo rdepends on libunwind, but it isn't a build dependency?
WARN: efl: ethumb rdepends on libgcc, but it isn't a build dependency?
WARN: efl: ethumb rdepends on libunwind, but it isn't a build dependency?
WARN: efl: evas rdepends on libunwind, but it isn't a build dependency?
WARN: efl: libeet rdepends on libgcc, but it isn't a build dependency?
WARN: efl: libeet rdepends on libunwind, but it isn't a build dependency?
WARN: efl: libefreet rdepends on libgcc, but it isn't a build dependency?
WARN: efl: libefreet rdepends on libunwind, but it isn't a build dependency?
WARN: efl: libemotion rdepends on libgcc, but it isn't a build dependency?
WARN: efl: libemotion rdepends on libunwind, but it isn't a build dependenc=
y?
WARN: imsettings: imsettings rdepends on xfconf, but it isn't a build depen=
dency?
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
WARN: samba: samba rdepends on libbsd, but it isn't a build dependency?
WARN: samba: samba rdepends on libpam, but it isn't a build dependency?
WARN: samba: samba-python rdepends on libbsd, but it isn't a build dependen=
cy?
WARN: sox: sox rdepends on opencore-amr, but it isn't a build dependency?
WARN: vlc: vlc rdepends on libavc1394, but it isn't a build dependency?
WARN: vlc: vlc rdepends on libcroco, but it isn't a build dependency?
WARN: vlc: vlc rdepends on libcrypto, but it isn't a build dependency?
WARN: vlc: vlc rdepends on libdvdnav, but it isn't a build dependency?
WARN: vlc: vlc rdepends on librsvg, but it isn't a build dependency?
WARN: vlc: vlc rdepends on libssh2, but it isn't a build dependency?
WARN: vlc: vlc rdepends on libssl, but it isn't a build dependency?
WARN: vlc: vlc rdepends on libupnp, but it isn't a build dependency?
WARN: vlc: vlc rdepends on libvorbis, but it isn't a build dependency?
WARN: vlc: vlc rdepends on libxml2, but it isn't a build dependency?

There is also:
qt-mobility-embedded-1.2.0: qt-mobility-embedded: invalid PACKAGECONFIG: bl=
uez5 [invalid-packageconfig]
qt-mobility-x11-1.2.0: qt-mobility-x11: invalid PACKAGECONFIG: bluez5 [inva=
lid-packageconfig]

tracker-0.14.2: /usr/lib/nautilus/extensions-2.0/libnautilus-tracker-tags.s=
o_tracker-nautilus-extension contained in package tracker-nautilus-extensio=
n requires libnautilus-extension.so.1, but no providers found in its RDEPEN=
DS [file-rdeps]

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tNQTSEo8WG/FKZ8E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZHBZIACgkQN1Ujt2V2gBzYVwCghaeFg6qo2euwkffCcUbfNxG2
gSoAn1e1YR2SkS1PaEtCAH410gVNeLsL
=1baH
-----END PGP SIGNATURE-----

--tNQTSEo8WG/FKZ8E--
