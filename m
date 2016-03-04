Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id F06486080F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 14:00:00 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id l68so36139904wml.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2016 06:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=bGg1xeTfRMS8IBDKTJe5dXktnOKly6o5PtaH917Qg/0=;
	b=XbdGmLMtQFUfjHJNvX2MXgjlRyt/S4suM5GDQXxVBKn81VJtvgcC2hhP157XVtEWOI
	Ppg8oDdIi6vxOG37XRb1oQ8oNtrIi5/E91HNQruneOeitvMKWXkaoYjmg89josRGO88C
	Ow0djr4VnL3A3khCo5Y5ISDLUl0PGurLExxOT4Hieg6RpSnXYAOi/f0CxH6cBS0HV2ld
	tWwHJfDMYuteBuEaS9Lxp+5LYrQEvGz0GaxgkkZxyioq/RxgWYY+12CYGUNmF/q8fuoX
	76tMVV9aJpCj1yrujtrx3YcOsIA0F3n+iHsjn44QG8rqZ+1srwXcCswrQjUTx1NxoJO6
	3kTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=bGg1xeTfRMS8IBDKTJe5dXktnOKly6o5PtaH917Qg/0=;
	b=hwETnfU3cPyjiSfhzqdTSop7bue50/FoZvkRvh1LO1ia++9L72BkNFW/ZsNdFZe9Ep
	ajocSQ68hhZRVajiJChakilTzGFobcAQQzdtAIUsoM0jPNyEV55IyIScO5zHNsUcFcuC
	+tM0m9tXY7YCiOWNtLFtiFkpBWThu6dYbLJ3MnQ1EDADjJUTiQScf7kVQKrF8MZyU1jj
	JW3155M1+EO/JsU7TWrUKhe95yseTIyzvKKSZ6L/ThGkE3dkOMdwDtvfblI2oQgwVHbY
	7JBkk4ruC+CjaMjWKQgpAzn3xVa+BPAMm6+bMWRyaZvtgHskp6DOkHDo6U1SVaMBHCu2
	yHeQ==
X-Gm-Message-State: AD7BkJLZb8t+pqFbvsZ4xh3xrGnbm2peo38901FaYYfjVf/daN7vwE0QSELpPojzGTqQGA==
X-Received: by 10.28.210.73 with SMTP id j70mr5232228wmg.8.1457100000993;
	Fri, 04 Mar 2016 06:00:00 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	hx10sm3484224wjb.25.2016.03.04.05.59.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Mar 2016 05:59:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 4 Mar 2016 15:02:12 +0100
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20160304140212.GD2557@jama>
References: <1457038873-26591-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1457038873-26591-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gdb: fix builds with internal readline and no static libraries
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
X-List-Received-Date: Fri, 04 Mar 2016 14:00:02 -0000
X-Groupsio-MsgNum: 79118
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="at6+YcpfzWZg/htY"
Content-Disposition: inline

--at6+YcpfzWZg/htY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 03, 2016 at 09:01:13PM +0000, Ross Burton wrote:
> If gdb was configured to use the internal readline but static libraries w=
ere
> disabled, gdb wouldn't dutifully not build libreadline.a which was a prob=
lem
> when it tried to link with that library.
>=20
> Solve this by ensuring --enable-static is passed to the readline configur=
e.

Somehow this caused hardfloat builds to fail

| checking for options to get soft-float... no
| configure: error: could not force soft-float
| NOTE: The following config.log files may provide further information.
| WARNING: exit code 1 from a shell command.

=66rom config.log:

configure:25055: arm-oe-linux-gnueabi-gcc -march=3Darmv7ve -mthumb
-mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard -mcpu=3Dcortex-a7 -mtune=3Dcortex-a7
-rdynamic
--sysroot=3D<sysroot>
-c  -Os -Wall -W -Wshadow -Wpointer-arith -Wundef -Wchar-subscripts
-Wcomment -Wdeprecated-declarations -Wdisabled-optimization
-Wdiv-by-zero -Wfloat-equal -Wformat-extra-args -Wformat-security
-Wformat-y2k -Wimplicit -Wimplicit-function-declaration -Wimplicit-int
-Wmain -Wmissing-braces -Wmissing-format-attribute -Wmultichar
-Wparentheses -Wreturn-type -Wsequence-point -Wshadow -Wsign-compare
-Wswitch -Wtrigraphs -Wunknown-pragmas -Wunused -Wunused-function
-Wunused-label -Wunused-parameter -Wunused-value  -Wunused-variable
-Wwrite-strings -Wnested-externs -Wstrict-prototypes -g
-Wredundant-decls -Wmissing-prototypes -Wmissing-declarations
-Wcast-align  -Wextra -Wattributes -Wendif-labels -Winit-self
-Wint-to-pointer-cast -Winvalid-pch -Wmissing-field-initializers
-Wnonnull -Woverflow -Wvla -Wpointer-to-int-cast -Wstrict-aliasing
-Wvariadic-macros -Wvolatile-register-var -Wpointer-sign
-Wmissing-include-dirs -Wmissing-prototypes -Wmissing-declarations
-Wformat=3D2 -freg-struct-return -msoft-float -Werror  -Wall -W
-DGRUB_MACHINE_UBOOT=3D1 -DGRUB_MACHINE=3DARM_UBOOT conftest.c >&5
arm-oe-linux-gnueabi-gcc: error: -mfloat-abi=3Dsoft and
-mfloat-abi=3Dhard may not be used together
configure:25055: $? =3D 1

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-devtools/gdb/gdb.inc                  |  1 +
>  .../gdb/gdb/force-readline-static.patch            | 37 ++++++++++++++++=
++++++
>  2 files changed, 38 insertions(+)
>  create mode 100644 meta/recipes-devtools/gdb/gdb/force-readline-static.p=
atch
>=20
> diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gd=
b/gdb.inc
> index 1dd6551..507f274 100644
> --- a/meta/recipes-devtools/gdb/gdb.inc
> +++ b/meta/recipes-devtools/gdb/gdb.inc
> @@ -7,6 +7,7 @@ SRC_URI +=3D "file://0002-Change-order-of-CFLAGS.patch \
>              file://0001-Use-exported-definitions-of-SIGRTMIN.patch \
>              file://0001-include-sys-types.h-for-mode_t.patch \
>              file://0001-use-asm-sgidefs.h.patch \
> +            file://force-readline-static.patch \
>             "
>  #LDFLAGS_append =3D " -s"
>  #export CFLAGS_append=3D" -L${STAGING_LIBDIR}"
> diff --git a/meta/recipes-devtools/gdb/gdb/force-readline-static.patch b/=
meta/recipes-devtools/gdb/gdb/force-readline-static.patch
> new file mode 100644
> index 0000000..d34ee8c
> --- /dev/null
> +++ b/meta/recipes-devtools/gdb/gdb/force-readline-static.patch
> @@ -0,0 +1,37 @@
> +If gdb is configured with --disable-static then this is dutifully passed=
 to
> +readline which then disables libreadline.a, which causes a problem when =
gdb
> +tries to link against that.
> +
> +To ensure that readline always builds static libraries, pass --enable-st=
atic to
> +the sub-configure.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +diff --git a/Makefile.def b/Makefile.def
> +index 4394188..05c661a 100644
> +--- a/Makefile.def
> ++++ b/Makefile.def
> +@@ -100,7 +100,8 @@ host_modules=3D { module=3D libiconv;
> + 		missing=3D install-html;
> + 		missing=3D install-info; };
> + host_modules=3D { module=3D m4; };
> +-host_modules=3D { module=3D readline; };
> ++host_modules=3D { module=3D readline;
> ++                extra_configure_flags=3D'--enable-static';};
> + host_modules=3D { module=3D sid; };
> + host_modules=3D { module=3D sim; };
> + host_modules=3D { module=3D texinfo; no_install=3D true; };
> +diff --git a/Makefile.in b/Makefile.in
> +index 61e0ab6..837f36e 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -24971,7 +24971,7 @@ configure-readline:
> + 	  $$s/$$module_srcdir/configure \
> + 	  --srcdir=3D$${topdir}/$$module_srcdir \
> + 	  $(HOST_CONFIGARGS) --build=3D${build_alias} --host=3D${host_alias} \
> +-	  --target=3D${target_alias}  \
> ++	  --target=3D${target_alias} --enable-static \
> + 	  || exit 1
> + @endif readline
> +=20
> --=20
> 2.7.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--at6+YcpfzWZg/htY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbZlWMACgkQN1Ujt2V2gBwMuQCfYmSa1eWqUn929uKm7V3Ftrwg
Wr4Anil+8SSvFyTynczfvey83/M7vT4G
=6tgU
-----END PGP SIGNATURE-----

--at6+YcpfzWZg/htY--
