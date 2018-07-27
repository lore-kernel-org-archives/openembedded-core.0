Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5F86B78D53
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 16:02:04 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id l10-v6so9939512oii.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 09:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ISqnVvKVv0KZGtBFK85yi6mGcuThf7mkcKt/6ojpuCM=;
	b=MuNVXmXpit9FZ3jSqNdJmMdRyki94D92K22whg12upeO46lk9hJPmVYifsw703jf6U
	nfszbmSJ9RkAEoi6o/QM3Cas1QXqyuLBh65GpBc1nF7GucXXQg6cVL6FWm3YvXPGYLQQ
	GD+lI+GzPep1LF+3GKUpoOZYjlI9a1fu0P4ToZXviKA/FWCI1NzdcUeVOcoVdeo1OOtZ
	DNZVzLyRjrFyMX60fNNfF2I83Ecrg1UEVkyu23Dk3JZZkaibRrXnOXk2Fa5MORgpFHac
	DTsRHC/klEcSt6HEbAHuIo/QDjIGRPoFBIrwt0T4tSAU3vwu7UJL6D/oSSO+Lqx4WtxS
	7Sug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ISqnVvKVv0KZGtBFK85yi6mGcuThf7mkcKt/6ojpuCM=;
	b=tIhDKBBaw0tzjrb8NgJ6GxcNkICdEkJsSNfVSPHOS9bw7/rjCHSG6bgm1yEEtYwVY8
	XV1vfeoHx7iX74r3jQPXm62mwz7rqLr91dohVfjQiYF0QxIfUwUbID+oLMV6+XhPkZLe
	a06+xm5Nq/5PXv0hl8NjOKh/mvzZBTLieu2Udhes28SFbTzHxJa7lquib/DgTqbTQ8Tj
	sH2exjMn8Hl1dEZqd0PLWWQ9EwhRMl+3JHNQnPOmzvJaxXqberN9XJA9qODngkv0Ub2e
	kxC5o51LMj9sr2J3sS4czEyKO3lCxnAuAck2TcRecJktYnegAu2NoAozls9Ve+kh8U+a
	riEA==
X-Gm-Message-State: AOUpUlECElXSQF9cl1gqDJVSatDfhfHBZm1V+iMP0tbyYOo2zIecs9Uk
	4EjGplAndBdQzASesHaUeWOM6f8z8ImGd9F3DZE=
X-Google-Smtp-Source: AAOMgpdbFKBjkci1aihWzGzZrHtRZSC0MJW4TJ8JsddwWHEDKne7nrGwHB7w+ukWramKuOCJy1RNPM8WGFa4399lxDo=
X-Received: by 2002:aca:ad86:: with SMTP id
	w128-v6mr7639911oie.112.1532707317427; 
	Fri, 27 Jul 2018 09:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <20180727153248.22838-1-ross.burton@intel.com>
	<20180727153248.22838-16-ross.burton@intel.com>
In-Reply-To: <20180727153248.22838-16-ross.burton@intel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Fri, 27 Jul 2018 09:01:43 -0700
Message-ID: <CABcZANmAyxmcS3rb-MJOR50CJD6qOFZBoN78ap=r_Wwap_Zf7A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 16/16] pax-utils: remove
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
X-List-Received-Date: Fri, 27 Jul 2018 16:02:04 -0000
Content-Type: multipart/alternative; boundary="0000000000003333f70571fd3bf2"

--0000000000003333f70571fd3bf2
Content-Type: text/plain; charset="UTF-8"

Should this be moved to meta-oe rather than just removed?

On Fri, Jul 27, 2018 at 8:34 AM Ross Burton <ross.burton@intel.com> wrote:

> This was packaged originally to perform QA tests on binaries (text
> relocations
> and RPATHs), but we perform those tests at build-time now.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb | 36
> ----------------------
>  1 file changed, 36 deletions(-)
>  delete mode 100644 meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb
>
> diff --git a/meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb
> b/meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb
> deleted file mode 100644
> index 9635a5e7082..00000000000
> --- a/meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -SUMMARY = "Security-focused ELF files checking tool"
> -DESCRIPTION = "This is a small set of various PaX aware and related \
> -utilities for ELF binaries. It can check ELF binary files and running \
> -processes for issues that might be relevant when using ELF binaries \
> -along with PaX, such as non-PIC code or executable stack and heap."
> -HOMEPAGE = "http://www.gentoo.org/proj/en/hardened/pax-utils.xml"
> -LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
> -
> -SRC_URI = "https://dev.gentoo.org/~vapier/dist/pax-utils-${PV}.tar.xz"
> -SRC_URI[md5sum] = "a580468318f0ff42edf4a8cd314cc942"
> -SRC_URI[sha256sum] =
> "7f4a7f8db6b4743adde7582fa48992ad01776796fcde030683732f56221337d9"
> -
> -RDEPENDS_${PN} += "bash"
> -
> -export GNULIB_OVERRIDES_WINT_T = "0"
> -
> -do_configure_prepend() {
> -    touch ${S}/NEWS ${S}/AUTHORS ${S}/ChangeLog ${S}/README
> -}
> -
> -do_install() {
> -    oe_runmake PREFIX=${D}${prefix} DESTDIR=${D} install
> -}
> -
> -BBCLASSEXTEND = "native"
> -
> -inherit autotools pkgconfig
> -
> -PACKAGECONFIG ??= ""
> -
> -PACKAGECONFIG[libcap] = "--with-caps, --without-caps, libcap"
> -PACKAGECONFIG[libseccomp] = "--with-seccomp, --without-seccomp,
> libseccomp"
> -PACKAGECONFIG[pyelftools] = "--with-python, --without-python,, pyelftools"
> -
> -EXTRA_OECONF += "--enable-largefile"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--0000000000003333f70571fd3bf2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Should this be moved to meta-oe rather than just removed?<=
br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, Jul 27, 20=
18 at 8:34 AM Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ross=
.burton@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Th=
is was packaged originally to perform QA tests on binaries (text relocation=
s<br>
and RPATHs), but we perform those tests at build-time now.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" tar=
get=3D"_blank">ross.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/pax-utils/<a href=3D"http://pax-utils_1.2.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">pax-utils_1.2.2.bb</a> | 36 ---------=
-------------<br>
=C2=A01 file changed, 36 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/pax-utils/<a href=3D"http://=
pax-utils_1.2.2.bb" rel=3D"noreferrer" target=3D"_blank">pax-utils_1.2.2.bb=
</a><br>
<br>
diff --git a/meta/recipes-devtools/pax-utils/<a href=3D"http://pax-utils_1.=
2.2.bb" rel=3D"noreferrer" target=3D"_blank">pax-utils_1.2.2.bb</a> b/meta/=
recipes-devtools/pax-utils/<a href=3D"http://pax-utils_1.2.2.bb" rel=3D"nor=
eferrer" target=3D"_blank">pax-utils_1.2.2.bb</a><br>
deleted file mode 100644<br>
index 9635a5e7082..00000000000<br>
--- a/meta/recipes-devtools/pax-utils/<a href=3D"http://pax-utils_1.2.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">pax-utils_1.2.2.bb</a><br>
+++ /dev/null<br>
@@ -1,36 +0,0 @@<br>
-SUMMARY =3D &quot;Security-focused ELF files checking tool&quot;<br>
-DESCRIPTION =3D &quot;This is a small set of various PaX aware and related=
 \<br>
-utilities for ELF binaries. It can check ELF binary files and running \<br=
>
-processes for issues that might be relevant when using ELF binaries \<br>
-along with PaX, such as non-PIC code or executable stack and heap.&quot;<b=
r>
-HOMEPAGE =3D &quot;<a href=3D"http://www.gentoo.org/proj/en/hardened/pax-u=
tils.xml" rel=3D"noreferrer" target=3D"_blank">http://www.gentoo.org/proj/e=
n/hardened/pax-utils.xml</a>&quot;<br>
-LICENSE =3D &quot;GPLv2+&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Deb723b61539feef013de476e68=
b5c50a&quot;<br>
-<br>
-SRC_URI =3D &quot;<a href=3D"https://dev.gentoo.org/~vapier/dist/pax-utils=
-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://dev.gentoo.=
org/~vapier/dist/pax-utils-${PV}.tar.xz</a>&quot;<br>
-SRC_URI[md5sum] =3D &quot;a580468318f0ff42edf4a8cd314cc942&quot;<br>
-SRC_URI[sha256sum] =3D &quot;7f4a7f8db6b4743adde7582fa48992ad01776796fcde0=
30683732f56221337d9&quot;<br>
-<br>
-RDEPENDS_${PN} +=3D &quot;bash&quot;<br>
-<br>
-export GNULIB_OVERRIDES_WINT_T =3D &quot;0&quot;<br>
-<br>
-do_configure_prepend() {<br>
-=C2=A0 =C2=A0 touch ${S}/NEWS ${S}/AUTHORS ${S}/ChangeLog ${S}/README<br>
-}<br>
-<br>
-do_install() {<br>
-=C2=A0 =C2=A0 oe_runmake PREFIX=3D${D}${prefix} DESTDIR=3D${D} install<br>
-}<br>
-<br>
-BBCLASSEXTEND =3D &quot;native&quot;<br>
-<br>
-inherit autotools pkgconfig<br>
-<br>
-PACKAGECONFIG ??=3D &quot;&quot;<br>
-<br>
-PACKAGECONFIG[libcap] =3D &quot;--with-caps, --without-caps, libcap&quot;<=
br>
-PACKAGECONFIG[libseccomp] =3D &quot;--with-seccomp, --without-seccomp, lib=
seccomp&quot;<br>
-PACKAGECONFIG[pyelftools] =3D &quot;--with-python, --without-python,, pyel=
ftools&quot;<br>
-<br>
-EXTRA_OECONF +=3D &quot;--enable-largefile&quot;<br>
-- <br>
2.11.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><d=
iv dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>Founder - =
BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engineer, Mentor Graph=
ics</div></div></div></div>

--0000000000003333f70571fd3bf2--
