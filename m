Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVhkk-0005d9-1j
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 11:51:02 +0100
Received: by eekc1 with SMTP id c1so241802eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 02:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=U2zFu2VshfVyQgh9KgvlqG7Ezx1KGeUOiA+8+3ak6Os=;
	b=lbePT+b1Qji2KKcHY+9FAMq9YseqfyCc3ERxhN0d9IIphfdrQ/pL53HFODZhjcDTub
	iqaVQFfvVEfV+I8AIixuKlN2ai6RiZeqFFPvYTPU/3c5DitYCPOr4UpmV/LTpsJJA58t
	+SjQoo3aZKCJApc7Kf5lr5vVSnq3WvBljaiOM=
Received: by 10.14.12.14 with SMTP id 14mr208279eey.88.1322649862170;
	Wed, 30 Nov 2011 02:44:22 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 8sm4852160eei.8.2011.11.30.02.44.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 02:44:21 -0800 (PST)
Date: Wed, 30 Nov 2011 11:44:19 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111130104419.GC4799@jama.jama.net>
References: <cover.1322648566.git.xiaofeng.yan@windriver.com>
	<e5e2906ff7b536c1b3e09828ff2075812fc1d66e.1322648566.git.xiaofeng.yan@windriver.com>
MIME-Version: 1.0
In-Reply-To: <e5e2906ff7b536c1b3e09828ff2075812fc1d66e.1322648566.git.xiaofeng.yan@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 2/2] xserver-kdrive: update to 1.11.1.902
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
X-List-Received-Date: Wed, 30 Nov 2011 10:51:02 -0000
X-Groupsio-MsgNum: 13268
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RIYY1s2vRbPFwWeW"
Content-Disposition: inline

--RIYY1s2vRbPFwWeW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 30, 2011 at 06:33:20PM +0800, Xiaofeng Yan wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>=20
> I didn't remove the old one because it is possible for the new version to=
 \
> have some bugs during using or testing.

Just curious why this version exactly?
There is 1.11.2 release already (1.11.1.902 is 1.11.2 RC2) and there is
also RC1 for 1.11.3 or even 1.12 if we want to test RCs.

And Saul IIRC sent xserver-xorg upgrade to 1.11.2 so it would be nice to
use the same.

Cheers,

>=20
> Patches are commented by "#". Some of them are obsolete.
> keyboard-resume-workaround.patch is used in drive mode of keyboard
> crosscompile.patch is to avoid to seach "/etc/X11/fontpath.d" of host dur=
ing configuring of cross-compiling
> It is no use in the version.
>=20
> enable-xcalibrate.patch is to avoid error of compiling tslib. No use in t=
he new version.
> nodolt.patch is no use too.
>=20
> other patches are retained.
>=20
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
>  .../xorg-xserver/xserver-kdrive_1.11.1.902.bb      |   37 ++++++++++++++=
++++++
>  1 files changed, 37 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.1=
1.1.902.bb
>=20
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.11.1.902=
=2Ebb b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.11.1.902.bb
> new file mode 100644
> index 0000000..3980057
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.11.1.902.bb
> @@ -0,0 +1,37 @@
> +require xserver-kdrive.inc
> +
> +DEPENDS +=3D "libxkbfile libxcalibrate font-util pixman"
> +
> +RDEPENDS_${PN} +=3D "xkeyboard-config"
> +
> +EXTRA_OECONF +=3D "--disable-glx --enable-unit-tests=3Dno --enable-kdriv=
e-evdev=3Dyes"
> +
> +PE =3D "1"
> +PR =3D "r0"
> +
> +LIC_FILES_CHKSUM  =3D "file://COPYING;md5=3D74df27b6254cc88d2799b5f4f594=
9c00"
> +
> +SRC_URI =3D "${XORG_MIRROR}/individual/xserver/xorg-server-${PV}.tar.bz2=
 \
> +          file://extra-kmodes.patch \
> +		  file://disable-apm.patch \
> +		  file://no-serial-probing.patch \
> +		  file://keyboard-resume-workaround.patch \
> +		  file://hide-cursor-and-ppm-root.patch \
> +		  file://fbdev_xrandr_ioctl.patch \
> +		  file://fix-newer-xorg-headers.patch"
> +							       =20
> +#file://keyboard-resume-workaround.patch
> +#file://enable-xcalibrate.patch
> +#file://crosscompile.patch
> +#file://nodolt.patch
> +#file://kdrive-evdev.patch
> +#file://kdrive-use-evdev.patch
> +#file://enable-builtin-fonts.patch
> +#file://optional-xkb.patch
> +
> +SRC_URI[md5sum] =3D "87dd7958ace0509f6e4da2908c2ee4fd"
> +SRC_URI[sha256sum] =3D "06cb2dffb8d0182c539b154e412b25b98c75d0052cfb1676=
2e7af0d6bf23ec7b"
> +
> +
> +
> +S =3D "${WORKDIR}/xorg-server-${PV}"
> --=20
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RIYY1s2vRbPFwWeW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7WCQMACgkQN1Ujt2V2gBxgpACfcoju9CT3SrwEvT4DK4nNskG+
B1oAoJ5VM+4pre+x16eRAat5clbFLRBd
=eMPW
-----END PGP SIGNATURE-----

--RIYY1s2vRbPFwWeW--
