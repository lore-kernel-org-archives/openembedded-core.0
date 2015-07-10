Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 62E426017E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 09:15:46 +0000 (UTC)
Received: by qkdv3 with SMTP id v3so7555478qkd.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 02:15:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=pY9bKVTFg1VlMRahnW8ZljFgHkXclkZrqiKaUrzvYM0=;
	b=dUiEAE3qqkpq/cOxbxBoFR72O9+Twej1EaHG+HPpvCTh5FmGCkiepRmODUekKxHo6r
	+oX1m29YLKotl+WzD4oeYqXMh19mfeRj5QNpmO65qFy4DpSf7a3ciRtT55CHk0PUr/dr
	sv8uxGV6elr5EkbXTROS8CirSGHunTk5kRhHThS8pOrH2zJV08MdnMhe2oUSYC6+6TkG
	i/OLuVe0HsO1AQrdVTE501YcY4+l2rWmRdfNM6pTPdEVg3eDLO4Z7gzrcCiRkN4U4X/Q
	YuEL27lyAMwwxwHc2RGA24+nynE31G53gxxRkROiiGmYCJ6iHjbwSzNZa63gj7iWI3U1
	M53A==
X-Gm-Message-State: ALoCoQk58auNKF2qWf9f54GoJKSmGtqic1fvu9aQCcC627GTx/o5zHwLKNoXCXApBM6uBKOkBhHP
X-Received: by 10.55.15.129 with SMTP id 1mr31101486qkp.29.1436519747049; Fri,
	10 Jul 2015 02:15:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 10 Jul 2015 02:15:27 -0700 (PDT)
In-Reply-To: <1436519235-30329-1-git-send-email-wenzong.fan@windriver.com>
References: <1436519235-30329-1-git-send-email-wenzong.fan@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 Jul 2015 10:15:27 +0100
Message-ID: <CAJTo0LbttKSEWidhd4CwH3sJwk7RVbJvo5NSbY6cSzSpbOgu4w@mail.gmail.com>
To: wenzong fan <wenzong.fan@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][meta-perl] libxml-libxml-perl: update from 2.0116 to 2.0121
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
X-List-Received-Date: Fri, 10 Jul 2015 09:15:47 -0000
Content-Type: multipart/alternative; boundary=001a1146f1003c6c37051a81d1ea

--001a1146f1003c6c37051a81d1ea
Content-Type: text/plain; charset=UTF-8

meta-perl patches go to openembedded-devel list.

Ross

On 10 July 2015 at 10:07, <wenzong.fan@windriver.com> wrote:

> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>  .../libxml/libxml-libxml-perl_2.0116.bb            | 47
> ----------------------
>  .../libxml/libxml-libxml-perl_2.0121.bb            | 47
> ++++++++++++++++++++++
>  2 files changed, 47 insertions(+), 47 deletions(-)
>  delete mode 100644 meta-perl/recipes-perl/libxml/
> libxml-libxml-perl_2.0116.bb
>  create mode 100644 meta-perl/recipes-perl/libxml/
> libxml-libxml-perl_2.0121.bb
>
> diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0116.bb
> b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0116.bb
> deleted file mode 100644
> index 2a6dbc2..0000000
> --- a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0116.bb
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -SUMMARY = "Perl interface to the libxml2 library"
> -DESCRIPTION = "This module is an interface to libxml2, providing XML and
> HTML parsers \
> -with DOM, SAX and XMLReader interfaces, a large subset of DOM Layer 3 \
> -interface and a XML::XPath-like interface to XPath API of libxml2. \
> -The module is split into several packages which are not described in this
> \
> -section; unless stated otherwise, you only need to use XML::LibXML; in \
> -your programs."
> -
> -HOMEPAGE = "http://search.cpan.org/dist/XML-LibXML-1.99/"
> -SECTION = "libs"
> -LICENSE = "Artistic-1.0|GPLv1+"
> -DEPENDS += "libxml2 \
> -        libxml-sax-perl-native \
> -        zlib \
> -"
> -RDEPENDS_${PN} += "libxml2 \
> -        libxml-sax-perl \
> -        libxml-sax-base-perl \
> -        zlib \
> -"
> -
> -SRC_URI = "
> http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/XML-LibXML-${PV}.tar.gz;name=libxml
> \
> -       file://disable-libxml2-check.patch \
> -       file://fix-CATALOG-conditional-compile.patch \
> -       file://using-DOCB-conditional.patch \
> -"
> -LIC_FILES_CHKSUM =
> "file://debian/copyright;md5=75e021e35a906347f46c9ff163653e2a \
> -
>  file://LICENSE;md5=97871bde150daeb5e61ad95137ff2446"
> -SRC_URI[libxml.md5sum] = "a53a743bf053a0cb4afb41513fb8a684"
> -SRC_URI[libxml.sha256sum] =
> "b154f2dad3033b30d22ac81b8985b69ad35450b0c552db394cd03bb36845812a"
> -
> -S = "${WORKDIR}/XML-LibXML-${PV}"
> -
> -inherit cpan
> -
> -EXTRA_CPANFLAGS = "INC=-I${STAGING_INCDIR}/libxml2
> LIBS=-L${STAGING_LIBDIR}"
> -
> -BBCLASSEXTEND = "native"
> -
> -CFLAGS += " -D_GNU_SOURCE "
> -BUILD_CFLAGS += " -D_GNU_SOURCE "
> -
> -do_configure_prepend() {
> -       rm -rf ${S}/.pc/*
> -}
> -
> -FILES_${PN}-dbg =+ "${libdir}/perl/vendor_perl/*/auto/XML/LibXML/.debug/"
> diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0121.bb
> b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0121.bb
> new file mode 100644
> index 0000000..9066000
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0121.bb
> @@ -0,0 +1,47 @@
> +SUMMARY = "Perl interface to the libxml2 library"
> +DESCRIPTION = "This module is an interface to libxml2, providing XML and
> HTML parsers \
> +with DOM, SAX and XMLReader interfaces, a large subset of DOM Layer 3 \
> +interface and a XML::XPath-like interface to XPath API of libxml2. \
> +The module is split into several packages which are not described in this
> \
> +section; unless stated otherwise, you only need to use XML::LibXML; in \
> +your programs."
> +
> +HOMEPAGE = "http://search.cpan.org/dist/XML-LibXML-1.99/"
> +SECTION = "libs"
> +LICENSE = "Artistic-1.0|GPLv1+"
> +DEPENDS += "libxml2 \
> +        libxml-sax-perl-native \
> +        zlib \
> +"
> +RDEPENDS_${PN} += "libxml2 \
> +        libxml-sax-perl \
> +        libxml-sax-base-perl \
> +        zlib \
> +"
> +
> +SRC_URI = "
> http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/XML-LibXML-${PV}.tar.gz;name=libxml
> \
> +       file://disable-libxml2-check.patch \
> +       file://fix-CATALOG-conditional-compile.patch \
> +       file://using-DOCB-conditional.patch \
> +"
> +LIC_FILES_CHKSUM =
> "file://debian/copyright;md5=75e021e35a906347f46c9ff163653e2a \
> +
>  file://LICENSE;md5=97871bde150daeb5e61ad95137ff2446"
> +SRC_URI[libxml.md5sum] = "1544ab9ac110f5da296015346561ce02"
> +SRC_URI[libxml.sha256sum] =
> "ec431011cb37a04640fd2316f64d0405a274eece2c6f3847f7fbd336eb1c0dc9"
> +
> +S = "${WORKDIR}/XML-LibXML-${PV}"
> +
> +inherit cpan
> +
> +EXTRA_CPANFLAGS = "INC=-I${STAGING_INCDIR}/libxml2
> LIBS=-L${STAGING_LIBDIR}"
> +
> +BBCLASSEXTEND = "native"
> +
> +CFLAGS += " -D_GNU_SOURCE "
> +BUILD_CFLAGS += " -D_GNU_SOURCE "
> +
> +do_configure_prepend() {
> +       rm -rf ${S}/.pc/*
> +}
> +
> +FILES_${PN}-dbg =+ "${libdir}/perl/vendor_perl/*/auto/XML/LibXML/.debug/"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1146f1003c6c37051a81d1ea
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">meta-perl patches go to openembedded-devel list.<div><br><=
/div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmai=
l_quote">On 10 July 2015 at 10:07,  <span dir=3D"ltr">&lt;<a href=3D"mailto=
:wenzong.fan@windriver.com" target=3D"_blank">wenzong.fan@windriver.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Wenzong Fan &lt;=
<a href=3D"mailto:wenzong.fan@windriver.com">wenzong.fan@windriver.com</a>&=
gt;<br>
<br>
Signed-off-by: Wenzong Fan &lt;<a href=3D"mailto:wenzong.fan@windriver.com"=
>wenzong.fan@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../libxml/<a href=3D"http://libxml-libxml-perl_2.0116.bb" rel=3D"nor=
eferrer" target=3D"_blank">libxml-libxml-perl_2.0116.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 47 ----------------------<br>
=C2=A0.../libxml/<a href=3D"http://libxml-libxml-perl_2.0121.bb" rel=3D"nor=
eferrer" target=3D"_blank">libxml-libxml-perl_2.0121.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 47 ++++++++++++++++++++++<br>
=C2=A02 files changed, 47 insertions(+), 47 deletions(-)<br>
=C2=A0delete mode 100644 meta-perl/recipes-perl/libxml/<a href=3D"http://li=
bxml-libxml-perl_2.0116.bb" rel=3D"noreferrer" target=3D"_blank">libxml-lib=
xml-perl_2.0116.bb</a><br>
=C2=A0create mode 100644 meta-perl/recipes-perl/libxml/<a href=3D"http://li=
bxml-libxml-perl_2.0121.bb" rel=3D"noreferrer" target=3D"_blank">libxml-lib=
xml-perl_2.0121.bb</a><br>
<br>
diff --git a/meta-perl/recipes-perl/libxml/<a href=3D"http://libxml-libxml-=
perl_2.0116.bb" rel=3D"noreferrer" target=3D"_blank">libxml-libxml-perl_2.0=
116.bb</a> b/meta-perl/recipes-perl/libxml/<a href=3D"http://libxml-libxml-=
perl_2.0116.bb" rel=3D"noreferrer" target=3D"_blank">libxml-libxml-perl_2.0=
116.bb</a><br>
deleted file mode 100644<br>
index 2a6dbc2..0000000<br>
--- a/meta-perl/recipes-perl/libxml/<a href=3D"http://libxml-libxml-perl_2.=
0116.bb" rel=3D"noreferrer" target=3D"_blank">libxml-libxml-perl_2.0116.bb<=
/a><br>
+++ /dev/null<br>
@@ -1,47 +0,0 @@<br>
-SUMMARY =3D &quot;Perl interface to the libxml2 library&quot;<br>
-DESCRIPTION =3D &quot;This module is an interface to libxml2, providing XM=
L and HTML parsers \<br>
-with DOM, SAX and XMLReader interfaces, a large subset of DOM Layer 3 \<br=
>
-interface and a XML::XPath-like interface to XPath API of libxml2. \<br>
-The module is split into several packages which are not described in this =
\<br>
-section; unless stated otherwise, you only need to use XML::LibXML; in \<b=
r>
-your programs.&quot;<br>
-<br>
-HOMEPAGE =3D &quot;<a href=3D"http://search.cpan.org/dist/XML-LibXML-1.99/=
" rel=3D"noreferrer" target=3D"_blank">http://search.cpan.org/dist/XML-LibX=
ML-1.99/</a>&quot;<br>
-SECTION =3D &quot;libs&quot;<br>
-LICENSE =3D &quot;Artistic-1.0|GPLv1+&quot;<br>
-DEPENDS +=3D &quot;libxml2 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 libxml-sax-perl-native \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 zlib \<br>
-&quot;<br>
-RDEPENDS_${PN} +=3D &quot;libxml2 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 libxml-sax-perl \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 libxml-sax-base-perl \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 zlib \<br>
-&quot;<br>
-<br>
-SRC_URI =3D &quot;<a href=3D"http://search.cpan.org/CPAN/authors/id/S/SH/S=
HLOMIF/XML-LibXML-${PV}.tar.gz;name=3Dlibxml" rel=3D"noreferrer" target=3D"=
_blank">http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/XML-LibXML-${PV=
}.tar.gz;name=3Dlibxml</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0file://disable-libxml2-check.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-CATALOG-conditional-compile.patch \<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0file://using-DOCB-conditional.patch \<br>
-&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://debian/copyright;md5=3D75e021e35a906347f=
46c9ff163653e2a \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0file://LICENSE;md5=3D97871bde150daeb5e61ad95137ff2446&quot;<br>
-SRC_URI[libxml.md5sum] =3D &quot;a53a743bf053a0cb4afb41513fb8a684&quot;<br=
>
-SRC_URI[libxml.sha256sum] =3D &quot;b154f2dad3033b30d22ac81b8985b69ad35450=
b0c552db394cd03bb36845812a&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/XML-LibXML-${PV}&quot;<br>
-<br>
-inherit cpan<br>
-<br>
-EXTRA_CPANFLAGS =3D &quot;INC=3D-I${STAGING_INCDIR}/libxml2 LIBS=3D-L${STA=
GING_LIBDIR}&quot;<br>
-<br>
-BBCLASSEXTEND =3D &quot;native&quot;<br>
-<br>
-CFLAGS +=3D &quot; -D_GNU_SOURCE &quot;<br>
-BUILD_CFLAGS +=3D &quot; -D_GNU_SOURCE &quot;<br>
-<br>
-do_configure_prepend() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${S}/.pc/*<br>
-}<br>
-<br>
-FILES_${PN}-dbg =3D+ &quot;${libdir}/perl/vendor_perl/*/auto/XML/LibXML/.d=
ebug/&quot;<br>
diff --git a/meta-perl/recipes-perl/libxml/<a href=3D"http://libxml-libxml-=
perl_2.0121.bb" rel=3D"noreferrer" target=3D"_blank">libxml-libxml-perl_2.0=
121.bb</a> b/meta-perl/recipes-perl/libxml/<a href=3D"http://libxml-libxml-=
perl_2.0121.bb" rel=3D"noreferrer" target=3D"_blank">libxml-libxml-perl_2.0=
121.bb</a><br>
new file mode 100644<br>
index 0000000..9066000<br>
--- /dev/null<br>
+++ b/meta-perl/recipes-perl/libxml/<a href=3D"http://libxml-libxml-perl_2.=
0121.bb" rel=3D"noreferrer" target=3D"_blank">libxml-libxml-perl_2.0121.bb<=
/a><br>
@@ -0,0 +1,47 @@<br>
+SUMMARY =3D &quot;Perl interface to the libxml2 library&quot;<br>
+DESCRIPTION =3D &quot;This module is an interface to libxml2, providing XM=
L and HTML parsers \<br>
+with DOM, SAX and XMLReader interfaces, a large subset of DOM Layer 3 \<br=
>
+interface and a XML::XPath-like interface to XPath API of libxml2. \<br>
+The module is split into several packages which are not described in this =
\<br>
+section; unless stated otherwise, you only need to use XML::LibXML; in \<b=
r>
+your programs.&quot;<br>
+<br>
+HOMEPAGE =3D &quot;<a href=3D"http://search.cpan.org/dist/XML-LibXML-1.99/=
" rel=3D"noreferrer" target=3D"_blank">http://search.cpan.org/dist/XML-LibX=
ML-1.99/</a>&quot;<br>
+SECTION =3D &quot;libs&quot;<br>
+LICENSE =3D &quot;Artistic-1.0|GPLv1+&quot;<br>
+DEPENDS +=3D &quot;libxml2 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 libxml-sax-perl-native \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 zlib \<br>
+&quot;<br>
+RDEPENDS_${PN} +=3D &quot;libxml2 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 libxml-sax-perl \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 libxml-sax-base-perl \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 zlib \<br>
+&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"http://search.cpan.org/CPAN/authors/id/S/SH/S=
HLOMIF/XML-LibXML-${PV}.tar.gz;name=3Dlibxml" rel=3D"noreferrer" target=3D"=
_blank">http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/XML-LibXML-${PV=
}.tar.gz;name=3Dlibxml</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://disable-libxml2-check.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-CATALOG-conditional-compile.patch \<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://using-DOCB-conditional.patch \<br>
+&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://debian/copyright;md5=3D75e021e35a906347f=
46c9ff163653e2a \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0file://LICENSE;md5=3D97871bde150daeb5e61ad95137ff2446&quot;<br>
+SRC_URI[libxml.md5sum] =3D &quot;1544ab9ac110f5da296015346561ce02&quot;<br=
>
+SRC_URI[libxml.sha256sum] =3D &quot;ec431011cb37a04640fd2316f64d0405a274ee=
ce2c6f3847f7fbd336eb1c0dc9&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/XML-LibXML-${PV}&quot;<br>
+<br>
+inherit cpan<br>
+<br>
+EXTRA_CPANFLAGS =3D &quot;INC=3D-I${STAGING_INCDIR}/libxml2 LIBS=3D-L${STA=
GING_LIBDIR}&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native&quot;<br>
+<br>
+CFLAGS +=3D &quot; -D_GNU_SOURCE &quot;<br>
+BUILD_CFLAGS +=3D &quot; -D_GNU_SOURCE &quot;<br>
+<br>
+do_configure_prepend() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${S}/.pc/*<br>
+}<br>
+<br>
+FILES_${PN}-dbg =3D+ &quot;${libdir}/perl/vendor_perl/*/auto/XML/LibXML/.d=
ebug/&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
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

--001a1146f1003c6c37051a81d1ea--
