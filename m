Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
	[209.85.219.68])
	by mail.openembedded.org (Postfix) with ESMTP id 40BE87F89C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 16:55:41 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id t7so1539161qve.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2019 08:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=8e6nluqoma6APeFzvz0F0vE5bq5TEpL1Wx460y0KbRE=;
	b=KNBF1iI8dqw17OPbTpbM6uczltVedB9+f2j1P1CNFZwgKZfoQ0IKipRCd9UcSJziAj
	2UVHRCGwQ6zelOldliVIYxbApNEPOJjD9wSSVkAUqQdn02kfzk180PsKohcSnASr9L4n
	iPvO1n/W6v5eIH3k8M4lHs8Z9C7PyJUdhU9ohGxJ9Ji3moV4hXSapEoxbnOq7HG6wR2M
	AiyE/EPQMW+/+HSLIXb/boUUlyF/9bCR7KPT5rKmPrHw/YJT+A61UHwHXofWkSPIgSj8
	tR5R3UfJ/4NETMjoC5tsmoj/7sjynKtUDLjzFJ3ph9p5i/SlbL9yPCp7u7rrpM12V3px
	3GjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=8e6nluqoma6APeFzvz0F0vE5bq5TEpL1Wx460y0KbRE=;
	b=Hj1TbwSVVcMQPK0N+Zz7MyyOYVNeQyuiQ1hOLQj326w6QD93B2HEF/t6EAyvlYC61/
	YUb3Gyn6DZEyraGzPCTomTxqnIEzD2K2nFdfEZFjVTLXr8+InyYaI/dZLcdNgAEvDHsh
	qGMbUuX811OsZS9kE94GlW7zSgTBiBYoA6jJ0e0NT+FapddYNteNIQvDfQwIGRuOGRg0
	VuAAHIL0Pppvn7wa8JwfwM4hwsbawxMsnb1Vm/d/bQx7+H7nGjdGM61+UhDTY0+K9csJ
	dGWCKYeUPgCTUxUetPTisEUFkskBcuUQxSJU1WsMkp66O4Wa9n/3abYqFjnzsfOuZiI6
	Ra/g==
X-Gm-Message-State: APjAAAXo4vnNjHq7Li77AgNTKht12kK/AKLQtNo96ja3Wb0dUohbXxVB
	Ftd2/FpxrmSqL7OlZJ9kOk/AJGFQG57J0JeW1k4=
X-Google-Smtp-Source: APXvYqyd1h19wV7h+S2xeErtARjPECivC7J1DfUU6B/TdEX1moa4OiOpfwHheT1eai6dLgYPZBHtAJQQMVuIBNuT/OE=
X-Received: by 2002:a0c:8605:: with SMTP id p5mr8276244qva.109.1575564941706; 
	Thu, 05 Dec 2019 08:55:41 -0800 (PST)
MIME-Version: 1.0
References: <20191205154357.121346-1-alex.kanavin@gmail.com>
	<20191205154357.121346-16-alex.kanavin@gmail.com>
In-Reply-To: <20191205154357.121346-16-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Dec 2019 08:55:13 -0800
Message-ID: <CAMKF1sqZ6qN=BA4hXvVxXD=QOo7gQijovo137oy+EyGSbQBAcw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 16/24] libtasn1: update to 4.15.0
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
X-List-Received-Date: Thu, 05 Dec 2019 16:55:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 5, 2019 at 7:47 AM Alexander Kanavin <alex.kanavin@gmail.com> w=
rote:
>
> Drop backports.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../gnutls/libtasn1/fix-gtkdoc.patch          | 38 -------------------
>  .../gnutls/libtasn1/fix-ldflags.patch         | 31 ---------------
>  .../{libtasn1_4.14.bb =3D> libtasn1_4.15.0.bb}  | 11 ++++--
>  3 files changed, 7 insertions(+), 73 deletions(-)
>  delete mode 100644 meta/recipes-support/gnutls/libtasn1/fix-gtkdoc.patch
>  delete mode 100644 meta/recipes-support/gnutls/libtasn1/fix-ldflags.patc=
h
>  rename meta/recipes-support/gnutls/{libtasn1_4.14.bb =3D> libtasn1_4.15.=
0.bb} (71%)
>
> diff --git a/meta/recipes-support/gnutls/libtasn1/fix-gtkdoc.patch b/meta=
/recipes-support/gnutls/libtasn1/fix-gtkdoc.patch
> deleted file mode 100644
> index bfc9b9fca7e..00000000000
> --- a/meta/recipes-support/gnutls/libtasn1/fix-gtkdoc.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -Upstream-Status: Backport [https://gitlab.com/gnutls/libtasn1/merge_requ=
ests/49]
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -From ebd4f871b5241809f6a5b461444a6d331e15c949 Mon Sep 17 00:00:00 2001
> -From: Ross Burton <ross.burton@intel.com>
> -Date: Mon, 9 Sep 2019 13:11:39 +0100
> -Subject: [PATCH] doc/reference: don't add empty object hierarchy chapter
> -
> -The object hierarchy section is empty because there are no GObjects in t=
he
> -libtasn1 API.  With gtk-doc 1.30 onwards if there are no objects then th=
e object
> -hierarchy file won't exist, resulting in a failure when building the
> -documentation:
> -
> -| ../libtasn1-docs.xml:39: element include: XInclude error : could not l=
oad ../xml/tree_index.sgml, and no fallback was found
> -
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> ----
> - doc/reference/libtasn1-docs.xml | 4 ----
> - 1 file changed, 4 deletions(-)
> -
> -diff --git a/doc/reference/libtasn1-docs.xml b/doc/reference/libtasn1-do=
cs.xml
> -index accdb85..f88b888 100644
> ---- a/doc/reference/libtasn1-docs.xml
> -+++ b/doc/reference/libtasn1-docs.xml
> -@@ -34,10 +34,6 @@
> -         <xi:include href=3D"xml/libtasn1.xml"/>
> -
> -   </chapter>
> --  <chapter id=3D"object-tree">
> --    <title>Object Hierarchy</title>
> --    <xi:include href=3D"xml/tree_index.sgml"/>
> --  </chapter>
> -   <index id=3D"api-index-full">
> -     <title>API Index</title>
> -     <xi:include href=3D"xml/api-index-full.xml"><xi:fallback /></xi:inc=
lude>
> ---
> -2.20.1
> -
> diff --git a/meta/recipes-support/gnutls/libtasn1/fix-ldflags.patch b/met=
a/recipes-support/gnutls/libtasn1/fix-ldflags.patch
> deleted file mode 100644
> index f18f3c62679..00000000000
> --- a/meta/recipes-support/gnutls/libtasn1/fix-ldflags.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From a6f93b7ace347bc4fe29eb4a8fe4383d786cc8d0 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Tim=3D20R=3DC3=3DBChsen?=3D <tim.ruehsen@gmx.de>
> -Date: Tue, 23 Jul 2019 20:44:01 +0200
> -Subject: [PATCH] Fix LDFLAGS to AM_LDFLAGS in src/Makefile.am
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Signed-off-by: Tim R=C3=BChsen <tim.ruehsen@gmx.de>
> -Upstream-Status: Backport
> -Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ----
> - src/Makefile.am | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/Makefile.am b/src/Makefile.am
> -index 5bf3622..4459767 100644
> ---- a/src/Makefile.am
> -+++ b/src/Makefile.am
> -@@ -21,7 +21,7 @@ AM_CPPFLAGS =3D -I$(top_builddir)/lib/includes -I$(top=
_srcdir)/lib/includes \
> -  -I$(top_builddir)/lib/gl -I$(top_srcdir)/lib/gl $(CODE_COVERAGE_CPPFLA=
GS)
> -
> - LDADD =3D ../lib/libtasn1.la
> --LDFLAGS =3D $(CODE_COVERAGE_LDFLAGS)
> -+AM_LDFLAGS =3D $(CODE_COVERAGE_LDFLAGS)
> -
> - bin_PROGRAMS =3D asn1Parser asn1Coding asn1Decoding
> -
> ---
> -2.21.0
> -
> diff --git a/meta/recipes-support/gnutls/libtasn1_4.14.bb b/meta/recipes-=
support/gnutls/libtasn1_4.15.0.bb
> similarity index 71%
> rename from meta/recipes-support/gnutls/libtasn1_4.14.bb
> rename to meta/recipes-support/gnutls/libtasn1_4.15.0.bb
> index ef2c1956a24..cd00d17b803 100644
> --- a/meta/recipes-support/gnutls/libtasn1_4.14.bb
> +++ b/meta/recipes-support/gnutls/libtasn1_4.15.0.bb
> @@ -10,15 +10,18 @@ LIC_FILES_CHKSUM =3D "file://doc/COPYING;md5=3Dd32239=
bcb673463ab874e80d47fae504 \
>
>  SRC_URI =3D "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
>             file://dont-depend-on-help2man.patch \
> -           file://fix-ldflags.patch \
> -           file://fix-gtkdoc.patch \
>             "
>
>  DEPENDS =3D "bison-native"
>
> -SRC_URI[md5sum] =3D "e9918200ed4a778e2b3cbe34c1be4205"
> -SRC_URI[sha256sum] =3D "9e604ba5c5c8ea403487695c2e407405820d98540d9de884=
d6e844f9a9c5ba08"
> +SRC_URI[md5sum] =3D "33e3fb5501bb2142184238c815b0beb8"
> +SRC_URI[sha256sum] =3D "dd77509fe8f5304deafbca654dc7f0ea57f5841f41ba530c=
ff9a5bf71382739e"
>
>  inherit autotools texinfo lib_package gtk-doc
>
> +do_install_append () {
> +    # this utility is not useful and has a bogus RPATH

if bogus rpath is the reason to delete it then its better to nick it
with chrpath --delete

> +    rm ${D}/${bindir}/corpus2array
> +}
> +
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

