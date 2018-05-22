Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 97CA574A3A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 19:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id D3997183BF;
	Tue, 22 May 2018 21:04:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id rp54GwS66pvb; Tue, 22 May 2018 21:04:58 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 00723183CC;
	Tue, 22 May 2018 21:04:58 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D03BF1A060;
	Tue, 22 May 2018 21:04:57 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C2B2F1A05F;
	Tue, 22 May 2018 21:04:57 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 22 May 2018 21:04:57 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id B67CA1A82;
	Tue, 22 May 2018 21:04:57 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 22 May 2018 21:04:57 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Tue, 22 May 2018 21:04:57 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Hongzhi.Song <hongzhi.song@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [meta-oe][PATCH] Turbostat: add a necessary recipe to
	meta-oe
Thread-Index: AQHT8XziCf4IAZMibkanRLFEAwes1qQ8FhoA
Date: Tue, 22 May 2018 19:04:57 +0000
Message-ID: <e131262c00064b5baac1ee6f65a9940f@XBOX02.axis.com>
References: <20180522032646.33000-1-hongzhi.song@windriver.com>
In-Reply-To: <20180522032646.33000-1-hongzhi.song@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [meta-oe][PATCH] Turbostat: add a necessary recipe to	meta-oe
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
X-List-Received-Date: Tue, 22 May 2018 19:05:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Hongzhi.Song
> Sent: den 22 maj 2018 05:27
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [meta-oe][PATCH] Turbostat: add a necessary recipe
> to meta-oe

This should be sent to openembedded-devel@lists.openembedded.org instead=20
as it relates to meta-oe and not meta.

> This is an efficient tool to reflect the status of processors.
> Turbostat reports processor topology, frequency, idle power-state
> statistics, temperature and power on processors.
>=20
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  meta-oe/recipes-kernel/turbostat/turbostat.bb | 53
> +++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 meta-oe/recipes-kernel/turbostat/turbostat.bb
>=20
> diff --git a/meta-oe/recipes-kernel/turbostat/turbostat.bb b/meta-
> oe/recipes-kernel/turbostat/turbostat.bb
> new file mode 100644
> index 000000000..f4614b406
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/turbostat/turbostat.bb
> @@ -0,0 +1,53 @@
> +SUMMARY =3D "Report processor frequency and idle statistics"
> +DESCRIPTION =3D "turbostat  reports processor topology, frequency, idle =
\
> +power-state statistics, temperature and power on modern X86 processors. =
\
> +Either command is forked and statistics are printed upon its completion,=
 \
> +or statistics are printed periodically."
> +
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7=
cd7"
> +
> +inherit kernelsrc
> +PROVIDES =3D "virtual/turbostat"

Why is virtual/turbostat needed? Are there likely to be alternatives?

> +do_populate_lic[depends] +=3D "virtual/kernel:do_patch"
> +do_configure[depends] +=3D "virtual/kernel:do_shared_workdir"
> +
> +B =3D "${WORKDIR}/${BPN}-${PV}"
> +
> +EXTRA_OEMAKE =3D '\

It is better to use " here and ' around ${CC} and ${AR} below.

> +    -C ${S}/tools/power/x86/turbostat \

What about other architectures? If they are not supported, you should add:=
=20

COMPATIBLE_MACHINE =3D "x86"

> +    O=3D${B} \
> +    CROSS_COMPILE=3D${TARGET_PREFIX} \
> +    ARCH=3D${ARCH} \
> +    CC=3D"${CC}" \
> +    AR=3D"${AR}" \
> +'

Combine the two EXTRA_OEMAKE into one.

> +
> +EXTRA_OEMAKE +=3D "\
> +    'prefix=3D${prefix}' \
> +    'bindir=3D${bindir}' \
> +    'sharedir=3D${datadir}' \
> +    'sysconfdir=3D${sysconfdir}' \
> +    'sharedir=3D${@os.path.relpath(datadir, prefix)}' \
> +    'mandir=3D${@os.path.relpath(mandir, prefix)}' \
> +    'infodir=3D${@os.path.relpath(infodir, prefix)}' \
> +"
> +
> +do_compile() {
> +	# Linux kernel build system is expected to do the right thing
> +	unset CFLAGS
> +	oe_runmake turbostat
> +}
> +
> +do_install() {
> +	# Linux kernel build system is expected to do the right thing
> +	unset CFLAGS
> +	oe_runmake DESTDIR=3D${D} install
> +}
> +
> +python do_package_prepend() {
> +    d.setVar('PKGV', d.getVar("KERNEL_VERSION", True).split("-")[0])
> +}
> +
> +TARGET_CC_ARCH +=3D "${LDFLAGS}"
> --
> 2.11.0

//Peter


