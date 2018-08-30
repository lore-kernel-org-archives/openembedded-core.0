Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id D387774596
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 07:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id EC7F418495;
	Thu, 30 Aug 2018 09:44:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id oqa5x02PQ1Fg; Thu, 30 Aug 2018 09:44:46 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 4206418454;
	Thu, 30 Aug 2018 09:44:46 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D3FFA1E077;
	Thu, 30 Aug 2018 09:44:45 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C8DAC1E06A;
	Thu, 30 Aug 2018 09:44:45 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Thu, 30 Aug 2018 09:44:45 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id 196FC204F;
	Thu, 30 Aug 2018 09:44:46 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Thu, 30 Aug 2018 09:44:45 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Thu, 30 Aug 2018 09:44:46 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, Markus Lehtonen
	<markus.lehtonen@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 3/7] sysklogd: Use update-alternatives
Thread-Index: AQHUQBVfqnyb8Qvxo0aTMqDV5J95a6TX5+sw
Date: Thu, 30 Aug 2018 07:44:46 +0000
Message-ID: <c712539f5fd74697831fb7ed806e6fea@XBOX02.axis.com>
References: <cover.1535601148.git.raj.khem@gmail.com>
	<fae07991f994982404930e78c225db460bd14ae6.1535601148.git.raj.khem@gmail.com>
In-Reply-To: <fae07991f994982404930e78c225db460bd14ae6.1535601148.git.raj.khem@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] sysklogd: Use update-alternatives
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
X-List-Received-Date: Thu, 30 Aug 2018 07:44:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Khem Raj
> Sent: den 30 augusti 2018 05:56
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 3/7] sysklogd: Use update-alternatives
>=20
> busybox also provides klogd and syslogd, this change makes it coexist
> peacefully. Currently rootfs fails in situations where both of them are
> providing these binaries and busybox postinsts fail
>=20
> update-alternatives: Error: not linking
> /mnt/a/oe/build/tmp/work/qemuriscv64-bec-linux/core-image-full-
> cmdline/1.0-r0/rootfs/sbin/klogd
> to /bin/busybox.nosuid since
> /mnt/a/oe/build/tmp/work/qemuriscv64-bec-linux/core-image-full-
> cmdline/1.0-r0/rootfs/sbin/klogd
> exists and is not a link
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-extended/sysklogd/sysklogd.inc | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc
> b/meta/recipes-extended/sysklogd/sysklogd.inc
> index fc4e67c18e..2a8bed00f3 100644
> --- a/meta/recipes-extended/sysklogd/sysklogd.inc
> +++ b/meta/recipes-extended/sysklogd/sysklogd.inc
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c=
2336e835926c2166c28b \
>                      file://klogd.c;beginline=3D2;endline=3D19;md5=3D7e87=
ed0ae6142de079bce738c10c899d \
>                     "
>=20
> -inherit update-rc.d systemd
> +inherit update-rc.d systemd update-alternatives
>=20
>  SRC_URI =3D "http://www.infodrom.org/projects/sysklogd/download/sysklogd=
-${PV}.tar.gz \
>             file://no-strip-install.patch \
> @@ -70,3 +70,9 @@ python () {
>      if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False,=
 d):
>          d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
>  }
> +
> +ALTERNATIVE_PRIORITY =3D "100"
> +ALTERNATIVE_${PN} =3D "klogd syslogd"
> +ALTERNATIVE_LINK_NAME[klogd] =3D "${base_sbindir}/klogd"
> +ALTERNATIVE_LINK_NAME[syslogd] =3D "${base_sbindir}/syslogd"
> +
> --
> 2.18.0

This is a (partial) revert of commit 988aad01b2 (sysklogd: don't use=20
update-alternatives). Can you come to an agreement regarding which is=20
the correct solution?

//Peter


