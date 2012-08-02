Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Sx0T7-0008Fx-Qr
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 20:49:57 +0200
Received: by eaad12 with SMTP id d12so1052351eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 11:38:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=ma+ywn5SODoLn5DaEIbfYy318wmMp6wJ0zPGU0R4qRA=;
	b=WANEoCQGjaZair05cxVdYurNeVkHoiTWn9Ukui+bFUfpwsSsLhiF+nmr/kKSBL5S2C
	MqQPsRNmrLAR0fIz8//HTPiJqtBfe6xSwTH1RSlYMvNBgO+bcTyr5RzgNXgTRrTDU6qG
	Lzjk273ywKqiQ132oY5zX2fZ0ZkGAP11/G7JgzwDe+MrXHKHpMSo8Tzrbfw+yLCcaXQM
	6XY6V6SiosJldBVUrPDlnapCa//57BxwdvGIE1/YnQU4iZw/PfbwTOTUgBgi/jKdFroa
	c0QpyHmaBPHaEbmLP7Vj5O0vWNfJCxqi5+D5njXSMtjsG28BPXaHTE1tjxAu+eUeOMrO
	Ihow==
Received: by 10.14.207.9 with SMTP id m9mr2326155eeo.5.1343932695596;
	Thu, 02 Aug 2012 11:38:15 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id j4sm19526734eeo.11.2012.08.02.11.38.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 11:38:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1343926021.git.ross.burton@intel.com>
Date: Thu, 2 Aug 2012 20:38:12 +0200
Message-Id: <94E6EEF2-BA2A-4B68-A9CB-98133061274E@dominion.thruhere.net>
References: <cover.1343926021.git.ross.burton@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQkdu5ZhkKsYFbWARzlQ/lmxf6x3/tk5BnxkxOHVqMkCuHJ0xeQOa0yffl7deVvpjw0tsSAl
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
X-List-Received-Date: Thu, 02 Aug 2012 18:49:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 2 aug. 2012, om 18:48 heeft Ross Burton <ross.burton@intel.com> het =
volgende geschreven:

> Re-arranged and fixed up some problems.

This will still break every platform with a binary libegl and libgles.

>=20
> The following changes since commit =
62d42fe3cfa575cb97b484ccf7b2e9a25cc50770:
>=20
>  tiny-init: Setup /dev/ptmx in init (2012-08-01 23:11:18 +0100)
>=20
> are available in the git repository at:
>=20
>  git://git.yoctoproject.org/poky-contrib ross/mesa
>=20
> for you to fetch changes up to =
5de29e150a720ccb8749362cfe5fb56f234fb385:
>=20
>  mesa: enable EGL, with DRM and X11 platforms (2012-08-02 17:43:18 =
+0100)
>=20
> ----------------------------------------------------------------
> Damien Lespiau (2):
>      mesa: Update to 8.0.4 (latest stable version)
>      mesa: Use 'require' instead of 'include'
>=20
> Ross Burton (9):
>      mesa: no need to depend on python-native, the class does that
>      mesa: format the packages list nicely
>      mesa: move glu.pc to libglu-dev
>      mesa: add --enable-shared-glapi, and package it in libglapi
>      mesa: enable the Graphic Buffer Manager library
>      mesa: enable GLES v1 and v2
>      mesa-demos: fix GLES2 build
>      mesa: respect x11 DISTRO_FEATURE
>      mesa: enable EGL, with DRM and X11 platforms
>=20
> .../mesa/{mesa-7.11.inc =3D> mesa-8.0.4.inc}         |   14 +++---
> meta/recipes-graphics/mesa/mesa-common.inc         |   43 =
+++++++++++-----
> .../mesa/mesa-demos/gles2-info.patch               |   15 ++++++
> meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb     |    5 +-
> ...ative_7.11.bb =3D> mesa-dri-glsl-native_8.0.4.bb} |    4 +-
> meta/recipes-graphics/mesa/mesa-dri.inc            |   12 ++++-
> meta/recipes-graphics/mesa/mesa-dri_7.11.bb        |    4 --
> meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb       |    4 ++
> meta/recipes-graphics/mesa/mesa-dri_git.bb         |    6 +--
> meta/recipes-graphics/mesa/mesa-git.inc            |   11 +++--
> meta/recipes-graphics/mesa/mesa-xlib_7.11.bb       |    5 --
> meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb      |    5 ++
> meta/recipes-graphics/mesa/mesa-xlib_git.bb        |    6 +--
> .../mesa/mesa/0001-Compile-with-uclibc.patch       |   52 =
++++++++++++++++++++
> ...ossfix-mklib.patch =3D> 0002-cross-compile.patch} |   39 =
++++++++++++---
> ...sa_fix_for_x32.patch =3D> 0003-fix-for-x32.patch} |   30 =
+++++++----
> ...-gross-hack-to-prevent-from-install-libgl.patch |   29 +++++++++++
> meta/recipes-graphics/mesa/mesa/crossfix.patch     |   18 -------
> meta/recipes-graphics/mesa/mesa/uclibc.patch       |   42 =
----------------
> 19 files changed, 222 insertions(+), 122 deletions(-)
> rename meta/recipes-graphics/mesa/{mesa-7.11.inc =3D> mesa-8.0.4.inc} =
(60%)
> create mode 100644 =
meta/recipes-graphics/mesa/mesa-demos/gles2-info.patch
> rename meta/recipes-graphics/mesa/{mesa-dri-glsl-native_7.11.bb =3D> =
mesa-dri-glsl-native_8.0.4.bb} (84%)
> delete mode 100644 meta/recipes-graphics/mesa/mesa-dri_7.11.bb
> create mode 100644 meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb
> delete mode 100644 meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
> create mode 100644 meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb
> create mode 100644 =
meta/recipes-graphics/mesa/mesa/0001-Compile-with-uclibc.patch
> rename meta/recipes-graphics/mesa/mesa/{crossfix-mklib.patch =3D> =
0002-cross-compile.patch} (68%)
> rename meta/recipes-graphics/mesa/mesa/{mesa_fix_for_x32.patch =3D> =
0003-fix-for-x32.patch} (59%)
> create mode 100644 =
meta/recipes-graphics/mesa/mesa/0004-gross-hack-to-prevent-from-install-li=
bgl.patch
> delete mode 100644 meta/recipes-graphics/mesa/mesa/crossfix.patch
> delete mode 100644 meta/recipes-graphics/mesa/mesa/uclibc.patch
>=20
> Damien Lespiau (2):
>  mesa: Update to 8.0.4 (latest stable version)
>  mesa: Use 'require' instead of 'include'
>=20
> Ross Burton (9):
>  mesa: no need to depend on python-native, the class does that
>  mesa: format the packages list nicely
>  mesa: move glu.pc to libglu-dev
>  mesa: add --enable-shared-glapi, and package it in libglapi
>  mesa: enable the Graphic Buffer Manager library
>  mesa: enable GLES v1 and v2
>  mesa-demos: fix GLES2 build
>  mesa: respect x11 DISTRO_FEATURE
>  mesa: enable EGL, with DRM and X11 platforms
>=20
> .../mesa/{mesa-7.11.inc =3D> mesa-8.0.4.inc}         |   14 +++---
> meta/recipes-graphics/mesa/mesa-common.inc         |   43 =
+++++++++++-----
> .../mesa/mesa-demos/gles2-info.patch               |   15 ++++++
> meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb     |    5 +-
> ...ative_7.11.bb =3D> mesa-dri-glsl-native_8.0.4.bb} |    4 +-
> meta/recipes-graphics/mesa/mesa-dri.inc            |   12 ++++-
> meta/recipes-graphics/mesa/mesa-dri_7.11.bb        |    4 --
> meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb       |    4 ++
> meta/recipes-graphics/mesa/mesa-dri_git.bb         |    6 +--
> meta/recipes-graphics/mesa/mesa-git.inc            |   11 +++--
> meta/recipes-graphics/mesa/mesa-xlib_7.11.bb       |    5 --
> meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb      |    5 ++
> meta/recipes-graphics/mesa/mesa-xlib_git.bb        |    6 +--
> .../mesa/mesa/0001-Compile-with-uclibc.patch       |   52 =
++++++++++++++++++++
> ...ossfix-mklib.patch =3D> 0002-cross-compile.patch} |   39 =
++++++++++++---
> ...sa_fix_for_x32.patch =3D> 0003-fix-for-x32.patch} |   30 =
+++++++----
> ...-gross-hack-to-prevent-from-install-libgl.patch |   29 +++++++++++
> meta/recipes-graphics/mesa/mesa/crossfix.patch     |   18 -------
> meta/recipes-graphics/mesa/mesa/uclibc.patch       |   42 =
----------------
> 19 files changed, 222 insertions(+), 122 deletions(-)
> rename meta/recipes-graphics/mesa/{mesa-7.11.inc =3D> mesa-8.0.4.inc} =
(60%)
> create mode 100644 =
meta/recipes-graphics/mesa/mesa-demos/gles2-info.patch
> rename meta/recipes-graphics/mesa/{mesa-dri-glsl-native_7.11.bb =3D> =
mesa-dri-glsl-native_8.0.4.bb} (84%)
> delete mode 100644 meta/recipes-graphics/mesa/mesa-dri_7.11.bb
> create mode 100644 meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb
> delete mode 100644 meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
> create mode 100644 meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb
> create mode 100644 =
meta/recipes-graphics/mesa/mesa/0001-Compile-with-uclibc.patch
> rename meta/recipes-graphics/mesa/mesa/{crossfix-mklib.patch =3D> =
0002-cross-compile.patch} (68%)
> rename meta/recipes-graphics/mesa/mesa/{mesa_fix_for_x32.patch =3D> =
0003-fix-for-x32.patch} (59%)
> create mode 100644 =
meta/recipes-graphics/mesa/mesa/0004-gross-hack-to-prevent-from-install-li=
bgl.patch
> delete mode 100644 meta/recipes-graphics/mesa/mesa/crossfix.patch
> delete mode 100644 meta/recipes-graphics/mesa/mesa/uclibc.patch
>=20
> --=20
> 1.7.10
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



