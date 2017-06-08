Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3007D60778
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 10:55:00 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id k93so18406526ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jun 2017 03:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gtZ4Ig/ERrP9eLeGx2xVeYOU37PozCUO79DvA17LFIM=;
	b=nYE41g8JroW8pmo0qeFWIJ4e+peEHt0A6ducozu9osW7DzFZ6goUC5TGPJvLfoNLm1
	/DN372pjlyR3bu2cxNJdBqCs4K7lOARIfpnoWAwQNQS88hOAZa9ZHB6yOXBt1hxTnZvm
	2XEqLhdllOK3ahjPCk9j8sUKl9ta/Rm5XNKMJcK3jdAED+F9wE4GZqVcEybVDMqYm1Ps
	DuxIyw3lsOv0CFEixzCyXhBlkmI2FDYLmBH17YY8q1WpjP4ajUXv0a2wFw83WtW+Q/jp
	xbL9e5TY1ehaYRhyWwEDPTVmEr8qYjrYyc63elFcl3ypDqFhLtnygGrWVgwregYna3DS
	8few==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gtZ4Ig/ERrP9eLeGx2xVeYOU37PozCUO79DvA17LFIM=;
	b=pukI8AHWdVOo6QmFFBkdcCj4OI8NGq1dSlf+sF9/AUdUBjjTqzJvY1j0H3Hwt2BuUJ
	4+CzUwU9bu34pu5d5RW62x/xNEKwhexjtCrXGifyBcsAaVTBBF8nAd0HUxZqeSkgj8MA
	0kUh4nxeBfecr8u+o7gFV8IsbzgchMk9uDYLzlMCzWkSIploLTiX03up12jsGXskY5DA
	EpgNAQrZzuBeVLbBxDOcGhNlPDXD9bgqT8FRzBkQQ2+zKoAEf7VYcwSb9qNy/iMWcVH0
	XhNl92njNEZzG4I1l8rNzbpUbOH6Z7h+9LriYMwTZligbCo4lnyLByKCUl2/VmdAEx8B
	GFbg==
X-Gm-Message-State: AODbwcDH+dNYxE1cJIoWpNpVizUjyLbGww8toRgFdEKYJPUwviFaAeiM
	pBu2v3PmjquEPBzWmYDE/N4e1gLxVGJD
X-Received: by 10.107.175.105 with SMTP id y102mr30323930ioe.38.1496919301991; 
	Thu, 08 Jun 2017 03:55:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.20.130 with HTTP; Thu, 8 Jun 2017 03:54:31 -0700 (PDT)
In-Reply-To: <1496909916-10483-1-git-send-email-changhyeok.bae@gmail.com>
References: <1496909916-10483-1-git-send-email-changhyeok.bae@gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 8 Jun 2017 13:54:31 +0300
Message-ID: <CAHiDW_EX=t=C-dzVkM60hrU7P04ftLFCCfXHo3BipuF+4AB9tQ@mail.gmail.com>
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Upgrade 1.0.2k -> 1.0.2l
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
X-List-Received-Date: Thu, 08 Jun 2017 10:55:01 -0000
Content-Type: multipart/alternative; boundary="001a11448e5040d114055170af8a"

--001a11448e5040d114055170af8a
Content-Type: text/plain; charset="UTF-8"

On 8 June 2017 at 11:18, Changhyeok Bae <changhyeok.bae@gmail.com> wrote:

> Patch fix-cipher-des-ede3-cfb1.patch was removed as it is included
> in this release.
>
> Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
> ---
>  .../openssl/openssl/fix-cipher-des-ede3-cfb1.patch  | 21
> ---------------------
>  .../{openssl_1.0.2k.bb => openssl_1.0.2l.bb}        |  7 +++----
>  2 files changed, 3 insertions(+), 25 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/fix-cipher-
> des-ede3-cfb1.patch
>  rename meta/recipes-connectivity/openssl/{openssl_1.0.2k.bb =>
> openssl_1.0.2l.bb} (90%)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb1.patch
> b/meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb1.patch
> deleted file mode 100644
> index 2a318a4..0000000
> --- a/meta/recipes-connectivity/openssl/openssl/fix-cipher-
> des-ede3-cfb1.patch
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -Upstream-Status: Submitted
> -
> -This patch adds the fix for one of the ciphers used in openssl, namely
> -the cipher des-ede3-cfb1. Complete bug log and patch is present here:
> -http://rt.openssl.org/Ticket/Display.html?id=2867
> -
> -Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> -
> -Index: openssl-1.0.2/crypto/evp/e_des3.c
> -===================================================================
> ---- openssl-1.0.2.orig/crypto/evp/e_des3.c
> -+++ openssl-1.0.2/crypto/evp/e_des3.c
> -@@ -211,7 +211,7 @@ static int des_ede3_cfb1_cipher(EVP_CIPH
> -     size_t n;
> -     unsigned char c[1], d[1];
> -
> --    for (n = 0; n < inl; ++n) {
> -+    for (n = 0; n * 8 < inl; ++n) {
> -         c[0] = (in[n / 8] & (1 << (7 - n % 8))) ? 0x80 : 0;
> -         DES_ede3_cfb_encrypt(c, d, 1, 1,
> -                              &data(ctx)->ks1, &data(ctx)->ks2,
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
> b/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
> similarity index 90%
> rename from meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
> rename to meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
> index 83d1a50..6390746 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
> @@ -7,7 +7,7 @@ DEPENDS += "cryptodev-linux"
>  CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
>  CFLAG_append_class-native = " -fPIC"
>
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=27ffa5d74bb5a337056c14b2ef93fbf6"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=057d9218c6180e1d9ee407572b2dd225"
>
>  export DIRS = "crypto ssl apps engines"
>  export OE_LDFLAGS="${LDFLAGS}"
> @@ -32,7 +32,6 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
>              file://debian1.0.2/version-script.patch \
>              file://debian1.0.2/soname.patch \
>              file://openssl_fix_for_x32.patch \
> -            file://fix-cipher-des-ede3-cfb1.patch \
>              file://openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
> \
>

I think the patch mentioned above has been obsolete for many releases as
well: see
https://github.com/openssl/openssl/commit/ff2459b91877959bc1a3a8a927c6b5f473530f86

Cheers,
  Jussi


             file://openssl-fix-des.pod-error.patch \
>              file://Makefiles-ptest.patch \
> @@ -45,8 +44,8 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
>              file://Use-SHA256-not-MD5-as-default-digest.patch \
>              file://0001-Fix-build-with-clang-using-external-assembler.patch
> \
>              "
> -SRC_URI[md5sum] = "f965fc0bf01bf882b31314b61391ae65"
> -SRC_URI[sha256sum] = "6b3977c61f2aedf0f96367dcfb5c6e
> 578cf37e7b8d913b4ecb6643c3cb88d8c0"
> +SRC_URI[md5sum] = "f85123cd390e864dfbe517e7616e6566"
> +SRC_URI[sha256sum] = "ce07195b659e75f4e1db4355286007
> 0061f156a98bb37b672b101ba6e3ddf30c"
>
>  PACKAGES =+ "${PN}-engines"
>  FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11448e5040d114055170af8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 8=
 June 2017 at 11:18, Changhyeok Bae <span dir=3D"ltr">&lt;<a href=3D"mailto=
:changhyeok.bae@gmail.com" target=3D"_blank">changhyeok.bae@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Patch=
 fix-cipher-des-ede3-cfb1.patch was removed as it is included<br>
in this release.<br>
<br>
Signed-off-by: Changhyeok Bae &lt;<a href=3D"mailto:changhyeok.bae@gmail.co=
m">changhyeok.bae@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../openssl/openssl/fix-<wbr>cipher-des-ede3-cfb1.patch=C2=A0 | 21 --=
-------------------<br>
=C2=A0.../{<a href=3D"http://openssl_1.0.2k.bb" rel=3D"noreferrer" target=
=3D"_blank">openssl_1.0.2k.bb</a> =3D&gt; <a href=3D"http://openssl_1.0.2l.=
bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2l.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 7 +++----<br>
=C2=A02 files changed, 3 insertions(+), 25 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/<wbr>openssl/openssl/fix=
-cipher-<wbr>des-ede3-cfb1.patch<br>
=C2=A0rename meta/recipes-connectivity/<wbr>openssl/{<a href=3D"http://open=
ssl_1.0.2k.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2k.bb</a> =
=3D&gt; <a href=3D"http://openssl_1.0.2l.bb" rel=3D"noreferrer" target=3D"_=
blank">openssl_1.0.2l.bb</a>} (90%)<br>
<br>
diff --git a/meta/recipes-connectivity/<wbr>openssl/openssl/fix-cipher-<wbr=
>des-ede3-cfb1.patch b/meta/recipes-connectivity/<wbr>openssl/openssl/fix-c=
ipher-<wbr>des-ede3-cfb1.patch<br>
deleted file mode 100644<br>
index 2a318a4..0000000<br>
--- a/meta/recipes-connectivity/<wbr>openssl/openssl/fix-cipher-<wbr>des-ed=
e3-cfb1.patch<br>
+++ /dev/null<br>
@@ -1,21 +0,0 @@<br>
-Upstream-Status: Submitted<br>
-<br>
-This patch adds the fix for one of the ciphers used in openssl, namely<br>
-the cipher des-ede3-cfb1. Complete bug log and patch is present here:<br>
-<a href=3D"http://rt.openssl.org/Ticket/Display.html?id=3D2867" rel=3D"nor=
eferrer" target=3D"_blank">http://rt.openssl.org/Ticket/<wbr>Display.html?i=
d=3D2867</a><br>
-<br>
-Signed-off-by: Muhammad Shakeel &lt;<a href=3D"mailto:muhammad_shakeel@men=
tor.com">muhammad_shakeel@mentor.com</a>&gt;<br>
-<br>
-Index: openssl-1.0.2/crypto/evp/e_<wbr>des3.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- openssl-1.0.2.orig/crypto/evp/<wbr>e_des3.c<br>
-+++ openssl-1.0.2/crypto/evp/e_<wbr>des3.c<br>
-@@ -211,7 +211,7 @@ static int des_ede3_cfb1_cipher(EVP_CIPH<br>
-=C2=A0 =C2=A0 =C2=A0size_t n;<br>
-=C2=A0 =C2=A0 =C2=A0unsigned char c[1], d[1];<br>
-<br>
--=C2=A0 =C2=A0 for (n =3D 0; n &lt; inl; ++n) {<br>
-+=C2=A0 =C2=A0 for (n =3D 0; n * 8 &lt; inl; ++n) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c[0] =3D (in[n / 8] &amp; (1 &lt;&lt; (7=
 - n % 8))) ? 0x80 : 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DES_ede3_cfb_encrypt(c, d, 1, 1,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;data(ctx)-&gt;ks1, &amp;data(ctx)-&gt;=
ks2,<br>
diff --git a/meta/recipes-connectivity/<wbr>openssl/<a href=3D"http://opens=
sl_1.0.2k.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2k.bb</a> b/=
meta/recipes-connectivity/<wbr>openssl/<a href=3D"http://openssl_1.0.2l.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2l.bb</a><br>
similarity index 90%<br>
rename from meta/recipes-connectivity/<wbr>openssl/<a href=3D"http://openss=
l_1.0.2k.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2k.bb</a><br>
rename to meta/recipes-connectivity/<wbr>openssl/<a href=3D"http://openssl_=
1.0.2l.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2l.bb</a><br>
index 83d1a50..6390746 100644<br>
--- a/meta/recipes-connectivity/<wbr>openssl/<a href=3D"http://openssl_1.0.=
2k.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2k.bb</a><br>
+++ b/meta/recipes-connectivity/<wbr>openssl/<a href=3D"http://openssl_1.0.=
2l.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2l.bb</a><br>
@@ -7,7 +7,7 @@ DEPENDS +=3D &quot;cryptodev-linux&quot;<br>
=C2=A0CFLAG +=3D &quot;-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS&quot;<br>
=C2=A0CFLAG_append_class-native =3D &quot; -fPIC&quot;<br>
<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>27ffa5d74bb5a337056c1=
4b2ef93fb<wbr>f6&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>057d9218c6180e1d9ee40=
7572b2dd2<wbr>25&quot;<br>
<br>
=C2=A0export DIRS =3D &quot;crypto ssl apps engines&quot;<br>
=C2=A0export OE_LDFLAGS=3D&quot;${LDFLAGS}&quot;<br>
@@ -32,7 +32,6 @@ SRC_URI +=3D &quot;file://<a href=3D"http://find.pl" rel=
=3D"noreferrer" target=3D"_blank">find.pl</a>;subdir=3D${BP}/<wbr>util/ \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://debian1.0.2/version-=
<wbr>script.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://debian1.0.2/soname.<=
wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://openssl_fix_for_x32.=
<wbr>patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-cipher-des-ede3-<wbr>=
cfb1.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://openssl-avoid-NULL-<=
wbr>pointer-dereference-in-EVP_<wbr>DigestInit_ex.patch \<br></blockquote><=
div><br></div><div>I think the patch mentioned above has been obsolete for =
many releases as well: see <a href=3D"https://github.com/openssl/openssl/co=
mmit/ff2459b91877959bc1a3a8a927c6b5f473530f86">https://github.com/openssl/o=
penssl/commit/ff2459b91877959bc1a3a8a927c6b5f473530f86</a></div><div><br></=
div><div>Cheers,<br></div><div>=C2=A0 Jussi=C2=A0</div><div><br></div><div>=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://openssl-fix-des.pod-=
<wbr>error.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://Makefiles-ptest.patc=
h \<br>
@@ -45,8 +44,8 @@ SRC_URI +=3D &quot;file://<a href=3D"http://find.pl" rel=
=3D"noreferrer" target=3D"_blank">find.pl</a>;subdir=3D${BP}/<wbr>util/ \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://Use-SHA256-not-MD5-a=
s-<wbr>default-digest.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-build-with-=
<wbr>clang-using-external-<wbr>assembler.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-SRC_URI[md5sum] =3D &quot;<wbr>f965fc0bf01bf882b31314b61391ae<wbr>65&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>6b3977c61f2aedf0f96367dcfb5c6e<wbr>578cf=
37e7b8d913b4ecb6643c3cb88<wbr>d8c0&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>f85123cd390e864dfbe517e7616e65<wbr>66&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>ce07195b659e75f4e1db4355286007<wbr>0061f=
156a98bb37b672b101ba6e3dd<wbr>f30c&quot;<br>
<br>
=C2=A0PACKAGES =3D+ &quot;${PN}-engines&quot;<br>
=C2=A0FILES_${PN}-engines =3D &quot;${libdir}/ssl/engines/*.so ${libdir}/en=
gines&quot;<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div>

--001a11448e5040d114055170af8a--
