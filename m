Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id C741D700F0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 17:13:41 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id c199so14397062oig.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Aug 2016 10:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=hnZT4luVqIR5fd13tTjEo37Cmcg4LO+n10F7MNelk9A=;
	b=B6sCtoOf1vfSZPUrCeMprhnXnLs7x8naTzQxFerEKsHluo4GM+71tnO/FT4T3/0cWK
	uX9AwL+CarBrmq08InJTS6APQ1J+obsCH19OYnzZAo+GNSuy9V4TvmfHGDAVZ2v5Uahk
	fajGJEiSEd42BdMeIlks9Hu26/WcXsM4f/9vGwzgHGMHD/mrVGJPTXCGqxI8ky/JFKzp
	9+PIfL7aTYNakWwOfPDPYTvjfLVOA6mj0WIlJVhV7ULtOs+vGTUKf3jPjiuLF+KYX+Aj
	jFG7T6MumFtuelGrT1IoOv5BoyHS0OMhKCoD5f/Y3TAL/5ehOWszlzJRl0WlYaVGAxIC
	QrEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=hnZT4luVqIR5fd13tTjEo37Cmcg4LO+n10F7MNelk9A=;
	b=I44RixFKeUF5l9T6jT2r7kyseYnyxW0cCwtbaxJbKUHohJHpSwFEkO6kPgcMYLmA+4
	oEM9/LCi/nVhqhb+K6TjORJ7OYaT0aVdphfpW7rr2JvjP7f6/7THxsB9+D9ZMFIzIYj1
	AszJ0Nv/lm0+/2Kxsgmd5ocrsfYC9EVQXOs/AaJm3XjMun9rKu8m4oG9/1V6DWc0K9l1
	0fMlJGzqDtvK7Bi3Wxhrq8vG1OHRWMtTm/Q5fYUy8uVEZWV8sz1WsJblBG+IpskxQqLY
	uP53bZivlXQgvRt0v87cyHdBQe0NpItp8482PXmmVaiYlFAoucHtugjH7vvVrN6JhILg
	lhuQ==
X-Gm-Message-State: AEkoousv9TDPUc9REPKisQQ31iNYyknRUCvfLt9yk46kBijShj/OAtWDQ+ptbSSDuZ++idDUU72/9ak3yLdMwA==
X-Received: by 10.202.169.7 with SMTP id s7mr33517408oie.21.1470071621645;
	Mon, 01 Aug 2016 10:13:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.248.164 with HTTP; Mon, 1 Aug 2016 10:13:41 -0700 (PDT)
In-Reply-To: <1470049297-6520-1-git-send-email-fan.xin@jp.fujitsu.com>
References: <1470049297-6520-1-git-send-email-fan.xin@jp.fujitsu.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
Date: Mon, 1 Aug 2016 10:13:41 -0700
Message-ID: <CAOLEWZVAjfydiq7GwgDKWydZyL_CXDL7+dgn5gsjt+QMhBQzgA@mail.gmail.com>
To: Fan Xin <fan.xin@jp.fujitsu.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] Replace foomatic-filters with cups-filters
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
X-List-Received-Date: Mon, 01 Aug 2016 17:13:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thanks, our timing is great (since I just did the same thing on
Saturday but didn't send anything to the list yet).  Still have some
testing to do to see if it actually works; recipes are here:

https://github.com/sarnold/meta-small-arm-extra/commits/master

On Mon, Aug 1, 2016 at 4:01 AM, Fan Xin <fan.xin@jp.fujitsu.com> wrote:
> The foomatic-filters community is inactive and foomatic-filter package is=
 unmaintained.
> (http://www.gossamer-threads.com/lists/gentoo/user/288184)
>
> The foomatic-rips is moved from foomatic-filters to cups-filters and
> maintained by cups-filters according to the cups-filter's NEWS.
> (http://bzr.linuxfoundation.org/loggerhead/openprinting/cups-filters/anno=
tate/head:/NEWS)
>
> Signed-off-by: Fan Xin <fan.xin at jp.fujitsu.com>
> ---
>  .../cups-filters-1.8.2-disable-ijs.patch           | 65 ++++++++++++++++=
++++++
>  .../foomatic/cups-filters_1.8.3.bb                 | 34 +++++++++++
>  .../packagegroups/packagegroup-core-lsb.bb         |  2 +-
>  3 files changed, 100 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-extended/foomatic/cups-filters/cups-filt=
ers-1.8.2-disable-ijs.patch
>  create mode 100644 meta/recipes-extended/foomatic/cups-filters_1.8.3.bb
>
> diff --git a/meta/recipes-extended/foomatic/cups-filters/cups-filters-1.8=
.2-disable-ijs.patch b/meta/recipes-extended/foomatic/cups-filters/cups-fil=
ters-1.8.2-disable-ijs.patch
> new file mode 100644
> index 0000000..0a0a6ad
> --- /dev/null
> +++ b/meta/recipes-extended/foomatic/cups-filters/cups-filters-1.8.2-disa=
ble-ijs.patch
> @@ -0,0 +1,65 @@
> +=3D=3D=3D modified file 'Makefile.am'
> +--- Makefile.am        2016-02-10 15:16:33 +0000
> ++++ Makefile.am        2016-03-02 20:46:26 +0000
> +@@ -490,7 +490,6 @@
> +       bannertopdf \
> +       commandtoescpx \
> +       commandtopclx \
> +-      pdftoijs \
> +       sys5ippprinter \
> +       pdftops \
> +       pdftoraster \
> +@@ -499,6 +498,10 @@
> +       texttopdf \
> +       urftopdf \
> +       rastertopdf
> ++if ENABLE_IJS
> ++pkgfilter_PROGRAMS +=3D \
> ++      pdftoijs
> ++endif
> + if ENABLE_GHOSTSCRIPT
> + pkgfilter_PROGRAMS +=3D \
> +       gstoraster
> +@@ -846,9 +849,12 @@
> +       ppd/Fuji_Xerox-DocuPrint_CM305_df-PDF.ppd \
> +       ppd/Generic-PDF_Printer-PDF.ppd \
> +       ppd/HP-Color_LaserJet_CM3530_MFP-PDF.ppd \
> +-      ppd/HP-PhotoSmart_Pro_B8300-hpijs-pdftoijs.ppd \
> +       ppd/Ricoh-PDF_Printer-PDF.ppd \
> +       ppd/textonly.ppd
> ++if ENABLE_IJS
> ++ppd_DATA +=3D \
> ++      ppd/HP-PhotoSmart_Pro_B8300-hpijs-pdftoijs.ppd
> ++endif
> + if ENABLE_GHOSTSCRIPT
> + ppd_DATA +=3D \
> +       ppd/pxlcolor.ppd \
> +=3D=3D=3D modified file 'configure.ac'
> +--- configure.ac       2016-02-11 13:59:52 +0000
> ++++ configure.ac       2016-03-02 21:18:05 +0000
> +@@ -443,7 +443,7 @@
> + ])
> + PKG_CHECK_MODULES([FREETYPE], [freetype2], [AC_DEFINE([HAVE_FREETYPE_H]=
, [1], [Have FreeType2 include files])])
> + PKG_CHECK_MODULES([FONTCONFIG], [fontconfig >=3D 2.0.0])
> +-PKG_CHECK_MODULES([IJS], [ijs])
> ++PKG_CHECK_MODULES([IJS], [ijs], [have_ijs=3Dyes], [have_ijs=3Dno])
> + PKG_CHECK_MODULES([POPPLER], [poppler >=3D 0.18])
> + PKG_CHECK_MODULES([ZLIB], [zlib])
> + AC_DEFINE([HAVE_LIBZ], [], [Define that we use zlib])
> +@@ -489,6 +489,15 @@
> +       [enable_ghostscript=3D"$enableval"],
> +       [enable_ghostscript=3Dyes]
> + )
> ++AC_ARG_ENABLE([ijs],
> ++      [AS_HELP_STRING([--disable-ijs], [Disable filters using IJS.])],
> ++      [enable_ijs=3D"$enableval"],
> ++      [enable_ijs=3Dyes]
> ++)
> ++AS_IF([test "x$enable_ijs" =3D "xyes" -a "x$have_ijs" !=3D "xyes"], [
> ++       AC_MSG_ERROR([IJS not found, but requested.])
> ++])
> ++AM_CONDITIONAL(ENABLE_IJS, test "x$enable_ijs" =3D "xyes")
> + AC_ARG_WITH([pdftops],
> +       [AS_HELP_STRING([--with-pdftops=3Dvalue], [Set which pdftops to u=
se (gs,pdftops,pdftocairo,acroread,hybrid).])],
> +       [with_pdftops=3D"$withval"],
> +
> diff --git a/meta/recipes-extended/foomatic/cups-filters_1.8.3.bb b/meta/=
recipes-extended/foomatic/cups-filters_1.8.3.bb
> new file mode 100644
> index 0000000..4eef7ef
> --- /dev/null
> +++ b/meta/recipes-extended/foomatic/cups-filters_1.8.3.bb
> @@ -0,0 +1,34 @@
> +SUMMARY =3D "OpenPrinting printer support - filters"
> +DESCRIPTION =3D "CUPS is a standards-based, open source printing system =
\
> +developed by Apple Inc. for Mac OS=C2=AE X and other UNIX=C2=AE-like ope=
rating systems. \
> +CUPS uses the Internet Printing Protocol ("IPP") and provides System V a=
nd \
> +Berkeley command-line interfaces, a web interface, and a C API to manage=
 printers \
> +and print jobs. \
> + \
> +This package consists of filters used by the printer spoolers \
> +to convert the incoming PostScript data into the printer's native \
> +format using a printer-specific, but spooler-independent PPD file. \
> +"
> +
> +DEPENDS +=3D "cups tiff lcms freetype fontconfig poppler qpdf"
> +PR =3D "r0"
> +
> +LICENSE =3D "GPLv2 & LGPLv2 & MIT & GPLv2+ & GPLv3"
> +LIC_FILES_CHKSUM =3D "file://${WORKDIR}/cups-filters-${PV}/COPYING;md5=
=3Dd420e185486344da6176553848350932"
> +
> +SRC_URI =3D "http://www.openprinting.org/download/cups-filters/cups-filt=
ers-${PV}.tar.gz \
> +          "
> +
> +SRC_URI[md5sum] =3D "9ecda355e1f4c781784f902737df6321"
> +SRC_URI[sha256sum] =3D "0ad46d15737b309fe648fe39023a4eb6a3528faadbeb97d6=
ecf523df40950033"
> +
> +UPSTREAM_CHECK_REGEX =3D "cups-filters-(?P<pver>((\d|\d\d)\.*)+)\.tar\.g=
z"
> +
> +inherit autotools-brokensep pkgconfig
> +
> +EXTRA_OECONF +=3D "--disable-ijs"
> +
> +FILES_${PN} +=3D "${datadir}"
> +FILES_${PN} +=3D "${libdir}/cups"
> +
> +RDEPENDS_${PN} +=3D "bash"
> diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb=
 b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> index 29564e0..f9d356a 100644
> --- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> +++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> @@ -143,7 +143,7 @@ RDEPENDS_packagegroup-core-lsb-core =3D "\
>      file \
>      findutils \
>      fontconfig-utils \
> -    foomatic-filters \
> +    cups-filters \
>      gawk \
>      ghostscript \
>      grep \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

