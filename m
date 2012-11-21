Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tb78T-0006NH-Sf
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 11:02:36 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so3794030eei.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2012 01:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FfEZidkSYxAhJhwkOeII3tMaZ+wvh5YVGrJWJVe93pk=;
	b=i8T4ux1AJYJiI6587gFQXXjiWVeK1U2YaFnOjosZ632KE60Y0MreyTqm+6jVK0bnHs
	0sHxms9ivgAUtpFBolPph6s0JdgbVfXPChUlV2vtftOCGwroUnf2MdFkkjusrm5wAb5Y
	X0uRyUBaaQQO7Vo4A+oBRbJyC1RE1kP/IYyJv9TvXBZWGMQ7w9JXycyebScpJKvOOB7u
	aIrTWsSKhrgqtL6Fsr7l/Wmo7SZTpEez30rT1I4byo3YP1En3YaOXj7wHYjE8SY3Kils
	a5rJ/K0O+Ptj9z4i4EmQRg15Lm1rdVtJqk0lgM1drCfK95lKXGJl1DuDEHDuZQH7mwzS
	PrlA==
Received: by 10.14.221.8 with SMTP id q8mr43526486eep.28.1353491301115;
	Wed, 21 Nov 2012 01:48:21 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e2sm5291501eeo.8.2012.11.21.01.48.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Nov 2012 01:48:19 -0800 (PST)
Date: Wed, 21 Nov 2012 10:48:15 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Denis 'GNUtoo' Carikli <gnutoo@no-log.org>
Message-ID: <20121121094815.GI12637@jama.jama.net>
References: <cover.1352808309.git.laurentiu.palcu@intel.com>
	<0793c2728cde3530f6d21c865aa017bb00007de5.1352808309.git.laurentiu.palcu@intel.com>
	<20121113151134.3407091b@gnutoo-desktop>
MIME-Version: 1.0
In-Reply-To: <20121113151134.3407091b@gnutoo-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 12/12] xf86-video-omapfb: upgrade to 0.4.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Nov 2012 10:02:36 -0000
X-Groupsio-MsgNum: 31596
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9s922KAXlWjPfK/Q"
Content-Disposition: inline

--9s922KAXlWjPfK/Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 13, 2012 at 03:11:34PM +0100, Denis 'GNUtoo' Carikli wrote:
> On Tue, 13 Nov 2012 14:18:29 +0200
> Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
>=20
> > Other changes:
> >  * changed the recipe's SRC_URI to track the new (maintained) repo;
> >  * removed all old patches as the latest driver's structure has
> > changed drastically;
> >  * license file changed quite a bit: MIT -> GPLv2 (needs to be
> > reviewed by somebody with a better understanding of these things
> > though);
> >  * xf86-video-omapfb changed its name to xf86-video-omap: change the
> >    recipe name and config files accordingly;
> >  * add dependency of libdrm-omap;
> >=20
> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> > ---
> >  meta-yocto-bsp/conf/machine/beagleboard.conf       |    2 +-
> >  ...-video-omapfb_git.bb =3D> xf86-video-omap_git.bb} |   23
> > ++++++++------------ .../target/arch/arm/conf/machine/{{=3Dmachine}}.co=
nf
> > |    2 +- 3 files changed, 11 insertions(+), 16 deletions(-)
> >  rename meta/recipes-graphics/xorg-driver/{xf86-video-omapfb_git.bb
> > =3D> xf86-video-omap_git.bb} (43%)
> >=20
> > diff --git a/meta-yocto-bsp/conf/machine/beagleboard.conf
> > b/meta-yocto-bsp/conf/machine/beagleboard.conf index 6633880..204be95
> > 100644 --- a/meta-yocto-bsp/conf/machine/beagleboard.conf
> > +++ b/meta-yocto-bsp/conf/machine/beagleboard.conf
> > @@ -6,7 +6,7 @@ PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-xorg"
> >  XSERVER ?=3D "xserver-xorg \
> >             xf86-input-evdev \
> >             xf86-input-mouse \
> > -           xf86-video-omapfb \
> > +           xf86-video-omap \
> >             xf86-input-keyboard"
> Since xf86-video-omap is a totally different driver and depend on:
> * omap DRM video driver that is in staging only in recent kernels.
> * enabling the omap DRM in the board file(providing you don't use
>   device tree), which is not straingtforward(there are tricks required).
> * omap enabled in libdrm.
>=20
> Could you instead make a new xf86-video-omap recipe instead of
> modifying the xf86-video-omapfb one?

Btw xf86-video-omapfb does not support xserver-1.13 video API.

Someone needs to port
http://cgit.freedesktop.org/xorg/driver/xf86-video-omap/commit/?id=3D0615ee=
8cd73068332879695cbdf662cf5b9b597c
to xf86-video-omapfb or merge missing functionality from omapfb to omap
driver.

I've similar patch to fix xf86-video-glamo in meta-oe, but cannot test
it in runtime until we fix SIGILL in systemd dbus on armv4t
http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-November/04229=
8.html

Cheers,

>=20
> Note that xf86-video-omap should support rotation(xrandr -o 1) for
> omap4 (from #xorg-devel ) :
> Oct 22 00:52:32 <robclark>      it supports rotation, but only on
> omap4..
>=20
> (I know all that because I tried to make it work on the GTA04 machine,
> to have rotation but at the end I discovered that the rotation was
> only for omap4(because the rotation is based on tiler), so I
> abandoned.).
>=20
> Denis.
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9s922KAXlWjPfK/Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCso18ACgkQN1Ujt2V2gBzbUACfdIoc/+08KgDcNxe0UVPfTbUF
RswAoKj9bG9sJvBK+Tikd1a8L8CmkjU/
=vUT+
-----END PGP SIGNATURE-----

--9s922KAXlWjPfK/Q--
