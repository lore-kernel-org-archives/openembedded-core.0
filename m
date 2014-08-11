Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2971E609B1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 11:59:03 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id f8so4059415wiw.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 04:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QYLV8Q6xntiVrknPagGbBz2NbGFsam9FrQjZzYl3aYA=;
	b=yso7+UW6BMSWTvzdaxxyCWMDJmzxSP2+DECmgMyjO2y/saX5Wa69U7n+L/SWCjqRMJ
	q52UahAGRNQ0nBykWaiVvIXk5CaUStdKnTlByo2O4IE471y+96cAOBfm90ErPf4oS7le
	S8957dn3itZ/KPuZ3fNFmCHiVUP/8s2zcOufXPJgMKWZZyj0KD7Jzz4fW4Ewz8fLaxYu
	Y4lDb/nRbmjEK4CH35/CY84Md3qioZujWWoTKEBSrL721geNsyNJJ+xtpc73DA3r3w8y
	Nmr0BV6PLpjI4v+hm52B0U+jVGzv71Uq6VgCRVr3+gWIcZs5kuu/fIZDbsKqPgy5qnAW
	/2Dw==
X-Received: by 10.180.99.34 with SMTP id en2mr21178721wib.34.1407758344111;
	Mon, 11 Aug 2014 04:59:04 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ca8sm1125077wjc.0.2014.08.11.04.58.59 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Aug 2014 04:59:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 11 Aug 2014 13:59:35 +0200
To: Chen Qi <Qi.Chen@windriver.com>
Message-ID: <20140811115935.GB14848@jama>
References: <cover.1406793899.git.Qi.Chen@windriver.com>
	<65f32e0e16b2bf162e5d7b809fd705e0f48b6c20.1406793899.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <65f32e0e16b2bf162e5d7b809fd705e0f48b6c20.1406793899.git.Qi.Chen@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V5 1/1] systemd: upgrade to 215
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
X-List-Received-Date: Mon, 11 Aug 2014 11:59:11 -0000
X-Groupsio-MsgNum: 56292
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="25Rkvw5hS3UC+3//"
Content-Disposition: inline

--25Rkvw5hS3UC+3//
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2014 at 04:08:05PM +0800, Chen Qi wrote:
> Upgrade systemd from 213 to 215.
>=20
> systemd-older-kernel.patch is removed as it's fixed in 215.
>=20
> Backport two patches to fix compilation problem for qemuppc.
>=20
>     0001-always-check-for-__BYTE_ORDER-__BIG_ENDIAN-when-chec.patch
>     0002-endian-explicitly-include-endian.h-wherever-we-want-.patch

Can you please fix following warnings, I haven't seen them with 213 version.

WARNING: QA Issue: systemd rdepends on libdw, but it isn't a build dependen=
cy? [build-deps]
WARNING: QA Issue: libgudev-1.0 rdepends on libdw, but it isn't a build dep=
endency? [build-deps]
WARNING: QA Issue: libsystemd rdepends on libdw, but it isn't a build depen=
dency? [build-deps]
WARNING: QA Issue: libudev rdepends on libdw, but it isn't a build dependen=
cy? [build-deps]

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  ...k-for-__BYTE_ORDER-__BIG_ENDIAN-when-chec.patch |  116 ++++++++++++++=
++++++
>  ...icitly-include-endian.h-wherever-we-want-.patch |   52 +++++++++
>  .../systemd/systemd/systemd-older-kernel.patch     |   56 ----------
>  .../systemd/{systemd_213.bb =3D> systemd_215.bb}     |   10 +-
>  4 files changed, 174 insertions(+), 60 deletions(-)
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-always-check-f=
or-__BYTE_ORDER-__BIG_ENDIAN-when-chec.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0002-endian-explici=
tly-include-endian.h-wherever-we-want-.patch
>  delete mode 100644 meta/recipes-core/systemd/systemd/systemd-older-kerne=
l.patch
>  rename meta/recipes-core/systemd/{systemd_213.bb =3D> systemd_215.bb} (9=
7%)
>=20
> diff --git a/meta/recipes-core/systemd/systemd/0001-always-check-for-__BY=
TE_ORDER-__BIG_ENDIAN-when-chec.patch b/meta/recipes-core/systemd/systemd/0=
001-always-check-for-__BYTE_ORDER-__BIG_ENDIAN-when-chec.patch
> new file mode 100644
> index 0000000..228d835
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0001-always-check-for-__BYTE_ORDE=
R-__BIG_ENDIAN-when-chec.patch
> @@ -0,0 +1,116 @@
> +Upstream-Status: Backport
> +
> +Subject: always check for __BYTE_ORDER =3D=3D __BIG_ENDIAN when checking=
 for endianess
> +
> +Let's always stick to glibc's way to determine byte order, and not mix
> +autoconf-specific checks with gcc checks.
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + src/shared/architecture.h |   12 ++++++------
> + src/shared/gpt.h          |    4 ++--
> + src/shared/time-dst.c     |    6 +++---
> + 3 files changed, 11 insertions(+), 11 deletions(-)
> +
> +diff --git a/src/shared/architecture.h b/src/shared/architecture.h
> +index 4821d5d..58e97e5 100644
> +--- a/src/shared/architecture.h
> ++++ b/src/shared/architecture.h
> +@@ -80,7 +80,7 @@ Architecture uname_architecture(void);
> + #  define native_architecture() ARCHITECTURE_X86
> + #  define LIB_ARCH_TUPLE "i386-linux-gnu"
> + #elif defined(__powerpc64__)
> +-#  if defined(WORDS_BIGENDIAN)
> ++#  if __BYTE_ORDER =3D=3D __BIG_ENDIAN
> + #    define native_architecture() ARCHITECTURE_PPC64
> + #    define LIB_ARCH_TUPLE "ppc64-linux-gnu"
> + #  else
> +@@ -88,7 +88,7 @@ Architecture uname_architecture(void);
> + #    error "Missing LIB_ARCH_TUPLE for PPC64LE"
> + #  endif
> + #elif defined(__powerpc__)
> +-#  if defined(WORDS_BIGENDIAN)
> ++#  if __BYTE_ORDER =3D=3D __BIG_ENDIAN
> + #    define native_architecture() ARCHITECTURE_PPC
> + #    define LIB_ARCH_TUPLE "powerpc-linux-gnu"
> + #  else
> +@@ -117,7 +117,7 @@ Architecture uname_architecture(void);
> + #  define native_architecture() ARCHITECTURE_SPARC
> + #  define LIB_ARCH_TUPLE "sparc-linux-gnu"
> + #elif defined(__mips64__)
> +-#  if defined(WORDS_BIGENDIAN)
> ++#  if __BYTE_ORDER =3D=3D __BIG_ENDIAN
> + #    define native_architecture() ARCHITECTURE_MIPS64
> + #    error "Missing LIB_ARCH_TUPLE for MIPS64"
> + #  else
> +@@ -125,7 +125,7 @@ Architecture uname_architecture(void);
> + #    error "Missing LIB_ARCH_TUPLE for MIPS64_LE"
> + #  endif
> + #elif defined(__mips__)
> +-#  if defined(WORDS_BIGENDIAN)
> ++#  if __BYTE_ORDER =3D=3D __BIG_ENDIAN
> + #    define native_architecture() ARCHITECTURE_MIPS
> + #    define LIB_ARCH_TUPLE "mips-linux-gnu"
> + #  else
> +@@ -136,7 +136,7 @@ Architecture uname_architecture(void);
> + #  define native_architecture() ARCHITECTURE_ALPHA
> + #  define LIB_ARCH_TUPLE "alpha-linux-gnu"
> + #elif defined(__aarch64__)
> +-#  if defined(WORDS_BIGENDIAN)
> ++#  if __BYTE_ORDER =3D=3D __BIG_ENDIAN
> + #    define native_architecture() ARCHITECTURE_ARM64_BE
> + #    define LIB_ARCH_TUPLE "aarch64_be-linux-gnu"
> + #  else
> +@@ -144,7 +144,7 @@ Architecture uname_architecture(void);
> + #    define LIB_ARCH_TUPLE "aarch64-linux-gnu"
> + #  endif
> + #elif defined(__arm__)
> +-#  if defined(WORDS_BIGENDIAN)
> ++#  if __BYTE_ORDER =3D=3D __BIG_ENDIAN
> + #    define native_architecture() ARCHITECTURE_ARM_BE
> + #    if defined(__ARM_EABI__)
> + #      if defined(__ARM_PCS_VFP)
> +diff --git a/src/shared/gpt.h b/src/shared/gpt.h
> +index 64090e0..278940b 100644
> +--- a/src/shared/gpt.h
> ++++ b/src/shared/gpt.h
> +@@ -42,10 +42,10 @@
> + #  define GPT_ROOT_NATIVE GPT_ROOT_X86
> + #endif
> +=20
> +-#if defined(__aarch64__) && !defined(WORDS_BIGENDIAN)
> ++#if defined(__aarch64__) && (__BYTE_ORDER !=3D __BIG_ENDIAN)
> + #  define GPT_ROOT_NATIVE GPT_ROOT_ARM_64
> + #  define GPT_ROOT_SECONDARY GPT_ROOT_ARM
> +-#elif defined(__arm__) && !defined(WORDS_BIGENDIAN)
> ++#elif defined(__arm__) && (__BYTE_ORDER !=3D __BIG_ENDIAN)
> + #  define GPT_ROOT_NATIVE GPT_ROOT_ARM
> + #endif
> +=20
> +diff --git a/src/shared/time-dst.c b/src/shared/time-dst.c
> +index ceca2fa..6195b11 100644
> +--- a/src/shared/time-dst.c
> ++++ b/src/shared/time-dst.c
> +@@ -207,8 +207,8 @@ read_again:
> +                 if (type_idxs[i] >=3D num_types)
> +                         return -EINVAL;
> +=20
> +-        if (BYTE_ORDER =3D=3D BIG_ENDIAN ? sizeof(time_t) =3D=3D 8 && t=
rans_width =3D=3D 4
> +-                                     : sizeof(time_t) =3D=3D 4 || trans=
_width =3D=3D 4) {
> ++        if (__BYTE_ORDER =3D=3D __BIG_ENDIAN ? sizeof(time_t) =3D=3D 8 =
&& trans_width =3D=3D 4
> ++                                         : sizeof(time_t) =3D=3D 4 || t=
rans_width =3D=3D 4) {
> +                 /* Decode the transition times, stored as 4-byte intege=
rs in
> +                    network (big-endian) byte order.  We work from the e=
nd of
> +                    the array so as not to clobber the next element to be
> +@@ -216,7 +216,7 @@ read_again:
> +                 i =3D num_transitions;
> +                 while (i-- > 0)
> +                         transitions[i] =3D decode((char *)transitions +=
 i * 4);
> +-        } else if (BYTE_ORDER !=3D BIG_ENDIAN && sizeof(time_t) =3D=3D =
8) {
> ++        } else if (__BYTE_ORDER !=3D __BIG_ENDIAN && sizeof(time_t) =3D=
=3D 8) {
> +                 /* Decode the transition times, stored as 8-byte intege=
rs in
> +                    network (big-endian) byte order.  */
> +                 for (i =3D 0; i < num_transitions; ++i)
> +--=20
> +1.7.9.5
> +
> diff --git a/meta/recipes-core/systemd/systemd/0002-endian-explicitly-inc=
lude-endian.h-wherever-we-want-.patch b/meta/recipes-core/systemd/systemd/0=
002-endian-explicitly-include-endian.h-wherever-we-want-.patch
> new file mode 100644
> index 0000000..5494192
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0002-endian-explicitly-include-en=
dian.h-wherever-we-want-.patch
> @@ -0,0 +1,52 @@
> +Upstream-Status: Backport
> +
> +Subject: endian: explicitly include endian.h wherever we want to use __B=
YTE_ORDER
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + src/libsystemd/sd-bus/bus-protocol.h |    1 +
> + src/shared/architecture.h            |    2 ++
> + src/shared/gpt.h                     |    2 ++
> + 3 files changed, 5 insertions(+)
> +
> +diff --git a/src/libsystemd/sd-bus/bus-protocol.h b/src/libsystemd/sd-bu=
s/bus-protocol.h
> +index 5046d17..4f46468 100644
> +--- a/src/libsystemd/sd-bus/bus-protocol.h
> ++++ b/src/libsystemd/sd-bus/bus-protocol.h
> +@@ -21,6 +21,7 @@
> +   along with systemd; If not, see <http://www.gnu.org/licenses/>.
> + ***/
> +=20
> ++#include <endian.h>
> +=20
> + /* Endianness */
> +=20
> +diff --git a/src/shared/architecture.h b/src/shared/architecture.h
> +index 58e97e5..38780d1 100644
> +--- a/src/shared/architecture.h
> ++++ b/src/shared/architecture.h
> +@@ -21,6 +21,8 @@
> +   along with systemd; If not, see <http://www.gnu.org/licenses/>.
> + ***/
> +=20
> ++#include <endian.h>
> ++
> + #include "util.h"
> +=20
> + /* A cleaned up architecture definition. We don't want to get lost in
> +diff --git a/src/shared/gpt.h b/src/shared/gpt.h
> +index 278940b..ef3444f 100644
> +--- a/src/shared/gpt.h
> ++++ b/src/shared/gpt.h
> +@@ -19,6 +19,8 @@
> +   along with systemd; If not, see <http://www.gnu.org/licenses/>.
> + ***/
> +=20
> ++#include <endian.h>
> ++
> + #include "sd-id128.h"
> +=20
> + /* We only support root disk discovery for x86, x86-64 and ARM for
> +--=20
> +1.7.9.5
> +
> diff --git a/meta/recipes-core/systemd/systemd/systemd-older-kernel.patch=
 b/meta/recipes-core/systemd/systemd/systemd-older-kernel.patch
> deleted file mode 100644
> index 18b50e7..0000000
> --- a/meta/recipes-core/systemd/systemd/systemd-older-kernel.patch
> +++ /dev/null
> @@ -1,56 +0,0 @@
> -From 6109f02dcc4f2d7a461c5772bab494f5753a2203 Mon Sep 17 00:00:00 2001
> -From: Robert Yang <liezhi.yang@windriver.com>
> -Date: Thu, 29 May 2014 08:09:07 +0000
> -Subject: [PATCH] rtnl-types.c: check IFLA_VLAN_PROTOCOL
> -
> -The older kernel's linux/if_link.h doesn't have IFLA_VLAN_PROTOCOL, we n=
eed
> -check whether it has been defined or not.
> -
> -The maintainer said that he would fix it:
> -
> -http://thread.gmane.org/gmane.comp.sysutils.systemd.devel/18200
> -
> -Also we need redefine IFLA_MAX from 34 to 35 when define IFLA_CARRIER,
> -otherwise there would be error:
> -
> -| src/libsystemd/sd-rtnl/rtnl-types.c:233:9: error: array index in initi=
alizer exceeds array bounds
> -|          [IFLA_CARRIER]          =3D { .type =3D NLA_U8 },
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ----
> - src/libsystemd/sd-rtnl/rtnl-types.c | 2 ++
> - src/shared/missing.h                | 2 ++
> - 2 files changed, 4 insertions(+)
> -
> -diff --git a/src/libsystemd/sd-rtnl/rtnl-types.c b/src/libsystemd/sd-rtn=
l/rtnl-types.c
> -index 44ac5ec..ab6161f 100644
> ---- a/src/libsystemd/sd-rtnl/rtnl-types.c
> -+++ b/src/libsystemd/sd-rtnl/rtnl-types.c
> -@@ -67,7 +67,9 @@ static const NLType rtnl_link_info_data_vlan_types[IFL=
A_VLAN_MAX + 1] =3D {
> -         [IFLA_VLAN_EGRESS_QOS]  =3D { .type =3D NLA_NESTED },
> -         [IFLA_VLAN_INGRESS_QOS] =3D { .type =3D NLA_NESTED },
> - */
> -+#ifdef IFLA_VLAN_PROTOCOL
> -         [IFLA_VLAN_PROTOCOL]    =3D { .type =3D NLA_U16 },
> -+#endif
> - };
> -=20
> - static const NLType rtnl_link_info_data_bond_types[IFLA_BOND_MAX + 1] =
=3D {
> -diff --git a/src/shared/missing.h b/src/shared/missing.h
> -index d5ec2f8..732853f 100644
> ---- a/src/shared/missing.h
> -+++ b/src/shared/missing.h
> -@@ -94,6 +94,8 @@
> -=20
> - #ifndef IFLA_CARRIER
> -   #define IFLA_CARRIER 33
> -+  #undef IFLA_MAX
> -+  #define IFLA_MAX 35
> -   #ifndef IFLA_NUM_RX_QUEUES
> -     #define IFLA_NUM_RX_QUEUES 32
> -     #ifndef IFLA_NUM_TX_QUEUES
> ---=20
> -1.8.3.4
> -
> diff --git a/meta/recipes-core/systemd/systemd_213.bb b/meta/recipes-core=
/systemd/systemd_215.bb
> similarity index 97%
> rename from meta/recipes-core/systemd/systemd_213.bb
> rename to meta/recipes-core/systemd/systemd_215.bb
> index 5de7cdc..9eafa38 100644
> --- a/meta/recipes-core/systemd/systemd_213.bb
> +++ b/meta/recipes-core/systemd/systemd_215.bb
> @@ -17,9 +17,9 @@ SECTION =3D "base/shell"
> =20
>  inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d updat=
e-alternatives qemu systemd ptest
> =20
> -SRCREV =3D "c9679c652b3c31f2510e8805d81630680ebc7e95"
> +SRCREV =3D "252ff40a3827b4e8e62e03a5e2f80da3fe02bee6"
> =20
> -PV =3D "213+git${SRCPV}"
> +PV =3D "215+git${SRCPV}"
> =20
>  SRC_URI =3D "git://anongit.freedesktop.org/systemd/systemd;branch=3Dmast=
er;protocol=3Dgit \
>             file://binfmt-install.patch \
> @@ -31,12 +31,13 @@ SRC_URI =3D "git://anongit.freedesktop.org/systemd/sy=
stemd;branch=3Dmaster;protocol=3D
>             file://0001-uClibc-doesn-t-implement-pwritev-preadv.patch \
>             file://uclibc-sysinfo_h.patch \
>             file://uclibc-get-physmem.patch \
> +           file://0001-always-check-for-__BYTE_ORDER-__BIG_ENDIAN-when-c=
hec.patch \
> +           file://0002-endian-explicitly-include-endian.h-wherever-we-wa=
nt-.patch \
>             file://touchscreen.rules \
>             file://00-create-volatile.conf \
>             file://init \
>             file://run-ptest \
> -           file://systemd-older-kernel.patch \
> -          "
> +         "
> =20
>  S =3D "${WORKDIR}/git"
> =20
> @@ -231,6 +232,7 @@ FILES_${PN} =3D " ${base_bindir}/* \
>                  ${exec_prefix}/lib/systemd \
>                  ${exec_prefix}/lib/modules-load.d \
>                  ${exec_prefix}/lib/sysctl.d \
> +                ${exec_prefix}/lib/sysusers.d \
>                  ${localstatedir} \
>                  /lib/udev/rules.d/70-uaccess.rules \
>                  /lib/udev/rules.d/71-seat.rules \
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--25Rkvw5hS3UC+3//
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPosCcACgkQN1Ujt2V2gBxIBQCgtnapoIo12YyivW5S2JiLJxsR
vZYAnA6fe+OAlvAn+dowWQ8KGjbspc8+
=xtxR
-----END PGP SIGNATURE-----

--25Rkvw5hS3UC+3//--
