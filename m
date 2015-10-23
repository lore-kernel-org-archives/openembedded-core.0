Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id E49036013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 17:41:29 +0000 (UTC)
Received: by pasz6 with SMTP id z6so123782756pas.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 10:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=vhof5R3zxqCSDL8XaZKq9x+1uom6wjnQi6S5xZKIOLk=;
	b=ci0bckDwEpIZbD0X1diZbZmbq5EyDkIAS2MmHLHvdmOIQoTdSVWbxl/vPhBfv+yzIM
	eECIH7YbZe1D6q9CUYVjTDJjsI0ZE7vZU6k5jqDpVzx0KhiWwVTCXSmI0VBDPgGJ9nFN
	f9KejlxhjFFePnn1biHwnwL98svHh6iX0K4wORUc/ao/VXFdNxin2NryQBi1ufg71lFQ
	LS+o5qxbtr3U+sddROKjTYzPhSVtmOTzYTqb8dQjqgjoat3W9xo83hlJeDxMRzpu/IcP
	cObRLgj6/lCpTIV5OrJCmUTrwsqGZFHrhtG88hRuzAuOKuwOQO8X0sTn4J8/3zqj1P/A
	lhOQ==
X-Received: by 10.66.144.169 with SMTP id sn9mr5440712pab.15.1445622089847;
	Fri, 23 Oct 2015 10:41:29 -0700 (PDT)
Received: from ?IPv6:2601:647:4c02:370d:a92e:f22c:14b6:b7ad?
	([2601:647:4c02:370d:a92e:f22c:14b6:b7ad])
	by smtp.gmail.com with ESMTPSA id
	ou3sm20039648pbb.44.2015.10.23.10.41.28
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Oct 2015 10:41:29 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.1 \(3096.4\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1445620987-11004-1-git-send-email-psidhu@gateworks.com>
Date: Fri, 23 Oct 2015 10:41:24 -0700
Message-Id: <08C9931A-D3D5-4A9D-B41A-0E6B72ABDFEF@gmail.com>
References: <1445620987-11004-1-git-send-email-psidhu@gateworks.com>
To: Pushpal Sidhu <psidhu@gateworks.com>
X-Mailer: Apple Mail (2.3096.4)
Cc: alexander.kanavin@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] webkitgtk: Add upstream patch to fix build problem
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
X-List-Received-Date: Fri, 23 Oct 2015 17:41:33 -0000
X-Groupsio-MsgNum: 72590
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DA0A51D9-B9D1-43D2-BFA9-F6F3EB943F1E";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_DA0A51D9-B9D1-43D2-BFA9-F6F3EB943F1E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Oct 23, 2015, at 10:23 AM, Pushpal Sidhu <psidhu@gateworks.com> =
wrote:
>=20
> =46rom upstream webkit: fd15a368fa73fe08d91cc1dd7ef05c0c5a3ae851
>=20
> Webkit will fail to compile under certain circumstances. Please see
> https://bugs.webkit.org/show_bug.cgi?id=3D149172 for more details.


this is ok to install.

>=20
> Signed-off-by: Pushpal Sidhu <psidhu@gateworks.com>
> ---
> ...ailure-with-ACCELERATED_2D_CANVAS-when-ca.patch | 35 =
++++++++++++++++++++++
> meta/recipes-sato/webkit/webkitgtk_2.8.5.bb        |  1 +
> 2 files changed, 36 insertions(+)
> create mode 100644 =
meta/recipes-sato/webkit/files/0002-GTK-Build-failure-with-ACCELERATED_2D_=
CANVAS-when-ca.patch
>=20
> diff --git =
a/meta/recipes-sato/webkit/files/0002-GTK-Build-failure-with-ACCELERATED_2=
D_CANVAS-when-ca.patch =
b/meta/recipes-sato/webkit/files/0002-GTK-Build-failure-with-ACCELERATED_2=
D_CANVAS-when-ca.patch
> new file mode 100644
> index 0000000..5d43e0f
> --- /dev/null
> +++ =
b/meta/recipes-sato/webkit/files/0002-GTK-Build-failure-with-ACCELERATED_2=
D_CANVAS-when-ca.patch
> @@ -0,0 +1,35 @@
> +=46rom 6ea42d4fa6f3f6dd18c37cb7b6e1faea6afefba4 Mon Sep 17 00:00:00 =
2001
> +From: "clopez@igalia.com" <clopez@igalia.com>
> +Date: Tue, 15 Sep 2015 21:50:18 +0000
> +Subject: [PATCH] [GTK] Build failure with ACCELERATED_2D_CANVAS when =
cairo-gl has
> + built with OpenGLESv2 support only.
> + https://bugs.webkit.org/show_bug.cgi?id=3D149172
> +
> +Reviewed by Martin Robinson.
> +
> +No new tests, no behavior change.
> +
> +* platform/graphics/glx/GLContextGLX.cpp:
> +(WebCore::GLContextGLX::cairoDevice):
> +
> +git-svn-id: http://svn.webkit.org/repository/webkit/trunk@189826 =
268f45cc-cd09-0410-ab3c-d52691b4dbfc
> +---
> + Source/WebCore/platform/graphics/glx/GLContextGLX.cpp | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Source/WebCore/platform/graphics/glx/GLContextGLX.cpp =
b/Source/WebCore/platform/graphics/glx/GLContextGLX.cpp
> +index 7890d8d..4ed3a43 100644
> +--- a/Source/WebCore/platform/graphics/glx/GLContextGLX.cpp
> ++++ b/Source/WebCore/platform/graphics/glx/GLContextGLX.cpp
> +@@ -266,7 +266,7 @@ cairo_device_t* GLContextGLX::cairoDevice()
> +     if (m_cairoDevice)
> +         return m_cairoDevice;
> +
> +-#if ENABLE(ACCELERATED_2D_CANVAS)
> ++#if ENABLE(ACCELERATED_2D_CANVAS) && CAIRO_HAS_GLX_FUNCTIONS
> +     m_cairoDevice =3D cairo_glx_device_create(sharedX11Display(), =
m_context);
> + #endif
> +
> +--
> +2.6.2
> +
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb =
b/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
> index e29666a..68634a9 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
> @@ -13,6 +13,7 @@ LIC_FILES_CHKSUM =3D =
"file://Source/JavaScriptCore/COPYING.LIB;md5=3Dd0c6d6397a5d842
> SRC_URI =3D "\
>   http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
>   =
file://0001-This-patch-fixes-a-command-line-that-is-too-long-ove.patch \
> +  =
file://0002-GTK-Build-failure-with-ACCELERATED_2D_CANVAS-when-ca.patch \
>   file://gcc5.patch \
>   "
> SRC_URI[md5sum] =3D "df79991848a5096d3a75289ebce547ae"
> --
> 2.6.2
>=20


--Apple-Mail=_DA0A51D9-B9D1-43D2-BFA9-F6F3EB943F1E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYqcUgACgkQuwUzVZGdMxREGQCfZJfSbTTgesJB70NLCniBSZ7/
+Y8AnjIo6yBMl3ddYgrEKo0tU0pLbbCH
=UiTB
-----END PGP SIGNATURE-----

--Apple-Mail=_DA0A51D9-B9D1-43D2-BFA9-F6F3EB943F1E--
