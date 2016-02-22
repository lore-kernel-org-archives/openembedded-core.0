Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8C70C771AA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 15:34:59 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id g62so178819394wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 07:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4r/2n13454bzLZT3EKg8ByW6jMe5Mmr3dTwHeWBhz1c=;
	b=ZAyLkVGTcnjQKmGIssLqa9xXrcMxTYoyLfDwtq7m0uohU6oKbFX3r2tJhdkt7MnR6a
	I79n6uGJrh8heeR/P1ET2CRO5ybN7QhMdgI9z5pAekwAccOO7krt7KEBJnXbmacPD6jX
	mDYLy+9gWeuHmYYG2UvG0QrgYJPvIMMoy7N6/DZJRVvwwQyPQ4mSDPs04ljDCpbdrk/T
	UiBXlhio/MJ3sIjauF/vjOapbfxu3XugruB6FGpozTqq1kg+RnPQ/n7p4lTFBYHnTR5G
	s2JaWcx0PuEX/TXMk2ZbVuMvkFt9JRJzxmCCsq8+IKbJExJ/mlaqDQPCV1zPfvMXFSVz
	Rxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=4r/2n13454bzLZT3EKg8ByW6jMe5Mmr3dTwHeWBhz1c=;
	b=HfIEfIn00ya/hG0zo9Lw8CpD5QWNzfdr4rA/xicrDiH63wfssSEbB7c9/C8U1evfI2
	fYoFN4eMdjcyL1Z7ZZOugrgpVm/8Xixv+pz6x8F3KNoHb0Mv2DW7c3DAee2e5UQoPC1s
	P9vTMsa8BtAKDyX6n+/A61zYlWdUmeViGfKvRf0pHH2HiSyv+3ohTNK5m0GtVlZ0VNY/
	i9wL1Llvv1cj5P37zDOm0zNDIwA4p0UjyQsFoYQFA89obobRxm27WBlbiZhKm0aPF6QY
	GqJ1Tqx4JV51SQeFBGaNE1NSVANFYMd5LYeE4DCCoBybU8r0XBlP8B1Zb5YUL9YfqPg0
	7MuQ==
X-Gm-Message-State: AG10YOR0S9jepRAvxat0sFKxs7MGt8rgxflkOi6jOmzGtonxxCn2LmpelHZbaqVyQFNsaQ==
X-Received: by 10.194.84.171 with SMTP id a11mr15009216wjz.91.1456155299702;
	Mon, 22 Feb 2016 07:34:59 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	i5sm25135416wjx.15.2016.02.22.07.34.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Feb 2016 07:34:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 22 Feb 2016 16:35:51 +0100
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20160222153551.GC6329@jama>
References: <cover.1454088695.git.hongxu.jia@windriver.com>
	<bb6291a740fc7e41120072e45fc2c5d8d93a0b5f.1454088695.git.hongxu.jia@windriver.com>
	<20160220130014.GA2589@jama> <56CAAE59.5030905@windriver.com>
MIME-Version: 1.0
In-Reply-To: <56CAAE59.5030905@windriver.com>
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
X-List-Received-Date: Mon, 22 Feb 2016 15:35:00 -0000
X-Groupsio-MsgNum: 78472
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kfjH4zxOES6UT95V"
Content-Disposition: inline

--kfjH4zxOES6UT95V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2016 at 02:44:41PM +0800, Hongxu Jia wrote:
> On 02/20/2016 09:00 PM, Martin Jansa wrote:
> > On Fri, Jan 29, 2016 at 12:35:55PM -0500, Hongxu Jia wrote:
> >> Add option '-gno-record-debug-prefix-map' and '-grecord-debug-prefix-m=
ap'
> >> for gcc. If '-gno-record-debug-prefix-map' is used, it does not record
> >> '-fdebug-prefix-map' to gcc command line switches in DWARF DW_AT_produ=
cer.
> > Did you check sstate signatures with these debug-prefix-map changes? It=
 seems to cause
> > everything to be MACHINE specific:
>=20
> Hi Martin,
>=20
> Could you explain your test details?
>=20
>  From your log, it seems the MACHINE was changed from "qemux86" to=20
> "qemux86copy".

I'm using
openembedded-core/scripts/sstate-diff-machines.sh instead of
oe-selftest, the same script is used to generate reports like this one:
http://lists.openembedded.org/pipermail/openembedded-core/2015-November/112=
795.html

But with today's oe-core I cannot reproduce it anymore and these were the
only issues reported today:
http://lists.openembedded.org/pipermail/openembedded-devel/2016-February/10=
6104.html

so it was fixed somewhere already, thanks for trying to reproduce it,
appreciate it.

> So I run test 'oe-selftest --run-tests=20
> sstatetests.SStateTests.test_sstate_sametune_samesigs'
> and it is OK.
>=20
> Here is the merged patch:
> ...
> -DEBUG_FLAGS ?=3D "-g -feliminate-unused-debug-types"
> +DEBUG_FLAGS ?=3D "-g -feliminate-unused-debug-types \
> +                -fdebug-prefix-map=3D${B}=3D/usr/src/${BPN} \
> +                -fdebug-prefix-map=3D${S}=3D/usr/src/${BPN} \
> +                -fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
> +                -fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \
> +"
> ...
>=20
> //Hongxu
>=20
>=20
> > ERROR: libgcc-initial different signature for task do_populate_sysroot.=
sigdata between qemux86 and qemux86copy
> > basehash changed from 03ccc547064deba9b8e2e290a6be9480 to 6f7eff2e90f30=
1e995298fee2c47b844
> > Variable FULL_OPTIMIZATION value changed from '-O2 -pipe -g -feliminate=
-unused-debug-types -fdebug-prefix-map=3DTOPDIR/work/i586-webos-linux/libgc=
c-initial/5.3.0-r0/gcc-5.3.0/build.i586-webos-linux.i586-webos-linux=3D/usr=
/src/libgcc> -fdebug-prefix-map=3DTOPDIR/work-shared/gcc-5.3.0-r0/gcc-5.3.0=
=3D/usr/src/libgcc> -fdebug-prefix-map=3DTOPDIR/sysroots/x86_64-linux=3D> -=
fdebug-prefix-map=3DTOPDIR/sysroots/qemux86=3D> ' to '-O2 -pipe -g -felimin=
ate-unused-debug-types -fdebug-prefix-map=3DTOPDIR/work/i586-webos-linux/li=
bgcc-initial/5.3.0-r0/gcc-5.3.0/build.i586-webos-linux.i586-webos-linux=3D/=
usr/src/libgcc> -fdebug-prefix-map=3DTOPDIR/work-shared/gcc-5.3.0-r0/gcc-5.=
3.0=3D/usr/src/libgcc> -fdebug-prefix-map=3DTOPDIR/sysroots/x86_64-linux=3D=
> -fdebug-prefix-map=3DTOPDIR/sysroots/qemux86copy=3D> '
> > runtaskdeps changed from ['gcclibgcc-initial_5.3.bb.do_extra_symlinks',=
 'gcclibgcc-initial_5.3.bb.do_install', 'gcclibgcc-initial_5.3.bb.do_multil=
ib_install'] to ['gcclibgcc-initial_5.3.bb.do_extra_symlinks', 'gcclibgcc-i=
nitial_5.3.bb.do_install', 'gcclibgcc-initial_5.3.bb.do_multilib_install']
> > oe-core/meta/recipes-devtools/gcc/libgcc-initial_5.3.bb.do_extra_symlin=
ks> with hash 0bdaebf5e23c90af7cea65f28a12c789
> >   changed to
> > oe-core/meta/recipes-devtools/gcc/libgcc-initial_5.3.bb.do_extra_symlin=
ks> with hash 2d1b031bbd46bc8c7401d37bd1edb7cc
> > oe-core/meta/recipes-devtools/gcc/libgcc-initial_5.3.bb.do_install> wit=
h hash b6f705a4bd3535b606e8214c5640933a
> >   changed to
> > oe-core/meta/recipes-devtools/gcc/libgcc-initial_5.3.bb.do_install> wit=
h hash da4e294376b70f951ca4af508fdc6a60
> > oe-core/meta/recipes-devtools/gcc/libgcc-initial_5.3.bb.do_multilib_ins=
tall> with hash 8473bfa83cba1ee93191182b9fd239d7
> >   changed to
> > oe-core/meta/recipes-devtools/gcc/libgcc-initial_5.3.bb.do_multilib_ins=
tall> with hash fcad4f5f4d7da576b7c2add3eb24fcc8
> > Hash for dependent task gcclibgcc-initial_5.3.bb.do_extra_symlinks chan=
ged from 0bdaebf5e23c90af7cea65f28a12c789 to 2d1b031bbd46bc8c7401d37bd1edb7=
cc
> > Hash for dependent task gcclibgcc-initial_5.3.bb.do_install changed fro=
m b6f705a4bd3535b606e8214c5640933a to da4e294376b70f951ca4af508fdc6a60
> > Hash for dependent task gcclibgcc-initial_5.3.bb.do_multilib_install ch=
anged from 8473bfa83cba1ee93191182b9fd239d7 to fcad4f5f4d7da576b7c2add3eb24=
fcc8
> >
> > Regards,
> >
> >
> >> The patch could make sure the debugging informaion does not has TMPDIR
> >> and also leaves gcc switches in.
> >>
> >> Compile without this fix:
> >> objdump -g packages-split/lib32-glibc-dev/usr/lib/gcrt1.o
> >> ...
> >> |    <5f>   DW_AT_producer    : (indirect string, offset: 0x1b): GNU C=
99 5.3.0
> >> -m32-march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -mpreferred-st=
ack-boundary=3D4
> >> -g -O2 -std=3Dgnu99 -fgnu89-inline -fdebug-prefix-map=3D/buildarea/rai=
d0/hjia/buil
> >> d-20160127-yocto-buildpath-2/tmp/sysroots/lib32-qemux86-64=3D
> >> -feliminate-unused-debug-types -fmerge-all-constants -frounding-math
> >> -ftls-model=3Dinitial-exec
> >> ...
> >>
> >> Compile with this fix:
> >> objdump -g packages-split/lib32-glibc-dev/usr/lib/gcrt1.o
> >> ...
> >> |    <5f>   DW_AT_producer    : (indirect string, offset: 0xa1): GNU C=
99 5.3.0
> >> -m32 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -mpreferred-s=
tack-boundary=3D4
> >> -g -O2 -std=3Dgnu99 -fgnu89-inline -feliminate-unused-debug-types -fme=
rge-all-constants
> >> -frounding-math -ftls-model=3Dinitial-exec
> >> ...
> >>
> >> [YOCTO #7058]
> >>
> >> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> >> ---
> >>   meta/conf/bitbake.conf                             |  1 +
> >>   meta/recipes-devtools/gcc/gcc-5.3.inc              |  3 +-
> >>   ...48-add-option-gno-record-debug-prefix-map.patch | 65 ++++++++++++=
++++++++++
> >>   3 files changed, 68 insertions(+), 1 deletion(-)
> >>   create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0048-add-option=
-gno-record-debug-prefix-map.patch
> >>
> >> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> >> index bebaaf4..e2e55e8 100644
> >> --- a/meta/conf/bitbake.conf
> >> +++ b/meta/conf/bitbake.conf
> >> @@ -552,6 +552,7 @@ DEBUG_FLAGS ?=3D "-g \
> >>       -fdebug-prefix-map=3D${S}=3D/usr/src/${BPN} \
> >>       -fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
> >>       -fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \
> >> +    -gno-record-debug-prefix-map \
> >>   "
> >>  =20
> >>   # Disabled until the option works properly -feliminate-dwarf2-dups
> >> diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc b/meta/recipes-devt=
ools/gcc/gcc-5.3.inc
> >> index 80999c1..3a36e50 100644
> >> --- a/meta/recipes-devtools/gcc/gcc-5.3.inc
> >> +++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
> >> @@ -76,7 +76,8 @@ SRC_URI =3D "\
> >>              file://0044-Adding-mmusl-as-a-musl-libc-specifier-and-the=
-necess.patch \
> >>              file://0045-Support-for-arm-linux-musl.patch \
> >>              file://0046-Get-rid-of-ever-broken-fixincludes-on-musl.pa=
tch \
> >> -	   file://0047-Fix-nios2-musl-build.patch \
> >> +           file://0047-Fix-nios2-musl-build.patch \
> >> +           file://0048-add-option-gno-record-debug-prefix-map.patch \
> >>             "
> >>  =20
> >>   BACKPORTS =3D ""
> >> diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0048-add-option-gno-rec=
ord-debug-prefix-map.patch b/meta/recipes-devtools/gcc/gcc-5.3/0048-add-opt=
ion-gno-record-debug-prefix-map.patch
> >> new file mode 100644
> >> index 0000000..e1efaeb
> >> --- /dev/null
> >> +++ b/meta/recipes-devtools/gcc/gcc-5.3/0048-add-option-gno-record-deb=
ug-prefix-map.patch
> >> @@ -0,0 +1,65 @@
> >> +From f1c5f8e9b568122c9a5afd323fd6d76250b83c94 Mon Sep 17 00:00:00 2001
> >> +From: Hongxu Jia <hongxu.jia@windriver.com>
> >> +Date: Thu, 28 Jan 2016 15:25:23 +0800
> >> +Subject: [PATCH] add option gno-record-debug-prefix-map
> >> +
> >> +If option gno-record-debug-prefix-map used, it does not
> >> +record -fdebug-prefix-map to gcc command line switches
> >> +in DWARF DW_AT_producer.
> >> +
> >> +Upstream-Status: Inappropriate [oe specific]
> >> +
> >> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> >> +---
> >> + gcc/common.opt  | 8 ++++++++
> >> + gcc/dwarf2out.c | 8 ++++++++
> >> + 2 files changed, 16 insertions(+)
> >> +
> >> +diff --git a/gcc/common.opt b/gcc/common.opt
> >> +index 0c4f86b..e4c6bd6 100644
> >> +--- a/gcc/common.opt
> >> ++++ b/gcc/common.opt
> >> +@@ -2516,6 +2516,14 @@ grecord-gcc-switches
> >> + Common RejectNegative Var(dwarf_record_gcc_switches,1)
> >> + Record gcc command line switches in DWARF DW_AT_producer.
> >> +
> >> ++gno-record-debug-prefix-map
> >> ++Common RejectNegative Var(dwarf_record_debug_prefix_map,0) Init(1)
> >> ++Don't record -fdebug-prefix-map in gcc command line switches in DWAR=
F DW_AT_producer.
> >> ++
> >> ++grecord-debug-prefix-map
> >> ++Common RejectNegative Var(dwarf_record_debug_prefix_map,1)
> >> ++Record -fdebug-prefix-map in gcc command line switches in DWARF DW_A=
T_producer.
> >> ++
> >> + gno-split-dwarf
> >> + Common Driver RejectNegative Var(dwarf_split_debug_info,0) Init(0)
> >> + Don't generate debug information in separate .dwo files
> >> +diff --git a/gcc/dwarf2out.c b/gcc/dwarf2out.c
> >> +index f90329b..646a706 100644
> >> +--- a/gcc/dwarf2out.c
> >> ++++ b/gcc/dwarf2out.c
> >> +@@ -19383,6 +19383,8 @@ gen_producer_string (void)
> >> +       case OPT_SPECIAL_input_file:
> >> +       case OPT_grecord_gcc_switches:
> >> +       case OPT_gno_record_gcc_switches:
> >> ++      case OPT_grecord_debug_prefix_map:
> >> ++      case OPT_gno_record_debug_prefix_map:
> >> +       case OPT__output_pch_:
> >> +       case OPT_fdiagnostics_show_location_:
> >> +       case OPT_fdiagnostics_show_option:
> >> +@@ -19415,6 +19417,12 @@ gen_producer_string (void)
> >> + 	  default:
> >> + 	    break;
> >> + 	  }
> >> ++
> >> ++	/* Don't record -fdebug-prefix-map in gcc command line
> >> ++	   switches in DWARF DW_AT_producer */
> >> ++	if (save_decoded_options[j].opt_index=3D=3DOPT_fdebug_prefix_map_ &&
> >> ++	    !dwarf_record_debug_prefix_map)
> >> ++	  continue;
> >> + 	switches.safe_push (save_decoded_options[j].orig_option_with_args_t=
ext);
> >> + 	len +=3D strlen (save_decoded_options[j].orig_option_with_args_text=
) + 1;
> >> + 	break;
> >> +--
> >> +1.9.1
> >> +
> >> --=20
> >> 1.9.1
> >>
> >> --=20
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kfjH4zxOES6UT95V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbLKtYACgkQN1Ujt2V2gBwP/gCfZy3R8k8uumKO+GtQPtd3cZOe
7Y0An0iQ+fIJdu1ObcSdRT4mEEDfsO72
=NlOc
-----END PGP SIGNATURE-----

--kfjH4zxOES6UT95V--
