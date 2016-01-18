Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id D21CC6FF7D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 16:56:15 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u188so17710506wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 08:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=chMoWomTt7+ghGtYRM6VgRS0+lrCU0ECycT1QEtK6Ag=;
	b=KOIrqeZBQruRFjTD31HDZ3gqEQ1w32V0IoWApOjtXo0SRfYCaWT0hMnGkpvLTkRvNv
	oJN01NesD+39muLCzgTfMdZuzvanDTUNmBSFaMDY7o0BYpYAD3j0wzMHF88+GMZPp/kt
	IH440Juj/9OfzqXLCLQ/LUQF41HLfHeEnT3iTEJNWcC6irthdIgcwfxYh/4CatsfMqBb
	gtNqulpM8KfcEMncduqCtFjsyPYtOZIzlvESLMelY2y8zA4++ZtzUJeKav4rWbf6O+Vn
	vX6ezCjVNx1wCB60Hb5zjh52JZTONjyYEcCCsRzs4TH5hKxEQolcruXLfZrqik1EVIwf
	fHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=chMoWomTt7+ghGtYRM6VgRS0+lrCU0ECycT1QEtK6Ag=;
	b=kKsVd+xN9xinL72gjAt8NdhVwE/p/aELLlIyrXacuAoCYgLo9dgazDOg6oJ1SCK2fK
	YEKTEZK/7f9S6YAz68EEBWkkzkwLxFzVifW94e1SnKOcUXLDecV3CUHUzUfnOqqEzDw2
	PlEAiRFueh6ofbaUGXYqDJ8P5AQ7kgTba+otSBJVJ0Wk4gixzkhff+4k2i1WjadJ/HqO
	4UZ9EzOKwfM6A1bcAD6M4wc5m3wC1yGiWp09TS9FkyxFwONyrzBWns2dB5ks1/fAdmdH
	B7wSyG6EdurJqhrmEHvUbRzgPdtNTyyRZH/sLUBPd4nny+3cOqKnkFmsBc/OxzxNQnVT
	60SQ==
X-Gm-Message-State: ALoCoQmP1Blmu8SwDXKMFSsG0Xjp2TPkHKjZMGXhu4dtXFSW/avWmkkMSqIRkDEAkS+6JEwfMY5ZCwgRjLTiXDDC2NoGHSJtwA==
X-Received: by 10.194.23.70 with SMTP id k6mr24674148wjf.54.1453136176198;
	Mon, 18 Jan 2016 08:56:16 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	az10sm24681366wjc.28.2016.01.18.08.56.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jan 2016 08:56:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 18 Jan 2016 17:57:28 +0100
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20160118165728.GD2614@jama>
References: <cover.1451286789.git.liezhi.yang@windriver.com>
	<66e32244aed8d33f1b49fbe78179f2442545c730.1451286789.git.liezhi.yang@windriver.com>
	<CALbNGRQ+sJBd7+_knzSc4AQTFXdPAJRgGAHnX7B_EZGLy0nj4w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQ+sJBd7+_knzSc4AQTFXdPAJRgGAHnX7B_EZGLy0nj4w@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/40] gstreamer1.0-plugins-good: fix PACKAGECONFIG for gudev and add one for v4l2 and libv4l2
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
X-List-Received-Date: Mon, 18 Jan 2016 16:56:16 -0000
X-Groupsio-MsgNum: 76348
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MAH+hnPXVZWQ5cD/"
Content-Disposition: inline

--MAH+hnPXVZWQ5cD/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 15, 2016 at 09:21:30AM +0100, Andreas M=FCller wrote:
> On Mon, Dec 28, 2015 at 8:14 AM, Robert Yang <liezhi.yang@windriver.com> =
wrote:
> > From: Martin Jansa <Martin.Jansa@gmail.com>
> >
> > * WARN: gstreamer1.0-plugins-good: gstreamer1.0-plugins-good-video4linu=
x2 rdepends on libcap, but it isn't a build dependency?
> >   WARN: gstreamer1.0-plugins-good: gstreamer1.0-plugins-good-video4linu=
x2 rdepends on libgudev, but it isn't a build dependency?
> >   WARN: gstreamer1.0-plugins-good: gstreamer1.0-plugins-good-video4linu=
x2 rdepends on libudev, but it isn't a build dependency?
> >   WARN: gstreamer1.0-plugins-good: gstreamer1.0-plugins-good-video4linu=
x2 rdepends on zlib, but it isn't a build dependency?
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  .../gstreamer/gstreamer1.0-plugins-good.inc        |    8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-goo=
d.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
> > index 0ce4b8f..edaafe8 100644
> > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
> > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
> > @@ -11,7 +11,7 @@ inherit gettext
> >  PACKAGECONFIG ??=3D " \
> >      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
> >      ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio'=
, '', d)} \
> > -    orc cairo flac gdk-pixbuf gudev jpeg libpng soup speex taglib \
> > +    orc cairo flac gdk-pixbuf jpeg libpng soup speex taglib v4l2\
> >      "
> Just noticed that this patch removes gudev from default PACKAGECONFIG.
> Was that intended?

Yes it was intended, because oe-core doesn't have libgudev provider for
systemd based builds, see:
http://patchwork.openembedded.org/patch/107865/

I didn't get reply from Robert and haven't seen any libgudev backport
for oe-core, so I've sent gstreamer changes for jethro which disable
gudev support where it isn't available for oe-core.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MAH+hnPXVZWQ5cD/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAladGXgACgkQN1Ujt2V2gBzrvgCeL+QE5Xd9tqspIua6k2mqR3Fd
ZukAnAldfI5pcxIycwP+V7YBHOSgOGNk
=p6Rf
-----END PGP SIGNATURE-----

--MAH+hnPXVZWQ5cD/--
