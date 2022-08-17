Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78CEDC32771
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 14:32:05 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.29844.1660746717721383956
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 07:31:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X9KLDDYU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id k16so1242757wrx.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 07:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=g6iwlMvQHtrl2llaK/IeeJbZWiqbyDVmFktQ9U3AOVY=;
        b=X9KLDDYUQSiVcQgccp9L3VyDZih2SyN3SefidUpVZI5YE6n9bs1m+WyOtpEXwloDUj
         knWyFAVLN3YQR6IGKeqgRDsK4IpKrdUuG5WU8qiraMHMe4zdeE4j7ylTbFwkv6+D37Nu
         v5dpCZPqGUFq0edRf92LuM0uy4JmNYkU2Z8gU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=g6iwlMvQHtrl2llaK/IeeJbZWiqbyDVmFktQ9U3AOVY=;
        b=dZME9x3bgq3HfdTEt2tr5WhKoqI+sjG0BT1/nFAIAI7sMDTz51EB0NlUDZBt4VvTyh
         XzRjlM/nogqZPW9o3P6gaCRaz8fYeYXQVcHKzBTrM3Uem3CEZX4ibKpgvH8gihBBvOLt
         yV5uwxMe6ke9BkDvDNH1oE3ufh7H+G0vmd5+93oHfdSbvn5U3Log/Bkkc2fhVRYmp7VL
         yXVomq2NdIZyMWstEToYEDanwmyzj5U59PBovI3JOpjxx2XNcXYcSbkhTFLGaK+bc5Mu
         jVk7bgGdSI5S3tDF5xshrQjrY93bI+IEB6T+U7J3My+F7cmwARQZHpB96a+mvWwfssVx
         ASgg==
X-Gm-Message-State: ACgBeo0+rEH5aowVZXO2PWEei4HONK98VI/GmRetUkBcp7eXQYsSkGKl
	X1Ik6KdQz4kodVpJqviPzlNbiA==
X-Google-Smtp-Source: 
 AA6agR4iOz2ipucgLI7LI+UQYav2eVYrbzTnPiRR5UrdL8X+vQjZcpgkoYfm3bvEK5h+Qgz7RZC7ow==
X-Received: by 2002:adf:fb4f:0:b0:225:28cb:3331 with SMTP id
 c15-20020adffb4f000000b0022528cb3331mr1111002wrs.317.1660746716016;
        Wed, 17 Aug 2022 07:31:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3694:2ef4:2932:37d5?
 ([2001:8b0:aba:5f3c:3694:2ef4:2932:37d5])
        by smtp.gmail.com with ESMTPSA id
 bg38-20020a05600c3ca600b003a54f49c1c8sm2716303wmb.12.2022.08.17.07.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 07:31:55 -0700 (PDT)
Message-ID: 
 <bd2307253f4328b100d2879d1af8ec6a92b7ddda.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 6/6] xmlto: Update to use upstream tip of
 trunk
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 17 Aug 2022 15:31:54 +0100
In-Reply-To: <20220816033005.2700801-6-raj.khem@gmail.com>
References: <20220816033005.2700801-1-raj.khem@gmail.com>
	 <20220816033005.2700801-6-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 14:32:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169485

On Mon, 2022-08-15 at 20:30 -0700, Khem Raj wrote:
> There are several fixes which are done to fix builds with newer
> compilers after 0.0.28 was releases in 2015 a long time ago.
>=20
> Add a patch to fix manpages builds not trying to access network during
> build
>=20
> Regenerate xmlif from lex files, before configuring the build
>=20
> Add UPSTREAM_CHECK_COMMITS =3D "1"
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2:
> - Update patch status
> - Add UPSTREAM_CHECK_COMMITS
>=20
>  .../0001-Skip-validating-xmlto-output.patch   | 29 +++++++++++++++++++
>  ...rop-the-test-of-xmllint-and-xsltproc.patch |  6 ++--
>  meta/recipes-devtools/xmlto/xmlto_0.0.28.bb   | 16 +++++++---
>  3 files changed, 44 insertions(+), 7 deletions(-)
>  create mode 100644 meta/recipes-devtools/xmlto/xmlto/0001-Skip-validatin=
g-xmlto-output.patch
>  rename meta/recipes-devtools/xmlto/{xmlto-0.0.28 =3D> xmlto}/configure.i=
n-drop-the-test-of-xmllint-and-xsltproc.patch (91%)
>=20
> diff --git a/meta/recipes-devtools/xmlto/xmlto/0001-Skip-validating-xmlto=
-output.patch b/meta/recipes-devtools/xmlto/xmlto/0001-Skip-validating-xmlt=
o-output.patch
> new file mode 100644
> index 00000000000..c6857a9da51
> --- /dev/null
> +++ b/meta/recipes-devtools/xmlto/xmlto/0001-Skip-validating-xmlto-output=
.patch
> @@ -0,0 +1,29 @@
> +From 3deb7a0eded04ab08a9cb2d88526cb1c7b440061 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 14 Aug 2022 00:23:29 -0700
> +Subject: [PATCH] Skip validating xmlto output
> +
> +Avoids network access
> +
> +Upstream-Status: Submitted [https://pagure.io/xmlto/pull-request/11]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + Makefile.am | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 50fa279..6a2da62 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -68,7 +68,7 @@ EXTRA_DIST =3D xmlto.spec \
> + 	doc/xmlif.xml \
> + 	xmlto.mak
> +=20
> +-GEN_MANPAGE =3D FORMAT_DIR=3D$(top_srcdir)/format $(BASH) ./xmlto -o $(=
@D) man $<
> ++GEN_MANPAGE =3D FORMAT_DIR=3D$(top_srcdir)/format $(BASH) ./xmlto --ski=
p-validation -o $(@D) man $<
> + man/man1/xmlto.1: doc/xmlto.xml ; $(GEN_MANPAGE)
> + man/man1/xmlif.1: doc/xmlif.xml ; $(GEN_MANPAGE)
> +=20
> +--=20
> +2.37.2
> +
> diff --git a/meta/recipes-devtools/xmlto/xmlto-0.0.28/configure.in-drop-t=
he-test-of-xmllint-and-xsltproc.patch b/meta/recipes-devtools/xmlto/xmlto/c=
onfigure.in-drop-the-test-of-xmllint-and-xsltproc.patch
> similarity index 91%
> rename from meta/recipes-devtools/xmlto/xmlto-0.0.28/configure.in-drop-th=
e-test-of-xmllint-and-xsltproc.patch
> rename to meta/recipes-devtools/xmlto/xmlto/configure.in-drop-the-test-of=
-xmllint-and-xsltproc.patch
> index 6d547a6c994..7cc3cbe0fb2 100644
> --- a/meta/recipes-devtools/xmlto/xmlto-0.0.28/configure.in-drop-the-test=
-of-xmllint-and-xsltproc.patch
> +++ b/meta/recipes-devtools/xmlto/xmlto/configure.in-drop-the-test-of-xml=
lint-and-xsltproc.patch
> @@ -9,9 +9,9 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>   configure.in | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> =20
> -diff --git a/configure.in b/configure.in
> ---- a/configure.in
> -+++ b/configure.in
> +diff --git a/configure.ac b/configure.ac
> +--- a/configure.ac
> ++++ b/configure.ac
>  @@ -42,10 +42,10 @@ AC_ARG_VAR([LOCALE], [Name and path of the `locale' =
program.])
>   AC_PATH_PROG([LOCALE], [locale], [locale])
>  =20
> diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/recipes-d=
evtools/xmlto/xmlto_0.0.28.bb
> index 5cb9a4c57be..1913dd2833d 100644
> --- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
> +++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
> @@ -6,17 +6,21 @@ LICENSE =3D "GPL-2.0-only"
> =20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
> =20
> -SRC_URI =3D "https://releases.pagure.org/xmlto/xmlto-${PV}.tar.gz \
> +SRCREV =3D "6fa6a0e07644f20abf2596f78a60112713e11cbe"
> +UPSTREAM_CHECK_COMMITS =3D "1"
> +SRC_URI =3D "git://pagure.io/xmlto.git;protocol=3Dhttps;branch=3Dmaster =
\
>             file://configure.in-drop-the-test-of-xmllint-and-xsltproc.pat=
ch \
> +           file://0001-Skip-validating-xmlto-output.patch \
>  "
> -SRC_URI[md5sum] =3D "a1fefad9d83499a15576768f60f847c6"
> -SRC_URI[sha256sum] =3D "2f986b7c9a0e9ac6728147668e776d405465284e13c74d41=
46c9cbc51fd8aad3"
> +S =3D "${WORKDIR}/git"
> +
> +PV .=3D "+0.0.29+git${SRCPV}"
> =20
>  inherit autotools
> =20
>  CLEANBROKEN =3D "1"
> =20
> -DEPENDS =3D "libxml2-native"
> +DEPENDS =3D "libxml2-native libxslt-native flex-native docbook-xml-dtd4-=
native docbook-xsl-stylesheets-native"
> =20
>  RDEPENDS:${PN} =3D "docbook-xml-dtd4 \
>                    docbook-xsl-stylesheets \
> @@ -36,6 +40,10 @@ BBCLASSEXTEND =3D "native"
> =20
>  EXTRA_OECONF:append =3D " BASH=3D/bin/bash GCP=3D/bin/cp XMLLINT=3Dxmlli=
nt XSLTPROC=3Dxsltproc"
> =20
> +do_configure:prepend() {
> +    flex -o ${S}/xmlif/xmlif.c ${S}/xmlif/xmlif.l
> +}
> +
>  do_install:append:class-native() {
>      create_wrapper ${D}${bindir}/xmlto XML_CATALOG_FILES=3D${sysconfdir}=
/xml/catalog
>  }
>=20

Seems to have a reproducibility problem:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/1401

Cheers,

Richard

