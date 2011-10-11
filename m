Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RDWSj-0005X9-0r
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Oct 2011 09:09:17 +0200
Received: by bke11 with SMTP id 11so9536361bke.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2011 00:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ME/5NXhDdER5YlCz4LRaW0p4OWCDO9yc/hhQEyk+3wM=;
	b=cIXt0UxZqVu3A3Gn/YABtQrzS1gVqGMEP7H5aqh9XYQK+azgX6tVgc3Eei0p9GXIqB
	2m7JQPRe0Z2vLcST0jKZdBjMkQb3RhN8rFC+Slq/W3QwDRVo/Kcffda6P3xcLquMetJn
	M5xOwz17VdyHntvn7qZyd9XrkVeYlOHNOK0I4=
Received: by 10.204.143.5 with SMTP id s5mr8645624bku.65.1318316615751;
	Tue, 11 Oct 2011 00:03:35 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ex8sm20024956bkc.2.2011.10.11.00.03.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Oct 2011 00:03:34 -0700 (PDT)
Date: Tue, 11 Oct 2011 09:03:27 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111011070327.GA27073@jama.jama.net>
References: <cover.1318007055.git.Martin.Jansa@gmail.com>
	<8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
	<4E93E69A.7070402@windriver.com>
MIME-Version: 1.0
In-Reply-To: <4E93E69A.7070402@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCHv3 01/31] xserver-xf86(-dri)-lite: rename to xserver-xorg and xserver-xorg-lite
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
X-List-Received-Date: Tue, 11 Oct 2011 07:09:17 -0000
X-Groupsio-MsgNum: 10785
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline

--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2011 at 02:47:54PM +0800, Kang Kai wrote:
> On 2011?10?08? 01:04, Martin Jansa wrote:
> > * xserver-xorg is closer to upstream naming and
> >    that's how it's named in OE-classic and meta-oe? It would make meta-=
oe
> >    transition easier and better to do it now then convert meta-oe to
> >    xserver-xf86 and then rename it back later.
> >
> > Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> > ---
> > diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta=
/conf/distro/include/distro_tracking_fields.inc
> > index 7b6c4a9..8af80c7 100644
> > --- a/meta/conf/distro/include/distro_tracking_fields.inc
> > +++ b/meta/conf/distro/include/distro_tracking_fields.inc
> > @@ -3683,14 +3683,14 @@ RECIPE_INTEL_SECTION_pn-mesa-xlib=3D"graphic co=
re"
> >   RECIPE_LAST_UPDATE_pn-mesa-xlib =3D "Nov 27, 2010"
> >   RECIPE_MAINTAINER_pn-mesa-xlib=3D"Yu Ke<ke.yu@intel.com>"
> >
> > -RECIPE_STATUS_pn-xserver-xf86-dri-lite=3D"green" # no update needed
> > -RECIPE_LATEST_VERSION_pn-xserver-xf86-dri-lite=3D"1.8.99.904"
> > -RECIPE_NO_OF_PATCHES_pn-xserver-xf86-dri-lite=3D"2"
> > -RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xserver-xf86-dri-lite=3D"2 mo=
nthes"
> > -RECIPE_LATEST_RELEASE_DATE_pn-xserver-xf86-dri-lite=3D"2010/07/01"
> > -RECIPE_INTEL_SECTION_pn-xserver-xf86-dri-lite=3D"graphic core"
> > -RECIPE_LAST_UPDATE_pn-xserver-xf86-dri-lite =3D "Jan 18, 2011"
> > -RECIPE_MAINTAINER_pn-xserver-xf86-dri-lite=3D"Yu Ke<ke.yu@intel.com>"
> > +RECIPE_STATUS_pn-xserver-xorg=3D"green" # no update needed
> > +RECIPE_LATEST_VERSION_pn-xserver-xorg=3D"1.8.99.904"
> > +RECIPE_NO_OF_PATCHES_pn-xserver-xorg=3D"2"
> > +RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xserver-xorg=3D"2 monthes"
> > +RECIPE_LATEST_RELEASE_DATE_pn-xserver-xorg=3D"2010/07/01"
> > +RECIPE_INTEL_SECTION_pn-xserver-xorg=3D"graphic core"
> > +RECIPE_LAST_UPDATE_pn-xserver-xorg =3D "Jan 18, 2011"
> > +RECIPE_MAINTAINER_pn-xserver-xorg=3D"Yu Ke<ke.yu@intel.com>"
> >
> >   RECIPE_STATUS_pn-xf86-input-synaptics =3D "red"
> >   DISTRO_PN_ALIAS_pn-xf86-input-synaptics =3D "Meego=3Dxorg-x11-drv-syn=
aptics Fedora=3Dxorg-x11-drv-synaptics Ubuntu=3Dxserver-xorg-input-synaptic=
s Mandriva=3Dx11-driver-input-synaptics Debian=3Dxfree86-driver-synaptics"
> > @@ -5908,8 +5908,8 @@ DISTRO_PN_ALIAS_pn-pseudo =3D "Windriver"
> >
> >   DISTRO_PN_ALIAS_pn-btrfs-tools =3D "Debian=3Dbtrfs-tools Fedora=3Dbtr=
fs-progs"
> >   DISTRO_PN_ALIAS_pn-rt-tests =3D "Debian=3Drt-tests Ubuntu=3Drt-tests"
> > -DISTRO_PN_ALIAS_pn-xserver-xf86-lite =3D "Fedora=3Dxorg-x11-server Ubu=
ntu=3Dxserver-xorg"
> > -DISTRO_PN_ALIAS_pn-xserver-xf86-dri-lite =3D "Fedora=3Dxorg-x11-server=
 Ubuntu=3Dxserver-xorg"
>=20
> Hi Martin,
> > +DISTRO_PN_ALIAS_pn-xserver-xorg =3D "Fedora=3Dxorg-x11-server Ubuntu=
=3Dxserver-xorg"
> I guess this should be xserver-xorg-lite.
>=20
> Regards,
> Kai

You're right, I've added patch for that on top of jansa/x11-v2.

RP: I'll squash it to 01/31 if you want, but I didn't want to rebase as
you already have it in master-next.. so it's on top.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6T6j8ACgkQN1Ujt2V2gBw3kwCfcsXvq3V17gD6H6b5+vuo6ppZ
GAoAnRJhAeCrK+hF9dVw97dTKo+O57RC
=cAuL
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
