Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 18E9360144
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 16:52:48 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id ho1so1101037wib.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 09:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=UVO0IX/hQzOBfoXypdpzuttovvd6kgcNOuEM49Mobdo=;
	b=EAYtnS/zKXZy7WjO2kcSkCrihWKRInJk+GZEsGmSE/8bPUGL0hvFPDupFeO06wc3wb
	VEyfMzggI3cr2frPv+bp6L3OPrIXQObH27zsfR45POS7c/dQX7zD2XKdbERqkbmK0cYg
	LLX/ymuyoYzHM8SniOxB1cAHuLpPfTlOSb4rIz6SlXgS1xl0ubjTtBFj3GblfiCk3KPh
	mF85g3m0TW4vic3AKQRk/PbX8bp1XdC5x/iym2vXCMM9E6EAKrQC+8h6wYzS/+iP3/7A
	tDoPOyEvqbRAPaZU7CiE9ltFIKZdiT8IZyUHnPfx1YOyy8t+Te8QRn+rurYt7CilLmjb
	iVQg==
X-Received: by 10.180.106.99 with SMTP id gt3mr11952264wib.1.1407948769741;
	Wed, 13 Aug 2014 09:52:49 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bx2sm5515231wjb.47.2014.08.13.09.52.48 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Aug 2014 09:52:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 13 Aug 2014 18:53:25 +0200
To: ChenQi <Qi.Chen@windriver.com>
Message-ID: <20140813165325.GW14848@jama>
References: <cover.1406793899.git.Qi.Chen@windriver.com>
	<65f32e0e16b2bf162e5d7b809fd705e0f48b6c20.1406793899.git.Qi.Chen@windriver.com>
	<20140811115935.GB14848@jama> <53EB0D19.3000108@windriver.com>
MIME-Version: 1.0
In-Reply-To: <53EB0D19.3000108@windriver.com>
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
X-List-Received-Date: Wed, 13 Aug 2014 16:52:53 -0000
X-Groupsio-MsgNum: 56410
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bD7OXr4rLdQDclcO"
Content-Disposition: inline

--bD7OXr4rLdQDclcO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2014 at 03:00:41PM +0800, ChenQi wrote:
> On 08/11/2014 07:59 PM, Martin Jansa wrote:
> > On Thu, Jul 31, 2014 at 04:08:05PM +0800, Chen Qi wrote:
> >> Upgrade systemd from 213 to 215.
> >>
> >> systemd-older-kernel.patch is removed as it's fixed in 215.
> >>
> >> Backport two patches to fix compilation problem for qemuppc.
> >>
> >>      0001-always-check-for-__BYTE_ORDER-__BIG_ENDIAN-when-chec.patch
> >>      0002-endian-explicitly-include-endian.h-wherever-we-want-.patch
> > Can you please fix following warnings, I haven't seen them with 213 ver=
sion.
> >
> > WARNING: QA Issue: systemd rdepends on libdw, but it isn't a build depe=
ndency? [build-deps]
> > WARNING: QA Issue: libgudev-1.0 rdepends on libdw, but it isn't a build=
 dependency? [build-deps]
> > WARNING: QA Issue: libsystemd rdepends on libdw, but it isn't a build d=
ependency? [build-deps]
> > WARNING: QA Issue: libudev rdepends on libdw, but it isn't a build depe=
ndency? [build-deps]
>=20
> Just noticed this email.
> Thank you very much.
> I'll fix them and send out a new version.

Thanks!

It would be great if you can add required kernel version to commit
message.

There is good news for people like me who needs to deal with BSPs having on=
ly
older kernels.

215 version doesn't require cgroups xattr support:
https://www.mail-archive.com/systemd-devel@lists.freedesktop.org/msg20356.h=
tml
which was preventing me to use 213 version on om-gta02 with 3.2 kernel

cgroups xattr support was added in kernel 3.7, someone tried to backport
it to 3.4:
https://github.com/linux-sunxi/linux-sunxi/pull/192/commits

Now it boots again with 3.2 kernel and
http://cgit.freedesktop.org/systemd/systemd/tree/README#n40
http://cgit.freedesktop.org/systemd/systemd/tree/README?id=3Dv215#n40
says that any 3.* kernel should be ok

Regards,

> >> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >> ---
> >>   ...k-for-__BYTE_ORDER-__BIG_ENDIAN-when-chec.patch |  116 ++++++++++=
++++++++++
> >>   ...icitly-include-endian.h-wherever-we-want-.patch |   52 +++++++++
> >>   .../systemd/systemd/systemd-older-kernel.patch     |   56 ----------
> >>   .../systemd/{systemd_213.bb =3D> systemd_215.bb}     |   10 +-
> >>   4 files changed, 174 insertions(+), 60 deletions(-)
> >>   create mode 100644 meta/recipes-core/systemd/systemd/0001-always-che=
ck-for-__BYTE_ORDER-__BIG_ENDIAN-when-chec.patch
> >>   create mode 100644 meta/recipes-core/systemd/systemd/0002-endian-exp=
licitly-include-endian.h-wherever-we-want-.patch
> >>   delete mode 100644 meta/recipes-core/systemd/systemd/systemd-older-k=
ernel.patch
> >>   rename meta/recipes-core/systemd/{systemd_213.bb =3D> systemd_215.bb=
} (97%)
> >>
> >> diff --git a/meta/recipes-core/systemd/systemd/0001-always-check-for-_=
_BYTE_ORDER-__BIG_ENDIAN-when-chec.patch b/meta/recipes-core/systemd/system=
d/0001-always-check-for-__BYTE_ORDER-__BIG_ENDIAN-when-chec.patch
> >> new file mode 100644
> >> index 0000000..228d835
> >> --- /dev/null
> >> +++ b/meta/recipes-core/systemd/systemd/0001-always-check-for-__BYTE_O=
RDER-__BIG_ENDIAN-when-chec.patch
> >> @@ -0,0 +1,116 @@
> >> +Upstream-Status: Backport
> >> +
> >> +Subject: always check for __BYTE_ORDER =3D=3D __BIG_ENDIAN when check=
ing for endianess
> >> +
> >> +Let's always stick to glibc's way to determine byte order, and not mix
> >> +autoconf-specific checks with gcc checks.
> >> +
> >> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >> +---
> >> + src/shared/architecture.h |   12 ++++++------
> >> + src/shared/gpt.h          |    4 ++--
> >> + src/shared/time-dst.c     |    6 +++---
> >> + 3 files changed, 11 insertions(+), 11 deletions(-)
> >> +
> >> +diff --git a/src/shared/architecture.h b/src/shared/architecture.h
> >> +index 4821d5d..58e97e5 100644
> >> +--- a/src/shared/architecture.h
> >> ++++ b/src/shared/architecture.h
> >> +@@ -80,7 +80,7 @@ Architecture uname_architecture(void);
> >> + #  define native_architecture() ARCHITECTURE_X86
> >> + #  define LIB_ARCH_TUPLE "i386-linux-gnu"
> >> + #elif defined(__powerpc64__)
> >> +-#  if defined(WORDS_BIGENDIAN)
> >> ++#  if __BYTE_ORDER =3D=3D __BIG_ENDIAN
> >> + #    define native_architecture() ARCHITECTURE_PPC64
> >> + #    define LIB_ARCH_TUPLE "ppc64-linux-gnu"
> >> + #  else
> >> +@@ -88,7 +88,7 @@ Architecture uname_architecture(void);
> >> + #    error "Missing LIB_ARCH_TUPLE for PPC64LE"
> >> + #  endif
> >> + #elif defined(__powerpc__)
> >> +-#  if defined(WORDS_BIGENDIAN)
> >> ++#  if __BYTE_ORDER =3D=3D __BIG_ENDIAN
> >> + #    define native_architecture() ARCHITECTURE_PPC
> >> + #    define LIB_ARCH_TUPLE "powerpc-linux-gnu"
> >> + #  else
> >> +@@ -117,7 +117,7 @@ Architecture uname_architecture(void);
> >> + #  define native_architecture() ARCHITECTURE_SPARC
> >> + #  define LIB_ARCH_TUPLE "sparc-linux-gnu"
> >> + #elif defined(__mips64__)
> >> +-#  if defined(WORDS_BIGENDIAN)
> >> ++#  if __BYTE_ORDER =3D=3D __BIG_ENDIAN
> >> + #    define native_architecture() ARCHITECTURE_MIPS64
> >> + #    error "Missing LIB_ARCH_TUPLE for MIPS64"
> >> + #  else
> >> +@@ -125,7 +125,7 @@ Architecture uname_architecture(void);
> >> + #    error "Missing LIB_ARCH_TUPLE for MIPS64_LE"
> >> + #  endif
> >> + #elif defined(__mips__)
> >> +-#  if defined(WORDS_BIGENDIAN)
> >> ++#  if __BYTE_ORDER =3D=3D __BIG_ENDIAN
> >> + #    define native_architecture() ARCHITECTURE_MIPS
> >> + #    define LIB_ARCH_TUPLE "mips-linux-gnu"
> >> + #  else
> >> +@@ -136,7 +136,7 @@ Architecture uname_architecture(void);
> >> + #  define native_architecture() ARCHITECTURE_ALPHA
> >> + #  define LIB_ARCH_TUPLE "alpha-linux-gnu"
> >> + #elif defined(__aarch64__)
> >> +-#  if defined(WORDS_BIGENDIAN)
> >> ++#  if __BYTE_ORDER =3D=3D __BIG_ENDIAN
> >> + #    define native_architecture() ARCHITECTURE_ARM64_BE
> >> + #    define LIB_ARCH_TUPLE "aarch64_be-linux-gnu"
> >> + #  else
> >> +@@ -144,7 +144,7 @@ Architecture uname_architecture(void);
> >> + #    define LIB_ARCH_TUPLE "aarch64-linux-gnu"
> >> + #  endif
> >> + #elif defined(__arm__)
> >> +-#  if defined(WORDS_BIGENDIAN)
> >> ++#  if __BYTE_ORDER =3D=3D __BIG_ENDIAN
> >> + #    define native_architecture() ARCHITECTURE_ARM_BE
> >> + #    if defined(__ARM_EABI__)
> >> + #      if defined(__ARM_PCS_VFP)
> >> +diff --git a/src/shared/gpt.h b/src/shared/gpt.h
> >> +index 64090e0..278940b 100644
> >> +--- a/src/shared/gpt.h
> >> ++++ b/src/shared/gpt.h
> >> +@@ -42,10 +42,10 @@
> >> + #  define GPT_ROOT_NATIVE GPT_ROOT_X86
> >> + #endif
> >> +
> >> +-#if defined(__aarch64__) && !defined(WORDS_BIGENDIAN)
> >> ++#if defined(__aarch64__) && (__BYTE_ORDER !=3D __BIG_ENDIAN)
> >> + #  define GPT_ROOT_NATIVE GPT_ROOT_ARM_64
> >> + #  define GPT_ROOT_SECONDARY GPT_ROOT_ARM
> >> +-#elif defined(__arm__) && !defined(WORDS_BIGENDIAN)
> >> ++#elif defined(__arm__) && (__BYTE_ORDER !=3D __BIG_ENDIAN)
> >> + #  define GPT_ROOT_NATIVE GPT_ROOT_ARM
> >> + #endif
> >> +
> >> +diff --git a/src/shared/time-dst.c b/src/shared/time-dst.c
> >> +index ceca2fa..6195b11 100644
> >> +--- a/src/shared/time-dst.c
> >> ++++ b/src/shared/time-dst.c
> >> +@@ -207,8 +207,8 @@ read_again:
> >> +                 if (type_idxs[i] >=3D num_types)
> >> +                         return -EINVAL;
> >> +
> >> +-        if (BYTE_ORDER =3D=3D BIG_ENDIAN ? sizeof(time_t) =3D=3D 8 &=
& trans_width =3D=3D 4
> >> +-                                     : sizeof(time_t) =3D=3D 4 || tr=
ans_width =3D=3D 4) {
> >> ++        if (__BYTE_ORDER =3D=3D __BIG_ENDIAN ? sizeof(time_t) =3D=3D=
 8 && trans_width =3D=3D 4
> >> ++                                         : sizeof(time_t) =3D=3D 4 |=
| trans_width =3D=3D 4) {
> >> +                 /* Decode the transition times, stored as 4-byte int=
egers in
> >> +                    network (big-endian) byte order.  We work from th=
e end of
> >> +                    the array so as not to clobber the next element t=
o be
> >> +@@ -216,7 +216,7 @@ read_again:
> >> +                 i =3D num_transitions;
> >> +                 while (i-- > 0)
> >> +                         transitions[i] =3D decode((char *)transition=
s + i * 4);
> >> +-        } else if (BYTE_ORDER !=3D BIG_ENDIAN && sizeof(time_t) =3D=
=3D 8) {
> >> ++        } else if (__BYTE_ORDER !=3D __BIG_ENDIAN && sizeof(time_t) =
=3D=3D 8) {
> >> +                 /* Decode the transition times, stored as 8-byte int=
egers in
> >> +                    network (big-endian) byte order.  */
> >> +                 for (i =3D 0; i < num_transitions; ++i)
> >> +--
> >> +1.7.9.5
> >> +
> >> diff --git a/meta/recipes-core/systemd/systemd/0002-endian-explicitly-=
include-endian.h-wherever-we-want-.patch b/meta/recipes-core/systemd/system=
d/0002-endian-explicitly-include-endian.h-wherever-we-want-.patch
> >> new file mode 100644
> >> index 0000000..5494192
> >> --- /dev/null
> >> +++ b/meta/recipes-core/systemd/systemd/0002-endian-explicitly-include=
-endian.h-wherever-we-want-.patch
> >> @@ -0,0 +1,52 @@
> >> +Upstream-Status: Backport
> >> +
> >> +Subject: endian: explicitly include endian.h wherever we want to use =
__BYTE_ORDER
> >> +
> >> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >> +---
> >> + src/libsystemd/sd-bus/bus-protocol.h |    1 +
> >> + src/shared/architecture.h            |    2 ++
> >> + src/shared/gpt.h                     |    2 ++
> >> + 3 files changed, 5 insertions(+)
> >> +
> >> +diff --git a/src/libsystemd/sd-bus/bus-protocol.h b/src/libsystemd/sd=
-bus/bus-protocol.h
> >> +index 5046d17..4f46468 100644
> >> +--- a/src/libsystemd/sd-bus/bus-protocol.h
> >> ++++ b/src/libsystemd/sd-bus/bus-protocol.h
> >> +@@ -21,6 +21,7 @@
> >> +   along with systemd; If not, see <http://www.gnu.org/licenses/>.
> >> + ***/
> >> +
> >> ++#include <endian.h>
> >> +
> >> + /* Endianness */
> >> +
> >> +diff --git a/src/shared/architecture.h b/src/shared/architecture.h
> >> +index 58e97e5..38780d1 100644
> >> +--- a/src/shared/architecture.h
> >> ++++ b/src/shared/architecture.h
> >> +@@ -21,6 +21,8 @@
> >> +   along with systemd; If not, see <http://www.gnu.org/licenses/>.
> >> + ***/
> >> +
> >> ++#include <endian.h>
> >> ++
> >> + #include "util.h"
> >> +
> >> + /* A cleaned up architecture definition. We don't want to get lost in
> >> +diff --git a/src/shared/gpt.h b/src/shared/gpt.h
> >> +index 278940b..ef3444f 100644
> >> +--- a/src/shared/gpt.h
> >> ++++ b/src/shared/gpt.h
> >> +@@ -19,6 +19,8 @@
> >> +   along with systemd; If not, see <http://www.gnu.org/licenses/>.
> >> + ***/
> >> +
> >> ++#include <endian.h>
> >> ++
> >> + #include "sd-id128.h"
> >> +
> >> + /* We only support root disk discovery for x86, x86-64 and ARM for
> >> +--
> >> +1.7.9.5
> >> +
> >> diff --git a/meta/recipes-core/systemd/systemd/systemd-older-kernel.pa=
tch b/meta/recipes-core/systemd/systemd/systemd-older-kernel.patch
> >> deleted file mode 100644
> >> index 18b50e7..0000000
> >> --- a/meta/recipes-core/systemd/systemd/systemd-older-kernel.patch
> >> +++ /dev/null
> >> @@ -1,56 +0,0 @@
> >> -From 6109f02dcc4f2d7a461c5772bab494f5753a2203 Mon Sep 17 00:00:00 2001
> >> -From: Robert Yang <liezhi.yang@windriver.com>
> >> -Date: Thu, 29 May 2014 08:09:07 +0000
> >> -Subject: [PATCH] rtnl-types.c: check IFLA_VLAN_PROTOCOL
> >> -
> >> -The older kernel's linux/if_link.h doesn't have IFLA_VLAN_PROTOCOL, w=
e need
> >> -check whether it has been defined or not.
> >> -
> >> -The maintainer said that he would fix it:
> >> -
> >> -http://thread.gmane.org/gmane.comp.sysutils.systemd.devel/18200
> >> -
> >> -Also we need redefine IFLA_MAX from 34 to 35 when define IFLA_CARRIER,
> >> -otherwise there would be error:
> >> -
> >> -| src/libsystemd/sd-rtnl/rtnl-types.c:233:9: error: array index in in=
itializer exceeds array bounds
> >> -|          [IFLA_CARRIER]          =3D { .type =3D NLA_U8 },
> >> -
> >> -Upstream-Status: Pending
> >> -
> >> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >> ----
> >> - src/libsystemd/sd-rtnl/rtnl-types.c | 2 ++
> >> - src/shared/missing.h                | 2 ++
> >> - 2 files changed, 4 insertions(+)
> >> -
> >> -diff --git a/src/libsystemd/sd-rtnl/rtnl-types.c b/src/libsystemd/sd-=
rtnl/rtnl-types.c
> >> -index 44ac5ec..ab6161f 100644
> >> ---- a/src/libsystemd/sd-rtnl/rtnl-types.c
> >> -+++ b/src/libsystemd/sd-rtnl/rtnl-types.c
> >> -@@ -67,7 +67,9 @@ static const NLType rtnl_link_info_data_vlan_types[=
IFLA_VLAN_MAX + 1] =3D {
> >> -         [IFLA_VLAN_EGRESS_QOS]  =3D { .type =3D NLA_NESTED },
> >> -         [IFLA_VLAN_INGRESS_QOS] =3D { .type =3D NLA_NESTED },
> >> - */
> >> -+#ifdef IFLA_VLAN_PROTOCOL
> >> -         [IFLA_VLAN_PROTOCOL]    =3D { .type =3D NLA_U16 },
> >> -+#endif
> >> - };
> >> -
> >> - static const NLType rtnl_link_info_data_bond_types[IFLA_BOND_MAX + 1=
] =3D {
> >> -diff --git a/src/shared/missing.h b/src/shared/missing.h
> >> -index d5ec2f8..732853f 100644
> >> ---- a/src/shared/missing.h
> >> -+++ b/src/shared/missing.h
> >> -@@ -94,6 +94,8 @@
> >> -
> >> - #ifndef IFLA_CARRIER
> >> -   #define IFLA_CARRIER 33
> >> -+  #undef IFLA_MAX
> >> -+  #define IFLA_MAX 35
> >> -   #ifndef IFLA_NUM_RX_QUEUES
> >> -     #define IFLA_NUM_RX_QUEUES 32
> >> -     #ifndef IFLA_NUM_TX_QUEUES
> >> ---
> >> -1.8.3.4
> >> -
> >> diff --git a/meta/recipes-core/systemd/systemd_213.bb b/meta/recipes-c=
ore/systemd/systemd_215.bb
> >> similarity index 97%
> >> rename from meta/recipes-core/systemd/systemd_213.bb
> >> rename to meta/recipes-core/systemd/systemd_215.bb
> >> index 5de7cdc..9eafa38 100644
> >> --- a/meta/recipes-core/systemd/systemd_213.bb
> >> +++ b/meta/recipes-core/systemd/systemd_215.bb
> >> @@ -17,9 +17,9 @@ SECTION =3D "base/shell"
> >>  =20
> >>   inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d u=
pdate-alternatives qemu systemd ptest
> >>  =20
> >> -SRCREV =3D "c9679c652b3c31f2510e8805d81630680ebc7e95"
> >> +SRCREV =3D "252ff40a3827b4e8e62e03a5e2f80da3fe02bee6"
> >>  =20
> >> -PV =3D "213+git${SRCPV}"
> >> +PV =3D "215+git${SRCPV}"
> >>  =20
> >>   SRC_URI =3D "git://anongit.freedesktop.org/systemd/systemd;branch=3D=
master;protocol=3Dgit \
> >>              file://binfmt-install.patch \
> >> @@ -31,12 +31,13 @@ SRC_URI =3D "git://anongit.freedesktop.org/systemd=
/systemd;branch=3Dmaster;protocol=3D
> >>              file://0001-uClibc-doesn-t-implement-pwritev-preadv.patch=
 \
> >>              file://uclibc-sysinfo_h.patch \
> >>              file://uclibc-get-physmem.patch \
> >> +           file://0001-always-check-for-__BYTE_ORDER-__BIG_ENDIAN-whe=
n-chec.patch \
> >> +           file://0002-endian-explicitly-include-endian.h-wherever-we=
-want-.patch \
> >>              file://touchscreen.rules \
> >>              file://00-create-volatile.conf \
> >>              file://init \
> >>              file://run-ptest \
> >> -           file://systemd-older-kernel.patch \
> >> -          "
> >> +         "
> >>  =20
> >>   S =3D "${WORKDIR}/git"
> >>  =20
> >> @@ -231,6 +232,7 @@ FILES_${PN} =3D " ${base_bindir}/* \
> >>                   ${exec_prefix}/lib/systemd \
> >>                   ${exec_prefix}/lib/modules-load.d \
> >>                   ${exec_prefix}/lib/sysctl.d \
> >> +                ${exec_prefix}/lib/sysusers.d \
> >>                   ${localstatedir} \
> >>                   /lib/udev/rules.d/70-uaccess.rules \
> >>                   /lib/udev/rules.d/71-seat.rules \
> >> --=20
> >> 1.7.9.5
> >>
> >> --=20
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bD7OXr4rLdQDclcO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPrmAUACgkQN1Ujt2V2gBxfGwCdGnaxdZubwssrINO2yKKbTn5R
+roAoK58gAN2NCcpRdQbUn7X3j1ZHdhO
=RvzP
-----END PGP SIGNATURE-----

--bD7OXr4rLdQDclcO--
