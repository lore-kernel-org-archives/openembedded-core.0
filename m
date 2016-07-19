Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id ECCC260290
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 12:52:46 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i5so2733990wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 05:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=10d220ogBY05s7ZOjAgF8a17ifjuHEia+SUZ6Pa4GC0=;
	b=kxPtyDeNsq3batZleWzTg4v8376Lnc6ObHPR2Rx6wUyNIWqB/r6ZxmhmLr0j7TQOxI
	s+7AyQfs/x7b+zrNLuIgbp/jMKR3qVbx1MtIr6Mg6h5nivLLHLIGH1OG4CyCH1dHux20
	s4cSZhVfJIDapa3MMh1F0lfziquSfScqqxbAFY7pNvWbYEWwjbCMUObgkozbLaomHi+M
	9arfniwImVkmK/2Z4nlfI6ZOMC1TzBSpV5doxLZiBhVKlKHOy5RZ+EA5y8zjri3293cC
	wAHOW/8yyt7vZxp5lQzUKBuSrleK8YPl1ElBQ4LjQR6OxunKar6brBboPq/ffobgcQ7/
	O8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=10d220ogBY05s7ZOjAgF8a17ifjuHEia+SUZ6Pa4GC0=;
	b=gnebl6ptuDcMTkVS81axw363EihsReUcqDjpd+UBXrNWmLU/ry4V5l8GgIPGyjiizG
	7Wpn1HifHuGZwfvF/7ttm24LpWsSqCpVSA7GgTdKztrESRMh52dAdPEGUNh8O6lxPtsE
	v7RGbRto69wioLRy7AUz+hsJcOQBwNv83n1n60+pKT3WQJ1zqBDOPZ5BjM4lTfw+wca+
	5BPMbh+hviVNHbrIWe62IWe29tqLwypuIZ8GVSGAfTaK3YSYSVCMtpPDgg6ca1z6/rKh
	3zH9O2UC97XxzUhVWWUmEMZ9RrxRQi3+SSKc7xs3HNEAJMt7N8xG1Q3P4EtaiUbKGG6a
	6rxg==
X-Gm-Message-State: ALyK8tL0efsqrwauyS2iaSSoDjFuXkt7+Muye/2/dTSvUQKFDXuVNLSKPt9ZwqoUwSPCLA==
X-Received: by 10.28.225.4 with SMTP id y4mr4231944wmg.98.1468932766487;
	Tue, 19 Jul 2016 05:52:46 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	r13sm4224599wmf.12.2016.07.19.05.52.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 19 Jul 2016 05:52:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 19 Jul 2016 14:52:48 +0200
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Message-ID: <20160719125248.vjqp4yovtl3xubqs@jama>
References: <cover.1468310468.git.jussi.kukkonen@intel.com>
	<1468930595-24113-1-git-send-email-jussi.kukkonen@intel.com>
MIME-Version: 1.0
In-Reply-To: <1468930595-24113-1-git-send-email-jussi.kukkonen@intel.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] piglit: Add build fix patch
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
X-List-Received-Date: Tue, 19 Jul 2016 12:52:49 -0000
X-Groupsio-MsgNum: 84676
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5bddh7s6r5xqijf7"
Content-Disposition: inline

--5bddh7s6r5xqijf7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 19, 2016 at 03:16:35PM +0300, Jussi Kukkonen wrote:
> Fixes [YOCTO #9851] (fingers crossed).
>=20
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>=20
> This is a potential build fix for a problem Martin reported that I
> couldn't reproduce myself.

I'm sorry I haven't replied in the ticket yet, it's because my jenkins
build servers are down for last 18 days, because of some power failure
in datacenter where they are hosted, so I haven't executed any builds in
last 3 weeks and don't know when I'll be able to return to it.

+Tom who may provide some updated info about that datacenter issue

> I've pushed this on top of the piglit branch that isn't yet merged.
>=20
>   git://git.yoctoproject.org/poky-contrib jku/piglit
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Djku/piglit
>=20
> Thanks,=20
>   Jussi
>=20
>=20
>  create mode 100644 meta/recipes-graphics/piglit/piglit/0001-cmake-Link-u=
tils-with-xcb-explicitly.patch
>=20
> diff --git a/meta/recipes-graphics/piglit/piglit/0001-cmake-Link-utils-wi=
th-xcb-explicitly.patch b/meta/recipes-graphics/piglit/piglit/0001-cmake-Li=
nk-utils-with-xcb-explicitly.patch
> new file mode 100644
> index 0000000..d591da5
> --- /dev/null
> +++ b/meta/recipes-graphics/piglit/piglit/0001-cmake-Link-utils-with-xcb-=
explicitly.patch
> @@ -0,0 +1,54 @@
> +From 73e4fbc5777eddd89bb0fb16e90343551fe3e0ef Mon Sep 17 00:00:00 2001
> +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +Date: Tue, 5 Jul 2016 10:56:23 +0300
> +Subject: [PATCH] cmake: Link utils with xcb explicitly
> +
> +Linking with g++ can reportedly lead to:
> +
> +libpiglitutil_gl.so.0: error: undefined reference to 'xcb_connect'
> +libpiglitutil_gl.so.0: error: undefined reference to 'xcb_get_setup'
> +libpiglitutil_gl.so.0: error: undefined reference to 'xcb_setup_roots_it=
erator'
> +
> +This may have appeared now because xcb-dri2 used to overlink publicly
> +but now does not.
> +
> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +Upstream-Status: Pending
> +---
> + CMakeLists.txt            | 1 +
> + tests/util/CMakeLists.txt | 2 ++
> + 2 files changed, 3 insertions(+)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 8e2abba..2e1a473 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -151,6 +151,7 @@ IF(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
> +=20
> + 	pkg_check_modules(LIBDRM QUIET libdrm)
> + 	pkg_check_modules(LIBDRM_INTEL QUIET libdrm_intel)
> ++	pkg_check_modules(XCB QUIET xcb)
> + 	pkg_check_modules(XCB_DRI2 QUIET xcb-dri2)
> + 	pkg_check_modules(GLPROTO QUIET glproto)
> + ELSEIF(${CMAKE_SYSTEM_NAME} MATCHES "Windows")
> +diff --git a/tests/util/CMakeLists.txt b/tests/util/CMakeLists.txt
> +index fb22ffa..e1f8073 100644
> +--- a/tests/util/CMakeLists.txt
> ++++ b/tests/util/CMakeLists.txt
> +@@ -121,11 +121,13 @@ if(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
> +=20
> + 		list(APPEND UTIL_GL_LIBS
> + 			${LIBDRM_LDFLAGS}
> ++			${XCB_LDFLAGS}
> + 			${XCB_DRI2_LDFLAGS}
> + 		)
> +=20
> + 		list(APPEND UTIL_GL_INCLUDES
> + 			${LIBDRM_INCLUDE_DIRS}
> ++			${XCB_INCLUDE_DIRS}
> + 			${XCB_DRI2_INCLUDE_DIRS}
> + 		)
> +=20
> +--=20
> +2.1.4
> +
> diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-gr=
aphics/piglit/piglit_git.bb
> index f5ef364..f14a7b4 100644
> --- a/meta/recipes-graphics/piglit/piglit_git.bb
> +++ b/meta/recipes-graphics/piglit/piglit_git.bb
> @@ -4,6 +4,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db2beded7103a3d=
8a442a2a0391d607b0"
> =20
>  SRC_URI =3D "git://anongit.freedesktop.org/piglit \
>             file://0001-cmake-install-bash-completions-in-the-right-place=
=2Epatch \
> +           file://0001-cmake-Link-utils-with-xcb-explicitly.patch \
>             "
> =20
>  # From 2016-07-07
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5bddh7s6r5xqijf7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAleOIp8ACgkQN1Ujt2V2gBxIhwCfeV3HU+rsA9RWXuXKVjdhz6Qp
CHIAn38V30EgdNxdHzEA+hkb33DzOhPo
=2eMz
-----END PGP SIGNATURE-----

--5bddh7s6r5xqijf7--
