Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web12.10947.1593186572290826476
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 08:49:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=PF3+dROt;
 spf=pass (domain: burtonini.com, ip: 209.85.208.196, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f196.google.com with SMTP id 9so10849508ljv.5
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 08:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ipc0oPy4Jx2fPbUwB2OjtLCzWa3rmOjvoGokJ4FoBk0=;
        b=PF3+dROtZjsd27Rd5GOIosWlM38lryQVQDpyKlxaMYzVmmYrmK1ML6/kyHHYtERERy
         IXOiXiCSQ/DjlT4yMrhij3UearwjnYtL+gX0dJQqzT1UmJ9tnTKhH8U1ZJw51KkPdHTv
         KDWBZd1k94u4Rg0/Hi4Yu3rssOZR9wgTlTP3J1wMXVlW3vZcUxYPDMxTRh1iprnso9p8
         UDnvYaPiuqEDzQ3pkwWuBXfcjgwKCN60dbd6udo681bEk/0Yv4htcxNpTwh9F1+tjIKm
         E4aeDTHJwJgYrCBAd5sVtUeq+UJOc+ZxvDNaggcwhKW01CIa6xLhOChzxhi9kR03OIEk
         BXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ipc0oPy4Jx2fPbUwB2OjtLCzWa3rmOjvoGokJ4FoBk0=;
        b=GLtiDNDQTrHrKvjvcG7WA1lyWP0cOK1p5LvoRSWf+YjXw9z1Ps9zovJTG0X+YxomrF
         PLFq4E+gyS35LvBhIUQtyvlfwkBy5IpCb8/PYJ7iEXNpUY/4+cY6nx3z9SsYwT+iKP1J
         u+YXVtETTANdqqZw7xfUXT7eGcpex4P4ZDl/C4tMKap+hQ1X1JBQCh6B7Nh7PoYZvaRH
         kDoF0TGJh6wrfh6BxUGBHeNqbZ81X8+MlxRTYylDeqfjbQAGODYhS3XQOGyISMnNtWw7
         +Jr4CJAK2a7BbShIaB+5DEokP/qX7XGJn01DHZq0QzfEwwOrbb1ZC3Wje1CHDkSe+4OB
         /tpw==
X-Gm-Message-State: AOAM532u80lXxWSE/izFCvLatYSawdDYW6VfScfO0kwk31WRsWNCFPBa
	5XIk+SmxdSdxev9xM6GMSh0UAtKEgAi4OP37KNZI4w==
X-Google-Smtp-Source: ABdhPJziaTxonuS0ZkCh0aPIdp26qQ0sWt2+o/KCfx2ope9kyWVhyP/hfTeo72D/luJjLFnkCPie5k7jaAWJ/gqRThU=
X-Received: by 2002:a05:651c:cc:: with SMTP id 12mr1774196ljr.397.1593186569655;
 Fri, 26 Jun 2020 08:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200623210837.26222-1-alex.kanavin@gmail.com>
 <CAOSpxdYUPQwNmZNP8FF7M=M2a95Wfvth0xpcO+C3G7bGKiJXCw@mail.gmail.com>
 <CANNYZj_U=WVHNrZLZK8_pNdgHf9YyKvfpFdcSrCTrq+8X-njKA@mail.gmail.com>
 <CAOSpxdbUVhvu_0sYvEWxiq=c8UAt1k-o4=9AXWJaMCPo5xQUsg@mail.gmail.com> <CAOSpxdYOgf7Jj3O1ebFUOZo1ccZs0K=K1L6vd7rcO0d8s0vtjQ@mail.gmail.com>
In-Reply-To: <CAOSpxdYOgf7Jj3O1ebFUOZo1ccZs0K=K1L6vd7rcO0d8s0vtjQ@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Fri, 26 Jun 2020 16:49:18 +0100
Message-ID: <CAAnfSTtZOqXVz0==hgM0h3WP9igfuE1u2BU48iJWsh=rsFOwPQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] icu: merge .inc into main recipe
To: Steve Sakoman <steve@sakoman.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Failures in edgerouter and MIPS screams the big-endian thing again.
ICU is a disaster here, be warned.

Ross

On Fri, 26 Jun 2020 at 16:27, Steve Sakoman <steve@sakoman.com> wrote:
>
> On Thu, Jun 25, 2020 at 6:23 AM Steve Sakoman <steve@sakoman.com> wrote:
> >
> > On Thu, Jun 25, 2020 at 6:09 AM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> > >
> > > I think you may have to recreate them by hand.
> >
> > OK, I'll put together a patch for the 66.1 recipe in dunfell that
> > implements the changes you have in the second patch of the series.  In
> > the interest of minimizing changes I'll keep the .inc file separate as
> > is.
>
> I recreated the patch for 66.1 and did a couple of quick local builds
> and things looked fine.
>
> On the autobuilder I get failures for edgerouter and mips.  I seem to
> recall some discussion about this (perhaps on irc?) but can only find
> one thread here on the list back when Khem's original patch went in.
>
> Did you recall any issues like this?
>
> Steve
>
>
> > > On Thu, 25 Jun 2020 at 18:04, Steve Sakoman <steve@sakoman.com> wrote:
> > >>
> > >> Is this patch series suitable for dunfell as-is (the concern being the
> > >> contents of the version bump) or would a backport to 66.1 be
> > >> necessary?
> > >>
> > >> Steve
> > >>
> > >> On Tue, Jun 23, 2020 at 11:09 AM Alexander Kanavin
> > >> <alex.kanavin@gmail.com> wrote:
> > >> >
> > >> > Both parts are rather convoluted, so it is better to have them in a single file.
> > >> >
> > >> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > >> > ---
> > >> >  meta/recipes-support/icu/icu.inc     | 84 ---------------------------
> > >> >  meta/recipes-support/icu/icu_67.1.bb | 85 +++++++++++++++++++++++++++-
> > >> >  2 files changed, 84 insertions(+), 85 deletions(-)
> > >> >  delete mode 100644 meta/recipes-support/icu/icu.inc
> > >> >
> > >> > diff --git a/meta/recipes-support/icu/icu.inc b/meta/recipes-support/icu/icu.inc
> > >> > deleted file mode 100644
> > >> > index 6d9728903d..0000000000
> > >> > --- a/meta/recipes-support/icu/icu.inc
> > >> > +++ /dev/null
> > >> > @@ -1,84 +0,0 @@
> > >> > -SUMMARY = "International Component for Unicode libraries"
> > >> > -DESCRIPTION = "The International Component for Unicode (ICU) is a mature, \
> > >> > -portable set of C/C++ and Java libraries for Unicode support, software \
> > >> > -internationalization (I18N) and globalization (G11N), giving applications the \
> > >> > -same results on all platforms."
> > >> > -HOMEPAGE = "http://site.icu-project.org/"
> > >> > -
> > >> > -LICENSE = "ICU"
> > >> > -DEPENDS = "icu-native"
> > >> > -DEPENDS_class-native = ""
> > >> > -
> > >> > -CVE_PRODUCT = "international_components_for_unicode"
> > >> > -
> > >> > -S = "${WORKDIR}/icu/source"
> > >> > -SPDX_S = "${WORKDIR}/icu"
> > >> > -STAGING_ICU_DIR_NATIVE = "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
> > >> > -
> > >> > -BINCONFIG = "${bindir}/icu-config"
> > >> > -
> > >> > -ICU_MAJOR_VER = "${@d.getVar('PV').split('.')[0]}"
> > >> > -
> > >> > -inherit autotools pkgconfig binconfig multilib_script
> > >> > -
> > >> > -MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/icu-config"
> > >> > -
> > >> > -# ICU needs the native build directory as an argument to its --with-cross-build option when
> > >> > -# cross-compiling. Taken the situation that different builds may share a common sstate-cache
> > >> > -# into consideration, the native build directory needs to be staged.
> > >> > -EXTRA_OECONF = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
> > >> > -EXTRA_OECONF_class-native = ""
> > >> > -EXTRA_OECONF_class-nativesdk = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
> > >> > -
> > >> > -EXTRA_OECONF_append_class-target = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' --with-data-packaging=archive', '', d)}"
> > >> > -TARGET_CXXFLAGS_append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' -DICU_DATA_DIR=\\""${datadir}/${BPN}/${PV}\\""', '', d)}"
> > >> > -
> > >> > -ASNEEDED = ""
> > >> > -
> > >> > -do_compile_prepend_class-target () {
> > >> > -       # Make sure certain build host references do not end up being compiled
> > >> > -       # in the image. This only affects libicutu and icu-dbg
> > >> > -       sed  \
> > >> > -           -e 's,DU_BUILD=,DU_BUILD_unused=,g' \
> > >> > -           -e '/^CPPFLAGS.*/ s,--sysroot=${STAGING_DIR_TARGET},,g' \
> > >> > -           -i ${B}/tools/toolutil/Makefile
> > >> > -}
> > >> > -
> > >> > -PREPROCESS_RELOCATE_DIRS = "${datadir}/${BPN}/${PV}"
> > >> > -do_install_append_class-native() {
> > >> > -       mkdir -p ${D}/${STAGING_ICU_DIR_NATIVE}/config
> > >> > -       cp -r ${B}/config/icucross.mk ${D}/${STAGING_ICU_DIR_NATIVE}/config
> > >> > -       cp -r ${B}/config/icucross.inc ${D}/${STAGING_ICU_DIR_NATIVE}/config
> > >> > -       cp -r ${B}/lib ${D}/${STAGING_ICU_DIR_NATIVE}
> > >> > -       cp -r ${B}/bin ${D}/${STAGING_ICU_DIR_NATIVE}
> > >> > -       cp -r ${B}/tools ${D}/${STAGING_ICU_DIR_NATIVE}
> > >> > -}
> > >> > -
> > >> > -do_install_append_class-target() {
> > >> > -    # The native pkgdata can not generate the correct data file.
> > >> > -    # Use icupkg to re-generate it.
> > >> > -    if [ "${SITEINFO_ENDIANNESS}" = "be" ] ; then
> > >> > -        rm -f ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
> > >> > -        icupkg -tb ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
> > >> > -    fi
> > >> > -
> > >> > -       # Remove build host references...
> > >> > -       sed -i  \
> > >> > -           -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
> > >> > -           -e 's|${DEBUG_PREFIX_MAP}||g' \
> > >> > -           -e 's:${HOSTTOOLS_DIR}/::g' \
> > >> > -           ${D}/${bindir}/icu-config ${D}/${libdir}/${BPN}/${PV}/Makefile.inc \
> > >> > -           ${D}/${libdir}/${BPN}/${PV}/pkgdata.inc
> > >> > -}
> > >> > -
> > >> > -PACKAGES =+ "libicudata libicuuc libicui18n libicutu libicuio"
> > >> > -
> > >> > -FILES_${PN}-dev += "${libdir}/${BPN}/"
> > >> > -
> > >> > -FILES_libicudata = "${libdir}/libicudata.so.*"
> > >> > -FILES_libicuuc = "${libdir}/libicuuc.so.*"
> > >> > -FILES_libicui18n = "${libdir}/libicui18n.so.*"
> > >> > -FILES_libicutu = "${libdir}/libicutu.so.*"
> > >> > -FILES_libicuio = "${libdir}/libicuio.so.*"
> > >> > -
> > >> > -BBCLASSEXTEND = "native nativesdk"
> > >> > diff --git a/meta/recipes-support/icu/icu_67.1.bb b/meta/recipes-support/icu/icu_67.1.bb
> > >> > index 58638507c9..5814fa41bd 100644
> > >> > --- a/meta/recipes-support/icu/icu_67.1.bb
> > >> > +++ b/meta/recipes-support/icu/icu_67.1.bb
> > >> > @@ -1,4 +1,87 @@
> > >> > -require icu.inc
> > >> > +SUMMARY = "International Component for Unicode libraries"
> > >> > +DESCRIPTION = "The International Component for Unicode (ICU) is a mature, \
> > >> > +portable set of C/C++ and Java libraries for Unicode support, software \
> > >> > +internationalization (I18N) and globalization (G11N), giving applications the \
> > >> > +same results on all platforms."
> > >> > +HOMEPAGE = "http://site.icu-project.org/"
> > >> > +
> > >> > +LICENSE = "ICU"
> > >> > +DEPENDS = "icu-native"
> > >> > +DEPENDS_class-native = ""
> > >> > +
> > >> > +CVE_PRODUCT = "international_components_for_unicode"
> > >> > +
> > >> > +S = "${WORKDIR}/icu/source"
> > >> > +SPDX_S = "${WORKDIR}/icu"
> > >> > +STAGING_ICU_DIR_NATIVE = "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
> > >> > +
> > >> > +BINCONFIG = "${bindir}/icu-config"
> > >> > +
> > >> > +ICU_MAJOR_VER = "${@d.getVar('PV').split('.')[0]}"
> > >> > +
> > >> > +inherit autotools pkgconfig binconfig multilib_script
> > >> > +
> > >> > +MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/icu-config"
> > >> > +
> > >> > +# ICU needs the native build directory as an argument to its --with-cross-build option when
> > >> > +# cross-compiling. Taken the situation that different builds may share a common sstate-cache
> > >> > +# into consideration, the native build directory needs to be staged.
> > >> > +EXTRA_OECONF = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
> > >> > +EXTRA_OECONF_class-native = ""
> > >> > +EXTRA_OECONF_class-nativesdk = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
> > >> > +
> > >> > +EXTRA_OECONF_append_class-target = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' --with-data-packaging=archive', '', d)}"
> > >> > +TARGET_CXXFLAGS_append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' -DICU_DATA_DIR=\\""${datadir}/${BPN}/${PV}\\""', '', d)}"
> > >> > +
> > >> > +ASNEEDED = ""
> > >> > +
> > >> > +do_compile_prepend_class-target () {
> > >> > +       # Make sure certain build host references do not end up being compiled
> > >> > +       # in the image. This only affects libicutu and icu-dbg
> > >> > +       sed  \
> > >> > +           -e 's,DU_BUILD=,DU_BUILD_unused=,g' \
> > >> > +           -e '/^CPPFLAGS.*/ s,--sysroot=${STAGING_DIR_TARGET},,g' \
> > >> > +           -i ${B}/tools/toolutil/Makefile
> > >> > +}
> > >> > +
> > >> > +PREPROCESS_RELOCATE_DIRS = "${datadir}/${BPN}/${PV}"
> > >> > +do_install_append_class-native() {
> > >> > +       mkdir -p ${D}/${STAGING_ICU_DIR_NATIVE}/config
> > >> > +       cp -r ${B}/config/icucross.mk ${D}/${STAGING_ICU_DIR_NATIVE}/config
> > >> > +       cp -r ${B}/config/icucross.inc ${D}/${STAGING_ICU_DIR_NATIVE}/config
> > >> > +       cp -r ${B}/lib ${D}/${STAGING_ICU_DIR_NATIVE}
> > >> > +       cp -r ${B}/bin ${D}/${STAGING_ICU_DIR_NATIVE}
> > >> > +       cp -r ${B}/tools ${D}/${STAGING_ICU_DIR_NATIVE}
> > >> > +}
> > >> > +
> > >> > +do_install_append_class-target() {
> > >> > +    # The native pkgdata can not generate the correct data file.
> > >> > +    # Use icupkg to re-generate it.
> > >> > +    if [ "${SITEINFO_ENDIANNESS}" = "be" ] ; then
> > >> > +        rm -f ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
> > >> > +        icupkg -tb ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
> > >> > +    fi
> > >> > +
> > >> > +       # Remove build host references...
> > >> > +       sed -i  \
> > >> > +           -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
> > >> > +           -e 's|${DEBUG_PREFIX_MAP}||g' \
> > >> > +           -e 's:${HOSTTOOLS_DIR}/::g' \
> > >> > +           ${D}/${bindir}/icu-config ${D}/${libdir}/${BPN}/${PV}/Makefile.inc \
> > >> > +           ${D}/${libdir}/${BPN}/${PV}/pkgdata.inc
> > >> > +}
> > >> > +
> > >> > +PACKAGES =+ "libicudata libicuuc libicui18n libicutu libicuio"
> > >> > +
> > >> > +FILES_${PN}-dev += "${libdir}/${BPN}/"
> > >> > +
> > >> > +FILES_libicudata = "${libdir}/libicudata.so.*"
> > >> > +FILES_libicuuc = "${libdir}/libicuuc.so.*"
> > >> > +FILES_libicui18n = "${libdir}/libicui18n.so.*"
> > >> > +FILES_libicutu = "${libdir}/libicutu.so.*"
> > >> > +FILES_libicuio = "${libdir}/libicuio.so.*"
> > >> > +
> > >> > +BBCLASSEXTEND = "native nativesdk"
> > >> >
> > >> >  LIC_FILES_CHKSUM = "file://../LICENSE;md5=a3808a5b70071b07f87ff2205e4d75a0"
> > >> >
> > >> > --
> > >> > 2.27.0
> > >> >
> > >> >
> 
