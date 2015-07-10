Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 601086017E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 09:42:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6A9gJfL008911
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 10 Jul 2015 02:42:20 -0700 (PDT)
Received: from [128.224.162.176] (128.224.162.176) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Jul 2015 02:42:19 -0700
Message-ID: <559F9379.4010405@windriver.com>
Date: Fri, 10 Jul 2015 17:42:17 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1436519235-30329-1-git-send-email-wenzong.fan@windriver.com>
	<CAJTo0LbttKSEWidhd4CwH3sJwk7RVbJvo5NSbY6cSzSpbOgu4w@mail.gmail.com>
In-Reply-To: <CAJTo0LbttKSEWidhd4CwH3sJwk7RVbJvo5NSbY6cSzSpbOgu4w@mail.gmail.com>
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
X-List-Received-Date: Fri, 10 Jul 2015 09:42:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2015 05:15 PM, Burton, Ross wrote:
> meta-perl patches go to openembedded-devel list.

Sorry for the wrong post, I'll re-send it to oe-devel list.

Wenzong

>
> Ross
>
> On 10 July 2015 at 10:07, <wenzong.fan@windriver.com
> <mailto:wenzong.fan@windriver.com>> wrote:
>
>     From: Wenzong Fan <wenzong.fan@windriver.com
>     <mailto:wenzong.fan@windriver.com>>
>
>     Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com
>     <mailto:wenzong.fan@windriver.com>>
>     ---
>       .../libxml/libxml-libxml-perl_2.0116.bb
>     <http://libxml-libxml-perl_2.0116.bb>            | 47
>     ----------------------
>       .../libxml/libxml-libxml-perl_2.0121.bb
>     <http://libxml-libxml-perl_2.0121.bb>            | 47
>     ++++++++++++++++++++++
>       2 files changed, 47 insertions(+), 47 deletions(-)
>       delete mode 100644
>     meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0116.bb
>     <http://libxml-libxml-perl_2.0116.bb>
>       create mode 100644
>     meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0121.bb
>     <http://libxml-libxml-perl_2.0121.bb>
>
>     diff --git
>     a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0116.bb
>     <http://libxml-libxml-perl_2.0116.bb>
>     b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0116.bb
>     <http://libxml-libxml-perl_2.0116.bb>
>     deleted file mode 100644
>     index 2a6dbc2..0000000
>     --- a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0116.bb
>     <http://libxml-libxml-perl_2.0116.bb>
>     +++ /dev/null
>     @@ -1,47 +0,0 @@
>     -SUMMARY = "Perl interface to the libxml2 library"
>     -DESCRIPTION = "This module is an interface to libxml2, providing
>     XML and HTML parsers \
>     -with DOM, SAX and XMLReader interfaces, a large subset of DOM Layer 3 \
>     -interface and a XML::XPath-like interface to XPath API of libxml2. \
>     -The module is split into several packages which are not described
>     in this \
>     -section; unless stated otherwise, you only need to use XML::LibXML;
>     in \
>     -your programs."
>     -
>     -HOMEPAGE = "http://search.cpan.org/dist/XML-LibXML-1.99/"
>     -SECTION = "libs"
>     -LICENSE = "Artistic-1.0|GPLv1+"
>     -DEPENDS += "libxml2 \
>     -        libxml-sax-perl-native \
>     -        zlib \
>     -"
>     -RDEPENDS_${PN} += "libxml2 \
>     -        libxml-sax-perl \
>     -        libxml-sax-base-perl \
>     -        zlib \
>     -"
>     -
>     -SRC_URI =
>     "http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/XML-LibXML-${PV}.tar.gz;name=libxml
>     \
>     -       file://disable-libxml2-check.patch \
>     -       file://fix-CATALOG-conditional-compile.patch \
>     -       file://using-DOCB-conditional.patch \
>     -"
>     -LIC_FILES_CHKSUM =
>     "file://debian/copyright;md5=75e021e35a906347f46c9ff163653e2a \
>     -
>       file://LICENSE;md5=97871bde150daeb5e61ad95137ff2446"
>     -SRC_URI[libxml.md5sum] = "a53a743bf053a0cb4afb41513fb8a684"
>     -SRC_URI[libxml.sha256sum] =
>     "b154f2dad3033b30d22ac81b8985b69ad35450b0c552db394cd03bb36845812a"
>     -
>     -S = "${WORKDIR}/XML-LibXML-${PV}"
>     -
>     -inherit cpan
>     -
>     -EXTRA_CPANFLAGS = "INC=-I${STAGING_INCDIR}/libxml2
>     LIBS=-L${STAGING_LIBDIR}"
>     -
>     -BBCLASSEXTEND = "native"
>     -
>     -CFLAGS += " -D_GNU_SOURCE "
>     -BUILD_CFLAGS += " -D_GNU_SOURCE "
>     -
>     -do_configure_prepend() {
>     -       rm -rf ${S}/.pc/*
>     -}
>     -
>     -FILES_${PN}-dbg =+
>     "${libdir}/perl/vendor_perl/*/auto/XML/LibXML/.debug/"
>     diff --git
>     a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0121.bb
>     <http://libxml-libxml-perl_2.0121.bb>
>     b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0121.bb
>     <http://libxml-libxml-perl_2.0121.bb>
>     new file mode 100644
>     index 0000000..9066000
>     --- /dev/null
>     +++ b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0121.bb
>     <http://libxml-libxml-perl_2.0121.bb>
>     @@ -0,0 +1,47 @@
>     +SUMMARY = "Perl interface to the libxml2 library"
>     +DESCRIPTION = "This module is an interface to libxml2, providing
>     XML and HTML parsers \
>     +with DOM, SAX and XMLReader interfaces, a large subset of DOM Layer 3 \
>     +interface and a XML::XPath-like interface to XPath API of libxml2. \
>     +The module is split into several packages which are not described
>     in this \
>     +section; unless stated otherwise, you only need to use XML::LibXML;
>     in \
>     +your programs."
>     +
>     +HOMEPAGE = "http://search.cpan.org/dist/XML-LibXML-1.99/"
>     +SECTION = "libs"
>     +LICENSE = "Artistic-1.0|GPLv1+"
>     +DEPENDS += "libxml2 \
>     +        libxml-sax-perl-native \
>     +        zlib \
>     +"
>     +RDEPENDS_${PN} += "libxml2 \
>     +        libxml-sax-perl \
>     +        libxml-sax-base-perl \
>     +        zlib \
>     +"
>     +
>     +SRC_URI =
>     "http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/XML-LibXML-${PV}.tar.gz;name=libxml
>     \
>     +       file://disable-libxml2-check.patch \
>     +       file://fix-CATALOG-conditional-compile.patch \
>     +       file://using-DOCB-conditional.patch \
>     +"
>     +LIC_FILES_CHKSUM =
>     "file://debian/copyright;md5=75e021e35a906347f46c9ff163653e2a \
>     +
>       file://LICENSE;md5=97871bde150daeb5e61ad95137ff2446"
>     +SRC_URI[libxml.md5sum] = "1544ab9ac110f5da296015346561ce02"
>     +SRC_URI[libxml.sha256sum] =
>     "ec431011cb37a04640fd2316f64d0405a274eece2c6f3847f7fbd336eb1c0dc9"
>     +
>     +S = "${WORKDIR}/XML-LibXML-${PV}"
>     +
>     +inherit cpan
>     +
>     +EXTRA_CPANFLAGS = "INC=-I${STAGING_INCDIR}/libxml2
>     LIBS=-L${STAGING_LIBDIR}"
>     +
>     +BBCLASSEXTEND = "native"
>     +
>     +CFLAGS += " -D_GNU_SOURCE "
>     +BUILD_CFLAGS += " -D_GNU_SOURCE "
>     +
>     +do_configure_prepend() {
>     +       rm -rf ${S}/.pc/*
>     +}
>     +
>     +FILES_${PN}-dbg =+
>     "${libdir}/perl/vendor_perl/*/auto/XML/LibXML/.debug/"
>     --
>     1.9.1
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

