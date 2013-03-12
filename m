Received: from db3ehsobe004.messaging.microsoft.com ([213.199.154.142]
	helo=db3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1UFGpJ-0004n4-6V
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 05:28:43 +0100
Received: from mail93-db3-R.bigfish.com (10.3.81.253) by
	DB3EHSOBE010.bigfish.com (10.3.84.30) with Microsoft SMTP Server id
	14.1.225.23; Tue, 12 Mar 2013 03:56:53 +0000
Received: from mail93-db3 (localhost [127.0.0.1])	by mail93-db3-R.bigfish.com
	(Postfix) with ESMTP id DFFA61A0138	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2013 03:56:53 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz9371I936eI542I1432Izz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ahbe9i1155h)
Received: from mail93-db3 (localhost.localdomain [127.0.0.1]) by mail93-db3
	(MessageSwitch) id 1363060612159654_20838;
	Tue, 12 Mar 2013 03:56:52 +0000 (UTC)
Received: from DB3EHSMHS009.bigfish.com (unknown [10.3.81.250])	by
	mail93-db3.bigfish.com (Postfix) with ESMTP id 23CD43C0045	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2013 03:56:52 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS009.bigfish.com
	(10.3.87.109) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 12 Mar 2013 03:56:51 +0000
Received: from 039-SN2MPN1-022.039d.mgd.msft.net ([169.254.2.152]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0328.011; Tue, 12 Mar 2013 03:56:50 +0000
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [oe-core master] elfutils: Fix size passed to snprintf for
	invalid sh_name case
Thread-Index: AQHOHtHsxH8i1zNcmUmL29xgBPPTwJihbU9A
Date: Tue, 12 Mar 2013 03:56:49 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A0147AD60@039-SN2MPN1-022.039d.mgd.msft.net>
References: <1363059224-20654-1-git-send-email-zhenhua.luo@freescale.com>
In-Reply-To: <1363059224-20654-1-git-send-email-zhenhua.luo@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.134]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Liu Ting-B28495 <B28495@freescale.com>
Subject: Re: [oe-core master] elfutils: Fix size passed to snprintf for invalid sh_name case
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
X-List-Received-Date: Tue, 12 Mar 2013 04:28:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore the patch, v2 has been sent out to fix a semi-colon missing i=
ssue.=20


Best Regards,

Zhenhua


> -----Original Message-----
> From: Luo Zhenhua-B19537
> Sent: Tuesday, March 12, 2013 11:34 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Liu Ting-B28495; Luo Zhenhua-B19537
> Subject: [oe-core master] elfutils: Fix size passed to snprintf for
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
>  ...ssed-to-snprintf-for-invalid-sh_name-case.patch |   29
> ++++++++++++++++++++
>  meta/recipes-devtools/elfutils/elfutils_0.148.bb   |    3 +-
>  2 files changed, 31 insertions(+), 1 deletions(-)  create mode 100644
> meta/recipes-devtools/elfutils/elfutils/nm-Fix-size-passed-to-snprintf-
> for-invalid-sh_name-case.patch
>=20
> diff --git a/meta/recipes-devtools/elfutils/elfutils/nm-Fix-size-passed-
> to-snprintf-for-invalid-sh_name-case.patch b/meta/recipes-
> devtools/elfutils/elfutils/nm-Fix-size-passed-to-snprintf-for-invalid-
> sh_name-case.patch
> new file mode 100644
> index 0000000..f8e88a2
> --- /dev/null
> +++ b/meta/recipes-devtools/elfutils/elfutils/nm-Fix-size-passed-to-snpr
> +++ intf-for-invalid-sh_name-case.patch
> @@ -0,0 +1,29 @@
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
> +--- elfutils-0.148/src/nm.c.org	2013-03-11 22:09:13.000000000 -0500
> ++++ elfutils-0.148/src/nm.c	2013-03-11 22:11:00.000000000 -0500
> +@@ -752,9 +752,10 @@
> + 			       gelf_getshdr (scn, &shdr_mem)->sh_name);
> +       if (unlikely (name =3D=3D NULL))
> + 	{
> +-	  name =3D alloca (sizeof "[invalid sh_name 0x12345678]");
> +-	  snprintf (name, sizeof name, "[invalid sh_name %#" PRIx32 "]",
> +-		    gelf_getshdr (scn, &shdr_mem)->sh_name);
> ++          const size_t bufsz =3D sizeof "[invalid sh_name 0x12345678]"
> ++          name =3D alloca (bufsz);
> ++          snprintf (name, bufsz, "[invalid sh_name %#" PRIx32 "]",
> ++                  gelf_getshdr (scn, &shdr_mem)->sh_name);
> + 	}
> +       scnnames[elf_ndxscn (scn)] =3D name;
> +     }
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




