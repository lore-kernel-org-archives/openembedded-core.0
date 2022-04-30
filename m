Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57D20C433EF
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 14:44:19 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web09.22864.1651329852708716852
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Apr 2022 07:44:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N6MVDDaQ;
 spf=pass (domain: gmail.com, ip: 209.85.160.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id y3so7730584qtn.8
        for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Apr 2022 07:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1GQlCQiQkSONHiihCGuZ+PwyL5DJbHlxN0rzT9v/1LI=;
        b=N6MVDDaQdTnWw2QFy1VBnBIV2UU9ioKUWonfBugCHoniRzyP0586TzXUa4PW3tX8XV
         UZodkkoRPpECxSPlJghdmWPMamx4s5DVAPwRTxnuObJqk5/B6ULUx9bSNITsz/GZNzGP
         7R1IuIfoAna5C4H+CMCrFUprPIncHobZfv7y2Ii/2rCleT0D0nGPOE3xGqstVrv2rFNl
         EL0Irw3LbrwaR+GgTGIkNWoYqgbCfz2J3lL42E+L2tY0jW9lj2K8Q/W9cOvJJflrfbgh
         g2ZD/It0nyCyPydLc39A369NKhIBqwS6wSXcvOVkddAhe35elpx8ME87jIYBQwwI4wb8
         HyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1GQlCQiQkSONHiihCGuZ+PwyL5DJbHlxN0rzT9v/1LI=;
        b=LheXwYpObLQOnYjMLHiUi8yYreH97FYh9AN+iw/zQssbb7vR4tt5dS8EwSihlXEmpK
         nzdd6/tA81SIj8Dr/Hsi6NDqSs9PV1WoHr95x2Gu5R5gh1MlBSVq61y96taSnvxBzxe/
         kLHVA24WIk8nGjPNGIiosnX+tmyVnIFMXltlZt8iQ0xzPs7EZgwHlhnzrhlz8/ueSrUX
         vrcqrwovXn7wjadHw1q1Whm51xWvBNLagJ+peOtQ/KOk+FpF6t6BgfHZ1fF7yNyPWTuv
         zuTpiWEOWt9FoPItvvKATWF3GgRilmwMw0pDFLpZlHFG8xOlwhLmXjGB9Ho2o/4WVO88
         D8ag==
X-Gm-Message-State: AOAM5317NDtvW1bX8yp9LtkwTTaydIRvJh6FF00DcJRRTPrmh8UTHB/H
	n8irHkxb2LcatUhaSsTXkK765pri3mAzBh6zmEP97UGGxGc=
X-Google-Smtp-Source: 
 ABdhPJxsnTqqtgzF/po5/+IcKo155ow0GMZbqaejADYPJ+5xwhlVacB7kdviFl32VY/BA7lBXj0adKB+RGLFuhUrDeU=
X-Received: by 2002:ac8:7f86:0:b0:2f3:953f:6036 with SMTP id
 z6-20020ac87f86000000b002f3953f6036mr3676768qtj.330.1651329851576; Sat, 30
 Apr 2022 07:44:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220430140804.1597722-1-robert.joslyn@redrectangle.org>
In-Reply-To: <20220430140804.1597722-1-robert.joslyn@redrectangle.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 30 Apr 2022 07:44:00 -0700
Message-ID: 
 <CAMKF1soHn+soX1OLXNUq5U-AukQMir7zYybH0vduPQT5Y=O3OQ@mail.gmail.com>
Subject: Re: [OE-core] [master][kirkstone][PATCH] powerpc: Remove invalid
 GLIBC_EXTRA_OECONF
To: Robert Joslyn <robert.joslyn@redrectangle.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000035d33e05dde03101"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Apr 2022 14:44:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165070

--00000000000035d33e05dde03101
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 30, 2022 at 7:11 AM Robert Joslyn <
robert.joslyn@redrectangle.org> wrote:

> OE-core previously carried patches to glibc that added optimized sqrt
> implementations for various PowerPC chips. These were recently removed,
> which now results in errors when compiling glibc with certian PowerPC
> machine tunes:
>
>         checking sysdep dirs... configure: error: The 603e subspecies of
> powerpc is not supported.
>
> Remove setting GLIBC_EXTRA_OECONF with parameters that are no longer
> valid. Also remove a commented out setting of the variable that probably
> isn't vaild anyway.
>
> Fixes: 2511e937f445 ("glibc: Drop ppc sqrt optimisations")
>

Ah thanks for patch yes it was forgotten


> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> ---
>  meta/conf/machine/include/powerpc/tune-ppc603e.inc   | 3 ---
>  meta/conf/machine/include/powerpc/tune-ppc7400.inc   | 3 ---
>  meta/conf/machine/include/powerpc/tune-ppce300c3.inc | 3 ---
>  meta/conf/machine/include/powerpc/tune-ppce500mc.inc | 3 ---
>  meta/conf/machine/include/powerpc/tune-ppce5500.inc  | 3 ---
>  meta/conf/machine/include/powerpc/tune-ppce6500.inc  | 4 ----
>  6 files changed, 19 deletions(-)
>
> diff --git a/meta/conf/machine/include/powerpc/tune-ppc603e.inc
> b/meta/conf/machine/include/powerpc/tune-ppc603e.inc
> index 8beec00f24..28680bdb3c 100644
> --- a/meta/conf/machine/include/powerpc/tune-ppc603e.inc
> +++ b/meta/conf/machine/include/powerpc/tune-ppc603e.inc
> @@ -9,6 +9,3 @@ AVAILTUNES += "ppc603e"
>  TUNE_FEATURES:tune-ppc603e = "m32 fpu-hard ppc603e bigendian"
>  TUNE_PKGARCH:tune-ppc603e = "ppc603e"
>  PACKAGE_EXTRA_ARCHS:tune-ppc603e = "${PACKAGE_EXTRA_ARCHS:tune-powerpc}
> ppc603e"
> -
> -# glibc configure options to get 603e specific library (for sqrt)
> -GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'ppc603e',
> '-with-cpu=603e', '', d)}"
> diff --git a/meta/conf/machine/include/powerpc/tune-ppc7400.inc
> b/meta/conf/machine/include/powerpc/tune-ppc7400.inc
> index 1e2c9fc2ce..49b94f5ee1 100644
> --- a/meta/conf/machine/include/powerpc/tune-ppc7400.inc
> +++ b/meta/conf/machine/include/powerpc/tune-ppc7400.inc
> @@ -9,6 +9,3 @@ AVAILTUNES += "ppc7400"
>  TUNE_FEATURES:tune-ppc7400 = "m32 fpu-hard ppc7400 altivec bigendian"
>  TUNE_PKGARCH:tune-ppc7400 = "ppc7400"
>  PACKAGE_EXTRA_ARCHS:tune-ppc7400 = "${PACKAGE_EXTRA_ARCHS:tune-powerpc}
> ppc7400"
> -
> -# glibc configure options to get 7400 specific library (for sqrt)
> -#GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'ppc7400',
> '--with-cpu=power4', '', d)}"
> diff --git a/meta/conf/machine/include/powerpc/tune-ppce300c3.inc
> b/meta/conf/machine/include/powerpc/tune-ppce300c3.inc
> index b74b6ad976..31aff51af3 100644
> --- a/meta/conf/machine/include/powerpc/tune-ppce300c3.inc
> +++ b/meta/conf/machine/include/powerpc/tune-ppce300c3.inc
> @@ -11,9 +11,6 @@ TUNE_PKGARCH:tune-ppce300c3 = "ppce300c3"
>  PACKAGE_EXTRA_ARCHS:tune-ppce300c3 = "${PACKAGE_EXTRA_ARCHS:tune-powerpc}
> ppce300c3"
>  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ppce300c3', '
> -mcpu=e300c3', '', d)}"
>
> -# glibc config options to make use of e300c3 (603e) specific sqrt/sqrtf
> routines
> -GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'ppce300c3',
> '--with-cpu=e300c3', '', d)}"
> -
>  # soft-float
>  TUNEVALID[ppce300c3-nf] = "Enable ppce300c3 specific processor
> optimizations (no fpu)"
>  TUNE_FEATURES:tune-ppce300c3-nf = "${TUNE_FEATURES:tune-powerpc-nf}
> ppce300c3-nf"
> diff --git a/meta/conf/machine/include/powerpc/tune-ppce500mc.inc
> b/meta/conf/machine/include/powerpc/tune-ppce500mc.inc
> index e3524a10ca..036f8b2631 100644
> --- a/meta/conf/machine/include/powerpc/tune-ppce500mc.inc
> +++ b/meta/conf/machine/include/powerpc/tune-ppce500mc.inc
> @@ -10,8 +10,5 @@ TUNE_FEATURES:tune-ppce500mc = "m32 fpu-hard ppce500mc
> bigendian"
>  TUNE_PKGARCH:tune-ppce500mc = "ppce500mc"
>  PACKAGE_EXTRA_ARCHS:tune-ppce500mc = "${PACKAGE_EXTRA_ARCHS:tune-powerpc}
> ppce500mc"
>
> -# glibc configure options to get e500mc specific library (for sqrt)
> -GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'ppce500mc',
> '-with-cpu=e500mc', '', d)}"
> -
>  # pass -mcpu=e500mc for ppce500mc kernel cross compile
>  TARGET_CC_KERNEL_ARCH = "-mcpu=e500mc"
> diff --git a/meta/conf/machine/include/powerpc/tune-ppce5500.inc
> b/meta/conf/machine/include/powerpc/tune-ppce5500.inc
> index 2cf7b1737c..4915b81ee4 100644
> --- a/meta/conf/machine/include/powerpc/tune-ppce5500.inc
> +++ b/meta/conf/machine/include/powerpc/tune-ppce5500.inc
> @@ -16,8 +16,5 @@ BASE_LIB:tune-ppc64e5500 = "lib64"
>  TUNE_PKGARCH:tune-ppc64e5500 = "ppc64e5500"
>  PACKAGE_EXTRA_ARCHS:tune-ppc64e5500 =
> "${PACKAGE_EXTRA_ARCHS:tune-powerpc64} ppc64e5500"
>
> -# glibc configure options to get e5500 specific library (for sqrt)
> -GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'e5500',
> '--with-cpu=e5500', '', d)}"
> -
>  # QEMU usermode fails with invalid instruction error (YOCTO: #10304)
>  MACHINE_FEATURES_BACKFILL_CONSIDERED:append =
> "${@bb.utils.contains('TUNE_FEATURES', 'e5500', ' qemu-usermode', '', d)}"
> diff --git a/meta/conf/machine/include/powerpc/tune-ppce6500.inc
> b/meta/conf/machine/include/powerpc/tune-ppce6500.inc
> index e78de350ad..f6310ab4c4 100644
> --- a/meta/conf/machine/include/powerpc/tune-ppce6500.inc
> +++ b/meta/conf/machine/include/powerpc/tune-ppce6500.inc
> @@ -16,9 +16,5 @@ BASE_LIB:tune-ppc64e6500 = "lib64"
>  TUNE_PKGARCH:tune-ppc64e6500 = "ppc64e6500"
>  PACKAGE_EXTRA_ARCHS:tune-ppc64e6500 =
> "${PACKAGE_EXTRA_ARCHS:tune-powerpc64} ppc64e6500"
>
> -# glibc configure options to get e6500 specific library
> -GLIBC_EXTRA_OECONF:powerpc64 += "${@bb.utils.contains('TUNE_FEATURES',
> 'e6500', '--with-cpu=e6500', '', d)}"
> -GLIBC_EXTRA_OECONF:powerpc += "${@bb.utils.contains('TUNE_FEATURES',
> 'e6500', '--with-cpu=e6500', '', d)}"
> -
>  # QEMU usermode fails with invalid instruction error (YOCTO: #10304)
>  MACHINE_FEATURES_BACKFILL_CONSIDERED:append =
> "${@bb.utils.contains('TUNE_FEATURES', 'e6500', ' qemu-usermode', '', d)}"
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165069):
> https://lists.openembedded.org/g/openembedded-core/message/165069
> Mute This Topic: https://lists.openembedded.org/mt/90796368/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000035d33e05dde03101
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Apr 30, 2022 at 7:11 AM Robert Joslyn &lt;<a href=
=3D"mailto:robert.joslyn@redrectangle.org">robert.joslyn@redrectangle.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">OE-core previously ca=
rried patches to glibc that added optimized sqrt<br>
implementations for various PowerPC chips. These were recently removed,<br>
which now results in errors when compiling glibc with certian PowerPC<br>
machine tunes:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 checking sysdep dirs... configure: error: The 6=
03e subspecies of powerpc is not supported.<br>
<br>
Remove setting GLIBC_EXTRA_OECONF with parameters that are no longer<br>
valid. Also remove a commented out setting of the variable that probably<br=
>
isn&#39;t vaild anyway.<br>
<br>
Fixes: 2511e937f445 (&quot;glibc: Drop ppc sqrt optimisations&quot;)<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Ah thanks for pa=
tch yes it was forgotten</div><div dir=3D"auto"><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><br>
Signed-off-by: Robert Joslyn &lt;<a href=3D"mailto:robert.joslyn@redrectang=
le.org" target=3D"_blank">robert.joslyn@redrectangle.org</a>&gt;<br>
---<br>
=C2=A0meta/conf/machine/include/powerpc/tune-ppc603e.inc=C2=A0 =C2=A0| 3 --=
-<br>
=C2=A0meta/conf/machine/include/powerpc/tune-ppc7400.inc=C2=A0 =C2=A0| 3 --=
-<br>
=C2=A0meta/conf/machine/include/powerpc/tune-ppce300c3.inc | 3 ---<br>
=C2=A0meta/conf/machine/include/powerpc/tune-ppce500mc.inc | 3 ---<br>
=C2=A0meta/conf/machine/include/powerpc/tune-ppce5500.inc=C2=A0 | 3 ---<br>
=C2=A0meta/conf/machine/include/powerpc/tune-ppce6500.inc=C2=A0 | 4 ----<br=
>
=C2=A06 files changed, 19 deletions(-)<br>
<br>
diff --git a/meta/conf/machine/include/powerpc/tune-ppc603e.inc b/meta/conf=
/machine/include/powerpc/tune-ppc603e.inc<br>
index 8beec00f24..28680bdb3c 100644<br>
--- a/meta/conf/machine/include/powerpc/tune-ppc603e.inc<br>
+++ b/meta/conf/machine/include/powerpc/tune-ppc603e.inc<br>
@@ -9,6 +9,3 @@ AVAILTUNES +=3D &quot;ppc603e&quot;<br>
=C2=A0TUNE_FEATURES:tune-ppc603e =3D &quot;m32 fpu-hard ppc603e bigendian&q=
uot;<br>
=C2=A0TUNE_PKGARCH:tune-ppc603e =3D &quot;ppc603e&quot;<br>
=C2=A0PACKAGE_EXTRA_ARCHS:tune-ppc603e =3D &quot;${PACKAGE_EXTRA_ARCHS:tune=
-powerpc} ppc603e&quot;<br>
-<br>
-# glibc configure options to get 603e specific library (for sqrt)<br>
-GLIBC_EXTRA_OECONF +=3D &quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39;=
, &#39;ppc603e&#39;, &#39;-with-cpu=3D603e&#39;, &#39;&#39;, d)}&quot;<br>
diff --git a/meta/conf/machine/include/powerpc/tune-ppc7400.inc b/meta/conf=
/machine/include/powerpc/tune-ppc7400.inc<br>
index 1e2c9fc2ce..49b94f5ee1 100644<br>
--- a/meta/conf/machine/include/powerpc/tune-ppc7400.inc<br>
+++ b/meta/conf/machine/include/powerpc/tune-ppc7400.inc<br>
@@ -9,6 +9,3 @@ AVAILTUNES +=3D &quot;ppc7400&quot;<br>
=C2=A0TUNE_FEATURES:tune-ppc7400 =3D &quot;m32 fpu-hard ppc7400 altivec big=
endian&quot;<br>
=C2=A0TUNE_PKGARCH:tune-ppc7400 =3D &quot;ppc7400&quot;<br>
=C2=A0PACKAGE_EXTRA_ARCHS:tune-ppc7400 =3D &quot;${PACKAGE_EXTRA_ARCHS:tune=
-powerpc} ppc7400&quot;<br>
-<br>
-# glibc configure options to get 7400 specific library (for sqrt)<br>
-#GLIBC_EXTRA_OECONF +=3D &quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39=
;, &#39;ppc7400&#39;, &#39;--with-cpu=3Dpower4&#39;, &#39;&#39;, d)}&quot;<=
br>
diff --git a/meta/conf/machine/include/powerpc/tune-ppce300c3.inc b/meta/co=
nf/machine/include/powerpc/tune-ppce300c3.inc<br>
index b74b6ad976..31aff51af3 100644<br>
--- a/meta/conf/machine/include/powerpc/tune-ppce300c3.inc<br>
+++ b/meta/conf/machine/include/powerpc/tune-ppce300c3.inc<br>
@@ -11,9 +11,6 @@ TUNE_PKGARCH:tune-ppce300c3 =3D &quot;ppce300c3&quot;<br>
=C2=A0PACKAGE_EXTRA_ARCHS:tune-ppce300c3 =3D &quot;${PACKAGE_EXTRA_ARCHS:tu=
ne-powerpc} ppce300c3&quot;<br>
=C2=A0TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39;, =
&#39;ppce300c3&#39;, &#39; -mcpu=3De300c3&#39;, &#39;&#39;, d)}&quot;<br>
<br>
-# glibc config options to make use of e300c3 (603e) specific sqrt/sqrtf ro=
utines<br>
-GLIBC_EXTRA_OECONF +=3D &quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39;=
, &#39;ppce300c3&#39;, &#39;--with-cpu=3De300c3&#39;, &#39;&#39;, d)}&quot;=
<br>
-<br>
=C2=A0# soft-float<br>
=C2=A0TUNEVALID[ppce300c3-nf] =3D &quot;Enable ppce300c3 specific processor=
 optimizations (no fpu)&quot;<br>
=C2=A0TUNE_FEATURES:tune-ppce300c3-nf =3D &quot;${TUNE_FEATURES:tune-powerp=
c-nf} ppce300c3-nf&quot;<br>
diff --git a/meta/conf/machine/include/powerpc/tune-ppce500mc.inc b/meta/co=
nf/machine/include/powerpc/tune-ppce500mc.inc<br>
index e3524a10ca..036f8b2631 100644<br>
--- a/meta/conf/machine/include/powerpc/tune-ppce500mc.inc<br>
+++ b/meta/conf/machine/include/powerpc/tune-ppce500mc.inc<br>
@@ -10,8 +10,5 @@ TUNE_FEATURES:tune-ppce500mc =3D &quot;m32 fpu-hard ppce5=
00mc bigendian&quot;<br>
=C2=A0TUNE_PKGARCH:tune-ppce500mc =3D &quot;ppce500mc&quot;<br>
=C2=A0PACKAGE_EXTRA_ARCHS:tune-ppce500mc =3D &quot;${PACKAGE_EXTRA_ARCHS:tu=
ne-powerpc} ppce500mc&quot;<br>
<br>
-# glibc configure options to get e500mc specific library (for sqrt)<br>
-GLIBC_EXTRA_OECONF +=3D &quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39;=
, &#39;ppce500mc&#39;, &#39;-with-cpu=3De500mc&#39;, &#39;&#39;, d)}&quot;<=
br>
-<br>
=C2=A0# pass -mcpu=3De500mc for ppce500mc kernel cross compile<br>
=C2=A0TARGET_CC_KERNEL_ARCH =3D &quot;-mcpu=3De500mc&quot;<br>
diff --git a/meta/conf/machine/include/powerpc/tune-ppce5500.inc b/meta/con=
f/machine/include/powerpc/tune-ppce5500.inc<br>
index 2cf7b1737c..4915b81ee4 100644<br>
--- a/meta/conf/machine/include/powerpc/tune-ppce5500.inc<br>
+++ b/meta/conf/machine/include/powerpc/tune-ppce5500.inc<br>
@@ -16,8 +16,5 @@ BASE_LIB:tune-ppc64e5500 =3D &quot;lib64&quot;<br>
=C2=A0TUNE_PKGARCH:tune-ppc64e5500 =3D &quot;ppc64e5500&quot;<br>
=C2=A0PACKAGE_EXTRA_ARCHS:tune-ppc64e5500 =3D &quot;${PACKAGE_EXTRA_ARCHS:t=
une-powerpc64} ppc64e5500&quot;<br>
<br>
-# glibc configure options to get e5500 specific library (for sqrt)<br>
-GLIBC_EXTRA_OECONF +=3D &quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39;=
, &#39;e5500&#39;, &#39;--with-cpu=3De5500&#39;, &#39;&#39;, d)}&quot;<br>
-<br>
=C2=A0# QEMU usermode fails with invalid instruction error (YOCTO: #10304)<=
br>
=C2=A0MACHINE_FEATURES_BACKFILL_CONSIDERED:append =3D &quot;${@bb.utils.con=
tains(&#39;TUNE_FEATURES&#39;, &#39;e5500&#39;, &#39; qemu-usermode&#39;, &=
#39;&#39;, d)}&quot;<br>
diff --git a/meta/conf/machine/include/powerpc/tune-ppce6500.inc b/meta/con=
f/machine/include/powerpc/tune-ppce6500.inc<br>
index e78de350ad..f6310ab4c4 100644<br>
--- a/meta/conf/machine/include/powerpc/tune-ppce6500.inc<br>
+++ b/meta/conf/machine/include/powerpc/tune-ppce6500.inc<br>
@@ -16,9 +16,5 @@ BASE_LIB:tune-ppc64e6500 =3D &quot;lib64&quot;<br>
=C2=A0TUNE_PKGARCH:tune-ppc64e6500 =3D &quot;ppc64e6500&quot;<br>
=C2=A0PACKAGE_EXTRA_ARCHS:tune-ppc64e6500 =3D &quot;${PACKAGE_EXTRA_ARCHS:t=
une-powerpc64} ppc64e6500&quot;<br>
<br>
-# glibc configure options to get e6500 specific library<br>
-GLIBC_EXTRA_OECONF:powerpc64 +=3D &quot;${@bb.utils.contains(&#39;TUNE_FEA=
TURES&#39;, &#39;e6500&#39;, &#39;--with-cpu=3De6500&#39;, &#39;&#39;, d)}&=
quot;<br>
-GLIBC_EXTRA_OECONF:powerpc +=3D &quot;${@bb.utils.contains(&#39;TUNE_FEATU=
RES&#39;, &#39;e6500&#39;, &#39;--with-cpu=3De6500&#39;, &#39;&#39;, d)}&qu=
ot;<br>
-<br>
=C2=A0# QEMU usermode fails with invalid instruction error (YOCTO: #10304)<=
br>
=C2=A0MACHINE_FEATURES_BACKFILL_CONSIDERED:append =3D &quot;${@bb.utils.con=
tains(&#39;TUNE_FEATURES&#39;, &#39;e6500&#39;, &#39; qemu-usermode&#39;, &=
#39;&#39;, d)}&quot;<br>
-- <br>
2.35.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#165069): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/165069" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/165069</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90796368/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/90796368/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000035d33e05dde03101--

