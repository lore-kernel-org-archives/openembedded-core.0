Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id D1B216AC4B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 17:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 2A78C2E3D1;
	Fri, 29 Jan 2016 18:47:04 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id US6EI7Pi06yo; Fri, 29 Jan 2016 18:47:02 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 7B7EC2E39D;
	Fri, 29 Jan 2016 18:47:02 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 6CADD13FC;
	Fri, 29 Jan 2016 18:47:02 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 5FDF311F4;
	Fri, 29 Jan 2016 18:47:02 +0100 (CET)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id 599A13E3EC;
	Fri, 29 Jan 2016 18:47:02 +0100 (CET)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1104.5;
	Fri, 29 Jan 2016 18:47:02 +0100
Received: from XBOX02.axis.com ([fe80::bcea:88d5:e1ff:8e04]) by
	XBOX02.axis.com ([fe80::bcea:88d5:e1ff:8e04%12]) with mapi id
	15.00.1104.000; Fri, 29 Jan 2016 18:47:01 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Hongxu Jia <hongxu.jia@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "liezhi.yang@windriver.com"
	<liezhi.yang@windriver.com>, "raj.khem@gmail.com" <raj.khem@gmail.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 2/5] gcc-5.3.inc/base.bbclass: add gcc option
	to	not record -fdebug-prefix-map to debugging info
Thread-Index: AQHRWruda3Il6SpPrkCLMUfDJZ/NAp8SwoAQ
Date: Fri, 29 Jan 2016 17:47:01 +0000
Message-ID: <718c652c42b84c58a04e9c33261b30ba@XBOX02.axis.com>
References: <cover.1454088695.git.hongxu.jia@windriver.com>
	<bb6291a740fc7e41120072e45fc2c5d8d93a0b5f.1454088695.git.hongxu.jia@windriver.com>
In-Reply-To: <bb6291a740fc7e41120072e45fc2c5d8d93a0b5f.1454088695.git.hongxu.jia@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.55]
MIME-Version: 1.0
Subject: Re: [PATCH 2/5] gcc-5.3.inc/base.bbclass: add gcc option to	not record -fdebug-prefix-map to debugging info
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
X-List-Received-Date: Fri, 29 Jan 2016 17:47:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Wouldn't it be better to swap the first and second commit and then=20
move the addition of -gno-record-debug-prefix-map to the other commit=20
where -fdebug-prefix-map are added.=20

You must also remember that not all use the compiler provided by=20
OE-Core, so adding -gno-record-debug-prefix-map unconditionally to=20
DEBUG_CFLAGS will break with unpatched compilers... (This also=20
indicates that "Upstream-Status: Inappropriate [oe specific]" may=20
not be quite right if you want this to be supported by other=20
compiler versions).

//Peter

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Hongxu Jia
> Sent: den 29 januari 2016 18:36
> To: openembedded-core@lists.openembedded.org;
> liezhi.yang@windriver.com; raj.khem@gmail.com;
> richard.purdie@linuxfoundation.org
> Subject: [OE-core] [PATCH 2/5] gcc-5.3.inc/base.bbclass: add gcc option
> to not record -fdebug-prefix-map to debugging info
>=20
> Add option '-gno-record-debug-prefix-map' and '-grecord-debug-prefix-
> map'
> for gcc. If '-gno-record-debug-prefix-map' is used, it does not record
> '-fdebug-prefix-map' to gcc command line switches in DWARF
> DW_AT_producer.
>=20
> The patch could make sure the debugging informaion does not has TMPDIR
> and also leaves gcc switches in.
>=20
> Compile without this fix:
> objdump -g packages-split/lib32-glibc-dev/usr/lib/gcrt1.o
> ...
> |    <5f>   DW_AT_producer    : (indirect string, offset: 0x1b): GNU
> C99 5.3.0
> -m32-march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -mpreferred-stack=
-
> boundary=3D4
> -g -O2 -std=3Dgnu99 -fgnu89-inline -fdebug-prefix-
> map=3D/buildarea/raid0/hjia/buil
> d-20160127-yocto-buildpath-2/tmp/sysroots/lib32-qemux86-64=3D
> -feliminate-unused-debug-types -fmerge-all-constants -frounding-math
> -ftls-model=3Dinitial-exec
> ...
>=20
> Compile with this fix:
> objdump -g packages-split/lib32-glibc-dev/usr/lib/gcrt1.o
> ...
> |    <5f>   DW_AT_producer    : (indirect string, offset: 0xa1): GNU
> C99 5.3.0
> -m32 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -mpreferred-stac=
k-
> boundary=3D4
> -g -O2 -std=3Dgnu99 -fgnu89-inline -feliminate-unused-debug-types -
> fmerge-all-constants
> -frounding-math -ftls-model=3Dinitial-exec
> ...
>=20
> [YOCTO #7058]
>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/conf/bitbake.conf                             |  1 +
>  meta/recipes-devtools/gcc/gcc-5.3.inc              |  3 +-
>  ...48-add-option-gno-record-debug-prefix-map.patch | 65
> ++++++++++++++++++++++
>  3 files changed, 68 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0048-add-option-
> gno-record-debug-prefix-map.patch
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
>=20
>  # Disabled until the option works properly -feliminate-dwarf2-dups
> diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc b/meta/recipes-
> devtools/gcc/gcc-5.3.inc
> index 80999c1..3a36e50 100644
> --- a/meta/recipes-devtools/gcc/gcc-5.3.inc
> +++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
> @@ -76,7 +76,8 @@ SRC_URI =3D "\
>             file://0044-Adding-mmusl-as-a-musl-libc-specifier-and-the-
> necess.patch \
>             file://0045-Support-for-arm-linux-musl.patch \
>             file://0046-Get-rid-of-ever-broken-fixincludes-on-
> musl.patch \
> -	   file://0047-Fix-nios2-musl-build.patch \
> +           file://0047-Fix-nios2-musl-build.patch \
> +           file://0048-add-option-gno-record-debug-prefix-map.patch \
>            "
>=20
>  BACKPORTS =3D ""
> diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0048-add-option-gno-
> record-debug-prefix-map.patch b/meta/recipes-devtools/gcc/gcc-5.3/0048-
> add-option-gno-record-debug-prefix-map.patch
> new file mode 100644
> index 0000000..e1efaeb
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-5.3/0048-add-option-gno-record-
> debug-prefix-map.patch
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
> +
> ++gno-record-debug-prefix-map
> ++Common RejectNegative Var(dwarf_record_debug_prefix_map,0) Init(1)
> ++Don't record -fdebug-prefix-map in gcc command line switches in DWARF
> DW_AT_producer.
> ++
> ++grecord-debug-prefix-map
> ++Common RejectNegative Var(dwarf_record_debug_prefix_map,1)
> ++Record -fdebug-prefix-map in gcc command line switches in DWARF
> DW_AT_producer.
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
> + 	switches.safe_push
> (save_decoded_options[j].orig_option_with_args_text);
> + 	len +=3D strlen
> (save_decoded_options[j].orig_option_with_args_text) + 1;
> + 	break;
> +--
> +1.9.1
> +
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

