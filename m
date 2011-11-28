Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RV4DX-0007Qu-EH
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Nov 2011 17:38:07 +0100
Received: by bkbzs2 with SMTP id zs2so8039682bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2011 08:31:28 -0800 (PST)
Received: by 10.204.157.133 with SMTP id b5mr45355520bkx.121.1322497888519;
	Mon, 28 Nov 2011 08:31:28 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id z7sm30678970bka.1.2011.11.28.08.31.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Nov 2011 08:31:27 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Mon, 28 Nov 2011 17:31:22 +0100
In-Reply-To: <1322126292-25928-2-git-send-email-koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
References: <1322126292-25928-1-git-send-email-koen@dominion.thruhere.net>
	<1322126292-25928-2-git-send-email-koen@dominion.thruhere.net>
Message-Id: <EC6EE189-9EE0-4823-AE95-2FD157667C42@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCHv2 2/2] pulseaudio: update to 1.1, delete 0.9.x
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
X-List-Received-Date: Mon, 28 Nov 2011 16:38:07 -0000
X-Groupsio-MsgNum: 12991
Content-Type: multipart/signed;
	boundary="Apple-Mail=_68E22E5D-EB15-429C-B7F6-59E4B3AC4C14";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_68E22E5D-EB15-429C-B7F6-59E4B3AC4C14
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Judging from the overwhelming lack of negative feedback I trust noone =
will come out of the woodwork screaming bloody murder after this has =
been applied?

Op 24 nov. 2011, om 10:18 heeft Koen Kooi het volgende geschreven:

> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>=20
> Changes since v1:
> 	* remove pulse from default-versions
> 	* thumb1 has been verified to build
>=20
> As indicated in the subject, this is an RFC, please review and test.
>=20
> 1) the ARM_INSTRUCTIONSET workarounds have been removed, so for people =
using thumb1, please test
> 2) this is only buildtested on armv7a, more buildtests and runtime =
tests are on their way, so please test=20
>=20
> meta/conf/distro/include/default-versions.inc      |    1 -
> .../pulseaudio/pulseaudio-0.9.22/armv4+v5asm.patch |   61 =
--------------------
> .../pulseaudio-0.9.22/autoconf_version.patch       |   17 ------
> .../pulseaudio/pulseaudio-0.9.22/buildfix.patch    |   17 ------
> .../pulseaudio-0.9.22/configure_silent_rules.patch |   33 -----------
> .../pulseaudio-0.9.22/gcc4-compile-fix.patch       |   22 -------
> .../pulseaudio/pulseaudio-0.9.22/tls_m4.patch      |   34 -----------
> .../pulseaudio-0.9.22/volatiles.04_pulse           |    2 -
> .../pulseaudio-0.9.23/autoconf_version.patch       |   17 ------
> .../pulseaudio/pulseaudio-0.9.23/buildfix.patch    |   17 ------
> .../pulseaudio-0.9.23/configure_silent_rules.patch |   33 -----------
> .../pulseaudio-0.9.23/fix_bluez_build.patch        |   26 --------
> .../pulseaudio-0.9.23/gcc4-compile-fix.patch       |   22 -------
> .../pulseaudio/pulseaudio-0.9.23/tls_m4.patch      |   34 -----------
> .../pulseaudio-0.9.23/volatiles.04_pulse           |    2 -
> meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    2 +-
> .../pulseaudio/pulseaudio/volatiles.04_pulse       |    2 +
> .../pulseaudio/pulseaudio_0.9.22.bb                |   24 --------
> .../pulseaudio/pulseaudio_0.9.23.bb                |   27 ---------
> .../pulseaudio/pulseaudio_1.1.bb                   |   19 ++++++
> 20 files changed, 22 insertions(+), 390 deletions(-)
> delete mode 100644 =
meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/armv4+v5asm.patch
> delete mode 100644 =
meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/autoconf_version.patc=
h
> delete mode 100644 =
meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/buildfix.patch
> delete mode 100644 =
meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/configure_silent_rule=
s.patch
> delete mode 100644 =
meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/gcc4-compile-fix.patc=
h
> delete mode 100644 =
meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/tls_m4.patch
> delete mode 100644 =
meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/volatiles.04_pulse
> delete mode 100644 =
meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/autoconf_version.patc=
h
> delete mode 100644 =
meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/buildfix.patch
> delete mode 100644 =
meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/configure_silent_rule=
s.patch
> delete mode 100644 =
meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/fix_bluez_build.patch=

> delete mode 100644 =
meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/gcc4-compile-fix.patc=
h
> delete mode 100644 =
meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/tls_m4.patch
> delete mode 100644 =
meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/volatiles.04_pulse
> create mode 100644 =
meta/recipes-multimedia/pulseaudio/pulseaudio/volatiles.04_pulse
> delete mode 100644 =
meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb
> delete mode 100644 =
meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
> create mode 100644 =
meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
>=20
> diff --git a/meta/conf/distro/include/default-versions.inc =
b/meta/conf/distro/include/default-versions.inc
> index 90ff005..a86bc0c 100644
> --- a/meta/conf/distro/include/default-versions.inc
> +++ b/meta/conf/distro/include/default-versions.inc
> @@ -1,7 +1,6 @@
> #
> # Default preferred versions
> #
> -PREFERRED_VERSION_pulseaudio ?=3D "0.9.23"
>=20
> # Force the python versions in one place
> PYTHON_BASEVERSION ?=3D "2.7"
> diff --git =
a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/armv4+v5asm.patch =
b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/armv4+v5asm.patch
> deleted file mode 100644
> index 4ce5a48..0000000
> --- =
a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/armv4+v5asm.patch
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -Derived from OE by Dongxiao Xu <dongxiao.xu@intel.com>
> -
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -Index: pulseaudio-0.9.21/src/pulsecore/svolume_arm.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- pulseaudio-0.9.21.orig/src/pulsecore/svolume_arm.c
> -+++ pulseaudio-0.9.21/src/pulsecore/svolume_arm.c
> -@@ -37,6 +37,14 @@
> -=20
> - #if defined (__arm__)
> -=20
> -+/*
> -+   the code below uses armv6 instructions; we can safely ifdef this =
away as the code is only
> -+   called if the arm architecture is v6 or higher
> -+*/
> -+#if (!defined (__ARM_ARCH_4__) && !defined (__ARM_ARCH_4T__) \
> -+	&& !defined (__ARM_ARCH_5__)&& !defined (__ARM_ARCH_5E__) && =
!defined (__ARM_ARCH_5T__) \
> -+	&& !defined (__ARM_ARCH_5TE__) && !defined (__ARM_ARCH_5TEJ__))
> -+
> - #define MOD_INC() \
> -     " subs  r0, r6, %2              \n\t" \
> -     " addcs r0, %1                  \n\t" \
> -@@ -179,11 +187,15 @@ static void run_test (void) {
> - }
> - #endif
> -=20
> -+#endif /* (!defined (__ARM_ARCH_4__) && !defined (__ARM_ARCH_4T__) =
... */
> - #endif /* defined (__arm__) */
> -=20
> -=20
> - void pa_volume_func_init_arm (pa_cpu_arm_flag_t flags) {
> - #if defined (__arm__)
> -+#if (!defined (__ARM_ARCH_4__) && !defined (__ARM_ARCH_4T__) \
> -+	&& !defined (__ARM_ARCH_5__)&& !defined (__ARM_ARCH_5E__) && =
!defined (__ARM_ARCH_5T__) \
> -+	&& !defined (__ARM_ARCH_5TE__) && !defined (__ARM_ARCH_5TEJ__))
> -     pa_log_info("Initialising ARM optimized functions.");
> -=20
> - #ifdef RUN_TEST
> -@@ -191,5 +203,6 @@ void pa_volume_func_init_arm (pa_cpu_arm
> - #endif
> -=20
> -     pa_set_volume_func (PA_SAMPLE_S16NE,     (pa_do_volume_func_t) =
pa_volume_s16ne_arm);
> -+#endif /* (!defined (__ARM_ARCH_4__) && !defined (__ARM_ARCH_4T__) =
... */
> - #endif /* defined (__arm__) */
> - }
> -Index: pulseaudio-0.9.21/src/modules/bluetooth/sbc_math.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- pulseaudio-0.9.21.orig/src/modules/bluetooth/sbc_math.h
> -+++ pulseaudio-0.9.21/src/modules/bluetooth/sbc_math.h
> -@@ -47,7 +47,9 @@ typedef int32_t sbc_fixed_t;
> -=20
> - #define SBC_FIXED_0(val) { val =3D 0; }
> - #define MUL(a, b)        ((a) * (b))
> --#ifdef __arm__
> -+#if (defined(__arm__) && !defined (__ARM_ARCH_4__) && !defined =
(__ARM_ARCH_4T__) \
> -+	&& !defined (__ARM_ARCH_5__)&& !defined (__ARM_ARCH_5E__) && =
!defined (__ARM_ARCH_5T__) \
> -+	&& !defined (__ARM_ARCH_5TE__) && !defined (__ARM_ARCH_5TEJ__))
> - #define MULA(a, b, res) ({				\
> - 		int tmp =3D res;			\
> - 		__asm__(				\
> diff --git =
a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/autoconf_version.pa=
tch =
b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/autoconf_version.pa=
tch
> deleted file mode 100644
> index 86e3972..0000000
> --- =
a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/autoconf_version.pa=
tch
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -Derived from OE by Dongxiao Xu <dongxiao.xu@intel.com>
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> -Index: pulseaudio-0.9.15/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- pulseaudio-0.9.15.orig/configure.ac	2009-04-14 =
00:09:53.000000000 +0100
> -+++ pulseaudio-0.9.15/configure.ac	2009-05-22 11:32:50.000000000 =
+0100
> -@@ -20,7 +20,7 @@
> - # along with PulseAudio; if not, write to the Free Software =
Foundation,
> - # Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
> -=20
> --AC_PREREQ(2.63)
> -+AC_PREREQ(2.61)
> -=20
> - m4_define(pa_major, [0])
> - m4_define(pa_minor, [9])
> diff --git =
a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/buildfix.patch =
b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/buildfix.patch
> deleted file mode 100644
> index 99ceff8..0000000
> --- =
a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/buildfix.patch
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -Derived from OE by Dongxiao Xu <dongxiao.xu@intel.com>
> -
> -Upstream-Status: Pending
> -
> -Index: pulseaudio-0.9.11/src/pulsecore/atomic.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- pulseaudio-0.9.11.orig/src/pulsecore/atomic.h
> -+++ pulseaudio-0.9.11/src/pulsecore/atomic.h
> -@@ -40,6 +40,8 @@
> - #error "Please include config.h before including this file!"
> - #endif
> -=20
> -+#include "macro.h"
> -+
> - #ifdef HAVE_ATOMIC_BUILTINS
> -=20
> - /* __sync based implementation */
> diff --git =
a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/configure_silent_ru=
les.patch =
b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/configure_silent_ru=
les.patch
> deleted file mode 100644
> index d4a247a..0000000
> --- =
a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/configure_silent_ru=
les.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -Derived from OE by Dongxiao Xu <dongxiao.xu@intel.com>
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> -Index: pulseaudio-0.9.19/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- pulseaudio-0.9.19.orig/configure.ac	2009-10-31 =
11:40:00.000000000 +0000
> -+++ pulseaudio-0.9.19/configure.ac	2009-10-31 11:50:35.000000000 =
+0000
> -@@ -27,12 +27,13 @@
> - AC_CONFIG_SRCDIR([src/daemon/main.c])
> - AC_CONFIG_MACRO_DIR([m4])
> - AC_CONFIG_HEADERS([config.h])
> --AM_INIT_AUTOMAKE([foreign 1.11 -Wall -Wno-portability silent-rules =
tar-pax])
> -+AM_INIT_AUTOMAKE([foreign 1.10 -Wall -Wno-portability tar-pax])
> -=20
> - m4_define(pa_major, `echo $VERSION | cut -d. -f1 | cut -d- -f1`)
> - m4_define(pa_minor, `echo $VERSION | cut -d. -f2 | cut -d- -f1`)
> - m4_define(pa_micro, `echo $VERSION | cut -d. -f3 | cut -d- -f1`)
> -=20
> -+
> - AC_SUBST(PA_MAJOR, pa_major)
> - AC_SUBST(PA_MINOR, pa_minor)
> - AC_SUBST(PA_MICRO, pa_micro)
> -@@ -80,7 +81,8 @@
> -       ;;
> - esac
> -=20
> --AM_SILENT_RULES([yes])
> -+# only use if available
> -+m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
> -=20
> - #### Checks for programs. ####
> -=20
> diff --git =
a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/gcc4-compile-fix.pa=
tch =
b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/gcc4-compile-fix.pa=
tch
> deleted file mode 100644
> index f8b07ea..0000000
> --- =
a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/gcc4-compile-fix.pa=
tch
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -| fix for more strict syntax compliance in gcc4.x
> -| pulsecore/core-util.c: In function 'pa_raise_priority':
> -| pulsecore/core-util.c:547: error: label at end of compound =
statement
> -| Signed off: mickey@openmoko.org
> -|
> -Derived from OE by Dongxiao Xu <dongxiao.xu@intel.com>
> -
> -Upstream-Status: Pending
> -
> -Index: pulseaudio-0.9.6/src/pulsecore/core-util.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- pulseaudio-0.9.6.orig/src/pulsecore/core-util.c
> -+++ pulseaudio-0.9.6/src/pulsecore/core-util.c
> -@@ -535,7 +535,7 @@ void pa_raise_priority(void) {
> -         pa_log_info("Successfully gained high priority class.");
> - #endif
> -=20
> --fail:
> -+fail:;
> -=20
> - #if defined(HAVE_SYS_CAPABILITY_H)
> -     if (caps) {
> diff --git =
a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/tls_m4.patch =
b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/tls_m4.patch
> deleted file mode 100644
> index bae0a25..0000000
> --- =
a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/tls_m4.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -Derived from OE by Dongxiao Xu <dongxiao.xu@intel.com>
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> -Index: pulseaudio-0.9.15/m4/tls.m4
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- pulseaudio-0.9.15.orig/m4/tls.m4	2008-08-19 23:25:02.000000000 =
+0200
> -+++ pulseaudio-0.9.15/m4/tls.m4	2009-07-10 09:55:25.266365511 =
+0200
> -@@ -1,12 +1,19 @@
> - AC_DEFUN([CC_CHECK_TLS], [
> -   AC_CACHE_CHECK([whether $CC knows __thread for Thread-Local =
Storage],
> -     cc_cv_tls___thread,
> --    [AC_COMPILE_IFELSE(
> --      AC_LANG_PROGRAM(
> --        [[static __thread int a =3D 6;]],
> --        [[a =3D 5;]]),
> --      [cc_cv_tls___thread=3Dyes],
> --      [cc_cv_tls___thread=3Dno])
> -+    [AC_LINK_IFELSE([__thread int a; int b; int main() { return a =3D =
b; }],
> -+	 [chktls_save_LDFLAGS=3D"$LDFLAGS"
> -+	  LDFLAGS=3D"-shared -Wl,--no-undefined $LDFLAGS"
> -+	  chktls_save_CFLAGS=3D"$CFLAGS"
> -+	  CFLAGS=3D"-fPIC $CFLAGS"
> -+	  dnl If -shared works, test if TLS works in a shared library.
> -+	  AC_LINK_IFELSE([int f() { return 0; }],
> -+	    AC_LINK_IFELSE([__thread int a; int b; int f() { return a =3D =
b; }],
> -+	      [cc_cv_tls___thread=3Dyes],
> -+	      [cc_cv_tls___thread=3Dno]),
> -+	    [cc_cv_tls___thread=3Dyes])
> -+	  CFLAGS=3D"$chktls_save_CFLAGS"
> -+	  LDFLAGS=3D"$chktls_save_LDFLAGS"], [cc_cv_tls___thread=3Dno])
> -     ])
> -  =20
> -   AS_IF([test "x$cc_cv_tls___thread" =3D "xyes"],
> diff --git =
a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/volatiles.04_pulse =
b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/volatiles.04_pulse
> deleted file mode 100644
> index 5b19980..0000000
> --- =
a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/volatiles.04_pulse
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -# <type> <owner> <group> <mode> <path> <linksource>
> -d pulse pulse 0755 /var/run/pulse none
> diff --git =
a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/autoconf_version.pa=
tch =
b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/autoconf_version.pa=
tch
> deleted file mode 100644
> index 86e3972..0000000
> --- =
a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/autoconf_version.pa=
tch
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -Derived from OE by Dongxiao Xu <dongxiao.xu@intel.com>
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> -Index: pulseaudio-0.9.15/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- pulseaudio-0.9.15.orig/configure.ac	2009-04-14 =
00:09:53.000000000 +0100
> -+++ pulseaudio-0.9.15/configure.ac	2009-05-22 11:32:50.000000000 =
+0100
> -@@ -20,7 +20,7 @@
> - # along with PulseAudio; if not, write to the Free Software =
Foundation,
> - # Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
> -=20
> --AC_PREREQ(2.63)
> -+AC_PREREQ(2.61)
> -=20
> - m4_define(pa_major, [0])
> - m4_define(pa_minor, [9])
> diff --git =
a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/buildfix.patch =
b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/buildfix.patch
> deleted file mode 100644
> index 99ceff8..0000000
> --- =
a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/buildfix.patch
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -Derived from OE by Dongxiao Xu <dongxiao.xu@intel.com>
> -
> -Upstream-Status: Pending
> -
> -Index: pulseaudio-0.9.11/src/pulsecore/atomic.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- pulseaudio-0.9.11.orig/src/pulsecore/atomic.h
> -+++ pulseaudio-0.9.11/src/pulsecore/atomic.h
> -@@ -40,6 +40,8 @@
> - #error "Please include config.h before including this file!"
> - #endif
> -=20
> -+#include "macro.h"
> -+
> - #ifdef HAVE_ATOMIC_BUILTINS
> -=20
> - /* __sync based implementation */
> diff --git =
a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/configure_silent_ru=
les.patch =
b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/configure_silent_ru=
les.patch
> deleted file mode 100644
> index d4a247a..0000000
> --- =
a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/configure_silent_ru=
les.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -Derived from OE by Dongxiao Xu <dongxiao.xu@intel.com>
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> -Index: pulseaudio-0.9.19/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- pulseaudio-0.9.19.orig/configure.ac	2009-10-31 =
11:40:00.000000000 +0000
> -+++ pulseaudio-0.9.19/configure.ac	2009-10-31 11:50:35.000000000 =
+0000
> -@@ -27,12 +27,13 @@
> - AC_CONFIG_SRCDIR([src/daemon/main.c])
> - AC_CONFIG_MACRO_DIR([m4])
> - AC_CONFIG_HEADERS([config.h])
> --AM_INIT_AUTOMAKE([foreign 1.11 -Wall -Wno-portability silent-rules =
tar-pax])
> -+AM_INIT_AUTOMAKE([foreign 1.10 -Wall -Wno-portability tar-pax])
> -=20
> - m4_define(pa_major, `echo $VERSION | cut -d. -f1 | cut -d- -f1`)
> - m4_define(pa_minor, `echo $VERSION | cut -d. -f2 | cut -d- -f1`)
> - m4_define(pa_micro, `echo $VERSION | cut -d. -f3 | cut -d- -f1`)
> -=20
> -+
> - AC_SUBST(PA_MAJOR, pa_major)
> - AC_SUBST(PA_MINOR, pa_minor)
> - AC_SUBST(PA_MICRO, pa_micro)
> -@@ -80,7 +81,8 @@
> -       ;;
> - esac
> -=20
> --AM_SILENT_RULES([yes])
> -+# only use if available
> -+m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
> -=20
> - #### Checks for programs. ####
> -=20
> diff --git =
a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/fix_bluez_build.pat=
ch =
b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/fix_bluez_build.pat=
ch
> deleted file mode 100644
> index fbb22d7..0000000
> --- =
a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/fix_bluez_build.pat=
ch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -using uClibc $(INTLLIBS) is not empty but set to -lintl
> -this means that AM_LIBADD wont be empty as well and hence
> -a missing space which otherwise works starts to show up as error
> -
> -| make[4]: *** No rule to make target `-lintl', needed by =
`libbluetooth-ipc.la'.  Stop.
> -| make[4]: Leaving directory =
`/home/kraj/work/angstrom/sources/openembedded-core/build/tmp-uclibc/work/=
armv5te-oe-linux-uclibceabi/pulseaudio-0.9.23-r7/pulseaudio-0.9.23/src'
> -| make[3]: *** [all-recursive] Error 1
> -
> -We add missing space
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> -Index: pulseaudio-0.9.23/src/Makefile.am
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- pulseaudio-0.9.23.orig/src/Makefile.am	2011-06-23 =
13:18:54.000000000 -0700
> -+++ pulseaudio-0.9.23/src/Makefile.am	2011-11-20 =
09:04:00.986917207 -0800
> -@@ -1701,7 +1701,7 @@
> -=20
> - libbluetooth_ipc_la_SOURCES =3D modules/bluetooth/ipc.c =
modules/bluetooth/ipc.h
> - libbluetooth_ipc_la_LDFLAGS =3D -avoid-version
> --libbluetooth_ipc_la_LIBADD =3D =
$(AM_LIBADD)libpulsecore-@PA_MAJORMINORMICRO@.la =
libpulsecommon-@PA_MAJORMINORMICRO@.la libpulse.la
> -+libbluetooth_ipc_la_LIBADD =3D $(AM_LIBADD) =
libpulsecore-@PA_MAJORMINORMICRO@.la =
libpulsecommon-@PA_MAJORMINORMICRO@.la libpulse.la
> - libbluetooth_ipc_la_CFLAGS =3D $(AM_CFLAGS)
> - BLUETOOTH_IPC_FILES =3D $(subst =
modules/bluetooth/,,$(libbluetooth_ipc_la_SOURCES)) rtp.h
> -=20
> diff --git =
a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/gcc4-compile-fix.pa=
tch =
b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/gcc4-compile-fix.pa=
tch
> deleted file mode 100644
> index f8b07ea..0000000
> --- =
a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/gcc4-compile-fix.pa=
tch
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -| fix for more strict syntax compliance in gcc4.x
> -| pulsecore/core-util.c: In function 'pa_raise_priority':
> -| pulsecore/core-util.c:547: error: label at end of compound =
statement
> -| Signed off: mickey@openmoko.org
> -|
> -Derived from OE by Dongxiao Xu <dongxiao.xu@intel.com>
> -
> -Upstream-Status: Pending
> -
> -Index: pulseaudio-0.9.6/src/pulsecore/core-util.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- pulseaudio-0.9.6.orig/src/pulsecore/core-util.c
> -+++ pulseaudio-0.9.6/src/pulsecore/core-util.c
> -@@ -535,7 +535,7 @@ void pa_raise_priority(void) {
> -         pa_log_info("Successfully gained high priority class.");
> - #endif
> -=20
> --fail:
> -+fail:;
> -=20
> - #if defined(HAVE_SYS_CAPABILITY_H)
> -     if (caps) {
> diff --git =
a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/tls_m4.patch =
b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/tls_m4.patch
> deleted file mode 100644
> index bae0a25..0000000
> --- =
a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/tls_m4.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -Derived from OE by Dongxiao Xu <dongxiao.xu@intel.com>
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> -Index: pulseaudio-0.9.15/m4/tls.m4
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- pulseaudio-0.9.15.orig/m4/tls.m4	2008-08-19 23:25:02.000000000 =
+0200
> -+++ pulseaudio-0.9.15/m4/tls.m4	2009-07-10 09:55:25.266365511 =
+0200
> -@@ -1,12 +1,19 @@
> - AC_DEFUN([CC_CHECK_TLS], [
> -   AC_CACHE_CHECK([whether $CC knows __thread for Thread-Local =
Storage],
> -     cc_cv_tls___thread,
> --    [AC_COMPILE_IFELSE(
> --      AC_LANG_PROGRAM(
> --        [[static __thread int a =3D 6;]],
> --        [[a =3D 5;]]),
> --      [cc_cv_tls___thread=3Dyes],
> --      [cc_cv_tls___thread=3Dno])
> -+    [AC_LINK_IFELSE([__thread int a; int b; int main() { return a =3D =
b; }],
> -+	 [chktls_save_LDFLAGS=3D"$LDFLAGS"
> -+	  LDFLAGS=3D"-shared -Wl,--no-undefined $LDFLAGS"
> -+	  chktls_save_CFLAGS=3D"$CFLAGS"
> -+	  CFLAGS=3D"-fPIC $CFLAGS"
> -+	  dnl If -shared works, test if TLS works in a shared library.
> -+	  AC_LINK_IFELSE([int f() { return 0; }],
> -+	    AC_LINK_IFELSE([__thread int a; int b; int f() { return a =3D =
b; }],
> -+	      [cc_cv_tls___thread=3Dyes],
> -+	      [cc_cv_tls___thread=3Dno]),
> -+	    [cc_cv_tls___thread=3Dyes])
> -+	  CFLAGS=3D"$chktls_save_CFLAGS"
> -+	  LDFLAGS=3D"$chktls_save_LDFLAGS"], [cc_cv_tls___thread=3Dno])
> -     ])
> -  =20
> -   AS_IF([test "x$cc_cv_tls___thread" =3D "xyes"],
> diff --git =
a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/volatiles.04_pulse =
b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/volatiles.04_pulse
> deleted file mode 100644
> index 5b19980..0000000
> --- =
a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/volatiles.04_pulse
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -# <type> <owner> <group> <mode> <path> <linksource>
> -d pulse pulse 0755 /var/run/pulse none
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc =
b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> index 747b650..a94c398 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -68,7 +68,7 @@ FILES_libpulse-mainloop-glib =3D =
"${libdir}/libpulse-mainloop-glib.so.*"
> 				   	=20
> FILES_${PN}-dbg +=3D "${libexecdir}/pulse/.debug \
>                     ${libdir}/pulse-${PV}/modules/.debug"
> -FILES_${PN}-dev +=3D "${libdir}/pulse-${PV}/modules/*.la =
${datadir}/vala"		   =20
> +FILES_${PN}-dev +=3D "${libdir}/pulse-${PV}/modules/*.la =
${datadir}/vala ${libdir}/cmake"		   =20
> FILES_${PN}-conf =3D "${sysconfdir}"
> FILES_${PN}-bin =3D "${bindir}/* \
>                    ${sysconfdir}/default/volatiles/volatiles.04_pulse"
> diff --git =
a/meta/recipes-multimedia/pulseaudio/pulseaudio/volatiles.04_pulse =
b/meta/recipes-multimedia/pulseaudio/pulseaudio/volatiles.04_pulse
> new file mode 100644
> index 0000000..5b19980
> --- /dev/null
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/volatiles.04_pulse
> @@ -0,0 +1,2 @@
> +# <type> <owner> <group> <mode> <path> <linksource>
> +d pulse pulse 0755 /var/run/pulse none
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb =
b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb
> deleted file mode 100644
> index 3067365..0000000
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -require pulseaudio.inc
> -
> -PR =3D "r7"
> -
> -DEPENDS +=3D "gdbm speex"
> -
> -inherit gettext
> -
> -SRC_URI +=3D "\
> -  file://buildfix.patch \
> -  file://autoconf_version.patch \
> -  file://tls_m4.patch \
> -  file://configure_silent_rules.patch \
> -  file://armv4+v5asm.patch \
> -"
> -
> -do_compile_prepend() {
> -    cd ${S}
> -    mkdir -p ${S}/libltdl
> -    cp ${STAGING_LIBDIR}/libltdl* ${S}/libltdl
> -}
> -
> -SRC_URI[md5sum] =3D "ca85ab470669b05e100861654cf5eb3c"
> -SRC_URI[sha256sum] =3D =
"c6019324395117a258c048a6db5e9734551cc2c61dc35b46403ff00d64be55f0"
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb =
b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
> deleted file mode 100644
> index e712cab..0000000
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -require pulseaudio.inc
> -
> -PR =3D "r8"
> -
> -DEPENDS +=3D "gdbm speex libxml-parser-perl-native"
> -
> -inherit gettext perlnative
> -
> -SRC_URI =3D =
"http://freedesktop.org/software/pulseaudio/releases/pulseaudio-${PV}.tar.=
gz \
> -  file://buildfix.patch \
> -  file://autoconf_version.patch \
> -  file://tls_m4.patch \
> -  file://configure_silent_rules.patch \
> -  file://volatiles.04_pulse \
> -  file://fix_bluez_build.patch \
> -"
> -
> -SRC_URI[md5sum] =3D "7391205a337d1e04a9ff38025f684034"
> -SRC_URI[sha256sum] =3D =
"af3e84c614cb632fd1f57105489fcd5f93f906da1ce5aa9019492212031fba4e"
> -
> -do_compile_prepend() {
> -    cd ${S}
> -    mkdir -p ${S}/libltdl
> -    cp ${STAGING_LIBDIR}/libltdl* ${S}/libltdl
> -}
> -
> -ARM_INSTRUCTION_SET =3D "arm"
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb =
b/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
> new file mode 100644
> index 0000000..d97c932
> --- /dev/null
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
> @@ -0,0 +1,19 @@
> +require pulseaudio.inc
> +
> +DEPENDS +=3D "libjson gdbm speex libxml-parser-perl-native"
> +
> +inherit gettext perlnative
> +
> +SRC_URI =3D =
"http://freedesktop.org/software/pulseaudio/releases/pulseaudio-${PV}.tar.=
xz \
> +  file://volatiles.04_pulse \
> +"
> +
> +SRC_URI[md5sum] =3D "17d21df798cee407b769c6355fae397a"
> +SRC_URI[sha256sum] =3D =
"6fe531136f6ebce2d35872a2d2c914278cdc5dcdd5eea516dc52c81f9001f5ee"
> +
> +do_compile_prepend() {
> +    cd ${S}
> +    mkdir -p ${S}/libltdl
> +    cp ${STAGING_LIBDIR}/libltdl* ${S}/libltdl
> +}
> +
> --=20
> 1.7.2.5
>=20


--Apple-Mail=_68E22E5D-EB15-429C-B7F6-59E4B3AC4C14
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7Tt1wACgkQMkyGM64RGpHBcACdH/PBk47RxiBL4wWQavVWxYM9
JEcAnjMGcUDliVAVyMYDlyxjk9PkqBnz
=1U3S
-----END PGP SIGNATURE-----

--Apple-Mail=_68E22E5D-EB15-429C-B7F6-59E4B3AC4C14--
