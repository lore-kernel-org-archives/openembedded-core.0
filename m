Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id B6C57731DB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 00:19:12 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id f81so176495360iof.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Feb 2016 16:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=GKaFCoRHJcDKcLEmpeinaIH+UgARqHecv8nClUG6ws0=;
	b=GaFfMxhw/mZ6yeWx0oCeVxpC1hlWwaA4gLqmdxH4UpU+mkWwsxxLfCLpvbViienW2E
	uq5jirKBKRmddTTWPL8gs04yGfvz308Q8j6kCByq9QchlbpkGcsswq2GuXFa1xrbvsXR
	KHqFYyCOmB4WxqcmoAze5CXOXH/fW/Qqi8zkGjhKpMjB47uN39Wx9kkAjdLGPiS1Vxmi
	1Wd9ZGRkkKDTyF26P4/vYgsd9QCVHZyT1VnxI5o80aPBT2zOznn1TbGLEcHxZ2e90aWf
	qdyCDyJ+lB3eENnZj6J9jZdfZsKZt71U1I2+qZNi6jZSjyU7bBdIth7POpr4JzxRi+9V
	NRpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=GKaFCoRHJcDKcLEmpeinaIH+UgARqHecv8nClUG6ws0=;
	b=NsSqXE1PcWLVR3V7+5CXRpIqJX7ELSqzdxc0cQeXqf88YyHQHtNYbsh/f4R5cK8znd
	3CJALMEIGH9GGYCkF0XZSm5xFsOyoxJAQooyNOH6wp9Gr9X6WPH01U1vqbKDlJ01IdU6
	b3+1Wg6JCGYqvB2d204suU5FDv8CJcHR6II72HPdKS5JAbouJZE7qRJYihsgTipqVdr6
	PmmuqQfX6pP/CKILOhaGulmzTWRaOw1u5Bar6EoZCjcDZ4MiMK7XsJEEQoJUNplovzF0
	uRz+VROhUe5WLLrxOjHKBEEnaeC1+7yvEQ5YQbrcLuMQR+i9E4lbzfQ2NPY18apcs1g4
	sewA==
X-Gm-Message-State: AG10YOSWzoXkjqfuNgDjfkzvi6yOkT31ZrWshbzaGbS6yNv5z3CX4vYdt7Toa3QZCX3odUULEMnv4qrrlYZb9A==
MIME-Version: 1.0
X-Received: by 10.107.34.79 with SMTP id i76mr29987507ioi.195.1454372353157;
	Mon, 01 Feb 2016 16:19:13 -0800 (PST)
Received: by 10.107.46.219 with HTTP; Mon, 1 Feb 2016 16:19:13 -0800 (PST)
Received: by 10.107.46.219 with HTTP; Mon, 1 Feb 2016 16:19:13 -0800 (PST)
In-Reply-To: <1454364084-13476-1-git-send-email-armccurdy@gmail.com>
References: <1454364084-13476-1-git-send-email-armccurdy@gmail.com>
Date: Mon, 1 Feb 2016 16:19:13 -0800
Message-ID: <CAMKF1sqRtdCtm0jtGwMtPWJ3cUYmRB5FYZ9m7xmjq8+0q_pTGQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-configure-common.inc: drop --enable-target-optspace from configure
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
X-List-Received-Date: Tue, 02 Feb 2016 00:19:13 -0000
Content-Type: multipart/alternative; boundary=001a114075287b3f0c052abe7395

--001a114075287b3f0c052abe7395
Content-Type: text/plain; charset=UTF-8

What is the size increase in gcc runtime when u do this
On Feb 1, 2016 2:01 PM, "Andre McCurdy" <armccurdy@gmail.com> wrote:

> Configuring gcc with --enable-target-optspace (which causes gcc to
> append "-g -Os" to the default CFLAGS_FOR_TARGET and so force libgcc
> etc target libraries to always be optimised for size) dates back to
> the very first commit in oe-core git in 2005 (for gcc 3.4.3).
>
> Configuring gcc with --enable-target-optspace is not done widely
> elsewhere (it's not used for Ubuntu or Fedora host gcc, the Linaro
> binary toolchain or in Buildroot since early 2015). Sometime around
> gcc 4.5.x it caused problems for powerpc and so was disabled for that
> architecture:
>
>   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=43810
>
> This patch removes --enable-target-optspace completely (ie powerpc is
> no longer a special case) and allows optimisation of libgcc etc to be
> controlled directly by the flags present in TARGET_CFLAGS.
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-configure-common.inc | 8 --------
>  meta/recipes-devtools/gcc/gcc-cross-initial.inc    | 1 -
>  2 files changed, 9 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> index 85e69db..f4f76bd 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> @@ -14,13 +14,6 @@ JAVA_sh3 ?= ""
>  # gcc 3.x expects 'f77', 4.0 expects 'f95', 4.1 and 4.2 expect 'fortran'
>  FORTRAN ?= ",f77"
>  LANGUAGES ?= "c,c++${FORTRAN}${JAVA}"
> -# disable --enable-target-optspace for powerpc SPE
> -# at -Os libgcc.so.1 creates references into
> -# hidden symbols in libgcc.a which linker complains
> -# when linking shared libraries further in the build like (gnutls)
> -
> -SPECIAL_ARCH_LIST = "powerpc"
> -OPTSPACE = '${@bb.utils.contains("SPECIAL_ARCH_LIST", "${TARGET_ARCH}",
> "", "--enable-target-optspace",d)}'
>
>  EXTRA_OECONF_BASE ?= ""
>  EXTRA_OECONF_PATHS ?= ""
> @@ -42,7 +35,6 @@ EXTRA_OECONF = "\
>      --enable-libstdcxx-pch \
>      --program-prefix=${TARGET_PREFIX} \
>      --without-local-prefix \
> -    ${OPTSPACE} \
>      ${EXTRA_OECONF_BASE} \
>      ${EXTRA_OECONF_GCC_FLOAT} \
>      ${EXTRA_OECONF_PATHS} \
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
> b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
> index 910f2ef..048b530 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
> @@ -22,7 +22,6 @@ EXTRA_OECONF = "\
>      --disable-multilib \
>      --disable-__cxa_atexit \
>      --enable-languages=c \
> -    ${OPTSPACE} \
>      --program-prefix=${TARGET_PREFIX} \
>      --with-sysroot=/not/exist \
>      --with-build-sysroot=${GCCCROSS_BUILDSYSROOT} \
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114075287b3f0c052abe7395
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">What is the size increase in gcc runtime when u do this</p>
<div class=3D"gmail_quote">On Feb 1, 2016 2:01 PM, &quot;Andre McCurdy&quot=
; &lt;<a href=3D"mailto:armccurdy@gmail.com">armccurdy@gmail.com</a>&gt; wr=
ote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Configuring gcc=
 with --enable-target-optspace (which causes gcc to<br>
append &quot;-g -Os&quot; to the default CFLAGS_FOR_TARGET and so force lib=
gcc<br>
etc target libraries to always be optimised for size) dates back to<br>
the very first commit in oe-core git in 2005 (for gcc 3.4.3).<br>
<br>
Configuring gcc with --enable-target-optspace is not done widely<br>
elsewhere (it&#39;s not used for Ubuntu or Fedora host gcc, the Linaro<br>
binary toolchain or in Buildroot since early 2015). Sometime around<br>
gcc 4.5.x it caused problems for powerpc and so was disabled for that<br>
architecture:<br>
<br>
=C2=A0 <a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D43810" rel=
=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/bugzilla/show_bug.cgi=
?id=3D43810</a><br>
<br>
This patch removes --enable-target-optspace completely (ie powerpc is<br>
no longer a special case) and allows optimisation of libgcc etc to be<br>
controlled directly by the flags present in TARGET_CFLAGS.<br>
<br>
Signed-off-by: Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gmail.com">arm=
ccurdy@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/gcc/gcc-configure-common.inc | 8 --------<br>
=C2=A0meta/recipes-devtools/gcc/gcc-cross-initial.inc=C2=A0 =C2=A0 | 1 -<br=
>
=C2=A02 files changed, 9 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/reci=
pes-devtools/gcc/gcc-configure-common.inc<br>
index 85e69db..f4f76bd 100644<br>
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc<br>
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc<br>
@@ -14,13 +14,6 @@ JAVA_sh3 ?=3D &quot;&quot;<br>
=C2=A0# gcc 3.x expects &#39;f77&#39;, 4.0 expects &#39;f95&#39;, 4.1 and 4=
.2 expect &#39;fortran&#39;<br>
=C2=A0FORTRAN ?=3D &quot;,f77&quot;<br>
=C2=A0LANGUAGES ?=3D &quot;c,c++${FORTRAN}${JAVA}&quot;<br>
-# disable --enable-target-optspace for powerpc SPE<br>
-# at -Os libgcc.so.1 creates references into<br>
-# hidden symbols in libgcc.a which linker complains<br>
-# when linking shared libraries further in the build like (gnutls)<br>
-<br>
-SPECIAL_ARCH_LIST =3D &quot;powerpc&quot;<br>
-OPTSPACE =3D &#39;${@bb.utils.contains(&quot;SPECIAL_ARCH_LIST&quot;, &quo=
t;${TARGET_ARCH}&quot;, &quot;&quot;, &quot;--enable-target-optspace&quot;,=
d)}&#39;<br>
<br>
=C2=A0EXTRA_OECONF_BASE ?=3D &quot;&quot;<br>
=C2=A0EXTRA_OECONF_PATHS ?=3D &quot;&quot;<br>
@@ -42,7 +35,6 @@ EXTRA_OECONF =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0--enable-libstdcxx-pch \<br>
=C2=A0 =C2=A0 =C2=A0--program-prefix=3D${TARGET_PREFIX} \<br>
=C2=A0 =C2=A0 =C2=A0--without-local-prefix \<br>
-=C2=A0 =C2=A0 ${OPTSPACE} \<br>
=C2=A0 =C2=A0 =C2=A0${EXTRA_OECONF_BASE} \<br>
=C2=A0 =C2=A0 =C2=A0${EXTRA_OECONF_GCC_FLOAT} \<br>
=C2=A0 =C2=A0 =C2=A0${EXTRA_OECONF_PATHS} \<br>
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recipes=
-devtools/gcc/gcc-cross-initial.inc<br>
index 910f2ef..048b530 100644<br>
--- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc<br>
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc<br>
@@ -22,7 +22,6 @@ EXTRA_OECONF =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0--disable-multilib \<br>
=C2=A0 =C2=A0 =C2=A0--disable-__cxa_atexit \<br>
=C2=A0 =C2=A0 =C2=A0--enable-languages=3Dc \<br>
-=C2=A0 =C2=A0 ${OPTSPACE} \<br>
=C2=A0 =C2=A0 =C2=A0--program-prefix=3D${TARGET_PREFIX} \<br>
=C2=A0 =C2=A0 =C2=A0--with-sysroot=3D/not/exist \<br>
=C2=A0 =C2=A0 =C2=A0--with-build-sysroot=3D${GCCCROSS_BUILDSYSROOT} \<br>
--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--001a114075287b3f0c052abe7395--
