Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SSb0h-0002pR-Bn
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 23:34:55 +0200
Received: by eekd49 with SMTP id d49so530671eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 14:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=bJPoIR+cqPGPtK9Z86PI521+2jk9SxDqhBYSCWyOiJ4=;
	b=TIhiN5ejl6pS1PyH8yk6+AeRd0BZ0P8XNXbQVelAZ6Bs7pyp0pF5ymEy8RNBTgnIYZ
	H3PjV7g0sPUDl+le/DamLWQ3auNfU6b4qTs+qLkeqzqmf1DYVQEiEgV32BOYGmkaN0EA
	I69p4TSTQmF13xxUmg+b/c7j0xV0p9faeI9Bk7vFqUbMt1SuIfFe1vY50Ao4G2ddwHNh
	m5B5G/u1eN8XZro7b4V52oZPYJQzlTG07yRmQI+bkxiE4aqH9+ZoLJDGDXsOwjeTmfLO
	4d9IxOjIKGMXZ/hJRzb3dsJ98EaQactC1FwkG2tpZX1ELEtb+e5TAt3zBO4iH4xzIzhd
	37qw==
Received: by 10.213.115.193 with SMTP id j1mr1763296ebq.141.1336685100475;
	Thu, 10 May 2012 14:25:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Thu, 10 May 2012 14:24:30 -0700 (PDT)
In-Reply-To: <1336684128-29514-1-git-send-email-cazfi74@gmail.com>
References: <1336684128-29514-1-git-send-email-cazfi74@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 May 2012 14:24:30 -0700
Message-ID: <CAMKF1srWO69M=MOa4_ar8oO55fkaofzSHj_UAsRaVL+-dzEXNw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] expat: update to upstream version 2.1.0
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
X-List-Received-Date: Thu, 10 May 2012 21:34:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 10, 2012 at 2:08 PM, Marko Lindqvist <cazfi74@gmail.com> wrote:
> Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> ---
> =C2=A0.../recipes-core/expat/expat-2.0.1/autotools.patch | =C2=A0 21 ----=
-------------
> =C2=A0.../recipes-core/expat/expat-2.1.0/autotools.patch | =C2=A0 24 ++++=
++++++++++++++++
> =C2=A0meta/recipes-core/expat/expat_2.0.1.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A06 -----
> =C2=A0meta/recipes-core/expat/expat_2.1.0.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A06 +++++
> =C2=A04 files changed, 30 insertions(+), 27 deletions(-)
> =C2=A0delete mode 100644 meta/recipes-core/expat/expat-2.0.1/autotools.pa=
tch
> =C2=A0create mode 100644 meta/recipes-core/expat/expat-2.1.0/autotools.pa=
tch
> =C2=A0delete mode 100644 meta/recipes-core/expat/expat_2.0.1.bb
> =C2=A0create mode 100644 meta/recipes-core/expat/expat_2.1.0.bb
>

some of them I moves so may be you should have use -M option when
generating this patch but it looks ok otherwise.

> diff --git a/meta/recipes-core/expat/expat-2.0.1/autotools.patch b/meta/r=
ecipes-core/expat/expat-2.0.1/autotools.patch
> deleted file mode 100644
> index c0ac10b..0000000
> --- a/meta/recipes-core/expat/expat-2.0.1/autotools.patch
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -Avoid using expat's m4 files
> -
> -Upstream-Status: Inappropriate [Other]
> -Workaround specific to our build system.
> -
> -Signed-off-by: Kevin Tian <kevin.tian@intel.com>
> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> -
> -diff -bur expat-2.0.0~orig/configure.in expat-2.0.0/configure.in
> ---- expat-2.0.0~orig/configure.in =C2=A0 =C2=A0 =C2=A02006-01-10 19:10:4=
6.000000000 -0600
> -+++ expat-2.0.0/configure.in =C2=A0 2006-02-10 19:12:24.000000000 -0600
> -@@ -50,9 +50,6 @@
> -
> - AC_CONFIG_HEADER(expat_config.h)
> -
> --sinclude(conftools/libtool.m4)
> --sinclude(conftools/ac_c_bigendian_cross.m4)
> --
> - AC_LIBTOOL_WIN32_DLL
> - AC_PROG_LIBTOOL
> -
> diff --git a/meta/recipes-core/expat/expat-2.1.0/autotools.patch b/meta/r=
ecipes-core/expat/expat-2.1.0/autotools.patch
> new file mode 100644
> index 0000000..0e59969
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat-2.1.0/autotools.patch
> @@ -0,0 +1,24 @@
> +Avoid using expat's m4 files
> +
> +Upstream-Status: Inappropriate [Other]
> +Workaround specific to our build system.
> +
> +Signed-off-by: Kevin Tian <kevin.tian@intel.com>
> +Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> +
> +Updated to apply over expat 2.1.0
> +
> +Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> +
> +diff -Nurd expat-2.1.0/configure.in expat-2.1.0/configure.in
> +--- expat-2.1.0/configure.in =C2=A0 2012-03-04 01:45:53.000000000 +0200
> ++++ expat-2.1.0/configure.in =C2=A0 2012-05-10 21:04:44.000000000 +0300
> +@@ -51,8 +51,6 @@
> +
> + AC_CONFIG_HEADER(expat_config.h)
> +
> +-sinclude(conftools/ac_c_bigendian_cross.m4)
> +-
> + AC_LIBTOOL_WIN32_DLL
> + AC_PROG_LIBTOOL
> +
> diff --git a/meta/recipes-core/expat/expat_2.0.1.bb b/meta/recipes-core/e=
xpat/expat_2.0.1.bb
> deleted file mode 100644
> index 30b5684..0000000
> --- a/meta/recipes-core/expat/expat_2.0.1.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require expat.inc
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1b71f681713d1256e1c23b0890920=
874"
> -PR =3D "r1"
> -
> -SRC_URI[md5sum] =3D "ee8b492592568805593f81f8cdf2a04c"
> -SRC_URI[sha256sum] =3D "847660b4df86e707c9150e33cd8c25bc5cd828f708c7418e=
765e3e983a2e5e93"
> diff --git a/meta/recipes-core/expat/expat_2.1.0.bb b/meta/recipes-core/e=
xpat/expat_2.1.0.bb
> new file mode 100644
> index 0000000..727769f
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat_2.1.0.bb
> @@ -0,0 +1,6 @@
> +require expat.inc
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1b71f681713d1256e1c23b0890920=
874"
> +PR =3D "r1"
> +

PR could be reset to 0

> +SRC_URI[md5sum] =3D "dd7dab7a5fea97d2a6a43f511449b7cd"
> +SRC_URI[sha256sum] =3D "823705472f816df21c8f6aa026dd162b280806838bb55b34=
32b0fb1fcca7eb86"
> --
> 1.7.10
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


