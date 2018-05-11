Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id D712175419
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 19:44:54 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id 94-v6so6381460wrf.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 12:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=XBGx7sXkOp48BGyOuAY0NLzAYeCqK1gNZVaifB4VXNo=;
	b=pkFN7YC3ZKRWmsjlvDs3uofttCdB1KGPaS6hQSsmiMcf9XcNe18MnS8GnzndLE188V
	MRU62WV1HUT/VDjkKsbhS4svJjGAC2OxNYFaeLUz/YRIxvZKEGbnNXCQKWrPNf5toa4U
	AGB7y8P2qSpBhQoDnCMKaEO4oAm3pwkbTStpNhzYSJP+vUrVD+iDZimpbGE2uSN3Wn+9
	pBCjPa9SgGTfi1nVgmNESRjfTt+tPzkxqt/Pli0HXSu2kw23JmcxkCSxjlmj77y0Gieg
	45BLxkibZiEacA4wY/+mUqjlW/Ga8TiV6ukR++oEfsSeb81O3/93SZ+d3j05S5gmHfUo
	wNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=XBGx7sXkOp48BGyOuAY0NLzAYeCqK1gNZVaifB4VXNo=;
	b=rI2NBs9W2agxKN8GQkRmpD5FjEEyxjOULaZS2RIkoQmtntJLyijwTJ9jH/xpfvf0Nk
	pFGnGaEqP0v8a0faOrSYRP9GpZ5zrmIGX3f8KlBLEmU7COeupPCHNkJccjhClbNF46YR
	2gpFNaK+qWSUbiymP5+md6s1TiswVICFJHSL0/eUV5uE7FSR6rjcfpr8HDHHtp1/Iwx9
	1TPk4WjDKyiF9dHAc8E+bsADMW9w/1PLWMp6CBQ76SYQkbAGIHzAOwo2oCLtob8344t2
	5rkMjmfDuFvSbT47c9I7fONGGPzxcflAqHxIObU+KopjZ+yL0i2JqVn0uLwiqxjjv04A
	LT0Q==
X-Gm-Message-State: ALKqPwdnX57iP9S4WyiDbvRtK8TLOQ75TIt7TlCUHo1UqnGhwnsi47VK
	/NnORxeBc9u+VEO+uB11BnQ=
X-Google-Smtp-Source: AB8JxZoVSqNp6JoVpMm5Ex+Zj8DHvXj4FrOuQP87CORWCKgb9w4yMM6ROM5ARt7gIHwpqybw59AEQQ==
X-Received: by 2002:adf:94c1:: with SMTP id 59-v6mr248777wrr.112.1526067895456;
	Fri, 11 May 2018 12:44:55 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	f192-v6sm1622929wmg.14.2018.05.11.12.44.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 11 May 2018 12:44:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 11 May 2018 21:44:57 +0200
To: Alistair Francis <alistair23@gmail.com>
Message-ID: <20180511194457.GA2141@jama>
References: <20180510213058.68614-1-alistair.francis@wdc.com>
	<CA+chaQfgi+-PSYRRnCb2PtpH5UAHa2ztcQ3MaN0_wTc_=GMCmw@mail.gmail.com>
	<CAKmqyKOBqOtT=kCmiuUrrsVV9sQmyJdt7B-789ui6keRg53yiA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKmqyKOBqOtT=kCmiuUrrsVV9sQmyJdt7B-789ui6keRg53yiA@mail.gmail.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes-graphics/libsdl2: Add native and nativesdk support
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
X-List-Received-Date: Fri, 11 May 2018 19:44:55 -0000
X-Groupsio-MsgNum: 111316
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline

--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 10, 2018 at 03:06:47PM -0700, Alistair Francis wrote:
> On Thu, May 10, 2018 at 2:58 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > See http://git.openembedded.org/openembedded-core-contrib/log/?h=3Djans=
a/qemu
> > + http://git.openembedded.org/meta-openembedded-contrib/log/?h=3Djansa/=
spice
> > for more qemu related changes.
> >
> > More info:
> > http://lists.openembedded.org/pipermail/openembedded-core/2017-Septembe=
r/142349.html
> >
> > and that's basically where I'm still stuck (and why haven't sent most of
> > these patches yet), because it works fine "natively" but when the
> > qemu-native is running inside of chroot or docker, I didn't get the
> > acceleration working (from virt-viewer running "natively" - outside
> > chroot/docker).
> >
> > I plan to separate libsdl2 changes from this and send them with updated=
 qemu
> > upgrade as discussed with Ross.
>=20
> It looks like you beat me to it. Plus your patches look better then mine =
:)
>=20
> It would be great if you could send the QEMU 2.12 patches seperatly.
> Can you CC me when you do?

I've forgot to CC you, but the 2 patchsets I've sent today are:
http://lists.openembedded.org/pipermail/openembedded-core/2018-May/150717.h=
tml
http://lists.openembedded.org/pipermail/openembedded-devel/2018-May/118144.=
html

that leaves only virglrenderer and glx support in jansa/qemu branch.

> >
> > On Thu, May 10, 2018 at 11:31 PM Alistair Francis <alistair.francis@wdc=
=2Ecom>
> > wrote:
> >>
> >> Allow building libsdl2 for native and nativesdk. This is required to u=
se
> >> libsdl2 in QEMU.
> >>
> >> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> >> ---
> >>  meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
> >> b/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
> >> index c0cf70d7fd..36508ec349 100644
> >> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
> >> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
> >> @@ -42,6 +42,11 @@ PACKAGECONFIG ??=3D " \
> >>      ${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio x=
11',
> >> d)} \
> >>      ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland gles2=
',
> >> '', d)} \
> >>  "
> >> +PACKAGECONFIG_class-native =3D "${PACKAGECONFIG_GL} x11"
> >> +PACKAGECONFIG_class-nativesdk =3D "${PACKAGECONFIG_GL} \
> >> +                                 ${@bb.utils.filter('DISTRO_FEATURES',
> >> 'x11', d)} \
> >> +"
> >> +
> >>  PACKAGECONFIG[alsa]       =3D "--enable-alsa
> >> --disable-alsatest,--disable-alsa,alsa-lib,"
> >>  PACKAGECONFIG[directfb]   =3D
> >> "--enable-video-directfb,--disable-video-directfb,directfb"
> >>  PACKAGECONFIG[gles2]      =3D
> >> "--enable-video-opengles,--disable-video-opengles,virtual/libgles2"
> >> @@ -63,3 +68,5 @@ do_configure_prepend() {
> >>  }
> >>
> >>  FILES_${PN}-dev +=3D "${libdir}/cmake"
> >> +
> >> +BBCLASSEXTEND =3D "native nativesdk"
> >> --
> >> 2.17.0
> >>
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWvXyuAAKCRA3VSO3ZXaA
HPHJAJ90C39lxCzIihQ/sdNAK6cD6dzm9ACfQdLsFRgu1m1HW/2zzv5Irw59dWY=
=s+fI
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
