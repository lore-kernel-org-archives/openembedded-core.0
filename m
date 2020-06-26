Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.web11.1336.1593197326944576209
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 11:48:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rGX2uvQ0;
 spf=pass (domain: gmail.com, ip: 209.85.221.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f174.google.com with SMTP id m21so1139792vkp.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 11:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=odutk+JBRzgl/36N6cKMHtRnVp3QydYriVgamI1s21A=;
        b=rGX2uvQ0HCgOeuVSZVl34SLV6zDT03CI7Vw4Z1rWN/0g2T9DPDFvRuM9e3ixpyHQEI
         CK4329csZrdb8hBpZEjU1wPzLLVoRCmuHwNwoc4VKamKmQ2A/7tnRHqAmcWomewhejyk
         NbGBkW5jjgGdgMClwYrYx/d93QpqkjX3oEVjeH9fuPMXhuT3kqamz4DrWBXL+eqvIIjC
         9PoEITtSa+jdAUGzG+uaEinN25Et+kQHMP3/rCzcechecncy6Ld9CAIMzZUTPscxswoI
         YAq5cD2loZigN6D1iDdPjQdCCawILb98XM7DG30Rli/kDjYTatHJkQTBl0gJWq7xX7pi
         rEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=odutk+JBRzgl/36N6cKMHtRnVp3QydYriVgamI1s21A=;
        b=OP7Jpc83+KLgGCnqOid3f1tA8hz4hq3wrTltRCxJQ05GmbmIMjh+cPm0kVgrXYgiVK
         wdY0H7/zhKX0Jv4q7ivM+QyEpoOgEOU/wh0Z36ypV6REqnKYddq5Qur6+7Vpko1N+DaR
         KTJBX+j1Wnh3VNIYUpb7ijsCleY6sz7wVDwxcGH4KwAuh9WAqnh5sXmgix3IFY6zdFMu
         uYdJO/WOWSFSvw+rkL1pJpYIZbJUrTDS1VfwA4kVHx7R74gEjmIyJrbr0w9+Y1ix0UCU
         p7pWn5ou8McfMCDwhN9QdFo6fWtl22w8gaZb6IG6pgGj+8KpUqoYwgUdk6obp2YDyAyN
         J84Q==
X-Gm-Message-State: AOAM530s2ucVxWaPvuNTpeIRvgEg78JSIiEcI1ktAoA+WLROvp5u0g9p
	DH/pnMu2UnCHiZJ4ssAXfQ9dSeG+CdHqBXFVws8=
X-Google-Smtp-Source: ABdhPJxpWtKhYBa7qXWjfMlqNLmME2iQKwCZkMGA92Uf3XotwyFz/LxtfBlc5bvxLWX+uTvRKnewbEhjde1mNrvTtfw=
X-Received: by 2002:a1f:ae51:: with SMTP id x78mr3129912vke.49.1593197325901;
 Fri, 26 Jun 2020 11:48:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200623210837.26222-1-alex.kanavin@gmail.com>
 <CAOSpxdYUPQwNmZNP8FF7M=M2a95Wfvth0xpcO+C3G7bGKiJXCw@mail.gmail.com>
 <CANNYZj_U=WVHNrZLZK8_pNdgHf9YyKvfpFdcSrCTrq+8X-njKA@mail.gmail.com>
 <CAOSpxdbUVhvu_0sYvEWxiq=c8UAt1k-o4=9AXWJaMCPo5xQUsg@mail.gmail.com>
 <CAOSpxdYOgf7Jj3O1ebFUOZo1ccZs0K=K1L6vd7rcO0d8s0vtjQ@mail.gmail.com>
 <CAAnfSTtZOqXVz0==hgM0h3WP9igfuE1u2BU48iJWsh=rsFOwPQ@mail.gmail.com> <CAOSpxdZP-aN-rWgNDpW+7nS4g-1_j5wQJ_dgxACgNo6EvonF=Q@mail.gmail.com>
In-Reply-To: <CAOSpxdZP-aN-rWgNDpW+7nS4g-1_j5wQJ_dgxACgNo6EvonF=Q@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 26 Jun 2020 20:48:34 +0200
Message-ID: <CANNYZj_ahPyrDVL0qoPakECCVQicdMNWm_Y3wi8oB4GJuSZwoA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] icu: merge .inc into main recipe
To: Steve Sakoman <steve@sakoman.com>
Cc: Ross Burton <ross@burtonini.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000aae69405a9012868"

--000000000000aae69405a9012868
Content-Type: text/plain; charset="UTF-8"

Can you, for the sake of testing, upgrade icu to the same version as
master? Those failures do not seem to be happening there.

Alex

On Fri, 26 Jun 2020 at 17:59, Steve Sakoman <steve@sakoman.com> wrote:

> On Fri, Jun 26, 2020 at 5:49 AM Ross Burton <ross@burtonini.com> wrote:
> >
> > Failures in edgerouter and MIPS screams the big-endian thing again.
> > ICU is a disaster here, be warned.
>
> Good theory -- ppc failed too.
>
> Steve
>
> > On Fri, 26 Jun 2020 at 16:27, Steve Sakoman <steve@sakoman.com> wrote:
> > >
> > > On Thu, Jun 25, 2020 at 6:23 AM Steve Sakoman <steve@sakoman.com>
> wrote:
> > > >
> > > > On Thu, Jun 25, 2020 at 6:09 AM Alexander Kanavin
> > > > <alex.kanavin@gmail.com> wrote:
> > > > >
> > > > > I think you may have to recreate them by hand.
> > > >
> > > > OK, I'll put together a patch for the 66.1 recipe in dunfell that
> > > > implements the changes you have in the second patch of the series.
> In
> > > > the interest of minimizing changes I'll keep the .inc file separate
> as
> > > > is.
> > >
> > > I recreated the patch for 66.1 and did a couple of quick local builds
> > > and things looked fine.
> > >
> > > On the autobuilder I get failures for edgerouter and mips.  I seem to
> > > recall some discussion about this (perhaps on irc?) but can only find
> > > one thread here on the list back when Khem's original patch went in.
> > >
> > > Did you recall any issues like this?
> > >
> > > Steve
> > >
> > >
> > > > > On Thu, 25 Jun 2020 at 18:04, Steve Sakoman <steve@sakoman.com>
> wrote:
> > > > >>
> > > > >> Is this patch series suitable for dunfell as-is (the concern
> being the
> > > > >> contents of the version bump) or would a backport to 66.1 be
> > > > >> necessary?
> > > > >>
> > > > >> Steve
> > > > >>
> > > > >> On Tue, Jun 23, 2020 at 11:09 AM Alexander Kanavin
> > > > >> <alex.kanavin@gmail.com> wrote:
> > > > >> >
> > > > >> > Both parts are rather convoluted, so it is better to have them
> in a single file.
> > > > >> >
> > > > >> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > > >> > ---
> > > > >> >  meta/recipes-support/icu/icu.inc     | 84
> ---------------------------
> > > > >> >  meta/recipes-support/icu/icu_67.1.bb | 85
> +++++++++++++++++++++++++++-
> > > > >> >  2 files changed, 84 insertions(+), 85 deletions(-)
> > > > >> >  delete mode 100644 meta/recipes-support/icu/icu.inc
> > > > >> >
> > > > >> > diff --git a/meta/recipes-support/icu/icu.inc
> b/meta/recipes-support/icu/icu.inc
> > > > >> > deleted file mode 100644
> > > > >> > index 6d9728903d..0000000000
> > > > >> > --- a/meta/recipes-support/icu/icu.inc
> > > > >> > +++ /dev/null
> > > > >> > @@ -1,84 +0,0 @@
> > > > >> > -SUMMARY = "International Component for Unicode libraries"
> > > > >> > -DESCRIPTION = "The International Component for Unicode (ICU)
> is a mature, \
> > > > >> > -portable set of C/C++ and Java libraries for Unicode support,
> software \
> > > > >> > -internationalization (I18N) and globalization (G11N), giving
> applications the \
> > > > >> > -same results on all platforms."
> > > > >> > -HOMEPAGE = "http://site.icu-project.org/"
> > > > >> > -
> > > > >> > -LICENSE = "ICU"
> > > > >> > -DEPENDS = "icu-native"
> > > > >> > -DEPENDS_class-native = ""
> > > > >> > -
> > > > >> > -CVE_PRODUCT = "international_components_for_unicode"
> > > > >> > -
> > > > >> > -S = "${WORKDIR}/icu/source"
> > > > >> > -SPDX_S = "${WORKDIR}/icu"
> > > > >> > -STAGING_ICU_DIR_NATIVE =
> "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
> > > > >> > -
> > > > >> > -BINCONFIG = "${bindir}/icu-config"
> > > > >> > -
> > > > >> > -ICU_MAJOR_VER = "${@d.getVar('PV').split('.')[0]}"
> > > > >> > -
> > > > >> > -inherit autotools pkgconfig binconfig multilib_script
> > > > >> > -
> > > > >> > -MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/icu-config"
> > > > >> > -
> > > > >> > -# ICU needs the native build directory as an argument to its
> --with-cross-build option when
> > > > >> > -# cross-compiling. Taken the situation that different builds
> may share a common sstate-cache
> > > > >> > -# into consideration, the native build directory needs to be
> staged.
> > > > >> > -EXTRA_OECONF = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
> > > > >> > -EXTRA_OECONF_class-native = ""
> > > > >> > -EXTRA_OECONF_class-nativesdk =
> "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
> > > > >> > -
> > > > >> > -EXTRA_OECONF_append_class-target =
> "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', '
> --with-data-packaging=archive', '', d)}"
> > > > >> > -TARGET_CXXFLAGS_append =
> "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', '
> -DICU_DATA_DIR=\\""${datadir}/${BPN}/${PV}\\""', '', d)}"
> > > > >> > -
> > > > >> > -ASNEEDED = ""
> > > > >> > -
> > > > >> > -do_compile_prepend_class-target () {
> > > > >> > -       # Make sure certain build host references do not end up
> being compiled
> > > > >> > -       # in the image. This only affects libicutu and icu-dbg
> > > > >> > -       sed  \
> > > > >> > -           -e 's,DU_BUILD=,DU_BUILD_unused=,g' \
> > > > >> > -           -e '/^CPPFLAGS.*/
> s,--sysroot=${STAGING_DIR_TARGET},,g' \
> > > > >> > -           -i ${B}/tools/toolutil/Makefile
> > > > >> > -}
> > > > >> > -
> > > > >> > -PREPROCESS_RELOCATE_DIRS = "${datadir}/${BPN}/${PV}"
> > > > >> > -do_install_append_class-native() {
> > > > >> > -       mkdir -p ${D}/${STAGING_ICU_DIR_NATIVE}/config
> > > > >> > -       cp -r ${B}/config/icucross.mk
> ${D}/${STAGING_ICU_DIR_NATIVE}/config
> > > > >> > -       cp -r ${B}/config/icucross.inc
> ${D}/${STAGING_ICU_DIR_NATIVE}/config
> > > > >> > -       cp -r ${B}/lib ${D}/${STAGING_ICU_DIR_NATIVE}
> > > > >> > -       cp -r ${B}/bin ${D}/${STAGING_ICU_DIR_NATIVE}
> > > > >> > -       cp -r ${B}/tools ${D}/${STAGING_ICU_DIR_NATIVE}
> > > > >> > -}
> > > > >> > -
> > > > >> > -do_install_append_class-target() {
> > > > >> > -    # The native pkgdata can not generate the correct data
> file.
> > > > >> > -    # Use icupkg to re-generate it.
> > > > >> > -    if [ "${SITEINFO_ENDIANNESS}" = "be" ] ; then
> > > > >> > -        rm -f
> ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
> > > > >> > -        icupkg -tb ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat
> ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
> > > > >> > -    fi
> > > > >> > -
> > > > >> > -       # Remove build host references...
> > > > >> > -       sed -i  \
> > > > >> > -           -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
> > > > >> > -           -e 's|${DEBUG_PREFIX_MAP}||g' \
> > > > >> > -           -e 's:${HOSTTOOLS_DIR}/::g' \
> > > > >> > -           ${D}/${bindir}/icu-config
> ${D}/${libdir}/${BPN}/${PV}/Makefile.inc \
> > > > >> > -           ${D}/${libdir}/${BPN}/${PV}/pkgdata.inc
> > > > >> > -}
> > > > >> > -
> > > > >> > -PACKAGES =+ "libicudata libicuuc libicui18n libicutu libicuio"
> > > > >> > -
> > > > >> > -FILES_${PN}-dev += "${libdir}/${BPN}/"
> > > > >> > -
> > > > >> > -FILES_libicudata = "${libdir}/libicudata.so.*"
> > > > >> > -FILES_libicuuc = "${libdir}/libicuuc.so.*"
> > > > >> > -FILES_libicui18n = "${libdir}/libicui18n.so.*"
> > > > >> > -FILES_libicutu = "${libdir}/libicutu.so.*"
> > > > >> > -FILES_libicuio = "${libdir}/libicuio.so.*"
> > > > >> > -
> > > > >> > -BBCLASSEXTEND = "native nativesdk"
> > > > >> > diff --git a/meta/recipes-support/icu/icu_67.1.bb
> b/meta/recipes-support/icu/icu_67.1.bb
> > > > >> > index 58638507c9..5814fa41bd 100644
> > > > >> > --- a/meta/recipes-support/icu/icu_67.1.bb
> > > > >> > +++ b/meta/recipes-support/icu/icu_67.1.bb
> > > > >> > @@ -1,4 +1,87 @@
> > > > >> > -require icu.inc
> > > > >> > +SUMMARY = "International Component for Unicode libraries"
> > > > >> > +DESCRIPTION = "The International Component for Unicode (ICU)
> is a mature, \
> > > > >> > +portable set of C/C++ and Java libraries for Unicode support,
> software \
> > > > >> > +internationalization (I18N) and globalization (G11N), giving
> applications the \
> > > > >> > +same results on all platforms."
> > > > >> > +HOMEPAGE = "http://site.icu-project.org/"
> > > > >> > +
> > > > >> > +LICENSE = "ICU"
> > > > >> > +DEPENDS = "icu-native"
> > > > >> > +DEPENDS_class-native = ""
> > > > >> > +
> > > > >> > +CVE_PRODUCT = "international_components_for_unicode"
> > > > >> > +
> > > > >> > +S = "${WORKDIR}/icu/source"
> > > > >> > +SPDX_S = "${WORKDIR}/icu"
> > > > >> > +STAGING_ICU_DIR_NATIVE =
> "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
> > > > >> > +
> > > > >> > +BINCONFIG = "${bindir}/icu-config"
> > > > >> > +
> > > > >> > +ICU_MAJOR_VER = "${@d.getVar('PV').split('.')[0]}"
> > > > >> > +
> > > > >> > +inherit autotools pkgconfig binconfig multilib_script
> > > > >> > +
> > > > >> > +MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/icu-config"
> > > > >> > +
> > > > >> > +# ICU needs the native build directory as an argument to its
> --with-cross-build option when
> > > > >> > +# cross-compiling. Taken the situation that different builds
> may share a common sstate-cache
> > > > >> > +# into consideration, the native build directory needs to be
> staged.
> > > > >> > +EXTRA_OECONF = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
> > > > >> > +EXTRA_OECONF_class-native = ""
> > > > >> > +EXTRA_OECONF_class-nativesdk =
> "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
> > > > >> > +
> > > > >> > +EXTRA_OECONF_append_class-target =
> "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', '
> --with-data-packaging=archive', '', d)}"
> > > > >> > +TARGET_CXXFLAGS_append =
> "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', '
> -DICU_DATA_DIR=\\""${datadir}/${BPN}/${PV}\\""', '', d)}"
> > > > >> > +
> > > > >> > +ASNEEDED = ""
> > > > >> > +
> > > > >> > +do_compile_prepend_class-target () {
> > > > >> > +       # Make sure certain build host references do not end up
> being compiled
> > > > >> > +       # in the image. This only affects libicutu and icu-dbg
> > > > >> > +       sed  \
> > > > >> > +           -e 's,DU_BUILD=,DU_BUILD_unused=,g' \
> > > > >> > +           -e '/^CPPFLAGS.*/
> s,--sysroot=${STAGING_DIR_TARGET},,g' \
> > > > >> > +           -i ${B}/tools/toolutil/Makefile
> > > > >> > +}
> > > > >> > +
> > > > >> > +PREPROCESS_RELOCATE_DIRS = "${datadir}/${BPN}/${PV}"
> > > > >> > +do_install_append_class-native() {
> > > > >> > +       mkdir -p ${D}/${STAGING_ICU_DIR_NATIVE}/config
> > > > >> > +       cp -r ${B}/config/icucross.mk
> ${D}/${STAGING_ICU_DIR_NATIVE}/config
> > > > >> > +       cp -r ${B}/config/icucross.inc
> ${D}/${STAGING_ICU_DIR_NATIVE}/config
> > > > >> > +       cp -r ${B}/lib ${D}/${STAGING_ICU_DIR_NATIVE}
> > > > >> > +       cp -r ${B}/bin ${D}/${STAGING_ICU_DIR_NATIVE}
> > > > >> > +       cp -r ${B}/tools ${D}/${STAGING_ICU_DIR_NATIVE}
> > > > >> > +}
> > > > >> > +
> > > > >> > +do_install_append_class-target() {
> > > > >> > +    # The native pkgdata can not generate the correct data
> file.
> > > > >> > +    # Use icupkg to re-generate it.
> > > > >> > +    if [ "${SITEINFO_ENDIANNESS}" = "be" ] ; then
> > > > >> > +        rm -f
> ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
> > > > >> > +        icupkg -tb ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat
> ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
> > > > >> > +    fi
> > > > >> > +
> > > > >> > +       # Remove build host references...
> > > > >> > +       sed -i  \
> > > > >> > +           -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
> > > > >> > +           -e 's|${DEBUG_PREFIX_MAP}||g' \
> > > > >> > +           -e 's:${HOSTTOOLS_DIR}/::g' \
> > > > >> > +           ${D}/${bindir}/icu-config
> ${D}/${libdir}/${BPN}/${PV}/Makefile.inc \
> > > > >> > +           ${D}/${libdir}/${BPN}/${PV}/pkgdata.inc
> > > > >> > +}
> > > > >> > +
> > > > >> > +PACKAGES =+ "libicudata libicuuc libicui18n libicutu libicuio"
> > > > >> > +
> > > > >> > +FILES_${PN}-dev += "${libdir}/${BPN}/"
> > > > >> > +
> > > > >> > +FILES_libicudata = "${libdir}/libicudata.so.*"
> > > > >> > +FILES_libicuuc = "${libdir}/libicuuc.so.*"
> > > > >> > +FILES_libicui18n = "${libdir}/libicui18n.so.*"
> > > > >> > +FILES_libicutu = "${libdir}/libicutu.so.*"
> > > > >> > +FILES_libicuio = "${libdir}/libicuio.so.*"
> > > > >> > +
> > > > >> > +BBCLASSEXTEND = "native nativesdk"
> > > > >> >
> > > > >> >  LIC_FILES_CHKSUM =
> "file://../LICENSE;md5=a3808a5b70071b07f87ff2205e4d75a0"
> > > > >> >
> > > > >> > --
> > > > >> > 2.27.0
> > > > >> >
> > > > >> >
> > > 
>

--000000000000aae69405a9012868
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Can you, for the sake of testing, upgrade icu to the =
same version as master? Those failures do not seem to be happening there.</=
div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, 26 Jun 2020 at 17:59, Steve S=
akoman &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, Ju=
n 26, 2020 at 5:49 AM Ross Burton &lt;<a href=3D"mailto:ross@burtonini.com"=
 target=3D"_blank">ross@burtonini.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Failures in edgerouter and MIPS screams the big-endian thing again.<b=
r>
&gt; ICU is a disaster here, be warned.<br>
<br>
Good theory -- ppc failed too.<br>
<br>
Steve<br>
<br>
&gt; On Fri, 26 Jun 2020 at 16:27, Steve Sakoman &lt;<a href=3D"mailto:ste=
ve@sakoman.com" target=3D"_blank">steve@sakoman.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Thu, Jun 25, 2020 at 6:23 AM Steve Sakoman &lt;<a href=3D"mai=
lto:steve@sakoman.com" target=3D"_blank">steve@sakoman.com</a>&gt; wrote:<b=
r>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Thu, Jun 25, 2020 at 6:09 AM Alexander Kanavin<br>
&gt; &gt; &gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_bl=
ank">alex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I think you may have to recreate them by hand.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; OK, I&#39;ll put together a patch for the 66.1 recipe in du=
nfell that<br>
&gt; &gt; &gt; implements the changes you have in the second patch of the =
series.=C2=A0 In<br>
&gt; &gt; &gt; the interest of minimizing changes I&#39;ll keep the .inc f=
ile separate as<br>
&gt; &gt; &gt; is.<br>
&gt; &gt;<br>
&gt; &gt; I recreated the patch for 66.1 and did a couple of quick local b=
uilds<br>
&gt; &gt; and things looked fine.<br>
&gt; &gt;<br>
&gt; &gt; On the autobuilder I get failures for edgerouter and mips.=C2=A0=
 I seem to<br>
&gt; &gt; recall some discussion about this (perhaps on irc?) but can only=
 find<br>
&gt; &gt; one thread here on the list back when Khem&#39;s original patch =
went in.<br>
&gt; &gt;<br>
&gt; &gt; Did you recall any issues like this?<br>
&gt; &gt;<br>
&gt; &gt; Steve<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; &gt; On Thu, 25 Jun 2020 at 18:04, Steve Sakoman &lt;<a hre=
f=3D"mailto:steve@sakoman.com" target=3D"_blank">steve@sakoman.com</a>&gt; =
wrote:<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; Is this patch series suitable for dunfell as-is (t=
he concern being the<br>
&gt; &gt; &gt; &gt;&gt; contents of the version bump) or would a backport =
to 66.1 be<br>
&gt; &gt; &gt; &gt;&gt; necessary?<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; Steve<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; On Tue, Jun 23, 2020 at 11:09 AM Alexander Kanavin=
<br>
&gt; &gt; &gt; &gt;&gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" targ=
et=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; Both parts are rather convoluted, so it is be=
tter to have them in a single file.<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; Signed-off-by: Alexander Kanavin &lt;<a href=
=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.co=
m</a>&gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; ---<br>
&gt; &gt; &gt; &gt;&gt; &gt;=C2=A0 meta/recipes-support/icu/icu.inc=C2=A0 =
=
=C2=A0 =C2=A0| 84 ---------------------------<br>
&gt; &gt; &gt; &gt;&gt; &gt;=C2=A0 meta/recipes-support/icu/<a href=3D"htt=
p://icu_67.1.bb" rel=3D"noreferrer" target=3D"_blank">icu_67.1.bb</a> | 85 =
+++++++++++++++++++++++++++-<br>
&gt; &gt; &gt; &gt;&gt; &gt;=C2=A0 2 files changed, 84 insertions(+), 85 d=
eletions(-)<br>
&gt; &gt; &gt; &gt;&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-support=
/icu/icu.inc<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; diff --git a/meta/recipes-support/icu/icu.inc=
 b/meta/recipes-support/icu/icu.inc<br>
&gt; &gt; &gt; &gt;&gt; &gt; deleted file mode 100644<br>
&gt; &gt; &gt; &gt;&gt; &gt; index 6d9728903d..0000000000<br>
&gt; &gt; &gt; &gt;&gt; &gt; --- a/meta/recipes-support/icu/icu.inc<br>
&gt; &gt; &gt; &gt;&gt; &gt; +++ /dev/null<br>
&gt; &gt; &gt; &gt;&gt; &gt; @@ -1,84 +0,0 @@<br>
&gt; &gt; &gt; &gt;&gt; &gt; -SUMMARY =3D &quot;International Component fo=
r Unicode libraries&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; -DESCRIPTION =3D &quot;The International Comp=
onent for Unicode (ICU) is a mature, \<br>
&gt; &gt; &gt; &gt;&gt; &gt; -portable set of C/C++ and Java libraries for=
 Unicode support, software \<br>
&gt; &gt; &gt; &gt;&gt; &gt; -internationalization (I18N) and globalizatio=
n (G11N), giving applications the \<br>
&gt; &gt; &gt; &gt;&gt; &gt; -same results on all platforms.&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; -HOMEPAGE =3D &quot;<a href=3D"http://site.ic=
u-project.org/" rel=3D"noreferrer" target=3D"_blank">http://site.icu-projec=
t.org/</a>&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt; &gt; &gt;&gt; &gt; -LICENSE =3D &quot;ICU&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; -DEPENDS =3D &quot;icu-native&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; -DEPENDS_class-native =3D &quot;&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt; &gt; &gt;&gt; &gt; -CVE_PRODUCT =3D &quot;international_componen=
ts_for_unicode&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt; &gt; &gt;&gt; &gt; -S =3D &quot;${WORKDIR}/icu/source&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; -SPDX_S =3D &quot;${WORKDIR}/icu&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; -STAGING_ICU_DIR_NATIVE =3D &quot;${STAGING_D=
ATADIR_NATIVE}/${BPN}/${PV}&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt; &gt; &gt;&gt; &gt; -BINCONFIG =3D &quot;${bindir}/icu-config&quo=
t;<br>
&gt; &gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt; &gt; &gt;&gt; &gt; -ICU_MAJOR_VER =3D &quot;${@d.getVar(&#39;PV&=
#39;).split(&#39;.&#39;)[0]}&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt; &gt; &gt;&gt; &gt; -inherit autotools pkgconfig binconfig multil=
ib_script<br>
&gt; &gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt; &gt; &gt;&gt; &gt; -MULTILIB_SCRIPTS =3D &quot;${PN}-dev:${bindi=
r}/icu-config&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt; &gt; &gt;&gt; &gt; -# ICU needs the native build directory as an=
 argument to its --with-cross-build option when<br>
&gt; &gt; &gt; &gt;&gt; &gt; -# cross-compiling. Taken the situation that =
different builds may share a common sstate-cache<br>
&gt; &gt; &gt; &gt;&gt; &gt; -# into consideration, the native build direc=
tory needs to be staged.<br>
&gt; &gt; &gt; &gt;&gt; &gt; -EXTRA_OECONF =3D &quot;--with-cross-build=3D=
${STAGING_ICU_DIR_NATIVE}&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; -EXTRA_OECONF_class-native =3D &quot;&quot;<b=
r>
&gt; &gt; &gt; &gt;&gt; &gt; -EXTRA_OECONF_class-nativesdk =3D &quot;--wit=
h-cross-build=3D${STAGING_ICU_DIR_NATIVE}&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt; &gt; &gt;&gt; &gt; -EXTRA_OECONF_append_class-target =3D &quot;$=
{@oe.utils.conditional(&#39;SITEINFO_ENDIANNESS&#39;, &#39;be&#39;, &#39; -=
-with-data-packaging=3Darchive&#39;, &#39;&#39;, d)}&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; -TARGET_CXXFLAGS_append =3D &quot;${@oe.utils=
.conditional(&#39;SITEINFO_ENDIANNESS&#39;, &#39;be&#39;, &#39; -DICU_DATA_=
DIR=3D\\&quot;&quot;${datadir}/${BPN}/${PV}\\&quot;&quot;&#39;, &#39;&#39;,=
 d)}&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt; &gt; &gt;&gt; &gt; -ASNEEDED =3D &quot;&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt; &gt; &gt;&gt; &gt; -do_compile_prepend_class-target () {<br>
&gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# Make sure certa=
in build host references do not end up being compiled<br>
&gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# in the image. T=
his only affects libicutu and icu-dbg<br>
&gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sed=C2=A0 \<br>
&gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e =
&#39;s,DU_BUILD=3D,DU_BUILD_unused=3D,g&#39; \<br>
&gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e =
&#39;/^CPPFLAGS.*/ s,--sysroot=3D${STAGING_DIR_TARGET},,g&#39; \<br>
&gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-i =
${B}/tools/toolutil/Makefile<br>
&gt; &gt; &gt; &gt;&gt; &gt; -}<br>
&gt; &gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt; &gt; &gt;&gt; &gt; -PREPROCESS_RELOCATE_DIRS =3D &quot;${datadir=
}/${BPN}/${PV}&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; -do_install_append_class-native() {<br>
&gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${D}/${S=
TAGING_ICU_DIR_NATIVE}/config<br>
&gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${B}/config=
/<a href=3D"http://icucross.mk" rel=3D"noreferrer" target=3D"_blank">icucro=
ss.mk</a> ${D}/${STAGING_ICU_DIR_NATIVE}/config<br>
&gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${B}/config=
/icucross.inc ${D}/${STAGING_ICU_DIR_NATIVE}/config<br>
&gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${B}/lib ${=
D}/${STAGING_ICU_DIR_NATIVE}<br>
&gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${B}/bin ${=
D}/${STAGING_ICU_DIR_NATIVE}<br>
&gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${B}/tools =
${D}/${STAGING_ICU_DIR_NATIVE}<br>
&gt; &gt; &gt; &gt;&gt; &gt; -}<br>
&gt; &gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt; &gt; &gt;&gt; &gt; -do_install_append_class-target() {<br>
&gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 # The native pkgdata can not g=
enerate the correct data file.<br>
&gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 # Use icupkg to re-generate it=
.<br>
&gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 if [ &quot;${SITEINFO_ENDIANNE=
SS}&quot; =3D &quot;be&quot; ] ; then<br>
&gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ${D}/${dat=
adir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat<br>
&gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 icupkg -tb ${S}/=
data/in/icudt${ICU_MAJOR_VER}l.dat ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_=
MAJOR_VER}b.dat<br>
&gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 fi<br>
&gt; &gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove build ho=
st references...<br>
&gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i=C2=A0 \<br=
>
&gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e =
&#39;s,--sysroot=3D${STAGING_DIR_TARGET},,g&#39; \<br>
&gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e =
&#39;s|${DEBUG_PREFIX_MAP}||g&#39; \<br>
&gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e =
&#39;s:${HOSTTOOLS_DIR}/::g&#39; \<br>
&gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D=
}/${bindir}/icu-config ${D}/${libdir}/${BPN}/${PV}/Makefile.inc \<br>
&gt; &gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D=
}/${libdir}/${BPN}/${PV}/pkgdata.inc<br>
&gt; &gt; &gt; &gt;&gt; &gt; -}<br>
&gt; &gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt; &gt; &gt;&gt; &gt; -PACKAGES =3D+ &quot;libicudata libicuuc libi=
cui18n libicutu libicuio&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt; &gt; &gt;&gt; &gt; -FILES_${PN}-dev +=3D &quot;${libdir}/${BPN}/=
&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt; &gt; &gt;&gt; &gt; -FILES_libicudata =3D &quot;${libdir}/libicud=
ata.so.*&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; -FILES_libicuuc =3D &quot;${libdir}/libicuuc.=
so.*&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; -FILES_libicui18n =3D &quot;${libdir}/libicui=
18n.so.*&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; -FILES_libicutu =3D &quot;${libdir}/libicutu.=
so.*&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; -FILES_libicuio =3D &quot;${libdir}/libicuio.=
so.*&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt; &gt; &gt;&gt; &gt; -BBCLASSEXTEND =3D &quot;native nativesdk&quo=
t;<br>
&gt; &gt; &gt; &gt;&gt; &gt; diff --git a/meta/recipes-support/icu/<a href=
=
=3D"http://icu_67.1.bb" rel=3D"noreferrer" target=3D"_blank">icu_67.1.bb</=
a> b/meta/recipes-support/icu/<a href=3D"http://icu_67.1.bb" rel=3D"norefer=
rer" target=3D"_blank">icu_67.1.bb</a><br>
&gt; &gt; &gt; &gt;&gt; &gt; index 58638507c9..5814fa41bd 100644<br>
&gt; &gt; &gt; &gt;&gt; &gt; --- a/meta/recipes-support/icu/<a href=3D"htt=
p://icu_67.1.bb" rel=3D"noreferrer" target=3D"_blank">icu_67.1.bb</a><br>
&gt; &gt; &gt; &gt;&gt; &gt; +++ b/meta/recipes-support/icu/<a href=3D"htt=
p://icu_67.1.bb" rel=3D"noreferrer" target=3D"_blank">icu_67.1.bb</a><br>
&gt; &gt; &gt; &gt;&gt; &gt; @@ -1,4 +1,87 @@<br>
&gt; &gt; &gt; &gt;&gt; &gt; -require icu.inc<br>
&gt; &gt; &gt; &gt;&gt; &gt; +SUMMARY =3D &quot;International Component fo=
r Unicode libraries&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; +DESCRIPTION =3D &quot;The International Comp=
onent for Unicode (ICU) is a mature, \<br>
&gt; &gt; &gt; &gt;&gt; &gt; +portable set of C/C++ and Java libraries for=
 Unicode support, software \<br>
&gt; &gt; &gt; &gt;&gt; &gt; +internationalization (I18N) and globalizatio=
n (G11N), giving applications the \<br>
&gt; &gt; &gt; &gt;&gt; &gt; +same results on all platforms.&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"http://site.ic=
u-project.org/" rel=3D"noreferrer" target=3D"_blank">http://site.icu-projec=
t.org/</a>&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt; &gt; &gt;&gt; &gt; +LICENSE =3D &quot;ICU&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; +DEPENDS =3D &quot;icu-native&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; +DEPENDS_class-native =3D &quot;&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt; &gt; &gt;&gt; &gt; +CVE_PRODUCT =3D &quot;international_componen=
ts_for_unicode&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt; &gt; &gt;&gt; &gt; +S =3D &quot;${WORKDIR}/icu/source&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; +SPDX_S =3D &quot;${WORKDIR}/icu&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; +STAGING_ICU_DIR_NATIVE =3D &quot;${STAGING_D=
ATADIR_NATIVE}/${BPN}/${PV}&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt; &gt; &gt;&gt; &gt; +BINCONFIG =3D &quot;${bindir}/icu-config&quo=
t;<br>
&gt; &gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt; &gt; &gt;&gt; &gt; +ICU_MAJOR_VER =3D &quot;${@d.getVar(&#39;PV&=
#39;).split(&#39;.&#39;)[0]}&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt; &gt; &gt;&gt; &gt; +inherit autotools pkgconfig binconfig multil=
ib_script<br>
&gt; &gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt; &gt; &gt;&gt; &gt; +MULTILIB_SCRIPTS =3D &quot;${PN}-dev:${bindi=
r}/icu-config&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt; &gt; &gt;&gt; &gt; +# ICU needs the native build directory as an=
 argument to its --with-cross-build option when<br>
&gt; &gt; &gt; &gt;&gt; &gt; +# cross-compiling. Taken the situation that =
different builds may share a common sstate-cache<br>
&gt; &gt; &gt; &gt;&gt; &gt; +# into consideration, the native build direc=
tory needs to be staged.<br>
&gt; &gt; &gt; &gt;&gt; &gt; +EXTRA_OECONF =3D &quot;--with-cross-build=3D=
${STAGING_ICU_DIR_NATIVE}&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; +EXTRA_OECONF_class-native =3D &quot;&quot;<b=
r>
&gt; &gt; &gt; &gt;&gt; &gt; +EXTRA_OECONF_class-nativesdk =3D &quot;--wit=
h-cross-build=3D${STAGING_ICU_DIR_NATIVE}&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt; &gt; &gt;&gt; &gt; +EXTRA_OECONF_append_class-target =3D &quot;$=
{@oe.utils.conditional(&#39;SITEINFO_ENDIANNESS&#39;, &#39;be&#39;, &#39; -=
-with-data-packaging=3Darchive&#39;, &#39;&#39;, d)}&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; +TARGET_CXXFLAGS_append =3D &quot;${@oe.utils=
.conditional(&#39;SITEINFO_ENDIANNESS&#39;, &#39;be&#39;, &#39; -DICU_DATA_=
DIR=3D\\&quot;&quot;${datadir}/${BPN}/${PV}\\&quot;&quot;&#39;, &#39;&#39;,=
 d)}&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt; &gt; &gt;&gt; &gt; +ASNEEDED =3D &quot;&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt; &gt; &gt;&gt; &gt; +do_compile_prepend_class-target () {<br>
&gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# Make sure certa=
in build host references do not end up being compiled<br>
&gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# in the image. T=
his only affects libicutu and icu-dbg<br>
&gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sed=C2=A0 \<br>
&gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e =
&#39;s,DU_BUILD=3D,DU_BUILD_unused=3D,g&#39; \<br>
&gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e =
&#39;/^CPPFLAGS.*/ s,--sysroot=3D${STAGING_DIR_TARGET},,g&#39; \<br>
&gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-i =
${B}/tools/toolutil/Makefile<br>
&gt; &gt; &gt; &gt;&gt; &gt; +}<br>
&gt; &gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt; &gt; &gt;&gt; &gt; +PREPROCESS_RELOCATE_DIRS =3D &quot;${datadir=
}/${BPN}/${PV}&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; +do_install_append_class-native() {<br>
&gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${D}/${S=
TAGING_ICU_DIR_NATIVE}/config<br>
&gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${B}/config=
/<a href=3D"http://icucross.mk" rel=3D"noreferrer" target=3D"_blank">icucro=
ss.mk</a> ${D}/${STAGING_ICU_DIR_NATIVE}/config<br>
&gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${B}/config=
/icucross.inc ${D}/${STAGING_ICU_DIR_NATIVE}/config<br>
&gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${B}/lib ${=
D}/${STAGING_ICU_DIR_NATIVE}<br>
&gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${B}/bin ${=
D}/${STAGING_ICU_DIR_NATIVE}<br>
&gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${B}/tools =
${D}/${STAGING_ICU_DIR_NATIVE}<br>
&gt; &gt; &gt; &gt;&gt; &gt; +}<br>
&gt; &gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt; &gt; &gt;&gt; &gt; +do_install_append_class-target() {<br>
&gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 # The native pkgdata can not g=
enerate the correct data file.<br>
&gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 # Use icupkg to re-generate it=
.<br>
&gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 if [ &quot;${SITEINFO_ENDIANNE=
SS}&quot; =3D &quot;be&quot; ] ; then<br>
&gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ${D}/${dat=
adir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat<br>
&gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 icupkg -tb ${S}/=
data/in/icudt${ICU_MAJOR_VER}l.dat ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_=
MAJOR_VER}b.dat<br>
&gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 fi<br>
&gt; &gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove build ho=
st references...<br>
&gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i=C2=A0 \<br=
>
&gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e =
&#39;s,--sysroot=3D${STAGING_DIR_TARGET},,g&#39; \<br>
&gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e =
&#39;s|${DEBUG_PREFIX_MAP}||g&#39; \<br>
&gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e =
&#39;s:${HOSTTOOLS_DIR}/::g&#39; \<br>
&gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D=
}/${bindir}/icu-config ${D}/${libdir}/${BPN}/${PV}/Makefile.inc \<br>
&gt; &gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D=
}/${libdir}/${BPN}/${PV}/pkgdata.inc<br>
&gt; &gt; &gt; &gt;&gt; &gt; +}<br>
&gt; &gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt; &gt; &gt;&gt; &gt; +PACKAGES =3D+ &quot;libicudata libicuuc libi=
cui18n libicutu libicuio&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt; &gt; &gt;&gt; &gt; +FILES_${PN}-dev +=3D &quot;${libdir}/${BPN}/=
&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt; &gt; &gt;&gt; &gt; +FILES_libicudata =3D &quot;${libdir}/libicud=
ata.so.*&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; +FILES_libicuuc =3D &quot;${libdir}/libicuuc.=
so.*&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; +FILES_libicui18n =3D &quot;${libdir}/libicui=
18n.so.*&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; +FILES_libicutu =3D &quot;${libdir}/libicutu.=
so.*&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; +FILES_libicuio =3D &quot;${libdir}/libicuio.=
so.*&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt; &gt; &gt;&gt; &gt; +BBCLASSEXTEND =3D &quot;native nativesdk&quo=
t;<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://../LI=
CENSE;md5=3Da3808a5b70071b07f87ff2205e4d75a0&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; --<br>
&gt; &gt; &gt; &gt;&gt; &gt; 2.27.0<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; <br>
</blockquote></div>

--000000000000aae69405a9012868--
