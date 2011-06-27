Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QbECi-0000Zw-Kt
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 17:58:29 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Jun 2011 08:54:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,432,1304319600"; d="scan'208";a="21106094"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by fmsmga002.fm.intel.com with ESMTP; 27 Jun 2011 08:54:46 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.226.213) by
	orsmsx603.amr.corp.intel.com (10.22.226.49) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 27 Jun 2011 08:54:45 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx601.amr.corp.intel.com ([10.22.226.213]) with mapi;
	Mon, 27 Jun 2011 08:54:45 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 27 Jun 2011 08:54:44 -0700
Thread-Topic: [OE-core] [PATCH] libtirpc: Upgrade 0.2.1 -> 0.2.2
Thread-Index: Acwx9oBy7lI+8hUzQKWL/Ks1lhd+1AC68QdA
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94DE03E331@orsmsx504.amr.corp.intel.com>
References: <1308868787-814-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1308868787-814-1-git-send-email-raj.khem@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH] libtirpc: Upgrade 0.2.1 -> 0.2.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Jun 2011 15:58:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Khem,
  I am trying to use glibc 2.14 for x32 work, And if you have a working lib=
c 2.14 recipe, I would like to try it out.

Thanks,
Nitin


> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Khem Raj
> Sent: Thursday, June 23, 2011 3:40 PM
> To: OE core
> Subject: [OE-core] [PATCH] libtirpc: Upgrade 0.2.1 -> 0.2.2
>=20
> Additionally bring in the nis headers which will be
> required when using eglibc 2.14 where rpc support
> is removed.
>=20
> Make it provide virtual/librpc
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../libtirpc-0.2.2/libtirpc-0.2.1-fortify.patch    |   26
> +++++++++++++
>  .../libtirpc-0.2.2-rpc-des-prot.patch              |   39
> ++++++++++++++++++++
>  .../libtirpc/libtirpc-0.2.2/remove-des-crypt.patch |   17 +++++++++
>  meta/recipes-extended/libtirpc/libtirpc_0.2.1.bb   |   21 -----------
>  meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb   |   33
> +++++++++++++++++
>  5 files changed, 115 insertions(+), 21 deletions(-)
>  create mode 100644 meta/recipes-extended/libtirpc/libtirpc-
> 0.2.2/libtirpc-0.2.1-fortify.patch
>  create mode 100644 meta/recipes-extended/libtirpc/libtirpc-
> 0.2.2/libtirpc-0.2.2-rpc-des-prot.patch
>  create mode 100644 meta/recipes-extended/libtirpc/libtirpc-
> 0.2.2/remove-des-crypt.patch
>  delete mode 100644 meta/recipes-extended/libtirpc/libtirpc_0.2.1.bb
>  create mode 100644 meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb
>=20
> diff --git a/meta/recipes-extended/libtirpc/libtirpc-0.2.2/libtirpc-
> 0.2.1-fortify.patch b/meta/recipes-extended/libtirpc/libtirpc-
> 0.2.2/libtirpc-0.2.1-fortify.patch
> new file mode 100644
> index 0000000..32644b5
> --- /dev/null
> +++ b/meta/recipes-extended/libtirpc/libtirpc-0.2.2/libtirpc-0.2.1-
> fortify.patch
> @@ -0,0 +1,26 @@
> +Fix a possible overflow (reported by _FORTIFY_SOURCE=3D2)
> +
> +Ported from Gentoo
> +
> +Upstream-Status: Unknown
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Index: libtirpc-0.2.1/src/getrpcport.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- libtirpc-0.2.1.orig/src/getrpcport.c
> ++++ libtirpc-0.2.1/src/getrpcport.c
> +@@ -54,11 +54,11 @@ getrpcport(host, prognum, versnum, proto
> +
> + 	if ((hp =3D gethostbyname(host)) =3D=3D NULL)
> + 		return (0);
> ++	if (hp->h_length !=3D sizeof(addr.sin_addr.s_addr))
> ++		return (0);
> + 	memset(&addr, 0, sizeof(addr));
> + 	addr.sin_family =3D AF_INET;
> + 	addr.sin_port =3D  0;
> +-	if (hp->h_length > sizeof(addr))
> +-	  hp->h_length =3D sizeof(addr);
> + 	memcpy(&addr.sin_addr.s_addr, hp->h_addr, (size_t)hp->h_length);
> + 	/* Inconsistent interfaces need casts! :-( */
> + 	return (pmap_getport(&addr, (u_long)prognum, (u_long)versnum,
> diff --git a/meta/recipes-extended/libtirpc/libtirpc-0.2.2/libtirpc-
> 0.2.2-rpc-des-prot.patch b/meta/recipes-extended/libtirpc/libtirpc-
> 0.2.2/libtirpc-0.2.2-rpc-des-prot.patch
> new file mode 100644
> index 0000000..c38a55b
> --- /dev/null
> +++ b/meta/recipes-extended/libtirpc/libtirpc-0.2.2/libtirpc-0.2.2-rpc-
> des-prot.patch
> @@ -0,0 +1,39 @@
> +From f2f43212b33dea42635061c82645287454a70107 Mon Sep 17 00:00:00 2001
> +From: Mike Frysinger <vapier@gentoo.org>
> +Date: Sat, 11 Jun 2011 15:21:55 -0400
> +Subject: [PATCH] add multiple inclusion protection to rpc/des.h
> +
> +If you try to include this file multiple times, you get a build
> failure
> +due to redefinitions of enums and such.
> +
> +Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> +---
> + tirpc/rpc/des.h |    5 +++++
> + 1 files changed, 5 insertions(+), 0 deletions(-)
> +
> +
> +Upstream-Status: Backport
> +
> +diff --git a/tirpc/rpc/des.h b/tirpc/rpc/des.h
> +index e3d6897..d2881ad 100644
> +--- a/tirpc/rpc/des.h
> ++++ b/tirpc/rpc/des.h
> +@@ -33,6 +33,9 @@
> +  * Copyright (c) 1986 by Sun Microsystems, Inc.
> +  */
> +
> ++#ifndef _RPC_DES_H_
> ++#define _RPC_DES_H_
> ++
> + #define DES_MAXLEN 	65536	/* maximum # of bytes to encrypt  */
> + #define DES_QUICKLEN	16	/* maximum # of bytes to encrypt quickly
> */
> +
> +@@ -80,3 +83,5 @@ struct desparams {
> +  * Software DES.
> +  */
> + extern int _des_crypt( char *, int, struct desparams * );
> ++
> ++#endif
> +--
> +1.7.5.3
> +
> diff --git a/meta/recipes-extended/libtirpc/libtirpc-0.2.2/remove-des-
> crypt.patch b/meta/recipes-extended/libtirpc/libtirpc-0.2.2/remove-des-
> crypt.patch
> new file mode 100644
> index 0000000..d94a585
> --- /dev/null
> +++ b/meta/recipes-extended/libtirpc/libtirpc-0.2.2/remove-des-
> crypt.patch
> @@ -0,0 +1,17 @@
> +http://sourceforge.net/mailarchive/message.php?msg_id=3D27636466
> +
> +Upstream-Status: Backport
> +
> +Index: libtirpc-0.2.2/src/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- libtirpc-0.2.2.orig/src/Makefile.am
> ++++ libtirpc-0.2.2/src/Makefile.am
> +@@ -50,7 +50,7 @@ libtirpc_la_SOURCES =3D auth_none.c auth_u
> +         rpc_callmsg.c rpc_generic.c rpc_soc.c rpcb_clnt.c rpcb_prot.c
> \
> +         rpcb_st_xdr.c svc.c svc_auth.c svc_dg.c svc_auth_unix.c
> svc_generic.c \
> +         svc_raw.c svc_run.c svc_simple.c svc_vc.c getpeereid.c \
> +-        auth_time.c auth_des.c authdes_prot.c des_crypt.c
> ++        auth_time.c auth_des.c authdes_prot.c
> +
> + ## XDR
> + libtirpc_la_SOURCES +=3D xdr.c xdr_rec.c xdr_array.c xdr_float.c
> xdr_mem.c xdr_reference.c xdr_stdio.c
> diff --git a/meta/recipes-extended/libtirpc/libtirpc_0.2.1.bb
> b/meta/recipes-extended/libtirpc/libtirpc_0.2.1.bb
> deleted file mode 100644
> index 6170e65..0000000
> --- a/meta/recipes-extended/libtirpc/libtirpc_0.2.1.bb
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -SUMMARY =3D "Transport-Independent RPC library"
> -DESCRIPTION =3D "Libtirpc is a port of Suns Transport-Independent RPC
> library to Linux"
> -SECTION =3D "libs/network"
> -PRIORITY =3D "optional"
> -HOMEPAGE =3D "http://sourceforge.net/projects/libtirpc/"
> -BUGTRACKER =3D
> "http://sourceforge.net/tracker/?group_id=3D183075&atid=3D903784"
> -LICENSE =3D "BSD"
> -LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D1c32c8e351f97e43e1ad6cf7f62de3bf \
> -
> file://src/netname.c;beginline=3D1;endline=3D27;md5=3Df8a8cd2cb25ac5aa167=
6736
> 4fb0e3c24"
> -PR =3D "r1"
> -
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/libtirpc/libtirpc-${PV}.tar.bz2"
> -
> -SRC_URI[md5sum] =3D "d77eb15f464bf9d6e66259eaf78b2a4e"
> -SRC_URI[sha256sum] =3D
> "ea77cadd63941fc4edbee7863d2c7094e6a18263d2a2c8922319aee91352ff41"
> -
> -inherit autotools
> -
> -do_install_append() {
> -	chown root:root ${D}${sysconfdir}/netconfig
> -}
> diff --git a/meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb
> b/meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb
> new file mode 100644
> index 0000000..f1f66e3
> --- /dev/null
> +++ b/meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb
> @@ -0,0 +1,33 @@
> +SUMMARY =3D "Transport-Independent RPC library"
> +DESCRIPTION =3D "Libtirpc is a port of Suns Transport-Independent RPC
> library to Linux"
> +SECTION =3D "libs/network"
> +PRIORITY =3D "optional"
> +HOMEPAGE =3D "http://sourceforge.net/projects/libtirpc/"
> +BUGTRACKER =3D
> "http://sourceforge.net/tracker/?group_id=3D183075&atid=3D903784"
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Df835cce8852481e4b2bbbdd23b5e47f3 \
> +
> file://src/netname.c;beginline=3D1;endline=3D27;md5=3Df8a8cd2cb25ac5aa167=
6736
> 4fb0e3c24"
> +PR =3D "r0"
> +
> +DEPENDS +=3D "xz-native"
> +PROVIDES =3D "virtual/librpc"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/${PN}/${P}.tar.bz2;name=3Dlibtirpc \
> +           ${GENTOO_MIRROR}/${PN}-glibc-nfs.tar.xz;name=3Dglibc-nfs \
> +           file://libtirpc-0.2.1-fortify.patch \
> +           file://libtirpc-0.2.2-rpc-des-prot.patch \
> +           file://remove-des-crypt.patch \
> +          "
> +SRC_URI[libtirpc.md5sum] =3D "74c41c15c2909f7d11d9c7bfa7db6273"
> +SRC_URI[libtirpc.sha256sum] =3D
> "f05eb17c85d62423858b8f74512cfe66a9ae1cedf93f03c2a0a32e04f0a33705"
> +SRC_URI[glibc-nfs.md5sum] =3D "5ae500b9d0b6b72cb875bc04944b9445"
> +SRC_URI[glibc-nfs.sha256sum] =3D
> "2677cfedf626f3f5a8f6e507aed5bb8f79a7453b589d684dbbc086e755170d83"
> +inherit autotools pkgconfig
> +
> +do_configure_prepend () {
> +        cp -r ${S}/../tirpc ${S}
> +}
> +
> +do_install_append() {
> +        chown root:root ${D}${sysconfdir}/netconfig
> +}
> --
> 1.7.4.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


