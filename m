Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 403D4605F3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 12:22:14 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id z15so6689395ead.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 05:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=oEZMD71fjnZf6nG62rAO7AJmUmGhhkEIosQJHM+18tA=;
	b=BOc0ghWmj9+xXZEmmzSQbJGrPSXNquFoltV+SjTALzVmPPboM914kMyXTjxRx2lX+l
	9bLYDHpIWfZiRmMCH2ddPIY6n5sLZz7EX1FcJ6KpSUMtkRRTucgsYqc/i0PSZYkq4lU4
	6NWI1R9Ej2bBzfwBUcoVXDu53w5u+0gRKOZCuj9Ohs1KRPtKMo3FyPaBm6Gh7vltn1bx
	p45d4K/z8o996HbGISJ96an+BFV1oWTmAFxFWNaJpKq5mcF12QIdRuyReWLq+pp0770a
	10I+rOqDAwryO4XNGlTS4OFDufEOWZsiw916UJRh81Xi3v9KSJpp1SduFrVpNEGzxH+h
	gojA==
X-Received: by 10.15.99.2 with SMTP id bk2mr29629496eeb.76.1372162934311;
	Tue, 25 Jun 2013 05:22:14 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	y1sm30845872eew.3.2013.06.25.05.22.13 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 25 Jun 2013 05:22:13 -0700 (PDT)
Date: Tue, 25 Jun 2013 14:22:50 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Message-ID: <20130625122250.GQ14021@jama>
References: <CAP71WjxJxpWwa5UV4PpN=f0rL00UpPJ_VKJ4LmEu=AVBRdVo2A@mail.gmail.com>
	<CAP71WjzvRgqYtJdBVt_epRVZ5bb4aVbPiEq8z4fw-EfEsnVgGg@mail.gmail.com>
	<1402287.LPEgl0HhT9@helios>
	<CAP71WjyCZvkwDuCM0DGJRBaeCySZkeiuhB6GxKGRBfemjHgQRA@mail.gmail.com>
	<CAP71Wjx-uL3CjmxtJwEhZJyDD5p5HWwEEKSEh-0h5aCmCxeGxA@mail.gmail.com>
	<CAP71WjygMhCMdrbrj8uUKeJZuRu1_cjmhE4cLjsuhJ5wJpxnuQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71WjygMhCMdrbrj8uUKeJZuRu1_cjmhE4cLjsuhJ5wJpxnuQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Issues with Qt5/mesa and eglfs
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
X-List-Received-Date: Tue, 25 Jun 2013 12:22:14 -0000
X-Groupsio-MsgNum: 40962
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rUztinBX/EQDJOOk"
Content-Disposition: inline

--rUztinBX/EQDJOOk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2013 at 01:59:55PM +0200, Nicolas Dechesne wrote:
> On Thu, Jun 20, 2013 at 8:15 PM, Nicolas Dechesne <
> nicolas.dechesne@linaro.org> wrote:
>=20
> > @@ -2,7 +2,7 @@ SRC_URI =3D "
> > ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
> >             file://0002-cross-compile.patch \
> >             file://cross-glsl.patch \
> >             file://dont-fail-if-libX11-isnt-installed.patch \
> > -           file://fix-egl-compilation-without-x11-headers.patch \
> > +           file://EGL-Mutate-NativeDisplayType-depending-on-config.pat=
ch \
> >             "
> >
> > and it does fix the build issue i had (mesa/qt5/non X11 distro).
> >
> > should that be merged into dylan (since it's merged in master already) =
or
> > do we need to wait for the 'final' patch in upstream to be ready?
> >
>=20
>=20
> Paul, Martin, what do you think about this? i have the (trivial) dylan
> backport ready. Do you think it's the right time to get it merged?

I don't have strong opinion about this one, I'm already using that
CFLAGS change in all recipes where it was needed (only few of them) so I
don't mind waiting for upstream for final solution. On other hand this
backport doesn't cause more work for me, so I don't mind if it gets
merged.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rUztinBX/EQDJOOk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHJi5oACgkQN1Ujt2V2gBxIeQCfU7+69zeaqODUQYIcY8Zsel+D
rSMAn3pPx2RL56r1k3/yx0/J/8JEQWCs
=awKe
-----END PGP SIGNATURE-----

--rUztinBX/EQDJOOk--
