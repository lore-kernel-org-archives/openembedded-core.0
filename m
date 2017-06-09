Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id 85D48780F3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 13:13:15 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id q97so32806824wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jun 2017 06:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=gipBGUPj3hxwiPmcL7OBweEYcgSpk6/pJnacTFFgmcA=;
	b=J4RsWcsUGvFjRBtthOkt3kE6+Kckt77YP9zbs//S/0AZusvBAyfZ2SvfWeK6dXQU1U
	Eh1RkwewvBC9bctn9rEBBYLfyjtbFfxVKXWo1Db3Nkl7uvwUORN4YH7kG1Z/xy8hIpCv
	39vMGuAhTc4pS0pckUw3xHU4psXZvgH4iv2RcX/yHebqMsqLb9b4tO0h9RJ82RxQ/K3f
	KpDh6wJQcLt83pUL9Jjb9bPHse2JsLl6gfLEapTT/MhKRxzPEU0QXDZbiZ7ytCyiAVmy
	GJrmiOdGoyKtjpMwJjyffhmIIkOi2F7+/RWzArtxGlvo0992OGXOBX/lw/N0CcNM+AyW
	crmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=gipBGUPj3hxwiPmcL7OBweEYcgSpk6/pJnacTFFgmcA=;
	b=OHRGGzHoc9RfllJqSiiTAAWyK84u3RYCGly2BY0rKW+AFaEpt1/N4cMKs5CracRj0W
	a9Ayp4VwHs1Cjl54aaGb1gNLlc/SFfwqlD3vatyDDxnclqcX8/YirC/itm4jDa2t6kSh
	+e6Z+9K3U2LzKCQ4ssyPW35+/qH/oPv9IHahzkTI52hAsmkv+tk54DrNoYOZ5NMcwEi3
	AH9wYvwXFKfj4JLehzAD5z6fOmRjtTp55+IcLHXqa/zYFokOVvjvQxs3pWTL4dfyhvkC
	PN7Qa8e+NOhDBoDuweXWRS6QUU1SLiyGL9b+J/QyBL+yVeHXWJb4YtLM2zqsYfWwmV07
	GzTQ==
X-Gm-Message-State: AODbwcD8e0ZANVSP0dRglwDsqZp06uoV347dOqkQZhPbYR4I0tklchyk
	8Z7VYqIIGv66y566bGBuq/XTVFPQsw==
X-Received: by 10.80.144.68 with SMTP id z4mr18730624edz.143.1497013996344;
	Fri, 09 Jun 2017 06:13:16 -0700 (PDT)
MIME-Version: 1.0
References: <1496926311-12090-1-git-send-email-changhyeok.bae@gmail.com>
In-Reply-To: <1496926311-12090-1-git-send-email-changhyeok.bae@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 09 Jun 2017 13:13:05 +0000
Message-ID: <CAMKF1sqo7Y87A9UVZvWFf=KxfG5V9pXjqAWOAN6hVFx+N=B3cA@mail.gmail.com>
To: Changhyeok Bae <changhyeok.bae@gmail.com>,
	openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Fri, 09 Jun 2017 13:13:15 -0000
Content-Type: multipart/alternative; boundary="f403045c2b7879dae6055186bb41"

--f403045c2b7879dae6055186bb41
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 8, 2017 at 5:52 AM Changhyeok Bae <changhyeok.bae@gmail.com>
wrote:

> Dropped obsolete patches, because the new version contains them:
>   - fix-cipher-des-ede3-cfb1.patch
>   - openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
>
> Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
> ---
>  .../openssl/openssl/fix-cipher-des-ede3-cfb1.patch | 21
> --------------------
>  ...-pointer-dereference-in-EVP_DigestInit_ex.patch | 23
> ----------------------
>  .../{openssl_1.0.2k.bb => openssl_1.0.2l.bb}       |  8 +++-----
>  3 files changed, 3 insertions(+), 49 deletions(-)
>  delete mode 100644
> meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb1.patch
>  delete mode 100644
> meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
>  rename meta/recipes-connectivity/openssl/{openssl_1.0.2k.bb =>
> openssl_1.0.2l.bb} (86%)
>
> diff --git
> a/meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb1.patch
> b/meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb1.patch
> deleted file mode 100644
> index 2a318a4..0000000
> ---
> a/meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb1.patch
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
> diff --git
> a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
> b/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
> deleted file mode 100644
> index f736e5c..0000000
> ---
> a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -openssl: avoid NULL pointer dereference in EVP_DigestInit_ex()
> -
> -We should avoid accessing the type pointer if it's NULL,
> -this could happen if ctx->digest is not NULL.
> -
> -Upstream-Status: Submitted
> -http://www.mail-archive.com/openssl-dev@openssl.org/msg32860.html
> -
> -Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
> ----
> -Index: openssl-1.0.2h/crypto/evp/digest.c
> -===================================================================
> ---- openssl-1.0.2h.orig/crypto/evp/digest.c
> -+++ openssl-1.0.2h/crypto/evp/digest.c
> -@@ -211,7 +211,7 @@ int EVP_DigestInit_ex(EVP_MD_CTX *ctx, c
> -         type = ctx->digest;
> -     }
> - #endif
> --    if (ctx->digest != type) {
> -+    if (type && (ctx->digest != type)) {
> -         if (ctx->digest && ctx->digest->ctx_size) {
> -             OPENSSL_free(ctx->md_data);
> -             ctx->md_data = NULL;
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
> b/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
> similarity index 86%
> rename from meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
> rename to meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
> index 83d1a50..a2ef2ac 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
> @@ -7,7 +7,7 @@ DEPENDS += "cryptodev-linux"
>  CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
>  CFLAG_append_class-native = " -fPIC"
>
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=27ffa5d74bb5a337056c14b2ef93fbf6"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=057d9218c6180e1d9ee407572b2dd225"
>

What resulted in this change

>
>  export DIRS = "crypto ssl apps engines"
>  export OE_LDFLAGS="${LDFLAGS}"
> @@ -32,8 +32,6 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
>              file://debian1.0.2/version-script.patch \
>              file://debian1.0.2/soname.patch \
>              file://openssl_fix_for_x32.patch \
> -            file://fix-cipher-des-ede3-cfb1.patch \
> -
> file://openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch \
>              file://openssl-fix-des.pod-error.patch \
>              file://Makefiles-ptest.patch \
>              file://ptest-deps.patch \
> @@ -45,8 +43,8 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
>              file://Use-SHA256-not-MD5-as-default-digest.patch \
>
>  file://0001-Fix-build-with-clang-using-external-assembler.patch \
>              "
> -SRC_URI[md5sum] = "f965fc0bf01bf882b31314b61391ae65"
> -SRC_URI[sha256sum] =
> "6b3977c61f2aedf0f96367dcfb5c6e578cf37e7b8d913b4ecb6643c3cb88d8c0"
> +SRC_URI[md5sum] = "f85123cd390e864dfbe517e7616e6566"
> +SRC_URI[sha256sum] =
> "ce07195b659e75f4e1db43552860070061f156a98bb37b672b101ba6e3ddf30c"
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

--f403045c2b7879dae6055186bb41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div>On Thu, Jun 8, 2017 at 5:52 AM Cha=
nghyeok Bae &lt;<a href=3D"mailto:changhyeok.bae@gmail.com">changhyeok.bae@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Dropped =
obsolete patches, because the new version contains them:<br>
=C2=A0 - fix-cipher-des-ede3-cfb1.patch<br>
=C2=A0 - openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch<=
br>
<br>
Signed-off-by: Changhyeok Bae &lt;<a href=3D"mailto:changhyeok.bae@gmail.co=
m" target=3D"_blank">changhyeok.bae@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../openssl/openssl/fix-cipher-des-ede3-cfb1.patch | 21 -------------=
-------<br>
=C2=A0...-pointer-dereference-in-EVP_DigestInit_ex.patch | 23 -------------=
---------<br>
=C2=A0.../{<a href=3D"http://openssl_1.0.2k.bb" rel=3D"noreferrer" target=
=3D"_blank">openssl_1.0.2k.bb</a> =3D&gt; <a href=3D"http://openssl_1.0.2l.=
bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2l.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 8 +++-----<br>
=C2=A03 files changed, 3 insertions(+), 49 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/openssl/openssl/fix-ciph=
er-des-ede3-cfb1.patch<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-=
avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch<br>
=C2=A0rename meta/recipes-connectivity/openssl/{<a href=3D"http://openssl_1=
.0.2k.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2k.bb</a> =3D&gt=
; <a href=3D"http://openssl_1.0.2l.bb" rel=3D"noreferrer" target=3D"_blank"=
>openssl_1.0.2l.bb</a>} (86%)<br>
<br>
diff --git a/meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-=
cfb1.patch b/meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-=
cfb1.patch<br>
deleted file mode 100644<br>
index 2a318a4..0000000<br>
--- a/meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb1.pa=
tch<br>
+++ /dev/null<br>
@@ -1,21 +0,0 @@<br>
-Upstream-Status: Submitted<br>
-<br>
-This patch adds the fix for one of the ciphers used in openssl, namely<br>
-the cipher des-ede3-cfb1. Complete bug log and patch is present here:<br>
-<a href=3D"http://rt.openssl.org/Ticket/Display.html?id=3D2867" rel=3D"nor=
eferrer" target=3D"_blank">http://rt.openssl.org/Ticket/Display.html?id=3D2=
867</a><br>
-<br>
-Signed-off-by: Muhammad Shakeel &lt;<a href=3D"mailto:muhammad_shakeel@men=
tor.com" target=3D"_blank">muhammad_shakeel@mentor.com</a>&gt;<br>
-<br>
-Index: openssl-1.0.2/crypto/evp/e_des3.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- openssl-1.0.2.orig/crypto/evp/e_des3.c<br>
-+++ openssl-1.0.2/crypto/evp/e_des3.c<br>
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
diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-p=
ointer-dereference-in-EVP_DigestInit_ex.patch b/meta/recipes-connectivity/o=
penssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.=
patch<br>
deleted file mode 100644<br>
index f736e5c..0000000<br>
--- a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-=
dereference-in-EVP_DigestInit_ex.patch<br>
+++ /dev/null<br>
@@ -1,23 +0,0 @@<br>
-openssl: avoid NULL pointer dereference in EVP_DigestInit_ex()<br>
-<br>
-We should avoid accessing the type pointer if it&#39;s NULL,<br>
-this could happen if ctx-&gt;digest is not NULL.<br>
-<br>
-Upstream-Status: Submitted<br>
-<a href=3D"http://www.mail-archive.com/openssl-dev@openssl.org/msg32860.ht=
ml" rel=3D"noreferrer" target=3D"_blank">http://www.mail-archive.com/openss=
l-dev@openssl.org/msg32860.html</a><br>
-<br>
-Signed-off-by: Xufeng Zhang &lt;<a href=3D"mailto:xufeng.zhang@windriver.c=
om" target=3D"_blank">xufeng.zhang@windriver.com</a>&gt;<br>
----<br>
-Index: openssl-1.0.2h/crypto/evp/digest.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- openssl-1.0.2h.orig/crypto/evp/digest.c<br>
-+++ openssl-1.0.2h/crypto/evp/digest.c<br>
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
diff --git a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.=
0.2k.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2k.bb</a> b/meta/=
recipes-connectivity/openssl/<a href=3D"http://openssl_1.0.2l.bb" rel=3D"no=
referrer" target=3D"_blank">openssl_1.0.2l.bb</a><br>
similarity index 86%<br>
rename from meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.0=
.2k.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2k.bb</a><br>
rename to meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.0.2=
l.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2l.bb</a><br>
index 83d1a50..a2ef2ac 100644<br>
--- a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.0.2k.bb=
" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2k.bb</a><br>
+++ b/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.0.2l.bb=
" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2l.bb</a><br>
@@ -7,7 +7,7 @@ DEPENDS +=3D &quot;cryptodev-linux&quot;<br>
=C2=A0CFLAG +=3D &quot;-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS&quot;<br>
=C2=A0CFLAG_append_class-native =3D &quot; -fPIC&quot;<br>
<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D27ffa5d74bb5a337056c14b2ef=
93fbf6&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D057d9218c6180e1d9ee407572b=
2dd225&quot;<br>
</blockquote><div><br></div><div>What resulted in this change</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex"><br>
=C2=A0export DIRS =3D &quot;crypto ssl apps engines&quot;<br>
=C2=A0export OE_LDFLAGS=3D&quot;${LDFLAGS}&quot;<br>
@@ -32,8 +32,6 @@ SRC_URI +=3D &quot;file://<a href=3D"http://find.pl" rel=
=3D"noreferrer" target=3D"_blank">find.pl</a>;subdir=3D${BP}/util/ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://debian1.0.2/version-=
script.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://debian1.0.2/soname.p=
atch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://openssl_fix_for_x32.=
patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-cipher-des-ede3-cfb1.=
patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://openssl-avoid-NULL-pointe=
r-dereference-in-EVP_DigestInit_ex.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://openssl-fix-des.pod-=
error.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://Makefiles-ptest.patc=
h \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ptest-deps.patch \<b=
r>
@@ -45,8 +43,8 @@ SRC_URI +=3D &quot;file://<a href=3D"http://find.pl" rel=
=3D"noreferrer" target=3D"_blank">find.pl</a>;subdir=3D${BP}/util/ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://Use-SHA256-not-MD5-a=
s-default-digest.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-build-with-=
clang-using-external-assembler.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-SRC_URI[md5sum] =3D &quot;f965fc0bf01bf882b31314b61391ae65&quot;<br>
-SRC_URI[sha256sum] =3D &quot;6b3977c61f2aedf0f96367dcfb5c6e578cf37e7b8d913=
b4ecb6643c3cb88d8c0&quot;<br>
+SRC_URI[md5sum] =3D &quot;f85123cd390e864dfbe517e7616e6566&quot;<br>
+SRC_URI[sha256sum] =3D &quot;ce07195b659e75f4e1db43552860070061f156a98bb37=
b672b101ba6e3ddf30c&quot;<br>
<br>
=C2=A0PACKAGES =3D+ &quot;${PN}-engines&quot;<br>
=C2=A0FILES_${PN}-engines =3D &quot;${libdir}/ssl/engines/*.so ${libdir}/en=
gines&quot;<br>
--<br>
2.7.4<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--f403045c2b7879dae6055186bb41--
