Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3D9797F698
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2019 12:33:33 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id u22so8741447qtq.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2019 05:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IZ350zBRYY35csbV1hNWKtLG516FL0r7LTAEMTNMhSM=;
	b=iidNclibGuvtc0fkH0Rhdqx66OGtUNpaPaVuCvv1xDsYkesgDMXRY8IZ8OKOND/Oqt
	+PETvCI9dCFnpOl7y7yRS+K1E+mEhAGgx9o3Uws/pbiuxB2R8MoHb9O1SPQkkFuIjtKJ
	z1bvIPeGiDTrRfl88wUx9NMbuQiTWQhp0O0THrR0jyAWUbGPd6My8IT56lE+98Ob9jUN
	ixt4zqhrlLRyHWVp7QzMz47PjGYFYos/GXHlKxs3wnYtX1u6Ewn7ivw7Rj6ZC50TBUcK
	eGk5JssO8SHb+HOd2SRsPYv9euqHDQUEfzvOyICrhfBUuH6s03Mc9qruyTsDgJJp3BlU
	vYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IZ350zBRYY35csbV1hNWKtLG516FL0r7LTAEMTNMhSM=;
	b=QcXkfbLEYeOIXdeQvRwSnFNK0521KrYIRQVztF1/XARRsgvclfStHKiDNTilbVe7cX
	VYlIDve2lO5M9yIdAgtkTqxA8ECM+3WYXUv+QgYJI4BsPgDuIT7BmxaTG+LQDWKo29cX
	uBbnofOrLsxywoCVdBSzYACmxcbjXTCGwxBOyTQU8uoTg61IxEuLH17LX5TiFKD1FNe9
	PCXlPuaCkdBCeFuUg9G9w3Nz8H/P65vb4doqueEYM8kMDFb7mbrNRu62MdQL94mqUVNj
	63kEQyAxivv+0v6W8H5HHx8zewYqsarfOCY7vf2KnH6BXwWlbrSh2kDnZSvedOx3tcFM
	SXow==
X-Gm-Message-State: APjAAAUT9VDDx54n4TACYUsZMl3k+4JuB5S+yUNHYRFWgbweHoSmXs9R
	LnHA/vcvgJDJufjs7bq0NzfZNlLQ3yFlN+cR/XY=
X-Google-Smtp-Source: APXvYqwwxBEA0+YBByK08nGHPrVGYWNSLdX8R9/CQZyY5/uKhpUJ9mReeDswwCSTHUCldFEGPn8E+1qCaSy9tKGRBdA=
X-Received: by 2002:ac8:3021:: with SMTP id f30mr9437100qte.80.1571402013791; 
	Fri, 18 Oct 2019 05:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <20191018112819.16210-1-ross.burton@intel.com>
In-Reply-To: <20191018112819.16210-1-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Oct 2019 18:03:22 +0530
Message-ID: <CAMKF1soy5adOpd49H0dTqtwu=vSRc0EPMnXFvD5uQTaJd+JCig@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] file: explicitly disable seccomp
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
X-List-Received-Date: Fri, 18 Oct 2019 12:33:33 -0000
Content-Type: multipart/alternative; boundary="000000000000d4da0405952e8a64"

--000000000000d4da0405952e8a64
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2019 at 4:58 PM Ross Burton <ross.burton@intel.com> wrote:

> file will automatically enable seccomp if the seccomp headers are
> available, but
> the build will fail on Opensuse Tumbleweed because the include paths are
> wrong.
>
> Enabling seccomp is a bad idea because it interacts badly with pseudo
> (causing
> build failures), so explicitly and globally disable seccomp.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-devtools/file/file_5.37.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/file/file_5.37.bb
> b/meta/recipes-devtools/file/file_5.37.bb
> index a840dbc012b..c53a120b840 100644
> --- a/meta/recipes-devtools/file/file_5.37.bb
> +++ b/meta/recipes-devtools/file/file_5.37.bb
> @@ -21,6 +21,8 @@ S =3D "${WORKDIR}/git"
>
>  inherit autotools update-alternatives
>
> +EXTRA_OECONF +=3D "--disable-libseccomp"
> +


On host it makes sense but how about for target recipe ? We do have
libseccomp support
Perhaps it=E2=80=99s best to disable it for native and native sdk alone ?

>
>  ALTERNATIVE_${PN} =3D "file"
>  ALTERNATIVE_LINK_NAME[file] =3D "${bindir}/file"
>
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000d4da0405952e8a64
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Oct 18, 2019 at 4:58 PM Ross Burton &lt;<a href=3D"=
mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">file will automatically enable seccomp if t=
he seccomp headers are available, but<br>
the build will fail on Opensuse Tumbleweed because the include paths are wr=
ong.<br>
<br>
Enabling seccomp is a bad idea because it interacts badly with pseudo (caus=
ing<br>
build failures), so explicitly and globally disable seccomp.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" tar=
get=3D"_blank">ross.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/file/<a href=3D"http://file_5.37.bb" rel=3D"nor=
eferrer" target=3D"_blank">file_5.37.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/file/<a href=3D"http://file_5.37.bb" rel=
=3D"noreferrer" target=3D"_blank">file_5.37.bb</a> b/meta/recipes-devtools/=
file/<a href=3D"http://file_5.37.bb" rel=3D"noreferrer" target=3D"_blank">f=
ile_5.37.bb</a><br>
index a840dbc012b..c53a120b840 100644<br>
--- a/meta/recipes-devtools/file/<a href=3D"http://file_5.37.bb" rel=3D"nor=
eferrer" target=3D"_blank">file_5.37.bb</a><br>
+++ b/meta/recipes-devtools/file/<a href=3D"http://file_5.37.bb" rel=3D"nor=
eferrer" target=3D"_blank">file_5.37.bb</a><br>
@@ -21,6 +21,8 @@ S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0inherit autotools update-alternatives<br>
<br>
+EXTRA_OECONF +=3D &quot;--disable-libseccomp&quot;<br>
+</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">On host it make=
s sense but how about for target recipe ? We do have libseccomp support=C2=
=A0</div><div dir=3D"auto">Perhaps it=E2=80=99s best to disable it for nati=
ve and native sdk alone ?</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
=C2=A0ALTERNATIVE_${PN} =3D &quot;file&quot;<br>
=C2=A0ALTERNATIVE_LINK_NAME[file] =3D &quot;${bindir}/file&quot;<br>
<br>
-- <br>
2.20.1<br>
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

--000000000000d4da0405952e8a64--
