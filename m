Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SCCWM-00020Y-HL
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 18:11:50 +0200
Received: by wgbdr12 with SMTP id dr12so3629640wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 09:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=sLM2uPGupVVTKBpuVg/N8g/0eZC7do2nvUIj38Y3TA8=;
	b=Pdf+vAZr4lkVdlPxQdPdwO5KUqsMya9fZl/zf5tG1z09fsm5zMRBPAFoU7RgFVB+j2
	SKij6zH0k6+I4YCvaceXHV9pdyV7tGiMSw9NDwRWsmFYpeX4QjvxJxxzpkdAjOhKHV75
	8ayxMyzTQcRVsozbOXu5wA6GJcdI+dwZYLFx+5OWGIaPgiMQn61F6TYY+ER9HMJ70lCL
	UlsoAQ2GH616geJdb81Bu+E6raOBG1w1hAri7zsPIKT+WMgkyIb7h+k3AxN7EBitug4s
	AVc5WwYrXgDNiAb5VDrFWRx/eouEK1aM7tec2awuzPttiiEXOIvkM7tG4IXiTXv+h9YQ
	BDLA==
Received: by 10.216.133.151 with SMTP id q23mr13080853wei.14.1332777770634;
	Mon, 26 Mar 2012 09:02:50 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k7sm68663352wia.5.2012.03.26.09.02.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Mar 2012 09:02:49 -0700 (PDT)
Date: Mon, 26 Mar 2012 18:02:46 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20120326160246.GH3941@jama.jama.net>
References: <cover.1332507302.git.Martin.Jansa@gmail.com>
	<0f5173c469e4ae3e5155d5d3f0643d3a63e25b91.1332507302.git.Martin.Jansa@gmail.com>
	<4F6C79A8.30403@windriver.com>
	<20120323133102.GG3879@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120323133102.GG3879@jama.jama.net>
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
X-List-Received-Date: Mon, 26 Mar 2012 16:11:50 -0000
X-Groupsio-MsgNum: 19757
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k+G3HLlWI7eRTl+h"
Content-Disposition: inline

--k+G3HLlWI7eRTl+h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 02:31:02PM +0100, Martin Jansa wrote:
> On Fri, Mar 23, 2012 at 09:24:56AM -0400, Bruce Ashfield wrote:
> > On 12-03-23 08:56 AM, Martin Jansa wrote:
> > > * see http://lists.linuxtogo.org/pipermail/openembedded-core/2011-Dec=
ember/014308.html
> >=20
> > I was just looking at this in the past day or so and was
> > wondering where it had gone. Saved me the effort!
> >=20
>=20
> Please bump PR in kernel recipes you care about (I did for mine.. )

I was testing your patch
"linux-yocto: common-pc: Add PCNET32 to the config"
to see if this patch fixes + also in linux-yocto recipes and somehow it
seems still keeping +

OE @ ~/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto/linux-yocto=
-3.2.11+git6+867fc7a19f2ea74253d1f20c3d61b7829635175b_4+4ca7e2c5d42e755e1b4=
c3e1478128f047a8ed2a8-r1/linux-qemux86-64-standard-build
$ ../linux/scripts/setlocalversion .
-yocto-standard

seems ok, but
root@qemux86-64:/lib/modules# opkg files kernel-module-uvesafb
Package kernel-module-uvesafb
(3.2.11+git6+867fc7a19f2ea74253d1f20c3d61b7829635175b_4+4ca7e2c5d42e755e1b4=
c3e1478128f047a8ed2a8-r1)
is installed on root and has the following files:
/lib/modules/
/lib/modules/3.2.11-yocto-standard+/kernel/drivers/video/
/lib/modules/3.2.11-yocto-standard+/kernel/drivers/video/uvesafb.ko

and also:
OE @ ~/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto/linux-yocto=
-3.2.11+git6+867fc7a19f2ea74253d1f20c3d61b7829635175b_4+4ca7e2c5d42e755e1b4=
c3e1478128f047a8ed2a8-r1/linux-qemux86-64-standard-build
$ make kernelrelease
  GEN
/OE/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto/linux-yocto-3.=
2.11+git6+867fc7a19f2ea74253d1f20c3d61b7829635175b_4+4ca7e2c5d42e755e1b4c3e=
1478128f047a8ed2a8-r1/linux-qemux86-64-standard-build/Makefile
scripts/kconfig/conf --silentoldconfig Kconfig
3.2.11-yocto-standard+

Any idea why it doesn't work with linux-yocto layout and works with
other kernels from git (tested on kernels from meta-smartphone).

Cheers,

>=20
> > Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> >=20
> > >
> > > Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> > > ---
> > >   meta/classes/kernel.bbclass |    6 ++++++
> > >   1 files changed, 6 insertions(+), 0 deletions(-)
> > >
> > > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > > index 5e4cdd4..736768e 100644
> > > --- a/meta/classes/kernel.bbclass
> > > +++ b/meta/classes/kernel.bbclass
> > > @@ -204,6 +204,12 @@ sysroot_stage_all_append() {
> > >   }
> > >
> > >   kernel_do_configure() {
> > > +	# fixes extra + in /lib/modules/2.6.37+
> > > +	# $ scripts/setlocalversion . =3D>  +
> > > +	# $ make kernelversion =3D>  2.6.37
> > > +	# $ make kernelrelease =3D>  2.6.37+
> > > +	touch ${B}/.scmversion
> > > +
> > >   	# Copy defconfig to .config if .config does not exist. This allows
> > >   	# recipes to manage the .config themselves in do_configure_prepend=
().
> > >   	if [ -f "${WORKDIR}/defconfig" ]&&  [ ! -f "${B}/.config" ]; then
> >=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--k+G3HLlWI7eRTl+h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9wkyYACgkQN1Ujt2V2gBzLOQCghYxR+2xVE3KFyvWP/6G5hG2J
0YIAnR5mqRl5NA81ABx1FP/aR5phP9Mr
=frc4
-----END PGP SIGNATURE-----

--k+G3HLlWI7eRTl+h--
