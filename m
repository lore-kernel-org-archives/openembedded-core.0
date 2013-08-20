Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id E3D236B8D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 21:07:58 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e53so435013eek.41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 14:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HOdq43Qg+0RFOGR+4PwhFvJdttELhUMXVXRJKiDkIj8=;
	b=GPP6mZKfb7KEO68qN4FVIxdTYm3qVJonLP41FMxsa3Hnl8t5E7aBs1FHTkhHtLJegv
	yn4SwMbDNKzCXQlzYfOVxMQBdAgiMpA8i5X2PQr+iCNNukKxVa/OysEXXtMl0Tk5HXp8
	qBO8lD5toznC6JgcCBJyKlm7Bxd90R6H85/l6vHfXvQAO23lnQ/rqHUcTEYrFoOpKzGH
	RNLK8VLwVsps7gKJyOZft1YjjB/aUv2pBHzz7FF4hwC8t0jJVHBbLfiJfvozzcq9Xt1P
	YAjV9PsGescHqJ8Q+BZ/W6lhjNhHeEt1Ghgcye7s67dx5KGWvQFVhQaIAtd/1v3ZnpTa
	VNug==
X-Received: by 10.14.88.65 with SMTP id z41mr4452238eee.38.1377032878370;
	Tue, 20 Aug 2013 14:07:58 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	z12sm4827076eev.6.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 20 Aug 2013 14:07:57 -0700 (PDT)
Date: Tue, 20 Aug 2013 23:09:02 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Jonathan Liu <net147@gmail.com>
Message-ID: <20130820210902.GF522@jama>
References: <1376993441-15007-1-git-send-email-net147@gmail.com>
	<20130820102427.GE522@jama> <521347BF.7090507@gmail.com>
MIME-Version: 1.0
In-Reply-To: <521347BF.7090507@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mesa: enable additional drivers for gallium-llvm x86/x86-64
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
X-List-Received-Date: Tue, 20 Aug 2013 21:08:00 -0000
X-Groupsio-MsgNum: 43617
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wtjvnLv0o8UUzur2"
Content-Disposition: inline

--wtjvnLv0o8UUzur2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2013 at 08:41:03PM +1000, Jonathan Liu wrote:
> On 20/08/2013 8:24 PM, Martin Jansa wrote:
> > On Tue, Aug 20, 2013 at 08:10:41PM +1000, Jonathan Liu wrote:
> >> The additional Gallium drivers are needed for open source ATI Radeon
> >> and NVIDIA graphics drivers.
> >>
> >> The radeonsi and r600 drivers require LLVM 3.3 built with r600
> >> PACKAGECONFIG so they must be explicitly enabled by adding r600 to the
> >> mesa PACKAGECONFIG.
> > BTW: I just got interesting question about egl_gallium:
> >
> > libEGL warning: Could not open driver /usr/lib/egl/egl_gallium.so
> > (libLLVM-3.3.so: cannot open shared object file: No such file or
> > directory)
> > Could not initialize egl display
> >
> > EGL error
> > Aborted
> > root@qemux86:~# ls -alh /usr/lib/llvm3.3/
> > drwxr-xr-x    2 root     root        1.0K Aug 20 02:47 .
> > drwxr-xr-x   35 root     root       10.0K Aug 20 02:47 ..
> > -rwxr-xr-x    1 root     root       15.8M Aug 19 14:02 libLLVM-3.3.so
> > -rwxr-xr-x    1 root     root       78.2K Aug 19 14:02 libLTO.so
> > -rwxr-xr-x    1 root     root       10.1K Aug 19 14:02 libprofile_rt.so
> >
> > I don't know yet why it worked in my tests when I was updating mesa and
> > llvm, but it's true that we need to make sure that mesa finds
> > libLLVM-3.3.so in versioned subdirectory in runtime.
> LLVM has been working fine for me with llvmpipe (Intel GMA 3600 -=20
> PowerVR-based), radeon (ATI Radeon HD5450) and nouveau (NVIDIA ION=20
> GeForce 9400M) drivers.
>=20
> There is a symbolic link in /usr/lib:
> $ cd /usr/lib
> $ ls -l libLLVM-3.3.so
> lrwxrwxrwx 1 root root 22 Aug 19 21:03 libLLVM-3.3.so ->=20
> llvm3.3/libLLVM-3.3.so

But this one is from llvm3.3-dev package which isn't installed by
default, isn't it in your setup?

> I intend to submit xf86-video-ati and xf86-video-nouveau to=20
> meta-openembedded later this week. I tested this change using those=20
> recipes, linux-firmware (needed for ATI 3D acceleration) and the=20
> following kernel options:
> CONFIG_DRM_RADEON=3Dm
> CONFIG_DRM_RADEON_KMS=3Dy
> CONFIG_DRM_NOUVEAU=3Dy
>=20
> Regards,
> Jonathan
> >
> >> Signed-off-by: Jonathan Liu <net147@gmail.com>
> >> ---
> >>   meta/recipes-graphics/mesa/mesa.inc | 4 ++++
> >>   1 file changed, 4 insertions(+)
> >>
> >> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphi=
cs/mesa/mesa.inc
> >> index 447e186..e985d67 100644
> >> --- a/meta/recipes-graphics/mesa/mesa.inc
> >> +++ b/meta/recipes-graphics/mesa/mesa.inc
> >> @@ -50,6 +50,10 @@ PACKAGECONFIG[egl] =3D "--enable-egl --with-egl-pla=
tforms=3D${EGL_PLATFORMS}, --disa
> >>   PACKAGECONFIG[openvg] =3D "--enable-openvg, --disable-openvg"
> >>  =20
> >>   GALLIUMDRIVERS =3D "swrast"
> >> +GALLIUMDRIVERS_LLVM33 =3D "${@base_contains('PACKAGECONFIG', 'r600', =
'radeonsi,r600', '', d)}"
> >> +GALLIUMDRIVERS_LLVM =3D "r300,svga,nouveau${@base_version_less_or_equ=
al('MESA_LLVM_RELEASE', '3.2', '', ',${GALLIUMDRIVERS_LLVM33}', d)}"
> >> +GALLIUMDRIVERS_append_x86 =3D "${@base_contains('PACKAGECONFIG', 'gal=
lium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
> >> +GALLIUMDRIVERS_append_x86-64 =3D "${@base_contains('PACKAGECONFIG', '=
gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
> >>   # keep --with-gallium-drivers separate, because when only one of gal=
lium versions is enabled, other 2 were adding --without-gallium-drivers
> >>   PACKAGECONFIG[gallium]      =3D "--with-gallium-drivers=3D${GALLIUMD=
RIVERS}, --without-gallium-drivers"
> >>   PACKAGECONFIG[gallium-egl]  =3D "--enable-gallium-egl, --disable-gal=
lium-egl"
> >> --=20
> >> 1.8.3.4
> >>
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wtjvnLv0o8UUzur2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIT2u4ACgkQN1Ujt2V2gByj1wCfbO9UhGoi0yTZ3Grjng75HE/C
AFcAoIIqdRcVR+iLT9UOqfxntKB5K/u1
=060r
-----END PGP SIGNATURE-----

--wtjvnLv0o8UUzur2--
