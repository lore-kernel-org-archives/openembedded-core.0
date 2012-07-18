Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1SrSxW-0002Tc-C5
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 14:02:26 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Jul 2012 04:51:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="169817437"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by azsmga001.ch.intel.com with ESMTP; 18 Jul 2012 04:51:03 -0700
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.176]) by
	IRSMSX101.ger.corp.intel.com ([163.33.3.153]) with mapi id
	14.01.0355.002; Wed, 18 Jul 2012 12:50:04 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Saul Wold <sgw@linux.intel.com>, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/3] iproute2: upgrade to 3.4.0
Thread-Index: AQHNZE4gtUP4hmP1VU6eKVhBxLkrvZcu7fQg
Date: Wed, 18 Jul 2012 11:50:03 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB161727E9@IRSMSX102.ger.corp.intel.com>
References: <1342513736-468-1-git-send-email-cristian.iorga@intel.com>
	<5005B5C6.6080103@linux.intel.com>
In-Reply-To: <5005B5C6.6080103@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] iproute2: upgrade to 3.4.0
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
X-List-Received-Date: Wed, 18 Jul 2012 12:02:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Saul,

No, I did not used buildhistory at this point.
I will activate it.

But I followed the changes carefully.
Does it count?

Thanks,
Cristian

-----Original Message-----
From: Saul Wold [mailto:sgw@linux.intel.com]=20
Sent: Tuesday, July 17, 2012 9:58 PM
To: Patches and discussions about the oe-core layer
Cc: Iorga, Cristian
Subject: Re: [OE-core] [PATCH 1/3] iproute2: upgrade to 3.4.0

On 07/17/2012 01:28 AM, Cristian Iorga wrote:
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>   .../iproute2/iproute2-3.2.0/configure-cross.patch  |   76 -------------=
------
>   .../iproute2/iproute2-3.4.0/configure-cross.patch  |   77 +++++++++++++=
+++++++
>   meta/recipes-connectivity/iproute2/iproute2.inc    |   10 +--
>   .../iproute2/iproute2_3.2.0.bb                     |   11 ---
>   .../iproute2/iproute2_3.4.0.bb                     |    9 +++
>   5 files changed, 91 insertions(+), 92 deletions(-)
>   delete mode 100644 meta/recipes-connectivity/iproute2/iproute2-3.2.0/co=
nfigure-cross.patch
>   create mode 100644 meta/recipes-connectivity/iproute2/iproute2-3.4.0/co=
nfigure-cross.patch
>   delete mode 100644 meta/recipes-connectivity/iproute2/iproute2_3.2.0.bb
>   create mode 100644=20
> meta/recipes-connectivity/iproute2/iproute2_3.4.0.bb
>
> diff --git=20
> a/meta/recipes-connectivity/iproute2/iproute2-3.2.0/configure-cross.pa
> tch=20
> b/meta/recipes-connectivity/iproute2/iproute2-3.2.0/configure-cross.pa
> tch
> deleted file mode 100644
> index bed7b84..0000000
> ---=20
> a/meta/recipes-connectivity/iproute2/iproute2-3.2.0/configure-cross.pa
> tch
> +++ /dev/null
> @@ -1,76 +0,0 @@
> -From 85b0589b4843c03e8e6fd9416d71ea449a73c5c0 Mon Sep 17 00:00:00=20
> 2001
> -From: Koen Kooi <koen@dominion.thruhere.net>
> -Date: Thu, 3 Nov 2011 10:46:16 +0100
> -Subject: [PATCH] make configure cross compile safe
> -
> -According to Kevin Tian:
> -Upstream-Status: Pending
> -
> -Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> -Signed-off-by: Shane Wang <shane.wang@intel.com>
> -
> -diff -r e4e1b14b9c4a configure
> ---- a/configure	Sun Jan 22 15:26:47 2012 +0800
> -+++ b/configure	Sun Jan 22 15:29:38 2012 +0800
> -@@ -2,6 +2,7 @@
> - # This is not an autconf generated configure
> - #
> - INCLUDE=3D${1:-"$PWD/include"}
> -+SYSROOT=3D$1
> -
> - check_atm()
> - {
> -@@ -13,7 +14,7 @@
> - 	return 0;
> - }
> - EOF
> --gcc -I$INCLUDE -o /tmp/atmtest /tmp/atmtest.c -latm >/dev/null 2>&1
> -+$CC -I$INCLUDE -o /tmp/atmtest /tmp/atmtest.c -latm >/dev/null 2>&1
> - if [ $? -eq 0 ]
> - then
> -     echo "TC_CONFIG_ATM:=3Dy" >>Config
> -@@ -47,7 +48,7 @@
> -
> - EOF
> -
> --if gcc -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL=20
> $(pkg-config xtables --cflags --libs) -ldl >/dev/null 2>&1
> -+if $CC -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL=20
> -+$(pkg-config xtables --cflags --libs) -ldl >/dev/null 2>&1
> - then
> - 	echo "TC_CONFIG_XT:=3Dy" >>Config
> - 	echo "using xtables"
> -@@ -84,7 +85,7 @@
> - }
> -
> - EOF
> --gcc -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl=20
> >/dev/null 2>&1
> -+$CC -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl=20
> -+>/dev/null 2>&1
> -
> - if [ $? -eq 0 ]
> - then
> -@@ -124,7 +125,7 @@
> - }
> -
> - EOF
> --gcc -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl=20
> >/dev/null 2>&1
> -+$CC -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl=20
> -+>/dev/null 2>&1
> -
> - if [ $? -eq 0 ]
> - then
> -@@ -145,7 +146,7 @@
> - check_ipt_lib_dir()
> - {
> - 	IPT_LIB_DIR=3D""
> --	for dir in /lib /usr/lib /usr/local/lib
> -+	for dir in $SYSROOT/lib $SYSROOT/usr/lib $SYSROOT/usr/local/lib
> - 	do
> - 		for file in $dir/{xtables,iptables}/lib*t_*so ; do
> - 			if [ -f $file ]; then
> -@@ -168,7 +169,7 @@
> - 	return 0;
> - }
> - EOF
> --gcc -I$INCLUDE -o /tmp/setnstest /tmp/setnstest.c >/dev/null 2>&1
> -+$CC -I$INCLUDE -o /tmp/setnstest /tmp/setnstest.c >/dev/null 2>&1
> - if [ $? -eq 0 ]
> - then
> - 	echo "IP_CONFIG_SETNS:=3Dy" >>Config
> diff --git=20
> a/meta/recipes-connectivity/iproute2/iproute2-3.4.0/configure-cross.pa
> tch=20
> b/meta/recipes-connectivity/iproute2/iproute2-3.4.0/configure-cross.pa
> tch
> new file mode 100644
> index 0000000..42f591a
> --- /dev/null
> +++ b/meta/recipes-connectivity/iproute2/iproute2-3.4.0/configure-cros
> +++ s.patch
> @@ -0,0 +1,77 @@
> +From 85b0589b4843c03e8e6fd9416d71ea449a73c5c0 Mon Sep 17 00:00:00=20
> +2001
> +From: Koen Kooi <koen@dominion.thruhere.net>
> +Date: Thu, 3 Nov 2011 10:46:16 +0100
> +Subject: [PATCH] make configure cross compile safe
> +
> +According to Kevin Tian:
> +Upstream-Status: Pending
> +
> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> +Signed-off-by: Shane Wang <shane.wang@intel.com>
> +
> +Index: iproute2-3.4.0/configure
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- iproute2-3.4.0.orig/configure
> ++++ iproute2-3.4.0/configure
> +@@ -2,6 +2,7 @@
> + # This is not an autconf generated configure  # =20
> +INCLUDE=3D${1:-"$PWD/include"}
> ++SYSROOT=3D$1
> +
> + # Make a temp directory in build tree.
> + TMPDIR=3D$(mktemp -d config.XXXXXX)
> +@@ -17,7 +18,7 @@ int main(int argc, char **argv) {
> + 	return 0;
> + }
> + EOF
> +-gcc -I$INCLUDE -o $TMPDIR/atmtest $TMPDIR/atmtest.c -latm >/dev/null=20
> +2>&1
> ++$CC -I$INCLUDE -o $TMPDIR/atmtest $TMPDIR/atmtest.c -latm >/dev/null=20
> ++2>&1
> + if [ $? -eq 0 ]
> + then
> +     echo "TC_CONFIG_ATM:=3Dy" >>Config @@ -51,7 +52,7 @@ int main(int=20
> +argc, char **argv)
> +
> + EOF
> +
> +-if gcc -I$INCLUDE $IPTC -o $TMPDIR/ipttest $TMPDIR/ipttest.c $IPTL=20
> +$(pkg-config xtables --cflags --libs) -ldl >/dev/null 2>&1
> ++if $CC -I$INCLUDE $IPTC -o $TMPDIR/ipttest $TMPDIR/ipttest.c $IPTL=20
> ++$(pkg-config xtables --cflags --libs) -ldl >/dev/null 2>&1
> + then
> + 	echo "TC_CONFIG_XT:=3Dy" >>Config
> + 	echo "using xtables"
> +@@ -88,7 +89,7 @@ int main(int argc, char **argv) {  }
> +
> + EOF
> +-gcc -I$INCLUDE $IPTC -o $TMPDIR/ipttest $TMPDIR/ipttest.c $IPTL -ldl=20
> +>/dev/null 2>&1
> ++$CC -I$INCLUDE $IPTC -o $TMPDIR/ipttest $TMPDIR/ipttest.c $IPTL -ldl=20
> ++>/dev/null 2>&1
> +
> + if [ $? -eq 0 ]
> + then
> +@@ -128,7 +129,7 @@ int main(int argc, char **argv) {  }
> +
> + EOF
> +-gcc -I$INCLUDE $IPTC -o $TMPDIR/ipttest $TMPDIR/ipttest.c $IPTL -ldl=20
> +>/dev/null 2>&1
> ++$CC -I$INCLUDE $IPTC -o $TMPDIR/ipttest $TMPDIR/ipttest.c $IPTL -ldl=20
> ++>/dev/null 2>&1
> +
> + if [ $? -eq 0 ]
> + then
> +@@ -149,7 +150,7 @@ check_ipt()
> + check_ipt_lib_dir()
> + {
> + 	IPT_LIB_DIR=3D""
> +-	for dir in /lib /usr/lib /usr/local/lib
> ++	for dir in $SYSROOT/lib $SYSROOT/usr/lib $SYSROOT/usr/local/lib
> + 	do
> + 		for file in $dir/{xtables,iptables}/lib*t_*so ; do
> + 			if [ -f $file ]; then
> +@@ -172,7 +173,7 @@ int main(int argc, char **argv)
> + 	return 0;
> + }
> + EOF
> +-gcc -I$INCLUDE -o $TMPDIR/setnstest $TMPDIR/setnstest.c >/dev/null=20
> +2>&1
> ++$CC -I$INCLUDE -o $TMPDIR/setnstest $TMPDIR/setnstest.c >/dev/null=20
> ++2>&1
> + if [ $? -eq 0 ]
> + then
> + 	echo "IP_CONFIG_SETNS:=3Dy" >>Config
> diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc=20
> b/meta/recipes-connectivity/iproute2/iproute2.inc
> index 86847ef..7caf7d0 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2.inc
> +++ b/meta/recipes-connectivity/iproute2/iproute2.inc
> @@ -26,12 +26,12 @@ do_install () {
>   # There are only .so files in iproute2
>   INSANE_SKIP_${PN} =3D "dev-so"
>
> -FILES_${PN} +=3D "${base_libdir}/tc"
> -FILES_${PN}-dbg +=3D "${base_libdir}/tc/.debug"
> +FILES_${PN} +=3D "${libdir}/tc"
> +FILES_${PN}-dbg +=3D "${libdir}/tc/.debug"
>
> -ALTERNATIVE_NAME =3D "ip"
> -ALTERNATIVE_PATH =3D "${base_sbindir}/ip.iproute2"
> -ALTERNATIVE_LINK =3D "${base_bindir}/ip"
> +ALTERNATIVE_${PN} =3D "ip"
> +ALTERNATIVE_TARGET[ip] =3D "${base_sbindir}/ip.${BPN}"
> +ALTERNATIVE_LINK_NAME[ip] =3D "${base_bindir}/ip"
>   ALTERNATIVE_PRIORITY =3D "100"
>

Did you use buildhistory to compare the changes to the package?

Sau!

>   PARALLEL_MAKE =3D ""
> diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.2.0.bb=20
> b/meta/recipes-connectivity/iproute2/iproute2_3.2.0.bb
> deleted file mode 100644
> index 5af12af..0000000
> --- a/meta/recipes-connectivity/iproute2/iproute2_3.2.0.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -require iproute2.inc
> -
> -PR =3D "r1"
> -
> -#v3.2.0 tag is "447c118f138171b260ad045ad6e1b17f9ef462e2"
> -#but it was not fully tested and had build error, and the next commit fi=
xed it.
> -SRCREV =3D "13603f6a9e46f08576f6284a0ef1ce1fbf94ffe0"
> -SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/shemminger/ip=
route2.git \
> -           file://configure-cross.patch"
> -S =3D "${WORKDIR}/git"
> -
> diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.4.0.bb=20
> b/meta/recipes-connectivity/iproute2/iproute2_3.4.0.bb
> new file mode 100644
> index 0000000..cf1d521
> --- /dev/null
> +++ b/meta/recipes-connectivity/iproute2/iproute2_3.4.0.bb
> @@ -0,0 +1,9 @@
> +require iproute2.inc
> +
> +PR =3D "r0"
> +
> +SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BPN}-${PV}.tar=
.xz \
> +           file://configure-cross.patch"
> +
> +SRC_URI[md5sum] =3D "879d3fac4e90809598b2864ec4a0cbf8"
> +SRC_URI[sha256sum] =3D "38e846e412b2fa235a447b50c20ad1e9770d1b3ed4d3ab18=
ca0b18c6e8b79ba4"
>



