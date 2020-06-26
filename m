Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web11.151.1593203212141413413
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 13:26:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iB+Rcr9E;
 spf=pass (domain: gmail.com, ip: 209.85.217.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id r5so6132530vso.11
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 13:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=URdTDy20J+FArA7GCUT2WEhI7+H7I2llHhl0acMS6Xw=;
        b=iB+Rcr9EcG/XwJn+SH8qVMvEhpD79aKm6lwjoFgH+cDX9WIM8T+ffTv+dW5BI7f/4Z
         q5ZO47EsH9k27eAhjgyUp3W5muIdlMDOKqdIVXB6uzqAoWlaop0cVjFd06++FYeTn9C1
         bSFp7G7tV/S+Gx/KvFnD8rrFSPaxDHFCGA3Se0oLGduH8A1OzokmyzuWgyBUobDHwwHC
         9pvac5jff7Wvrjo9KERGg3uqN11nNxR0JRBwSWxJzNoF1xAVR/JuN2zvLbiM3W1jI0kj
         bDygxmE5DMxeP8HLb44BvV9vD0+4d73D/ga2LCZrPjz4GsFVqap2SdJMnHLwhqKEmyzX
         uRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=URdTDy20J+FArA7GCUT2WEhI7+H7I2llHhl0acMS6Xw=;
        b=j5VsroqpNgivrhSBtVq3YwLOL0xmVlln+dAb0UwH4zHDjfPX4pahfbwjWkP4/qpgdU
         Caf2zIXtnQkKJBboW3QFpbygSxamFejO00wuW1Xq3gQ/5EpugSh8qzrCfguV4aEPyUyn
         xxN8Rs0TrS9I3ZxsznDhR6vC4mXrzQdCLfwXlsGOFjSWy3UmaUuYeja8MiLAAK2X8RJM
         QSmLkkuQkActpUXH01XtsXISMx97Jd/Y75gUsft3L7ivfju7HT1u6OgjS9GUDTNpbhLn
         K6egB9nwsFD10lHzOKxVQe5fANSGIxnFzWRQf5oIMV1MuvenddiUFHYcfVnB/t2vf8N2
         8ckA==
X-Gm-Message-State: AOAM530EOaRuW3TV6jiQj/Wa0predTx1wug7fxGg+OgMNI/0zxHIVEYU
	JD9joXFUWKSKn30z2NJFPsu7APzAi4EZal6iG2M=
X-Google-Smtp-Source: ABdhPJz1Tia9KvWZ/lTS9kH+lFghX9CC63x0aQ+g4cuVS71yLMgky2+a5TlU6a3bjLYjOuyMJ+8ma2z7dJJ8doA23Ec=
X-Received: by 2002:a67:6ec4:: with SMTP id j187mr3819299vsc.35.1593203211233;
 Fri, 26 Jun 2020 13:26:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200623210837.26222-1-alex.kanavin@gmail.com>
 <CAOSpxdYUPQwNmZNP8FF7M=M2a95Wfvth0xpcO+C3G7bGKiJXCw@mail.gmail.com>
 <CANNYZj_U=WVHNrZLZK8_pNdgHf9YyKvfpFdcSrCTrq+8X-njKA@mail.gmail.com>
 <CAOSpxdbUVhvu_0sYvEWxiq=c8UAt1k-o4=9AXWJaMCPo5xQUsg@mail.gmail.com>
 <CAOSpxdYOgf7Jj3O1ebFUOZo1ccZs0K=K1L6vd7rcO0d8s0vtjQ@mail.gmail.com>
 <CAAnfSTtZOqXVz0==hgM0h3WP9igfuE1u2BU48iJWsh=rsFOwPQ@mail.gmail.com>
 <CAOSpxdZP-aN-rWgNDpW+7nS4g-1_j5wQJ_dgxACgNo6EvonF=Q@mail.gmail.com>
 <CANNYZj_ahPyrDVL0qoPakECCVQicdMNWm_Y3wi8oB4GJuSZwoA@mail.gmail.com>
 <161C2CF3A1F68DB5.16301@lists.openembedded.org> <CAOSpxdaNLcvvL=1g5n3Sod2HoD=Umg_sSHSiNizVL4ogyf1+ew@mail.gmail.com>
In-Reply-To: <CAOSpxdaNLcvvL=1g5n3Sod2HoD=Umg_sSHSiNizVL4ogyf1+ew@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 26 Jun 2020 22:26:39 +0200
Message-ID: <CANNYZj927by5Pic50F-fe0nJk+XLwH=q65NisFObeXczSCg9rQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] icu: merge .inc into main recipe
To: Steve Sakoman <steve@sakoman.com>
Cc: Ross Burton <ross@burtonini.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000075efb305a902875c"

--00000000000075efb305a902875c
Content-Type: text/plain; charset="UTF-8"

Technically, there are. I am not qualified to comment on how destabilizing
they could be:
http://site.icu-project.org/download/67

Perhaps it is possible to bisect the code to identify the fix that can be
cherry picked:
https://github.com/unicode-org/icu/releases/tag/release-67-1

Alex

Alex

On Fri, 26 Jun 2020 at 21:35, Steve Sakoman <steve@sakoman.com> wrote:

> On Fri, Jun 26, 2020 at 8:56 AM Steve Sakoman via
> lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
> wrote:
> >
> > On Fri, Jun 26, 2020 at 8:48 AM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> > >
> > > Can you, for the sake of testing, upgrade icu to the same version as
> master? Those failures do not seem to be happening there.
> >
> > Yes, I'll give that a try with a local build first since the
> > autobuilder is undergoing normal maintenance.
>
> The local build succeeded, so the failure does seem to be related to
> the earlier version.
>
> Is an upgrade to the new version reasonable for dunfell, or are there
> feature additions that would make it unsuitable?
>
> Steve
>
> > > On Fri, 26 Jun 2020 at 17:59, Steve Sakoman <steve@sakoman.com> wrote:
> > >>
> > >> On Fri, Jun 26, 2020 at 5:49 AM Ross Burton <ross@burtonini.com>
> wrote:
> > >> >
> > >> > Failures in edgerouter and MIPS screams the big-endian thing again.
> > >> > ICU is a disaster here, be warned.
> > >>
> > >> Good theory -- ppc failed too.
> > >>
> > >> Steve
> > >>
> > >> > On Fri, 26 Jun 2020 at 16:27, Steve Sakoman <steve@sakoman.com>
> wrote:
> > >> > >
> > >> > > On Thu, Jun 25, 2020 at 6:23 AM Steve Sakoman <steve@sakoman.com>
> wrote:
> > >> > > >
> > >> > > > On Thu, Jun 25, 2020 at 6:09 AM Alexander Kanavin
> > >> > > > <alex.kanavin@gmail.com> wrote:
> > >> > > > >
> > >> > > > > I think you may have to recreate them by hand.
> > >> > > >
> > >> > > > OK, I'll put together a patch for the 66.1 recipe in dunfell
> that
> > >> > > > implements the changes you have in the second patch of the
> series.  In
> > >> > > > the interest of minimizing changes I'll keep the .inc file
> separate as
> > >> > > > is.
> > >> > >
> > >> > > I recreated the patch for 66.1 and did a couple of quick local
> builds
> > >> > > and things looked fine.
> > >> > >
> > >> > > On the autobuilder I get failures for edgerouter and mips.  I
> seem to
> > >> > > recall some discussion about this (perhaps on irc?) but can only
> find
> > >> > > one thread here on the list back when Khem's original patch went
> in.
> > >> > >
> > >> > > Did you recall any issues like this?
> > >> > >
> > >> > > Steve
> > >> > >
> > >> > >
> > >> > > > > On Thu, 25 Jun 2020 at 18:04, Steve Sakoman <
> steve@sakoman.com> wrote:
> > >> > > > >>
> > >> > > > >> Is this patch series suitable for dunfell as-is (the concern
> being the
> > >> > > > >> contents of the version bump) or would a backport to 66.1 be
> > >> > > > >> necessary?
> > >> > > > >>
> > >> > > > >> Steve
> > >> > > > >>
> > >> > > > >> On Tue, Jun 23, 2020 at 11:09 AM Alexander Kanavin
> > >> > > > >> <alex.kanavin@gmail.com> wrote:
> > >> > > > >> >
> > >> > > > >> > Both parts are rather convoluted, so it is better to have
> them in a single file.
> > >> > > > >> >
> > >> > > > >> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > >> > > > >> > ---
> > >> > > > >> >  meta/recipes-support/icu/icu.inc     | 84
> ---------------------------
> > >> > > > >> >  meta/recipes-support/icu/icu_67.1.bb | 85
> +++++++++++++++++++++++++++-
> > >> > > > >> >  2 files changed, 84 insertions(+), 85 deletions(-)
> > >> > > > >> >  delete mode 100644 meta/recipes-support/icu/icu.inc
> > >> > > > >> >
> > >> > > > >> > diff --git a/meta/recipes-support/icu/icu.inc
> b/meta/recipes-support/icu/icu.inc
> > >> > > > >> > deleted file mode 100644
> > >> > > > >> > index 6d9728903d..0000000000
> > >> > > > >> > --- a/meta/recipes-support/icu/icu.inc
> > >> > > > >> > +++ /dev/null
> > >> > > > >> > @@ -1,84 +0,0 @@
> > >> > > > >> > -SUMMARY = "International Component for Unicode libraries"
> > >> > > > >> > -DESCRIPTION = "The International Component for Unicode
> (ICU) is a mature, \
> > >> > > > >> > -portable set of C/C++ and Java libraries for Unicode
> support, software \
> > >> > > > >> > -internationalization (I18N) and globalization (G11N),
> giving applications the \
> > >> > > > >> > -same results on all platforms."
> > >> > > > >> > -HOMEPAGE = "http://site.icu-project.org/"
> > >> > > > >> > -
> > >> > > > >> > -LICENSE = "ICU"
> > >> > > > >> > -DEPENDS = "icu-native"
> > >> > > > >> > -DEPENDS_class-native = ""
> > >> > > > >> > -
> > >> > > > >> > -CVE_PRODUCT = "international_components_for_unicode"
> > >> > > > >> > -
> > >> > > > >> > -S = "${WORKDIR}/icu/source"
> > >> > > > >> > -SPDX_S = "${WORKDIR}/icu"
> > >> > > > >> > -STAGING_ICU_DIR_NATIVE =
> "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
> > >> > > > >> > -
> > >> > > > >> > -BINCONFIG = "${bindir}/icu-config"
> > >> > > > >> > -
> > >> > > > >> > -ICU_MAJOR_VER = "${@d.getVar('PV').split('.')[0]}"
> > >> > > > >> > -
> > >> > > > >> > -inherit autotools pkgconfig binconfig multilib_script
> > >> > > > >> > -
> > >> > > > >> > -MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/icu-config"
> > >> > > > >> > -
> > >> > > > >> > -# ICU needs the native build directory as an argument to
> its --with-cross-build option when
> > >> > > > >> > -# cross-compiling. Taken the situation that different
> builds may share a common sstate-cache
> > >> > > > >> > -# into consideration, the native build directory needs to
> be staged.
> > >> > > > >> > -EXTRA_OECONF =
> "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
> > >> > > > >> > -EXTRA_OECONF_class-native = ""
> > >> > > > >> > -EXTRA_OECONF_class-nativesdk =
> "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
> > >> > > > >> > -
> > >> > > > >> > -EXTRA_OECONF_append_class-target =
> "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', '
> --with-data-packaging=archive', '', d)}"
> > >> > > > >> > -TARGET_CXXFLAGS_append =
> "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', '
> -DICU_DATA_DIR=\\""${datadir}/${BPN}/${PV}\\""', '', d)}"
> > >> > > > >> > -
> > >> > > > >> > -ASNEEDED = ""
> > >> > > > >> > -
> > >> > > > >> > -do_compile_prepend_class-target () {
> > >> > > > >> > -       # Make sure certain build host references do not
> end up being compiled
> > >> > > > >> > -       # in the image. This only affects libicutu and
> icu-dbg
> > >> > > > >> > -       sed  \
> > >> > > > >> > -           -e 's,DU_BUILD=,DU_BUILD_unused=,g' \
> > >> > > > >> > -           -e '/^CPPFLAGS.*/
> s,--sysroot=${STAGING_DIR_TARGET},,g' \
> > >> > > > >> > -           -i ${B}/tools/toolutil/Makefile
> > >> > > > >> > -}
> > >> > > > >> > -
> > >> > > > >> > -PREPROCESS_RELOCATE_DIRS = "${datadir}/${BPN}/${PV}"
> > >> > > > >> > -do_install_append_class-native() {
> > >> > > > >> > -       mkdir -p ${D}/${STAGING_ICU_DIR_NATIVE}/config
> > >> > > > >> > -       cp -r ${B}/config/icucross.mk
> ${D}/${STAGING_ICU_DIR_NATIVE}/config
> > >> > > > >> > -       cp -r ${B}/config/icucross.inc
> ${D}/${STAGING_ICU_DIR_NATIVE}/config
> > >> > > > >> > -       cp -r ${B}/lib ${D}/${STAGING_ICU_DIR_NATIVE}
> > >> > > > >> > -       cp -r ${B}/bin ${D}/${STAGING_ICU_DIR_NATIVE}
> > >> > > > >> > -       cp -r ${B}/tools ${D}/${STAGING_ICU_DIR_NATIVE}
> > >> > > > >> > -}
> > >> > > > >> > -
> > >> > > > >> > -do_install_append_class-target() {
> > >> > > > >> > -    # The native pkgdata can not generate the correct
> data file.
> > >> > > > >> > -    # Use icupkg to re-generate it.
> > >> > > > >> > -    if [ "${SITEINFO_ENDIANNESS}" = "be" ] ; then
> > >> > > > >> > -        rm -f
> ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
> > >> > > > >> > -        icupkg -tb
> ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat
> ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
> > >> > > > >> > -    fi
> > >> > > > >> > -
> > >> > > > >> > -       # Remove build host references...
> > >> > > > >> > -       sed -i  \
> > >> > > > >> > -           -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
> > >> > > > >> > -           -e 's|${DEBUG_PREFIX_MAP}||g' \
> > >> > > > >> > -           -e 's:${HOSTTOOLS_DIR}/::g' \
> > >> > > > >> > -           ${D}/${bindir}/icu-config
> ${D}/${libdir}/${BPN}/${PV}/Makefile.inc \
> > >> > > > >> > -           ${D}/${libdir}/${BPN}/${PV}/pkgdata.inc
> > >> > > > >> > -}
> > >> > > > >> > -
> > >> > > > >> > -PACKAGES =+ "libicudata libicuuc libicui18n libicutu
> libicuio"
> > >> > > > >> > -
> > >> > > > >> > -FILES_${PN}-dev += "${libdir}/${BPN}/"
> > >> > > > >> > -
> > >> > > > >> > -FILES_libicudata = "${libdir}/libicudata.so.*"
> > >> > > > >> > -FILES_libicuuc = "${libdir}/libicuuc.so.*"
> > >> > > > >> > -FILES_libicui18n = "${libdir}/libicui18n.so.*"
> > >> > > > >> > -FILES_libicutu = "${libdir}/libicutu.so.*"
> > >> > > > >> > -FILES_libicuio = "${libdir}/libicuio.so.*"
> > >> > > > >> > -
> > >> > > > >> > -BBCLASSEXTEND = "native nativesdk"
> > >> > > > >> > diff --git a/meta/recipes-support/icu/icu_67.1.bb
> b/meta/recipes-support/icu/icu_67.1.bb
> > >> > > > >> > index 58638507c9..5814fa41bd 100644
> > >> > > > >> > --- a/meta/recipes-support/icu/icu_67.1.bb
> > >> > > > >> > +++ b/meta/recipes-support/icu/icu_67.1.bb
> > >> > > > >> > @@ -1,4 +1,87 @@
> > >> > > > >> > -require icu.inc
> > >> > > > >> > +SUMMARY = "International Component for Unicode libraries"
> > >> > > > >> > +DESCRIPTION = "The International Component for Unicode
> (ICU) is a mature, \
> > >> > > > >> > +portable set of C/C++ and Java libraries for Unicode
> support, software \
> > >> > > > >> > +internationalization (I18N) and globalization (G11N),
> giving applications the \
> > >> > > > >> > +same results on all platforms."
> > >> > > > >> > +HOMEPAGE = "http://site.icu-project.org/"
> > >> > > > >> > +
> > >> > > > >> > +LICENSE = "ICU"
> > >> > > > >> > +DEPENDS = "icu-native"
> > >> > > > >> > +DEPENDS_class-native = ""
> > >> > > > >> > +
> > >> > > > >> > +CVE_PRODUCT = "international_components_for_unicode"
> > >> > > > >> > +
> > >> > > > >> > +S = "${WORKDIR}/icu/source"
> > >> > > > >> > +SPDX_S = "${WORKDIR}/icu"
> > >> > > > >> > +STAGING_ICU_DIR_NATIVE =
> "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
> > >> > > > >> > +
> > >> > > > >> > +BINCONFIG = "${bindir}/icu-config"
> > >> > > > >> > +
> > >> > > > >> > +ICU_MAJOR_VER = "${@d.getVar('PV').split('.')[0]}"
> > >> > > > >> > +
> > >> > > > >> > +inherit autotools pkgconfig binconfig multilib_script
> > >> > > > >> > +
> > >> > > > >> > +MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/icu-config"
> > >> > > > >> > +
> > >> > > > >> > +# ICU needs the native build directory as an argument to
> its --with-cross-build option when
> > >> > > > >> > +# cross-compiling. Taken the situation that different
> builds may share a common sstate-cache
> > >> > > > >> > +# into consideration, the native build directory needs to
> be staged.
> > >> > > > >> > +EXTRA_OECONF =
> "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
> > >> > > > >> > +EXTRA_OECONF_class-native = ""
> > >> > > > >> > +EXTRA_OECONF_class-nativesdk =
> "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
> > >> > > > >> > +
> > >> > > > >> > +EXTRA_OECONF_append_class-target =
> "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', '
> --with-data-packaging=archive', '', d)}"
> > >> > > > >> > +TARGET_CXXFLAGS_append =
> "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', '
> -DICU_DATA_DIR=\\""${datadir}/${BPN}/${PV}\\""', '', d)}"
> > >> > > > >> > +
> > >> > > > >> > +ASNEEDED = ""
> > >> > > > >> > +
> > >> > > > >> > +do_compile_prepend_class-target () {
> > >> > > > >> > +       # Make sure certain build host references do not
> end up being compiled
> > >> > > > >> > +       # in the image. This only affects libicutu and
> icu-dbg
> > >> > > > >> > +       sed  \
> > >> > > > >> > +           -e 's,DU_BUILD=,DU_BUILD_unused=,g' \
> > >> > > > >> > +           -e '/^CPPFLAGS.*/
> s,--sysroot=${STAGING_DIR_TARGET},,g' \
> > >> > > > >> > +           -i ${B}/tools/toolutil/Makefile
> > >> > > > >> > +}
> > >> > > > >> > +
> > >> > > > >> > +PREPROCESS_RELOCATE_DIRS = "${datadir}/${BPN}/${PV}"
> > >> > > > >> > +do_install_append_class-native() {
> > >> > > > >> > +       mkdir -p ${D}/${STAGING_ICU_DIR_NATIVE}/config
> > >> > > > >> > +       cp -r ${B}/config/icucross.mk
> ${D}/${STAGING_ICU_DIR_NATIVE}/config
> > >> > > > >> > +       cp -r ${B}/config/icucross.inc
> ${D}/${STAGING_ICU_DIR_NATIVE}/config
> > >> > > > >> > +       cp -r ${B}/lib ${D}/${STAGING_ICU_DIR_NATIVE}
> > >> > > > >> > +       cp -r ${B}/bin ${D}/${STAGING_ICU_DIR_NATIVE}
> > >> > > > >> > +       cp -r ${B}/tools ${D}/${STAGING_ICU_DIR_NATIVE}
> > >> > > > >> > +}
> > >> > > > >> > +
> > >> > > > >> > +do_install_append_class-target() {
> > >> > > > >> > +    # The native pkgdata can not generate the correct
> data file.
> > >> > > > >> > +    # Use icupkg to re-generate it.
> > >> > > > >> > +    if [ "${SITEINFO_ENDIANNESS}" = "be" ] ; then
> > >> > > > >> > +        rm -f
> ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
> > >> > > > >> > +        icupkg -tb
> ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat
> ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
> > >> > > > >> > +    fi
> > >> > > > >> > +
> > >> > > > >> > +       # Remove build host references...
> > >> > > > >> > +       sed -i  \
> > >> > > > >> > +           -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
> > >> > > > >> > +           -e 's|${DEBUG_PREFIX_MAP}||g' \
> > >> > > > >> > +           -e 's:${HOSTTOOLS_DIR}/::g' \
> > >> > > > >> > +           ${D}/${bindir}/icu-config
> ${D}/${libdir}/${BPN}/${PV}/Makefile.inc \
> > >> > > > >> > +           ${D}/${libdir}/${BPN}/${PV}/pkgdata.inc
> > >> > > > >> > +}
> > >> > > > >> > +
> > >> > > > >> > +PACKAGES =+ "libicudata libicuuc libicui18n libicutu
> libicuio"
> > >> > > > >> > +
> > >> > > > >> > +FILES_${PN}-dev += "${libdir}/${BPN}/"
> > >> > > > >> > +
> > >> > > > >> > +FILES_libicudata = "${libdir}/libicudata.so.*"
> > >> > > > >> > +FILES_libicuuc = "${libdir}/libicuuc.so.*"
> > >> > > > >> > +FILES_libicui18n = "${libdir}/libicui18n.so.*"
> > >> > > > >> > +FILES_libicutu = "${libdir}/libicutu.so.*"
> > >> > > > >> > +FILES_libicuio = "${libdir}/libicuio.so.*"
> > >> > > > >> > +
> > >> > > > >> > +BBCLASSEXTEND = "native nativesdk"
> > >> > > > >> >
> > >> > > > >> >  LIC_FILES_CHKSUM =
> "file://../LICENSE;md5=a3808a5b70071b07f87ff2205e4d75a0"
> > >> > > > >> >
> > >> > > > >> > --
> > >> > > > >> > 2.27.0
> > >> > > > >> >
> > >> > > > >> >
> > >> > >
> > 
>

--00000000000075efb305a902875c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Technically, there are. I am not qualified to comment=
 on how destabilizing they could be:<br></div><div><a href=3D"http://site.i=
cu-project.org/download/67">http://site.icu-project.org/download/67</a></di=
v><div><br></div><div>Perhaps it is possible to bisect the code to identify=
 the fix that can be cherry picked:</div><div><a href=3D"https://github.com=
/unicode-org/icu/releases/tag/release-67-1">https://github.com/unicode-org/=
icu/releases/tag/release-67-1</a></div><div><br></div><div>Alex<br></div><d=
iv><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Fri, 26 Jun 2020 at 21:35, Steve Sakoman=
 &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, Jun 26, =
2020 at 8:56 AM Steve Sakoman via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bl=
ank">lists.openembedded.org</a> &lt;steve=3D<a href=3D"mailto:sakoman.com@l=
ists.openembedded.org" target=3D"_blank">sakoman.com@lists.openembedded.org=
</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; On Fri, Jun 26, 2020 at 8:48 AM Alexander Kanavin<br>
&gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.=
kanavin@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Can you, for the sake of testing, upgrade icu to the same versio=
n as master? Those failures do not seem to be happening there.<br>
&gt;<br>
&gt; Yes, I&#39;ll give that a try with a local build first since the<br>
&gt; autobuilder is undergoing normal maintenance.<br>
<br>
The local build succeeded, so the failure does seem to be related to<br>
the earlier version.<br>
<br>
Is an upgrade to the new version reasonable for dunfell, or are there<br>
feature additions that would make it unsuitable?<br>
<br>
Steve<br>
<br>
&gt; &gt; On Fri, 26 Jun 2020 at 17:59, Steve Sakoman &lt;<a href=3D"mailt=
o:steve@sakoman.com" target=3D"_blank">steve@sakoman.com</a>&gt; wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On Fri, Jun 26, 2020 at 5:49 AM Ross Burton &lt;<a href=3D"m=
ailto:ross@burtonini.com" target=3D"_blank">ross@burtonini.com</a>&gt; wrot=
e:<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Failures in edgerouter and MIPS screams the big-endian =
thing again.<br>
&gt; &gt;&gt; &gt; ICU is a disaster here, be warned.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Good theory -- ppc failed too.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Steve<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; On Fri, 26 Jun 2020 at 16:27, Steve Sakoman &lt;<a href=
=
=3D"mailto:steve@sakoman.com" target=3D"_blank">steve@sakoman.com</a>&gt; =
wrote:<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; On Thu, Jun 25, 2020 at 6:23 AM Steve Sakoman &lt;=
<a href=3D"mailto:steve@sakoman.com" target=3D"_blank">steve@sakoman.com</a=
>&gt; wrote:<br>
&gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; On Thu, Jun 25, 2020 at 6:09 AM Alexander Kan=
avin<br>
&gt; &gt;&gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; I think you may have to recreate them by=
 hand.<br>
&gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; OK, I&#39;ll put together a patch for the 66.=
1 recipe in dunfell that<br>
&gt; &gt;&gt; &gt; &gt; &gt; implements the changes you have in the second=
 patch of the series.=C2=A0 In<br>
&gt; &gt;&gt; &gt; &gt; &gt; the interest of minimizing changes I&#39;ll k=
eep the .inc file separate as<br>
&gt; &gt;&gt; &gt; &gt; &gt; is.<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; I recreated the patch for 66.1 and did a couple of=
 quick local builds<br>
&gt; &gt;&gt; &gt; &gt; and things looked fine.<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; On the autobuilder I get failures for edgerouter a=
nd mips.=C2=A0 I seem to<br>
&gt; &gt;&gt; &gt; &gt; recall some discussion about this (perhaps on irc?=
) but can only find<br>
&gt; &gt;&gt; &gt; &gt; one thread here on the list back when Khem&#39;s o=
riginal patch went in.<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; Did you recall any issues like this?<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; Steve<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt; On Thu, 25 Jun 2020 at 18:04, Steve Sako=
man &lt;<a href=3D"mailto:steve@sakoman.com" target=3D"_blank">steve@sakoma=
n.com</a>&gt; wrote:<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; Is this patch series suitable for du=
nfell as-is (the concern being the<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; contents of the version bump) or wou=
ld a backport to 66.1 be<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; necessary?<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; Steve<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; On Tue, Jun 23, 2020 at 11:09 AM Ale=
xander Kanavin<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; Both parts are rather convolute=
d, so it is better to have them in a single file.<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; Signed-off-by: Alexander Kanavi=
n &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kana=
vin@gmail.com</a>&gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; ---<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt;=C2=A0 meta/recipes-support/icu/=
icu.inc=C2=A0 =C2=A0 =C2=A0| 84 ---------------------------<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt;=C2=A0 meta/recipes-support/icu/=
<a href=3D"http://icu_67.1.bb" rel=3D"noreferrer" target=3D"_blank">icu_67.=
1.bb</a> | 85 +++++++++++++++++++++++++++-<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt;=C2=A0 2 files changed, 84 inser=
tions(+), 85 deletions(-)<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt;=C2=A0 delete mode 100644 meta/r=
ecipes-support/icu/icu.inc<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; diff --git a/meta/recipes-suppo=
rt/icu/icu.inc b/meta/recipes-support/icu/icu.inc<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; deleted file mode 100644<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; index 6d9728903d..0000000000<br=
>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; --- a/meta/recipes-support/icu/=
icu.inc<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +++ /dev/null<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; @@ -1,84 +0,0 @@<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -SUMMARY =3D &quot;Internationa=
l Component for Unicode libraries&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -DESCRIPTION =3D &quot;The Inte=
rnational Component for Unicode (ICU) is a mature, \<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -portable set of C/C++ and Java=
 libraries for Unicode support, software \<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -internationalization (I18N) an=
d globalization (G11N), giving applications the \<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -same results on all platforms.=
&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -HOMEPAGE =3D &quot;<a href=3D"=
http://site.icu-project.org/" rel=3D"noreferrer" target=3D"_blank">http://s=
ite.icu-project.org/</a>&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -LICENSE =3D &quot;ICU&quot;<br=
>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -DEPENDS =3D &quot;icu-native&q=
uot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -DEPENDS_class-native =3D &quot=
;&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -CVE_PRODUCT =3D &quot;internat=
ional_components_for_unicode&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -S =3D &quot;${WORKDIR}/icu/sou=
rce&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -SPDX_S =3D &quot;${WORKDIR}/ic=
u&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -STAGING_ICU_DIR_NATIVE =3D &qu=
ot;${STAGING_DATADIR_NATIVE}/${BPN}/${PV}&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -BINCONFIG =3D &quot;${bindir}/=
icu-config&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -ICU_MAJOR_VER =3D &quot;${@d.g=
etVar(&#39;PV&#39;).split(&#39;.&#39;)[0]}&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -inherit autotools pkgconfig bi=
nconfig multilib_script<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -MULTILIB_SCRIPTS =3D &quot;${P=
N}-dev:${bindir}/icu-config&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -# ICU needs the native build d=
irectory as an argument to its --with-cross-build option when<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -# cross-compiling. Taken the s=
ituation that different builds may share a common sstate-cache<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -# into consideration, the nati=
ve build directory needs to be staged.<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -EXTRA_OECONF =3D &quot;--with-=
cross-build=3D${STAGING_ICU_DIR_NATIVE}&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -EXTRA_OECONF_class-native =3D =
&quot;&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -EXTRA_OECONF_class-nativesdk =
=3D &quot;--with-cross-build=3D${STAGING_ICU_DIR_NATIVE}&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -EXTRA_OECONF_append_class-targ=
et =3D &quot;${@oe.utils.conditional(&#39;SITEINFO_ENDIANNESS&#39;, &#39;be=
&#39;, &#39; --with-data-packaging=3Darchive&#39;, &#39;&#39;, d)}&quot;<br=
>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -TARGET_CXXFLAGS_append =3D &qu=
ot;${@oe.utils.conditional(&#39;SITEINFO_ENDIANNESS&#39;, &#39;be&#39;, &#3=
9; -DICU_DATA_DIR=3D\\&quot;&quot;${datadir}/${BPN}/${PV}\\&quot;&quot;&#39=
;, &#39;&#39;, d)}&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -ASNEEDED =3D &quot;&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -do_compile_prepend_class-targe=
t () {<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# M=
ake sure certain build host references do not end up being compiled<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# i=
n the image. This only affects libicutu and icu-dbg<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sed=
=
=C2=A0 \<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0-e &#39;s,DU_BUILD=3D,DU_BUILD_unused=3D,g&#39; \<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0-e &#39;/^CPPFLAGS.*/ s,--sysroot=3D${STAGING_DIR_TARGET},,g&=
#39; \<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0-i ${B}/tools/toolutil/Makefile<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -}<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -PREPROCESS_RELOCATE_DIRS =3D &=
quot;${datadir}/${BPN}/${PV}&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -do_install_append_class-native=
() {<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0mkd=
ir -p ${D}/${STAGING_ICU_DIR_NATIVE}/config<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cp =
-r ${B}/config/<a href=3D"http://icucross.mk" rel=3D"noreferrer" target=3D"=
_blank">icucross.mk</a> ${D}/${STAGING_ICU_DIR_NATIVE}/config<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cp =
-r ${B}/config/icucross.inc ${D}/${STAGING_ICU_DIR_NATIVE}/config<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cp =
-r ${B}/lib ${D}/${STAGING_ICU_DIR_NATIVE}<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cp =
-r ${B}/bin ${D}/${STAGING_ICU_DIR_NATIVE}<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cp =
-r ${B}/tools ${D}/${STAGING_ICU_DIR_NATIVE}<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -}<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -do_install_append_class-target=
() {<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 # The native pkg=
data can not generate the correct data file.<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 # Use icupkg to =
re-generate it.<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 if [ &quot;${SIT=
EINFO_ENDIANNESS}&quot; =3D &quot;be&quot; ] ; then<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm=
 -f ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ic=
upkg -tb ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat ${D}/${datadir}/${BPN}/${P=
V}/icudt${ICU_MAJOR_VER}b.dat<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 fi<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# R=
emove build host references...<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sed=
 -i=C2=A0 \<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0-e &#39;s,--sysroot=3D${STAGING_DIR_TARGET},,g&#39; \<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0-e &#39;s|${DEBUG_PREFIX_MAP}||g&#39; \<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0-e &#39;s:${HOSTTOOLS_DIR}/::g&#39; \<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0${D}/${bindir}/icu-config ${D}/${libdir}/${BPN}/${PV}/Makefil=
e.inc \<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0${D}/${libdir}/${BPN}/${PV}/pkgdata.inc<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -}<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -PACKAGES =3D+ &quot;libicudata=
 libicuuc libicui18n libicutu libicuio&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -FILES_${PN}-dev +=3D &quot;${l=
ibdir}/${BPN}/&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -FILES_libicudata =3D &quot;${l=
ibdir}/libicudata.so.*&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -FILES_libicuuc =3D &quot;${lib=
dir}/libicuuc.so.*&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -FILES_libicui18n =3D &quot;${l=
ibdir}/libicui18n.so.*&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -FILES_libicutu =3D &quot;${lib=
dir}/libicutu.so.*&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -FILES_libicuio =3D &quot;${lib=
dir}/libicuio.so.*&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -BBCLASSEXTEND =3D &quot;native=
 nativesdk&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; diff --git a/meta/recipes-suppo=
rt/icu/<a href=3D"http://icu_67.1.bb" rel=3D"noreferrer" target=3D"_blank">=
icu_67.1.bb</a> b/meta/recipes-support/icu/<a href=3D"http://icu_67.1.bb" r=
el=3D"noreferrer" target=3D"_blank">icu_67.1.bb</a><br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; index 58638507c9..5814fa41bd 10=
0644<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; --- a/meta/recipes-support/icu/=
<a href=3D"http://icu_67.1.bb" rel=3D"noreferrer" target=3D"_blank">icu_67.=
1.bb</a><br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +++ b/meta/recipes-support/icu/=
<a href=3D"http://icu_67.1.bb" rel=3D"noreferrer" target=3D"_blank">icu_67.=
1.bb</a><br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; @@ -1,4 +1,87 @@<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; -require icu.inc<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +SUMMARY =3D &quot;Internationa=
l Component for Unicode libraries&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +DESCRIPTION =3D &quot;The Inte=
rnational Component for Unicode (ICU) is a mature, \<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +portable set of C/C++ and Java=
 libraries for Unicode support, software \<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +internationalization (I18N) an=
d globalization (G11N), giving applications the \<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +same results on all platforms.=
&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"=
http://site.icu-project.org/" rel=3D"noreferrer" target=3D"_blank">http://s=
ite.icu-project.org/</a>&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +LICENSE =3D &quot;ICU&quot;<br=
>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +DEPENDS =3D &quot;icu-native&q=
uot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +DEPENDS_class-native =3D &quot=
;&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +CVE_PRODUCT =3D &quot;internat=
ional_components_for_unicode&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +S =3D &quot;${WORKDIR}/icu/sou=
rce&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +SPDX_S =3D &quot;${WORKDIR}/ic=
u&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +STAGING_ICU_DIR_NATIVE =3D &qu=
ot;${STAGING_DATADIR_NATIVE}/${BPN}/${PV}&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +BINCONFIG =3D &quot;${bindir}/=
icu-config&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +ICU_MAJOR_VER =3D &quot;${@d.g=
etVar(&#39;PV&#39;).split(&#39;.&#39;)[0]}&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +inherit autotools pkgconfig bi=
nconfig multilib_script<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +MULTILIB_SCRIPTS =3D &quot;${P=
N}-dev:${bindir}/icu-config&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +# ICU needs the native build d=
irectory as an argument to its --with-cross-build option when<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +# cross-compiling. Taken the s=
ituation that different builds may share a common sstate-cache<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +# into consideration, the nati=
ve build directory needs to be staged.<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +EXTRA_OECONF =3D &quot;--with-=
cross-build=3D${STAGING_ICU_DIR_NATIVE}&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +EXTRA_OECONF_class-native =3D =
&quot;&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +EXTRA_OECONF_class-nativesdk =
=3D &quot;--with-cross-build=3D${STAGING_ICU_DIR_NATIVE}&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +EXTRA_OECONF_append_class-targ=
et =3D &quot;${@oe.utils.conditional(&#39;SITEINFO_ENDIANNESS&#39;, &#39;be=
&#39;, &#39; --with-data-packaging=3Darchive&#39;, &#39;&#39;, d)}&quot;<br=
>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +TARGET_CXXFLAGS_append =3D &qu=
ot;${@oe.utils.conditional(&#39;SITEINFO_ENDIANNESS&#39;, &#39;be&#39;, &#3=
9; -DICU_DATA_DIR=3D\\&quot;&quot;${datadir}/${BPN}/${PV}\\&quot;&quot;&#39=
;, &#39;&#39;, d)}&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +ASNEEDED =3D &quot;&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +do_compile_prepend_class-targe=
t () {<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# M=
ake sure certain build host references do not end up being compiled<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# i=
n the image. This only affects libicutu and icu-dbg<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sed=
=
=C2=A0 \<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0-e &#39;s,DU_BUILD=3D,DU_BUILD_unused=3D,g&#39; \<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0-e &#39;/^CPPFLAGS.*/ s,--sysroot=3D${STAGING_DIR_TARGET},,g&=
#39; \<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0-i ${B}/tools/toolutil/Makefile<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +}<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +PREPROCESS_RELOCATE_DIRS =3D &=
quot;${datadir}/${BPN}/${PV}&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +do_install_append_class-native=
() {<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mkd=
ir -p ${D}/${STAGING_ICU_DIR_NATIVE}/config<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp =
-r ${B}/config/<a href=3D"http://icucross.mk" rel=3D"noreferrer" target=3D"=
_blank">icucross.mk</a> ${D}/${STAGING_ICU_DIR_NATIVE}/config<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp =
-r ${B}/config/icucross.inc ${D}/${STAGING_ICU_DIR_NATIVE}/config<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp =
-r ${B}/lib ${D}/${STAGING_ICU_DIR_NATIVE}<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp =
-r ${B}/bin ${D}/${STAGING_ICU_DIR_NATIVE}<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp =
-r ${B}/tools ${D}/${STAGING_ICU_DIR_NATIVE}<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +}<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +do_install_append_class-target=
() {<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 # The native pkg=
data can not generate the correct data file.<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 # Use icupkg to =
re-generate it.<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 if [ &quot;${SIT=
EINFO_ENDIANNESS}&quot; =3D &quot;be&quot; ] ; then<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm=
 -f ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ic=
upkg -tb ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat ${D}/${datadir}/${BPN}/${P=
V}/icudt${ICU_MAJOR_VER}b.dat<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 fi<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# R=
emove build host references...<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sed=
 -i=C2=A0 \<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0-e &#39;s,--sysroot=3D${STAGING_DIR_TARGET},,g&#39; \<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0-e &#39;s|${DEBUG_PREFIX_MAP}||g&#39; \<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0-e &#39;s:${HOSTTOOLS_DIR}/::g&#39; \<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0${D}/${bindir}/icu-config ${D}/${libdir}/${BPN}/${PV}/Makefil=
e.inc \<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0${D}/${libdir}/${BPN}/${PV}/pkgdata.inc<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +}<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +PACKAGES =3D+ &quot;libicudata=
 libicuuc libicui18n libicutu libicuio&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +FILES_${PN}-dev +=3D &quot;${l=
ibdir}/${BPN}/&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +FILES_libicudata =3D &quot;${l=
ibdir}/libicudata.so.*&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +FILES_libicuuc =3D &quot;${lib=
dir}/libicuuc.so.*&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +FILES_libicui18n =3D &quot;${l=
ibdir}/libicui18n.so.*&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +FILES_libicutu =3D &quot;${lib=
dir}/libicutu.so.*&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +FILES_libicuio =3D &quot;${lib=
dir}/libicuio.so.*&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; +BBCLASSEXTEND =3D &quot;native=
 nativesdk&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt;=C2=A0 LIC_FILES_CHKSUM =3D &quo=
t;file://../LICENSE;md5=3Da3808a5b70071b07f87ff2205e4d75a0&quot;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; --<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt; 2.27.0<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; <br>
</blockquote></div>

--00000000000075efb305a902875c--
