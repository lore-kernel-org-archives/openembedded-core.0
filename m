Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 18D9575916
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 10:13:20 +0000 (UTC)
Received: by qkdm188 with SMTP id m188so29850657qkd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 03:13:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=oOL2Ktr1dQ64D1Y9VDd4Sx9M3QDAAvoqr1NgySFiAS8=;
	b=gszxaeCnsvnUIE0OQonBUj1f0T7GWjMB1dbfSeTRATwu9e1scDvCLW5SDpS9/ZkTlh
	a+7y9PdTngqIBpP68OwXi66nYAYqFxi8jh3tgLvBcRHff4WHpawDogzrG745Pn00R5c9
	5ek68YHpMdOnSNWYnLlXfANNOt0Lf9PGH3zKKY0Ib7jyp2ndXVoc2HTA0GHFBawKhFGG
	P+58jESUhdO/KVPMwmBUK7aoCGQnEkYQIDYe34A1s7mhLS60zGTyXz0Xxb36s8YORLyq
	PGBZY9gg+W24TOAaVi0HofKGwTK43MrUhirj2mpD9QmxitOg+eCFg4BML8j5oP9SFowi
	o2fw==
X-Gm-Message-State: ALoCoQnEFTYeScCHOTmvf2bmFKgXDO0VM6VyTooWGL96WHS9/ptkN6hkg0ncxxvStcca//tVnjbv
X-Received: by 10.140.88.5 with SMTP id s5mr23769771qgd.59.1434363201958; Mon,
	15 Jun 2015 03:13:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 15 Jun 2015 03:13:01 -0700 (PDT)
In-Reply-To: <25c4ff3c454ec38bec5e68498d7230e6aaf8dc64.1434259784.git.akuster808@gmail.com>
References: <cover.1434259784.git.akuster808@gmail.com>
	<25c4ff3c454ec38bec5e68498d7230e6aaf8dc64.1434259784.git.akuster808@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Jun 2015 11:13:01 +0100
Message-ID: <CAJTo0LZ5uHLs-aP266_MYNkaBikPZ9=LDmOM+Vvr7SBkAqvJbw@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] gnutls: update to 3.4.1
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
X-List-Received-Date: Mon, 15 Jun 2015 10:13:26 -0000
Content-Type: multipart/alternative; boundary=001a11c1187421d41e05188bb511

--001a11c1187421d41e05188bb511
Content-Type: text/plain; charset=UTF-8

So this happens:

WARNING: QA Issue: gnutls-openssl rdepends on libidn, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: gnutls-xx rdepends on libidn, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: gnutls-dev rdepends on libidn, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: gnutls-bin rdepends on libidn, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: gnutls rdepends on libidn, but it isn't a build
dependency? [build-deps]

Ross

On 14 June 2015 at 06:37, Armin Kuster <akuster808@gmail.com> wrote:

> This version supports the nettle 3.x and higher and requires that version.
>
> this include a security fix:
> GNUTLS-SA-2015-2
> no CVE assigned to date.
>
> enable openssl compat via PACKAGECONFIG as iputils needs gnutls/openssl.h
>
> for migration info:
> http://www.gnutls.org/manual/gnutls.html#Upgrading-from-previous-versions
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/recipes-support/gnutls/gnutls.inc             |  3 ++-
>  .../gnutls/configure.ac-fix-sed-command.patch      | 29
> ++++++++++------------
>  meta/recipes-support/gnutls/gnutls_3.3.14.bb       |  8 ------
>  meta/recipes-support/gnutls/gnutls_3.4.1.bb        |  8 ++++++
>  4 files changed, 23 insertions(+), 25 deletions(-)
>  delete mode 100644 meta/recipes-support/gnutls/gnutls_3.3.14.bb
>  create mode 100644 meta/recipes-support/gnutls/gnutls_3.4.1.bb
>
> diff --git a/meta/recipes-support/gnutls/gnutls.inc
> b/meta/recipes-support/gnutls/gnutls.inc
> index e9b138a..6928cb9 100644
> --- a/meta/recipes-support/gnutls/gnutls.inc
> +++ b/meta/recipes-support/gnutls/gnutls.inc
> @@ -34,9 +34,10 @@ do_configure_prepend() {
>         done
>  }
>
> -PACKAGECONFIG ??= "zlib"
> +PACKAGECONFIG ??= "zlib openssl_compat"
>  PACKAGECONFIG[tpm] = "--with-tpm, --without-tpm, trousers"
>  PACKAGECONFIG[zlib] = "--with-zlib, --without-zlib, zlib"
> +PACKAGECONFIG[openssl_compat] = "--enable-openssl-compatibility,,"
>
>  PACKAGES =+ "${PN}-openssl ${PN}-xx"
>
> diff --git
> a/meta/recipes-support/gnutls/gnutls/configure.ac-fix-sed-command.patch
> b/meta/recipes-support/gnutls/gnutls/configure.ac-fix-sed-command.patch
> index 44a9934..342143f 100644
> --- a/meta/recipes-support/gnutls/gnutls/configure.ac-fix-sed-command.patch
> +++ b/meta/recipes-support/gnutls/gnutls/configure.ac-fix-sed-command.patch
> @@ -13,19 +13,16 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>   configure.ac | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> -diff --git a/configure.ac b/configure.ac
> -index c6818a0..1c4582d 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -466,7 +466,7 @@ if test "$NEED_LIBOPTS_DIR" = "true";then
> -       dnl replace libopts-generated files with distributed backups, if
> present
> -       missing_baks=
> -       for i in ${srcdir}/src/*-args.c.bak ${srcdir}/src/*-args.h.bak; do
> --              nam=`echo $i|sed 's/.bak//g'`
> -+              nam=`echo $i|sed 's/\.bak$//'`
> -               if test -f $i;then
> -                       cp -f $i $nam
> -               else
> ---
> -2.0.1
> -
> +Index: gnutls-3.4.1/configure.ac
> +===================================================================
> +--- gnutls-3.4.1.orig/configure.ac
> ++++ gnutls-3.4.1/configure.ac
> +@@ -530,7 +530,7 @@ if test "$enable_tools" != "no" || test
> +               dnl replace libopts-generated files with distributed
> backups, if present
> +               missing_baks=
> +               for i in ${srcdir}/src/*-args.c.bak
> ${srcdir}/src/*-args.h.bak; do
> +-                      nam=`echo $i|sed 's/.bak//g'`
> ++                      nam=`echo $i|sed 's/\.bak$//'`
> +                       if test -f $i;then
> +                               cp -f $i $nam
> +                       else
> diff --git a/meta/recipes-support/gnutls/gnutls_3.3.14.bb
> b/meta/recipes-support/gnutls/gnutls_3.3.14.bb
> deleted file mode 100644
> index f41d183..0000000
> --- a/meta/recipes-support/gnutls/gnutls_3.3.14.bb
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -require gnutls.inc
> -
> -SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
> -            file://configure.ac-fix-sed-command.patch \
> -            file://use-pkg-config-to-locate-zlib.patch \
> -           "
> -SRC_URI[md5sum] = "7f4465f8c564cf9cb8f5cb38b909f7ca"
> -SRC_URI[sha256sum] =
> "0dfa0030faad8909c1e904105198232d6bc0123cae8cf4933b2bac85ee7cec52"
> diff --git a/meta/recipes-support/gnutls/gnutls_3.4.1.bb
> b/meta/recipes-support/gnutls/gnutls_3.4.1.bb
> new file mode 100644
> index 0000000..1b64813
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls_3.4.1.bb
> @@ -0,0 +1,8 @@
> +require gnutls.inc
> +
> +SRC_URI += "file://correct_rpl_gettimeofday_signature.patch  \
> +            file://configure.ac-fix-sed-command.patch \
> +            file://use-pkg-config-to-locate-zlib.patch \
> +          "
> +SRC_URI[md5sum] = "2d04f34fa25b45f9dcb9104c0394e12e"
> +SRC_URI[sha256sum] =
> "e9b5f58becf34756464216056cd5abbf04315eda80a374d02699dee83f80b12e"
> --
> 2.3.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11c1187421d41e05188bb511
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>So this happens:</div><div><br></div><div>WARNING: QA=
 Issue: gnutls-openssl rdepends on libidn, but it isn&#39;t a build depende=
ncy? [build-deps]</div><div>WARNING: QA Issue: gnutls-xx rdepends on libidn=
, but it isn&#39;t a build dependency? [build-deps]</div><div>WARNING: QA I=
ssue: gnutls-dev rdepends on libidn, but it isn&#39;t a build dependency? [=
build-deps]</div><div>WARNING: QA Issue: gnutls-bin rdepends on libidn, but=
 it isn&#39;t a build dependency? [build-deps]</div><div>WARNING: QA Issue:=
 gnutls rdepends on libidn, but it isn&#39;t a build dependency? [build-dep=
s]</div><div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br>=
<div class=3D"gmail_quote">On 14 June 2015 at 06:37, Armin Kuster <span dir=
=3D"ltr">&lt;<a href=3D"mailto:akuster808@gmail.com" target=3D"_blank">akus=
ter808@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Th=
is version supports the nettle 3.x and higher and requires that version.<br=
>
<br>
this include a security fix:<br>
GNUTLS-SA-2015-2<br>
no CVE assigned to date.<br>
<br>
enable openssl compat via PACKAGECONFIG as iputils needs gnutls/openssl.h<b=
r>
<br>
for migration info:<br>
<a href=3D"http://www.gnutls.org/manual/gnutls.html#Upgrading-from-previous=
-versions" rel=3D"noreferrer" target=3D"_blank">http://www.gnutls.org/manua=
l/gnutls.html#Upgrading-from-previous-versions</a><br>
<br>
Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com">aku=
ster808@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/gnutls/gnutls.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 3 ++-<br>
=C2=A0.../gnutls/configure.ac-fix-sed-command.patch=C2=A0 =C2=A0 =C2=A0 | 2=
9 ++++++++++------------<br>
=C2=A0meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.3.14.bb" rel=
=3D"noreferrer" target=3D"_blank">gnutls_3.3.14.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 8 ------<br>
=C2=A0meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.4.1.bb" rel=3D=
"noreferrer" target=3D"_blank">gnutls_3.4.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 8 ++++++<br>
=C2=A04 files changed, 23 insertions(+), 25 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-support/gnutls/<a href=3D"http://gnut=
ls_3.3.14.bb" rel=3D"noreferrer" target=3D"_blank">gnutls_3.3.14.bb</a><br>
=C2=A0create mode 100644 meta/recipes-support/gnutls/<a href=3D"http://gnut=
ls_3.4.1.bb" rel=3D"noreferrer" target=3D"_blank">gnutls_3.4.1.bb</a><br>
<br>
diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/=
gnutls/gnutls.inc<br>
index e9b138a..6928cb9 100644<br>
--- a/meta/recipes-support/gnutls/gnutls.inc<br>
+++ b/meta/recipes-support/gnutls/gnutls.inc<br>
@@ -34,9 +34,10 @@ do_configure_prepend() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
=C2=A0}<br>
<br>
-PACKAGECONFIG ??=3D &quot;zlib&quot;<br>
+PACKAGECONFIG ??=3D &quot;zlib openssl_compat&quot;<br>
=C2=A0PACKAGECONFIG[tpm] =3D &quot;--with-tpm, --without-tpm, trousers&quot=
;<br>
=C2=A0PACKAGECONFIG[zlib] =3D &quot;--with-zlib, --without-zlib, zlib&quot;=
<br>
+PACKAGECONFIG[openssl_compat] =3D &quot;--enable-openssl-compatibility,,&q=
uot;<br>
<br>
=C2=A0PACKAGES =3D+ &quot;${PN}-openssl ${PN}-xx&quot;<br>
<br>
diff --git a/meta/recipes-support/gnutls/gnutls/configure.ac-fix-sed-comman=
d.patch b/meta/recipes-support/gnutls/gnutls/configure.ac-fix-sed-command.p=
atch<br>
index 44a9934..342143f 100644<br>
--- a/meta/recipes-support/gnutls/gnutls/configure.ac-fix-sed-command.patch=
<br>
+++ b/meta/recipes-support/gnutls/gnutls/configure.ac-fix-sed-command.patch=
<br>
@@ -13,19 +13,16 @@ Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi=
.yang@windriver.com">liezhi.yang@windriver.com</a>&gt;<br>
=C2=A0 <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a> | 2 +-<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
-diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
-index c6818a0..1c4582d 100644<br>
---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-@@ -466,7 +466,7 @@ if test &quot;$NEED_LIBOPTS_DIR&quot; =3D &quot;true&q=
uot;;then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dnl replace libopts-generated files with distri=
buted backups, if present<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0missing_baks=3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for i in ${srcdir}/src/*-args.c.bak ${srcdir}/s=
rc/*-args.h.bak; do<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nam=3D`echo $i|sed &#39;=
s/.bak//g&#39;`<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nam=3D`echo $i|sed &#39;=
s/\.bak$//&#39;`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test -f $i;then<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0cp -f $i $nam<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
---<br>
-2.0.1<br>
-<br>
+Index: gnutls-3.4.1/<a href=3D"http://configure.ac" rel=3D"noreferrer" tar=
get=3D"_blank">configure.ac</a><br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gnutls-3.4.1.orig/<a href=3D"http://configure.ac" rel=3D"noreferrer" t=
arget=3D"_blank">configure.ac</a><br>
++++ gnutls-3.4.1/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a><br>
+@@ -530,7 +530,7 @@ if test &quot;$enable_tools&quot; !=3D &quot;no&quot; =
|| test<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dnl replace libopts=
-generated files with distributed backups, if present<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0missing_baks=3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for i in ${srcdir}/=
src/*-args.c.bak ${srcdir}/src/*-args.h.bak; do<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 nam=3D`echo $i|sed &#39;s/.bak//g&#39;`<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 nam=3D`echo $i|sed &#39;s/\.bak$//&#39;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if test -f $i;then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -f $i $nam<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0else<br>
diff --git a/meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.3.14.bb=
" rel=3D"noreferrer" target=3D"_blank">gnutls_3.3.14.bb</a> b/meta/recipes-=
support/gnutls/<a href=3D"http://gnutls_3.3.14.bb" rel=3D"noreferrer" targe=
t=3D"_blank">gnutls_3.3.14.bb</a><br>
deleted file mode 100644<br>
index f41d183..0000000<br>
--- a/meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.3.14.bb" rel=
=3D"noreferrer" target=3D"_blank">gnutls_3.3.14.bb</a><br>
+++ /dev/null<br>
@@ -1,8 +0,0 @@<br>
-require gnutls.inc<br>
-<br>
-SRC_URI +=3D &quot;file://correct_rpl_gettimeofday_signature.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://configure.ac-fix-sed-comm=
and.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://use-pkg-config-to-locate-=
zlib.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-SRC_URI[md5sum] =3D &quot;7f4465f8c564cf9cb8f5cb38b909f7ca&quot;<br>
-SRC_URI[sha256sum] =3D &quot;0dfa0030faad8909c1e904105198232d6bc0123cae8cf=
4933b2bac85ee7cec52&quot;<br>
diff --git a/meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.4.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">gnutls_3.4.1.bb</a> b/meta/recipes-su=
pport/gnutls/<a href=3D"http://gnutls_3.4.1.bb" rel=3D"noreferrer" target=
=3D"_blank">gnutls_3.4.1.bb</a><br>
new file mode 100644<br>
index 0000000..1b64813<br>
--- /dev/null<br>
+++ b/meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.4.1.bb" rel=3D=
"noreferrer" target=3D"_blank">gnutls_3.4.1.bb</a><br>
@@ -0,0 +1,8 @@<br>
+require gnutls.inc<br>
+<br>
+SRC_URI +=3D &quot;file://correct_rpl_gettimeofday_signature.patch=C2=A0 \=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://configure.ac-fix-sed-comm=
and.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://use-pkg-config-to-locate-=
zlib.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+SRC_URI[md5sum] =3D &quot;2d04f34fa25b45f9dcb9104c0394e12e&quot;<br>
+SRC_URI[sha256sum] =3D &quot;e9b5f58becf34756464216056cd5abbf04315eda80a37=
4d02699dee83f80b12e&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.3.5<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--001a11c1187421d41e05188bb511--
