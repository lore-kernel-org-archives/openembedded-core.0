Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8C3E070A8B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 12:35:46 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id q5so8560521wiv.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Nov 2014 04:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QPUvP7tT3lF96r0oMz9lKN1hUN/h29vsa9I+wxeOJJA=;
	b=hLgPd5q1ff3/wqsdF/bNWqt0A61ZuY2k+87d3eqPTLSQ++P8JYx1KUr9FcKgUtXQy2
	g65KOZAvgq+D0xQKQYRdHZpcoPwgSeiOlmEwyhuykkyBvrltaJUQDl7RTVs3NkNSAYRw
	wNMqb1q5maOPIuoudMnVK7XjU2y79mjIYqJvmSHUAEN4JsMohhXK4HrbOTHwaSmQ4/Ka
	7adzv1Myjm0DNkIKiFp14AToCpjVBkHl/yXSjVB9UdDNjtUBSbmxyesQTxiWgBlQK5D+
	GnyyeFthPe+2rkRiwJZFYF5676ahkuD7k/nneF5LY9khKGrlkqlgq2KbbxQl4lOPm9y3
	QAxQ==
X-Received: by 10.180.107.230 with SMTP id hf6mr17403515wib.31.1415104547078; 
	Tue, 04 Nov 2014 04:35:47 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id wc7sm418004wjc.8.2014.11.04.04.35.45
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Nov 2014 04:35:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 4 Nov 2014 13:35:46 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20141104123546.GA3153@jama>
References: <1415101148-1142-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1415101148-1142-8-git-send-email-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1415101148-1142-8-git-send-email-richard.purdie@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 8/8] gdb: 7.7.1 -> 7.8
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
X-List-Received-Date: Tue, 04 Nov 2014 12:35:57 -0000
X-Groupsio-MsgNum: 59200
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline

--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 04, 2014 at 11:39:08AM +0000, Richard Purdie wrote:
> Drop patch merged upstream.

Please use -M when sending patches, all 8 in this series look like
without -M.

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/gdb/gdb-7.7.1.inc            | 10 --------
>  meta/recipes-devtools/gdb/gdb-7.8.inc              | 10 ++++++++
>  .../gdb/gdb-cross-canadian_7.7.1.bb                |  3 ---
>  .../recipes-devtools/gdb/gdb-cross-canadian_7.8.bb |  3 +++
>  meta/recipes-devtools/gdb/gdb-cross_7.7.1.bb       |  4 ---
>  meta/recipes-devtools/gdb/gdb-cross_7.8.bb         |  4 +++
>  meta/recipes-devtools/gdb/gdb.inc                  |  1 -
>  .../gdb/gdb/include_asm_ptrace.patch               | 30 ----------------=
------
>  meta/recipes-devtools/gdb/gdb_7.7.1.bb             | 24 -----------------
>  meta/recipes-devtools/gdb/gdb_7.8.bb               | 24 +++++++++++++++++
>  10 files changed, 41 insertions(+), 72 deletions(-)
>  delete mode 100644 meta/recipes-devtools/gdb/gdb-7.7.1.inc
>  create mode 100644 meta/recipes-devtools/gdb/gdb-7.8.inc
>  delete mode 100644 meta/recipes-devtools/gdb/gdb-cross-canadian_7.7.1.bb
>  create mode 100644 meta/recipes-devtools/gdb/gdb-cross-canadian_7.8.bb
>  delete mode 100644 meta/recipes-devtools/gdb/gdb-cross_7.7.1.bb
>  create mode 100644 meta/recipes-devtools/gdb/gdb-cross_7.8.bb
>  delete mode 100644 meta/recipes-devtools/gdb/gdb/include_asm_ptrace.patch
>  delete mode 100644 meta/recipes-devtools/gdb/gdb_7.7.1.bb
>  create mode 100644 meta/recipes-devtools/gdb/gdb_7.8.bb
>=20
> diff --git a/meta/recipes-devtools/gdb/gdb-7.7.1.inc b/meta/recipes-devto=
ols/gdb/gdb-7.7.1.inc
> deleted file mode 100644
> index aa16d5a..0000000
> --- a/meta/recipes-devtools/gdb/gdb-7.7.1.inc
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -LICENSE =3D "GPLv2 & GPLv3 & LGPLv2 & LGPLv3"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552 \
> -		    file://COPYING3;md5=3Dd32239bcb673463ab874e80d47fae504 \
> -		    file://COPYING3.LIB;md5=3D6a6a8e020838b23406c81b19c1d46df6 \
> -		    file://COPYING.LIB;md5=3D9f604d8a4f8e74f4f5140845a21b6674"
> -
> -S =3D "${WORKDIR}/${BPN}-${PV}"
> -
> -SRC_URI[md5sum] =3D "45b07b53d81832d32ccd4829465d4886"
> -SRC_URI[sha256sum] =3D "eefadb9831e3695d1eaef34e98b8f1fb441df6fe5071317e=
a49c6bd6ba213eff"
> diff --git a/meta/recipes-devtools/gdb/gdb-7.8.inc b/meta/recipes-devtool=
s/gdb/gdb-7.8.inc
> new file mode 100644
> index 0000000..f4e9a9e
> --- /dev/null
> +++ b/meta/recipes-devtools/gdb/gdb-7.8.inc
> @@ -0,0 +1,10 @@
> +LICENSE =3D "GPLv2 & GPLv3 & LGPLv2 & LGPLv3"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552 \
> +		    file://COPYING3;md5=3Dd32239bcb673463ab874e80d47fae504 \
> +		    file://COPYING3.LIB;md5=3D6a6a8e020838b23406c81b19c1d46df6 \
> +		    file://COPYING.LIB;md5=3D9f604d8a4f8e74f4f5140845a21b6674"
> +
> +S =3D "${WORKDIR}/${BPN}-${PV}"
> +
> +SRC_URI[md5sum] =3D "38d816d641093db2e13ba284e26090b4"
> +SRC_URI[sha256sum] =3D "46be505fc1bc157a01124333ef37ed195147fa6a405cbfd3=
2dea63bacaaabbe4"
> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.7.1.bb b/meta=
/recipes-devtools/gdb/gdb-cross-canadian_7.7.1.bb
> deleted file mode 100644
> index 3010359..0000000
> --- a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.7.1.bb
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -require gdb-common.inc
> -require gdb-cross-canadian.inc
> -require gdb-${PV}.inc
> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.8.bb b/meta/r=
ecipes-devtools/gdb/gdb-cross-canadian_7.8.bb
> new file mode 100644
> index 0000000..3010359
> --- /dev/null
> +++ b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.8.bb
> @@ -0,0 +1,3 @@
> +require gdb-common.inc
> +require gdb-cross-canadian.inc
> +require gdb-${PV}.inc
> diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.7.1.bb b/meta/recipes-=
devtools/gdb/gdb-cross_7.7.1.bb
> deleted file mode 100644
> index f9da486..0000000
> --- a/meta/recipes-devtools/gdb/gdb-cross_7.7.1.bb
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -require gdb-cross.inc
> -require gdb-${PV}.inc
> -
> -SRC_URI +=3D "file://sim-install-6.6.patch"
> diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.8.bb b/meta/recipes-de=
vtools/gdb/gdb-cross_7.8.bb
> new file mode 100644
> index 0000000..f9da486
> --- /dev/null
> +++ b/meta/recipes-devtools/gdb/gdb-cross_7.8.bb
> @@ -0,0 +1,4 @@
> +require gdb-cross.inc
> +require gdb-${PV}.inc
> +
> +SRC_URI +=3D "file://sim-install-6.6.patch"
> diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gd=
b/gdb.inc
> index 7b3e59a..3321a24 100644
> --- a/meta/recipes-devtools/gdb/gdb.inc
> +++ b/meta/recipes-devtools/gdb/gdb.inc
> @@ -5,7 +5,6 @@ inherit gettext
>  SRC_URI +=3D "file://kill_arm_map_symbols.patch \
>              file://gdbserver-cflags-last.diff;striplevel=3D0 \
>              file://renesas-sh-native-support.patch \
> -            file://include_asm_ptrace.patch \
>             "
>  #LDFLAGS_append =3D " -s"
>  #export CFLAGS_append=3D" -L${STAGING_LIBDIR}"
> diff --git a/meta/recipes-devtools/gdb/gdb/include_asm_ptrace.patch b/met=
a/recipes-devtools/gdb/gdb/include_asm_ptrace.patch
> deleted file mode 100644
> index 85e0147..0000000
> --- a/meta/recipes-devtools/gdb/gdb/include_asm_ptrace.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -gdb: include asm/ptrace.h in two aarch64 source files
> -
> -Both sys/ptrace.h and asm/ptrace.h need to be included.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: joe.slater@windriver.com
> -
> -
> ---- a/gdb/aarch64-linux-nat.c
> -+++ b/gdb/aarch64-linux-nat.c
> -@@ -32,6 +32,8 @@
> - #include "elf/common.h"
> -=20
> - #include <sys/ptrace.h>
> -+#include <asm/ptrace.h>
> -+
> - #include <sys/utsname.h>
> -=20
> - #include "gregset.h"
> ---- a/gdb/gdbserver/linux-aarch64-low.c
> -+++ b/gdb/gdbserver/linux-aarch64-low.c
> -@@ -26,6 +26,7 @@
> - #include <signal.h>
> - #include <sys/user.h>
> - #include <sys/ptrace.h>
> -+#include <asm/ptrace.h>
> - #include <sys/uio.h>
> -=20
> - #include "gdb_proc_service.h"
> diff --git a/meta/recipes-devtools/gdb/gdb_7.7.1.bb b/meta/recipes-devtoo=
ls/gdb/gdb_7.7.1.bb
> deleted file mode 100644
> index 1abc9d8..0000000
> --- a/meta/recipes-devtools/gdb/gdb_7.7.1.bb
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -require gdb.inc
> -require gdb-${PV}.inc
> -
> -inherit python-dir
> -
> -PACKAGECONFIG ??=3D ""
> -PACKAGECONFIG[python] =3D "--with-python=3D${WORKDIR}/python,--without-p=
ython,python"
> -PACKAGECONFIG[babeltrace] =3D "--with-babeltrace,--without-babeltrace,ba=
beltrace"
> -
> -do_configure_prepend() {
> -	if [ -n "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python', '', =
d)}" ]; then
> -		cat > ${WORKDIR}/python << EOF
> -#!/bin/sh
> -case "\$2" in
> -	--includes) echo "-I${STAGING_INCDIR}/${PYTHON_DIR}/" ;;
> -	--ldflags) echo "-Wl,-rpath-link,${STAGING_LIBDIR}/.. -Wl,-rpath,${libd=
ir}/.. -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
> -	--exec-prefix) echo "${exec_prefix}" ;;
> -	*) exit 1 ;;
> -esac
> -exit 0
> -EOF
> -		chmod +x ${WORKDIR}/python
> -	fi
> -}
> diff --git a/meta/recipes-devtools/gdb/gdb_7.8.bb b/meta/recipes-devtools=
/gdb/gdb_7.8.bb
> new file mode 100644
> index 0000000..1abc9d8
> --- /dev/null
> +++ b/meta/recipes-devtools/gdb/gdb_7.8.bb
> @@ -0,0 +1,24 @@
> +require gdb.inc
> +require gdb-${PV}.inc
> +
> +inherit python-dir
> +
> +PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG[python] =3D "--with-python=3D${WORKDIR}/python,--without-p=
ython,python"
> +PACKAGECONFIG[babeltrace] =3D "--with-babeltrace,--without-babeltrace,ba=
beltrace"
> +
> +do_configure_prepend() {
> +	if [ -n "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python', '', =
d)}" ]; then
> +		cat > ${WORKDIR}/python << EOF
> +#!/bin/sh
> +case "\$2" in
> +	--includes) echo "-I${STAGING_INCDIR}/${PYTHON_DIR}/" ;;
> +	--ldflags) echo "-Wl,-rpath-link,${STAGING_LIBDIR}/.. -Wl,-rpath,${libd=
ir}/.. -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
> +	--exec-prefix) echo "${exec_prefix}" ;;
> +	*) exit 1 ;;
> +esac
> +exit 0
> +EOF
> +		chmod +x ${WORKDIR}/python
> +	fi
> +}
> --=20
> 2.0.2
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRYyCIACgkQN1Ujt2V2gBzuXACgq6Y2VUpNmmaXRndHrwEInmfn
to4AnR5s6SH0E1uIRxPow9/YUoGYj9UT
=GyCV
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
