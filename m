Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id DB39477178
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Feb 2016 12:59:36 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id b205so100808218wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Feb 2016 04:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=hYWxZz5WqBlTo6LKUPrro6LzvtXm/R5o1wGVxUuU+mE=;
	b=iW1C5/Et60GgR/I5JywCbiN643kUgyG0oZNe000KynLuUL9ZFFmaSgo2qSk1ib8hSK
	8xhdlPnJ2EAYzn92VS+tizkejMevqmw7itUnIQzguN4gSNp5HrDeK97s8q33syWvhAaG
	57fA+1e1IsB4UElHgwOTEopahONHUPbRcdkJ+c/znFGx2vTaDeX/1vzyRUb47+xvKOL5
	0Uq7tcI1MX3+E8KaHDieEbUOqbgBxFFUfPp0LNAUE2EFEiBwyXaM/kzxD0gs3uwiBnhT
	ogY2iZg1auQkJ0M13nVOVW9qsz4WRV+UrOxv1W9WxnC6sWmFSwJF4Au4GhRWT+NgygQp
	vedA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=hYWxZz5WqBlTo6LKUPrro6LzvtXm/R5o1wGVxUuU+mE=;
	b=DvfY+69ysn7aqinB4E7fqMaQwB0nxQK615SHoXYSPALS2WBr3KkKX066q/yQhCOXWF
	PwwyNmK10TCh+Pg7Q+M3KjJZRMDqF/dzbQ7iT9+VsSOvSoKxelKjdYD3fzXd7T3cap6N
	8OcOD3vO/BbZCKRi221tvIXuqpfXg5QcPaMD16R6XjxbkBVsaV4qHZ7fsPjYr6McyGsM
	ubi0+EES2DyD84Al3QLQ8TLs0kZQ/DMthFKxm6/haiBfUkpg7j+y/j5cc4jG3L0RjfEp
	rfAM8e7ouLDckiAVVGlGTdrWTXV0ScaEbvMfqsol+vulyDHO9TRGPqQSYTtYIT7X5qk0
	SFEg==
X-Gm-Message-State: AG10YOT+UjBtc0gGBCZZx2PKGv/RAktuR9/WnvAMfWrXbTYPWNv+pnak8Ze2qY5Z8tw5Zw==
X-Received: by 10.28.173.71 with SMTP id w68mr2662736wme.88.1455973176798;
	Sat, 20 Feb 2016 04:59:36 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	c7sm11957346wmd.13.2016.02.20.04.59.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 20 Feb 2016 04:59:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 20 Feb 2016 14:00:14 +0100
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20160220130014.GA2589@jama>
References: <cover.1454088695.git.hongxu.jia@windriver.com>
	<bb6291a740fc7e41120072e45fc2c5d8d93a0b5f.1454088695.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <bb6291a740fc7e41120072e45fc2c5d8d93a0b5f.1454088695.git.hongxu.jia@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/5] gcc-5.3.inc/base.bbclass: add gcc option to not record -fdebug-prefix-map to debugging info
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
X-List-Received-Date: Sat, 20 Feb 2016 12:59:37 -0000
X-Groupsio-MsgNum: 78427
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="17pEHd4RhPHOinZp"
Content-Disposition: inline

--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 29, 2016 at 12:35:55PM -0500, Hongxu Jia wrote:
> Add option '-gno-record-debug-prefix-map' and '-grecord-debug-prefix-map'
> for gcc. If '-gno-record-debug-prefix-map' is used, it does not record
> '-fdebug-prefix-map' to gcc command line switches in DWARF DW_AT_producer.

Did you check sstate signatures with these debug-prefix-map changes? It see=
ms to cause
everything to be MACHINE specific:

ERROR: libgcc-initial different signature for task do_populate_sysroot.sigd=
ata between qemux86 and qemux86copy
basehash changed from 03ccc547064deba9b8e2e290a6be9480 to 6f7eff2e90f301e99=
5298fee2c47b844
Variable FULL_OPTIMIZATION value changed from '-O2 -pipe -g -feliminate-unu=
sed-debug-types -fdebug-prefix-map=3DTOPDIR/work/i586-webos-linux/libgcc-in=
itial/5.3.0-r0/gcc-5.3.0/build.i586-webos-linux.i586-webos-linux=3D/usr/src=
/libgcc> -fdebug-prefix-map=3DTOPDIR/work-shared/gcc-5.3.0-r0/gcc-5.3.0=3D/=
usr/src/libgcc> -fdebug-prefix-map=3DTOPDIR/sysroots/x86_64-linux=3D> -fdeb=
ug-prefix-map=3DTOPDIR/sysroots/qemux86=3D> ' to '-O2 -pipe -g -feliminate-=
unused-debug-types -fdebug-prefix-map=3DTOPDIR/work/i586-webos-linux/libgcc=
-initial/5.3.0-r0/gcc-5.3.0/build.i586-webos-linux.i586-webos-linux=3D/usr/=
src/libgcc> -fdebug-prefix-map=3DTOPDIR/work-shared/gcc-5.3.0-r0/gcc-5.3.0=
=3D/usr/src/libgcc> -fdebug-prefix-map=3DTOPDIR/sysroots/x86_64-linux=3D> -=
fdebug-prefix-map=3DTOPDIR/sysroots/qemux86copy=3D> '
runtaskdeps changed from ['gcclibgcc-initial_5.3.bb.do_extra_symlinks', 'gc=
clibgcc-initial_5.3.bb.do_install', 'gcclibgcc-initial_5.3.bb.do_multilib_i=
nstall'] to ['gcclibgcc-initial_5.3.bb.do_extra_symlinks', 'gcclibgcc-initi=
al_5.3.bb.do_install', 'gcclibgcc-initial_5.3.bb.do_multilib_install']
oe-core/meta/recipes-devtools/gcc/libgcc-initial_5.3.bb.do_extra_symlinks> =
with hash 0bdaebf5e23c90af7cea65f28a12c789
 changed to
oe-core/meta/recipes-devtools/gcc/libgcc-initial_5.3.bb.do_extra_symlinks> =
with hash 2d1b031bbd46bc8c7401d37bd1edb7cc
oe-core/meta/recipes-devtools/gcc/libgcc-initial_5.3.bb.do_install> with ha=
sh b6f705a4bd3535b606e8214c5640933a
 changed to
oe-core/meta/recipes-devtools/gcc/libgcc-initial_5.3.bb.do_install> with ha=
sh da4e294376b70f951ca4af508fdc6a60
oe-core/meta/recipes-devtools/gcc/libgcc-initial_5.3.bb.do_multilib_install=
> with hash 8473bfa83cba1ee93191182b9fd239d7
 changed to
oe-core/meta/recipes-devtools/gcc/libgcc-initial_5.3.bb.do_multilib_install=
> with hash fcad4f5f4d7da576b7c2add3eb24fcc8
Hash for dependent task gcclibgcc-initial_5.3.bb.do_extra_symlinks changed =
=66rom 0bdaebf5e23c90af7cea65f28a12c789 to 2d1b031bbd46bc8c7401d37bd1edb7cc
Hash for dependent task gcclibgcc-initial_5.3.bb.do_install changed from b6=
f705a4bd3535b606e8214c5640933a to da4e294376b70f951ca4af508fdc6a60
Hash for dependent task gcclibgcc-initial_5.3.bb.do_multilib_install change=
d from 8473bfa83cba1ee93191182b9fd239d7 to fcad4f5f4d7da576b7c2add3eb24fcc8

Regards,


>=20
> The patch could make sure the debugging informaion does not has TMPDIR
> and also leaves gcc switches in.
>=20
> Compile without this fix:
> objdump -g packages-split/lib32-glibc-dev/usr/lib/gcrt1.o
> ...
> |    <5f>   DW_AT_producer    : (indirect string, offset: 0x1b): GNU C99 =
5.3.0
> -m32-march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -mpreferred-stack=
-boundary=3D4
> -g -O2 -std=3Dgnu99 -fgnu89-inline -fdebug-prefix-map=3D/buildarea/raid0/=
hjia/buil
> d-20160127-yocto-buildpath-2/tmp/sysroots/lib32-qemux86-64=3D
> -feliminate-unused-debug-types -fmerge-all-constants -frounding-math
> -ftls-model=3Dinitial-exec
> ...
>=20
> Compile with this fix:
> objdump -g packages-split/lib32-glibc-dev/usr/lib/gcrt1.o
> ...
> |    <5f>   DW_AT_producer    : (indirect string, offset: 0xa1): GNU C99 =
5.3.0
> -m32 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -mpreferred-stac=
k-boundary=3D4
> -g -O2 -std=3Dgnu99 -fgnu89-inline -feliminate-unused-debug-types -fmerge=
-all-constants
> -frounding-math -ftls-model=3Dinitial-exec
> ...
>=20
> [YOCTO #7058]
>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/conf/bitbake.conf                             |  1 +
>  meta/recipes-devtools/gcc/gcc-5.3.inc              |  3 +-
>  ...48-add-option-gno-record-debug-prefix-map.patch | 65 ++++++++++++++++=
++++++
>  3 files changed, 68 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0048-add-option-gno=
-record-debug-prefix-map.patch
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index bebaaf4..e2e55e8 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -552,6 +552,7 @@ DEBUG_FLAGS ?=3D "-g \
>      -fdebug-prefix-map=3D${S}=3D/usr/src/${BPN} \
>      -fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
>      -fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \
> +    -gno-record-debug-prefix-map \
>  "
> =20
>  # Disabled until the option works properly -feliminate-dwarf2-dups
> diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc b/meta/recipes-devtool=
s/gcc/gcc-5.3.inc
> index 80999c1..3a36e50 100644
> --- a/meta/recipes-devtools/gcc/gcc-5.3.inc
> +++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
> @@ -76,7 +76,8 @@ SRC_URI =3D "\
>             file://0044-Adding-mmusl-as-a-musl-libc-specifier-and-the-nec=
ess.patch \
>             file://0045-Support-for-arm-linux-musl.patch \
>             file://0046-Get-rid-of-ever-broken-fixincludes-on-musl.patch \
> -	   file://0047-Fix-nios2-musl-build.patch \
> +           file://0047-Fix-nios2-musl-build.patch \
> +           file://0048-add-option-gno-record-debug-prefix-map.patch \
>            "
> =20
>  BACKPORTS =3D ""
> diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0048-add-option-gno-record=
-debug-prefix-map.patch b/meta/recipes-devtools/gcc/gcc-5.3/0048-add-option=
-gno-record-debug-prefix-map.patch
> new file mode 100644
> index 0000000..e1efaeb
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-5.3/0048-add-option-gno-record-debug-=
prefix-map.patch
> @@ -0,0 +1,65 @@
> +From f1c5f8e9b568122c9a5afd323fd6d76250b83c94 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Thu, 28 Jan 2016 15:25:23 +0800
> +Subject: [PATCH] add option gno-record-debug-prefix-map
> +
> +If option gno-record-debug-prefix-map used, it does not
> +record -fdebug-prefix-map to gcc command line switches
> +in DWARF DW_AT_producer.
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + gcc/common.opt  | 8 ++++++++
> + gcc/dwarf2out.c | 8 ++++++++
> + 2 files changed, 16 insertions(+)
> +
> +diff --git a/gcc/common.opt b/gcc/common.opt
> +index 0c4f86b..e4c6bd6 100644
> +--- a/gcc/common.opt
> ++++ b/gcc/common.opt
> +@@ -2516,6 +2516,14 @@ grecord-gcc-switches
> + Common RejectNegative Var(dwarf_record_gcc_switches,1)
> + Record gcc command line switches in DWARF DW_AT_producer.
> +=20
> ++gno-record-debug-prefix-map
> ++Common RejectNegative Var(dwarf_record_debug_prefix_map,0) Init(1)
> ++Don't record -fdebug-prefix-map in gcc command line switches in DWARF D=
W_AT_producer.
> ++
> ++grecord-debug-prefix-map
> ++Common RejectNegative Var(dwarf_record_debug_prefix_map,1)
> ++Record -fdebug-prefix-map in gcc command line switches in DWARF DW_AT_p=
roducer.
> ++
> + gno-split-dwarf
> + Common Driver RejectNegative Var(dwarf_split_debug_info,0) Init(0)
> + Don't generate debug information in separate .dwo files
> +diff --git a/gcc/dwarf2out.c b/gcc/dwarf2out.c
> +index f90329b..646a706 100644
> +--- a/gcc/dwarf2out.c
> ++++ b/gcc/dwarf2out.c
> +@@ -19383,6 +19383,8 @@ gen_producer_string (void)
> +       case OPT_SPECIAL_input_file:
> +       case OPT_grecord_gcc_switches:
> +       case OPT_gno_record_gcc_switches:
> ++      case OPT_grecord_debug_prefix_map:
> ++      case OPT_gno_record_debug_prefix_map:
> +       case OPT__output_pch_:
> +       case OPT_fdiagnostics_show_location_:
> +       case OPT_fdiagnostics_show_option:
> +@@ -19415,6 +19417,12 @@ gen_producer_string (void)
> + 	  default:
> + 	    break;
> + 	  }
> ++
> ++	/* Don't record -fdebug-prefix-map in gcc command line
> ++	   switches in DWARF DW_AT_producer */
> ++	if (save_decoded_options[j].opt_index=3D=3DOPT_fdebug_prefix_map_ &&
> ++	    !dwarf_record_debug_prefix_map)
> ++	  continue;
> + 	switches.safe_push (save_decoded_options[j].orig_option_with_args_text=
);
> + 	len +=3D strlen (save_decoded_options[j].orig_option_with_args_text) +=
 1;
> + 	break;
> +--=20
> +1.9.1
> +
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--17pEHd4RhPHOinZp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbIY1wACgkQN1Ujt2V2gBwbgACgnWspykIfXrMl2cdyGeUjOcba
/0UAoKuZKd1ArYaXauwd9gcQTx3FDbdj
=m68v
-----END PGP SIGNATURE-----

--17pEHd4RhPHOinZp--
