Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yw0-f172.google.com (mail-yw0-f172.google.com
	[209.85.161.172])
	by mail.openembedded.org (Postfix) with ESMTP id E780C6612D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 08:37:14 +0000 (UTC)
Received: by mail-yw0-f172.google.com with SMTP id o4so105741693ywd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 01:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=c2nG1K128kknQu6vMWgYf8XRiCZ/Zc3fijYusRpQ44o=;
	b=d2W4aHqLskkyLtlyF/ygBvi+gozcouWXf1fOfPD8HknClavIO2y9i4i2qatXE1nTO9
	qUqkYnJxk6CyhyhRrWvvLpUnqRRyT/YfKDZ3JNAqzdl+/RUEt9VoSRyt6ek/7M4JZ4Mv
	OjwMY7nKvea5CWscakSHavBKLgRqDYup+Qlg7jXDGpXpA0ZtTbzZFb142cdq6wau+cBj
	39Z4N8ATRzgpNN5mzjQnpxrv4mXCw4mMbja6+NXdZ9u4DSWljCuZGA40eRKsNkKNnmcL
	vvgMU33ebSkDrL9CpYOqqx3llVTZQ4kPNAy+H3NIXZW3zu5nrnkwkyqVJNZDOVLhsMB3
	eftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=c2nG1K128kknQu6vMWgYf8XRiCZ/Zc3fijYusRpQ44o=;
	b=qZ2pc32RZtww52jEr4nVLkpjAvcR+9OeHuUnIYBA26BOEAP1o7hWhWjNKatQWuCSN5
	W8VM/3UXfw6LDRoR5Sl8he1Z7CFrHGjSocjcp1B/m0iLk7lGlpVhOq4reRTucD+s+P6d
	543YUK6ADMpEsxhQvXYBa3S7n9WeOXyEpFRVeWjav8FqMEJK1QyJ3nLCdxZiBWcUQ1cP
	GjIrBeRzn+Z5ksWa3vcqGZd+lDkfON7hS6uuDxAUqi/jrdIgebJHY/pegCWjrn9cPixk
	xjH2UM6Cgl8nFp89uIhT+czWrdvb6PiTCsJv6j9gE62eXb4n46U69MHz/qP0oqk5smSe
	pIkA==
X-Gm-Message-State: AFeK/H0Fjy+J92B027W+aYEIIkK1JnX9IRK81IGaWcSHtzxCZ5Co6VQ6i01qS5vTZNOLIul82NwGUUHfxHtQeh1R
X-Received: by 10.13.211.70 with SMTP id v67mr18009001ywd.260.1490085435795;
	Tue, 21 Mar 2017 01:37:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.81.136 with HTTP; Tue, 21 Mar 2017 01:36:45 -0700 (PDT)
In-Reply-To: <1490056286-13515-1-git-send-email-vedang.patel@intel.com>
References: <1490056286-13515-1-git-send-email-vedang.patel@intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 21 Mar 2017 10:36:45 +0200
Message-ID: <CAHiDW_FBnKy7Nx_G70zgXvTbJCXMy+uY0d1QUJk-ja3Z-gmw4A@mail.gmail.com>
To: Vedang Patel <vedang.patel@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxslt: Add PACKAGECONFIG support
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
X-List-Received-Date: Tue, 21 Mar 2017 08:37:15 -0000
Content-Type: multipart/alternative; boundary=001a114d83ea160004054b398dab

--001a114d83ea160004054b398dab
Content-Type: text/plain; charset=UTF-8

On 21 March 2017 at 02:31, Vedang Patel <vedang.patel@intel.com> wrote:

> Some options like python bindings, debug support, crypto are hardcoded
> inside the recipe. Change that to make those option configurable using
> PACKAGECONFIG.
>
> Signed-off-by: Vedang Patel <vedang.patel@intel.com>
> ---
>  meta/recipes-support/libxslt/libxslt_1.1.29.bb | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-support/libxslt/libxslt_1.1.29.bb
> b/meta/recipes-support/libxslt/libxslt_1.1.29.bb
> index be747e608d9d..d362118aa307 100644
> --- a/meta/recipes-support/libxslt/libxslt_1.1.29.bb
> +++ b/meta/recipes-support/libxslt/libxslt_1.1.29.bb
> @@ -22,7 +22,7 @@ S = "${WORKDIR}/libxslt-${PV}"
>
>  BINCONFIG = "${bindir}/xslt-config"
>
> -inherit autotools pkgconfig binconfig-disabled lib_package
> +inherit autotools pkgconfig binconfig-disabled lib_package
> distutils-common-base
>
>  # We don't DEPEND on binutils for ansidecl.h so ensure we don't use the
> header
>  do_configure_prepend () {
> @@ -33,7 +33,12 @@ do_configure_prepend () {
>         touch ${S}/doc/xsltproc.1
>  }
>
> -EXTRA_OECONF = "--without-python --without-debug --without-mem-debug
> --without-crypto"
> +PACKAGECONFIG ??= "python libxslt-debug libxslt-mem-debug libxslt-crypto"
>

You change all the defaults, is this on purpose? It should be noted in the
commit message in any case.



> +PACKAGECONFIG[libxslt-python] = "--with-python=${PYTHON_BASE_VERSION},
> --without-python"
> +PACKAGECONFIG[libxslt-debug] = "--with-debug, --without-debug"
> +PACKAGECONFIG[libxslt-mem-debug] = "--with-mem-debug,
> --without-mem-debug"
> +PACKAGECONFIG[libxslt-crypto] = "--with-crypto, --without-crypto"
> +
>  # older versions of this recipe had ${PN}-utils
>  RPROVIDES_${PN}-bin += "${PN}-utils"
>  RCONFLICTS_${PN}-bin += "${PN}-utils"
> --
> 2.7.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114d83ea160004054b398dab
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
1 March 2017 at 02:31, Vedang Patel <span dir=3D"ltr">&lt;<a href=3D"mailto=
:vedang.patel@intel.com" target=3D"_blank">vedang.patel@intel.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">Some options like python bin=
dings, debug support, crypto are hardcoded<br>
inside the recipe. Change that to make those option configurable using<br>
PACKAGECONFIG.<br>
<br>
Signed-off-by: Vedang Patel &lt;<a href=3D"mailto:vedang.patel@intel.com">v=
edang.patel@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/libxslt/<a href=3D"http://libxslt_1.1.29.bb" rel=
=3D"noreferrer" target=3D"_blank">l<wbr>ibxslt_1.1.29.bb</a> | 9 +++++++--<=
br>
=C2=A01 file changed, 7 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-support/<wbr>libxslt/<a href=3D"http://libxslt_1.=
1.29.bb" rel=3D"noreferrer" target=3D"_blank">libxslt_1.1.29.bb</a> b/meta/=
recipes-support/<wbr>libxslt/<a href=3D"http://libxslt_1.1.29.bb" rel=3D"no=
referrer" target=3D"_blank">libxslt_1.1.29.bb</a><br>
index be747e608d9d..d362118aa307 100644<br>
--- a/meta/recipes-support/<wbr>libxslt/<a href=3D"http://libxslt_1.1.29.bb=
" rel=3D"noreferrer" target=3D"_blank">libxslt_1.1.29.bb</a><br>
+++ b/meta/recipes-support/<wbr>libxslt/<a href=3D"http://libxslt_1.1.29.bb=
" rel=3D"noreferrer" target=3D"_blank">libxslt_1.1.29.bb</a><br>
@@ -22,7 +22,7 @@ S =3D &quot;${WORKDIR}/libxslt-${PV}&quot;<br>
<br>
=C2=A0BINCONFIG =3D &quot;${bindir}/xslt-config&quot;<br>
<br>
-inherit autotools pkgconfig binconfig-disabled lib_package<br>
+inherit autotools pkgconfig binconfig-disabled lib_package distutils-commo=
n-base<br>
<br>
=C2=A0# We don&#39;t DEPEND on binutils for ansidecl.h so ensure we don&#39=
;t use the header<br>
=C2=A0do_configure_prepend () {<br>
@@ -33,7 +33,12 @@ do_configure_prepend () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 touch ${S}/doc/xsltproc.1<br>
=C2=A0}<br>
<br>
-EXTRA_OECONF =3D &quot;--without-python --without-debug --without-mem-debu=
g --without-crypto&quot;<br>
+PACKAGECONFIG ??=3D &quot;python libxslt-debug libxslt-mem-debug libxslt-c=
rypto&quot;<br></blockquote><div><br></div><div>You change all the defaults=
, is this on purpose? It should be noted in the commit message in any case.=
</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+PACKAGECONFIG[libxslt-python] =3D &quot;--with-python=3D${PYTHON_BASE_<wbr=
>VERSION}, --without-python&quot;<br>
+PACKAGECONFIG[libxslt-debug] =3D &quot;--with-debug, --without-debug&quot;=
<br>
+PACKAGECONFIG[libxslt-mem-<wbr>debug] =3D &quot;--with-mem-debug, --withou=
t-mem-debug&quot;<br>
+PACKAGECONFIG[libxslt-crypto] =3D &quot;--with-crypto, --without-crypto&qu=
ot;<br>
+<br>
=C2=A0# older versions of this recipe had ${PN}-utils<br>
=C2=A0RPROVIDES_${PN}-bin +=3D &quot;${PN}-utils&quot;<br>
=C2=A0RCONFLICTS_${PN}-bin +=3D &quot;${PN}-utils&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.3<br>
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

--001a114d83ea160004054b398dab--
