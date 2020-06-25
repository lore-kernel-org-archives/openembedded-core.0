Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web12.271.1593101396976780077
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 09:09:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hjEfF5JC;
 spf=pass (domain: gmail.com, ip: 209.85.222.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f41.google.com with SMTP id c7so595516uap.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2020 09:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ux3JBU0kYmost0Vo8HuPinjUUQWp/KCI+yemct0eDVg=;
        b=hjEfF5JC3j41pH7JQrltmLFHSQFiYmcqHSKsSXYkUkcWwoNm6IuHmQxgMWvk6RXk5b
         aAA8XxoUswy/+5/d2C/r+w+0wjpMctktMGSEb6/SUtMs2OXWQt7iDH2k0XbMWsaDxUfD
         i+zmHNtrS5219g3/8EkmOqgmMQJR10GHO8y423D1++oKIA2OW9Aw0K3znbu2kqrP2Tif
         +y5qb04tWSFizQ5QjaqHoVfJ/bTvmzYqwS0gM/y9pYchp0ggdeStQgXIvOy68JQaC+Lj
         xHU8XtZZebhrGH0eUQm/mzBqdQbhKQNN+ce89Ku/HOOjIzVwZLf3J6gUhN2RVbFxxxKb
         Qn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ux3JBU0kYmost0Vo8HuPinjUUQWp/KCI+yemct0eDVg=;
        b=uh7FKJqctzmg0l/gBTXMuSSK8awfVbLwdzmoFRw5PfAeQy3hySsu1mpUJr1sxkyLJU
         6Jx6Pih4U/bWdQqykPmDzac2BbAczPXO67G7MHgJuD+YwMwbVl0/0o9KtSAGp9JJm+S3
         gAUVIXdNAkIaadJALLfDzB2CKszE/ENCIhEsNEu6PqgS8XOEwBs6mdrvTYT/FXPw/LBz
         NI6Nxo8H9slZ8V9U4IWnWgWtmttE5zkCqN0PDfxCaOspn9Ieo6i3pPur7KpCxla9hIKc
         QtwNqnY+si09DvKa/LwPqM8DaAVvqOvxN/a75RX6wHtlQhwsCWmtgJVMR+U0WG+xE/lE
         r6ig==
X-Gm-Message-State: AOAM533c5uz6P6GZUkD/wo7lo+RGsIv2PAQSYD+lc2wy6fwKUO348J8h
	EkUdvQi4UtnNpFRb26zkZSPUmjONYT8lvvd7LIo=
X-Google-Smtp-Source: ABdhPJzkhyRTa5uySeWwC9O1nlXAAXx4D0xZUBz6TZp+vR/FJntqRNbmriGyd7BcbuDBqujonMX0sDPcjd5OYudsWIc=
X-Received: by 2002:ab0:6f0a:: with SMTP id r10mr6951584uah.100.1593101395941;
 Thu, 25 Jun 2020 09:09:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200623210837.26222-1-alex.kanavin@gmail.com> <CAOSpxdYUPQwNmZNP8FF7M=M2a95Wfvth0xpcO+C3G7bGKiJXCw@mail.gmail.com>
In-Reply-To: <CAOSpxdYUPQwNmZNP8FF7M=M2a95Wfvth0xpcO+C3G7bGKiJXCw@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 25 Jun 2020 18:09:43 +0200
Message-ID: <CANNYZj_U=WVHNrZLZK8_pNdgHf9YyKvfpFdcSrCTrq+8X-njKA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] icu: merge .inc into main recipe
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000cbde3d05a8ead290"

--000000000000cbde3d05a8ead290
Content-Type: text/plain; charset="UTF-8"

I think you may have to recreate them by hand.

Alex

On Thu, 25 Jun 2020 at 18:04, Steve Sakoman <steve@sakoman.com> wrote:

> Is this patch series suitable for dunfell as-is (the concern being the
> contents of the version bump) or would a backport to 66.1 be
> necessary?
>
> Steve
>
> On Tue, Jun 23, 2020 at 11:09 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Both parts are rather convoluted, so it is better to have them in a
> single file.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/recipes-support/icu/icu.inc     | 84 ---------------------------
> >  meta/recipes-support/icu/icu_67.1.bb | 85 +++++++++++++++++++++++++++-
> >  2 files changed, 84 insertions(+), 85 deletions(-)
> >  delete mode 100644 meta/recipes-support/icu/icu.inc
> >
> > diff --git a/meta/recipes-support/icu/icu.inc
> b/meta/recipes-support/icu/icu.inc
> > deleted file mode 100644
> > index 6d9728903d..0000000000
> > --- a/meta/recipes-support/icu/icu.inc
> > +++ /dev/null
> > @@ -1,84 +0,0 @@
> > -SUMMARY = "International Component for Unicode libraries"
> > -DESCRIPTION = "The International Component for Unicode (ICU) is a
> mature, \
> > -portable set of C/C++ and Java libraries for Unicode support, software \
> > -internationalization (I18N) and globalization (G11N), giving
> applications the \
> > -same results on all platforms."
> > -HOMEPAGE = "http://site.icu-project.org/"
> > -
> > -LICENSE = "ICU"
> > -DEPENDS = "icu-native"
> > -DEPENDS_class-native = ""
> > -
> > -CVE_PRODUCT = "international_components_for_unicode"
> > -
> > -S = "${WORKDIR}/icu/source"
> > -SPDX_S = "${WORKDIR}/icu"
> > -STAGING_ICU_DIR_NATIVE = "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
> > -
> > -BINCONFIG = "${bindir}/icu-config"
> > -
> > -ICU_MAJOR_VER = "${@d.getVar('PV').split('.')[0]}"
> > -
> > -inherit autotools pkgconfig binconfig multilib_script
> > -
> > -MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/icu-config"
> > -
> > -# ICU needs the native build directory as an argument to its
> --with-cross-build option when
> > -# cross-compiling. Taken the situation that different builds may share
> a common sstate-cache
> > -# into consideration, the native build directory needs to be staged.
> > -EXTRA_OECONF = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
> > -EXTRA_OECONF_class-native = ""
> > -EXTRA_OECONF_class-nativesdk =
> "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
> > -
> > -EXTRA_OECONF_append_class-target =
> "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', '
> --with-data-packaging=archive', '', d)}"
> > -TARGET_CXXFLAGS_append =
> "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', '
> -DICU_DATA_DIR=\\""${datadir}/${BPN}/${PV}\\""', '', d)}"
> > -
> > -ASNEEDED = ""
> > -
> > -do_compile_prepend_class-target () {
> > -       # Make sure certain build host references do not end up being
> compiled
> > -       # in the image. This only affects libicutu and icu-dbg
> > -       sed  \
> > -           -e 's,DU_BUILD=,DU_BUILD_unused=,g' \
> > -           -e '/^CPPFLAGS.*/ s,--sysroot=${STAGING_DIR_TARGET},,g' \
> > -           -i ${B}/tools/toolutil/Makefile
> > -}
> > -
> > -PREPROCESS_RELOCATE_DIRS = "${datadir}/${BPN}/${PV}"
> > -do_install_append_class-native() {
> > -       mkdir -p ${D}/${STAGING_ICU_DIR_NATIVE}/config
> > -       cp -r ${B}/config/icucross.mk
> ${D}/${STAGING_ICU_DIR_NATIVE}/config
> > -       cp -r ${B}/config/icucross.inc
> ${D}/${STAGING_ICU_DIR_NATIVE}/config
> > -       cp -r ${B}/lib ${D}/${STAGING_ICU_DIR_NATIVE}
> > -       cp -r ${B}/bin ${D}/${STAGING_ICU_DIR_NATIVE}
> > -       cp -r ${B}/tools ${D}/${STAGING_ICU_DIR_NATIVE}
> > -}
> > -
> > -do_install_append_class-target() {
> > -    # The native pkgdata can not generate the correct data file.
> > -    # Use icupkg to re-generate it.
> > -    if [ "${SITEINFO_ENDIANNESS}" = "be" ] ; then
> > -        rm -f ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
> > -        icupkg -tb ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat
> ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
> > -    fi
> > -
> > -       # Remove build host references...
> > -       sed -i  \
> > -           -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
> > -           -e 's|${DEBUG_PREFIX_MAP}||g' \
> > -           -e 's:${HOSTTOOLS_DIR}/::g' \
> > -           ${D}/${bindir}/icu-config
> ${D}/${libdir}/${BPN}/${PV}/Makefile.inc \
> > -           ${D}/${libdir}/${BPN}/${PV}/pkgdata.inc
> > -}
> > -
> > -PACKAGES =+ "libicudata libicuuc libicui18n libicutu libicuio"
> > -
> > -FILES_${PN}-dev += "${libdir}/${BPN}/"
> > -
> > -FILES_libicudata = "${libdir}/libicudata.so.*"
> > -FILES_libicuuc = "${libdir}/libicuuc.so.*"
> > -FILES_libicui18n = "${libdir}/libicui18n.so.*"
> > -FILES_libicutu = "${libdir}/libicutu.so.*"
> > -FILES_libicuio = "${libdir}/libicuio.so.*"
> > -
> > -BBCLASSEXTEND = "native nativesdk"
> > diff --git a/meta/recipes-support/icu/icu_67.1.bb
> b/meta/recipes-support/icu/icu_67.1.bb
> > index 58638507c9..5814fa41bd 100644
> > --- a/meta/recipes-support/icu/icu_67.1.bb
> > +++ b/meta/recipes-support/icu/icu_67.1.bb
> > @@ -1,4 +1,87 @@
> > -require icu.inc
> > +SUMMARY = "International Component for Unicode libraries"
> > +DESCRIPTION = "The International Component for Unicode (ICU) is a
> mature, \
> > +portable set of C/C++ and Java libraries for Unicode support, software \
> > +internationalization (I18N) and globalization (G11N), giving
> applications the \
> > +same results on all platforms."
> > +HOMEPAGE = "http://site.icu-project.org/"
> > +
> > +LICENSE = "ICU"
> > +DEPENDS = "icu-native"
> > +DEPENDS_class-native = ""
> > +
> > +CVE_PRODUCT = "international_components_for_unicode"
> > +
> > +S = "${WORKDIR}/icu/source"
> > +SPDX_S = "${WORKDIR}/icu"
> > +STAGING_ICU_DIR_NATIVE = "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
> > +
> > +BINCONFIG = "${bindir}/icu-config"
> > +
> > +ICU_MAJOR_VER = "${@d.getVar('PV').split('.')[0]}"
> > +
> > +inherit autotools pkgconfig binconfig multilib_script
> > +
> > +MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/icu-config"
> > +
> > +# ICU needs the native build directory as an argument to its
> --with-cross-build option when
> > +# cross-compiling. Taken the situation that different builds may share
> a common sstate-cache
> > +# into consideration, the native build directory needs to be staged.
> > +EXTRA_OECONF = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
> > +EXTRA_OECONF_class-native = ""
> > +EXTRA_OECONF_class-nativesdk =
> "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
> > +
> > +EXTRA_OECONF_append_class-target =
> "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', '
> --with-data-packaging=archive', '', d)}"
> > +TARGET_CXXFLAGS_append =
> "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', '
> -DICU_DATA_DIR=\\""${datadir}/${BPN}/${PV}\\""', '', d)}"
> > +
> > +ASNEEDED = ""
> > +
> > +do_compile_prepend_class-target () {
> > +       # Make sure certain build host references do not end up being
> compiled
> > +       # in the image. This only affects libicutu and icu-dbg
> > +       sed  \
> > +           -e 's,DU_BUILD=,DU_BUILD_unused=,g' \
> > +           -e '/^CPPFLAGS.*/ s,--sysroot=${STAGING_DIR_TARGET},,g' \
> > +           -i ${B}/tools/toolutil/Makefile
> > +}
> > +
> > +PREPROCESS_RELOCATE_DIRS = "${datadir}/${BPN}/${PV}"
> > +do_install_append_class-native() {
> > +       mkdir -p ${D}/${STAGING_ICU_DIR_NATIVE}/config
> > +       cp -r ${B}/config/icucross.mk
> ${D}/${STAGING_ICU_DIR_NATIVE}/config
> > +       cp -r ${B}/config/icucross.inc
> ${D}/${STAGING_ICU_DIR_NATIVE}/config
> > +       cp -r ${B}/lib ${D}/${STAGING_ICU_DIR_NATIVE}
> > +       cp -r ${B}/bin ${D}/${STAGING_ICU_DIR_NATIVE}
> > +       cp -r ${B}/tools ${D}/${STAGING_ICU_DIR_NATIVE}
> > +}
> > +
> > +do_install_append_class-target() {
> > +    # The native pkgdata can not generate the correct data file.
> > +    # Use icupkg to re-generate it.
> > +    if [ "${SITEINFO_ENDIANNESS}" = "be" ] ; then
> > +        rm -f ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
> > +        icupkg -tb ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat
> ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
> > +    fi
> > +
> > +       # Remove build host references...
> > +       sed -i  \
> > +           -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
> > +           -e 's|${DEBUG_PREFIX_MAP}||g' \
> > +           -e 's:${HOSTTOOLS_DIR}/::g' \
> > +           ${D}/${bindir}/icu-config
> ${D}/${libdir}/${BPN}/${PV}/Makefile.inc \
> > +           ${D}/${libdir}/${BPN}/${PV}/pkgdata.inc
> > +}
> > +
> > +PACKAGES =+ "libicudata libicuuc libicui18n libicutu libicuio"
> > +
> > +FILES_${PN}-dev += "${libdir}/${BPN}/"
> > +
> > +FILES_libicudata = "${libdir}/libicudata.so.*"
> > +FILES_libicuuc = "${libdir}/libicuuc.so.*"
> > +FILES_libicui18n = "${libdir}/libicui18n.so.*"
> > +FILES_libicutu = "${libdir}/libicutu.so.*"
> > +FILES_libicuio = "${libdir}/libicuio.so.*"
> > +
> > +BBCLASSEXTEND = "native nativesdk"
> >
> >  LIC_FILES_CHKSUM =
> "file://../LICENSE;md5=a3808a5b70071b07f87ff2205e4d75a0"
> >
> > --
> > 2.27.0
> >
> > 
>

--000000000000cbde3d05a8ead290
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think you may have to recreate them by hand.</div><=
div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Thu, 25 Jun 2020 at 18:04, Steve Sakoma=
n &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Is this patch s=
eries suitable for dunfell as-is (the concern being the<br>
contents of the version bump) or would a backport to 66.1 be<br>
necessary?<br>
<br>
Steve<br>
<br>
On Tue, Jun 23, 2020 at 11:09 AM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanav=
in@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Both parts are rather convoluted, so it is better to have them in a s=
ingle file.<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-support/icu/icu.inc=C2=A0 =C2=A0 =C2=A0| 84 ------=
---------------------<br>
&gt;=C2=A0 meta/recipes-support/icu/<a href=3D"http://icu_67.1.bb" rel=3D"=
noreferrer" target=3D"_blank">icu_67.1.bb</a> | 85 ++++++++++++++++++++++++=
+++-<br>
&gt;=C2=A0 2 files changed, 84 insertions(+), 85 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-support/icu/icu.inc<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/icu/icu.inc b/meta/recipes-support/=
icu/icu.inc<br>
&gt; deleted file mode 100644<br>
&gt; index 6d9728903d..0000000000<br>
&gt; --- a/meta/recipes-support/icu/icu.inc<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,84 +0,0 @@<br>
&gt; -SUMMARY =3D &quot;International Component for Unicode libraries&quot=
;<br>
&gt; -DESCRIPTION =3D &quot;The International Component for Unicode (ICU) =
is a mature, \<br>
&gt; -portable set of C/C++ and Java libraries for Unicode support, softwa=
re \<br>
&gt; -internationalization (I18N) and globalization (G11N), giving applica=
tions the \<br>
&gt; -same results on all platforms.&quot;<br>
&gt; -HOMEPAGE =3D &quot;<a href=3D"http://site.icu-project.org/" rel=3D"n=
oreferrer" target=3D"_blank">http://site.icu-project.org/</a>&quot;<br>
&gt; -<br>
&gt; -LICENSE =3D &quot;ICU&quot;<br>
&gt; -DEPENDS =3D &quot;icu-native&quot;<br>
&gt; -DEPENDS_class-native =3D &quot;&quot;<br>
&gt; -<br>
&gt; -CVE_PRODUCT =3D &quot;international_components_for_unicode&quot;<br>
&gt; -<br>
&gt; -S =3D &quot;${WORKDIR}/icu/source&quot;<br>
&gt; -SPDX_S =3D &quot;${WORKDIR}/icu&quot;<br>
&gt; -STAGING_ICU_DIR_NATIVE =3D &quot;${STAGING_DATADIR_NATIVE}/${BPN}/${=
PV}&quot;<br>
&gt; -<br>
&gt; -BINCONFIG =3D &quot;${bindir}/icu-config&quot;<br>
&gt; -<br>
&gt; -ICU_MAJOR_VER =3D &quot;${@d.getVar(&#39;PV&#39;).split(&#39;.&#39;)=
[0]}&quot;<br>
&gt; -<br>
&gt; -inherit autotools pkgconfig binconfig multilib_script<br>
&gt; -<br>
&gt; -MULTILIB_SCRIPTS =3D &quot;${PN}-dev:${bindir}/icu-config&quot;<br>
&gt; -<br>
&gt; -# ICU needs the native build directory as an argument to its --with-=
cross-build option when<br>
&gt; -# cross-compiling. Taken the situation that different builds may sha=
re a common sstate-cache<br>
&gt; -# into consideration, the native build directory needs to be staged.=
<br>
&gt; -EXTRA_OECONF =3D &quot;--with-cross-build=3D${STAGING_ICU_DIR_NATIVE=
}&quot;<br>
&gt; -EXTRA_OECONF_class-native =3D &quot;&quot;<br>
&gt; -EXTRA_OECONF_class-nativesdk =3D &quot;--with-cross-build=3D${STAGIN=
G_ICU_DIR_NATIVE}&quot;<br>
&gt; -<br>
&gt; -EXTRA_OECONF_append_class-target =3D &quot;${@oe.utils.conditional(&=
#39;SITEINFO_ENDIANNESS&#39;, &#39;be&#39;, &#39; --with-data-packaging=3Da=
rchive&#39;, &#39;&#39;, d)}&quot;<br>
&gt; -TARGET_CXXFLAGS_append =3D &quot;${@oe.utils.conditional(&#39;SITEIN=
FO_ENDIANNESS&#39;, &#39;be&#39;, &#39; -DICU_DATA_DIR=3D\\&quot;&quot;${da=
tadir}/${BPN}/${PV}\\&quot;&quot;&#39;, &#39;&#39;, d)}&quot;<br>
&gt; -<br>
&gt; -ASNEEDED =3D &quot;&quot;<br>
&gt; -<br>
&gt; -do_compile_prepend_class-target () {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# Make sure certain build host references=
 do not end up being compiled<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# in the image. This only affects libicut=
u and icu-dbg<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sed=C2=A0 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s,DU_BUILD=3D,DU_BU=
ILD_unused=3D,g&#39; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;/^CPPFLAGS.*/ s,--s=
ysroot=3D${STAGING_DIR_TARGET},,g&#39; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-i ${B}/tools/toolutil/Make=
file<br>
&gt; -}<br>
&gt; -<br>
&gt; -PREPROCESS_RELOCATE_DIRS =3D &quot;${datadir}/${BPN}/${PV}&quot;<br>
&gt; -do_install_append_class-native() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${D}/${STAGING_ICU_DIR_NATIVE}/c=
onfig<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${B}/config/<a href=3D"http://icucr=
oss.mk" rel=3D"noreferrer" target=3D"_blank">icucross.mk</a> ${D}/${STAGING=
_ICU_DIR_NATIVE}/config<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${B}/config/icucross.inc ${D}/${STA=
GING_ICU_DIR_NATIVE}/config<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${B}/lib ${D}/${STAGING_ICU_DIR_NAT=
IVE}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${B}/bin ${D}/${STAGING_ICU_DIR_NAT=
IVE}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${B}/tools ${D}/${STAGING_ICU_DIR_N=
ATIVE}<br>
&gt; -}<br>
&gt; -<br>
&gt; -do_install_append_class-target() {<br>
&gt; -=C2=A0 =C2=A0 # The native pkgdata can not generate the correct data=
 file.<br>
&gt; -=C2=A0 =C2=A0 # Use icupkg to re-generate it.<br>
&gt; -=C2=A0 =C2=A0 if [ &quot;${SITEINFO_ENDIANNESS}&quot; =3D &quot;be&q=
uot; ] ; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ${D}/${datadir}/${BPN}/${PV}/icudt=
${ICU_MAJOR_VER}b.dat<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 icupkg -tb ${S}/data/in/icudt${ICU_MAJOR=
_VER}l.dat ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat<br>
&gt; -=C2=A0 =C2=A0 fi<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove build host references...<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i=C2=A0 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s,--sysroot=3D${STA=
GING_DIR_TARGET},,g&#39; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s|${DEBUG_PREFIX_MA=
P}||g&#39; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s:${HOSTTOOLS_DIR}/=
::g&#39; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}/${bindir}/icu-config $=
{D}/${libdir}/${BPN}/${PV}/Makefile.inc \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}/${libdir}/${BPN}/${PV}=
/pkgdata.inc<br>
&gt; -}<br>
&gt; -<br>
&gt; -PACKAGES =3D+ &quot;libicudata libicuuc libicui18n libicutu libicuio=
&quot;<br>
&gt; -<br>
&gt; -FILES_${PN}-dev +=3D &quot;${libdir}/${BPN}/&quot;<br>
&gt; -<br>
&gt; -FILES_libicudata =3D &quot;${libdir}/libicudata.so.*&quot;<br>
&gt; -FILES_libicuuc =3D &quot;${libdir}/libicuuc.so.*&quot;<br>
&gt; -FILES_libicui18n =3D &quot;${libdir}/libicui18n.so.*&quot;<br>
&gt; -FILES_libicutu =3D &quot;${libdir}/libicutu.so.*&quot;<br>
&gt; -FILES_libicuio =3D &quot;${libdir}/libicuio.so.*&quot;<br>
&gt; -<br>
&gt; -BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; diff --git a/meta/recipes-support/icu/<a href=3D"http://icu_67.1.bb" =
rel=3D"noreferrer" target=3D"_blank">icu_67.1.bb</a> b/meta/recipes-support=
/icu/<a href=3D"http://icu_67.1.bb" rel=3D"noreferrer" target=3D"_blank">ic=
u_67.1.bb</a><br>
&gt; index 58638507c9..5814fa41bd 100644<br>
&gt; --- a/meta/recipes-support/icu/<a href=3D"http://icu_67.1.bb" rel=3D"=
noreferrer" target=3D"_blank">icu_67.1.bb</a><br>
&gt; +++ b/meta/recipes-support/icu/<a href=3D"http://icu_67.1.bb" rel=3D"=
noreferrer" target=3D"_blank">icu_67.1.bb</a><br>
&gt; @@ -1,4 +1,87 @@<br>
&gt; -require icu.inc<br>
&gt; +SUMMARY =3D &quot;International Component for Unicode libraries&quot=
;<br>
&gt; +DESCRIPTION =3D &quot;The International Component for Unicode (ICU) =
is a mature, \<br>
&gt; +portable set of C/C++ and Java libraries for Unicode support, softwa=
re \<br>
&gt; +internationalization (I18N) and globalization (G11N), giving applica=
tions the \<br>
&gt; +same results on all platforms.&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"http://site.icu-project.org/" rel=3D"n=
oreferrer" target=3D"_blank">http://site.icu-project.org/</a>&quot;<br>
&gt; +<br>
&gt; +LICENSE =3D &quot;ICU&quot;<br>
&gt; +DEPENDS =3D &quot;icu-native&quot;<br>
&gt; +DEPENDS_class-native =3D &quot;&quot;<br>
&gt; +<br>
&gt; +CVE_PRODUCT =3D &quot;international_components_for_unicode&quot;<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/icu/source&quot;<br>
&gt; +SPDX_S =3D &quot;${WORKDIR}/icu&quot;<br>
&gt; +STAGING_ICU_DIR_NATIVE =3D &quot;${STAGING_DATADIR_NATIVE}/${BPN}/${=
PV}&quot;<br>
&gt; +<br>
&gt; +BINCONFIG =3D &quot;${bindir}/icu-config&quot;<br>
&gt; +<br>
&gt; +ICU_MAJOR_VER =3D &quot;${@d.getVar(&#39;PV&#39;).split(&#39;.&#39;)=
[0]}&quot;<br>
&gt; +<br>
&gt; +inherit autotools pkgconfig binconfig multilib_script<br>
&gt; +<br>
&gt; +MULTILIB_SCRIPTS =3D &quot;${PN}-dev:${bindir}/icu-config&quot;<br>
&gt; +<br>
&gt; +# ICU needs the native build directory as an argument to its --with-=
cross-build option when<br>
&gt; +# cross-compiling. Taken the situation that different builds may sha=
re a common sstate-cache<br>
&gt; +# into consideration, the native build directory needs to be staged.=
<br>
&gt; +EXTRA_OECONF =3D &quot;--with-cross-build=3D${STAGING_ICU_DIR_NATIVE=
}&quot;<br>
&gt; +EXTRA_OECONF_class-native =3D &quot;&quot;<br>
&gt; +EXTRA_OECONF_class-nativesdk =3D &quot;--with-cross-build=3D${STAGIN=
G_ICU_DIR_NATIVE}&quot;<br>
&gt; +<br>
&gt; +EXTRA_OECONF_append_class-target =3D &quot;${@oe.utils.conditional(&=
#39;SITEINFO_ENDIANNESS&#39;, &#39;be&#39;, &#39; --with-data-packaging=3Da=
rchive&#39;, &#39;&#39;, d)}&quot;<br>
&gt; +TARGET_CXXFLAGS_append =3D &quot;${@oe.utils.conditional(&#39;SITEIN=
FO_ENDIANNESS&#39;, &#39;be&#39;, &#39; -DICU_DATA_DIR=3D\\&quot;&quot;${da=
tadir}/${BPN}/${PV}\\&quot;&quot;&#39;, &#39;&#39;, d)}&quot;<br>
&gt; +<br>
&gt; +ASNEEDED =3D &quot;&quot;<br>
&gt; +<br>
&gt; +do_compile_prepend_class-target () {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# Make sure certain build host references=
 do not end up being compiled<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# in the image. This only affects libicut=
u and icu-dbg<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sed=C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s,DU_BUILD=3D,DU_BU=
ILD_unused=3D,g&#39; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;/^CPPFLAGS.*/ s,--s=
ysroot=3D${STAGING_DIR_TARGET},,g&#39; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-i ${B}/tools/toolutil/Make=
file<br>
&gt; +}<br>
&gt; +<br>
&gt; +PREPROCESS_RELOCATE_DIRS =3D &quot;${datadir}/${BPN}/${PV}&quot;<br>
&gt; +do_install_append_class-native() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${D}/${STAGING_ICU_DIR_NATIVE}/c=
onfig<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${B}/config/<a href=3D"http://icucr=
oss.mk" rel=3D"noreferrer" target=3D"_blank">icucross.mk</a> ${D}/${STAGING=
_ICU_DIR_NATIVE}/config<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${B}/config/icucross.inc ${D}/${STA=
GING_ICU_DIR_NATIVE}/config<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${B}/lib ${D}/${STAGING_ICU_DIR_NAT=
IVE}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${B}/bin ${D}/${STAGING_ICU_DIR_NAT=
IVE}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${B}/tools ${D}/${STAGING_ICU_DIR_N=
ATIVE}<br>
&gt; +}<br>
&gt; +<br>
&gt; +do_install_append_class-target() {<br>
&gt; +=C2=A0 =C2=A0 # The native pkgdata can not generate the correct data=
 file.<br>
&gt; +=C2=A0 =C2=A0 # Use icupkg to re-generate it.<br>
&gt; +=C2=A0 =C2=A0 if [ &quot;${SITEINFO_ENDIANNESS}&quot; =3D &quot;be&q=
uot; ] ; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ${D}/${datadir}/${BPN}/${PV}/icudt=
${ICU_MAJOR_VER}b.dat<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 icupkg -tb ${S}/data/in/icudt${ICU_MAJOR=
_VER}l.dat ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove build host references...<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i=C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s,--sysroot=3D${STA=
GING_DIR_TARGET},,g&#39; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s|${DEBUG_PREFIX_MA=
P}||g&#39; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s:${HOSTTOOLS_DIR}/=
::g&#39; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}/${bindir}/icu-config $=
{D}/${libdir}/${BPN}/${PV}/Makefile.inc \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}/${libdir}/${BPN}/${PV}=
/pkgdata.inc<br>
&gt; +}<br>
&gt; +<br>
&gt; +PACKAGES =3D+ &quot;libicudata libicuuc libicui18n libicutu libicuio=
&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-dev +=3D &quot;${libdir}/${BPN}/&quot;<br>
&gt; +<br>
&gt; +FILES_libicudata =3D &quot;${libdir}/libicudata.so.*&quot;<br>
&gt; +FILES_libicuuc =3D &quot;${libdir}/libicuuc.so.*&quot;<br>
&gt; +FILES_libicui18n =3D &quot;${libdir}/libicui18n.so.*&quot;<br>
&gt; +FILES_libicutu =3D &quot;${libdir}/libicutu.so.*&quot;<br>
&gt; +FILES_libicuio =3D &quot;${libdir}/libicuio.so.*&quot;<br>
&gt; +<br>
&gt; +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://../LICENSE;md5=3Da3808a5b7007=
1b07f87ff2205e4d75a0&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.27.0<br>
&gt;<br>
&gt; <br>
</blockquote></div>

--000000000000cbde3d05a8ead290--
