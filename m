Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 80E2E6FF9F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 00:07:02 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id p65so979985wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Mar 2016 16:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=r/5mKFEfyNQI6aMsF47fHBsSPjMPdgIIel9R3QfmQXI=;
	b=m/4jCjTUKimyxB5Alm41Hf2Squ8fUb62LxU3JK8KZ7eKWZsd+mdJAYfdWkRNu/wtPM
	53RS16ICQ+X01FuGtourxP++G+OHKl4ScFHtVfVpbs+Jx6LBH1oH6j4uC3QIdkrC+mX1
	UdR1V8Z7wP1GuTPuc35g6Xsr1J8kqW3F6on7BZxYJa61YafcvAbFFtMnmRDUg3bH/j1L
	vK1MuS2I2+XBL4hxlsFE14VH2kg6ingWX9S4YKvWCu2jw6uSlYP6May91kx8DmpSogIm
	Zu5xhKAZBDS1I9m0qJm3XWh61oBDgAZtRt9O2ELqXZ60eEm0ZU9hQx+FpSrEnRV1ZFG+
	zi7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=r/5mKFEfyNQI6aMsF47fHBsSPjMPdgIIel9R3QfmQXI=;
	b=Z+DuOIG5QfDO9rRA5n5HvJoedAk/LAtfvVRs8wCnaUQiy57DV/CdjOy2Ub9pAVN2iT
	TDh/0KK8QT4h2kqzKREZXiPIJ3uQKQ/712pc6hsz6f1kFV5JDrL0OW3EJ3jeHOnj7g5x
	WMGD/6mz/w7ISLQDEDuJ0I9y5tzkQA1DCMvbzzUxlaZWIyK4y8Rtx64UVW+EfmMj/FBN
	rFu1glvhz4SvN8oMa3nd1xG1ECOgCTkubZuHh8qi2CUcUJzurPCKRJ7m5Cta3IQPx0Xu
	3JbFSlunEMkcOL0tlF0tvvGnvskqGFOWlJoYZOQMj1lJsqEKF6M/WdYh6WhMmHGIJw61
	hZgw==
X-Gm-Message-State: AD7BkJLQE+Hvkcji8fd1T+frJW3XdzL5CLK1Ytf1Q5ePpKJ9G1p7HXqMRo2nwILPbU0EPQ==
X-Received: by 10.194.116.9 with SMTP id js9mr484104wjb.112.1457568422551;
	Wed, 09 Mar 2016 16:07:02 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id ka4sm836504wjc.47.2016.03.09.16.07.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Mar 2016 16:07:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 10 Mar 2016 01:09:55 +0100
To: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <20160310000955.GP2542@jama>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
	<c9d3e96135173503ef0e3730cc80c993b5bf951e.1457535622.git.alexander.kanavin@linux.intel.com>
	<56E0B734.4000607@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <56E0B734.4000607@opendreambox.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 06/24] gobject-introspection.bbclass: add a class that enables gobject introspection
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
X-List-Received-Date: Thu, 10 Mar 2016 00:07:02 -0000
X-Groupsio-MsgNum: 79357
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kJZGYML2m3vFaueA"
Content-Disposition: inline

--kJZGYML2m3vFaueA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 10, 2016 at 12:52:20AM +0100, Andreas Oberritter wrote:
> Hello Alexander,
>=20
> On 09.03.2016 16:01, Alexander Kanavin wrote:
> > Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> > ---
> >  meta/classes/gobject-introspection.bbclass | 39 ++++++++++++++++++++++=
++++++++
> >  1 file changed, 39 insertions(+)
> >  create mode 100644 meta/classes/gobject-introspection.bbclass
> >=20
> > diff --git a/meta/classes/gobject-introspection.bbclass b/meta/classes/=
gobject-introspection.bbclass
> > new file mode 100644
> > index 0000000..ef51629
> > --- /dev/null
> > +++ b/meta/classes/gobject-introspection.bbclass
> > @@ -0,0 +1,39 @@
> > +# Inherit this class in recipes to enable building their introspection=
 files
> > +
> > +# This allows disabling introspection support in recipes
> > +# (and therefore avoiding the use of qemu)
> > +# if gobject-introspection-data is omitted from DISTRO_FEATURES and MA=
CHINE_FEATURES.
> > +EXTRA_OECONF_prepend =3D "${@bb.utils.contains('COMBINED_FEATURES', 'g=
object-introspection-data', '--enable-introspection', '--disable-introspect=
ion', d)} "
>=20
> testing only DISTRO_FEATURES would be better. If MACHINE_FEATURES gets
> tested, even though indirectly, I'd expect every recipe inheriting this
> class to switch to MACHINE_ARCH implicitly.

I think the idea was to prevent using qemu for MACHINEs without support
in qemu. But I fully agree that causing all recipes which inherit this
bbclass effectively MACHINE_ARCH is even worse.

DISTRO needs to make sure that all supported MACHINEs have support in
qemu or disable introspection for all of them.

> It's not a feature that depends on any type of hardware design.


>=20
> Regards,
> Andreas
>=20
> > +
> > +UNKNOWN_CONFIGURE_WHITELIST_append =3D " --enable-introspection --disa=
ble-introspection"
> > +
> > +# Generating introspection data depends on a combination of native and=
 target introspection tools,
> > +# and qemu to run the target tools.
> > +DEPENDS_append =3D " gobject-introspection gobject-introspection-nativ=
e qemu-native"
> > +
> > +# This is necessary for python scripts to succeed - distutils
> > +# failes if these are not set
> > +export BUILD_SYS
> > +export HOST_SYS
> > +export STAGING_LIBDIR
> > +export STAGING_INCDIR
> > +
> > +# This is used by introspection tools to find .gir includes
> > +export XDG_DATA_DIRS =3D "${STAGING_DATADIR}"
> > +
> > +do_configure_prepend_class-target () {
> > +    # introspection.m4 pre-packaged with upstream tarballs does not yet
> > +    # have our fixes
> > +    mkdir -p ${S}/m4
> > +    cp ${STAGING_DIR_TARGET}/${datadir}/aclocal/introspection.m4 ${S}/=
m4
> > +}
> > +
> > +
> > +# .typelib files are needed at runtime and so they go to the main pack=
age
> > +# (so they'll be together with libraries they support).
> > +FILES_${PN}_append =3D " ${libdir}/girepository-*/*.typelib"=20
> > +   =20
> > +# .gir files go to dev package, as they're needed for developing (but =
not for running)
> > +# things that depends on introspection.
> > +FILES_${PN}-dev_append =3D " ${datadir}/gir-*/*.gir"
> > +
> >=20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kJZGYML2m3vFaueA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbgu1IACgkQN1Ujt2V2gBzEYgCdGIcEqrie2Q3PXOnkOdXVYf/I
JPsAnR03ATSgUBGEns88ib1MLhbHBkQg
=uaFf
-----END PGP SIGNATURE-----

--kJZGYML2m3vFaueA--
