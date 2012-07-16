Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sqnxt-0002eX-H3
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 18:16:07 +0200
Received: by wgbdr1 with SMTP id dr1so1750379wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 09:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=D6Ifufxf1eGdo+oN5wLVblCdFv+kkcbvqU9lDZhG0ug=;
	b=sq0eEBpAsz8V8R/O2kG7Xht4vyeYBlNb6Vn6IvVD6Qdoi7wEk/45xe8fyty+b2Kbzm
	JK3uz5GEjFiVXDaYptVRXloxO1ISXgUNNC/G9GMYIET8E8FU2r5A3mUQAnGr7syy109s
	IT+uMURPA3mJf5efy2vN19FdOQv6BF6QT7c4aMbCcP2nqomSzWRYagMd5abc7Gxbo0N/
	vETtdAEOJCvlkYsjq1pGvAQ2Y6xsOj/h/IRiAfs9tJ30NJvzL1iGADl1HnSuqovfsZPS
	UTVmFboYMo6uokR6K2maP91eyP3+DaTsIdm68I2EyPHMN2EAml4mC0lgcKiGqYmxIi6d
	KagQ==
Received: by 10.216.92.133 with SMTP id j5mr6077313wef.38.1342454687154;
	Mon, 16 Jul 2012 09:04:47 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fu8sm22134764wib.5.2012.07.16.09.04.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Jul 2012 09:04:46 -0700 (PDT)
Date: Mon, 16 Jul 2012 18:04:54 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120716160454.GH3729@jama.jama.net>
References: <cover.1342453118.git.sgw@linux.intel.com>
	<d67e47bd457de90b19428245644dc64ecf4ba11a.1342453118.git.sgw@linux.intel.com>
	<CADkTA4PU2FTrOkiKFL=+imfddD+Do-kpD0K9a+BuNyG041LgnA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4PU2FTrOkiKFL=+imfddD+Do-kpD0K9a+BuNyG041LgnA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [CONSOLIDATED PULL 09/30] linux-libc-headers: updated to 3.4.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jul 2012 16:16:07 -0000
X-Groupsio-MsgNum: 25428
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pfTAc8Cvt8L6I27a"
Content-Disposition: inline

--pfTAc8Cvt8L6I27a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 16, 2012 at 11:58:52AM -0400, Bruce Ashfield wrote:
> On Mon, Jul 16, 2012 at 11:47 AM, Saul Wold <sgw@linux.intel.com> wrote:
> > From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> >
> > Tested by building core-image-sato-sdk.
>=20
> We've never gone to this level of granularity in the past, since
> -stable updates to
> the kernel are not going to change something in the libc-headers exports.
>=20
> As far as I'm concerned, bumping this for each stable release is too much=
 churn.

But this time it's quite usefull after=20
http://git.openembedded.org/openembedded-core/commit/?id=3D2a4ab6fc2ef10202=
d13568aba5d7633e88aa71e5
removed some headers from sysroots and some packages (like IIRC udev)
were failing to build until someone rebuilt linux-libc-headers manually
to fixup staged headers in machine sysroot..

Cheers,

>=20
> Sorry I missed this during the original review/posting.
>=20
> Cheers,
>=20
> Bruce
>=20
> >
> > Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > ---
> >  meta/conf/distro/include/tcmode-default.inc        |    2 +-
> >  .../linux-libc-headers/linux-libc-headers_3.4.3.bb |    6 ++++++
> >  .../linux-libc-headers/linux-libc-headers_3.4.bb   |    6 ------
> >  3 files changed, 7 insertions(+), 7 deletions(-)
> >  create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-h=
eaders_3.4.3.bb
> >  delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-h=
eaders_3.4.bb
> >
> > diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/di=
stro/include/tcmode-default.inc
> > index f11e687..0a068be 100644
> > --- a/meta/conf/distro/include/tcmode-default.inc
> > +++ b/meta/conf/distro/include/tcmode-default.inc
> > @@ -22,7 +22,7 @@ SDKGCCVERSION ?=3D "${GCCVERSION}"
> >  BINUVERSION ?=3D "2.22"
> >  EGLIBCVERSION ?=3D "2.15"
> >  UCLIBCVERSION ?=3D "0.9.33"
> > -LINUXLIBCVERSION ?=3D "3.4"
> > +LINUXLIBCVERSION ?=3D "3.4.3"
> >
> >  PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
> >  PREFERRED_VERSION_gcc-cross ?=3D "${GCCVERSION}"
> > diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_=
3.4.3.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.=
bb
> > new file mode 100644
> > index 0000000..6f8d9e8
> > --- /dev/null
> > +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb
> > @@ -0,0 +1,6 @@
> > +require linux-libc-headers.inc
> > +
> > +PR =3D "r0"
> > +
> > +SRC_URI[md5sum] =3D "3aefa02db55715d627ed23a01667057d"
> > +SRC_URI[sha256sum] =3D "17f1256daa289dde1a0a587c9753556d37a52770f7c4ef=
cf2666fd4796a6eacc"
> > diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_=
3.4.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb
> > deleted file mode 100644
> > index 9e8c88f..0000000
> > --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb
> > +++ /dev/null
> > @@ -1,6 +0,0 @@
> > -require linux-libc-headers.inc
> > -
> > -PR =3D "r0"
> > -
> > -SRC_URI[md5sum] =3D "146af0160fc7a60cf9acf44aec13482b"
> > -SRC_URI[sha256sum] =3D "a797a15d0b6228381507c14ecf4eec4a6cc5c77cfd521b=
a3b3e1325e85b5b16d"
> > --
> > 1.7.7.6
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
>=20
>=20
> --=20
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pfTAc8Cvt8L6I27a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAEO6YACgkQN1Ujt2V2gBy9QQCfbpOa+FSa6ejcMNc2hiJnxZzY
VSYAn37XHUXks08aRpWiEJuuWnclHSom
=OL1l
-----END PGP SIGNATURE-----

--pfTAc8Cvt8L6I27a--
