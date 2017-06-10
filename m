Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id DFF7E78250
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Jun 2017 04:16:15 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id 185so4939540itv.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jun 2017 21:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=twztLGL4dtYGIPWui1xNroEJWM9nQGTlnSlNqP0nh8E=;
	b=kQyQwNpcJ69tI7JcZlU7P/XOEM7RMPuv+tgNQsYNqBVVWXfE69wEGxzrKJLm/LF+y1
	d0msnbyTx1HiNeBj+bTcUYAE1CcrMWTxB007Kx61HMceKpJrL4z4UjW+sCbd1W7AAXvX
	Uw3sJqOtfv0mTHbi0/q1bc0xECPKjukgDXzUF39VK3ojnFdGO9WtbtU+p4WZl8bhMkot
	zUDh9qjTRyn02c+bK1baxopEVGGjf0Pb86jXs9TBQKh2lPKn2ynOjF0aK+dKIl/qWTcq
	pfq8rTCh9i29/SV8bP29ARKUc0LvrJ4WBjO8ylzGQFKavHXHEMwP2ngDe9Prvx+SiSPM
	S4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=twztLGL4dtYGIPWui1xNroEJWM9nQGTlnSlNqP0nh8E=;
	b=SedrVBV1bj3rI3Q5pZGr294skVizHOguvXuFiYUL3/ShBaI2WTlTgBHwkrRSlFa/dI
	amEbt8Oug/5+znFNe7+N2ex7ffb6woInVL44ojLoL3VbmN6NrAvfcTytHMVjullGL8lU
	z2EYhNfS4y98HeDfGWwwb+QPzP12fvc4uWnCW3HqRhPt3/pVXrYMtvqNw+qYU1w6XL9l
	pS+dXlNC0Qb8+HlE2DFpsAVZqvOby+cVXBqPxps2RYyTBsQTnwFRPW5UmKLmFsaCagKA
	f0+ydG8SEaLPr+d/WhvBnfmPLEiEY/nJ92DFlQYZqdddGj53UNF0bunUdyfa1xkI9XN5
	jGFA==
X-Gm-Message-State: AODbwcACeHDgKr2JtEpqfFia4skZByp5DwiVg3XEVA3p/ApO84TC/uza
	/yUr5b+ZyHyM6iFcfLQh0DZZCVVPIQ==
X-Received: by 10.36.99.14 with SMTP id j14mr2630473itc.121.1497068176315;
	Fri, 09 Jun 2017 21:16:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.34.16 with HTTP; Fri, 9 Jun 2017 21:16:15 -0700 (PDT)
In-Reply-To: <CAMKF1sqo7Y87A9UVZvWFf=KxfG5V9pXjqAWOAN6hVFx+N=B3cA@mail.gmail.com>
References: <1496926311-12090-1-git-send-email-changhyeok.bae@gmail.com>
	<CAMKF1sqo7Y87A9UVZvWFf=KxfG5V9pXjqAWOAN6hVFx+N=B3cA@mail.gmail.com>
From: Changhyeok Bae <changhyeok.bae@gmail.com>
Date: Sat, 10 Jun 2017 13:16:15 +0900
Message-ID: <CACrLJgDx=aOpVP_Mp7Qo73M7Vxhk9RSBYS5tdXcQ6d-t-zLSYQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] openssl: Upgrade 1.0.2k -> 1.0.2l
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
X-List-Received-Date: Sat, 10 Jun 2017 04:16:16 -0000
Content-Type: multipart/alternative; boundary="001a113ad442da9ac4055193585d"

--001a113ad442da9ac4055193585d
Content-Type: text/plain; charset="UTF-8"

test binaries (x86) is included in In openssl-1.0.2l source code and I will
remove those binaries and re-submit.

Thanks
Changhyeok

2017-06-09 22:13 GMT+09:00 Khem Raj <raj.khem@gmail.com>:

>
> On Thu, Jun 8, 2017 at 5:52 AM Changhyeok Bae <changhyeok.bae@gmail.com>
> wrote:
>
>> Dropped obsolete patches, because the new version contains them:
>>   - fix-cipher-des-ede3-cfb1.patch
>>   - openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
>>
>> Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
>> ---
>>  .../openssl/openssl/fix-cipher-des-ede3-cfb1.patch | 21
>> --------------------
>>  ...-pointer-dereference-in-EVP_DigestInit_ex.patch | 23
>> ----------------------
>>  .../{openssl_1.0.2k.bb => openssl_1.0.2l.bb}       |  8 +++-----
>>  3 files changed, 3 insertions(+), 49 deletions(-)
>>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/fix-cipher-
>> des-ede3-cfb1.patch
>>  delete mode 100644 meta/recipes-connectivity/
>> openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-
>> EVP_DigestInit_ex.patch
>>  rename meta/recipes-connectivity/openssl/{openssl_1.0.2k.bb =>
>> openssl_1.0.2l.bb} (86%)
>>
>> diff --git a/meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb1.patch
>> b/meta/recipes-connectivity/openssl/openssl/fix-cipher-
>> des-ede3-cfb1.patch
>> deleted file mode 100644
>> index 2a318a4..0000000
>> --- a/meta/recipes-connectivity/openssl/openssl/fix-cipher-
>> des-ede3-cfb1.patch
>> +++ /dev/null
>> @@ -1,21 +0,0 @@
>> -Upstream-Status: Submitted
>> -
>> -This patch adds the fix for one of the ciphers used in openssl, namely
>> -the cipher des-ede3-cfb1. Complete bug log and patch is present here:
>> -http://rt.openssl.org/Ticket/Display.html?id=2867
>> -
>> -Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
>> -
>> -Index: openssl-1.0.2/crypto/evp/e_des3.c
>> -===================================================================
>> ---- openssl-1.0.2.orig/crypto/evp/e_des3.c
>> -+++ openssl-1.0.2/crypto/evp/e_des3.c
>> -@@ -211,7 +211,7 @@ static int des_ede3_cfb1_cipher(EVP_CIPH
>> -     size_t n;
>> -     unsigned char c[1], d[1];
>> -
>> --    for (n = 0; n < inl; ++n) {
>> -+    for (n = 0; n * 8 < inl; ++n) {
>> -         c[0] = (in[n / 8] & (1 << (7 - n % 8))) ? 0x80 : 0;
>> -         DES_ede3_cfb_encrypt(c, d, 1, 1,
>> -                              &data(ctx)->ks1, &data(ctx)->ks2,
>> diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-
>> NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
>> b/meta/recipes-connectivity/openssl/openssl/openssl-avoid-
>> NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
>> deleted file mode 100644
>> index f736e5c..0000000
>> --- a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-
>> NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
>> +++ /dev/null
>> @@ -1,23 +0,0 @@
>> -openssl: avoid NULL pointer dereference in EVP_DigestInit_ex()
>> -
>> -We should avoid accessing the type pointer if it's NULL,
>> -this could happen if ctx->digest is not NULL.
>> -
>> -Upstream-Status: Submitted
>> -http://www.mail-archive.com/openssl-dev@openssl.org/msg32860.html
>> -
>> -Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
>> ----
>> -Index: openssl-1.0.2h/crypto/evp/digest.c
>> -===================================================================
>> ---- openssl-1.0.2h.orig/crypto/evp/digest.c
>> -+++ openssl-1.0.2h/crypto/evp/digest.c
>> -@@ -211,7 +211,7 @@ int EVP_DigestInit_ex(EVP_MD_CTX *ctx, c
>> -         type = ctx->digest;
>> -     }
>> - #endif
>> --    if (ctx->digest != type) {
>> -+    if (type && (ctx->digest != type)) {
>> -         if (ctx->digest && ctx->digest->ctx_size) {
>> -             OPENSSL_free(ctx->md_data);
>> -             ctx->md_data = NULL;
>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
>> b/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
>> similarity index 86%
>> rename from meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
>> rename to meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
>> index 83d1a50..a2ef2ac 100644
>> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
>> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
>> @@ -7,7 +7,7 @@ DEPENDS += "cryptodev-linux"
>>  CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
>>  CFLAG_append_class-native = " -fPIC"
>>
>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=27ffa5d74bb5a337056c14b2ef93fbf6"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=057d9218c6180e1d9ee407572b2dd225"
>>
>
> What resulted in this change
>
>>
>>  export DIRS = "crypto ssl apps engines"
>>  export OE_LDFLAGS="${LDFLAGS}"
>> @@ -32,8 +32,6 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
>>              file://debian1.0.2/version-script.patch \
>>              file://debian1.0.2/soname.patch \
>>              file://openssl_fix_for_x32.patch \
>> -            file://fix-cipher-des-ede3-cfb1.patch \
>> -            file://openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
>> \
>>              file://openssl-fix-des.pod-error.patch \
>>              file://Makefiles-ptest.patch \
>>              file://ptest-deps.patch \
>> @@ -45,8 +43,8 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
>>              file://Use-SHA256-not-MD5-as-default-digest.patch \
>>              file://0001-Fix-build-with-clang-using-external-assembler.patch
>> \
>>              "
>> -SRC_URI[md5sum] = "f965fc0bf01bf882b31314b61391ae65"
>> -SRC_URI[sha256sum] = "6b3977c61f2aedf0f96367dcfb5c6e
>> 578cf37e7b8d913b4ecb6643c3cb88d8c0"
>> +SRC_URI[md5sum] = "f85123cd390e864dfbe517e7616e6566"
>> +SRC_URI[sha256sum] = "ce07195b659e75f4e1db4355286007
>> 0061f156a98bb37b672b101ba6e3ddf30c"
>>
>>  PACKAGES =+ "${PN}-engines"
>>  FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>


-- 
Thanks
Changhyeok

--001a113ad442da9ac4055193585d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">test binaries (x86) is included in In openssl-1.0.2l sourc=
e code and I will remove those binaries and re-submit.<div><br></div><div>T=
hanks</div><div>Changhyeok</div></div><div class=3D"gmail_extra"><br><div c=
lass=3D"gmail_quote">2017-06-09 22:13 GMT+09:00 Khem Raj <span dir=3D"ltr">=
&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.=
com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><br><div class=
=3D"gmail_quote"><div><div class=3D"h5"><div>On Thu, Jun 8, 2017 at 5:52 AM=
 Changhyeok Bae &lt;<a href=3D"mailto:changhyeok.bae@gmail.com" target=3D"_=
blank">changhyeok.bae@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Dropped obsolete patches, because the new version contains th=
em:<br>
=C2=A0 - fix-cipher-des-ede3-cfb1.patch<br>
=C2=A0 - openssl-avoid-NULL-pointer-<wbr>dereference-in-EVP_DigestInit_<wbr=
>ex.patch<br>
<br>
Signed-off-by: Changhyeok Bae &lt;<a href=3D"mailto:changhyeok.bae@gmail.co=
m" target=3D"_blank">changhyeok.bae@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../openssl/openssl/fix-<wbr>cipher-des-ede3-cfb1.patch | 21 --------=
------------<br>
=C2=A0...-pointer-dereference-in-<wbr>EVP_DigestInit_ex.patch | 23 --------=
--------------<br>
=C2=A0.../{<a href=3D"http://openssl_1.0.2k.bb" rel=3D"noreferrer" target=
=3D"_blank">openssl_1.0.2k.bb</a> =3D&gt; <a href=3D"http://openssl_1.0.2l.=
bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2l.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 8 +++-----<br>
=C2=A03 files changed, 3 insertions(+), 49 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/<wbr>openssl/openssl/fix=
-cipher-<wbr>des-ede3-cfb1.patch<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/<wbr>openssl/openssl/ope=
nssl-avoid-<wbr>NULL-pointer-dereference-in-<wbr>EVP_DigestInit_ex.patch<br=
>
=C2=A0rename meta/recipes-connectivity/<wbr>openssl/{<a href=3D"http://open=
ssl_1.0.2k.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2k.bb</a> =
=3D&gt; <a href=3D"http://openssl_1.0.2l.bb" rel=3D"noreferrer" target=3D"_=
blank">openssl_1.0.2l.bb</a>} (86%)<br>
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
tor.com" target=3D"_blank">muhammad_shakeel@mentor.com</a>&gt;<br>
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
diff --git a/meta/recipes-connectivity/<wbr>openssl/openssl/openssl-avoid-<=
wbr>NULL-pointer-dereference-in-<wbr>EVP_DigestInit_ex.patch b/meta/recipes=
-connectivity/<wbr>openssl/openssl/openssl-avoid-<wbr>NULL-pointer-derefere=
nce-in-<wbr>EVP_DigestInit_ex.patch<br>
deleted file mode 100644<br>
index f736e5c..0000000<br>
--- a/meta/recipes-connectivity/<wbr>openssl/openssl/openssl-avoid-<wbr>NUL=
L-pointer-dereference-in-<wbr>EVP_DigestInit_ex.patch<br>
+++ /dev/null<br>
@@ -1,23 +0,0 @@<br>
-openssl: avoid NULL pointer dereference in EVP_DigestInit_ex()<br>
-<br>
-We should avoid accessing the type pointer if it&#39;s NULL,<br>
-this could happen if ctx-&gt;digest is not NULL.<br>
-<br>
-Upstream-Status: Submitted<br>
-<a href=3D"http://www.mail-archive.com/openssl-dev@openssl.org/msg32860.ht=
ml" rel=3D"noreferrer" target=3D"_blank">http://www.mail-archive.com/<wbr>o=
penssl-dev@openssl.org/<wbr>msg32860.html</a><br>
-<br>
-Signed-off-by: Xufeng Zhang &lt;<a href=3D"mailto:xufeng.zhang@windriver.c=
om" target=3D"_blank">xufeng.zhang@windriver.com</a>&gt;<br>
----<br>
-Index: openssl-1.0.2h/crypto/evp/<wbr>digest.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- openssl-1.0.2h.orig/crypto/<wbr>evp/digest.c<br>
-+++ openssl-1.0.2h/crypto/evp/<wbr>digest.c<br>
-@@ -211,7 +211,7 @@ int EVP_DigestInit_ex(EVP_MD_CTX *ctx, c<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0type =3D ctx-&gt;digest;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- #endif<br>
--=C2=A0 =C2=A0 if (ctx-&gt;digest !=3D type) {<br>
-+=C2=A0 =C2=A0 if (type &amp;&amp; (ctx-&gt;digest !=3D type)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx-&gt;digest &amp;&amp; ctx-&gt;di=
gest-&gt;ctx_size) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OPENSSL_free(ctx-&gt;md_da=
ta);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;md_data =3D NULL;<=
br>
diff --git a/meta/recipes-connectivity/<wbr>openssl/<a href=3D"http://opens=
sl_1.0.2k.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2k.bb</a> b/=
meta/recipes-connectivity/<wbr>openssl/<a href=3D"http://openssl_1.0.2l.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2l.bb</a><br>
similarity index 86%<br>
rename from meta/recipes-connectivity/<wbr>openssl/<a href=3D"http://openss=
l_1.0.2k.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2k.bb</a><br>
rename to meta/recipes-connectivity/<wbr>openssl/<a href=3D"http://openssl_=
1.0.2l.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2l.bb</a><br>
index 83d1a50..a2ef2ac 100644<br>
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
</blockquote><div><br></div></div></div><div>What resulted in this change</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><span class=3D""><br>
=C2=A0export DIRS =3D &quot;crypto ssl apps engines&quot;<br>
=C2=A0export OE_LDFLAGS=3D&quot;${LDFLAGS}&quot;<br>
@@ -32,8 +32,6 @@ SRC_URI +=3D &quot;file://<a href=3D"http://find.pl" rel=
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
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://openssl-avoid-NULL-<wbr>p=
ointer-dereference-in-EVP_<wbr>DigestInit_ex.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://openssl-fix-des.pod-=
<wbr>error.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://Makefiles-ptest.patc=
h \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ptest-deps.patch \<b=
r>
@@ -45,8 +43,8 @@ SRC_URI +=3D &quot;file://<a href=3D"http://find.pl" rel=
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
--<br>
2.7.4<br>
<br></span><span class=3D"HOEnZb"><font color=3D"#888888">
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Th=
anks<div>Changhyeok</div></div></div>
</div>

--001a113ad442da9ac4055193585d--
