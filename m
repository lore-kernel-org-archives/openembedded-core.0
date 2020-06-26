Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web10.2329.1593200102955762846
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 12:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=grm13vmn;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.68, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f68.google.com with SMTP id g20so7557605edm.4
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 12:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=24aoUjAeP6Mlss1xEj5+PaNT3Z+O1dqkYXfbZYLpQGI=;
        b=grm13vmnSVHlOemwre3Nn4G35zOGSBisJAE4BltTh85JTgWXOtnDeCby6/Oc6BSP3o
         U7dr8QvjmaeKISZWzr7m5QtibKFKFH9Aw3c051VuAlQ6/InBSOmRRSDfOG+5/UxFtqu8
         uI9b7MbrbuSZwrUOOtTb4PMJ4qFDeNNn4KQqELJx5OX6yx2CfKdPNu82d35mMu+PbE1i
         SQHzg8CXgANYLt99pP17/39SuUfat3eqKCXVNgFiK55ymzzZP7afhlRyK0xNBppqJI5E
         5oOj4MZR9irTtey9/NaDm+KoCy3rulJYFsgx5SzM33MxKs5ydxZlPvyq9Taoq6qG5j55
         7bjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=24aoUjAeP6Mlss1xEj5+PaNT3Z+O1dqkYXfbZYLpQGI=;
        b=QTUh9kCXexxEw52YQ0PgT0k6E5CSH06xOIZXZ/Pp6fj6YA5nua1yArwkUPOUyn71Pc
         4d/rdrZFgASCrp3m3XXlhDi5CRevOrPkVVhQtZwIc/Fw1f2EzU8dgCVu5k6cE8U+BV77
         3fRyXhDNG75wr344gBx3DO+Ot91ntr/JWJS9ho/E6fyI1iZatkUmovzsUNabHYycT7oV
         Kcnd+tfK615fDrCnvR4tgLlZQqIWK1j3qpmBtlpmfMldHOzQUYdJFG6B9PqqYrGCSH61
         QTiW9h52YoTaYsSu4p58AMPwv75H6DXB9g3qH7upLhcD8mRrRQ4x4VsjAqyGZbUBMwVM
         KsTg==
X-Gm-Message-State: AOAM531ELhyNAr19e4RgEsDavcEv/XgzglPbOga0VUhV3blRdiazJiBG
	Ym521mKaa20C2BBbohmmgmxWkxE0FOsgN1KGpO2b+w==
X-Google-Smtp-Source: ABdhPJw4+hPIRbTXut6JOJxfYDdw7ROBZANNCj8V+stZT0FAllN5DpRx2oRg/7KqblRg3aMgxQ/l1Q28xiJosf9Tivo=
X-Received: by 2002:a50:c90d:: with SMTP id o13mr5043510edh.338.1593200101353;
 Fri, 26 Jun 2020 12:35:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200623210837.26222-1-alex.kanavin@gmail.com>
 <CAOSpxdYUPQwNmZNP8FF7M=M2a95Wfvth0xpcO+C3G7bGKiJXCw@mail.gmail.com>
 <CANNYZj_U=WVHNrZLZK8_pNdgHf9YyKvfpFdcSrCTrq+8X-njKA@mail.gmail.com>
 <CAOSpxdbUVhvu_0sYvEWxiq=c8UAt1k-o4=9AXWJaMCPo5xQUsg@mail.gmail.com>
 <CAOSpxdYOgf7Jj3O1ebFUOZo1ccZs0K=K1L6vd7rcO0d8s0vtjQ@mail.gmail.com>
 <CAAnfSTtZOqXVz0==hgM0h3WP9igfuE1u2BU48iJWsh=rsFOwPQ@mail.gmail.com>
 <CAOSpxdZP-aN-rWgNDpW+7nS4g-1_j5wQJ_dgxACgNo6EvonF=Q@mail.gmail.com>
 <CANNYZj_ahPyrDVL0qoPakECCVQicdMNWm_Y3wi8oB4GJuSZwoA@mail.gmail.com> <161C2CF3A1F68DB5.16301@lists.openembedded.org>
In-Reply-To: <161C2CF3A1F68DB5.16301@lists.openembedded.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Fri, 26 Jun 2020 09:34:48 -1000
Message-ID: <CAOSpxdaNLcvvL=1g5n3Sod2HoD=Umg_sSHSiNizVL4ogyf1+ew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] icu: merge .inc into main recipe
To: Steve Sakoman <steve@sakoman.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Ross Burton <ross@burtonini.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 26, 2020 at 8:56 AM Steve Sakoman via
lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
wrote:
>
> On Fri, Jun 26, 2020 at 8:48 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Can you, for the sake of testing, upgrade icu to the same version as master? Those failures do not seem to be happening there.
>
> Yes, I'll give that a try with a local build first since the
> autobuilder is undergoing normal maintenance.

The local build succeeded, so the failure does seem to be related to
the earlier version.

Is an upgrade to the new version reasonable for dunfell, or are there
feature additions that would make it unsuitable?

Steve

> > On Fri, 26 Jun 2020 at 17:59, Steve Sakoman <steve@sakoman.com> wrote:
> >>
> >> On Fri, Jun 26, 2020 at 5:49 AM Ross Burton <ross@burtonini.com> wrote:
> >> >
> >> > Failures in edgerouter and MIPS screams the big-endian thing again.
> >> > ICU is a disaster here, be warned.
> >>
> >> Good theory -- ppc failed too.
> >>
> >> Steve
> >>
> >> > On Fri, 26 Jun 2020 at 16:27, Steve Sakoman <steve@sakoman.com> wrote:
> >> > >
> >> > > On Thu, Jun 25, 2020 at 6:23 AM Steve Sakoman <steve@sakoman.com> wrote:
> >> > > >
> >> > > > On Thu, Jun 25, 2020 at 6:09 AM Alexander Kanavin
> >> > > > <alex.kanavin@gmail.com> wrote:
> >> > > > >
> >> > > > > I think you may have to recreate them by hand.
> >> > > >
> >> > > > OK, I'll put together a patch for the 66.1 recipe in dunfell that
> >> > > > implements the changes you have in the second patch of the series.  In
> >> > > > the interest of minimizing changes I'll keep the .inc file separate as
> >> > > > is.
> >> > >
> >> > > I recreated the patch for 66.1 and did a couple of quick local builds
> >> > > and things looked fine.
> >> > >
> >> > > On the autobuilder I get failures for edgerouter and mips.  I seem to
> >> > > recall some discussion about this (perhaps on irc?) but can only find
> >> > > one thread here on the list back when Khem's original patch went in.
> >> > >
> >> > > Did you recall any issues like this?
> >> > >
> >> > > Steve
> >> > >
> >> > >
> >> > > > > On Thu, 25 Jun 2020 at 18:04, Steve Sakoman <steve@sakoman.com> wrote:
> >> > > > >>
> >> > > > >> Is this patch series suitable for dunfell as-is (the concern being the
> >> > > > >> contents of the version bump) or would a backport to 66.1 be
> >> > > > >> necessary?
> >> > > > >>
> >> > > > >> Steve
> >> > > > >>
> >> > > > >> On Tue, Jun 23, 2020 at 11:09 AM Alexander Kanavin
> >> > > > >> <alex.kanavin@gmail.com> wrote:
> >> > > > >> >
> >> > > > >> > Both parts are rather convoluted, so it is better to have them in a single file.
> >> > > > >> >
> >> > > > >> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >> > > > >> > ---
> >> > > > >> >  meta/recipes-support/icu/icu.inc     | 84 ---------------------------
> >> > > > >> >  meta/recipes-support/icu/icu_67.1.bb | 85 +++++++++++++++++++++++++++-
> >> > > > >> >  2 files changed, 84 insertions(+), 85 deletions(-)
> >> > > > >> >  delete mode 100644 meta/recipes-support/icu/icu.inc
> >> > > > >> >
> >> > > > >> > diff --git a/meta/recipes-support/icu/icu.inc b/meta/recipes-support/icu/icu.inc
> >> > > > >> > deleted file mode 100644
> >> > > > >> > index 6d9728903d..0000000000
> >> > > > >> > --- a/meta/recipes-support/icu/icu.inc
> >> > > > >> > +++ /dev/null
> >> > > > >> > @@ -1,84 +0,0 @@
> >> > > > >> > -SUMMARY = "International Component for Unicode libraries"
> >> > > > >> > -DESCRIPTION = "The International Component for Unicode (ICU) is a mature, \
> >> > > > >> > -portable set of C/C++ and Java libraries for Unicode support, software \
> >> > > > >> > -internationalization (I18N) and globalization (G11N), giving applications the \
> >> > > > >> > -same results on all platforms."
> >> > > > >> > -HOMEPAGE = "http://site.icu-project.org/"
> >> > > > >> > -
> >> > > > >> > -LICENSE = "ICU"
> >> > > > >> > -DEPENDS = "icu-native"
> >> > > > >> > -DEPENDS_class-native = ""
> >> > > > >> > -
> >> > > > >> > -CVE_PRODUCT = "international_components_for_unicode"
> >> > > > >> > -
> >> > > > >> > -S = "${WORKDIR}/icu/source"
> >> > > > >> > -SPDX_S = "${WORKDIR}/icu"
> >> > > > >> > -STAGING_ICU_DIR_NATIVE = "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
> >> > > > >> > -
> >> > > > >> > -BINCONFIG = "${bindir}/icu-config"
> >> > > > >> > -
> >> > > > >> > -ICU_MAJOR_VER = "${@d.getVar('PV').split('.')[0]}"
> >> > > > >> > -
> >> > > > >> > -inherit autotools pkgconfig binconfig multilib_script
> >> > > > >> > -
> >> > > > >> > -MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/icu-config"
> >> > > > >> > -
> >> > > > >> > -# ICU needs the native build directory as an argument to its --with-cross-build option when
> >> > > > >> > -# cross-compiling. Taken the situation that different builds may share a common sstate-cache
> >> > > > >> > -# into consideration, the native build directory needs to be staged.
> >> > > > >> > -EXTRA_OECONF = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
> >> > > > >> > -EXTRA_OECONF_class-native = ""
> >> > > > >> > -EXTRA_OECONF_class-nativesdk = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
> >> > > > >> > -
> >> > > > >> > -EXTRA_OECONF_append_class-target = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' --with-data-packaging=archive', '', d)}"
> >> > > > >> > -TARGET_CXXFLAGS_append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' -DICU_DATA_DIR=\\""${datadir}/${BPN}/${PV}\\""', '', d)}"
> >> > > > >> > -
> >> > > > >> > -ASNEEDED = ""
> >> > > > >> > -
> >> > > > >> > -do_compile_prepend_class-target () {
> >> > > > >> > -       # Make sure certain build host references do not end up being compiled
> >> > > > >> > -       # in the image. This only affects libicutu and icu-dbg
> >> > > > >> > -       sed  \
> >> > > > >> > -           -e 's,DU_BUILD=,DU_BUILD_unused=,g' \
> >> > > > >> > -           -e '/^CPPFLAGS.*/ s,--sysroot=${STAGING_DIR_TARGET},,g' \
> >> > > > >> > -           -i ${B}/tools/toolutil/Makefile
> >> > > > >> > -}
> >> > > > >> > -
> >> > > > >> > -PREPROCESS_RELOCATE_DIRS = "${datadir}/${BPN}/${PV}"
> >> > > > >> > -do_install_append_class-native() {
> >> > > > >> > -       mkdir -p ${D}/${STAGING_ICU_DIR_NATIVE}/config
> >> > > > >> > -       cp -r ${B}/config/icucross.mk ${D}/${STAGING_ICU_DIR_NATIVE}/config
> >> > > > >> > -       cp -r ${B}/config/icucross.inc ${D}/${STAGING_ICU_DIR_NATIVE}/config
> >> > > > >> > -       cp -r ${B}/lib ${D}/${STAGING_ICU_DIR_NATIVE}
> >> > > > >> > -       cp -r ${B}/bin ${D}/${STAGING_ICU_DIR_NATIVE}
> >> > > > >> > -       cp -r ${B}/tools ${D}/${STAGING_ICU_DIR_NATIVE}
> >> > > > >> > -}
> >> > > > >> > -
> >> > > > >> > -do_install_append_class-target() {
> >> > > > >> > -    # The native pkgdata can not generate the correct data file.
> >> > > > >> > -    # Use icupkg to re-generate it.
> >> > > > >> > -    if [ "${SITEINFO_ENDIANNESS}" = "be" ] ; then
> >> > > > >> > -        rm -f ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
> >> > > > >> > -        icupkg -tb ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
> >> > > > >> > -    fi
> >> > > > >> > -
> >> > > > >> > -       # Remove build host references...
> >> > > > >> > -       sed -i  \
> >> > > > >> > -           -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
> >> > > > >> > -           -e 's|${DEBUG_PREFIX_MAP}||g' \
> >> > > > >> > -           -e 's:${HOSTTOOLS_DIR}/::g' \
> >> > > > >> > -           ${D}/${bindir}/icu-config ${D}/${libdir}/${BPN}/${PV}/Makefile.inc \
> >> > > > >> > -           ${D}/${libdir}/${BPN}/${PV}/pkgdata.inc
> >> > > > >> > -}
> >> > > > >> > -
> >> > > > >> > -PACKAGES =+ "libicudata libicuuc libicui18n libicutu libicuio"
> >> > > > >> > -
> >> > > > >> > -FILES_${PN}-dev += "${libdir}/${BPN}/"
> >> > > > >> > -
> >> > > > >> > -FILES_libicudata = "${libdir}/libicudata.so.*"
> >> > > > >> > -FILES_libicuuc = "${libdir}/libicuuc.so.*"
> >> > > > >> > -FILES_libicui18n = "${libdir}/libicui18n.so.*"
> >> > > > >> > -FILES_libicutu = "${libdir}/libicutu.so.*"
> >> > > > >> > -FILES_libicuio = "${libdir}/libicuio.so.*"
> >> > > > >> > -
> >> > > > >> > -BBCLASSEXTEND = "native nativesdk"
> >> > > > >> > diff --git a/meta/recipes-support/icu/icu_67.1.bb b/meta/recipes-support/icu/icu_67.1.bb
> >> > > > >> > index 58638507c9..5814fa41bd 100644
> >> > > > >> > --- a/meta/recipes-support/icu/icu_67.1.bb
> >> > > > >> > +++ b/meta/recipes-support/icu/icu_67.1.bb
> >> > > > >> > @@ -1,4 +1,87 @@
> >> > > > >> > -require icu.inc
> >> > > > >> > +SUMMARY = "International Component for Unicode libraries"
> >> > > > >> > +DESCRIPTION = "The International Component for Unicode (ICU) is a mature, \
> >> > > > >> > +portable set of C/C++ and Java libraries for Unicode support, software \
> >> > > > >> > +internationalization (I18N) and globalization (G11N), giving applications the \
> >> > > > >> > +same results on all platforms."
> >> > > > >> > +HOMEPAGE = "http://site.icu-project.org/"
> >> > > > >> > +
> >> > > > >> > +LICENSE = "ICU"
> >> > > > >> > +DEPENDS = "icu-native"
> >> > > > >> > +DEPENDS_class-native = ""
> >> > > > >> > +
> >> > > > >> > +CVE_PRODUCT = "international_components_for_unicode"
> >> > > > >> > +
> >> > > > >> > +S = "${WORKDIR}/icu/source"
> >> > > > >> > +SPDX_S = "${WORKDIR}/icu"
> >> > > > >> > +STAGING_ICU_DIR_NATIVE = "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
> >> > > > >> > +
> >> > > > >> > +BINCONFIG = "${bindir}/icu-config"
> >> > > > >> > +
> >> > > > >> > +ICU_MAJOR_VER = "${@d.getVar('PV').split('.')[0]}"
> >> > > > >> > +
> >> > > > >> > +inherit autotools pkgconfig binconfig multilib_script
> >> > > > >> > +
> >> > > > >> > +MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/icu-config"
> >> > > > >> > +
> >> > > > >> > +# ICU needs the native build directory as an argument to its --with-cross-build option when
> >> > > > >> > +# cross-compiling. Taken the situation that different builds may share a common sstate-cache
> >> > > > >> > +# into consideration, the native build directory needs to be staged.
> >> > > > >> > +EXTRA_OECONF = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
> >> > > > >> > +EXTRA_OECONF_class-native = ""
> >> > > > >> > +EXTRA_OECONF_class-nativesdk = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
> >> > > > >> > +
> >> > > > >> > +EXTRA_OECONF_append_class-target = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' --with-data-packaging=archive', '', d)}"
> >> > > > >> > +TARGET_CXXFLAGS_append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' -DICU_DATA_DIR=\\""${datadir}/${BPN}/${PV}\\""', '', d)}"
> >> > > > >> > +
> >> > > > >> > +ASNEEDED = ""
> >> > > > >> > +
> >> > > > >> > +do_compile_prepend_class-target () {
> >> > > > >> > +       # Make sure certain build host references do not end up being compiled
> >> > > > >> > +       # in the image. This only affects libicutu and icu-dbg
> >> > > > >> > +       sed  \
> >> > > > >> > +           -e 's,DU_BUILD=,DU_BUILD_unused=,g' \
> >> > > > >> > +           -e '/^CPPFLAGS.*/ s,--sysroot=${STAGING_DIR_TARGET},,g' \
> >> > > > >> > +           -i ${B}/tools/toolutil/Makefile
> >> > > > >> > +}
> >> > > > >> > +
> >> > > > >> > +PREPROCESS_RELOCATE_DIRS = "${datadir}/${BPN}/${PV}"
> >> > > > >> > +do_install_append_class-native() {
> >> > > > >> > +       mkdir -p ${D}/${STAGING_ICU_DIR_NATIVE}/config
> >> > > > >> > +       cp -r ${B}/config/icucross.mk ${D}/${STAGING_ICU_DIR_NATIVE}/config
> >> > > > >> > +       cp -r ${B}/config/icucross.inc ${D}/${STAGING_ICU_DIR_NATIVE}/config
> >> > > > >> > +       cp -r ${B}/lib ${D}/${STAGING_ICU_DIR_NATIVE}
> >> > > > >> > +       cp -r ${B}/bin ${D}/${STAGING_ICU_DIR_NATIVE}
> >> > > > >> > +       cp -r ${B}/tools ${D}/${STAGING_ICU_DIR_NATIVE}
> >> > > > >> > +}
> >> > > > >> > +
> >> > > > >> > +do_install_append_class-target() {
> >> > > > >> > +    # The native pkgdata can not generate the correct data file.
> >> > > > >> > +    # Use icupkg to re-generate it.
> >> > > > >> > +    if [ "${SITEINFO_ENDIANNESS}" = "be" ] ; then
> >> > > > >> > +        rm -f ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
> >> > > > >> > +        icupkg -tb ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
> >> > > > >> > +    fi
> >> > > > >> > +
> >> > > > >> > +       # Remove build host references...
> >> > > > >> > +       sed -i  \
> >> > > > >> > +           -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
> >> > > > >> > +           -e 's|${DEBUG_PREFIX_MAP}||g' \
> >> > > > >> > +           -e 's:${HOSTTOOLS_DIR}/::g' \
> >> > > > >> > +           ${D}/${bindir}/icu-config ${D}/${libdir}/${BPN}/${PV}/Makefile.inc \
> >> > > > >> > +           ${D}/${libdir}/${BPN}/${PV}/pkgdata.inc
> >> > > > >> > +}
> >> > > > >> > +
> >> > > > >> > +PACKAGES =+ "libicudata libicuuc libicui18n libicutu libicuio"
> >> > > > >> > +
> >> > > > >> > +FILES_${PN}-dev += "${libdir}/${BPN}/"
> >> > > > >> > +
> >> > > > >> > +FILES_libicudata = "${libdir}/libicudata.so.*"
> >> > > > >> > +FILES_libicuuc = "${libdir}/libicuuc.so.*"
> >> > > > >> > +FILES_libicui18n = "${libdir}/libicui18n.so.*"
> >> > > > >> > +FILES_libicutu = "${libdir}/libicutu.so.*"
> >> > > > >> > +FILES_libicuio = "${libdir}/libicuio.so.*"
> >> > > > >> > +
> >> > > > >> > +BBCLASSEXTEND = "native nativesdk"
> >> > > > >> >
> >> > > > >> >  LIC_FILES_CHKSUM = "file://../LICENSE;md5=a3808a5b70071b07f87ff2205e4d75a0"
> >> > > > >> >
> >> > > > >> > --
> >> > > > >> > 2.27.0
> >> > > > >> >
> >> > > > >> >
> >> > >
> 
