Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RjO9l-0004SQ-TW
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Jan 2012 05:45:46 +0100
Received: by iakh37 with SMTP id h37so3653111iak.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2012 20:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=K/ve7SgGGikn2XpR3BzCSHuFYMcRqoOkhVlDL4scoBs=;
	b=xic3iRY4LFV0nN8dYhPwNGVlCTBpHkTE5ZYpMc0xyUhsRnUU5ueFqrrpZFrYLolmWQ
	7+4DFFEGaVE4R02Byq9zUEvZi6Z9PjRTawF4V/QFpzk9BaQTqaLAQmz1unux7jzqu3Ws
	wCLKi07lc6mErpAOLejNiLVrKXfH1CEA9gR7c=
Received: by 10.50.180.233 with SMTP id dr9mr550976igc.11.1325911076332; Fri,
	06 Jan 2012 20:37:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.231.23.208 with HTTP; Fri, 6 Jan 2012 20:37:25 -0800 (PST)
In-Reply-To: <1325906352-2334-1-git-send-email-raj.khem@gmail.com>
References: <1325906352-2334-1-git-send-email-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Jan 2012 20:37:25 -0800
Message-ID: <CAMKF1soq_9VfyfMBJkvHtKk9bqLJ6Mpanmh6B312_JbN3xiyjA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] eglibc: Upgrade recipes 2.14 -> 2.15
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
X-List-Received-Date: Sat, 07 Jan 2012 04:45:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 6, 2012 at 7:19 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Add patch to provide __finite_sqrt functions for ppc
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>

<snip>

> xxx
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

<snip>

that part of log message is bogus

> ---
> =C2=A0...tive_2.14.bb =3D> cross-localedef-native_2.15.bb} | =C2=A0 =C2=
=A00
> =C2=A0.../IO-acquire-lock-fix.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A00
> =C2=A0.../armv4-eabi-compile-fix.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A00
> =C2=A0.../eglibc-rpc-export-again.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A00
> =C2=A0.../eglibc-svn-arm-lowlevellock-include-tls.patch =C2=A0| =C2=A0 =
=C2=A00
> =C2=A0.../{eglibc-2.14 =3D> eglibc-2.15}/etc/ld.so.conf =C2=A0 =C2=A0| =
=C2=A0 =C2=A00
> =C2=A0.../generate-supported.mk =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A00
> =C2=A0.../glibc-2.14-libdl-crash.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A00
> =C2=A0.../ld-search-order.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A00
> =C2=A0.../mips-rld-map-check.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A00
> =C2=A0.../multilib_readlib.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A00
> =C2=A0.../{eglibc-2.14 =3D> eglibc-2.15}/ppc-sqrt.patch =C2=A0 =C2=A0| =
=C2=A0 =C2=A00
> =C2=A0.../eglibc/eglibc-2.15/ppc-sqrt_finite.patch =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0112 ++++++++++++++++++++
> =C2=A0.../stack-protector-test.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A00
> =C2=A0.../use-sysroot-cxx-headers.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 30 +++--
> =C2=A0.../recipes-core/eglibc/eglibc-2.15/x86_fenv.patch | =C2=A0 29 ++++=
+
> =C2=A0...libc-initial_2.14.bb =3D> eglibc-initial_2.15.bb} | =C2=A0 =C2=
=A00
> =C2=A0...eglibc-locale_2.14.bb =3D> eglibc-locale_2.15.bb} | =C2=A0 =C2=
=A00
> =C2=A0.../eglibc/{eglibc_2.14.bb =3D> eglibc_2.15.bb} =C2=A0 =C2=A0 =C2=
=A0| =C2=A0 16 +++-
> =C2=A019 files changed, 172 insertions(+), 15 deletions(-)
> =C2=A0rename meta/recipes-core/eglibc/{cross-localedef-native_2.14.bb =3D=
> cross-localedef-native_2.15.bb} (100%)
> =C2=A0rename meta/recipes-core/eglibc/{eglibc-2.14 =3D> eglibc-2.15}/IO-a=
cquire-lock-fix.patch (100%)
> =C2=A0rename meta/recipes-core/eglibc/{eglibc-2.14 =3D> eglibc-2.15}/armv=
4-eabi-compile-fix.patch (100%)
> =C2=A0rename meta/recipes-core/eglibc/{eglibc-2.14 =3D> eglibc-2.15}/egli=
bc-rpc-export-again.patch (100%)
> =C2=A0rename meta/recipes-core/eglibc/{eglibc-2.14 =3D> eglibc-2.15}/egli=
bc-svn-arm-lowlevellock-include-tls.patch (100%)
> =C2=A0rename meta/recipes-core/eglibc/{eglibc-2.14 =3D> eglibc-2.15}/etc/=
ld.so.conf (100%)
> =C2=A0rename meta/recipes-core/eglibc/{eglibc-2.14 =3D> eglibc-2.15}/gene=
rate-supported.mk (100%)
> =C2=A0rename meta/recipes-core/eglibc/{eglibc-2.14 =3D> eglibc-2.15}/glib=
c-2.14-libdl-crash.patch (100%)
> =C2=A0rename meta/recipes-core/eglibc/{eglibc-2.14 =3D> eglibc-2.15}/ld-s=
earch-order.patch (100%)
> =C2=A0rename meta/recipes-core/eglibc/{eglibc-2.14 =3D> eglibc-2.15}/mips=
-rld-map-check.patch (100%)
> =C2=A0rename meta/recipes-core/eglibc/{eglibc-2.14 =3D> eglibc-2.15}/mult=
ilib_readlib.patch (100%)
> =C2=A0rename meta/recipes-core/eglibc/{eglibc-2.14 =3D> eglibc-2.15}/ppc-=
sqrt.patch (100%)
> =C2=A0create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/ppc-sqrt_fi=
nite.patch
> =C2=A0rename meta/recipes-core/eglibc/{eglibc-2.14 =3D> eglibc-2.15}/stac=
k-protector-test.patch (100%)
> =C2=A0rename meta/recipes-core/eglibc/{eglibc-2.14 =3D> eglibc-2.15}/use-=
sysroot-cxx-headers.patch (51%)
> =C2=A0create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/x86_fenv.pa=
tch
> =C2=A0rename meta/recipes-core/eglibc/{eglibc-initial_2.14.bb =3D> eglibc=
-initial_2.15.bb} (100%)
> =C2=A0rename meta/recipes-core/eglibc/{eglibc-locale_2.14.bb =3D> eglibc-=
locale_2.15.bb} (100%)
> =C2=A0rename meta/recipes-core/eglibc/{eglibc_2.14.bb =3D> eglibc_2.15.bb=
} (95%)
>
> diff --git a/meta/recipes-core/eglibc/cross-localedef-native_2.14.bb b/me=
ta/recipes-core/eglibc/cross-localedef-native_2.15.bb
> similarity index 100%
> rename from meta/recipes-core/eglibc/cross-localedef-native_2.14.bb
> rename to meta/recipes-core/eglibc/cross-localedef-native_2.15.bb
> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/IO-acquire-lock-fix.pat=
ch b/meta/recipes-core/eglibc/eglibc-2.15/IO-acquire-lock-fix.patch
> similarity index 100%
> rename from meta/recipes-core/eglibc/eglibc-2.14/IO-acquire-lock-fix.patc=
h
> rename to meta/recipes-core/eglibc/eglibc-2.15/IO-acquire-lock-fix.patch
> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/armv4-eabi-compile-fix.=
patch b/meta/recipes-core/eglibc/eglibc-2.15/armv4-eabi-compile-fix.patch
> similarity index 100%
> rename from meta/recipes-core/eglibc/eglibc-2.14/armv4-eabi-compile-fix.p=
atch
> rename to meta/recipes-core/eglibc/eglibc-2.15/armv4-eabi-compile-fix.pat=
ch
> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/eglibc-rpc-export-again=
.patch b/meta/recipes-core/eglibc/eglibc-2.15/eglibc-rpc-export-again.patch
> similarity index 100%
> rename from meta/recipes-core/eglibc/eglibc-2.14/eglibc-rpc-export-again.=
patch
> rename to meta/recipes-core/eglibc/eglibc-2.15/eglibc-rpc-export-again.pa=
tch
> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/eglibc-svn-arm-lowlevel=
lock-include-tls.patch b/meta/recipes-core/eglibc/eglibc-2.15/eglibc-svn-ar=
m-lowlevellock-include-tls.patch
> similarity index 100%
> rename from meta/recipes-core/eglibc/eglibc-2.14/eglibc-svn-arm-lowlevell=
ock-include-tls.patch
> rename to meta/recipes-core/eglibc/eglibc-2.15/eglibc-svn-arm-lowlevelloc=
k-include-tls.patch
> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/etc/ld.so.conf b/meta/r=
ecipes-core/eglibc/eglibc-2.15/etc/ld.so.conf
> similarity index 100%
> rename from meta/recipes-core/eglibc/eglibc-2.14/etc/ld.so.conf
> rename to meta/recipes-core/eglibc/eglibc-2.15/etc/ld.so.conf
> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/generate-supported.mk b=
/meta/recipes-core/eglibc/eglibc-2.15/generate-supported.mk
> similarity index 100%
> rename from meta/recipes-core/eglibc/eglibc-2.14/generate-supported.mk
> rename to meta/recipes-core/eglibc/eglibc-2.15/generate-supported.mk
> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/glibc-2.14-libdl-crash.=
patch b/meta/recipes-core/eglibc/eglibc-2.15/glibc-2.14-libdl-crash.patch
> similarity index 100%
> rename from meta/recipes-core/eglibc/eglibc-2.14/glibc-2.14-libdl-crash.p=
atch
> rename to meta/recipes-core/eglibc/eglibc-2.15/glibc-2.14-libdl-crash.pat=
ch
> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/ld-search-order.patch b=
/meta/recipes-core/eglibc/eglibc-2.15/ld-search-order.patch
> similarity index 100%
> rename from meta/recipes-core/eglibc/eglibc-2.14/ld-search-order.patch
> rename to meta/recipes-core/eglibc/eglibc-2.15/ld-search-order.patch
> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/mips-rld-map-check.patc=
h b/meta/recipes-core/eglibc/eglibc-2.15/mips-rld-map-check.patch
> similarity index 100%
> rename from meta/recipes-core/eglibc/eglibc-2.14/mips-rld-map-check.patch
> rename to meta/recipes-core/eglibc/eglibc-2.15/mips-rld-map-check.patch
> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/multilib_readlib.patch =
b/meta/recipes-core/eglibc/eglibc-2.15/multilib_readlib.patch
> similarity index 100%
> rename from meta/recipes-core/eglibc/eglibc-2.14/multilib_readlib.patch
> rename to meta/recipes-core/eglibc/eglibc-2.15/multilib_readlib.patch
> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/ppc-sqrt.patch b/meta/r=
ecipes-core/eglibc/eglibc-2.15/ppc-sqrt.patch
> similarity index 100%
> rename from meta/recipes-core/eglibc/eglibc-2.14/ppc-sqrt.patch
> rename to meta/recipes-core/eglibc/eglibc-2.15/ppc-sqrt.patch
> diff --git a/meta/recipes-core/eglibc/eglibc-2.15/ppc-sqrt_finite.patch b=
/meta/recipes-core/eglibc/eglibc-2.15/ppc-sqrt_finite.patch
> new file mode 100644
> index 0000000..5289051
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-2.15/ppc-sqrt_finite.patch
> @@ -0,0 +1,112 @@
> +on ppc fixes the errors like below
> +| ./.libs/libpulsecore-1.1.so: undefined reference to `__sqrt_finite'
> +| collect2: ld returned 1 exit status
> +
> +Upstream-Status: Pending
> +
> +ChangeLog
> +
> +2012-01-06 =C2=A0Khem Raj =C2=A0<raj.khem@gmail.com>
> +
> + =C2=A0 =C2=A0 =C2=A0 * sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c: A=
dd __*_finite alias.
> + =C2=A0 =C2=A0 =C2=A0 Remove cruft.
> + =C2=A0 =C2=A0 =C2=A0 * sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c: Di=
tto.
> + =C2=A0 =C2=A0 =C2=A0 * sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c: Dit=
to.
> + =C2=A0 =C2=A0 =C2=A0 * sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c: Di=
tto.
> +
> +Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- libc.orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c =C2=A0 =C2=A0 =
=C2=A02012-01-06 18:07:42.296909187 -0800
> ++++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c =C2=A0 2012-01-06 1=
8:09:22.572914856 -0800
> +@@ -39,14 +39,8 @@
> + =C2=A0 =C2=A0We find the actual square root and half of its reciprocal
> + =C2=A0 =C2=A0simultaneously. =C2=A0*/
> +
> +-#ifdef __STDC__
> + double
> + __ieee754_sqrt (double b)
> +-#else
> +-double
> +-__ieee754_sqrt (b)
> +- =C2=A0 =C2=A0 double b;
> +-#endif
> + {
> + =C2=A0 if (__builtin_expect (b > 0, 1))
> + =C2=A0 =C2=A0 {
> +@@ -132,3 +126,4 @@
> + =C2=A0 =C2=A0 }
> + =C2=A0 return f_wash (b);
> + }
> ++strong_alias (__ieee754_sqrt, __sqrt_finite)
> +Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- libc.orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c =C2=A0 =C2=A0=
 2012-01-06 18:10:37.068917644 -0800
> ++++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c =C2=A02012-01-06 1=
8:11:33.408920635 -0800
> +@@ -37,14 +37,8 @@
> + =C2=A0 =C2=A0We find the reciprocal square root and use that to compute=
 the actual
> + =C2=A0 =C2=A0square root. =C2=A0*/
> +
> +-#ifdef __STDC__
> + float
> + __ieee754_sqrtf (float b)
> +-#else
> +-float
> +-__ieee754_sqrtf (b)
> +- =C2=A0 =C2=A0 float b;
> +-#endif
> + {
> + =C2=A0 if (__builtin_expect (b > 0, 1))
> + =C2=A0 =C2=A0 {
> +@@ -99,3 +93,4 @@
> + =C2=A0 =C2=A0 }
> + =C2=A0 return f_washf (b);
> + }
> ++strong_alias (__ieee754_sqrtf, __sqrtf_finite)
> +Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- libc.orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c =C2=A0 =C2=A0=
 2012-01-06 18:11:51.460925644 -0800
> ++++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c =C2=A02012-01-06 1=
8:12:39.344924405 -0800
> +@@ -39,14 +39,8 @@
> + =C2=A0 =C2=A0We find the actual square root and half of its reciprocal
> + =C2=A0 =C2=A0simultaneously. =C2=A0*/
> +
> +-#ifdef __STDC__
> + double
> + __ieee754_sqrt (double b)
> +-#else
> +-double
> +-__ieee754_sqrt (b)
> +- =C2=A0 =C2=A0 double b;
> +-#endif
> + {
> + =C2=A0 if (__builtin_expect (b > 0, 1))
> + =C2=A0 =C2=A0 {
> +@@ -132,3 +126,4 @@
> + =C2=A0 =C2=A0 }
> + =C2=A0 return f_wash (b);
> + }
> ++strong_alias (__ieee754_sqrt, __sqrt_finite)
> +Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- libc.orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c =C2=A0 =C2=
=A02012-01-06 18:13:00.892924586 -0800
> ++++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c 2012-01-06 18:15:=
27.992931106 -0800
> +@@ -37,14 +37,8 @@
> + =C2=A0 =C2=A0We find the reciprocal square root and use that to compute=
 the actual
> + =C2=A0 =C2=A0square root. =C2=A0*/
> +
> +-#ifdef __STDC__
> + float
> + __ieee754_sqrtf (float b)
> +-#else
> +-float
> +-__ieee754_sqrtf (b)
> +- =C2=A0 =C2=A0 float b;
> +-#endif
> + {
> + =C2=A0 if (__builtin_expect (b > 0, 1))
> + =C2=A0 =C2=A0 {
> +@@ -99,3 +93,4 @@
> + =C2=A0 =C2=A0 }
> + =C2=A0 return f_washf (b);
> + }
> ++strong_alias (__ieee754_sqrtf, __sqrtf_finite)
> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/stack-protector-test.pa=
tch b/meta/recipes-core/eglibc/eglibc-2.15/stack-protector-test.patch
> similarity index 100%
> rename from meta/recipes-core/eglibc/eglibc-2.14/stack-protector-test.pat=
ch
> rename to meta/recipes-core/eglibc/eglibc-2.15/stack-protector-test.patch
> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/use-sysroot-cxx-headers=
.patch b/meta/recipes-core/eglibc/eglibc-2.15/use-sysroot-cxx-headers.patch
> similarity index 51%
> rename from meta/recipes-core/eglibc/eglibc-2.14/use-sysroot-cxx-headers.=
patch
> rename to meta/recipes-core/eglibc/eglibc-2.15/use-sysroot-cxx-headers.pa=
tch
> index c06eebf..7f82253 100644
> --- a/meta/recipes-core/eglibc/eglibc-2.14/use-sysroot-cxx-headers.patch
> +++ b/meta/recipes-core/eglibc/eglibc-2.15/use-sysroot-cxx-headers.patch
> @@ -10,27 +10,33 @@ Upstream-Status: Inappropriate [OE-specific]
>
> =C2=A0--- a/configure.in
> =C2=A0+++ b/configure.in
> -@@ -1118,9 +1118,8 @@ if test -n "$sysheaders"; then
> - =C2=A0 SYSINCLUDES=3D"$SYSINCLUDES \
> +@@ -1094,11 +1094,10 @@ if test -n "$sysheaders"; then
> =C2=A0-isystem `echo $sysheaders | sed 's/:/ -isystem /g'`"
> =C2=A0 =C2=A0if test -n "$CXX"; then
> + =C2=A0 =C2=A0 CXX_SYSINCLUDES=3D
> =C2=A0- =C2=A0 =C2=A0cxxversion=3D`$CXX -dumpversion 2>&AS_MESSAGE_LOG_FD=
` &&
> =C2=A0 =C2=A0 =C2=A0cxxmachine=3D`$CXX -dumpmachine 2>&AS_MESSAGE_LOG_FD`=
 &&
> -- =C2=A0 =C2=A0cxxheaders=3D`$CXX -print-file-name=3D../../../../include=
/c++/`"$cxxversion" &&
> -+ =C2=A0 =C2=A0cxxheaders=3D`$CXX -print-sysroot`"$prefix/include/c++" &=
&
> - =C2=A0 =C2=A0 CXX_SYSINCLUDES=3D"-isystem $cxxheaders \
> + =C2=A0 =C2=A0 for d in include "$cxxmachine/include"; do
> +- =C2=A0 =C2=A0 =C2=A0i=3D../../../../$d/c++/$cxxversion
> +- =C2=A0 =C2=A0 =C2=A0cxxheaders=3D`$CXX -print-file-name=3D"$i"` &&
> ++ =C2=A0 =C2=A0 =C2=A0i=3D"$prefix/$d/c++"
> ++ =C2=A0 =C2=A0 =C2=A0cxxheaders=3D`$CXX -print-sysroot`"$i" &&
> + =C2=A0 =C2=A0 =C2=A0 test "x$cxxheaders" !=3D x && test "x$i" !=3D "x$c=
xxheaders" &&
> + =C2=A0 =C2=A0 =C2=A0 CXX_SYSINCLUDES=3D"$CXX_SYSINCLUDES -isystem $cxxh=
eaders \
> =C2=A0-isystem $cxxheaders/$cxxmachine -isystem $cxxheaders/backward"
> - =C2=A0 fi
> =C2=A0--- a/configure
> =C2=A0+++ b/configure
> -@@ -5544,9 +5544,8 @@ if test -n "$sysheaders"; then
> - =C2=A0 SYSINCLUDES=3D"$SYSINCLUDES \
> +@@ -5618,11 +5618,10 @@ if test -n "$sysheaders"; then
> =C2=A0-isystem `echo $sysheaders | sed 's/:/ -isystem /g'`"
> =C2=A0 =C2=A0if test -n "$CXX"; then
> + =C2=A0 =C2=A0 CXX_SYSINCLUDES=3D
> =C2=A0- =C2=A0 =C2=A0cxxversion=3D`$CXX -dumpversion 2>&5` &&
> =C2=A0 =C2=A0 =C2=A0cxxmachine=3D`$CXX -dumpmachine 2>&5` &&
> -- =C2=A0 =C2=A0cxxheaders=3D`$CXX -print-file-name=3D../../../../include=
/c++/`"$cxxversion" &&
> -+ =C2=A0 =C2=A0cxxheaders=3D`$CXX -print-sysroot`"$prefix/include/c++" &=
&
> - =C2=A0 =C2=A0 CXX_SYSINCLUDES=3D"-isystem $cxxheaders \
> + =C2=A0 =C2=A0 for d in include "$cxxmachine/include"; do
> +- =C2=A0 =C2=A0 =C2=A0i=3D../../../../$d/c++/$cxxversion
> +- =C2=A0 =C2=A0 =C2=A0cxxheaders=3D`$CXX -print-file-name=3D"$i"` &&
> ++ =C2=A0 =C2=A0 =C2=A0i=3D"$prefix/$d/c++"
> ++ =C2=A0 =C2=A0 =C2=A0cxxheaders=3D`$CXX -print-sysroot`"$i" &&
> + =C2=A0 =C2=A0 =C2=A0 test "x$cxxheaders" !=3D x && test "x$i" !=3D "x$c=
xxheaders" &&
> + =C2=A0 =C2=A0 =C2=A0 CXX_SYSINCLUDES=3D"$CXX_SYSINCLUDES -isystem $cxxh=
eaders \
> =C2=A0-isystem $cxxheaders/$cxxmachine -isystem $cxxheaders/backward"
> - =C2=A0 fi
> diff --git a/meta/recipes-core/eglibc/eglibc-2.15/x86_fenv.patch b/meta/r=
ecipes-core/eglibc/eglibc-2.15/x86_fenv.patch
> new file mode 100644
> index 0000000..40c1c4d
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-2.15/x86_fenv.patch
> @@ -0,0 +1,29 @@
> +--- a/sysdeps/x86_64/fpu/bits/fenv.h
> ++++ b/sysdeps/x86_64/fpu/bits/fenv.h
> +@@ -112,16 +112,24 @@ __NTH (feraiseexcept (int __excepts))
> + =C2=A0 =C2=A0 =C2=A0 {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* One example of a invalid operation is 0.=
0 / 0.0. =C2=A0*/
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 float __f =3D 0.0;
> +-
> ++# if defined __SSE_MATH__ || __WORDSIZE =3D=3D 64
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 __asm__ __volatile__ ("divss %0, %0 " : : "=
x" (__f));
> ++# else
> ++ =C2=A0 =C2=A0 =C2=A0 __asm__ __volatile__ ("fdiv %%st, %%st(0); fwait"
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 : "=3Dt" (__f) : "0" (__f));
> ++# endif
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) &__f;
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 if ((FE_DIVBYZERO & __excepts) !=3D 0)
> + =C2=A0 =C2=A0 =C2=A0 {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 float __f =3D 1.0;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 float __g =3D 0.0;
> +-
> ++# if defined __SSE_MATH__ || __WORDSIZE =3D=3D 64
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 __asm__ __volatile__ ("divss %1, %0" : : "x=
" (__f), "x" (__g));
> ++# else
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0__asm__ __volatile__ ("fdivp %%st(1), %%st;=
 fwait"
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: "=3Dt" (__f) : "0" (__f), "u" (__g) : "=
st(1)");
> ++# endif
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) &__f;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> diff --git a/meta/recipes-core/eglibc/eglibc-initial_2.14.bb b/meta/recip=
es-core/eglibc/eglibc-initial_2.15.bb
> similarity index 100%
> rename from meta/recipes-core/eglibc/eglibc-initial_2.14.bb
> rename to meta/recipes-core/eglibc/eglibc-initial_2.15.bb
> diff --git a/meta/recipes-core/eglibc/eglibc-locale_2.14.bb b/meta/recipe=
s-core/eglibc/eglibc-locale_2.15.bb
> similarity index 100%
> rename from meta/recipes-core/eglibc/eglibc-locale_2.14.bb
> rename to meta/recipes-core/eglibc/eglibc-locale_2.15.bb
> diff --git a/meta/recipes-core/eglibc/eglibc_2.14.bb b/meta/recipes-core/=
eglibc/eglibc_2.15.bb
> similarity index 95%
> rename from meta/recipes-core/eglibc/eglibc_2.14.bb
> rename to meta/recipes-core/eglibc/eglibc_2.15.bb
> index ad2161e..6d66342 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.14.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
> @@ -1,12 +1,11 @@
> =C2=A0require eglibc.inc
>
> -SRCREV =3D "15870"
> +SRCREV =3D "16540"
>
> =C2=A0DEPENDS +=3D "gperf-native"
> -PR =3D "r3"
> =C2=A0PR_append =3D "+svnr${SRCPV}"
>
> -EGLIBC_BRANCH=3D"eglibc-2_14"
> +EGLIBC_BRANCH=3D"eglibc-2_15"
> =C2=A0SRC_URI =3D "svn://www.eglibc.org/svn/branches/;module=3D${EGLIBC_B=
RANCH};proto=3Dhttp \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://eglibc-svn-arm-lowlevello=
ck-include-tls.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://IO-acquire-lock-fix.patch=
 \
> @@ -20,6 +19,8 @@ SRC_URI =3D "svn://www.eglibc.org/svn/branches/;module=
=3D${EGLIBC_BRANCH};proto=3Dhttp
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://eglibc-rpc-export-again.p=
atch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://glibc-2.14-libdl-crash.pa=
tch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://use-sysroot-cxx-headers.p=
atch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://x86_fenv.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://ppc-sqrt_finite.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
> =C2=A0LIC_FILES_CHKSUM =3D "file://LICENSES;md5=3D98a1128c4b58120182cbea3=
b1752d8b9 \
> =C2=A0 =C2=A0 =C2=A0 file://COPYING;md5=3D393a5ca445f6965873eca0259a17f83=
3 \
> @@ -88,6 +89,15 @@ do_patch_append() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.build.exec_func('do_fix_readlib_c', d)
> =C2=A0}
>
> +# for mips eglibc now builds syscall tables for all abi's
> +# so we make sure that we choose right march option which is
> +# compatible with o32,n32 and n64 abi's
> +# e.g. -march=3Dmips32 is not compatible with n32 and n64 therefore
> +# we filter it out in such case -march=3Dfrom-abi which will be
> +# mips1 when using o32 and mips3 when using n32/n64
> +
> +TUNE_CCARGS_mips :=3D "${@oe_filter_out('-march=3Dmips32', '${TUNE_CCARG=
S}', d)}"
> +
> =C2=A0# We need to ensure that all of the i386 and x86_64 headers are ide=
ntical
> =C2=A0# to support the multilib case. =C2=A0We do this by copying headers=
 from x86_64
> =C2=A0# to i386 directories. =C2=A0Normally when hand building eglibc or =
a combined
> --
> 1.7.5.4
>


