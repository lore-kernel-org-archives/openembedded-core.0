Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D896C4332F
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 18:38:42 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.10315.1667327913540282065
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 11:38:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MLMfUrc7;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id y14so39299139ejd.9
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 11:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yb59kNa8mQvaqDfiPaQXR/3yGUOzp1Ssb8EgmaE/hXM=;
        b=MLMfUrc7cEsAxv1gsbn67fKHvVavY36OA4SR0EtbxV9GhqfUe/1QvV61hP0YPdCfLt
         1oWYcP8GAeLzEPfkZ33Boofw5Y3j6t2WZegqu2GaHU4ld9bAYD/hrZpzlPRej3kvxqcm
         toSi851N6kSrqNyZocvG3IJAOkSeCcd6/8SfmB61yL0dd1sZNuGbGSB1mfyJD/XuyWTZ
         s40kLV0urYa2UYVuivfyv/8jnwVInr7SlM0lxV/kIt4JHMwl1iSWi0DLnj8DOcyDi6lt
         Y3nWoGLKQHldvf9ptCKScpNhuTxz1CGCiv5h2oMiFo8GnQQp3RHfHNcKNY5jTecaoA0m
         0CxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yb59kNa8mQvaqDfiPaQXR/3yGUOzp1Ssb8EgmaE/hXM=;
        b=OWA94AE/lzqwOb5HwEMmree8677GjtsK2e/P/n/FUPMI+10oHhBZN9nOX6f+2pQl7y
         L8ZaQkGouAgZAON2yyiDd9I5OP5Z5bcGj+ldL/0zYJwf3LtRcKMPCYAWzKpRsJFNwK6F
         z7y48Q9ctQWpaynVVw9dJW2CfcXREWSVxzPeBMAXE/3tktkLNAjNwV7XoyK/2K2HG21D
         72Ubb+HsKnSTyItlMltIkbktHOUXi3Xo/Nc+BOz8cF6iyUs+Q8pXmwTEvfTBopX7CjZ0
         1h1m4Ntlt0Me5DxWuZzz7x2Tk0ldy+aCB/nKTL036cEaZ0ysUkUJztducC95z788Vbug
         no0w==
X-Gm-Message-State: ACrzQf1XnwnJ2LACbVns3A3zuHfkjkQ9cqjgF+lbUM12HMid34S7kvKb
	XxV8UzBwEGlKhpBSJDJxex/quhZXBlvOjogzg2Q=
X-Google-Smtp-Source: AMsMyM4Cb56PTAY7VA7rlVq6Brqpg5URAkR/P1eXLbdNK+MNb4sLRV4EKu+fFmJ78Q5Tdz5CGvteMjpKIswiNGuVOVQ=
X-Received: by 2002:a17:906:f854:b0:7ad:d196:9df with SMTP id
 ks20-20020a170906f85400b007add19609dfmr12082476ejb.295.1667327911772; Tue, 01
 Nov 2022 11:38:31 -0700 (PDT)
MIME-Version: 1.0
References: <20221101170310.2740317-1-edtanous@google.com>
In-Reply-To: <20221101170310.2740317-1-edtanous@google.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 1 Nov 2022 11:38:20 -0700
Message-ID: <CANx9H-BnKcR1WTLsVS=Mm52b2DhXDOzTg2Cw0eZsSCdYyEcgcg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Upgrade OpenSSL 3.0.5 -> 3.0.7
To: edtanous@google.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e7c5f705ec6d076f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 18:38:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172381

--000000000000e7c5f705ec6d076f
Content-Type: text/plain; charset="UTF-8"

The commit message should reference the two new CVEs as well:

CVE-2022-3786 and CVE-2022-3602: X.509 Email Address Buffer Overflows
https://www.openssl.org/blog/blog/2022/11/01/email-address-overflows/


On Tue, Nov 1, 2022 at 10:03 AM edtanous via lists.openembedded.org
<edtanous=google.com@lists.openembedded.org> wrote:

> From: Ed Tanous <edtanous@google.com>
>
> OpenSSL 3.0.5 includes a HIGH level security vulnerability [1].
>
> Upgrade the recipe to point to 3.0.7.
>
> CVE-2022-3358 is reported fixed in 3.0.6, so drop the patch for that as
> well.
>
> [1] https://www.openssl.org/news/vulnerabilities.html
>
> Signed-off-by: Ed Tanous <edtanous@google.com>
> ---
>  .../openssl/openssl/CVE-2022-3358.patch       | 55 -------------------
>  .../{openssl_3.0.5.bb => openssl_3.0.7.bb}    |  3 +-
>  2 files changed, 1 insertion(+), 57 deletions(-)
>  delete mode 100644
> meta/recipes-connectivity/openssl/openssl/CVE-2022-3358.patch
>  rename meta/recipes-connectivity/openssl/{openssl_3.0.5.bb =>
> openssl_3.0.7.bb} (98%)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2022-3358.patch
> b/meta/recipes-connectivity/openssl/openssl/CVE-2022-3358.patch
> deleted file mode 100644
> index 18b2a5a6b2..0000000000
> --- a/meta/recipes-connectivity/openssl/openssl/CVE-2022-3358.patch
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -From 56e1d693f0ec5550a8e3dd52d30e57a02f0287af Mon Sep 17 00:00:00 2001
> -From: Hitendra Prajapati <hprajapati@mvista.com>
> -Date: Wed, 19 Oct 2022 11:08:23 +0530
> -Subject: [PATCH] CVE-2022-3358
> -
> -Upstream-Status: Backport [
> https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=5485c56679d7c49b96e8fc8ca708b0b7e7c03c4b
> ]
> -CVE : CVE-2022-3358
> -Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ----
> - crypto/evp/digest.c  | 4 +++-
> - crypto/evp/evp_enc.c | 6 ++++--
> - 2 files changed, 7 insertions(+), 3 deletions(-)
> -
> -diff --git a/crypto/evp/digest.c b/crypto/evp/digest.c
> -index de9a1dc..e6e03ea 100644
> ---- a/crypto/evp/digest.c
> -+++ b/crypto/evp/digest.c
> -@@ -225,7 +225,9 @@ static int evp_md_init_internal(EVP_MD_CTX *ctx,
> const EVP_MD *type,
> -             || tmpimpl != NULL
> - #endif
> -             || (ctx->flags & EVP_MD_CTX_FLAG_NO_INIT) != 0
> --            || type->origin == EVP_ORIG_METH) {
> -+            || (type != NULL && type->origin == EVP_ORIG_METH)
> -+            || (type == NULL && ctx->digest != NULL
> -+                             && ctx->digest->origin == EVP_ORIG_METH)) {
> -         if (ctx->digest == ctx->fetched_digest)
> -             ctx->digest = NULL;
> -         EVP_MD_free(ctx->fetched_digest);
> -diff --git a/crypto/evp/evp_enc.c b/crypto/evp/evp_enc.c
> -index 19a07de..5df08bd 100644
> ---- a/crypto/evp/evp_enc.c
> -+++ b/crypto/evp/evp_enc.c
> -@@ -131,7 +131,10 @@ static int evp_cipher_init_internal(EVP_CIPHER_CTX
> *ctx,
> - #if !defined(OPENSSL_NO_ENGINE) && !defined(FIPS_MODULE)
> -             || tmpimpl != NULL
> - #endif
> --            || impl != NULL) {
> -+            || impl != NULL
> -+            || (cipher != NULL && cipher->origin == EVP_ORIG_METH)
> -+            || (cipher == NULL && ctx->cipher != NULL
> -+                               && ctx->cipher->origin == EVP_ORIG_METH))
> {
> -         if (ctx->cipher == ctx->fetched_cipher)
> -             ctx->cipher = NULL;
> -         EVP_CIPHER_free(ctx->fetched_cipher);
> -@@ -147,7 +150,6 @@ static int evp_cipher_init_internal(EVP_CIPHER_CTX
> *ctx,
> -         ctx->cipher_data = NULL;
> -     }
> -
> --
> -     /* Start of non-legacy code below */
> -
> -     /* Ensure a context left lying around from last time is cleared */
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.5.bb
> b/meta/recipes-connectivity/openssl/openssl_3.0.7.bb
> similarity index 98%
> rename from meta/recipes-connectivity/openssl/openssl_3.0.5.bb
> rename to meta/recipes-connectivity/openssl/openssl_3.0.7.bb
> index 175692436d..45fd1de2fd 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.0.5.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.0.7.bb
> @@ -12,14 +12,13 @@ SRC_URI = "
> http://www.openssl.org/source/openssl-${PV}.tar.gz \
>
> file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
>             file://afalg.patch \
>             file://0001-Configure-do-not-tweak-mips-cflags.patch \
> -           file://CVE-2022-3358.patch \
>             "
>
>  SRC_URI:append:class-nativesdk = " \
>             file://environment.d-openssl.sh \
>             "
>
> -SRC_URI[sha256sum] =
> "aa7d8d9bef71ad6525c55ba11e5f4397889ce49c2c9349dcea6d3e4f0b024a7a"
> +SRC_URI[sha256sum] =
> "83049d042a260e696f62406ac5c08bf706fd84383f945cf21bd61e9ed95c396e"
>
>  inherit lib_package multilib_header multilib_script ptest perlnative
>  MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
> --
> 2.38.1.273.g43a17bfeac-goog
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172369):
> https://lists.openembedded.org/g/openembedded-core/message/172369
> Mute This Topic: https://lists.openembedded.org/mt/94715257/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000e7c5f705ec6d076f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">The commit message shoul=
d reference the two new CVEs as well:<div><br>CVE-2022-3786 and CVE-2022-36=
02: X.509 Email Address Buffer Overflows<br><a href=3D"https://www.openssl.=
org/blog/blog/2022/11/01/email-address-overflows/">https://www.openssl.org/=
blog/blog/2022/11/01/email-address-overflows/</a><br></div><div><br></div><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Tue, Nov 1, 2022 at 10:03 AM edtanous via <a href=3D"http://lists.o=
penembedded.org">lists.openembedded.org</a> &lt;edtanous=3D<a href=3D"mailt=
o:google.com@lists.openembedded.org">google.com@lists.openembedded.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:=
 Ed Tanous &lt;<a href=3D"mailto:edtanous@google.com" target=3D"_blank">edt=
anous@google.com</a>&gt;<br>
<br>
OpenSSL 3.0.5 includes a HIGH level security vulnerability [1].<br>
<br>
Upgrade the recipe to point to 3.0.7.<br>
<br>
CVE-2022-3358 is reported fixed in 3.0.6, so drop the patch for that as<br>
well.<br>
<br>
[1] <a href=3D"https://www.openssl.org/news/vulnerabilities.html" rel=3D"no=
referrer" target=3D"_blank">https://www.openssl.org/news/vulnerabilities.ht=
ml</a><br>
<br>
Signed-off-by: Ed Tanous &lt;<a href=3D"mailto:edtanous@google.com" target=
=3D"_blank">edtanous@google.com</a>&gt;<br>
---<br>
=C2=A0.../openssl/openssl/CVE-2022-3358.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 5=
5 -------------------<br>
=C2=A0.../{<a href=3D"http://openssl_3.0.5.bb" rel=3D"noreferrer" target=3D=
"_blank">openssl_3.0.5.bb</a> =3D&gt; <a href=3D"http://openssl_3.0.7.bb" r=
el=3D"noreferrer" target=3D"_blank">openssl_3.0.7.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 3 +-<br>
=C2=A02 files changed, 1 insertion(+), 57 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2022=
-3358.patch<br>
=C2=A0rename meta/recipes-connectivity/openssl/{<a href=3D"http://openssl_3=
.0.5.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.0.5.bb</a> =3D&gt; =
<a href=3D"http://openssl_3.0.7.bb" rel=3D"noreferrer" target=3D"_blank">op=
enssl_3.0.7.bb</a>} (98%)<br>
<br>
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2022-3358.patch =
b/meta/recipes-connectivity/openssl/openssl/CVE-2022-3358.patch<br>
deleted file mode 100644<br>
index 18b2a5a6b2..0000000000<br>
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2022-3358.patch<br>
+++ /dev/null<br>
@@ -1,55 +0,0 @@<br>
-From 56e1d693f0ec5550a8e3dd52d30e57a02f0287af Mon Sep 17 00:00:00 2001<br>
-From: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mvista.com" targ=
et=3D"_blank">hprajapati@mvista.com</a>&gt;<br>
-Date: Wed, 19 Oct 2022 11:08:23 +0530<br>
-Subject: [PATCH] CVE-2022-3358<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://git.openssl.org/gitweb/?p=3D=
openssl.git;a=3Dcommitdiff;h=3D5485c56679d7c49b96e8fc8ca708b0b7e7c03c4b" re=
l=3D"noreferrer" target=3D"_blank">https://git.openssl.org/gitweb/?p=3Dopen=
ssl.git;a=3Dcommitdiff;h=3D5485c56679d7c49b96e8fc8ca708b0b7e7c03c4b</a>]<br=
>
-CVE : CVE-2022-3358<br>
-Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mvista.=
com" target=3D"_blank">hprajapati@mvista.com</a>&gt;<br>
----<br>
- crypto/evp/digest.c=C2=A0 | 4 +++-<br>
- crypto/evp/evp_enc.c | 6 ++++--<br>
- 2 files changed, 7 insertions(+), 3 deletions(-)<br>
-<br>
-diff --git a/crypto/evp/digest.c b/crypto/evp/digest.c<br>
-index de9a1dc..e6e03ea 100644<br>
---- a/crypto/evp/digest.c<br>
-+++ b/crypto/evp/digest.c<br>
-@@ -225,7 +225,9 @@ static int evp_md_init_internal(EVP_MD_CTX *ctx, const=
 EVP_MD *type,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| tmpimpl !=3D NULL<br>
- #endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| (ctx-&gt;flags &amp; EV=
P_MD_CTX_FLAG_NO_INIT) !=3D 0<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || type-&gt;origin =3D=3D EVP_O=
RIG_METH) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (type !=3D NULL &amp;&amp; t=
ype-&gt;origin =3D=3D EVP_ORIG_METH)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (type =3D=3D NULL &amp;&amp;=
 ctx-&gt;digest !=3D NULL<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; ctx-&gt;digest-&gt;origin =3D=3D =
EVP_ORIG_METH)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx-&gt;digest =3D=3D ctx-&gt;fetche=
d_digest)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;digest =3D NULL;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0EVP_MD_free(ctx-&gt;fetched_digest);<br>
-diff --git a/crypto/evp/evp_enc.c b/crypto/evp/evp_enc.c<br>
-index 19a07de..5df08bd 100644<br>
---- a/crypto/evp/evp_enc.c<br>
-+++ b/crypto/evp/evp_enc.c<br>
-@@ -131,7 +131,10 @@ static int evp_cipher_init_internal(EVP_CIPHER_CTX *c=
tx,<br>
- #if !defined(OPENSSL_NO_ENGINE) &amp;&amp; !defined(FIPS_MODULE)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| tmpimpl !=3D NULL<br>
- #endif<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || impl !=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || impl !=3D NULL<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (cipher !=3D NULL &amp;&amp;=
 cipher-&gt;origin =3D=3D EVP_ORIG_METH)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (cipher =3D=3D NULL &amp;&am=
p; ctx-&gt;cipher !=3D NULL<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; ctx-&gt;cipher-&gt;origin =
=3D=3D EVP_ORIG_METH)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx-&gt;cipher =3D=3D ctx-&gt;fetche=
d_cipher)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;cipher =3D NULL;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0EVP_CIPHER_free(ctx-&gt;fetched_cipher);=
<br>
-@@ -147,7 +150,6 @@ static int evp_cipher_init_internal(EVP_CIPHER_CTX *ct=
x,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;cipher_data =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--<br>
-=C2=A0 =C2=A0 =C2=A0/* Start of non-legacy code below */<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0/* Ensure a context left lying around from last time i=
s cleared */<br>
--- <br>
-2.25.1<br>
-<br>
diff --git a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.=
0.5.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.0.5.bb</a> b/meta/re=
cipes-connectivity/openssl/<a href=3D"http://openssl_3.0.7.bb" rel=3D"noref=
errer" target=3D"_blank">openssl_3.0.7.bb</a><br>
similarity index 98%<br>
rename from meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.0=
.5.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.0.5.bb</a><br>
rename to meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.0.7=
.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.0.7.bb</a><br>
index 175692436d..45fd1de2fd 100644<br>
--- a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.0.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssl_3.0.5.bb</a><br>
+++ b/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.0.7.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssl_3.0.7.bb</a><br>
@@ -12,14 +12,13 @@ SRC_URI =3D &quot;<a href=3D"http://www.openssl.org/sou=
rce/openssl-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://w=
ww.openssl.org/source/openssl-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-buildinfo-strip-sysro=
ot-and-debug-prefix-map-from-co.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://afalg.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Configure-do-not-twea=
k-mips-cflags.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2022-3358.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI:append:class-nativesdk =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://<a href=3D"http://environm=
ent.d-openssl.sh" rel=3D"noreferrer" target=3D"_blank">environment.d-openss=
l.sh</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;aa7d8d9bef71ad6525c55ba11e5f4397889ce49c2c934=
9dcea6d3e4f0b024a7a&quot;<br>
+SRC_URI[sha256sum] =3D &quot;83049d042a260e696f62406ac5c08bf706fd84383f945=
cf21bd61e9ed95c396e&quot;<br>
<br>
=C2=A0inherit lib_package multilib_header multilib_script ptest perlnative<=
br>
=C2=A0MULTILIB_SCRIPTS =3D &quot;${PN}-bin:${bindir}/c_rehash&quot;<br>
-- <br>
2.38.1.273.g43a17bfeac-goog<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#172369): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/172369" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/172369</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94715257/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
94715257/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000e7c5f705ec6d076f--

