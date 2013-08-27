Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id A15976BB90
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 20:07:06 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d51so2499230eek.37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 13:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=iQLakTLaEE7h2HOY3IJ0DxG41NSuCY8YZXtBGBlNTks=;
	b=efmP2Y1AGd9gn+PyRL5sLeaL152ar9MCrHkFN8tA8x+AQSnAEb68m2iZRf4Pws+WXN
	Za6GfdLGW0srVVdKQkUn5yN3dTwRXoUHl9G4MLd7+E4cuNPCikos2LwAlyXcX1HL/Y+t
	2BLVKq0umbTbs8wV8dtSr9sGeXT0bxxMMivF4FRwCZtxq2Pj8znj/TXL/0cFwKZJOXZx
	uqDFAyghpvWhYpDuTyFpvRW26KEAwV0E0jsk/mdVj5pQyT7XfMO6aHtrufZFb7ESU6fp
	X160RCElyoBZw/0QnT7ZUS9G4McJlVjYkCTXfgd26OolfLd8muEjW9nikBmzXk7QC8To
	GwrQ==
X-Received: by 10.14.211.134 with SMTP id w6mr66884eeo.93.1377634026642;
	Tue, 27 Aug 2013 13:07:06 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bn13sm31661633eeb.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 27 Aug 2013 13:07:05 -0700 (PDT)
Date: Tue, 27 Aug 2013 22:08:17 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <20130827200817.GB3544@jama>
References: <1377251290-4290-1-git-send-email-lpapp@kde.org>
	<521D0495.203@windriver.com>
MIME-Version: 1.0
In-Reply-To: <521D0495.203@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot: update to 2013.07
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
X-List-Received-Date: Tue, 27 Aug 2013 20:07:07 -0000
X-Groupsio-MsgNum: 44156
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="T0u6oYl84yPn00Od"
Content-Disposition: inline

--T0u6oYl84yPn00Od
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2013 at 03:57:09PM -0400, Randy MacLeod wrote:
> On 13-08-23 05:48 AM, Laszlo Papp wrote:
> > Signed-off-by: Laszlo Papp <lpapp@kde.org>
> > ---
> >   meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb | 27 ++++++++++++++=
+++++++++
> >   meta/recipes-bsp/u-boot/u-boot_2013.07.bb         | 23 ++++++++++++++=
+++++
> >   2 files changed, 50 insertions(+)
> >   create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
> >   create mode 100644 meta/recipes-bsp/u-boot/u-boot_2013.07.bb
> >
> ...
> > diff --git a/meta/recipes-bsp/u-boot/u-boot_2013.07.bb b/meta/recipes-b=
sp/u-boot/u-boot_2013.07.bb
> > new file mode 100644
> > index 0000000..f3f4b62
> > --- /dev/null
> > +++ b/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
> > @@ -0,0 +1,23 @@
> > +require u-boot.inc
> > +
> > +# To build u-boot for your machine, provide the following lines in you=
r machine
> > +# config, replacing the assignments as appropriate for your machine.
> > +# UBOOT_MACHINE =3D "omap3_beagle_config"
> > +# UBOOT_ENTRYPOINT =3D "0x80008000"
> > +# UBOOT_LOADADDRESS =3D "0x80008000"
> > +
> > +LICENSE =3D "GPLv2+"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42237583f50183a56=
51ecb \
> > +                    file://README;beginline=3D1;endline=3D22;md5=3D78b=
195c11cb6ef63e6985140db7d7bab"
> > +
> > +# This revision corresponds to the tag "v2013.07"
> > +# We use the revision in order to avoid having to fetch it from the re=
po during parse
> > +SRCREV =3D "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
> > +
> > +PV =3D "v2013.07+git${SRCPV}"
> > +
> > +SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster;protocol=3Dg=
it"
>=20
> Just curious...
> I dont' see a good reason to specify the git protocol twice:
>     git://.... and ; protocol=3Dgit

It's not twice, git:// is to select bitbake fetcher (git.py) and one
fetcher can support multiple protocols (e.g. over git, http or ssh)

but you're right that in most cases "protocol=3Dgit" isn't needed, because
it's default protocol for git fetcher when host is specified in that
SRC_URI.

bitbake/lib/bb/fetch2/git.py:
        if 'protocol' in ud.parm:
            ud.proto =3D ud.parm['protocol']
        elif not ud.host:
            ud.proto =3D 'file'
        else:
            ud.proto =3D "git"

And I would support removing it in one go as it clearly confuses people
:).

>=20
> This occurs in many recipes and we could get rid of the clutter
> with a script if it bothers anyone else. :)
>=20
> Am I missing something or are people just copying and pasting the text?
>=20
> // Randy
>=20
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >
>=20
>=20
> --=20
> # Randy MacLeod. SMTS, Linux, Wind River
> Direct: 613.963.1350
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--T0u6oYl84yPn00Od
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIdBzEACgkQN1Ujt2V2gBzz2QCfQPcbeK17Md8pZNOWQhia6IMt
6aQAn3waQVyZ/azXHwWYCfdrN/QVBqtP
=atW2
-----END PGP SIGNATURE-----

--T0u6oYl84yPn00Od--
