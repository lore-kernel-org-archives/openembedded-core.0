Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 71957771F0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 10:24:48 +0000 (UTC)
Received: by wmww144 with SMTP id w144so81585096wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 02:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=czb/LVlQKwKLHYcRv9jTI1HxA8t2OPhdKv1g+IbzzN8=;
	b=xOtSqi/YNHg25lCglLYI/cPqAm0rH0SOQOYlmS+0Ug1B0pZDQYrlqpZqgvUlwDXJkM
	XT5IRPgKZCFvnR/VJh6RGAoTjQ+paIqHwm4r6msa+OlEkThbzc7NLgkAsNa+VWDnP7V+
	lmVkoBWcc5O8rWR/VSk2FoIwS8nl72MZ34x3n9dNIEC+4XQ3cUUj2Rs+x8kZgzAZly4s
	XyZN7bkSnybcsWwKANvcWBeHfOgitulrP19wBCzUCS1klTVDtYrPFo6QYgaeHwMC0Tjy
	MNyz8exNUYpUdLpp/2vPmtHEspugoztffDa+ldOUtZN7HYsrLrEhI+9FsYkr5RLyM6CE
	zswA==
X-Received: by 10.194.3.39 with SMTP id 7mr15247852wjz.20.1447323888634;
	Thu, 12 Nov 2015 02:24:48 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	e189sm14256196wma.4.2015.11.12.02.24.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 02:24:47 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 12 Nov 2015 11:25:04 +0100
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20151112102504.GA2574@jama>
References: <cover.1447318250.git.liezhi.yang@windriver.com>
	<8d5508408ad7f619d8981aaf098592e2fa2244a8.1447318250.git.liezhi.yang@windriver.com>
	<CALbNGRQSo-T+OJp4aS4PaJhVRo918ECObe0yOS+jgKH5mXG+5w@mail.gmail.com>
	<564456AE.6020909@windriver.com>
MIME-Version: 1.0
In-Reply-To: <564456AE.6020909@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] clutter-gst-3.0: add --enable/disable-gudev
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
X-List-Received-Date: Thu, 12 Nov 2015 10:24:52 -0000
X-Groupsio-MsgNum: 73288
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline

--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2015 at 05:06:54PM +0800, Robert Yang wrote:
>=20
>=20
> On 11/12/2015 05:00 PM, Andreas M=FCller wrote:
> > On Thu, Nov 12, 2015 at 9:51 AM, Robert Yang <liezhi.yang@windriver.com=
> wrote:
> >> Fix dangling dependns on gudev, and systemd doesn't provide libgudev, =
so
> >> it can't be enabled when systemd either.
> >>
> >> Fixed:
> >> libtool: error: cannot find the library 'tmp/sysroots/qemuarm64/usr/li=
b64/libgudev-1.0.la' or unhandled argument
> >> 'tmp/sysroots/qemuarm64/usr/lib64/libgudev-1.0.la'
> >>
> >> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >> ---
> >>   meta/recipes-graphics/clutter/clutter-gst-3.0.inc  |   15 ++++++-
> >>   .../0001-configure.ac-add-enable-gudev.patch       |   45 ++++++++++=
++++++++++
> >>   2 files changed, 59 insertions(+), 1 deletion(-)
> >>   create mode 100644 meta/recipes-graphics/clutter/clutter-gst-3.0/000=
1-configure.ac-add-enable-gudev.patch
> >>
> >> diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc b/meta/=
recipes-graphics/clutter/clutter-gst-3.0.inc
> >> index d4fed71..c29bc7a 100644
> >> --- a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
> >> +++ b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
> >> @@ -4,7 +4,12 @@ LICENSE =3D "LGPLv2+"
> >>
> >>   inherit clutter
> >>
> >> -SRC_URI +=3D "file://0001-Install-example-binary-needed-for-core-imag=
e-clutter.patch"
> >> +SRC_URI +=3D "file://0001-Install-example-binary-needed-for-core-imag=
e-clutter.patch \
> >> +            file://0001-configure.ac-add-enable-gudev.patch \
> >> +            "
> >> +
> >> +PACKAGECONFIG ??=3D ""
> >> +PACKAGECONFIG[gudev] =3D "--enable-gudev,--disable-gudev,udev"
> >>
> >>   DEPENDS =3D "gstreamer1.0-plugins-base gstreamer1.0-plugins-bad clut=
ter-1.0"
> >>   RDEPENDS_${PN} +=3D "gstreamer1.0-meta-base"
> >> @@ -12,6 +17,14 @@ PACKAGES  =3D+ "${PN}-examples"
> >>
> >>   EXTRA_OECONF +=3D "--disable-introspection"
> >>
> >> +python () {
> >> +    if bb.utils.contains('EXTRA_OECONF', '--enable-gudev', True, Fals=
e, d) and \
> >> +        bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, =
d):
> >> +            bb.warn("%s: gudev can't be enabled since systemd doesn't=
 provide libgudev" % \
> >> +                    d.getVar("PN", True))
> >> +            d.appendVar('EXTRA_OECONF', ' --disable-gudev')
> >> +}
> >> +
> > I think this part of the patch is wrong: You have to replace udev by
> > gudev in DEPENDS part of packageconfig above and skip python function
>=20
> I think that there is no gudev but udev ? udev provides gudev, but systemd
> only provides udev, no gudev.

There is gudev in meta-oe (for people using systemd):
meta-oe/recipes-gnome/libgudev/libgudev_230.bb

>=20
> // Robert
>=20
> > complete.
> >
> > Andreas
> >
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZEaP8ACgkQN1Ujt2V2gBx1mwCfRBs4NymM30nDFoaLp6muhJGW
YPkAoKCWjc4wNCapZKs+KJvQX2EzS3AH
=5dm3
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--
