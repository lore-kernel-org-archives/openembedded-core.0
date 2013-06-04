Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id C68386065C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jun 2013 14:26:11 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id b13so275367wgh.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Jun 2013 07:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gzGxD71uV0n/g8+ZLTPVtN2nRcr+3uanXZC/Usg0Whw=;
	b=n9PKoDHOwU+v2ODIcAFpS3cYP9SZLyn+T33U5Yb5HGv1nuSBeVJxSJAyMsG+XBlw8t
	MDCMRyKo3Ib5eC644L6vQWHTmPIDUw6w5Lnq/75wYBqMKi4njF+Gg3dSNZwKbhcnvj6p
	EYt0CPu0yagL+P9x80qmnZzPyUq8bOm9cxfCGfV8nLTePAc9FRTsLsF+CCcynhxdskF5
	FkY1lHxDXcyYbPo8mt987jQqqRnpyqD81Ef+X2iwmXbF4FWqpfm8A0uFAzOUIyABMGf/
	fyxelO2/lr3zckluIb9FsTrINGhw/qb6RSSiNjqlwP+ydF1UyrVyF6O5YzBAbrwpWQ9r
	ZpDg==
X-Received: by 10.180.208.109 with SMTP id md13mr1214320wic.57.1370355971362; 
	Tue, 04 Jun 2013 07:26:11 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	dj7sm3004046wib.6.2013.06.04.07.26.10 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 04 Jun 2013 07:26:10 -0700 (PDT)
Date: Tue, 4 Jun 2013 16:26:27 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20130604142627.GA30727@jama>
References: <cover.1370012689.git.ross.burton@intel.com>
	<5bed792688d848b38d1565e2705b1f9dca7a17d5.1370012689.git.ross.burton@intel.com>
	<51ACFF04.80101@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <51ACFF04.80101@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/11] at-spi2: add -core and -atk, for GTK+ 3.8
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
X-List-Received-Date: Tue, 04 Jun 2013 14:26:12 -0000
X-Groupsio-MsgNum: 40153
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Content-Disposition: inline

--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 03, 2013 at 01:39:32PM -0700, Saul Wold wrote:
> On 05/31/2013 08:05 AM, Ross Burton wrote:
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> >   meta/recipes-support/atk/at-spi2-atk_2.8.1.bb  |   19 +++++++++++++++=
++++
> >   meta/recipes-support/atk/at-spi2-core_2.8.0.bb |   17 +++++++++++++++=
++
> >   2 files changed, 36 insertions(+)
> >   create mode 100644 meta/recipes-support/atk/at-spi2-atk_2.8.1.bb
> >   create mode 100644 meta/recipes-support/atk/at-spi2-core_2.8.0.bb
> >
>=20
> Ross,
>=20
> I ran into a do_configure issue with this new recipe, the at-spi2-core=20
> failed to configure on my local test machine.
>=20
> Possibly this is the reason:
> > configure:13783: checking alignment of char
> > configure:13819: result: 0
> > configure:13822: error: Failed to find alignment. Check config.log for =
details.
>=20
> Sau!

Hi,=20

this issue is known:
http://lists.openembedded.org/pipermail/openembedded-core/2013-February/075=
178.html

>=20
>=20
>=20
> > diff --git a/meta/recipes-support/atk/at-spi2-atk_2.8.1.bb b/meta/recip=
es-support/atk/at-spi2-atk_2.8.1.bb
> > new file mode 100644
> > index 0000000..32cbe3b
> > --- /dev/null
> > +++ b/meta/recipes-support/atk/at-spi2-atk_2.8.1.bb
> > @@ -0,0 +1,19 @@
> > +SUMMARY =3D "AT-SPI 2 Toolkit Bridge"
> > +LICENSE =3D "LGPLv2"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De9f288ba982d60518f375b58982=
83886"
> > +
> > +MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
> > +
> > +SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
> > +SRC_URI[md5sum] =3D "854e36a2538bea50bc08d33aa9499bb2"
> > +SRC_URI[sha256sum] =3D "eb659b94fde6dc0a2f584c9121a5e6d39a4c8aa297d21d=
8f9032f7a8a775fd06"
> > +
> > +DEPENDS =3D "dbus glib-2.0 atk at-spi2-core"
> > +
> > +inherit autotools
> > +
> > +PACKAGES =3D+ "${PN}-gnome ${PN}-gtk2"
> > +
> > +FILES_${PN}-gnome =3D "${libdir}/gnome-settings-daemon-3.0/gtk-modules"
> > +FILES_${PN}-gtk2 =3D "${libdir}/gtk-2.0/modules/libatk-bridge.*"
> > +FILES_${PN}-dbg +=3D "${libdir}/gtk-2.0/modules/.debug"
> > diff --git a/meta/recipes-support/atk/at-spi2-core_2.8.0.bb b/meta/reci=
pes-support/atk/at-spi2-core_2.8.0.bb
> > new file mode 100644
> > index 0000000..29851bb
> > --- /dev/null
> > +++ b/meta/recipes-support/atk/at-spi2-core_2.8.0.bb
> > @@ -0,0 +1,17 @@
> > +SUMMARY =3D "Assistive Technology Service Provider Interface (dbus cor=
e)"
> > +LICENSE =3D "LGPLv2"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De9f288ba982d60518f375b58982=
83886"
> > +
> > +MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
> > +
> > +SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
> > +SRC_URI[md5sum] =3D "93b57d5d56d15d1222ddf2386e2f869f"
> > +SRC_URI[sha256sum] =3D "1861a30fc7f583d5a567a0ba547db67ce9bd294f0d1c9f=
7403c96a10a481c458"
> > +
> > +DEPENDS =3D "dbus glib-2.0 virtual/libx11 libxi"
> > +
> > +inherit autotools gtk-doc
> > +
> > +EXTRA_OECONF =3D "--disable-introspection --disable-xevie"
> > +
> > +FILES_${PN} +=3D "${datadir}/dbus-1/services/*.service"
> >
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGt+RMACgkQN1Ujt2V2gBw/1ACfUQLrbUQ+DUggwJH6siX5jhls
spAAnivwy8KyK0fdZiiKF0bmzDr/KiBV
=ljtV
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
