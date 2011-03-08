Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PwqbK-0003Vx-UE
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Mar 2011 07:40:59 +0100
Received: by fxm8 with SMTP id 8so4854651fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2011 22:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=mAVUobYB8ogP5A1eYowyBA/7jtJnSBLSfn628evPQaY=;
	b=UTeMz0mAujbujew0tOwblt+LUsKfiVwMbinpBg+AiKjMR3cwSdDjL5O06AHa+2WNYp
	9/c94XoeMpFu6wh4IJiXotoGJ2kcj8zCDVr0v6pQCCAhQ/pZ0bCCSnsisYQiKWjaD0/3
	0BZ24lICO22+f81vJKu4T1Gye56PmAfHLJ6II=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=Z7ZnH+qmsF42EBc9eiEgPWBONE5UC1ky/uuts4cw6WSHXwmLlRJbmTxeLcMabe8ZxN
	9zKAVWydsEmwKzibkCXl9Hrivj+pjmgKU5mijr8V2R8zT++eiLNuGAVyt3Jfx1dPWG7Q
	3YgVKZqVT31a1PgrKwzQdtD+DMteJbU0ZSevw=
Received: by 10.223.5.3 with SMTP id 3mr3608050fat.0.1299566365157; Mon, 07
	Mar 2011 22:39:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Mon, 7 Mar 2011 22:38:55 -0800 (PST)
In-Reply-To: <1299135167-18330-4-git-send-email-raj.khem@gmail.com>
References: <1299135167-18330-1-git-send-email-raj.khem@gmail.com>
	<1299135167-18330-4-git-send-email-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Mar 2011 22:38:55 -0800
Message-ID: <AANLkTiks0VSWcW4_54mQUv17ZQvb8+CsbWcsDkA_9ZA+@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv3 3/6] gcc: Statically link in support libraries e.g. libmpfr libgmp etc.
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
X-List-Received-Date: Tue, 08 Mar 2011 06:40:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

ping any opinion on this patch ?

On Wed, Mar 2, 2011 at 10:52 PM, Khem Raj <raj.khem@gmail.com> wrote:
> * This is helpful to get consistent behaviour with gcc on different
> =C2=A0hosts and linking the libraries in for cross gcc recipes should not
> =C2=A0be increasing the binary size alarmingly
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0meta/recipes-devtools/gcc/gcc-configure-common.inc | =C2=A0 =C2=A07=
 +++++++
> =C2=A0meta/recipes-devtools/gcc/gcc-configure-cross.inc =C2=A0| =C2=A0 10=
 ++++++++++
> =C2=A0meta/recipes-devtools/gcc/gcc-configure-sdk.inc =C2=A0 =C2=A0| =C2=
=A0 =C2=A08 ++++++++
> =C2=A0.../gcc/gcc-cross-canadian_4.3.3.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0.../gcc/gcc-cross-canadian_4.5.1.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0.../gcc/gcc-cross-initial_4.3.3.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A0.../gcc/gcc-cross-initial_4.5.1.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A0.../gcc/gcc-cross-intermediate_4.3.3.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0.../gcc/gcc-cross-intermediate_4.5.1.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0.../gcc/gcc-cross-kernel-3.4.4_csl-arm-2005q3.bb =C2=A0 | =C2=A0 =
=C2=A02 +-
> =C2=A0meta/recipes-devtools/gcc/gcc-cross_4.3.3.bb =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 =C2=A02 +-
> =C2=A0meta/recipes-devtools/gcc/gcc-cross_4.5.1.bb =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 =C2=A02 +-
> =C2=A0.../gcc/gcc-cross_csl-arm-2008q1.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0.../gcc/gcc-crosssdk-initial_4.3.3.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0.../gcc/gcc-crosssdk-initial_4.5.1.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0.../gcc/gcc-crosssdk-intermediate_4.3.3.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A02 +-
> =C2=A0.../gcc/gcc-crosssdk-intermediate_4.5.1.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A02 +-
> =C2=A0meta/recipes-devtools/gcc/gcc-crosssdk_4.5.1.bb =C2=A0 =C2=A0| =C2=
=A0 =C2=A02 +-
> =C2=A0meta/recipes-devtools/gcc/gcc-runtime_4.3.3.bb =C2=A0 =C2=A0 | =C2=
=A0 =C2=A02 +-
> =C2=A0meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb =C2=A0 =C2=A0 | =C2=
=A0 =C2=A02 +-
> =C2=A0meta/recipes-devtools/gcc/gcc_4.3.3.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A0meta/recipes-devtools/gcc/gcc_4.5.1.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A0meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb =C2=A0 =C2=A0| =C2=
=A0 =C2=A02 +-
> =C2=A0meta/recipes-devtools/gcc/libgcc_4.5.1.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A024 files changed, 46 insertions(+), 21 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/re=
cipes-devtools/gcc/gcc-configure-common.inc
> index 4393777..cdb69fb 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> @@ -85,6 +85,11 @@ do_configure () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0export CXXFLAGS_FOR_BUILD=3D"${BUILD_CXXFLAGS}=
"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0export LDFLAGS_FOR_BUILD=3D"${BUILD_LDFLAGS}"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0export ARCH_FLAGS_FOR_TARGET=3D"${ARCH_FLAGS_F=
OR_TARGET}"
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0# Make sure LDFLAGS are honored.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i 's/^LDFLAGS =3D $/LDFLAGS =3D @LDFLAG=
S@/' ${S}/Makefile.in
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i 's/^LDFLAGS =3D $/LDFLAGS =3D @LDFLAG=
S@/' ${S}/Makefile.tpl
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0(cd ${S} && gnu-configize) || die "failure run=
ning gnu-configize"
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# teach gcc to find correct target includedir =
when checking libc ssp support
> @@ -108,5 +113,7 @@ do_configure () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0echo "#endif /* ! GCC_DEFAULTS_H */" >> ${S}/g=
cc/defaults.h.new
> =C2=A0 =C2=A0 =C2=A0 =C2=A0mv ${S}/gcc/defaults.h.new ${S}/gcc/defaults.h
> =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runconf
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0# make sure that no @LDFLAG@ is left in the =
generated Makefile
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i "s/@LDFLAGS@//g" ${B}/Makefile
> =C2=A0}
>
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-cross.inc b/meta/rec=
ipes-devtools/gcc/gcc-configure-cross.inc
> index 346d164..200cbe2 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-cross.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-cross.inc
> @@ -16,6 +16,16 @@ do_compile_prepend () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0export LD_FOR_TARGET=3D"${TARGET_SYS}-ld"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0export NM_FOR_TARGET=3D"${TARGET_SYS}-nm"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0export CC_FOR_TARGET=3D"${CCACHE} ${TARGET_SYS=
}-gcc ${TARGET_CC_ARCH}"
> + =C2=A0 =C2=A0 =C2=A0 export OBJDUMP_FOR_TARGET=3D"${TARGET_SYS}-objdump=
"
> + =C2=A0 =C2=A0 =C2=A0 export OBJCOPY_FOR_TARGET=3D"${TARGET_SYS}-objcopy=
"
> + =C2=A0 =C2=A0 =C2=A0 export STRIP_FOR_TARGET=3D"${TARGET_SYS}-strip"
> + =C2=A0 =C2=A0 =C2=A0 # Make sure we use GMP/MPFR statically
> + =C2=A0 =C2=A0 =C2=A0 sed -i 's/^\(HOST_GMPLIBS =3D\) \(.*\)$/\1 -Wl,-Bs=
tatic \2 -Wl,-Bdynamic/' ${S}/Makefile.tpl
> + =C2=A0 =C2=A0 =C2=A0 sed -i 's/^\(HOST_GMPLIBS =3D\) \(.*\)$/\1 -Wl,-Bs=
tatic \2 -Wl,-Bdynamic/' ${S}/Makefile.in
> + =C2=A0 =C2=A0 =C2=A0 sed -i 's/^\(HOST_PPLLIBS =3D\) \(.*\)$/\1 -Wl,-Bs=
tatic \2 -Wl,-Bdynamic/' ${S}/Makefile.tpl
> + =C2=A0 =C2=A0 =C2=A0 sed -i 's/^\(HOST_PPLLIBS =3D\) \(.*\)$/\1 -Wl,-Bs=
tatic \2 -Wl,-Bdynamic/' ${S}/Makefile.in
> + =C2=A0 =C2=A0 =C2=A0 sed -i 's/^\(HOST_LIBELFLIBS =3D\) \(.*\)$/\1 -Wl,=
-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.tpl
> + =C2=A0 =C2=A0 =C2=A0 sed -i 's/^\(HOST_LIBELFLIBS =3D\) \(.*\)$/\1 -Wl,=
-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.in
> =C2=A0}
>
> =C2=A0LIBGCCS_VAR =3D "-lgcc_s"
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc b/meta/recip=
es-devtools/gcc/gcc-configure-sdk.inc
> index 756e74e..3eb8992 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
> @@ -39,6 +39,14 @@ do_configure () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0export CPPFLAGS_FOR_BUILD=3D"${BUILD_CPPFLAGS}=
"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0export CXXFLAGS_FOR_BUILD=3D"${BUILD_CXXFLAGS}=
"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0export LDFLAGS_FOR_BUILD=3D"${BUILD_LDFLAGS}"
> + =C2=A0 =C2=A0 =C2=A0 export CC_FOR_TARGET=3D"${CCACHE} ${TARGET_SYS}-gc=
c ${TARGET_CC_ARCH}"
> + =C2=A0 =C2=A0 =C2=A0 # Make sure we use GMP/MPFR statically
> + =C2=A0 =C2=A0 =C2=A0 sed -i 's/^\(HOST_GMPLIBS =3D\) \(.*\)$/\1 -Wl,-Bs=
tatic \2 -Wl,-Bdynamic/' ${S}/Makefile.tpl
> + =C2=A0 =C2=A0 =C2=A0 sed -i 's/^\(HOST_GMPLIBS =3D\) \(.*\)$/\1 -Wl,-Bs=
tatic \2 -Wl,-Bdynamic/' ${S}/Makefile.in
> + =C2=A0 =C2=A0 =C2=A0 sed -i 's/^\(HOST_PPLLIBS =3D\) \(.*\)$/\1 -Wl,-Bs=
tatic \2 -Wl,-Bdynamic/' ${S}/Makefile.tpl
> + =C2=A0 =C2=A0 =C2=A0 sed -i 's/^\(HOST_PPLLIBS =3D\) \(.*\)$/\1 -Wl,-Bs=
tatic \2 -Wl,-Bdynamic/' ${S}/Makefile.in
> + =C2=A0 =C2=A0 =C2=A0 sed -i 's/^\(HOST_LIBELFLIBS =3D\) \(.*\)$/\1 -Wl,=
-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.tpl
> + =C2=A0 =C2=A0 =C2=A0 sed -i 's/^\(HOST_LIBELFLIBS =3D\) \(.*\)$/\1 -Wl,=
-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.in
> =C2=A0 =C2=A0 =C2=A0 =C2=A0(cd ${S} && gnu-configize) || die "failure run=
ning gnu-configize"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runconf
> =C2=A0}
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.3.3.bb b/meta=
/recipes-devtools/gcc/gcc-cross-canadian_4.3.3.bb
> index d420f80..8bf07d7 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.3.3.bb
> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.3.3.bb
> @@ -5,7 +5,7 @@ require gcc-cross-canadian.inc
> =C2=A0require gcc-configure-sdk.inc
> =C2=A0require gcc-package-sdk.inc
>
> -PR =3D "r20"
> +PR =3D "r21"
>
> =C2=A0DEPENDS +=3D "gmp-nativesdk mpfr-nativesdk"
> =C2=A0RDEPENDS_${PN} +=3D "mpfr-nativesdk"
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.5.1.bb b/meta=
/recipes-devtools/gcc/gcc-cross-canadian_4.5.1.bb
> index 3eea4bc..92708d4 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.5.1.bb
> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.5.1.bb
> @@ -5,7 +5,7 @@ require gcc-cross-canadian.inc
> =C2=A0require gcc-configure-sdk.inc
> =C2=A0require gcc-package-sdk.inc
>
> -PR =3D "r3"
> +PR =3D "r4"
>
> =C2=A0DEPENDS +=3D "gmp-nativesdk mpfr-nativesdk libmpc-nativesdk elfutil=
s-nativesdk"
> =C2=A0RDEPENDS_${PN} +=3D "mpfr-nativesdk libmpc-nativesdk elfutils-nativ=
esdk"
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial_4.3.3.bb b/meta/=
recipes-devtools/gcc/gcc-cross-initial_4.3.3.bb
> index 28ac1ab..ef52845 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-initial_4.3.3.bb
> +++ b/meta/recipes-devtools/gcc/gcc-cross-initial_4.3.3.bb
> @@ -1,5 +1,5 @@
> =C2=A0require gcc-cross_${PV}.bb
> =C2=A0require gcc-cross-initial.inc
>
> -PR =3D "r5"
> +PR =3D "r6"
>
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial_4.5.1.bb b/meta/=
recipes-devtools/gcc/gcc-cross-initial_4.5.1.bb
> index b2c257d..38e0964 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-initial_4.5.1.bb
> +++ b/meta/recipes-devtools/gcc/gcc-cross-initial_4.5.1.bb
> @@ -1,5 +1,5 @@
> =C2=A0require gcc-cross_${PV}.bb
> =C2=A0require gcc-cross-initial.inc
>
> -PR =3D "r2"
> +PR =3D "r3"
>
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-intermediate_4.3.3.bb b/=
meta/recipes-devtools/gcc/gcc-cross-intermediate_4.3.3.bb
> index a8473b0..deeee37 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-intermediate_4.3.3.bb
> +++ b/meta/recipes-devtools/gcc/gcc-cross-intermediate_4.3.3.bb
> @@ -1,4 +1,4 @@
> =C2=A0require gcc-cross_${PV}.bb
> =C2=A0require gcc-cross-intermediate.inc
> -PR =3D "r5"
> +PR =3D "r6"
>
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-intermediate_4.5.1.bb b/=
meta/recipes-devtools/gcc/gcc-cross-intermediate_4.5.1.bb
> index e65d5df..9a30cb5 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-intermediate_4.5.1.bb
> +++ b/meta/recipes-devtools/gcc/gcc-cross-intermediate_4.5.1.bb
> @@ -1,4 +1,4 @@
> =C2=A0require gcc-cross_${PV}.bb
> =C2=A0require gcc-cross-intermediate.inc
> -PR =3D "r3"
> +PR =3D "r4"
>
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-kernel-3.4.4_csl-arm-200=
5q3.bb b/meta/recipes-devtools/gcc/gcc-cross-kernel-3.4.4_csl-arm-2005q3.bb
> index 88e3842..462104f 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-kernel-3.4.4_csl-arm-2005q3.bb
> +++ b/meta/recipes-devtools/gcc/gcc-cross-kernel-3.4.4_csl-arm-2005q3.bb
> @@ -9,7 +9,7 @@ require gcc-cross-kernel.inc
>
> =C2=A0DEFAULT_PREFERENCE =3D "-1"
>
> -PR =3D "r4"
> +PR =3D "r5"
>
> =C2=A0SRC_URI +=3D "file://gcc-3.4.4-makefile-fix.patch;patch=3D1"
>
> diff --git a/meta/recipes-devtools/gcc/gcc-cross_4.3.3.bb b/meta/recipes-=
devtools/gcc/gcc-cross_4.3.3.bb
> index 5eaac5f..1a982f5 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross_4.3.3.bb
> +++ b/meta/recipes-devtools/gcc/gcc-cross_4.3.3.bb
> @@ -1,4 +1,4 @@
> -PR =3D "r17"
> +PR =3D "r18"
>
> =C2=A0require gcc-${PV}.inc
> =C2=A0require gcc-cross4.inc
> diff --git a/meta/recipes-devtools/gcc/gcc-cross_4.5.1.bb b/meta/recipes-=
devtools/gcc/gcc-cross_4.5.1.bb
> index 399cdf9..78bb05a 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross_4.5.1.bb
> +++ b/meta/recipes-devtools/gcc/gcc-cross_4.5.1.bb
> @@ -1,4 +1,4 @@
> -PR =3D "r2"
> +PR =3D "r3"
>
> =C2=A0require gcc-${PV}.inc
> =C2=A0require gcc-cross4.inc
> diff --git a/meta/recipes-devtools/gcc/gcc-cross_csl-arm-2008q1.bb b/meta=
/recipes-devtools/gcc/gcc-cross_csl-arm-2008q1.bb
> index 89534f1..0e7a1ee 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross_csl-arm-2008q1.bb
> +++ b/meta/recipes-devtools/gcc/gcc-cross_csl-arm-2008q1.bb
> @@ -1,4 +1,4 @@
> -PR =3D "r5"
> +PR =3D "r6"
>
> =C2=A0require gcc-csl-arm-2008q1.inc
> =C2=A0require gcc-cross4.inc
> diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.3.3.bb b/me=
ta/recipes-devtools/gcc/gcc-crosssdk-initial_4.3.3.bb
> index b42de47..d3ddcb1 100644
> --- a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.3.3.bb
> +++ b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.3.3.bb
> @@ -1,3 +1,3 @@
> =C2=A0require gcc-cross-initial_${PV}.bb
> =C2=A0require gcc-crosssdk-initial.inc
> -PR =3D "r6"
> +PR =3D "r7"
> diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.5.1.bb b/me=
ta/recipes-devtools/gcc/gcc-crosssdk-initial_4.5.1.bb
> index 240caf5..fec53b9 100644
> --- a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.5.1.bb
> +++ b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.5.1.bb
> @@ -1,4 +1,4 @@
> =C2=A0require gcc-cross-initial_${PV}.bb
> =C2=A0require gcc-crosssdk-initial.inc
>
> -PR =3D "r2"
> +PR =3D "r3"
> diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.3.3.bb=
 b/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.3.3.bb
> index cd1f966..2be05f1 100644
> --- a/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.3.3.bb
> +++ b/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.3.3.bb
> @@ -1,3 +1,3 @@
> =C2=A0require gcc-cross-intermediate_${PV}.bb
> =C2=A0require gcc-crosssdk-intermediate.inc
> -PR =3D "r8"
> +PR =3D "r9"
> diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.1.bb=
 b/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.1.bb
> index a6653dd..161d870 100644
> --- a/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.1.bb
> +++ b/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.1.bb
> @@ -1,4 +1,4 @@
> =C2=A0require gcc-cross-intermediate_${PV}.bb
> =C2=A0require gcc-crosssdk-intermediate.inc
>
> -PR =3D "r2"
> +PR =3D "r3"
> diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_4.5.1.bb b/meta/recip=
es-devtools/gcc/gcc-crosssdk_4.5.1.bb
> index 129e8d3..7069088 100644
> --- a/meta/recipes-devtools/gcc/gcc-crosssdk_4.5.1.bb
> +++ b/meta/recipes-devtools/gcc/gcc-crosssdk_4.5.1.bb
> @@ -1,4 +1,4 @@
> =C2=A0require gcc-cross_${PV}.bb
> =C2=A0require gcc-crosssdk.inc
>
> -PR =3D "r2"
> +PR =3D "r3"
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime_4.3.3.bb b/meta/recipe=
s-devtools/gcc/gcc-runtime_4.3.3.bb
> index 99f927a..2f5cfb5 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime_4.3.3.bb
> +++ b/meta/recipes-devtools/gcc/gcc-runtime_4.3.3.bb
> @@ -1,4 +1,4 @@
> -PR =3D "r18"
> +PR =3D "r19"
>
> =C2=A0require gcc-${PV}.inc
> =C2=A0require gcc-configure-runtime.inc
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb b/meta/recipe=
s-devtools/gcc/gcc-runtime_4.5.1.bb
> index 093f9bf..c1e680d 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb
> +++ b/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb
> @@ -1,4 +1,4 @@
> -PR =3D "r2"
> +PR =3D "r3"
>
> =C2=A0require gcc-${PV}.inc
> =C2=A0require gcc-configure-runtime.inc
> diff --git a/meta/recipes-devtools/gcc/gcc_4.3.3.bb b/meta/recipes-devtoo=
ls/gcc/gcc_4.3.3.bb
> index f0471d4..ba6e7b2 100644
> --- a/meta/recipes-devtools/gcc/gcc_4.3.3.bb
> +++ b/meta/recipes-devtools/gcc/gcc_4.3.3.bb
> @@ -1,4 +1,4 @@
> -PR =3D "r11"
> +PR =3D "r12"
>
> =C2=A0require gcc-${PV}.inc
> =C2=A0require gcc-configure-target.inc
> diff --git a/meta/recipes-devtools/gcc/gcc_4.5.1.bb b/meta/recipes-devtoo=
ls/gcc/gcc_4.5.1.bb
> index 919d4b0..25e455c 100644
> --- a/meta/recipes-devtools/gcc/gcc_4.5.1.bb
> +++ b/meta/recipes-devtools/gcc/gcc_4.5.1.bb
> @@ -1,4 +1,4 @@
> -PR =3D "r2"
> +PR =3D "r3"
> =C2=A0require gcc-${PV}.inc
> =C2=A0require gcc-configure-target.inc
> =C2=A0require gcc-package-target.inc
> diff --git a/meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb b/meta/recip=
es-devtools/gcc/gcc_csl-arm-2008q1.bb
> index cc7540a..2df12ef 100644
> --- a/meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb
> +++ b/meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb
> @@ -1,4 +1,4 @@
> -PR =3D "r3"
> +PR =3D "r4"
>
> =C2=A0require gcc-${PV}.inc
> =C2=A0require gcc-configure-target.inc
> diff --git a/meta/recipes-devtools/gcc/libgcc_4.5.1.bb b/meta/recipes-dev=
tools/gcc/libgcc_4.5.1.bb
> index b6cf268..3f7ce0a 100644
> --- a/meta/recipes-devtools/gcc/libgcc_4.5.1.bb
> +++ b/meta/recipes-devtools/gcc/libgcc_4.5.1.bb
> @@ -1,6 +1,6 @@
> =C2=A0require gcc-${PV}.inc
>
> -PR =3D "r0"
> +PR =3D "r1"
>
> =C2=A0INHIBIT_DEFAULT_DEPS =3D "1"
> =C2=A0DEPENDS =3D "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g+=
+"
> --
> 1.7.4.1
>
>


