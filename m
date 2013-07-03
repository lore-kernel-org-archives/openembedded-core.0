Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 137B56AD4F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 13:39:15 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id p10so108189pdj.22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jul 2013 06:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=zAkJQWuYsdDqmnNf8xaHrfkwFW0tTzD/T3N+BaGkFpw=;
	b=gRfv2EMVtUUOVpA2VJfWHY8CnbMGy9v7Ly3A/TlUXMjqH2adiiAp23kva0ju+odFin
	kt/Vjlldihb9Llcs0VdhoGZhj5V82l2WBMGnhWpaAb4ULtfzksaZ8xtRzHUShZ6G54XV
	WxV+MdSHDIgMIHc0RoqlbbOpS1Q6b+gF5T6x+7pASDRjeY4SRcT6hrBV3EQYvGs1nCER
	Bdx0pGFdWpTr27Hz9T4cxUMbVVtuhBHr7mwzWP/8TJI5c5wA0e8232Cj89O5ssFY6xXj
	4rI9XYi7WTp0zEOemgTMQl8nO1ZJp7ggpU5DyosQ9VyAr+B9lIaLUSaogddSd63t3W0d
	N4rA==
X-Received: by 10.66.37.77 with SMTP id w13mr2573845paj.73.1372858754578;
	Wed, 03 Jul 2013 06:39:14 -0700 (PDT)
Received: from kosborne-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	re16sm33871444pac.16.2013.07.03.06.39.13 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 03 Jul 2013 06:39:13 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1372858623-16505-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
Date: Wed, 3 Jul 2013 06:39:12 -0700
Message-Id: <54ED6376-29DF-4931-B7A2-D298FE643BAC@gmail.com>
References: <1372858623-16505-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
To: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] mkelfimage: switch to git repository
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
X-List-Received-Date: Wed, 03 Jul 2013 13:39:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jul 3, 2013, at 6:37 AM, Emilia Ciobanu =
<emilia.maria.silvia.ciobanu@intel.com> wrote:

> The project has switched to using git for version control.
>=20
> Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
> ---
> meta/recipes-devtools/mkelfimage/mkelfimage_git.bb |   31 =
++++++++++++++++++++
> meta/recipes-devtools/mkelfimage/mkelfimage_svn.bb |   31 =
--------------------

git format-patch -M would try to detect renaming and diff could be =
better.

> 2 files changed, 31 insertions(+), 31 deletions(-)
> create mode 100644 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
> delete mode 100644 meta/recipes-devtools/mkelfimage/mkelfimage_svn.bb
>=20
> diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb =
b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
> new file mode 100644
> index 0000000..b81ce2f
> --- /dev/null
> +++ b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
> @@ -0,0 +1,31 @@
> +DESCRIPTION =3D "A utility to create ELF boot images from Linux =
kernel images"

some of linux kernel images like vmlinux are ELF images too they may not =
be bootable. Does this create
ELF bootable images from non-ELF images e.g. bzImage ?

> +HOMEPAGE =3D "http://www.coreboot.org/Mkelfimage"
> +SECTION =3D "devel"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Dea5bed2f60d357618ca161ad539f7c0a"
> +
> +SRCREV =3D "686a48a339b3200184c27e7f98d4c03180b2be6c"
> +PV =3D "4.0+git${SRCPV}"
> +PR =3D "r0"
> +
> +DEPENDS +=3D "zlib"
> +
> +SRC_URI =3D "git://review.coreboot.org/p/coreboot;protocol=3Dhttp \
> +           file://cross-compile.patch   \
> +           file://fix-makefile-to-find-libz.patch   \
> +          "
> +
> +S =3D "${WORKDIR}/git/util/mkelfImage"
> +
> +CFLAGS +=3D "-fno-stack-protector"
> +CACHED_CONFIGUREVARS +=3D "HOST_CC=3D'${BUILD_CC}'"
> +EXTRA_OEMAKE +=3D "HOST_CPPFLAGS=3D'${BUILD_CPPFLAGS}'"
> +
> +inherit autotools
> +
> +do_install_append() {
> +	rmdir ${D}${datadir}/mkelfImage/elf32-i386
> +	rmdir ${D}${datadir}/mkelfImage
> +}
> +
> +BBCLASSEXTEND =3D "native"
> diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage_svn.bb =
b/meta/recipes-devtools/mkelfimage/mkelfimage_svn.bb
> deleted file mode 100644
> index b53f7a7..0000000
> --- a/meta/recipes-devtools/mkelfimage/mkelfimage_svn.bb
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -DESCRIPTION =3D "A utility to create ELF boot images from Linux =
kernel images"
> -HOMEPAGE =3D "http://www.coreboot.org/Mkelfimage"
> -SECTION =3D "devel"
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Dea5bed2f60d357618ca161ad539f7c0a"
> -
> -SRCREV =3D "6637"
> -PV =3D "1.0.0+svn${SRCPV}"
> -PR =3D "r2"
> -
> -DEPENDS +=3D "zlib"
> -
> -SRC_URI =3D =
"svn://coreboot.org/coreboot/trunk/util;module=3DmkelfImage;protocol=3Dsvn=
 \
> -           file://cross-compile.patch \
> -           file://fix-makefile-to-find-libz.patch \
> -          "
> -
> -S =3D "${WORKDIR}/mkelfImage"
> -
> -CFLAGS +=3D "-fno-stack-protector"
> -CACHED_CONFIGUREVARS +=3D "HOST_CC=3D'${BUILD_CC}'"
> -EXTRA_OEMAKE +=3D "HOST_CPPFLAGS=3D'${BUILD_CPPFLAGS}'"
> -
> -inherit autotools
> -
> -do_install_append() {
> -	rmdir ${D}${datadir}/mkelfImage/elf32-i386
> -	rmdir ${D}${datadir}/mkelfImage
> -}
> -
> -BBCLASSEXTEND =3D "native"
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


