Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web11.10155.1593185233932795958
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 08:27:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Kj/Qy5NM;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.66, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f66.google.com with SMTP id rk21so9794971ejb.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 08:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cj5gshx7WswA2XM7hOB/7TPkEDtd4d6qMbNgkHLkBeE=;
        b=Kj/Qy5NMyDqHl7TaWxDRGE+NoH1v6CtOQy5MIwlgajHxhenNlNAeKjAjUzY0dyEskQ
         HT0S7xn7vKmHKjgOAOXnYEi9exaVbNaLFqaXXtxdiE2fQcLYK7QdLZWmQ/Un5giH4/Ui
         iUPRMg5pJJRawVp1Y1C15lBW0eroZlVf56KCyxBkk1DwVWLAZ4LCFVpswl69XLEGLM6M
         5bBdQ1dlOXjFto7TRTPkYIXnUfR575bKaLiEEjXdEVlcltEOoQ6wVYoiBEOqa/6gCGAZ
         IfxdG2Pl2eP67Jdx3wpy0wT9OkUuOSKqG6vOILgzgc7uLczD/BZNp5/0KQULGrcWLKCK
         p+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cj5gshx7WswA2XM7hOB/7TPkEDtd4d6qMbNgkHLkBeE=;
        b=cEgLYQCL/fg90Q/ssvxGNY0LkX2klozttlkljTytx5V84IJBA6U74V0ALt4KzESNG9
         fAOwKJyPgg2OMdpVwk7Si0Hx30y6iOAwGq37aML1Jv0Xi4q8lxIhgb0V1zJaVttZnT3Z
         sKsFo24Iw5zF/UewfgL34nuKKFrEj6Mc3cajkX7GxB3uad1NzIHNtP5aCHPG1QCJGfp0
         mrMAu0MZXcFPVwlufe51ttNhtRXgN4KIDBnMBGYvRtvLYXF8rw92Abgjx3/IygWfdTm6
         0+IYmXuXykc414qBkAZHEXEwxgN4yZA0b4LH/wADSFcLcvF5HFIcbzllBkWtCgGZlqm5
         dKHg==
X-Gm-Message-State: AOAM532MwhHDaAaixu7Dj1dldaS196KVkUSgNh5L3MBH+jNl7DSrIRFa
	UkcTNOKlXBcJ43loCHLL4C/gfjSwrwd1OxYH6EyB6A==
X-Google-Smtp-Source: ABdhPJxQ+QCwI78lZbcKfO3Pp11vtt0tP7n5DA/LvqI/RpL0vZnq78voiT4MMxS9v2OQ00Mkjhx3/J2nw0Ls/A2emvw=
X-Received: by 2002:a17:906:4757:: with SMTP id j23mr2860569ejs.431.1593185232195;
 Fri, 26 Jun 2020 08:27:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200623210837.26222-1-alex.kanavin@gmail.com>
 <CAOSpxdYUPQwNmZNP8FF7M=M2a95Wfvth0xpcO+C3G7bGKiJXCw@mail.gmail.com>
 <CANNYZj_U=WVHNrZLZK8_pNdgHf9YyKvfpFdcSrCTrq+8X-njKA@mail.gmail.com> <CAOSpxdbUVhvu_0sYvEWxiq=c8UAt1k-o4=9AXWJaMCPo5xQUsg@mail.gmail.com>
In-Reply-To: <CAOSpxdbUVhvu_0sYvEWxiq=c8UAt1k-o4=9AXWJaMCPo5xQUsg@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Fri, 26 Jun 2020 05:26:59 -1000
Message-ID: <CAOSpxdYOgf7Jj3O1ebFUOZo1ccZs0K=K1L6vd7rcO0d8s0vtjQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] icu: merge .inc into main recipe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 25, 2020 at 6:23 AM Steve Sakoman <steve@sakoman.com> wrote:
>
> On Thu, Jun 25, 2020 at 6:09 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > I think you may have to recreate them by hand.
>
> OK, I'll put together a patch for the 66.1 recipe in dunfell that
> implements the changes you have in the second patch of the series.  In
> the interest of minimizing changes I'll keep the .inc file separate as
> is.

I recreated the patch for 66.1 and did a couple of quick local builds
and things looked fine.

On the autobuilder I get failures for edgerouter and mips.  I seem to
recall some discussion about this (perhaps on irc?) but can only find
one thread here on the list back when Khem's original patch went in.

Did you recall any issues like this?

Steve


> > On Thu, 25 Jun 2020 at 18:04, Steve Sakoman <steve@sakoman.com> wrote:
> >>
> >> Is this patch series suitable for dunfell as-is (the concern being the
> >> contents of the version bump) or would a backport to 66.1 be
> >> necessary?
> >>
> >> Steve
> >>
> >> On Tue, Jun 23, 2020 at 11:09 AM Alexander Kanavin
> >> <alex.kanavin@gmail.com> wrote:
> >> >
> >> > Both parts are rather convoluted, so it is better to have them in a single file.
> >> >
> >> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >> > ---
> >> >  meta/recipes-support/icu/icu.inc     | 84 ---------------------------
> >> >  meta/recipes-support/icu/icu_67.1.bb | 85 +++++++++++++++++++++++++++-
> >> >  2 files changed, 84 insertions(+), 85 deletions(-)
> >> >  delete mode 100644 meta/recipes-support/icu/icu.inc
> >> >
> >> > diff --git a/meta/recipes-support/icu/icu.inc b/meta/recipes-support/icu/icu.inc
> >> > deleted file mode 100644
> >> > index 6d9728903d..0000000000
> >> > --- a/meta/recipes-support/icu/icu.inc
> >> > +++ /dev/null
> >> > @@ -1,84 +0,0 @@
> >> > -SUMMARY = "International Component for Unicode libraries"
> >> > -DESCRIPTION = "The International Component for Unicode (ICU) is a mature, \
> >> > -portable set of C/C++ and Java libraries for Unicode support, software \
> >> > -internationalization (I18N) and globalization (G11N), giving applications the \
> >> > -same results on all platforms."
> >> > -HOMEPAGE = "http://site.icu-project.org/"
> >> > -
> >> > -LICENSE = "ICU"
> >> > -DEPENDS = "icu-native"
> >> > -DEPENDS_class-native = ""
> >> > -
> >> > -CVE_PRODUCT = "international_components_for_unicode"
> >> > -
> >> > -S = "${WORKDIR}/icu/source"
> >> > -SPDX_S = "${WORKDIR}/icu"
> >> > -STAGING_ICU_DIR_NATIVE = "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
> >> > -
> >> > -BINCONFIG = "${bindir}/icu-config"
> >> > -
> >> > -ICU_MAJOR_VER = "${@d.getVar('PV').split('.')[0]}"
> >> > -
> >> > -inherit autotools pkgconfig binconfig multilib_script
> >> > -
> >> > -MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/icu-config"
> >> > -
> >> > -# ICU needs the native build directory as an argument to its --with-cross-build option when
> >> > -# cross-compiling. Taken the situation that different builds may share a common sstate-cache
> >> > -# into consideration, the native build directory needs to be staged.
> >> > -EXTRA_OECONF = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
> >> > -EXTRA_OECONF_class-native = ""
> >> > -EXTRA_OECONF_class-nativesdk = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
> >> > -
> >> > -EXTRA_OECONF_append_class-target = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' --with-data-packaging=archive', '', d)}"
> >> > -TARGET_CXXFLAGS_append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' -DICU_DATA_DIR=\\""${datadir}/${BPN}/${PV}\\""', '', d)}"
> >> > -
> >> > -ASNEEDED = ""
> >> > -
> >> > -do_compile_prepend_class-target () {
> >> > -       # Make sure certain build host references do not end up being compiled
> >> > -       # in the image. This only affects libicutu and icu-dbg
> >> > -       sed  \
> >> > -           -e 's,DU_BUILD=,DU_BUILD_unused=,g' \
> >> > -           -e '/^CPPFLAGS.*/ s,--sysroot=${STAGING_DIR_TARGET},,g' \
> >> > -           -i ${B}/tools/toolutil/Makefile
> >> > -}
> >> > -
> >> > -PREPROCESS_RELOCATE_DIRS = "${datadir}/${BPN}/${PV}"
> >> > -do_install_append_class-native() {
> >> > -       mkdir -p ${D}/${STAGING_ICU_DIR_NATIVE}/config
> >> > -       cp -r ${B}/config/icucross.mk ${D}/${STAGING_ICU_DIR_NATIVE}/config
> >> > -       cp -r ${B}/config/icucross.inc ${D}/${STAGING_ICU_DIR_NATIVE}/config
> >> > -       cp -r ${B}/lib ${D}/${STAGING_ICU_DIR_NATIVE}
> >> > -       cp -r ${B}/bin ${D}/${STAGING_ICU_DIR_NATIVE}
> >> > -       cp -r ${B}/tools ${D}/${STAGING_ICU_DIR_NATIVE}
> >> > -}
> >> > -
> >> > -do_install_append_class-target() {
> >> > -    # The native pkgdata can not generate the correct data file.
> >> > -    # Use icupkg to re-generate it.
> >> > -    if [ "${SITEINFO_ENDIANNESS}" = "be" ] ; then
> >> > -        rm -f ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
> >> > -        icupkg -tb ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
> >> > -    fi
> >> > -
> >> > -       # Remove build host references...
> >> > -       sed -i  \
> >> > -           -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
> >> > -           -e 's|${DEBUG_PREFIX_MAP}||g' \
> >> > -           -e 's:${HOSTTOOLS_DIR}/::g' \
> >> > -           ${D}/${bindir}/icu-config ${D}/${libdir}/${BPN}/${PV}/Makefile.inc \
> >> > -           ${D}/${libdir}/${BPN}/${PV}/pkgdata.inc
> >> > -}
> >> > -
> >> > -PACKAGES =+ "libicudata libicuuc libicui18n libicutu libicuio"
> >> > -
> >> > -FILES_${PN}-dev += "${libdir}/${BPN}/"
> >> > -
> >> > -FILES_libicudata = "${libdir}/libicudata.so.*"
> >> > -FILES_libicuuc = "${libdir}/libicuuc.so.*"
> >> > -FILES_libicui18n = "${libdir}/libicui18n.so.*"
> >> > -FILES_libicutu = "${libdir}/libicutu.so.*"
> >> > -FILES_libicuio = "${libdir}/libicuio.so.*"
> >> > -
> >> > -BBCLASSEXTEND = "native nativesdk"
> >> > diff --git a/meta/recipes-support/icu/icu_67.1.bb b/meta/recipes-support/icu/icu_67.1.bb
> >> > index 58638507c9..5814fa41bd 100644
> >> > --- a/meta/recipes-support/icu/icu_67.1.bb
> >> > +++ b/meta/recipes-support/icu/icu_67.1.bb
> >> > @@ -1,4 +1,87 @@
> >> > -require icu.inc
> >> > +SUMMARY = "International Component for Unicode libraries"
> >> > +DESCRIPTION = "The International Component for Unicode (ICU) is a mature, \
> >> > +portable set of C/C++ and Java libraries for Unicode support, software \
> >> > +internationalization (I18N) and globalization (G11N), giving applications the \
> >> > +same results on all platforms."
> >> > +HOMEPAGE = "http://site.icu-project.org/"
> >> > +
> >> > +LICENSE = "ICU"
> >> > +DEPENDS = "icu-native"
> >> > +DEPENDS_class-native = ""
> >> > +
> >> > +CVE_PRODUCT = "international_components_for_unicode"
> >> > +
> >> > +S = "${WORKDIR}/icu/source"
> >> > +SPDX_S = "${WORKDIR}/icu"
> >> > +STAGING_ICU_DIR_NATIVE = "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
> >> > +
> >> > +BINCONFIG = "${bindir}/icu-config"
> >> > +
> >> > +ICU_MAJOR_VER = "${@d.getVar('PV').split('.')[0]}"
> >> > +
> >> > +inherit autotools pkgconfig binconfig multilib_script
> >> > +
> >> > +MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/icu-config"
> >> > +
> >> > +# ICU needs the native build directory as an argument to its --with-cross-build option when
> >> > +# cross-compiling. Taken the situation that different builds may share a common sstate-cache
> >> > +# into consideration, the native build directory needs to be staged.
> >> > +EXTRA_OECONF = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
> >> > +EXTRA_OECONF_class-native = ""
> >> > +EXTRA_OECONF_class-nativesdk = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
> >> > +
> >> > +EXTRA_OECONF_append_class-target = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' --with-data-packaging=archive', '', d)}"
> >> > +TARGET_CXXFLAGS_append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' -DICU_DATA_DIR=\\""${datadir}/${BPN}/${PV}\\""', '', d)}"
> >> > +
> >> > +ASNEEDED = ""
> >> > +
> >> > +do_compile_prepend_class-target () {
> >> > +       # Make sure certain build host references do not end up being compiled
> >> > +       # in the image. This only affects libicutu and icu-dbg
> >> > +       sed  \
> >> > +           -e 's,DU_BUILD=,DU_BUILD_unused=,g' \
> >> > +           -e '/^CPPFLAGS.*/ s,--sysroot=${STAGING_DIR_TARGET},,g' \
> >> > +           -i ${B}/tools/toolutil/Makefile
> >> > +}
> >> > +
> >> > +PREPROCESS_RELOCATE_DIRS = "${datadir}/${BPN}/${PV}"
> >> > +do_install_append_class-native() {
> >> > +       mkdir -p ${D}/${STAGING_ICU_DIR_NATIVE}/config
> >> > +       cp -r ${B}/config/icucross.mk ${D}/${STAGING_ICU_DIR_NATIVE}/config
> >> > +       cp -r ${B}/config/icucross.inc ${D}/${STAGING_ICU_DIR_NATIVE}/config
> >> > +       cp -r ${B}/lib ${D}/${STAGING_ICU_DIR_NATIVE}
> >> > +       cp -r ${B}/bin ${D}/${STAGING_ICU_DIR_NATIVE}
> >> > +       cp -r ${B}/tools ${D}/${STAGING_ICU_DIR_NATIVE}
> >> > +}
> >> > +
> >> > +do_install_append_class-target() {
> >> > +    # The native pkgdata can not generate the correct data file.
> >> > +    # Use icupkg to re-generate it.
> >> > +    if [ "${SITEINFO_ENDIANNESS}" = "be" ] ; then
> >> > +        rm -f ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
> >> > +        icupkg -tb ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
> >> > +    fi
> >> > +
> >> > +       # Remove build host references...
> >> > +       sed -i  \
> >> > +           -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
> >> > +           -e 's|${DEBUG_PREFIX_MAP}||g' \
> >> > +           -e 's:${HOSTTOOLS_DIR}/::g' \
> >> > +           ${D}/${bindir}/icu-config ${D}/${libdir}/${BPN}/${PV}/Makefile.inc \
> >> > +           ${D}/${libdir}/${BPN}/${PV}/pkgdata.inc
> >> > +}
> >> > +
> >> > +PACKAGES =+ "libicudata libicuuc libicui18n libicutu libicuio"
> >> > +
> >> > +FILES_${PN}-dev += "${libdir}/${BPN}/"
> >> > +
> >> > +FILES_libicudata = "${libdir}/libicudata.so.*"
> >> > +FILES_libicuuc = "${libdir}/libicuuc.so.*"
> >> > +FILES_libicui18n = "${libdir}/libicui18n.so.*"
> >> > +FILES_libicutu = "${libdir}/libicutu.so.*"
> >> > +FILES_libicuio = "${libdir}/libicuio.so.*"
> >> > +
> >> > +BBCLASSEXTEND = "native nativesdk"
> >> >
> >> >  LIC_FILES_CHKSUM = "file://../LICENSE;md5=a3808a5b70071b07f87ff2205e4d75a0"
> >> >
> >> > --
> >> > 2.27.0
> >> >
> >> > 
