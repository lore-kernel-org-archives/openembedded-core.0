Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id BD2FD607AC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2018 13:41:27 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id c16-v6so1433348qtj.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2018 06:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IlGRvM58IOAyNXfSzlIB2c6rD5RN+ErbFYlTdjtcPJQ=;
	b=rLyMAs8eCJS0G/WoiP9C9S25qAhMVAJod/aAPILXC4CFASJ6iDY1nqz7om2xvSmJU9
	h506iw3vx4HPVCCGwLxk4mWsNlAVlslougXK1cYGTrg0ETpe9Sc4d7p192b663ZSorQV
	7HcTIqryRe9ItruULGuJyknA/eAgL8PpoVd8SAHipNqy1cxW6Lv6MYXZuABTntm+aHQM
	1hDbJR4y77n6JLcV89kaS5scvx1pM3P6sce7Y5dpCdEJjgd6M4IO4YPrum9UIQIMkFbJ
	QNrKbfa5pyLJq89ndshZeNOJ5IlzLTnGVgyea+z106oggiLwN/ekOSdZpRYg6jOsoJ32
	iQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IlGRvM58IOAyNXfSzlIB2c6rD5RN+ErbFYlTdjtcPJQ=;
	b=pR4EtpcaFIypGDaBt32NYaAcP2bVtxEAXP21MTvqex3SFwSJKm41vAYRtiPBhpCbd7
	akbYbLshZgvZMSMMAgSAX/hRmxS4oZWT6DI/gmtxVNBTct2hWLlZsgA+sl33K4t7APJc
	+eJMgtDM0C7lE+TyswIyPMx9ALoYoYUdgi9ia+azIB3K4M5sgC7jqMN/eoNF3TqAqdko
	y2YkrS/oOPt+NrAW2dzvUdWSNJyjVwY2gStb5+FBiPbk7FYsHvVgN2Xg5RmEhpSobjrM
	qtGvaUPoWKLFRUvy0Omsw7Kp4Hh2YRUDY9IEh4QEgp1z4YxpuLUnkitbv3K+VmUtBQOU
	YqaA==
X-Gm-Message-State: AGRZ1gJ1CPTkyjMUn8mMv4SRM+wPhwDk+yX3PP0H7t/LM0D68VETE4jE
	YIV8ZfaH6KQYr0XZFRObBlv/sTJAgO8I2itGUmc=
X-Google-Smtp-Source: AJdET5euZRiNwf/S4hm9TB0OBzwAxIwnDKOwAAHrVxcMa9KZ+ucyt2eWbCqr5sDbOa94yh472FLDajiOeS3FV0zFOjE=
X-Received: by 2002:ac8:3693:: with SMTP id
	a19-v6mr1072104qtc.236.1540302088057; 
	Tue, 23 Oct 2018 06:41:28 -0700 (PDT)
MIME-Version: 1.0
References: <1540217112-24479-1-git-send-email-akuster808@gmail.com>
	<1540217112-24479-3-git-send-email-akuster808@gmail.com>
In-Reply-To: <1540217112-24479-3-git-send-email-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Oct 2018 14:41:16 +0100
Message-ID: <CAMKF1sruLOUe-ThtUckokdKZZyNrx7JXWTqoeiDoRp_iM6c99w@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/13] nspr: Update to 4.20
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
X-List-Received-Date: Tue, 23 Oct 2018 13:41:28 -0000
Content-Type: multipart/alternative; boundary="000000000000ce36bd0578e586dd"

--000000000000ce36bd0578e586dd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 22, 2018 at 3:06 PM Armin Kuster <akuster808@gmail.com> wrote:

> RISC-v support now included in this release so drop patch.
> and refresh patches


That=E2=80=99s right thanks for update

>
>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  .../nspr/nspr/0002-Add-nios2-support.patch         |  25 ++--
>  ...e-definitions-for-the-RISC-V-architecture.patch | 150
> ---------------------
>  .../nspr/nspr/remove-rpath-from-tests.patch        |   2 +-
>  .../nspr/{nspr_4.19.bb =3D> nspr_4.20.bb}            |   5 +-
>  4 files changed, 14 insertions(+), 168 deletions(-)
>  delete mode 100644
> meta/recipes-support/nspr/nspr/0003-Add-type-definitions-for-the-RISC-V-a=
rchitecture.patch
>  rename meta/recipes-support/nspr/{nspr_4.19.bb =3D> nspr_4.20.bb} (95%)
>
> diff --git a/meta/recipes-support/nspr/nspr/0002-Add-nios2-support.patch
> b/meta/recipes-support/nspr/nspr/0002-Add-nios2-support.patch
> index 2322806..3a04d42 100644
> --- a/meta/recipes-support/nspr/nspr/0002-Add-nios2-support.patch
> +++ b/meta/recipes-support/nspr/nspr/0002-Add-nios2-support.patch
> @@ -12,11 +12,11 @@ Upstream-Status: Submitted [
> https://bugzilla.mozilla.org/show_bug.cgi?id=3D124442
>   nspr/pr/include/md/_linux.h   | 14 ++++++++++++++
>   2 files changed, 59 insertions(+)
>
> -diff --git a/pr/include/md/_linux.cfg b/nspr/pr/include/md/_linux.cfg
> -index 8cbf0cb..150676b 100644
> ---- a/pr/include/md/_linux.cfg
> -+++ b/pr/include/md/_linux.cfg
> -@@ -972,6 +972,51 @@
> +Index: nspr/pr/include/md/_linux.cfg
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- nspr.orig/pr/include/md/_linux.cfg
> ++++ nspr/pr/include/md/_linux.cfg
> +@@ -975,6 +975,51 @@
>   #define PR_BYTES_PER_WORD_LOG2   2
>   #define PR_BYTES_PER_DWORD_LOG2  3
>
> @@ -68,10 +68,10 @@ index 8cbf0cb..150676b 100644
>   #elif defined(__or1k__)
>
>   #undef  IS_LITTLE_ENDIAN
> -diff --git a/pr/include/md/_linux.h b/nspr/pr/include/md/_linux.h
> -index d378db5..18260be 100644
> ---- a/pr/include/md/_linux.h
> -+++ b/pr/include/md/_linux.h
> +Index: nspr/pr/include/md/_linux.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- nspr.orig/pr/include/md/_linux.h
> ++++ nspr/pr/include/md/_linux.h
>  @@ -55,6 +55,8 @@
>   #define _PR_SI_ARCHITECTURE "avr32"
>   #elif defined(__m32r__)
> @@ -80,8 +80,8 @@ index d378db5..18260be 100644
>  +#define _PR_SI_ARCHITECTURE "nios2"
>   #elif defined(__or1k__)
>   #define _PR_SI_ARCHITECTURE "or1k"
> - #else
> -@@ -125,6 +127,18 @@ extern PRInt32 _PR_x86_64_AtomicSet(PRInt32 *val,
> PRInt32 newval);
> + #elif defined(__riscv) && (__riscv_xlen =3D=3D 32)
> +@@ -129,6 +131,18 @@ extern PRInt32 _PR_x86_64_AtomicSet(PRIn
>   #define _MD_ATOMIC_SET                _PR_x86_64_AtomicSet
>   #endif
>
> @@ -100,6 +100,3 @@ index d378db5..18260be 100644
>   #if defined(__or1k__)
>   #if defined(__GNUC__)
>   /* Use GCC built-in functions */
> ---
> -2.7.0.rc3
> -
> diff --git
> a/meta/recipes-support/nspr/nspr/0003-Add-type-definitions-for-the-RISC-V=
-architecture.patch
> b/meta/recipes-support/nspr/nspr/0003-Add-type-definitions-for-the-RISC-V=
-architecture.patch
> deleted file mode 100644
> index 47e1475..0000000
> ---
> a/meta/recipes-support/nspr/nspr/0003-Add-type-definitions-for-the-RISC-V=
-architecture.patch
> +++ /dev/null
> @@ -1,150 +0,0 @@
> -# HG changeset patch
> -# User Karsten Merker <merker@debian.org>
> -# Date 1523974333 -7200
> -# Node ID f47871e2aeb16b39d4f516690e25c81b04d6d05a
> -# Parent  776db96f834cb86e8863052201d55f60a2da91cb
> -Bug 1308584, Add type definitions for the RISC-V architecture, r=3Dkaie
> -
> -Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> -[ Changes by AF:
> - - Rebase on other Yocto patches
> -]
> -Upstream-Status: Backport [
> https://hg.mozilla.org/projects/nspr/rev/f47871e2aeb1 ]
> -
> -diff --git a/pr/include/md/_linux.cfg b/pr/include/md/_linux.cfg
> ---- a/pr/include/md/_linux.cfg
> -+++ b/pr/include/md/_linux.cfg
> -@@ -1015,16 +1015,108 @@
> - #define PR_ALIGN_OF_FLOAT   4
> - #define PR_ALIGN_OF_DOUBLE  4
> - #define PR_ALIGN_OF_POINTER 4
> - #define PR_ALIGN_OF_WORD    4
> -
> - #define PR_BYTES_PER_WORD_LOG2   2
> - #define PR_BYTES_PER_DWORD_LOG2  3
> -
> -+#elif defined(__riscv) && (__riscv_xlen =3D=3D 32)
> -+
> -+#undef  IS_BIG_ENDIAN
> -+#define IS_LITTLE_ENDIAN 1
> -+#undef  IS_64
> -+
> -+#define PR_BYTES_PER_BYTE   1
> -+#define PR_BYTES_PER_SHORT  2
> -+#define PR_BYTES_PER_INT    4
> -+#define PR_BYTES_PER_INT64  8
> -+#define PR_BYTES_PER_LONG   4
> -+#define PR_BYTES_PER_FLOAT  4
> -+#define PR_BYTES_PER_DOUBLE 8
> -+#define PR_BYTES_PER_WORD   4
> -+#define PR_BYTES_PER_DWORD  8
> -+
> -+#define PR_BITS_PER_BYTE    8
> -+#define PR_BITS_PER_SHORT   16
> -+#define PR_BITS_PER_INT     32
> -+#define PR_BITS_PER_INT64   64
> -+#define PR_BITS_PER_LONG    32
> -+#define PR_BITS_PER_FLOAT   32
> -+#define PR_BITS_PER_DOUBLE  64
> -+#define PR_BITS_PER_WORD    32
> -+
> -+#define PR_BITS_PER_BYTE_LOG2   3
> -+#define PR_BITS_PER_SHORT_LOG2  4
> -+#define PR_BITS_PER_INT_LOG2    5
> -+#define PR_BITS_PER_INT64_LOG2  6
> -+#define PR_BITS_PER_LONG_LOG2   5
> -+#define PR_BITS_PER_FLOAT_LOG2  5
> -+#define PR_BITS_PER_DOUBLE_LOG2 6
> -+#define PR_BITS_PER_WORD_LOG2   5
> -+
> -+#define PR_ALIGN_OF_SHORT   2
> -+#define PR_ALIGN_OF_INT     4
> -+#define PR_ALIGN_OF_LONG    4
> -+#define PR_ALIGN_OF_INT64   8
> -+#define PR_ALIGN_OF_FLOAT   4
> -+#define PR_ALIGN_OF_DOUBLE  8
> -+#define PR_ALIGN_OF_POINTER 4
> -+#define PR_ALIGN_OF_WORD    4
> -+
> -+#define PR_BYTES_PER_WORD_LOG2  2
> -+#define PR_BYTES_PER_DWORD_LOG2 3
> -+
> -+#elif defined(__riscv) && (__riscv_xlen =3D=3D 64)
> -+
> -+#undef  IS_BIG_ENDIAN
> -+#define IS_LITTLE_ENDIAN 1
> -+#define IS_64
> -+
> -+#define PR_BYTES_PER_BYTE   1
> -+#define PR_BYTES_PER_SHORT  2
> -+#define PR_BYTES_PER_INT    4
> -+#define PR_BYTES_PER_INT64  8
> -+#define PR_BYTES_PER_LONG   8
> -+#define PR_BYTES_PER_FLOAT  4
> -+#define PR_BYTES_PER_DOUBLE 8
> -+#define PR_BYTES_PER_WORD   8
> -+#define PR_BYTES_PER_DWORD  8
> -+
> -+#define PR_BITS_PER_BYTE    8
> -+#define PR_BITS_PER_SHORT   16
> -+#define PR_BITS_PER_INT     32
> -+#define PR_BITS_PER_INT64   64
> -+#define PR_BITS_PER_LONG    64
> -+#define PR_BITS_PER_FLOAT   32
> -+#define PR_BITS_PER_DOUBLE  64
> -+#define PR_BITS_PER_WORD    64
> -+
> -+#define PR_BITS_PER_BYTE_LOG2   3
> -+#define PR_BITS_PER_SHORT_LOG2  4
> -+#define PR_BITS_PER_INT_LOG2    5
> -+#define PR_BITS_PER_INT64_LOG2  6
> -+#define PR_BITS_PER_LONG_LOG2   6
> -+#define PR_BITS_PER_FLOAT_LOG2  5
> -+#define PR_BITS_PER_DOUBLE_LOG2 6
> -+#define PR_BITS_PER_WORD_LOG2   6
> -+
> -+#define PR_ALIGN_OF_SHORT   2
> -+#define PR_ALIGN_OF_INT     4
> -+#define PR_ALIGN_OF_LONG    8
> -+#define PR_ALIGN_OF_INT64   8
> -+#define PR_ALIGN_OF_FLOAT   4
> -+#define PR_ALIGN_OF_DOUBLE  8
> -+#define PR_ALIGN_OF_POINTER 8
> -+#define PR_ALIGN_OF_WORD    8
> -+
> -+#define PR_BYTES_PER_WORD_LOG2  3
> -+#define PR_BYTES_PER_DWORD_LOG2 3
> -+
> - #else
> -
> - #error "Unknown CPU architecture"
> -
> - #endif
> -
> - #ifndef HAVE_LONG_LONG
> - #define       HAVE_LONG_LONG
> -diff --git a/pr/include/md/_linux.h b/pr/include/md/_linux.h
> ---- a/pr/include/md/_linux.h
> -+++ b/pr/include/md/_linux.h
> -@@ -54,16 +54,20 @@
> - #elif defined(__avr32__)
> - #define _PR_SI_ARCHITECTURE "avr32"
> - #elif defined(__m32r__)
> - #define _PR_SI_ARCHITECTURE "m32r"
> - #elif defined(__nios2__)
> - #define _PR_SI_ARCHITECTURE "nios2"
> - #elif defined(__or1k__)
> - #define _PR_SI_ARCHITECTURE "or1k"
> -+#elif defined(__riscv) && (__riscv_xlen =3D=3D 32)
> -+#define _PR_SI_ARCHITECTURE "riscv32"
> -+#elif defined(__riscv) && (__riscv_xlen =3D=3D 64)
> -+#define _PR_SI_ARCHITECTURE "riscv64"
> - #else
> - #error "Unknown CPU architecture"
> - #endif
> - #define PR_DLL_SUFFIX         ".so"
> -
> - #define _PR_VMBASE              0x30000000
> - #define _PR_STACK_VMBASE      0x50000000
> - #define _MD_DEFAULT_STACK_SIZE        65536L
> -
> diff --git a/meta/recipes-support/nspr/nspr/remove-rpath-from-tests.patch
> b/meta/recipes-support/nspr/nspr/remove-rpath-from-tests.patch
> index ecc6d31..7ba59ed 100644
> --- a/meta/recipes-support/nspr/nspr/remove-rpath-from-tests.patch
> +++ b/meta/recipes-support/nspr/nspr/remove-rpath-from-tests.patch
> @@ -15,7 +15,7 @@ Index: nspr/pr/tests/Makefile.in
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  --- nspr.orig/pr/tests/Makefile.in
>  +++ nspr/pr/tests/Makefile.in
> -@@ -315,7 +315,7 @@ ifeq ($(OS_ARCH), SunOS)
> +@@ -316,7 +316,7 @@ ifeq ($(OS_ARCH), SunOS)
>   endif # SunOS
>
>   ifeq (,$(filter-out Linux GNU GNU_%,$(OS_ARCH)))
> diff --git a/meta/recipes-support/nspr/nspr_4.19.bb
> b/meta/recipes-support/nspr/nspr_4.20.bb
> similarity index 95%
> rename from meta/recipes-support/nspr/nspr_4.19.bb
> rename to meta/recipes-support/nspr/nspr_4.20.bb
> index 0212be7..fe3b4bd 100644
> --- a/meta/recipes-support/nspr/nspr_4.19.bb
> +++ b/meta/recipes-support/nspr/nspr_4.20.bb
> @@ -11,7 +11,6 @@ SRC_URI =3D "
> http://ftp.mozilla.org/pub/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz
>             file://remove-srcdir-from-configure-in.patch \
>             file://0002-Add-nios2-support.patch \
>             file://0001-md-Fix-build-with-musl.patch \
> -
>  file://0003-Add-type-definitions-for-the-RISC-V-architecture.patch \
>             file://0004-Add-ARC-support.patch \
>             file://nspr.pc.in \
>  "
> @@ -24,8 +23,8 @@ CACHED_CONFIGUREVARS_append_libc-musl =3D "
> CFLAGS=3D'${CFLAGS} -D_PR_POLL_AVAILABLE
>  UPSTREAM_CHECK_URI =3D "http://ftp.mozilla.org/pub/nspr/releases/"
>  UPSTREAM_CHECK_REGEX =3D "v(?P<pver>\d+(\.\d+)+)/"
>
> -SRC_URI[md5sum] =3D "e1d27282ad6286b69d6b9fd07201d3dd"
> -SRC_URI[sha256sum] =3D
> "2ed95917fa2277910d1d1cf36030607dccc0ba522bba08e2af13c113dcd8f729"
> +SRC_URI[md5sum] =3D "1c198c7e73f6b0e2bb9153a644ba246b"
> +SRC_URI[sha256sum] =3D
> "2c8964913da89ffbaf464d49ce44d79e8804e1794ef9a8c52a7bff7224d1556e"
>
>  CVE_PRODUCT =3D "netscape_portable_runtime"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000ce36bd0578e586dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon,=
 Oct 22, 2018 at 3:06 PM Armin Kuster &lt;<a href=3D"mailto:akuster808@gmai=
l.com">akuster808@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">RISC-v support now included in this release so drop patch.<br>
and refresh patches</blockquote><div dir=3D"auto"><br></div><div dir=3D"aut=
o">That=E2=80=99s right thanks for update=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><br>
<br>
Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com" targe=
t=3D"_blank">akuster@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../nspr/nspr/0002-Add-nios2-support.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 25 ++--<br>
=C2=A0...e-definitions-for-the-RISC-V-architecture.patch | 150 ------------=
---------<br>
=C2=A0.../nspr/nspr/remove-rpath-from-tests.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../nspr/{<a href=3D"http://nspr_4.19.bb" rel=3D"noreferrer" target=
=3D"_blank">nspr_4.19.bb</a> =3D&gt; <a href=3D"http://nspr_4.20.bb" rel=3D=
"noreferrer" target=3D"_blank">nspr_4.20.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 +-<br>
=C2=A04 files changed, 14 insertions(+), 168 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-support/nspr/nspr/0003-Add-type-defin=
itions-for-the-RISC-V-architecture.patch<br>
=C2=A0rename meta/recipes-support/nspr/{<a href=3D"http://nspr_4.19.bb" rel=
=3D"noreferrer" target=3D"_blank">nspr_4.19.bb</a> =3D&gt; <a href=3D"http:=
//nspr_4.20.bb" rel=3D"noreferrer" target=3D"_blank">nspr_4.20.bb</a>} (95%=
)<br>
<br>
diff --git a/meta/recipes-support/nspr/nspr/0002-Add-nios2-support.patch b/=
meta/recipes-support/nspr/nspr/0002-Add-nios2-support.patch<br>
index 2322806..3a04d42 100644<br>
--- a/meta/recipes-support/nspr/nspr/0002-Add-nios2-support.patch<br>
+++ b/meta/recipes-support/nspr/nspr/0002-Add-nios2-support.patch<br>
@@ -12,11 +12,11 @@ Upstream-Status: Submitted [ <a href=3D"https://bugzill=
a.mozilla.org/show_bug.cgi?id=3D124442" rel=3D"noreferrer" target=3D"_blank=
">https://bugzilla.mozilla.org/show_bug.cgi?id=3D124442</a><br>
=C2=A0 nspr/pr/include/md/_linux.h=C2=A0 =C2=A0| 14 ++++++++++++++<br>
=C2=A0 2 files changed, 59 insertions(+)<br>
<br>
-diff --git a/pr/include/md/_linux.cfg b/nspr/pr/include/md/_linux.cfg<br>
-index 8cbf0cb..150676b 100644<br>
---- a/pr/include/md/_linux.cfg<br>
-+++ b/pr/include/md/_linux.cfg<br>
-@@ -972,6 +972,51 @@<br>
+Index: nspr/pr/include/md/_linux.cfg<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- nspr.orig/pr/include/md/_linux.cfg<br>
++++ nspr/pr/include/md/_linux.cfg<br>
+@@ -975,6 +975,51 @@<br>
=C2=A0 #define PR_BYTES_PER_WORD_LOG2=C2=A0 =C2=A02<br>
=C2=A0 #define PR_BYTES_PER_DWORD_LOG2=C2=A0 3<br>
<br>
@@ -68,10 +68,10 @@ index 8cbf0cb..150676b 100644<br>
=C2=A0 #elif defined(__or1k__)<br>
<br>
=C2=A0 #undef=C2=A0 IS_LITTLE_ENDIAN<br>
-diff --git a/pr/include/md/_linux.h b/nspr/pr/include/md/_linux.h<br>
-index d378db5..18260be 100644<br>
---- a/pr/include/md/_linux.h<br>
-+++ b/pr/include/md/_linux.h<br>
+Index: nspr/pr/include/md/_linux.h<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- nspr.orig/pr/include/md/_linux.h<br>
++++ nspr/pr/include/md/_linux.h<br>
=C2=A0@@ -55,6 +55,8 @@<br>
=C2=A0 #define _PR_SI_ARCHITECTURE &quot;avr32&quot;<br>
=C2=A0 #elif defined(__m32r__)<br>
@@ -80,8 +80,8 @@ index d378db5..18260be 100644<br>
=C2=A0+#define _PR_SI_ARCHITECTURE &quot;nios2&quot;<br>
=C2=A0 #elif defined(__or1k__)<br>
=C2=A0 #define _PR_SI_ARCHITECTURE &quot;or1k&quot;<br>
- #else<br>
-@@ -125,6 +127,18 @@ extern PRInt32 _PR_x86_64_AtomicSet(PRInt32 *val, PRI=
nt32 newval);<br>
+ #elif defined(__riscv) &amp;&amp; (__riscv_xlen =3D=3D 32)<br>
+@@ -129,6 +131,18 @@ extern PRInt32 _PR_x86_64_AtomicSet(PRIn<br>
=C2=A0 #define _MD_ATOMIC_SET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 _PR_x86_64_AtomicSet<br>
=C2=A0 #endif<br>
<br>
@@ -100,6 +100,3 @@ index d378db5..18260be 100644<br>
=C2=A0 #if defined(__or1k__)<br>
=C2=A0 #if defined(__GNUC__)<br>
=C2=A0 /* Use GCC built-in functions */<br>
--- <br>
-2.7.0.rc3<br>
-<br>
diff --git a/meta/recipes-support/nspr/nspr/0003-Add-type-definitions-for-t=
he-RISC-V-architecture.patch b/meta/recipes-support/nspr/nspr/0003-Add-type=
-definitions-for-the-RISC-V-architecture.patch<br>
deleted file mode 100644<br>
index 47e1475..0000000<br>
--- a/meta/recipes-support/nspr/nspr/0003-Add-type-definitions-for-the-RISC=
-V-architecture.patch<br>
+++ /dev/null<br>
@@ -1,150 +0,0 @@<br>
-# HG changeset patch<br>
-# User Karsten Merker &lt;<a href=3D"mailto:merker@debian.org" target=3D"_=
blank">merker@debian.org</a>&gt;<br>
-# Date 1523974333 -7200<br>
-# Node ID f47871e2aeb16b39d4f516690e25c81b04d6d05a<br>
-# Parent=C2=A0 776db96f834cb86e8863052201d55f60a2da91cb<br>
-Bug 1308584, Add type definitions for the RISC-V architecture, r=3Dkaie<br=
>
-<br>
-Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc=
.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
-[ Changes by AF:<br>
- - Rebase on other Yocto patches<br>
-]<br>
-Upstream-Status: Backport [ <a href=3D"https://hg.mozilla.org/projects/nsp=
r/rev/f47871e2aeb1" rel=3D"noreferrer" target=3D"_blank">https://hg.mozilla=
.org/projects/nspr/rev/f47871e2aeb1</a> ]<br>
-<br>
-diff --git a/pr/include/md/_linux.cfg b/pr/include/md/_linux.cfg<br>
---- a/pr/include/md/_linux.cfg<br>
-+++ b/pr/include/md/_linux.cfg<br>
-@@ -1015,16 +1015,108 @@<br>
- #define PR_ALIGN_OF_FLOAT=C2=A0 =C2=A04<br>
- #define PR_ALIGN_OF_DOUBLE=C2=A0 4<br>
- #define PR_ALIGN_OF_POINTER 4<br>
- #define PR_ALIGN_OF_WORD=C2=A0 =C2=A0 4<br>
- <br>
- #define PR_BYTES_PER_WORD_LOG2=C2=A0 =C2=A02<br>
- #define PR_BYTES_PER_DWORD_LOG2=C2=A0 3<br>
- <br>
-+#elif defined(__riscv) &amp;&amp; (__riscv_xlen =3D=3D 32)<br>
-+<br>
-+#undef=C2=A0 IS_BIG_ENDIAN<br>
-+#define IS_LITTLE_ENDIAN 1<br>
-+#undef=C2=A0 IS_64<br>
-+<br>
-+#define PR_BYTES_PER_BYTE=C2=A0 =C2=A01<br>
-+#define PR_BYTES_PER_SHORT=C2=A0 2<br>
-+#define PR_BYTES_PER_INT=C2=A0 =C2=A0 4<br>
-+#define PR_BYTES_PER_INT64=C2=A0 8<br>
-+#define PR_BYTES_PER_LONG=C2=A0 =C2=A04<br>
-+#define PR_BYTES_PER_FLOAT=C2=A0 4<br>
-+#define PR_BYTES_PER_DOUBLE 8<br>
-+#define PR_BYTES_PER_WORD=C2=A0 =C2=A04<br>
-+#define PR_BYTES_PER_DWORD=C2=A0 8<br>
-+<br>
-+#define PR_BITS_PER_BYTE=C2=A0 =C2=A0 8<br>
-+#define PR_BITS_PER_SHORT=C2=A0 =C2=A016<br>
-+#define PR_BITS_PER_INT=C2=A0 =C2=A0 =C2=A032<br>
-+#define PR_BITS_PER_INT64=C2=A0 =C2=A064<br>
-+#define PR_BITS_PER_LONG=C2=A0 =C2=A0 32<br>
-+#define PR_BITS_PER_FLOAT=C2=A0 =C2=A032<br>
-+#define PR_BITS_PER_DOUBLE=C2=A0 64<br>
-+#define PR_BITS_PER_WORD=C2=A0 =C2=A0 32<br>
-+<br>
-+#define PR_BITS_PER_BYTE_LOG2=C2=A0 =C2=A03<br>
-+#define PR_BITS_PER_SHORT_LOG2=C2=A0 4<br>
-+#define PR_BITS_PER_INT_LOG2=C2=A0 =C2=A0 5<br>
-+#define PR_BITS_PER_INT64_LOG2=C2=A0 6<br>
-+#define PR_BITS_PER_LONG_LOG2=C2=A0 =C2=A05<br>
-+#define PR_BITS_PER_FLOAT_LOG2=C2=A0 5<br>
-+#define PR_BITS_PER_DOUBLE_LOG2 6<br>
-+#define PR_BITS_PER_WORD_LOG2=C2=A0 =C2=A05<br>
-+<br>
-+#define PR_ALIGN_OF_SHORT=C2=A0 =C2=A02<br>
-+#define PR_ALIGN_OF_INT=C2=A0 =C2=A0 =C2=A04<br>
-+#define PR_ALIGN_OF_LONG=C2=A0 =C2=A0 4<br>
-+#define PR_ALIGN_OF_INT64=C2=A0 =C2=A08<br>
-+#define PR_ALIGN_OF_FLOAT=C2=A0 =C2=A04<br>
-+#define PR_ALIGN_OF_DOUBLE=C2=A0 8<br>
-+#define PR_ALIGN_OF_POINTER 4<br>
-+#define PR_ALIGN_OF_WORD=C2=A0 =C2=A0 4<br>
-+<br>
-+#define PR_BYTES_PER_WORD_LOG2=C2=A0 2<br>
-+#define PR_BYTES_PER_DWORD_LOG2 3<br>
-+<br>
-+#elif defined(__riscv) &amp;&amp; (__riscv_xlen =3D=3D 64)<br>
-+<br>
-+#undef=C2=A0 IS_BIG_ENDIAN<br>
-+#define IS_LITTLE_ENDIAN 1<br>
-+#define IS_64<br>
-+<br>
-+#define PR_BYTES_PER_BYTE=C2=A0 =C2=A01<br>
-+#define PR_BYTES_PER_SHORT=C2=A0 2<br>
-+#define PR_BYTES_PER_INT=C2=A0 =C2=A0 4<br>
-+#define PR_BYTES_PER_INT64=C2=A0 8<br>
-+#define PR_BYTES_PER_LONG=C2=A0 =C2=A08<br>
-+#define PR_BYTES_PER_FLOAT=C2=A0 4<br>
-+#define PR_BYTES_PER_DOUBLE 8<br>
-+#define PR_BYTES_PER_WORD=C2=A0 =C2=A08<br>
-+#define PR_BYTES_PER_DWORD=C2=A0 8<br>
-+<br>
-+#define PR_BITS_PER_BYTE=C2=A0 =C2=A0 8<br>
-+#define PR_BITS_PER_SHORT=C2=A0 =C2=A016<br>
-+#define PR_BITS_PER_INT=C2=A0 =C2=A0 =C2=A032<br>
-+#define PR_BITS_PER_INT64=C2=A0 =C2=A064<br>
-+#define PR_BITS_PER_LONG=C2=A0 =C2=A0 64<br>
-+#define PR_BITS_PER_FLOAT=C2=A0 =C2=A032<br>
-+#define PR_BITS_PER_DOUBLE=C2=A0 64<br>
-+#define PR_BITS_PER_WORD=C2=A0 =C2=A0 64<br>
-+<br>
-+#define PR_BITS_PER_BYTE_LOG2=C2=A0 =C2=A03<br>
-+#define PR_BITS_PER_SHORT_LOG2=C2=A0 4<br>
-+#define PR_BITS_PER_INT_LOG2=C2=A0 =C2=A0 5<br>
-+#define PR_BITS_PER_INT64_LOG2=C2=A0 6<br>
-+#define PR_BITS_PER_LONG_LOG2=C2=A0 =C2=A06<br>
-+#define PR_BITS_PER_FLOAT_LOG2=C2=A0 5<br>
-+#define PR_BITS_PER_DOUBLE_LOG2 6<br>
-+#define PR_BITS_PER_WORD_LOG2=C2=A0 =C2=A06<br>
-+<br>
-+#define PR_ALIGN_OF_SHORT=C2=A0 =C2=A02<br>
-+#define PR_ALIGN_OF_INT=C2=A0 =C2=A0 =C2=A04<br>
-+#define PR_ALIGN_OF_LONG=C2=A0 =C2=A0 8<br>
-+#define PR_ALIGN_OF_INT64=C2=A0 =C2=A08<br>
-+#define PR_ALIGN_OF_FLOAT=C2=A0 =C2=A04<br>
-+#define PR_ALIGN_OF_DOUBLE=C2=A0 8<br>
-+#define PR_ALIGN_OF_POINTER 8<br>
-+#define PR_ALIGN_OF_WORD=C2=A0 =C2=A0 8<br>
-+<br>
-+#define PR_BYTES_PER_WORD_LOG2=C2=A0 3<br>
-+#define PR_BYTES_PER_DWORD_LOG2 3<br>
-+<br>
- #else<br>
- <br>
- #error &quot;Unknown CPU architecture&quot;<br>
- <br>
- #endif<br>
- <br>
- #ifndef HAVE_LONG_LONG<br>
- #define=C2=A0 =C2=A0 =C2=A0 =C2=A0HAVE_LONG_LONG<br>
-diff --git a/pr/include/md/_linux.h b/pr/include/md/_linux.h<br>
---- a/pr/include/md/_linux.h<br>
-+++ b/pr/include/md/_linux.h<br>
-@@ -54,16 +54,20 @@<br>
- #elif defined(__avr32__)<br>
- #define _PR_SI_ARCHITECTURE &quot;avr32&quot;<br>
- #elif defined(__m32r__)<br>
- #define _PR_SI_ARCHITECTURE &quot;m32r&quot;<br>
- #elif defined(__nios2__)<br>
- #define _PR_SI_ARCHITECTURE &quot;nios2&quot;<br>
- #elif defined(__or1k__)<br>
- #define _PR_SI_ARCHITECTURE &quot;or1k&quot;<br>
-+#elif defined(__riscv) &amp;&amp; (__riscv_xlen =3D=3D 32)<br>
-+#define _PR_SI_ARCHITECTURE &quot;riscv32&quot;<br>
-+#elif defined(__riscv) &amp;&amp; (__riscv_xlen =3D=3D 64)<br>
-+#define _PR_SI_ARCHITECTURE &quot;riscv64&quot;<br>
- #else<br>
- #error &quot;Unknown CPU architecture&quot;<br>
- #endif<br>
- #define PR_DLL_SUFFIX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;.so&quot;<br=
>
- <br>
- #define _PR_VMBASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x3000=
0000<br>
- #define _PR_STACK_VMBASE=C2=A0 =C2=A0 =C2=A0 0x50000000<br>
- #define _MD_DEFAULT_STACK_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 65536L<br>
-<br>
diff --git a/meta/recipes-support/nspr/nspr/remove-rpath-from-tests.patch b=
/meta/recipes-support/nspr/nspr/remove-rpath-from-tests.patch<br>
index ecc6d31..7ba59ed 100644<br>
--- a/meta/recipes-support/nspr/nspr/remove-rpath-from-tests.patch<br>
+++ b/meta/recipes-support/nspr/nspr/remove-rpath-from-tests.patch<br>
@@ -15,7 +15,7 @@ Index: nspr/pr/tests/Makefile.in<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
=C2=A0--- nspr.orig/pr/tests/Makefile.in<br>
=C2=A0+++ nspr/pr/tests/Makefile.in<br>
-@@ -315,7 +315,7 @@ ifeq ($(OS_ARCH), SunOS)<br>
+@@ -316,7 +316,7 @@ ifeq ($(OS_ARCH), SunOS)<br>
=C2=A0 endif # SunOS<br>
<br>
=C2=A0 ifeq (,$(filter-out Linux GNU GNU_%,$(OS_ARCH)))<br>
diff --git a/meta/recipes-support/nspr/<a href=3D"http://nspr_4.19.bb" rel=
=3D"noreferrer" target=3D"_blank">nspr_4.19.bb</a> b/meta/recipes-support/n=
spr/<a href=3D"http://nspr_4.20.bb" rel=3D"noreferrer" target=3D"_blank">ns=
pr_4.20.bb</a><br>
similarity index 95%<br>
rename from meta/recipes-support/nspr/<a href=3D"http://nspr_4.19.bb" rel=
=3D"noreferrer" target=3D"_blank">nspr_4.19.bb</a><br>
rename to meta/recipes-support/nspr/<a href=3D"http://nspr_4.20.bb" rel=3D"=
noreferrer" target=3D"_blank">nspr_4.20.bb</a><br>
index 0212be7..fe3b4bd 100644<br>
--- a/meta/recipes-support/nspr/<a href=3D"http://nspr_4.19.bb" rel=3D"nore=
ferrer" target=3D"_blank">nspr_4.19.bb</a><br>
+++ b/meta/recipes-support/nspr/<a href=3D"http://nspr_4.20.bb" rel=3D"nore=
ferrer" target=3D"_blank">nspr_4.20.bb</a><br>
@@ -11,7 +11,6 @@ SRC_URI =3D &quot;<a href=3D"http://ftp.mozilla.org/pub/n=
spr/releases/v$%7BPV%7D/src/nspr-$%7BPV%7D.tar.gz" rel=3D"noreferrer" targe=
t=3D"_blank">http://ftp.mozilla.org/pub/nspr/releases/v${PV}/src/nspr-${PV}=
.tar.gz</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://remove-srcdir-from-configu=
re-in.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-Add-nios2-support.pat=
ch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-md-Fix-build-with-mus=
l.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-Add-type-definitions-=
for-the-RISC-V-architecture.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-Add-ARC-support.patch=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://<a href=3D"http://nspr.pc.=
in" rel=3D"noreferrer" target=3D"_blank">nspr.pc.in</a> \<br>
=C2=A0&quot;<br>
@@ -24,8 +23,8 @@ CACHED_CONFIGUREVARS_append_libc-musl =3D &quot; CFLAGS=
=3D&#39;${CFLAGS} -D_PR_POLL_AVAILABLE<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"http://ftp.mozilla.org/pub/ns=
pr/releases/" rel=3D"noreferrer" target=3D"_blank">http://ftp.mozilla.org/p=
ub/nspr/releases/</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;v(?P&lt;pver&gt;\d+(\.\d+)+)/&quot;<br=
>
<br>
-SRC_URI[md5sum] =3D &quot;e1d27282ad6286b69d6b9fd07201d3dd&quot;<br>
-SRC_URI[sha256sum] =3D &quot;2ed95917fa2277910d1d1cf36030607dccc0ba522bba0=
8e2af13c113dcd8f729&quot;<br>
+SRC_URI[md5sum] =3D &quot;1c198c7e73f6b0e2bb9153a644ba246b&quot;<br>
+SRC_URI[sha256sum] =3D &quot;2c8964913da89ffbaf464d49ce44d79e8804e1794ef9a=
8c52a7bff7224d1556e&quot;<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;netscape_portable_runtime&quot;<br>
<br>
-- <br>
2.7.4<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000ce36bd0578e586dd--
