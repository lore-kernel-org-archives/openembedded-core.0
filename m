Return-Path: <martin.jansa@gmail.com>
X-Greylist: delayed 431 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 08 May 2014 17:28:35 UTC
Received: from mail-lb0-f169.google.com (unknown [209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4DB2D60048;
	Thu,  8 May 2014 17:28:35 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id s7so4121930lbd.28
	for <multiple recipients>; Thu, 08 May 2014 10:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gTWh9mX7H6cW+XxzZPvXXE4/H57dLfCi7tOkJrraJPo=;
	b=Vrr+iP2dxEPvtCBPF/BIWc555Z159BWeGHRGbqhHDF4bGWlQOTeurDK2ZxB/C7rPRg
	tBQFcaF3P2htSXhjUVf2PxwkgkAkGc3m8G39Fhv9WstBqoicVsv5Tg4LL6m83/v4evXT
	0K4YMpUQs83gKRiF1YkVSVwomcz9vY06AGJkBp7ad3+gW/wgw9Bps7Rtcsln2QDTmUw7
	sivjWGv56a+Qg5lWisqpXgHAgH+f1AdawnxtYAmQAl/Ww3CT557UXznn0PFsMZfV+bRC
	+gfJmJsqvtMSkOS2MrdVaBUC/1DWrnCjT9Oo+3/BUt+VL61ibD8iAjNlrNyu7duDMTi9
	0gAg==
X-Received: by 10.112.135.106 with SMTP id pr10mr5775240lbb.24.1399569685208; 
	Thu, 08 May 2014 10:21:25 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cr6sm1623204lbb.19.2014.05.08.10.21.20 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 May 2014 10:21:21 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 8 May 2014 19:21:44 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20140508172144.GR30955@jama>
References: <CAJTo0LZbPXzXyvKXGZZYDT1BDWg3XYrRO_NXsXmuHLMmmW_S3Q@mail.gmail.com>
	<4880759.hcBN3hRDv1@peggleto-mobl5.ger.corp.intel.com>
	<20140508161908.GQ30955@jama>
	<2287383.nOAQ2ykZqg@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <2287383.nOAQ2ykZqg@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembedded-core@lists.openembedded.org,
	OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [yocto] GStreamer 0.10's future
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
X-List-Received-Date: Thu, 08 May 2014 17:28:38 -0000
X-Groupsio-MsgNum: 52997
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gMqNd2jlyJQcupG/"
Content-Disposition: inline

--gMqNd2jlyJQcupG/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 08, 2014 at 05:57:54PM +0100, Paul Eggleton wrote:
> On Thursday 08 May 2014 18:19:08 Martin Jansa wrote:
> > On Thu, May 08, 2014 at 04:07:19PM +0100, Paul Eggleton wrote:
> > > On Thursday 08 May 2014 15:48:40 Burton, Ross wrote:
> > > > Hi all,
> > > >=20
> > > > Sorry for the cross-post but I want this to have a wide audience.
> > > >=20
> > > > For the 1.7 release I want to move GStreamer 0.10 from oe-core into
> > > > meta-multimedia, and ensure everything in oe-core has ported to
> > > > GStreamer 1.x.  GStreamer 0.10 is considered dead upstream and is
> > > > unmaintained so we don't need to be shipping both versions anymore.
> > > >=20
> > > > Everyone in agreement?  Should I expect any hate mail over this?
> > >=20
> > > +1
> > >=20
> > > The next question is does that mean for the "old" libav (which gst-ff=
mpeg
> > > depends upon), do we move that as well or drop it?
> >=20
> > libav was migrated to oe-core quite recently and there is couple of
> > recipes in meta-oe, meta-webserver depending on it/ffmpeg so moving to
> > meta-multimedia wouldn't be very easy.
> >=20
> > meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb:DEPENDS =3D "libpn=
g libav
> > libsndfile1" meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:DEPEN=
DS =3D
> > "libusb1 libcec libplist expat yajl gperf-native libxmu fribidi mpeg2dec
> > ffmpeg samba fontconfig curl python libass libmodplug libmicrohttpd wav=
pack
> > libmms cmake-native libsdl-image libsdl-mixer virtual/egl mysql5 sqlite3
> > libmms faad2 libcdio libpcre boost lzo enca avahi libsamplerate0
> > libxinerama libxrandr libxtst bzip2 virtual/libsdl jasper zip-native zl=
ib
> > libtinyxml libmad"
> > meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb:DEPENDS =3D
> > "alsa-lib libsamplerate0 libsndfile1 libvorbis libogg faad2 ffmpeg curl
> > sqlite bzip2 pulseaudio" meta-multimedia/recipes-multimedia/vlc/vlc.inc=
: =20
> > faad2 ffmpeg flac libxpm libxinerama fluidsynth alsa-lib libdvdcss \
> >=20
> > meta-oe/recipes-multimedia/nonworking/minidlna/minidlna_1.0.25.bb:DEPEN=
DS =3D
> > "flac libav jpeg sqlite3 libexif libogg libid3tag"
> > meta-oe/recipes-support/opencv/opencv_2.4.bb:PACKAGECONFIG ??=3D "eigen=
 gtk
> > jpeg libav png tiff v4l"
> > meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb:PACKAGECONFIG[avformat] =3D
> > "--with-libavformat,--without-libavformat,libav"
> > meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb:DEPENDS =3D "=
libav"
> > meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb:DEPENDS =3D "libvpx
> > libdvdread libtheora virtual/libsdl ffmpeg xsp zlib \
> >=20
> > meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb:PACKAGECONFIG[=
ffmpe
> > g] =3D "--with-ffmpeg,--without-ffmpeg,libav"
> >=20
> > But I would like to see migration to libav-9 which currently has negati=
ve
> > D_P (mplayer2 already depends on 9*, but there are few recipes which fa=
ils
> > with libav-9 too - see earlier world builds for list).
>=20
> Yes, I'm just talking about libav 0.8 here - libav 9 would remain where i=
t is.=20
> That might still be problematic though given that their PN is the same. I=
'm=20
> open to better suggestions, but I think we have to do *something* here.

Ah ok, I though you meant both versions.

Then I would rather drop 0.8 completely, otherwise it will be preferred
even with negative D_P from meta-multimedia (YOCTO #2964) and we cannot
expect people which happen to have meta-multimedia layer to know that
they are expected to update P_V everytime libav is updated in oe-core.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gMqNd2jlyJQcupG/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNrvSgACgkQN1Ujt2V2gBz9ngCfSKbTMoan3fr+fS4GPtF19NyB
ExoAn0IeYSDslbd/6vcCbf2pKwSW6/mE
=AzpD
-----END PGP SIGNATURE-----

--gMqNd2jlyJQcupG/--
