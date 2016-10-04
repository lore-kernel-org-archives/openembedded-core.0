Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 03AEF719D6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 17:03:50 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b184so20623335wma.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2016 10:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=LxF48A44JaLgdumv3eTsR4wofwDJUw/3eZA51xykaXY=;
	b=aJGNLQZQlBaD5rfpAts2a+hmi6tz+EL3jTHe7mtf1x6lNBF8QbcnauQ1ehaJlmigaS
	keF6Z8cuItP6hhGvMmSUCapF/R2qw4i6rbZ7akPJoxRbNfvLLpqB2c9sJe1yyN5Sy2/k
	WpYdHdRPRwnHSbIgDYu/EWED91IxaWdqM4B39UPfHRe6uyT8yb398emBxJMX4k1+B8ki
	XDGrDFI1yR3r880H0kdQMx5LdL+fP59ukx9AhbMmBpSTw8aa/kSYsIp1vLPJ2kuxCK55
	iR1zQpKW8ToRaCo5lg9GhH+i9CBs/f1gJTYs8566KQ5zAtgfnJs5fOYcVVFhswKTGCB/
	+j1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=LxF48A44JaLgdumv3eTsR4wofwDJUw/3eZA51xykaXY=;
	b=GDxr6GWHUR6WRbiEKExIws0OTlhrkJhT+EUh6ujvg0Ys1GSvz+fnCvcr3BI8Yr9dXA
	b3DWFpnRIoE2zSC3a2t4q7SPO3N0gSwoHDYdw9hAWpxPCJT8FI0T/1WeMTjQhtOWZROX
	2ktuiNTwpWFEq1kSlzIFeosUYYGkmGouh1vgrmU1pf4TeyiqxVP1iAVaLQxDTDrbDK9H
	SVJFxIYta2xE2B2PkfgPG4UJM3kB3bcQHGQKsQzmQHWfxYumF0MRVhKCCxy3T2ZXSboi
	6NRWBkKc7Ikx4ejsBVyPdHwrDTh+lf2PHf4kqHkGC6ftLUpyBzP/eh0gdQxD3Q/IIQow
	KNVg==
X-Gm-Message-State: AA6/9RnlpE7BuiRy3YZBZ2SA40dPjYeMxkjSDSDsHMYWNbGT1hxQ384fkzC+VrHL9ujnhA==
X-Received: by 10.28.109.144 with SMTP id b16mr12211874wmi.5.1475600631367;
	Tue, 04 Oct 2016 10:03:51 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id jn7sm4496474wjb.5.2016.10.04.10.03.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 04 Oct 2016 10:03:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 4 Oct 2016 19:03:50 +0200
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20161004170350.GA2919@jama>
References: <1475595473-19221-1-git-send-email-ross.burton@intel.com>
	<1475595473-19221-2-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1475595473-19221-2-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] systemtap: rationalise dependencies
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
X-List-Received-Date: Tue, 04 Oct 2016 17:03:51 -0000
X-Groupsio-MsgNum: 87880
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline

--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 04, 2016 at 04:37:53PM +0100, Ross Burton wrote:
> Boost is an optional dependency but avoid build non-determinism by adding=
 it as
> DEPENDS.  It is only for the shared pointer types so can be disabled expl=
icitly
> if required.
>=20
> Turn sqlite into a PACKAGECONFIG.
>=20
> Add a patch for the "monitor" feature to control the optional dependencie=
s on
> ncurses and json-c. Previously this was enabled for target only but enabl=
e it
> everwhere now that json-c is available for native/nativesdk.
>=20
> Of course all of this was predicated about systemtap needing systemtap-na=
tive to
> be built, but it turns out that this dependency is due to oe-core 507bd2 =
which
> adds systemtap-native as DEPENDS for convenience.  Remove this dependency=
, if
> the user wants systemtap-native then they can build it explicitly.

Thanks!

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../systemtap/systemtap/monitor-option.patch       | 28 ++++++++++++++++=
++++++
>  meta/recipes-kernel/systemtap/systemtap_git.bb     |  8 +++----
>  meta/recipes-kernel/systemtap/systemtap_git.inc    |  1 +
>  3 files changed, 33 insertions(+), 4 deletions(-)
>  create mode 100644 meta/recipes-kernel/systemtap/systemtap/monitor-optio=
n.patch
>=20
> diff --git a/meta/recipes-kernel/systemtap/systemtap/monitor-option.patch=
 b/meta/recipes-kernel/systemtap/systemtap/monitor-option.patch
> new file mode 100644
> index 0000000..7d43a79
> --- /dev/null
> +++ b/meta/recipes-kernel/systemtap/systemtap/monitor-option.patch
> @@ -0,0 +1,28 @@
> +Add an option to explicitly disable the monitor (and therefore the depen=
dency on
> +json-c and ncurses).
> +
> +Upstream-Status: Pending
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +diff --git a/configure.ac b/configure.ac
> +index cd781a2..e56079a 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -570,13 +574,16 @@ dnl See if we have enough libraries and tools to b=
uild the virt server
> + fi
> + AM_CONDITIONAL([BUILD_VIRT], [test "${have_libvirt}" =3D=3D "yes" -a "$=
{have_libxml2}" =3D=3D "yes" -a "$enable_virt" !=3D "no"])
> +
> ++AC_ARG_ENABLE([monitor], AS_HELP_STRING([--disable-monitor],[Disable mo=
nitor]))
> ++if test "$enable_monitor" !=3D "no"; then
> + dnl Check for presence of json-c and ncurses for use in monitor mode
> + PKG_CHECK_MODULES([jsonc], [json-c], [have_jsonc=3Dyes], [have_jsonc=3D=
no])
> + PKG_CHECK_MODULES([ncurses], [ncurses], [have_ncurses=3Dyes], [have_ncu=
rses=3Dno])
> +-AM_CONDITIONAL([HAVE_MONITOR_LIBS], [test "${have_jsonc}" =3D=3D "yes" =
-a "${have_ncurses}" =3D=3D "yes"])
> + if test "${have_jsonc}" =3D=3D "yes" -a "${have_ncurses}" =3D=3D yes; t=
hen
> +   AC_DEFINE([HAVE_MONITOR_LIBS],[1],[Define to 1 if json-c and ncurses =
libraries are installed])
> + fi
> ++fi
> ++AM_CONDITIONAL([HAVE_MONITOR_LIBS], [test "${have_jsonc}" =3D=3D "yes" =
-a "${have_ncurses}" =3D=3D "yes" -a "$enable_monitor" !=3D "no"])
> +
> + AC_CACHE_CHECK([for assembler .section "?" flags support], stap_cv_sect=
ionq, [
> + old_CFLAGS=3D"$CFLAGS"
> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipe=
s-kernel/systemtap/systemtap_git.bb
> index da30fa5..43bf69e 100644
> --- a/meta/recipes-kernel/systemtap/systemtap_git.bb
> +++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
> @@ -2,9 +2,7 @@ SUMMARY =3D "Script-directed dynamic tracing and performa=
nce analysis tool for Lin
> =20
>  require systemtap_git.inc
> =20
> -DEPENDS =3D "elfutils sqlite3 systemtap-native ncurses json-c"
> -DEPENDS_class-native =3D "elfutils-native sqlite3-native gettext-native"
> -DEPENDS_class-nativesdk =3D "nativesdk-elfutils nativesdk-sqlite3 native=
sdk-gettext"
> +DEPENDS =3D "boost elfutils"
> =20
>  RDEPENDS_${PN} +=3D "python3-core bash"
> =20
> @@ -19,8 +17,10 @@ STAP_DOCS ?=3D "--disable-docs --disable-publican --di=
sable-refdocs"
> =20
>  EXTRA_OECONF +=3D "${STAP_DOCS} "
> =20
> -PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG ??=3D "sqlite monitor"
>  PACKAGECONFIG[libvirt] =3D "--enable-libvirt,--disable-libvirt,libvirt"
> +PACKAGECONFIG[sqlite] =3D "--enable-sqlite,--disable-sqlite,sqlite3"
> +PACKAGECONFIG[monitor] =3D "--enable-monitor,--disable-monitor,ncurses j=
son-c"
> =20
>  inherit autotools gettext pkgconfig
> =20
> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recip=
es-kernel/systemtap/systemtap_git.inc
> index ce976ed..304eb99 100644
> --- a/meta/recipes-kernel/systemtap/systemtap_git.inc
> +++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
> @@ -8,6 +8,7 @@ SRC_URI =3D "git://sourceware.org/git/systemtap.git \
>             file://system_map_location.patch \
>             file://configure-allow-to-disable-libvirt.patch \
>             file://x32_abi_time.patch \
> +           file://monitor-option.patch \
>            "
> =20
>  # systemtap doesn't support mips
> --=20
> 2.8.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfz4PUACgkQN1Ujt2V2gByxyACfbSIZDX5osWhVf/pT3BYFQpPU
KSYAoKQxT7dklU6K2v7upjCsQC/ys+IR
=GJgY
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--
