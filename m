Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SCCYh-00023T-78
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 18:14:15 +0200
Received: by wibhj13 with SMTP id hj13so4134994wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 09:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Z4t9EQoVabljuMpoMSbsRwB81h0qBE4z6of5p4U9KDQ=;
	b=v3qJnxZH6fsjrqQutXz9uiISp7L4AcN6eNu8xQHXK+cWEvkHn/FSvSit4Q540VkGpw
	3G6O6hwOBJUrtT5ZZa/a+w2fBJR3JUT/NgMab5JcNk/57Qz/VCbL24fb/GEF+Due3kYV
	1NBXt5xSKHUNVSyrC7P0axONpEIoe2c0zonOrZ05o9fCTLOS71eg9hUueW0YEMkGQuIH
	z5D4EnUNY6oGaiusuRyi53xeAx7dwp2aRfdbTYtehyUsVfFSfOhRmkiAVT4glQYKKstu
	BYGehIejX0CIt9Q+8skLoA2CQfE7JXpLVzh/s6E02ioGUzeTsqKrSYUlYx31WJIU/VS7
	H6ZA==
Received: by 10.180.14.73 with SMTP id n9mr19787500wic.16.1332777915346;
	Mon, 26 Mar 2012 09:05:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k7sm68687077wia.5.2012.03.26.09.05.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Mar 2012 09:05:14 -0700 (PDT)
Date: Mon, 26 Mar 2012 18:05:12 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20120326160511.GI3941@jama.jama.net>
References: <cover.1332507302.git.Martin.Jansa@gmail.com>
	<0f5173c469e4ae3e5155d5d3f0643d3a63e25b91.1332507302.git.Martin.Jansa@gmail.com>
	<4F6C79A8.30403@windriver.com>
	<20120323133102.GG3879@jama.jama.net>
	<20120326160246.GH3941@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120326160246.GH3941@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] kernel.bbclass: fix extra + in kernelrelease
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
X-List-Received-Date: Mon, 26 Mar 2012 16:14:15 -0000
X-Groupsio-MsgNum: 19758
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PWfwoUCx3AFJRUBq"
Content-Disposition: inline

--PWfwoUCx3AFJRUBq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 26, 2012 at 06:02:46PM +0200, Martin Jansa wrote:
> On Fri, Mar 23, 2012 at 02:31:02PM +0100, Martin Jansa wrote:
> > On Fri, Mar 23, 2012 at 09:24:56AM -0400, Bruce Ashfield wrote:
> > > On 12-03-23 08:56 AM, Martin Jansa wrote:
> > > > * see http://lists.linuxtogo.org/pipermail/openembedded-core/2011-D=
ecember/014308.html
> > >=20
> > > I was just looking at this in the past day or so and was
> > > wondering where it had gone. Saved me the effort!
> > >=20
> >=20
> > Please bump PR in kernel recipes you care about (I did for mine.. )
>=20
> I was testing your patch
> "linux-yocto: common-pc: Add PCNET32 to the config"
> to see if this patch fixes + also in linux-yocto recipes and somehow it
> seems still keeping +
>=20
> OE @ ~/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto/linux-yoc=
to-3.2.11+git6+867fc7a19f2ea74253d1f20c3d61b7829635175b_4+4ca7e2c5d42e755e1=
b4c3e1478128f047a8ed2a8-r1/linux-qemux86-64-standard-build
> $ ../linux/scripts/setlocalversion .
> -yocto-standard
>=20
> seems ok, but
> root@qemux86-64:/lib/modules# opkg files kernel-module-uvesafb
> Package kernel-module-uvesafb
> (3.2.11+git6+867fc7a19f2ea74253d1f20c3d61b7829635175b_4+4ca7e2c5d42e755e1=
b4c3e1478128f047a8ed2a8-r1)
> is installed on root and has the following files:
> /lib/modules/
> /lib/modules/3.2.11-yocto-standard+/kernel/drivers/video/
> /lib/modules/3.2.11-yocto-standard+/kernel/drivers/video/uvesafb.ko
>=20
> and also:
> OE @ ~/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto/linux-yoc=
to-3.2.11+git6+867fc7a19f2ea74253d1f20c3d61b7829635175b_4+4ca7e2c5d42e755e1=
b4c3e1478128f047a8ed2a8-r1/linux-qemux86-64-standard-build
> $ make kernelrelease
>   GEN
> /OE/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto/linux-yocto-=
3.2.11+git6+867fc7a19f2ea74253d1f20c3d61b7829635175b_4+4ca7e2c5d42e755e1b4c=
3e1478128f047a8ed2a8-r1/linux-qemux86-64-standard-build/Makefile
> scripts/kconfig/conf --silentoldconfig Kconfig
> 3.2.11-yocto-standard+
>=20
> Any idea why it doesn't work with linux-yocto layout and works with
> other kernels from git (tested on kernels from meta-smartphone).

Just one more note to this

OE @
~/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto/linux-yocto-3.2.=
11+git6+867fc7a19f2ea74253d1f20c3d61b7829635175b_4+4ca7e2c5d42e755e1b4c3e14=
78128f047a8ed2a8-r1/linux-qemux86-64-standard-build
$ ../linux/scripts/setlocalversion ../linux
-yocto-standard+

so if it calls setlocalversion against in ../linux tree we can touch
=2Escmversion also in that directory instead of ${B}.

Cheers,

>=20
> Cheers,
>=20
> >=20
> > > Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> > >=20
> > > >
> > > > Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> > > > ---
> > > >   meta/classes/kernel.bbclass |    6 ++++++
> > > >   1 files changed, 6 insertions(+), 0 deletions(-)
> > > >
> > > > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbcl=
ass
> > > > index 5e4cdd4..736768e 100644
> > > > --- a/meta/classes/kernel.bbclass
> > > > +++ b/meta/classes/kernel.bbclass
> > > > @@ -204,6 +204,12 @@ sysroot_stage_all_append() {
> > > >   }
> > > >
> > > >   kernel_do_configure() {
> > > > +	# fixes extra + in /lib/modules/2.6.37+
> > > > +	# $ scripts/setlocalversion . =3D>  +
> > > > +	# $ make kernelversion =3D>  2.6.37
> > > > +	# $ make kernelrelease =3D>  2.6.37+
> > > > +	touch ${B}/.scmversion
> > > > +
> > > >   	# Copy defconfig to .config if .config does not exist. This allo=
ws
> > > >   	# recipes to manage the .config themselves in do_configure_prepe=
nd().
> > > >   	if [ -f "${WORKDIR}/defconfig" ]&&  [ ! -f "${B}/.config" ]; then
> > >=20
> >=20
> > --=20
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
>=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PWfwoUCx3AFJRUBq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9wk7cACgkQN1Ujt2V2gBwbaQCgpGj+pGeaGIHVt9LrOtBMVbO1
XY8AniMHscOEfJ460BGiLhozAFGuQ0LV
=prQs
-----END PGP SIGNATURE-----

--PWfwoUCx3AFJRUBq--
