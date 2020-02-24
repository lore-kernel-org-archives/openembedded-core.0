Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id A727B60B17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 00:25:45 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id p7so7272129qkh.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 16:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ui5sch2eSG8RFvTt8L3z3NGpJvGu/nivHjUoWH6rR3k=;
	b=WrZYyhECPB5Kk2hod3D+EjNMFv6axcvq5pJrFF3FDt3RRFUjLHXQHOzeisMBZUkPs/
	XE1sayuKpKK3Zi1lOKHIETqiftboaXzz+PUUB/5qCzHZ+N7Ok+fx2uWKi8JTI6TUq2Om
	q4Y1yQ/2iUotVms2q/hf8n8MSYNBSmDp40ee8TIJPXokgDhRdFYA/tsqLY+0W/xaoE4Z
	/QxEe7m2E2Fljw6JKGxsVckc6IUZNpXKGdewMa74My0rU7OwhJMYKlfsXbCNkRdiCBK9
	tIYgHannF9W7pJWmft314E3Pj2pnO3GNOZbFsspRc0Dk3RxVu/GdRSKwjPXfYqT/Bd08
	x2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ui5sch2eSG8RFvTt8L3z3NGpJvGu/nivHjUoWH6rR3k=;
	b=gXjWsV1myjEJ7X0S7ug26kv97LzlBPHmVo+t325zwxDWLQtTK5VJUprPeyjuasd8gM
	ng0AEpnfuYnUeyqNugKXux81vs45mcSt7srVzQriUzThbVhn5CbvbpF/WHTpqMkGyJC2
	i8KMfPTOob6tI7H+gW0A4xrz+Qq9gifVFxTsP0Ig+FOjZSlIAvH+eJW6qRhEbGqSh2D2
	cH01HJ5mq8RyNbrWe0Tsn6BpCouPkA0j4EHW5Bpyq8Ij7dGZ8mEcrY9O+Fsg2LzoAQKY
	Va9mcJEwLPS2Oqwq/lM8w0N86BWy9XlCSRESXVvEgumlBgthO+44ScMh3FigixSZhhv4
	W8Aw==
X-Gm-Message-State: APjAAAU8Msylsj1Vvaxvrpt5rAZPUJXL5BYUNsFaPVu0jPcrWKbGNZGy
	LJJziLe/B9Ce+tq/lv4SS1Z2OJXtHAbJUgR75O3Vn9iH
X-Google-Smtp-Source: APXvYqyReAy73d7lSDkFjV8h3gwTKn+Sun5WAJvWXT+Nu3P4Zsbe4qJXLqp7TEP1CjPGzwd0ycJNccE0/nqLz58l9bQ=
X-Received: by 2002:a37:47c4:: with SMTP id
	u187mr47125817qka.165.1582503945743; 
	Sun, 23 Feb 2020 16:25:45 -0800 (PST)
MIME-Version: 1.0
References: <20200223193408.5602-1-bunk@stusta.de>
In-Reply-To: <20200223193408.5602-1-bunk@stusta.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 23 Feb 2020 16:25:18 -0800
Message-ID: <CAMKF1sqOPEw+uDZO81+j5MWxZBVjjgag6eT+jXYL958ic1Ysmg@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 1/2] nss: Move to meta-oe
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
X-List-Received-Date: Mon, 24 Feb 2020 00:25:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 23, 2020 at 11:34 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> rpm was the last user in OE-core.
>

we should also assess external dependencies especially on libraries,
there might be layers which do not depend on meta-oe but use nss
or enable nss packageconfigs in core components like curl.

> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  meta/conf/distro/include/maintainers.inc      |   1 -
>  ...figure-option-to-disable-ARM-HW-cryp.patch |  52 ----
>  ...0001-nss-fix-support-cross-compiling.patch |  48 ---
>  meta/recipes-support/nss/nss/blank-cert9.db   | Bin 28672 -> 0 bytes
>  meta/recipes-support/nss/nss/blank-key4.db    | Bin 36864 -> 0 bytes
>  .../nss/nss/disable-Wvarargs-with-clang.patch |  33 ---
>  .../nss-fix-incorrect-shebang-of-perl.patch   | 110 -------
>  .../nss/nss/nss-fix-nsinstall-build.patch     |  36 ---
>  .../nss-no-rpath-for-cross-compiling.patch    |  26 --
>  meta/recipes-support/nss/nss/nss.pc.in        |  11 -
>  .../nss/nss/pqg.c-ULL_addend.patch            |  23 --
>  meta/recipes-support/nss/nss/signlibs.sh      |  20 --
>  .../recipes-support/nss/nss/system-pkcs11.txt |   5 -
>  meta/recipes-support/nss/nss_3.50.bb          | 273 ------------------
>  14 files changed, 638 deletions(-)
>  delete mode 100644 meta/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
>  delete mode 100644 meta/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch
>  delete mode 100644 meta/recipes-support/nss/nss/blank-cert9.db
>  delete mode 100644 meta/recipes-support/nss/nss/blank-key4.db
>  delete mode 100644 meta/recipes-support/nss/nss/disable-Wvarargs-with-clang.patch
>  delete mode 100644 meta/recipes-support/nss/nss/nss-fix-incorrect-shebang-of-perl.patch
>  delete mode 100644 meta/recipes-support/nss/nss/nss-fix-nsinstall-build.patch
>  delete mode 100644 meta/recipes-support/nss/nss/nss-no-rpath-for-cross-compiling.patch
>  delete mode 100644 meta/recipes-support/nss/nss/nss.pc.in
>  delete mode 100644 meta/recipes-support/nss/nss/pqg.c-ULL_addend.patch
>  delete mode 100644 meta/recipes-support/nss/nss/signlibs.sh
>  delete mode 100644 meta/recipes-support/nss/nss/system-pkcs11.txt
>  delete mode 100644 meta/recipes-support/nss/nss_3.50.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 8f612ace39..e4b710d640 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -526,7 +526,6 @@ RECIPE_MAINTAINER_pn-nfs-utils = "Robert Yang <liezhi.yang@windriver.com>"
>  RECIPE_MAINTAINER_pn-ninja = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER_pn-npth = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-nspr = "Armin Kuster <akuster808@gmail.com>"
> -RECIPE_MAINTAINER_pn-nss = "Armin Kuster <akuster808@gmail.com>"
>  RECIPE_MAINTAINER_pn-nss-myhostname = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER_pn-ofono = "Ross Burton <ross.burton@intel.com>"
>  RECIPE_MAINTAINER_pn-opensbi = "Alistair Francis <alistair.francis@wdc.com>"
> diff --git a/meta/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch b/meta/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
> deleted file mode 100644
> index c380c14491..0000000000
> --- a/meta/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -From 5595e9651aca39af945931c73eb524a0f8bd130d Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Wed, 18 Dec 2019 12:29:50 +0100
> -Subject: [PATCH] freebl: add a configure option to disable ARM HW crypto
> -
> -Not all current hardware supports it, particularly anything
> -prior to armv8 does not.
> -
> -Upstream-Status: Pending
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - nss/lib/freebl/Makefile | 3 +++
> - 1 file changed, 3 insertions(+)
> -
> ---- a/nss/lib/freebl/Makefile
> -+++ b/nss/lib/freebl/Makefile
> -@@ -125,6 +125,9 @@ else
> -         DEFINES += -DNSS_X86
> - endif
> - endif
> -+
> -+ifdef NSS_USE_ARM_HW_CRYPTO
> -+    DEFINES += -DNSS_USE_ARM_HW_CRYPTO
> - ifeq ($(CPU_ARCH),aarch64)
> -     DEFINES += -DUSE_HW_AES
> -     EXTRA_SRCS += aes-armv8.c gcm-aarch64.c
> -@@ -146,6 +149,7 @@ ifeq ($(CPU_ARCH),arm)
> -         endif
> -     endif
> - endif
> -+endif
> -
> - ifeq ($(OS_TARGET),OSF1)
> -     DEFINES += -DMP_ASSEMBLY_MULTIPLY -DMP_NO_MP_WORD
> ---- a/nss/lib/freebl/gcm.c
> -+++ b/nss/lib/freebl/gcm.c
> -@@ -17,6 +17,7 @@
> -
> - #include <limits.h>
> -
> -+#ifdef NSS_USE_ARM_HW_CRYPTO
> - /* old gcc doesn't support some poly64x2_t intrinsic */
> - #if defined(__aarch64__) && defined(IS_LITTLE_ENDIAN) && \
> -     (defined(__clang__) || defined(__GNUC__) && __GNUC__ > 6)
> -@@ -25,6 +26,7 @@
> - /* We don't test on big endian platform, so disable this on big endian. */
> - #define USE_ARM_GCM
> - #endif
> -+#endif
> -
> - /* Forward declarations */
> - SECStatus gcm_HashInit_hw(gcmHashContext *ghash);
> diff --git a/meta/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch b/meta/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch
> deleted file mode 100644
> index d5403397e7..0000000000
> --- a/meta/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From 0cf47ee432cc26a706864fcc09b2c3adc342a679 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Wed, 22 Feb 2017 11:36:11 +0200
> -Subject: [PATCH] nss: fix support cross compiling
> -
> -Let some make variables be assigned from outside makefile.
> -
> -Upstream-Status: Inappropriate [configuration]
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - nss/coreconf/arch.mk    | 2 +-
> - nss/lib/freebl/Makefile | 6 ++++++
> - 2 files changed, 7 insertions(+), 1 deletion(-)
> -
> -diff --git a/nss/coreconf/arch.mk b/nss/coreconf/arch.mk
> -index 06c276f..9c1eb51 100644
> ---- a/nss/coreconf/arch.mk
> -+++ b/nss/coreconf/arch.mk
> -@@ -30,7 +30,7 @@ OS_TEST := $(shell uname -m)
> - ifeq ($(OS_TEST),i86pc)
> -     OS_RELEASE := $(shell uname -r)_$(OS_TEST)
> - else
> --    OS_RELEASE := $(shell uname -r)
> -+    OS_RELEASE ?= $(shell uname -r)
> - endif
> -
> - #
> -diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
> -index 0ce1425..ebeb411 100644
> ---- a/nss/lib/freebl/Makefile
> -+++ b/nss/lib/freebl/Makefile
> -@@ -36,6 +36,12 @@ ifdef USE_64
> -       DEFINES += -DNSS_USE_64
> - endif
> -
> -+ifeq ($(OS_TEST),mips)
> -+ifndef USE_64
> -+       DEFINES += -DNS_PTR_LE_32
> -+endif
> -+endif
> -+
> - ifdef USE_ABI32_FPU
> -       DEFINES += -DNSS_USE_ABI32_FPU
> - endif
> ---
> -2.11.0
> -
> diff --git a/meta/recipes-support/nss/nss/blank-cert9.db b/meta/recipes-support/nss/nss/blank-cert9.db
> deleted file mode 100644
> index 7d4bcf2582d510f7b51d4306706746178c41fbbc..0000000000000000000000000000000000000000
> GIT binary patch
> literal 0
> HcmV?d00001
>
> literal 28672
> zcmeH~OK;Oa6ou_RTxhB2E<!9aOCljO58HJ%sA+4Yh?2G;mFNOhcH&Bb(26FJSh8cs
> zo*x9ii4|h*_1I~<VaFmmmVA3=?%XpopQn-L?dj2YR*1{%n@`zH7;ne(eQ!?)&+~ly
> zZrHba)~#5p8ul;c|MmFZ3-M$7@oz8K{Np`(`1t46udT0Jd$xfG1V8`;KmY_l00ck)
> z1pYgLy&z~bn*RCtYE*m~e$2+BtLgM)o=?WZje~yL8Kk1yJ51jR&WYomsPp1krlfAY
> zTxW+fc9>*&F{wuccN{o(-@&vF*Mi2=rvIMnr}O+nF`U&7>vtSn_P&Rbs?}Ky8c(Wy
> zjHlCiaZ{VD-7zVX_dOET`quV08qKEvy)(=5Nl};AV#WCkI{QcIZ4Tp+IO%uabo%Gw
> zb$Tw&dfn5rlx8?M?!7wd9t=ch|F}PRE;4CfWnXPyLz+9NM^RTo&4ii>H)%)`Qiv$T
> z6m}^j6xtLr3b_q!wvuIJM@b$^mh+H{l4PSK`6x+7N|KY3WThl|DM@BZ4k^0jmFr_?
> zU21mL?5x>Yv$JMr&CZ&g4ObbiGF)Z2%5YW8*_g92XJgLBWtKf-_T1%>%ttXG%{$eS
> zYBldv^J+tBAFZg{N%A#3+VE(@qivFhlmlr@$fQC^bB9bSWKto|8uF|mf0u}BBX*0}
> zE#lf?5t-0LWa%XNI!POIl4fv{w&*17(@6s8BvC9SLveCZ#&}%sqAae;;>B{Ttd?VC
> zwHzy}<ycwyT3Ic}%F5TuTfTH=Xkyz-2ggY|Jx<aQa&okg#X?@zk`F>THeW0!r{#>I
> zOpbCUp3t|IjGe}YCgyXi+by*cG}5N;l|Le%C-z2vk<Dk<+`g#)gD+GqSM5*j1Nyn$
> zrm#Z+4+ww&2!H?xfB*=900@8p2!H?xfWWd6*rbi&{=clB7yAMM5C8!X009sH0T2KI
> z5C8!X00Aa|`#%l>2!H?xfB*=900@8p2!H?xfB*<AKLOnTm;W1Mhadm~AOHd&00JNY
> z0w4eaAOHd&fcrnr00@8p2!H?xfB*=900@8p2!H?xEI$F<|Cj$8V}~FB0w4eaAOHd&
> O00JNY0w4eaAn+IM<WtiC
>
> diff --git a/meta/recipes-support/nss/nss/blank-key4.db b/meta/recipes-support/nss/nss/blank-key4.db
> deleted file mode 100644
> index d47f08d04fe82197bc6a39ef9bf216b61c3dc77a..0000000000000000000000000000000000000000
> GIT binary patch
> literal 0
> HcmV?d00001
>
> literal 36864
> zcmeI)Pj3@P7zXfN$JsbGQBr~AB4lZNXcZIG&g?%N!~w@RZQ3*mZcvLjSnGHJQ-_q;
> zfnEyAB}g2&RFzt!s;9Q+svn?82vt4w)Lub+1tcV(r_THCZkH&E#0_CRt9bl+XXe@2
> z-!3E@BtAW}*d2u8!p7!$Fc6M0WtgUMN(jR+GWs>HU&&_aBAa~B@8(POer3jZPkcWy
> z`P|6mo5q3c<o&|$h3f?`|0Lhc-`j5z_Co*y5P$##AOHafyh#GRv9V&QWNyz4f_5)l
> z4+p{NU=Sqlxq7ovTWyHd+T3D8Bzwhlw<A`X3!l`Q=fua2bK>mM!kM!TvAiVe%S-c%
> z3-wjeY^*HS>WyPU|Gc`cqBpzpe$Fb^OQzAi(h0xnU+wA6R<JeL;Loijzon9De9p3p
> z#j<&x2dsS&bURo2{gut`wO|mA#fw{5I^FnOa3?Jx9U!IyCGE<oQO@{`GkQTg?4?7j
> zT^ZcDC&Q`CXRYFqve}B3z16-Pt_{+R(Ont+sC!R}lB!Z4v5JS2v+4HxTj6FJlid{)
> z_3lZjs>-dC=2)>@Ht*E=lBEG@m5HOG%a-ncl?zv!TW+o%6M@t(ecb|EzZ|N02klX`
> zt4bfM^s&kxX-L(j#-qlk<~TJ~YG$bksA=nFmZN0Ua-yURC8Og|ijowgB;_bcK}u4R
> zk`$#RWhqHvO0H2GFE3gjC)-iY$u=k3oNRNl&B-<=+nnt1EQe<~Jj>x(4$tzr*XLfJ
> zdwuTpqh8MRIrBJ=WFN&qHlL|2X|By@YV&GcsW)5E?zp5}heta++Tqc<lZQkDX^hKK
> zuB2nTEakG4%SUzjs4ia@kLP-v=5d<GbJs%8aUG8$<C1dYl1?lx=?HO2rx=%Xo^eTl
> zaY>3%$tZD|PGg>UZ#vCSrupe|beSwim&tN;nJh<_Nv<xF<>)fW)#XdMbkER%^<KJh
> z;*##3xTISsE<0%%rsakIOTH1JvF&s@ZCXyp3uLFw;#In~lG$mj>-c=%+OriWV--Ir
> z@Ap?=`e(JJ(t1RHN6FE5l?iI5sKEvS2tWV=5P$##AOHafKmY;|fWWW{<mtrl{6DOh
> z7v}{52tWV=5P$##AOHafKmY;|U;#Y;<3@l01Rwwb2tWV=5P$##AOHaf48H)L|A+q?
> z;|w7H0SG_<0uX=z1Rwwb2tWV=c>c#d009U<00Izz00bZa0SG_<0uUH}0X+W?|24)L
> zLI45~fB*y_009U<00Izz00ij&|2HRpH1roX2tWV=5P$##AOHafKmY;|fB*zuk3h>D
> zExFsdFN1#n`o?DG@A=!mz4-R0mFHhS{`aGMCw_gf{mystq@1=2M|VElc{X7l7&S-a
> z;q0N#(b>ECcfWb-&&$6&y8G8Z_h0;R>*tJVW~XMJ>|DC|(5t=u;D?(BCuVNYzyF()
> mPYwNr4FV8=00bZa0SG_<0uX=z1Rwx`ArdHzl*W_aDEtSkqPYeD
>
> diff --git a/meta/recipes-support/nss/nss/disable-Wvarargs-with-clang.patch b/meta/recipes-support/nss/nss/disable-Wvarargs-with-clang.patch
> deleted file mode 100644
> index de812d27ba..0000000000
> --- a/meta/recipes-support/nss/nss/disable-Wvarargs-with-clang.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -clang 3.9 add this warning to rightly flag undefined
> -behavior, we relegate this to be just a warning instead
> -of error and keep the behavior as it was. Right fix would
> -be to not pass enum to the function with variadic arguments
> -as last named argument
> -
> -Fixes errors like
> -ocsp.c:2220:22: error: passing an object that undergoes default argument promotion to 'va_start' has undefined behavior [-Werror,-Wvarargs]
> -        va_start(ap, responseType0);
> -                     ^
> -ocsp.c:2200:43: note: parameter of type 'SECOidTag' is declared here
> -                                SECOidTag responseType0, ...)
> -
> -see
> -https://www.securecoding.cert.org/confluence/display/cplusplus/EXP58-CPP.+Pass+an+object+of+the+correct+type+to+va_start
> -for more details
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Upstream-Status: Pending
> -
> -Index: nss-3.37.1/nss/coreconf/Werror.mk
> -===================================================================
> ---- nss-3.37.1.orig/nss/coreconf/Werror.mk
> -+++ nss-3.37.1/nss/coreconf/Werror.mk
> -@@ -56,7 +56,7 @@ ifndef WARNING_CFLAGS
> -     ifdef CC_IS_CLANG
> -       # -Qunused-arguments : clang objects to arguments that it doesn't understand
> -       #    and fixing this would require rearchitecture
> --      WARNING_CFLAGS += -Qunused-arguments
> -+      WARNING_CFLAGS += -Qunused-arguments -Wno-error=varargs
> -       # -Wno-parentheses-equality : because clang warns about macro expansions
> -       WARNING_CFLAGS += $(call disable_warning,parentheses-equality)
> -       ifdef BUILD_OPT
> diff --git a/meta/recipes-support/nss/nss/nss-fix-incorrect-shebang-of-perl.patch b/meta/recipes-support/nss/nss/nss-fix-incorrect-shebang-of-perl.patch
> deleted file mode 100644
> index 547594d5b6..0000000000
> --- a/meta/recipes-support/nss/nss/nss-fix-incorrect-shebang-of-perl.patch
> +++ /dev/null
> @@ -1,110 +0,0 @@
> -nss: fix incorrect shebang of perl
> -
> -Replace incorrect shebang of perl with `#!/usr/bin/env perl'.
> -
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> -Upstream-Status: Pending
> ----
> - nss/cmd/smimetools/smime  | 2 +-
> - nss/coreconf/cpdist.pl    | 2 +-
> - nss/coreconf/import.pl    | 2 +-
> - nss/coreconf/jniregen.pl  | 2 +-
> - nss/coreconf/outofdate.pl | 2 +-
> - nss/coreconf/release.pl   | 2 +-
> - nss/coreconf/version.pl   | 2 +-
> - nss/tests/clean_tbx       | 2 +-
> - nss/tests/path_uniq       | 2 +-
> - 9 files changed, 9 insertions(+), 9 deletions(-)
> -
> -diff --git a/nss/cmd/smimetools/smime b/nss/cmd/smimetools/smime
> ---- a/nss/cmd/smimetools/smime
> -+++ b/nss/cmd/smimetools/smime
> -@@ -1,4 +1,4 @@
> --#!/usr/local/bin/perl
> -+#!/usr/bin/env perl
> -
> - # This Source Code Form is subject to the terms of the Mozilla Public
> - # License, v. 2.0. If a copy of the MPL was not distributed with this
> -diff --git a/nss/coreconf/cpdist.pl b/nss/coreconf/cpdist.pl
> -index 800edfb..652187f 100755
> ---- a/nss/coreconf/cpdist.pl
> -+++ b/nss/coreconf/cpdist.pl
> -@@ -1,4 +1,4 @@
> --#! /usr/local/bin/perl
> -+#!/usr/bin/env perl
> - #
> - # This Source Code Form is subject to the terms of the Mozilla Public
> - # License, v. 2.0. If a copy of the MPL was not distributed with this
> -diff --git a/nss/coreconf/import.pl b/nss/coreconf/import.pl
> -index dd2d177..428eaa5 100755
> ---- a/nss/coreconf/import.pl
> -+++ b/nss/coreconf/import.pl
> -@@ -1,4 +1,4 @@
> --#! /usr/local/bin/perl
> -+#!/usr/bin/env perl
> - #
> - # This Source Code Form is subject to the terms of the Mozilla Public
> - # License, v. 2.0. If a copy of the MPL was not distributed with this
> -diff --git a/nss/coreconf/jniregen.pl b/nss/coreconf/jniregen.pl
> -index 2039180..5f4f69c 100755
> ---- a/nss/coreconf/jniregen.pl
> -+++ b/nss/coreconf/jniregen.pl
> -@@ -1,4 +1,4 @@
> --#!/usr/local/bin/perl
> -+#!/usr/bin/env perl
> - #
> - # This Source Code Form is subject to the terms of the Mozilla Public
> - # License, v. 2.0. If a copy of the MPL was not distributed with this
> -diff --git a/nss/coreconf/outofdate.pl b/nss/coreconf/outofdate.pl
> -index 33d80bb..01fc097 100755
> ---- a/nss/coreconf/outofdate.pl
> -+++ b/nss/coreconf/outofdate.pl
> -@@ -1,4 +1,4 @@
> --#!/usr/local/bin/perl
> -+#!/usr/bin/env perl
> - #
> - # This Source Code Form is subject to the terms of the Mozilla Public
> - # License, v. 2.0. If a copy of the MPL was not distributed with this
> -diff --git a/nss/coreconf/release.pl b/nss/coreconf/release.pl
> -index 7cde19d..b5df2f6 100755
> ---- a/nss/coreconf/release.pl
> -+++ b/nss/coreconf/release.pl
> -@@ -1,4 +1,4 @@
> --#! /usr/local/bin/perl
> -+#!/usr/bin/env perl
> - #
> - # This Source Code Form is subject to the terms of the Mozilla Public
> - # License, v. 2.0. If a copy of the MPL was not distributed with this
> -diff --git a/nss/coreconf/version.pl b/nss/coreconf/version.pl
> -index d2a4942..79359fe 100644
> ---- a/nss/coreconf/version.pl
> -+++ b/nss/coreconf/version.pl
> -@@ -1,4 +1,4 @@
> --#!/usr/sbin/perl
> -+#!/usr/bin/env perl
> - #
> - # This Source Code Form is subject to the terms of the Mozilla Public
> - # License, v. 2.0. If a copy of the MPL was not distributed with this
> -diff --git a/nss/tests/clean_tbx b/nss/tests/clean_tbx
> -index 4de9555..a7def9f 100755
> ---- a/nss/tests/clean_tbx
> -+++ b/nss/tests/clean_tbx
> -@@ -1,4 +1,4 @@
> --#! /bin/perl
> -+#!/usr/bin/env perl
> -
> - #######################################################################
> - #
> -diff --git a/nss/tests/path_uniq b/nss/tests/path_uniq
> -index f29f60a..08fbffa 100755
> ---- a/nss/tests/path_uniq
> -+++ b/nss/tests/path_uniq
> -@@ -1,4 +1,4 @@
> --#! /bin/perl
> -+#!/usr/bin/env perl
> -
> - ########################################################################
> - #
> ---
> -1.8.1.2
> -
> diff --git a/meta/recipes-support/nss/nss/nss-fix-nsinstall-build.patch b/meta/recipes-support/nss/nss/nss-fix-nsinstall-build.patch
> deleted file mode 100644
> index 43c09d13ea..0000000000
> --- a/meta/recipes-support/nss/nss/nss-fix-nsinstall-build.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -Fix nss multilib build on openSUSE 11.x 32bit
> -
> -While building lib64-nss on openSUSE 11.x 32bit, the nsinstall will
> -fail with error:
> -
> -* nsinstall.c:1:0: sorry, unimplemented: 64-bit mode not compiled
> -
> -It caused by the '-m64' option which passed to host gcc.
> -
> -The nsinstall was built first while nss starting to build, it only runs
> -on host to install built files, it doesn't need any cross-compling or
> -multilib build options. Just clean the ARCHFLAG and LDFLAGS to fix this
> -error.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> -===================================================
> -Index: nss-3.24/nss/coreconf/nsinstall/Makefile
> -===================================================================
> ---- nss-3.24.orig/nss/coreconf/nsinstall/Makefile
> -+++ nss-3.24/nss/coreconf/nsinstall/Makefile
> -@@ -18,6 +18,13 @@ INTERNAL_TOOLS  = 1
> -
> - include $(DEPTH)/coreconf/config.mk
> -
> -+# nsinstall is unfit for cross-compiling/multilib-build since it was
> -+# always run on local host to install built files. This change intends
> -+# to clean the '-m64' from ARCHFLAG and LDFLAGS.
> -+ARCHFLAG =
> -+LDFLAGS =
> -+# CFLAGS =
> -+
> - ifeq (,$(filter-out OS2 WIN%,$(OS_TARGET)))
> - PROGRAM               =
> - else
> diff --git a/meta/recipes-support/nss/nss/nss-no-rpath-for-cross-compiling.patch b/meta/recipes-support/nss/nss/nss-no-rpath-for-cross-compiling.patch
> deleted file mode 100644
> index 7661dc93a0..0000000000
> --- a/meta/recipes-support/nss/nss/nss-no-rpath-for-cross-compiling.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -nss:no rpath for cross compiling
> -
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> -Upstream-Status: Inappropriate [configuration]
> ----
> - nss/cmd/platlibs.mk | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/nss/cmd/platlibs.mk b/nss/cmd/platlibs.mk
> ---- a/nss/cmd/platlibs.mk
> -+++ b/nss/cmd/platlibs.mk
> -@@ -18,9 +18,9 @@ endif
> -
> - ifeq ($(OS_ARCH), Linux)
> - ifeq ($(USE_64), 1)
> --EXTRA_SHARED_LIBS += -Wl,-rpath,'$$ORIGIN/../lib64:/opt/sun/private/lib64:$$ORIGIN/../lib'
> -+#EXTRA_SHARED_LIBS += -Wl,-rpath,'$$ORIGIN/../lib64:/opt/sun/private/lib64:$$ORIGIN/../lib'
> - else
> --EXTRA_SHARED_LIBS += -Wl,-rpath,'$$ORIGIN/../lib:/opt/sun/private/lib'
> -+#EXTRA_SHARED_LIBS += -Wl,-rpath,'$$ORIGIN/../lib:/opt/sun/private/lib'
> - endif
> - endif
> -
> ---
> -1.8.1.2
> -
> diff --git a/meta/recipes-support/nss/nss/nss.pc.in b/meta/recipes-support/nss/nss/nss.pc.in
> deleted file mode 100644
> index 402b4ecb33..0000000000
> --- a/meta/recipes-support/nss/nss/nss.pc.in
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -prefix=OEPREFIX
> -exec_prefix=OEEXECPREFIX
> -libdir=OELIBDIR
> -includedir=OEINCDIR
> -
> -Name: NSS
> -Description: Network Security Services
> -Version: %NSS_VERSION%
> -Requires: nspr >= %NSPR_VERSION%
> -Libs: -L${libdir} -lssl3 -lsmime3 -lnss3 -lsoftokn3 -lnssutil3
> -Cflags: -IOEINCDIR
> diff --git a/meta/recipes-support/nss/nss/pqg.c-ULL_addend.patch b/meta/recipes-support/nss/nss/pqg.c-ULL_addend.patch
> deleted file mode 100644
> index 3a817faaa6..0000000000
> --- a/meta/recipes-support/nss/nss/pqg.c-ULL_addend.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -nss does not build on mips with clang because wrong types are used?
> -
> -pqg.c:339:16: error: comparison of constant 18446744073709551615 with expression of type 'unsigned long' is always true [-Werror,-Wtautological-constant-out-of-range-compare]
> -     if (addend < MP_DIGIT_MAX) {
> -       ~~~~~~ ^ ~~~~~~~~~~~~
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Upstream-Status: Pending
> -Index: nss-3.37.1/nss/lib/freebl/pqg.c
> -===================================================================
> ---- nss-3.37.1.orig/nss/lib/freebl/pqg.c
> -+++ nss-3.37.1/nss/lib/freebl/pqg.c
> -@@ -326,8 +326,8 @@ generate_h_candidate(SECItem *hit, mp_in
> -
> - static SECStatus
> - addToSeed(const SECItem *seed,
> --          unsigned long addend,
> --          int seedlen, /* g in 186-1 */
> -+          unsigned long long  addend,
> -+          int                 seedlen, /* g in 186-1 */
> -           SECItem *seedout)
> - {
> -     mp_int s, sum, modulus, tmp;
> diff --git a/meta/recipes-support/nss/nss/signlibs.sh b/meta/recipes-support/nss/nss/signlibs.sh
> deleted file mode 100644
> index a74e499f8c..0000000000
> --- a/meta/recipes-support/nss/nss/signlibs.sh
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -#!/bin/sh
> -
> -# signlibs.sh
> -#
> -# (c)2010 Wind River Systems, Inc.
> -#
> -# regenerates the .chk files for the NSS libraries that require it
> -# since the ones that are built have incorrect checksums that were
> -# calculated on the host where they really need to be done on the
> -# target
> -
> -CHK_FILES=`ls /lib*/*.chk /usr/lib*/*.chk 2>/dev/null`
> -SIGN_BINARY=`which shlibsign`
> -for I in $CHK_FILES
> -do
> -       DN=`dirname $I`
> -       BN=`basename $I .chk`
> -       FN=$DN/$BN.so
> -       $SIGN_BINARY -i $FN
> -done
> diff --git a/meta/recipes-support/nss/nss/system-pkcs11.txt b/meta/recipes-support/nss/nss/system-pkcs11.txt
> deleted file mode 100644
> index 1a264e9cc4..0000000000
> --- a/meta/recipes-support/nss/nss/system-pkcs11.txt
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -library=
> -name=NSS Internal PKCS #11 Module
> -parameters=configdir='sql:/etc/pki/nssdb' certPrefix='' keyPrefix='' secmod='secmod.db' flags= updatedir='' updateCertPrefix='' updateKeyPrefix='' updateid='' updateTokenDescription=''
> -NSS=Flags=internal,critical trustOrder=75 cipherOrder=100 slotParams=(1={slotFlags=[ECC,RSA,DSA,DH,RC2,RC4,DES,RANDOM,SHA1,MD5,MD2,SSL,TLS,AES,Camellia,SEED,SHA256,SHA512] askpw=any timeout=30})
> -
> diff --git a/meta/recipes-support/nss/nss_3.50.bb b/meta/recipes-support/nss/nss_3.50.bb
> deleted file mode 100644
> index e9855d7a7e..0000000000
> --- a/meta/recipes-support/nss/nss_3.50.bb
> +++ /dev/null
> @@ -1,273 +0,0 @@
> -SUMMARY = "Mozilla's SSL and TLS implementation"
> -DESCRIPTION = "Network Security Services (NSS) is a set of libraries \
> -designed to support cross-platform development of \
> -security-enabled client and server applications. \
> -Applications built with NSS can support SSL v2 and v3, \
> -TLS, PKCS 5, PKCS 7, PKCS 11, PKCS 12, S/MIME, X.509 \
> -v3 certificates, and other security standards."
> -HOMEPAGE = "http://www.mozilla.org/projects/security/pki/nss/"
> -SECTION = "libs"
> -
> -DEPENDS = "sqlite3 nspr zlib nss-native"
> -DEPENDS_class-native = "sqlite3-native nspr-native zlib-native"
> -
> -LICENSE = "MPL-2.0 | (MPL-2.0 & GPL-2.0+) | (MPL-2.0 & LGPL-2.1+)"
> -
> -LIC_FILES_CHKSUM = "file://nss/COPYING;md5=3b1e88e1b9c0b5a4b2881d46cce06a18 \
> -                    file://nss/lib/freebl/mpi/doc/LICENSE;md5=491f158d09d948466afce85d6f1fe18f \
> -                    file://nss/lib/freebl/mpi/doc/LICENSE-MPL;md5=5d425c8f3157dbf212db2ec53d9e5132"
> -
> -VERSION_DIR = "${@d.getVar('BP').upper().replace('-', '_').replace('.', '_') + '_RTM'}"
> -
> -SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSION_DIR}/src/${BP}.tar.gz \
> -           file://nss.pc.in \
> -           file://signlibs.sh \
> -           file://0001-nss-fix-support-cross-compiling.patch \
> -           file://nss-no-rpath-for-cross-compiling.patch \
> -           file://nss-fix-incorrect-shebang-of-perl.patch \
> -           file://disable-Wvarargs-with-clang.patch \
> -           file://pqg.c-ULL_addend.patch \
> -           file://blank-cert9.db \
> -           file://blank-key4.db \
> -           file://system-pkcs11.txt \
> -           file://nss-fix-nsinstall-build.patch \
> -           file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
> -           "
> -
> -SRC_URI[md5sum] = "e0366615e12b147cebc136c915baea37"
> -SRC_URI[sha256sum] = "185df319775243f5f5daa9d49b7f9cc5f2b389435be3247c3376579bee063ba7"
> -
> -UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
> -UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
> -
> -inherit siteinfo
> -
> -TD = "${S}/tentative-dist"
> -TDS = "${S}/tentative-dist-staging"
> -
> -TARGET_CC_ARCH += "${LDFLAGS}"
> -
> -do_configure_prepend_libc-musl () {
> -    sed -i -e '/-DHAVE_SYS_CDEFS_H/d' ${S}/nss/lib/dbm/config/config.mk
> -}
> -
> -do_compile_prepend_class-native() {
> -    export NSPR_INCLUDE_DIR=${STAGING_INCDIR_NATIVE}/nspr
> -    export NSPR_LIB_DIR=${STAGING_LIBDIR_NATIVE}
> -    export NSS_ENABLE_WERROR=0
> -}
> -
> -do_compile_prepend_class-nativesdk() {
> -    export LDFLAGS=""
> -}
> -
> -do_compile_prepend_class-native() {
> -    # Need to set RPATH so that chrpath will do its job correctly
> -    RPATH="-Wl,-rpath-link,${STAGING_LIBDIR_NATIVE} -Wl,-rpath-link,${STAGING_BASE_LIBDIR_NATIVE} -Wl,-rpath,${STAGING_LIBDIR_NATIVE} -Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE}"
> -}
> -
> -do_compile() {
> -    export NSPR_INCLUDE_DIR=${STAGING_INCDIR}/nspr
> -
> -    export CROSS_COMPILE=1
> -    export NATIVE_CC="${BUILD_CC}"
> -    # Additional defines needed on Centos 7
> -    export NATIVE_FLAGS="${BUILD_CFLAGS} -DLINUX -Dlinux"
> -    export BUILD_OPT=1
> -
> -    export FREEBL_NO_DEPEND=1
> -    export FREEBL_LOWHASH=1
> -
> -    export LIBDIR=${libdir}
> -    export MOZILLA_CLIENT=1
> -    export NS_USE_GCC=1
> -    export NSS_USE_SYSTEM_SQLITE=1
> -    export NSS_ENABLE_ECC=1
> -
> -    ${@bb.utils.contains("TUNE_FEATURES", "crypto", "export NSS_USE_ARM_HW_CRYPTO=1", "", d)}
> -
> -    export OS_RELEASE=3.4
> -    export OS_TARGET=Linux
> -    export OS_ARCH=Linux
> -
> -    if [ "${TARGET_ARCH}" = "powerpc" ]; then
> -        OS_TEST=ppc
> -    elif [ "${TARGET_ARCH}" = "powerpc64" ]; then
> -        OS_TEST=ppc64
> -    elif [ "${TARGET_ARCH}" = "mips" -o "${TARGET_ARCH}" = "mipsel" -o "${TARGET_ARCH}" = "mips64" -o "${TARGET_ARCH}" = "mips64el" ]; then
> -        OS_TEST=mips
> -    elif [ "${TARGET_ARCH}" = "aarch64_be" ]; then
> -        OS_TEST="aarch64"
> -    else
> -        OS_TEST="${TARGET_ARCH}"
> -    fi
> -
> -    if [ "${SITEINFO_BITS}" = "64" ]; then
> -        export USE_64=1
> -    elif [ "${TARGET_ARCH}" = "x86_64" -a "${SITEINFO_BITS}" = "32" ]; then
> -        export USE_X32=1
> -    fi
> -
> -    export NSS_DISABLE_GTESTS=1
> -
> -    # We can modify CC in the environment, but if we set it via an
> -    # argument to make, nsinstall, a host program, will also build with it!
> -    #
> -    # nss pretty much does its own thing with CFLAGS, so we put them into CC.
> -    # Optimization will get clobbered, but most of the stuff will survive.
> -    # The motivation for this is to point to the correct place for debug
> -    # source files and CFLAGS does that.  Nothing uses CCC.
> -    #
> -    export CC="${CC} ${CFLAGS}"
> -    make -C ./nss CCC="${CXX} -g" \
> -        OS_TEST=${OS_TEST} \
> -        RPATH="${RPATH}"
> -}
> -
> -do_compile[vardepsexclude] += "SITEINFO_BITS"
> -
> -do_install_prepend_class-nativesdk() {
> -    export LDFLAGS=""
> -}
> -
> -do_install() {
> -    export CROSS_COMPILE=1
> -    export NATIVE_CC="${BUILD_CC}"
> -    export BUILD_OPT=1
> -
> -    export FREEBL_NO_DEPEND=1
> -
> -    export LIBDIR=${libdir}
> -    export MOZILLA_CLIENT=1
> -    export NS_USE_GCC=1
> -    export NSS_USE_SYSTEM_SQLITE=1
> -    export NSS_ENABLE_ECC=1
> -
> -    export OS_RELEASE=3.4
> -    export OS_TARGET=Linux
> -    export OS_ARCH=Linux
> -
> -    if [ "${TARGET_ARCH}" = "powerpc" ]; then
> -        OS_TEST=ppc
> -    elif [ "${TARGET_ARCH}" = "powerpc64" ]; then
> -        OS_TEST=ppc64
> -    elif [ "${TARGET_ARCH}" = "mips" -o "${TARGET_ARCH}" = "mipsel" -o "${TARGET_ARCH}" = "mips64" -o "${TARGET_ARCH}" = "mips64el" ]; then
> -        OS_TEST=mips
> -    elif [ "${TARGET_ARCH}" = "aarch64_be" ]; then
> -        CPU_ARCH=aarch64
> -        OS_TEST="aarch64"
> -    else
> -        OS_TEST="${TARGET_ARCH}"
> -    fi
> -    if [ "${SITEINFO_BITS}" = "64" ]; then
> -        export USE_64=1
> -    elif [ "${TARGET_ARCH}" = "x86_64" -a "${SITEINFO_BITS}" = "32" ]; then
> -        export USE_X32=1
> -    fi
> -
> -    export NSS_DISABLE_GTESTS=1
> -
> -    make -C ./nss \
> -        CCC="${CXX}" \
> -        OS_TEST=${OS_TEST} \
> -        SOURCE_LIB_DIR="${TD}/${libdir}" \
> -        SOURCE_BIN_DIR="${TD}/${bindir}" \
> -        install
> -
> -    install -d ${D}/${libdir}/
> -    for file in ${S}/dist/*.OBJ/lib/*.so; do
> -        echo "Installing `basename $file`..."
> -        cp $file  ${D}/${libdir}/
> -    done
> -
> -    for shared_lib in ${TD}/${libdir}/*.so.*; do
> -        if [ -f $shared_lib ]; then
> -            cp $shared_lib ${D}/${libdir}
> -            ln -sf $(basename $shared_lib) ${D}/${libdir}/$(basename $shared_lib .1oe)
> -        fi
> -    done
> -    for shared_lib in ${TD}/${libdir}/*.so; do
> -        if [ -f $shared_lib -a ! -e ${D}/${libdir}/$shared_lib ]; then
> -            cp $shared_lib ${D}/${libdir}
> -        fi
> -    done
> -
> -    install -d ${D}/${includedir}/nss3
> -    install -m 644 -t ${D}/${includedir}/nss3 dist/public/nss/*
> -
> -    install -d ${D}/${bindir}
> -    for binary in ${TD}/${bindir}/*; do
> -        install -m 755 -t ${D}/${bindir} $binary
> -    done
> -}
> -
> -do_install[vardepsexclude] += "SITEINFO_BITS"
> -
> -do_install_append() {
> -    # Create empty .chk files for the NSS libraries at build time. They could
> -    # be regenerated at target's boot time.
> -    for file in libsoftokn3.chk libfreebl3.chk libnssdbm3.chk; do
> -        touch ${D}/${libdir}/$file
> -        chmod 755 ${D}/${libdir}/$file
> -    done
> -    install -D -m 755 ${WORKDIR}/signlibs.sh ${D}/${bindir}/signlibs.sh
> -
> -    install -d ${D}${libdir}/pkgconfig/
> -    sed 's/%NSS_VERSION%/${PV}/' ${WORKDIR}/nss.pc.in | sed 's/%NSPR_VERSION%/4.9.2/' > ${D}${libdir}/pkgconfig/nss.pc
> -    sed -i s:OEPREFIX:${prefix}:g ${D}${libdir}/pkgconfig/nss.pc
> -    sed -i s:OEEXECPREFIX:${exec_prefix}:g ${D}${libdir}/pkgconfig/nss.pc
> -    sed -i s:OELIBDIR:${libdir}:g ${D}${libdir}/pkgconfig/nss.pc
> -    sed -i s:OEINCDIR:${includedir}/nss3:g ${D}${libdir}/pkgconfig/nss.pc
> -}
> -
> -do_install_append_class-target() {
> -    # It used to call certutil to create a blank certificate with empty password at
> -    # build time, but the checksum of key4.db changes every time when certutil is called.
> -    # It causes non-determinism issue, so provide databases with a blank certificate
> -    # which are originally from output of nss in qemux86-64 build. You can get these
> -    # databases by:
> -    # certutil -N -d sql:/database/path/ --empty-password
> -    install -d ${D}${sysconfdir}/pki/nssdb/
> -    install -m 0644 ${WORKDIR}/blank-cert9.db ${D}${sysconfdir}/pki/nssdb/cert9.db
> -    install -m 0644 ${WORKDIR}/blank-key4.db ${D}${sysconfdir}/pki/nssdb/key4.db
> -    install -m 0644 ${WORKDIR}/system-pkcs11.txt ${D}${sysconfdir}/pki/nssdb/pkcs11.txt
> -}
> -
> -PACKAGE_WRITE_DEPS += "nss-native"
> -pkg_postinst_${PN} () {
> -    if [ -n "$D" ]; then
> -        for I in $D${libdir}/lib*.chk; do
> -            DN=`dirname $I`
> -            BN=`basename $I .chk`
> -            FN=$DN/$BN.so
> -            shlibsign -i $FN
> -            if [ $? -ne 0 ]; then
> -                exit 1
> -            fi
> -        done
> -    else
> -        signlibs.sh
> -    fi
> -}
> -
> -PACKAGES =+ "${PN}-smime"
> -FILES_${PN}-smime = "\
> -    ${bindir}/smime \
> -"
> -
> -FILES_${PN} = "\
> -    ${sysconfdir} \
> -    ${bindir} \
> -    ${libdir}/lib*.chk \
> -    ${libdir}/lib*.so \
> -    "
> -
> -FILES_${PN}-dev = "\
> -    ${libdir}/nss \
> -    ${libdir}/pkgconfig/* \
> -    ${includedir}/* \
> -    "
> -
> -RDEPENDS_${PN}-smime = "perl"
> -
> -BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

