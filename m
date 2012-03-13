Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S7Oa1-0007JO-E6
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 11:03:45 +0100
Received: by eekc1 with SMTP id c1so66036eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 02:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3FJVtD3cK5nBByYLJN0cAccF6hCPx6gkVH5F2Tyko2g=;
	b=sG/lYALjVCuiqivzbGQm+Dk98sjQ101O/ifAc+aWo8wChDGkJO4e0fR8Ovq3VVEABF
	fDuhBIo27aeggWfI+2fcr9O1mSPbOe9iAt1xVrod+R16/OZQiKS40ySuqvTWewtHu41f
	cmWFe3F17OKMI6F/sFX8YKdVFVYO4OHwQO2iB5vzu+bRU0GQxtcXUbGnWhdMSQePZnj7
	LU8GPdPhWwm0IBTXopIp+/3SFOjTIyx3nM/N4zmuLIbDU/zTBpVNXkZBcPVUew6kiFOs
	J6DJi2lHMh/DFtnluHw5jkAeFcjun0KpB/pxODd6fzABpXjesqJB06lZugRg/syX0buB
	IuHg==
Received: by 10.14.199.197 with SMTP id x45mr2202817een.89.1331632501500;
	Tue, 13 Mar 2012 02:55:01 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id p57sm80880eei.8.2012.03.13.02.54.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Mar 2012 02:55:00 -0700 (PDT)
Date: Tue, 13 Mar 2012 10:54:58 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120313095458.GD3861@jama.jama.net>
References: <cover.1331598077.git.richard.purdie@linuxfoundation.org>
	<df48742cfc0c46ae33f28900cfd5a7a2f94c326c.1331598077.git.richard.purdie@linuxfoundation.org>
	<63F58257-6C34-409B-948C-B4C1D0CAF211@dominion.thruhere.net>
	<1331632334.15192.35.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1331632334.15192.35.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 01/17] leafpad: Package currently unpackaged files.
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
X-List-Received-Date: Tue, 13 Mar 2012 10:03:45 -0000
X-Groupsio-MsgNum: 18686
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GxcwvYAGnODwn7V8"
Content-Disposition: inline

--GxcwvYAGnODwn7V8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 13, 2012 at 09:52:14AM +0000, Richard Purdie wrote:
> On Tue, 2012-03-13 at 09:07 +0100, Koen Kooi wrote:
> > Op 13 mrt. 2012, om 01:22 heeft Richard Purdie het volgende geschreven:
> >=20
> > > This resolves the QA warning:
> > >=20
> > > WARNING: For recipe leafpad, the following files/directories were ins=
talled but not shipped in any package:
> > > WARNING:   /usr/share/icons
> > > WARNING:   /usr/share/icons/hicolor
> > > WARNING:   /usr/share/icons/hicolor/16x16
> > > WARNING:   /usr/share/icons/hicolor/22x22
> > > WARNING:   /usr/share/icons/hicolor/scalable
> > > WARNING:   /usr/share/icons/hicolor/32x32
> > > WARNING:   /usr/share/icons/hicolor/24x24
> > > WARNING:   /usr/share/icons/hicolor/16x16/apps
> > > WARNING:   /usr/share/icons/hicolor/16x16/apps/leafpad.png
> > > WARNING:   /usr/share/icons/hicolor/22x22/apps
> > > WARNING:   /usr/share/icons/hicolor/22x22/apps/leafpad.png
> > > WARNING:   /usr/share/icons/hicolor/scalable/apps
> > > WARNING:   /usr/share/icons/hicolor/scalable/apps/leafpad.svg
> > > WARNING:   /usr/share/icons/hicolor/32x32/apps
> > > WARNING:   /usr/share/icons/hicolor/32x32/apps/leafpad.png
> > > WARNING:   /usr/share/icons/hicolor/24x24/apps
> > > WARNING:   /usr/share/icons/hicolor/24x24/apps/leafpad.png
> > >=20
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> > > meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb |    6 ++++--
> > > 1 files changed, 4 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb b/meta/rec=
ipes-sato/leafpad/leafpad_0.8.18.1.bb
> > > index 68402c5..3d1bc43 100644
> > > --- a/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
> > > +++ b/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
> > > @@ -1,6 +1,5 @@
> > > DESCRIPTION =3D "Simple GTK+ Text Editor"
> > > HOMEPAGE =3D "http://tarot.freeshell.org/leafpad/"
> > > -BUGTRACKER =3D ""
> > >=20
> > > LICENSE =3D "GPLv2 & GPLv2+"
> > > LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079=
bae19f \
> > > @@ -14,7 +13,7 @@ SRC_URI =3D "http://savannah.nongnu.org/download/${=
BPN}/${BPN}-${PV}.tar.gz \
> > >=20
> > > SRC_URI[md5sum] =3D "254a72fc67505e3aa52884c729cd7b97"
> > > SRC_URI[sha256sum] =3D "959d22ae07f22803bc66ff40d373a854532a6e4732680=
bf8a96a3fbcb9f80a2c"
> > > -PR =3D "r1"
> > > +PR =3D "r2"
> > >=20
> > > SRC_URI_append_poky +=3D " file://owl-menu.patch;apply=3Dyes "

^^ this should be probably dropped too (at least apply=3Dyes) or applied fo=
r everybody

> > >=20
> > > @@ -29,3 +28,6 @@ do_install_append () {
> > > }
> > >=20
> > > FILES_${PN} +=3D "${datadir}/applications/leafpad.desktop"
> > > +
> > > +PACKAGES +=3D "leafpad-stock-icons"
> > > +FILES_leafpad-stock-icons =3D "${datadir}/icons/hicolor/"
> >=20
> > I strongly suspect that that .desktop will reference leafpad.png as
> > the icon, but I haven't actually verified that.
>=20
> I can confirm it does not (it references accessories-text-editor).
>=20
> >  This recipe should probably inherit gtk-icon-cache.
>=20
> Probably although given the above it becomes less of an issue.
>=20
> Cheers,
>=20
> Richard
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GxcwvYAGnODwn7V8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9fGXIACgkQN1Ujt2V2gBzzfQCfZ86JhUEDYf4hvnfr3DkUg0NF
S8cAn1/PY0nu0XPN4y5CqU51wH0rwjg/
=Atpu
-----END PGP SIGNATURE-----

--GxcwvYAGnODwn7V8--
