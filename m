Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Swyzw-0006u7-H4
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 19:15:44 +0200
Received: by wgbdr1 with SMTP id dr1so7328607wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 10:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9KIP5P8ITtAnokZozvm5lbdqfyxdObESoeSfEAbFx3U=;
	b=JWcQ+aQchjn++wTm5Lq5m8dvcFM5XAgzQvdx9lCmUo43p+TeUcfS9Ox2A23QMCRuAf
	TOtLlgmh1Jlr2S3RdJPolYBQVkStuJ6BowYVESmD+dLw/NG904krReQJ3YDuaxQ9p3CJ
	dO2pwgM3rv+8tjaWnaNcodieNzd5h9VyVOQtmv/prQMfkH2cNlounu47T4c7XCJdzz7o
	NlBBJYq5jRO9uwA/N7MA9lY9YTroDFTnx5i8bHYtSYYl4XEzx7737vQ3igZ79GjaxNcC
	hkp+oD4e2exMZyN+a/Q7k68erx9F3iKU8+QcFhDM/L5ufxbDau0GzSjzTeKOIXiDOsB9
	Qp9w==
Received: by 10.180.103.136 with SMTP id fw8mr6214294wib.20.1343927044893;
	Thu, 02 Aug 2012 10:04:04 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ef5sm18553305wib.3.2012.08.02.10.04.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 10:04:03 -0700 (PDT)
Date: Thu, 2 Aug 2012 19:04:01 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120802170401.GX16306@jama.jama.net>
References: <cover.1343926021.git.ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1343926021.git.ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH V3 00/11] Mesa upgrade/improvements
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
X-List-Received-Date: Thu, 02 Aug 2012 17:15:44 -0000
X-Groupsio-MsgNum: 26829
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GdlkuMH+DRYbUHkj"
Content-Disposition: inline

--GdlkuMH+DRYbUHkj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 02, 2012 at 05:48:54PM +0100, Ross Burton wrote:
> Re-arranged and fixed up some problems.
>=20
> The following changes since commit 62d42fe3cfa575cb97b484ccf7b2e9a25cc507=
70:
>=20
>   tiny-init: Setup /dev/ptmx in init (2012-08-01 23:11:18 +0100)
>=20
> are available in the git repository at:
>=20
>   git://git.yoctoproject.org/poky-contrib ross/mesa
>=20
> for you to fetch changes up to 5de29e150a720ccb8749362cfe5fb56f234fb385:
>=20
>   mesa: enable EGL, with DRM and X11 platforms (2012-08-02 17:43:18 +0100)

I haven't even build tested it yet, but looks good to me, thanks for
implementing those comments.

Cheers,

>=20
> ----------------------------------------------------------------
> Damien Lespiau (2):
>       mesa: Update to 8.0.4 (latest stable version)
>       mesa: Use 'require' instead of 'include'
>=20
> Ross Burton (9):
>       mesa: no need to depend on python-native, the class does that
>       mesa: format the packages list nicely
>       mesa: move glu.pc to libglu-dev
>       mesa: add --enable-shared-glapi, and package it in libglapi
>       mesa: enable the Graphic Buffer Manager library
>       mesa: enable GLES v1 and v2
>       mesa-demos: fix GLES2 build
>       mesa: respect x11 DISTRO_FEATURE
>       mesa: enable EGL, with DRM and X11 platforms
>=20
>  .../mesa/{mesa-7.11.inc =3D> mesa-8.0.4.inc}         |   14 +++---
>  meta/recipes-graphics/mesa/mesa-common.inc         |   43 +++++++++++---=
--
>  .../mesa/mesa-demos/gles2-info.patch               |   15 ++++++
>  meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb     |    5 +-
>  ...ative_7.11.bb =3D> mesa-dri-glsl-native_8.0.4.bb} |    4 +-
>  meta/recipes-graphics/mesa/mesa-dri.inc            |   12 ++++-
>  meta/recipes-graphics/mesa/mesa-dri_7.11.bb        |    4 --
>  meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb       |    4 ++
>  meta/recipes-graphics/mesa/mesa-dri_git.bb         |    6 +--
>  meta/recipes-graphics/mesa/mesa-git.inc            |   11 +++--
>  meta/recipes-graphics/mesa/mesa-xlib_7.11.bb       |    5 --
>  meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb      |    5 ++
>  meta/recipes-graphics/mesa/mesa-xlib_git.bb        |    6 +--
>  .../mesa/mesa/0001-Compile-with-uclibc.patch       |   52 ++++++++++++++=
++++++
>  ...ossfix-mklib.patch =3D> 0002-cross-compile.patch} |   39 ++++++++++++=
---
>  ...sa_fix_for_x32.patch =3D> 0003-fix-for-x32.patch} |   30 +++++++----
>  ...-gross-hack-to-prevent-from-install-libgl.patch |   29 +++++++++++
>  meta/recipes-graphics/mesa/mesa/crossfix.patch     |   18 -------
>  meta/recipes-graphics/mesa/mesa/uclibc.patch       |   42 --------------=
--
>  19 files changed, 222 insertions(+), 122 deletions(-)
>  rename meta/recipes-graphics/mesa/{mesa-7.11.inc =3D> mesa-8.0.4.inc} (6=
0%)
>  create mode 100644 meta/recipes-graphics/mesa/mesa-demos/gles2-info.patch
>  rename meta/recipes-graphics/mesa/{mesa-dri-glsl-native_7.11.bb =3D> mes=
a-dri-glsl-native_8.0.4.bb} (84%)
>  delete mode 100644 meta/recipes-graphics/mesa/mesa-dri_7.11.bb
>  create mode 100644 meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb
>  delete mode 100644 meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
>  create mode 100644 meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb
>  create mode 100644 meta/recipes-graphics/mesa/mesa/0001-Compile-with-ucl=
ibc.patch
>  rename meta/recipes-graphics/mesa/mesa/{crossfix-mklib.patch =3D> 0002-c=
ross-compile.patch} (68%)
>  rename meta/recipes-graphics/mesa/mesa/{mesa_fix_for_x32.patch =3D> 0003=
-fix-for-x32.patch} (59%)
>  create mode 100644 meta/recipes-graphics/mesa/mesa/0004-gross-hack-to-pr=
event-from-install-libgl.patch
>  delete mode 100644 meta/recipes-graphics/mesa/mesa/crossfix.patch
>  delete mode 100644 meta/recipes-graphics/mesa/mesa/uclibc.patch
>=20
> Damien Lespiau (2):
>   mesa: Update to 8.0.4 (latest stable version)
>   mesa: Use 'require' instead of 'include'
>=20
> Ross Burton (9):
>   mesa: no need to depend on python-native, the class does that
>   mesa: format the packages list nicely
>   mesa: move glu.pc to libglu-dev
>   mesa: add --enable-shared-glapi, and package it in libglapi
>   mesa: enable the Graphic Buffer Manager library
>   mesa: enable GLES v1 and v2
>   mesa-demos: fix GLES2 build
>   mesa: respect x11 DISTRO_FEATURE
>   mesa: enable EGL, with DRM and X11 platforms
>=20
>  .../mesa/{mesa-7.11.inc =3D> mesa-8.0.4.inc}         |   14 +++---
>  meta/recipes-graphics/mesa/mesa-common.inc         |   43 +++++++++++---=
--
>  .../mesa/mesa-demos/gles2-info.patch               |   15 ++++++
>  meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb     |    5 +-
>  ...ative_7.11.bb =3D> mesa-dri-glsl-native_8.0.4.bb} |    4 +-
>  meta/recipes-graphics/mesa/mesa-dri.inc            |   12 ++++-
>  meta/recipes-graphics/mesa/mesa-dri_7.11.bb        |    4 --
>  meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb       |    4 ++
>  meta/recipes-graphics/mesa/mesa-dri_git.bb         |    6 +--
>  meta/recipes-graphics/mesa/mesa-git.inc            |   11 +++--
>  meta/recipes-graphics/mesa/mesa-xlib_7.11.bb       |    5 --
>  meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb      |    5 ++
>  meta/recipes-graphics/mesa/mesa-xlib_git.bb        |    6 +--
>  .../mesa/mesa/0001-Compile-with-uclibc.patch       |   52 ++++++++++++++=
++++++
>  ...ossfix-mklib.patch =3D> 0002-cross-compile.patch} |   39 ++++++++++++=
---
>  ...sa_fix_for_x32.patch =3D> 0003-fix-for-x32.patch} |   30 +++++++----
>  ...-gross-hack-to-prevent-from-install-libgl.patch |   29 +++++++++++
>  meta/recipes-graphics/mesa/mesa/crossfix.patch     |   18 -------
>  meta/recipes-graphics/mesa/mesa/uclibc.patch       |   42 --------------=
--
>  19 files changed, 222 insertions(+), 122 deletions(-)
>  rename meta/recipes-graphics/mesa/{mesa-7.11.inc =3D> mesa-8.0.4.inc} (6=
0%)
>  create mode 100644 meta/recipes-graphics/mesa/mesa-demos/gles2-info.patch
>  rename meta/recipes-graphics/mesa/{mesa-dri-glsl-native_7.11.bb =3D> mes=
a-dri-glsl-native_8.0.4.bb} (84%)
>  delete mode 100644 meta/recipes-graphics/mesa/mesa-dri_7.11.bb
>  create mode 100644 meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb
>  delete mode 100644 meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
>  create mode 100644 meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb
>  create mode 100644 meta/recipes-graphics/mesa/mesa/0001-Compile-with-ucl=
ibc.patch
>  rename meta/recipes-graphics/mesa/mesa/{crossfix-mklib.patch =3D> 0002-c=
ross-compile.patch} (68%)
>  rename meta/recipes-graphics/mesa/mesa/{mesa_fix_for_x32.patch =3D> 0003=
-fix-for-x32.patch} (59%)
>  create mode 100644 meta/recipes-graphics/mesa/mesa/0004-gross-hack-to-pr=
event-from-install-libgl.patch
>  delete mode 100644 meta/recipes-graphics/mesa/mesa/crossfix.patch
>  delete mode 100644 meta/recipes-graphics/mesa/mesa/uclibc.patch
>=20
> --=20
> 1.7.10
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GdlkuMH+DRYbUHkj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAaswEACgkQN1Ujt2V2gBzetACcDyDlX4Nrx2/5JKzkdneCSMgE
wh8An2lQ8X3rda69uxYz3eO7yEEU3nQN
=Dm47
-----END PGP SIGNATURE-----

--GdlkuMH+DRYbUHkj--
