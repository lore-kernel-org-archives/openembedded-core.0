Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1UFcMw-0004V5-1y
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Mar 2013 04:28:48 +0100
Received: from mail161-ch1-R.bigfish.com (10.43.68.249) by
	CH1EHSOBE017.bigfish.com (10.43.70.67) with Microsoft SMTP Server id
	14.1.225.23; Wed, 13 Mar 2013 02:41:48 +0000
Received: from mail161-ch1 (localhost [127.0.0.1])	by
	mail161-ch1-R.bigfish.com (Postfix) with ESMTP id BDF8A1C00F6	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2013 02:41:48 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz9371I936eI542I1432Izz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzz17326ah8275dh8275bhz2dh2a8h668h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ahbe9i1155h)
Received: from mail161-ch1 (localhost.localdomain [127.0.0.1]) by mail161-ch1
	(MessageSwitch) id 1363142506374607_5947;
	Wed, 13 Mar 2013 02:41:46 +0000 (UTC)
Received: from CH1EHSMHS030.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.242])	by mail161-ch1.bigfish.com (Postfix) with ESMTP id
	590A920004A	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2013 02:41:46 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS030.bigfish.com
	(10.43.70.30) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 13 Mar 2013 02:41:46 +0000
Received: from 039-SN2MPN1-022.039d.mgd.msft.net ([169.254.2.152]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0328.011; Wed, 13 Mar 2013 02:40:57 +0000
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [oe-core master v2] elfutils: Fix size passed to snprintf for
	invalid sh_name case
Thread-Index: AQHOHtVwarLnASdDTUeQd/VHXdp0wZii6nUQ
Date: Wed, 13 Mar 2013 02:40:57 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A0147BB42@039-SN2MPN1-022.039d.mgd.msft.net>
References: <1363060738-21499-1-git-send-email-zhenhua.luo@freescale.com>
In-Reply-To: <1363060738-21499-1-git-send-email-zhenhua.luo@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.134]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Guo Chunrong-B40290 <B40290@freescale.com>,
	Liu Ting-B28495 <B28495@freescale.com>,
	Luo Zhenhua-B19537 <B19537@freescale.com>
Subject: Re: [oe-core master v2] elfutils: Fix size passed to snprintf for invalid sh_name case
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Mar 2013 03:28:49 -0000
X-List-Received-Date: Wed, 13 Mar 2013 03:28:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

V3 is sent out to include a new patch for this build issue, please ignore t=
his one.=20


Best Regards,

Zhenhua

> -----Original Message-----
> From: Luo Zhenhua-B19537
> Sent: Tuesday, March 12, 2013 11:59 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Liu Ting-B28495; Guo Chunrong-B40290; Luo Zhenhua-B19537
> Subject: [oe-core master v2] elfutils: Fix size passed to snprintf for
> invalid sh_name case
>=20
> Following build error will appear on Fedora18.
> nm.c: In function 'show_symbols_sysv':
> nm.c:756:27: error: argument to 'sizeof' in 'snprintf' call is the same
> expression as the destination; did you mean to provide an explicit length=
?
> [-Werror=3Dsizeof-pointer-memaccess]
>     snprintf (name, sizeof name, "[invalid sh_name %#" PRIx32 "]",
>                            ^
>=20
> Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
> ---
>  ...ssed-to-snprintf-for-invalid-sh_name-case.patch |   27
> ++++++++++++++++++++
>  meta/recipes-devtools/elfutils/elfutils_0.148.bb   |    3 +-
>  2 files changed, 29 insertions(+), 1 deletions(-)  create mode 100644
> meta/recipes-devtools/elfutils/elfutils/nm-Fix-size-passed-to-snprintf-
> for-invalid-sh_name-case.patch
>=20
> diff --git a/meta/recipes-devtools/elfutils/elfutils/nm-Fix-size-passed-
> to-snprintf-for-invalid-sh_name-case.patch b/meta/recipes-
> devtools/elfutils/elfutils/nm-Fix-size-passed-to-snprintf-for-invalid-
> sh_name-case.patch
> new file mode 100644
> index 0000000..2b5dad3
> --- /dev/null
> +++ b/meta/recipes-devtools/elfutils/elfutils/nm-Fix-size-passed-to-snpr
> +++ intf-for-invalid-sh_name-case.patch
> @@ -0,0 +1,27 @@
> +Upstream-Status: Backport
> +
> +nm: Fix size passed to snprintf for invalid sh_name case.
> +native build failed as following on Fedora18:
> +nm.c: In function 'show_symbols_sysv':
> +nm.c:756:27: error: argument to 'sizeof' in 'snprintf' call is the same
> expression as the destination; did you mean to provide an explicit length=
?
> [-Werror=3Dsizeof-pointer-memaccess]
> +    snprintf (name, sizeof name, "[invalid sh_name %#" PRIx32 "]",
> +                           ^
> +
> +The original commit is
> +http://git.fedorahosted.org/cgit/elfutils.git/commit/src/nm.c?id=3D57bd6=
6
> +cabf6e6b9ecf622cdbf350804897a8df58
> +
> +Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
> +
> +--- elfutils-0.148/src/nm.c.org	2013-03-11 22:36:11.000000000 -0500
> ++++ elfutils-0.148/src/nm.c	2013-03-11 22:46:09.000000000 -0500
> +@@ -752,8 +752,9 @@
> + 			       gelf_getshdr (scn, &shdr_mem)->sh_name);
> +       if (unlikely (name =3D=3D NULL))
> + 	{
> +-	  name =3D alloca (sizeof "[invalid sh_name 0x12345678]");
> +-	  snprintf (name, sizeof name, "[invalid sh_name %#" PRIx32 "]",
> ++	  const size_t bufsz =3D sizeof "[invalid sh_name 0x12345678]";
> ++	  name =3D alloca (bufsz);
> ++	  snprintf (name, bufsz, "[invalid sh_name %#" PRIx32 "]",
> + 		    gelf_getshdr (scn, &shdr_mem)->sh_name);
> + 	}
> +       scnnames[elf_ndxscn (scn)] =3D name;
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
> b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
> index 45931b0..bc9e9c6 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317bb3\
>=20
> file://EXCEPTION;md5=3D570adcb0c1218ab57f2249c67d0ce417"
>  DEPENDS =3D "libtool bzip2 zlib virtual/libintl"
>=20
> -PR =3D "r9"
> +PR =3D "r10"
>=20
>  SRC_URI =3D "https://fedorahosted.org/releases/e/l/elfutils/elfutils-
> ${PV}.tar.bz2"
>=20
> @@ -31,6 +31,7 @@ SRC_URI +=3D "\
>  	file://mempcpy.patch \
>  	file://fix_for_gcc-4.7.patch \
>  	file://dso-link-change.patch \
> +	file://nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-
> case.patch \
>  "
>  # Only apply when building uclibc based target recipe
> SRC_URI_append_libc-uclibc =3D " file://uclibc-support.patch"
> --
> 1.7.5.4




