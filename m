Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.web09.33616.1605038919005898443
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2020 12:08:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@cisco.com header.s=iport header.b=AkHOi2NJ;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: dzagorui@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=5149; q=dns/txt; s=iport;
  t=1605038917; x=1606248517;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cBWek+nK9rHrY8q39K/iMSuj4gJhljhHCGiKuYn25n8=;
  b=AkHOi2NJ5q8KPBpIcs3pGtZS/8d1aQb99++pbM2s/8qQ1kfoiOm35YYy
   fx0OchsjALk07xzB7osZ4UUI6Nama4L5V/ipQ2bKyjwpTFDRqwPBI4GLF
   PPVSTXfB76G8+7YkTj+ekgsZS6IkcWjB7HBuLNyxkO6YW7VIb81IC2I+a
   Q=;
X-IPAS-Result: =?us-ascii?q?A0DPCADs8qpffZldJa1iHgEBCxIMQIRtWS8uCpVWihWSF?=
 =?us-ascii?q?wsBAQENAQEYDQgCBAEBhEoCghQCJTgTAgMBAQEDAgMBAQEBBQEBAQIBBgQUA?=
 =?us-ascii?q?QGGPAyFcgEBAQEDASYnKxACAQgRAwEBAQEJJQ8SBwkBHQgCBA4FHQSDBoJVA?=
 =?us-ascii?q?y4Prj50gQEzhD4BCwEFQ0SCRg2CJIE4hluGZBuBQT+BEYMSPoIbQgQBFoENO?=
 =?us-ascii?q?YV2BJw+mxdUCiCCTYkNix2BVIUTIoRCnTKeToJukmECERWBMzghgVlwFYMkC?=
 =?us-ascii?q?UcXAg1WjgCIToVEdAIJLQIGCgEBAwl8iwaBNQGBEAEB?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.77,467,1596499200"; 
   d="scan'208";a="622814035"
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
  by alln-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 10 Nov 2020 20:08:36 +0000
Received: from XCH-ALN-001.cisco.com (xch-aln-001.cisco.com [173.36.7.11])
	by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTPS id 0AAK8bmF008868
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 10 Nov 2020 20:08:37 GMT
Received: from xch-aln-004.cisco.com (173.36.7.14) by XCH-ALN-001.cisco.com
 (173.36.7.11) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 10 Nov
 2020 14:08:37 -0600
Received: from xch-aln-004.cisco.com ([173.36.7.14]) by XCH-ALN-004.cisco.com
 ([173.36.7.14]) with mapi id 15.00.1497.000; Tue, 10 Nov 2020 14:08:37 -0600
From: "Denys Zagorui -X (dzagorui - GLOBALLOGIC INC@Cisco)" <dzagorui@cisco.com>
To: Khem Raj <raj.khem@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] binutils: reproducibility: reuse debug-prefix-map for stabs
Thread-Topic: [OE-core] [PATCH] binutils: reproducibility: reuse
 debug-prefix-map for stabs
Thread-Index: AQHWt5HkpPvCVEruYkqqJpbjbAEgB6nBy0d+
Date: Tue, 10 Nov 2020 20:08:37 +0000
Message-ID: <1605038916765.89270@cisco.com>
References: <1605032052-91580-1-git-send-email-dzagorui@cisco.com>,<CAMKF1sqMhUQRY7riVpBqZdmZ4qZpZCMcpsdVeismjO-x39Y0VQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqMhUQRY7riVpBqZdmZ4qZpZCMcpsdVeismjO-x39Y0VQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [173.38.209.10]
MIME-Version: 1.0
X-Outbound-SMTP-Client: 173.36.7.11, xch-aln-001.cisco.com
X-Outbound-Node: rcdn-core-2.cisco.com
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Yes, i'll propose it for dunfell also
________________________________________
From: Khem Raj <raj.khem@gmail.com>
Sent: Tuesday, November 10, 2020 8:47 PM
To: Denys Zagorui -X (dzagorui - GLOBALLOGIC INC at Cisco)
Cc: Patches and discussions about the oe-core layer
Subject: Re: [OE-core] [PATCH] binutils: reproducibility: reuse debug-pref=
ix-map for stabs

This looks good. Can you also propose it for dunfell?

On Tue, Nov 10, 2020 at 10:14 AM Denys Zagorui -X (dzagorui -
GLOBALLOGIC INC@Cisco) via lists.openembedded.org
<dzagorui=3Dcisco.com@lists.openembedded.org> wrote:
>
> powerpc 32bit Linux Kernel widely uses .stabs pseudo-op to
> produce debugging information in stabs format. Faced an issue
> that during Linux Kernel build with Yocto build system for 32bit
> powerpc platform resulting vmlinux contains absolute path in
> .stabstr section that cannot be remapped with -fdebug-prefix-map
> option.
>
> Yocto uses scripts/mkmakefile Linux Kernel build approach that
> allows to store all generated files outside of kernel source
> tree. With this approach each compilier invocation is performed
> with an absolute path to a file that will be compiled and this
> absolute path is recorded in init stab. There is no way to remap
> this path.
>
> Reuse remap_debug_filename api to make -fdebug-prefix-map flag
> aplicable for init stab.
>
> Signed-off-by: Denys Zagorui <dzagorui@cisco.com>
> ---
>  meta/recipes-devtools/binutils/binutils-2.35.inc   |  1 +
>  ...-reproducibility-for-stabs-debugging-data.patch | 35 +++++++++++++++=
+++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0017-gas-imp=
rove-reproducibility-for-stabs-debugging-data.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.35.inc b/meta/rec=
ipes-devtools/binutils/binutils-2.35.inc
> index 5ae9ec4..bc9107b 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.35.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.35.inc
> @@ -41,5 +41,6 @@ SRC_URI =3D "\
>       file://0014-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch \
>       file://0015-sync-with-OE-libtool-changes.patch \
>       file://0016-Check-for-clang-before-checking-gcc-version.patch \
> +     file://0017-gas-improve-reproducibility-for-stabs-debugging-data.p=
atch \
>  "
>  S  =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/0017-gas-improve-re=
producibility-for-stabs-debugging-data.patch b/meta/recipes-devtools/binuti=
ls/binutils/0017-gas-improve-reproducibility-for-stabs-debugging-data.patch
> new file mode 100644
> index 0000000..42e0c1c
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0017-gas-improve-reproduci=
bility-for-stabs-debugging-data.patch
> @@ -0,0 +1,35 @@
> +From aa6586e80fc6fcd739aa959a71e4cf064cdef072 Mon Sep 17 00:00:00 2001
> +From: Denys Zagorui <dzagorui@cisco.com>
> +Date: Mon, 9 Nov 2020 15:39:10 +0000
> +Subject: [PATCH] gas: improve reproducibility for stabs debugging data =
format
> +
> +       * config/obj-elf (obj_elf_init_stab_section): Improve
> +       reproducibility for stabs debugging data format
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb=
.git;a=3Dcommit;h=3D0541201782c006c09d029d18a45c6e743cfea906]
> +---
> + gas/config/obj-elf.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/gas/config/obj-elf.c b/gas/config/obj-elf.c
> +index de22b5a1da..2025df8542 100644
> +--- a/gas/config/obj-elf.c
> ++++ b/gas/config/obj-elf.c
> +@@ -2374,12 +2374,13 @@ obj_elf_init_stab_section (segT seg)
> +   p =3D frag_more (12);
> +   /* Zero it out.  */
> +   memset (p, 0, 12);
> +-  file =3D as_where (NULL);
> ++  file =3D remap_debug_filename (as_where (NULL));
> +   stabstr_name =3D concat (segment_name (seg), "str", (char *) NULL);
> +   stroff =3D get_stab_string_offset (file, stabstr_name, TRUE);
> +   know (stroff =3D=3D 1 || (stroff =3D=3D 0 && file[0] =3D=3D '\0'));
> +   md_number_to_chars (p, stroff, 4);
> +   seg_info (seg)->stabu.p =3D p;
> ++  xfree ((char *) file);
> + }
> +
> + #endif
> +--
> +2.20.1
> +
> --
> 2.7.4
>
>
>=20
>
