Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QbHSX-0000tw-H0
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 21:27:01 +0200
Received: by pzk36 with SMTP id 36so3601854pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2011 12:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=Hs1RPRPULXU3gjQYXzcZMpN/S2ivpfjDrQHk/grdsWc=;
	b=QwSD+54aaZcek9UKjfU6TJm4zBARTpJrxZ3yTnAKkS12E91+Lw7rH9JuGHNCH9zAAx
	zg2mY5NWX+YXG+F0kAiCOCvn17b1nAWXgr0UVVxAJoocAITBREU3zlOEhrxPrWEzD9m4
	xyt7LvYIcaBVUMOgdqu1Qp9t9EG1qccdDPgIg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=u0aFieaNuvU7UnMzQCiwmqFpkpsDtcRHuhgHVok7f557cg1+rssMzuEX14OMKK7ob5
	FfE50Mib5E2+PwOj9j0VOupmU/NmOo7ZCuJHJOlzjD+V/N309am8/zt8hg2dD8qt8ha5
	zECFKt5jVLk04QR05XgQ1UQdVZ9jWvvnqG4mw=
Received: by 10.68.59.98 with SMTP id y2mr2228822pbq.160.1309202599972; Mon,
	27 Jun 2011 12:23:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.105 with HTTP; Mon, 27 Jun 2011 12:22:49 -0700 (PDT)
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94DE03E331@orsmsx504.amr.corp.intel.com>
References: <1308868787-814-1-git-send-email-raj.khem@gmail.com>
	<9DA5872FEF993D41B7173F58FCF6BE94DE03E331@orsmsx504.amr.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Jun 2011 12:22:49 -0700
Message-ID: <BANLkTinp_5g1mGuEsSek1mcwPUHaarFgtg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 27 Jun 2011 19:27:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2011 at 8:54 AM, Kamble, Nitin A
<nitin.a.kamble@intel.com> wrote:
> Hi Khem,
> =C2=A0I am trying to use glibc 2.14 for x32 work, And if you have a worki=
ng libc 2.14 recipe, I would like to try it out.


http://git.openembedded.net/cgit.cgi/openembedded-core-contrib/log/?h=3Dkra=
j/eglibc-2.14

It has new recipes and the patches to switch to use libtirpc. But its
not complete
yet.

give it a try and let me know if you see issues.

>
> Thanks,
> Nitin
>
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Khem Raj
>> Sent: Thursday, June 23, 2011 3:40 PM
>> To: OE core
>> Subject: [OE-core] [PATCH] libtirpc: Upgrade 0.2.1 -> 0.2.2
>>
>> Additionally bring in the nis headers which will be
>> required when using eglibc 2.14 where rpc support
>> is removed.
>>
>> Make it provide virtual/librpc
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0.../libtirpc-0.2.2/libtirpc-0.2.1-fortify.patch =C2=A0 =C2=A0| =C2=
=A0 26
>> +++++++++++++
>> =C2=A0.../libtirpc-0.2.2-rpc-des-prot.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 39
>> ++++++++++++++++++++
>> =C2=A0.../libtirpc/libtirpc-0.2.2/remove-des-crypt.patch | =C2=A0 17 +++=
++++++
>> =C2=A0meta/recipes-extended/libtirpc/libtirpc_0.2.1.bb =C2=A0 | =C2=A0 2=
1 -----------
>> =C2=A0meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb =C2=A0 | =C2=A0 3=
3
>> +++++++++++++++++
>> =C2=A05 files changed, 115 insertions(+), 21 deletions(-)
>> =C2=A0create mode 100644 meta/recipes-extended/libtirpc/libtirpc-
>> 0.2.2/libtirpc-0.2.1-fortify.patch
>> =C2=A0create mode 100644 meta/recipes-extended/libtirpc/libtirpc-
>> 0.2.2/libtirpc-0.2.2-rpc-des-prot.patch
>> =C2=A0create mode 100644 meta/recipes-extended/libtirpc/libtirpc-
>> 0.2.2/remove-des-crypt.patch
>> =C2=A0delete mode 100644 meta/recipes-extended/libtirpc/libtirpc_0.2.1.b=
b
>> =C2=A0create mode 100644 meta/recipes-extended/libtirpc/libtirpc_0.2.2.b=
b
>>
>> diff --git a/meta/recipes-extended/libtirpc/libtirpc-0.2.2/libtirpc-
>> 0.2.1-fortify.patch b/meta/recipes-extended/libtirpc/libtirpc-
>> 0.2.2/libtirpc-0.2.1-fortify.patch
>> new file mode 100644
>> index 0000000..32644b5
>> --- /dev/null
>> +++ b/meta/recipes-extended/libtirpc/libtirpc-0.2.2/libtirpc-0.2.1-
>> fortify.patch
>> @@ -0,0 +1,26 @@
>> +Fix a possible overflow (reported by _FORTIFY_SOURCE=3D2)
>> +
>> +Ported from Gentoo
>> +
>> +Upstream-Status: Unknown
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +
>> +Index: libtirpc-0.2.1/src/getrpcport.c
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- libtirpc-0.2.1.orig/src/getrpcport.c
>> ++++ libtirpc-0.2.1/src/getrpcport.c
>> +@@ -54,11 +54,11 @@ getrpcport(host, prognum, versnum, proto
>> +
>> + =C2=A0 =C2=A0 if ((hp =3D gethostbyname(host)) =3D=3D NULL)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (0);
>> ++ =C2=A0 =C2=A0if (hp->h_length !=3D sizeof(addr.sin_addr.s_addr))
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return (0);
>> + =C2=A0 =C2=A0 memset(&addr, 0, sizeof(addr));
>> + =C2=A0 =C2=A0 addr.sin_family =3D AF_INET;
>> + =C2=A0 =C2=A0 addr.sin_port =3D =C2=A00;
>> +- =C2=A0 =C2=A0if (hp->h_length > sizeof(addr))
>> +- =C2=A0 =C2=A0 =C2=A0hp->h_length =3D sizeof(addr);
>> + =C2=A0 =C2=A0 memcpy(&addr.sin_addr.s_addr, hp->h_addr, (size_t)hp->h_=
length);
>> + =C2=A0 =C2=A0 /* Inconsistent interfaces need casts! :-( */
>> + =C2=A0 =C2=A0 return (pmap_getport(&addr, (u_long)prognum, (u_long)ver=
snum,
>> diff --git a/meta/recipes-extended/libtirpc/libtirpc-0.2.2/libtirpc-
>> 0.2.2-rpc-des-prot.patch b/meta/recipes-extended/libtirpc/libtirpc-
>> 0.2.2/libtirpc-0.2.2-rpc-des-prot.patch
>> new file mode 100644
>> index 0000000..c38a55b
>> --- /dev/null
>> +++ b/meta/recipes-extended/libtirpc/libtirpc-0.2.2/libtirpc-0.2.2-rpc-
>> des-prot.patch
>> @@ -0,0 +1,39 @@
>> +From f2f43212b33dea42635061c82645287454a70107 Mon Sep 17 00:00:00 2001
>> +From: Mike Frysinger <vapier@gentoo.org>
>> +Date: Sat, 11 Jun 2011 15:21:55 -0400
>> +Subject: [PATCH] add multiple inclusion protection to rpc/des.h
>> +
>> +If you try to include this file multiple times, you get a build
>> failure
>> +due to redefinitions of enums and such.
>> +
>> +Signed-off-by: Mike Frysinger <vapier@gentoo.org>
>> +---
>> + tirpc/rpc/des.h | =C2=A0 =C2=A05 +++++
>> + 1 files changed, 5 insertions(+), 0 deletions(-)
>> +
>> +
>> +Upstream-Status: Backport
>> +
>> +diff --git a/tirpc/rpc/des.h b/tirpc/rpc/des.h
>> +index e3d6897..d2881ad 100644
>> +--- a/tirpc/rpc/des.h
>> ++++ b/tirpc/rpc/des.h
>> +@@ -33,6 +33,9 @@
>> + =C2=A0* Copyright (c) 1986 by Sun Microsystems, Inc.
>> + =C2=A0*/
>> +
>> ++#ifndef _RPC_DES_H_
>> ++#define _RPC_DES_H_
>> ++
>> + #define DES_MAXLEN =C2=A065536 =C2=A0 /* maximum # of bytes to encrypt=
 =C2=A0*/
>> + #define DES_QUICKLEN =C2=A0 =C2=A0 =C2=A0 =C2=A016 =C2=A0 =C2=A0 =C2=
=A0/* maximum # of bytes to encrypt quickly
>> */
>> +
>> +@@ -80,3 +83,5 @@ struct desparams {
>> + =C2=A0* Software DES.
>> + =C2=A0*/
>> + extern int _des_crypt( char *, int, struct desparams * );
>> ++
>> ++#endif
>> +--
>> +1.7.5.3
>> +
>> diff --git a/meta/recipes-extended/libtirpc/libtirpc-0.2.2/remove-des-
>> crypt.patch b/meta/recipes-extended/libtirpc/libtirpc-0.2.2/remove-des-
>> crypt.patch
>> new file mode 100644
>> index 0000000..d94a585
>> --- /dev/null
>> +++ b/meta/recipes-extended/libtirpc/libtirpc-0.2.2/remove-des-
>> crypt.patch
>> @@ -0,0 +1,17 @@
>> +http://sourceforge.net/mailarchive/message.php?msg_id=3D27636466
>> +
>> +Upstream-Status: Backport
>> +
>> +Index: libtirpc-0.2.2/src/Makefile.am
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- libtirpc-0.2.2.orig/src/Makefile.am
>> ++++ libtirpc-0.2.2/src/Makefile.am
>> +@@ -50,7 +50,7 @@ libtirpc_la_SOURCES =3D auth_none.c auth_u
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 rpc_callmsg.c rpc_generic.c rpc_soc.c rpcb=
_clnt.c rpcb_prot.c
>> \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 rpcb_st_xdr.c svc.c svc_auth.c svc_dg.c sv=
c_auth_unix.c
>> svc_generic.c \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 svc_raw.c svc_run.c svc_simple.c svc_vc.c =
getpeereid.c \
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0auth_time.c auth_des.c authdes_prot.c des_=
crypt.c
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0auth_time.c auth_des.c authdes_prot.c
>> +
>> + ## XDR
>> + libtirpc_la_SOURCES +=3D xdr.c xdr_rec.c xdr_array.c xdr_float.c
>> xdr_mem.c xdr_reference.c xdr_stdio.c
>> diff --git a/meta/recipes-extended/libtirpc/libtirpc_0.2.1.bb
>> b/meta/recipes-extended/libtirpc/libtirpc_0.2.1.bb
>> deleted file mode 100644
>> index 6170e65..0000000
>> --- a/meta/recipes-extended/libtirpc/libtirpc_0.2.1.bb
>> +++ /dev/null
>> @@ -1,21 +0,0 @@
>> -SUMMARY =3D "Transport-Independent RPC library"
>> -DESCRIPTION =3D "Libtirpc is a port of Suns Transport-Independent RPC
>> library to Linux"
>> -SECTION =3D "libs/network"
>> -PRIORITY =3D "optional"
>> -HOMEPAGE =3D "http://sourceforge.net/projects/libtirpc/"
>> -BUGTRACKER =3D
>> "http://sourceforge.net/tracker/?group_id=3D183075&atid=3D903784"
>> -LICENSE =3D "BSD"
>> -LIC_FILES_CHKSUM =3D
>> "file://COPYING;md5=3D1c32c8e351f97e43e1ad6cf7f62de3bf \
>> -
>> file://src/netname.c;beginline=3D1;endline=3D27;md5=3Df8a8cd2cb25ac5aa16=
76736
>> 4fb0e3c24"
>> -PR =3D "r1"
>> -
>> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/libtirpc/libtirpc-${PV}.tar.bz2"
>> -
>> -SRC_URI[md5sum] =3D "d77eb15f464bf9d6e66259eaf78b2a4e"
>> -SRC_URI[sha256sum] =3D
>> "ea77cadd63941fc4edbee7863d2c7094e6a18263d2a2c8922319aee91352ff41"
>> -
>> -inherit autotools
>> -
>> -do_install_append() {
>> - =C2=A0 =C2=A0 chown root:root ${D}${sysconfdir}/netconfig
>> -}
>> diff --git a/meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb
>> b/meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb
>> new file mode 100644
>> index 0000000..f1f66e3
>> --- /dev/null
>> +++ b/meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb
>> @@ -0,0 +1,33 @@
>> +SUMMARY =3D "Transport-Independent RPC library"
>> +DESCRIPTION =3D "Libtirpc is a port of Suns Transport-Independent RPC
>> library to Linux"
>> +SECTION =3D "libs/network"
>> +PRIORITY =3D "optional"
>> +HOMEPAGE =3D "http://sourceforge.net/projects/libtirpc/"
>> +BUGTRACKER =3D
>> "http://sourceforge.net/tracker/?group_id=3D183075&atid=3D903784"
>> +LICENSE =3D "BSD"
>> +LIC_FILES_CHKSUM =3D
>> "file://COPYING;md5=3Df835cce8852481e4b2bbbdd23b5e47f3 \
>> +
>> file://src/netname.c;beginline=3D1;endline=3D27;md5=3Df8a8cd2cb25ac5aa16=
76736
>> 4fb0e3c24"
>> +PR =3D "r0"
>> +
>> +DEPENDS +=3D "xz-native"
>> +PROVIDES =3D "virtual/librpc"
>> +
>> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/${PN}/${P}.tar.bz2;name=3Dlibtirpc \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${GENTOO_MIRROR}/${PN}-glibc-nfs.ta=
r.xz;name=3Dglibc-nfs \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://libtirpc-0.2.1-fortify.patch=
 \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://libtirpc-0.2.2-rpc-des-prot.=
patch \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://remove-des-crypt.patch \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
>> +SRC_URI[libtirpc.md5sum] =3D "74c41c15c2909f7d11d9c7bfa7db6273"
>> +SRC_URI[libtirpc.sha256sum] =3D
>> "f05eb17c85d62423858b8f74512cfe66a9ae1cedf93f03c2a0a32e04f0a33705"
>> +SRC_URI[glibc-nfs.md5sum] =3D "5ae500b9d0b6b72cb875bc04944b9445"
>> +SRC_URI[glibc-nfs.sha256sum] =3D
>> "2677cfedf626f3f5a8f6e507aed5bb8f79a7453b589d684dbbc086e755170d83"
>> +inherit autotools pkgconfig
>> +
>> +do_configure_prepend () {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${S}/../tirpc ${S}
>> +}
>> +
>> +do_install_append() {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0chown root:root ${D}${sysconfdir}/netconfig
>> +}
>> --
>> 1.7.4.1
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


