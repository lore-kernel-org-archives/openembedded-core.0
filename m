Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
 by mx.groups.io with SMTP id smtpd.web11.5446.1588676959593830197
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 04:09:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E1fgaj0T;
 spf=pass (domain: gmail.com, ip: 209.85.221.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f178.google.com with SMTP id p5so377489vke.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 04:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I7IoNOIkuvQzz9GPe/hKgZCbwARLnOV09vsehZFzo50=;
        b=E1fgaj0TRDyXjdJ8DqkQ6O5SyHKE25oAqfIePFuxigJ9LBcKc1b9gygJGaaH3/Q/Vq
         oYSw/zEuX3e8jHGPK4qCwXkbGCkJpPtmdzhC2lXNX14Apc/qpyltzH4xLrz20voMLw2q
         5dh56SZIqEWaphgbo3aZZmCB4KVvlS0TIIge3lCI4H3yGz4BxyEV0nCOY4k3DshJPjSG
         QrlYBkIr2MZj2Oh4/Bn2DoO7HB9XGNaydzzj5XTOWq1sTlE83zcFs8i8xqlDXqYfKSAZ
         vQ3Urk0cSqLv16El8gFhGj5KsowswV6b/eGrYPBTM7eAwql/YSzMjae9xa5L5pzfyzzX
         zJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I7IoNOIkuvQzz9GPe/hKgZCbwARLnOV09vsehZFzo50=;
        b=nrKgNq4n6uXFikCUO0Nfvd+Tv8imPU7NrB6ctpOSSZ/HQSDJCR3ZmTp5L6Uf8FB0uW
         k/C+kfsDYkKl3RdFM5lwFk5MtmXWe9YezvpwyVZe3H/z7DCvP0s9Y1QI1X/puipPTaEP
         NNFSlcrUHSB4hBoxW9kxD7gdhbQEXNrapPnZmI4ocIJ5KD8ai3ZcJqqeU6Db62OZjo7U
         /ALSb/b1nNIyo9sVMqq5PE0KnScCrUTcdMF261w7RcqDCXzwDOj6yTG4j4RsgEkufO63
         QPfuDVbErkRknDIXWjoWr3rl5smp89gDpJGua6evnFH7BmOW5+yugTaOQyFhAbdudPw0
         as2w==
X-Gm-Message-State: AGi0PuZXtepZQCdsMYYg7f8GGOQfjtREpfW08AfCMQepXByxVRdqP2kA
	/UPAoNYx/T90zUkmVvYihD2puno5oPUunZaTIS8=
X-Google-Smtp-Source: APiQypI2ykHp2n16RDuIK/xlASdYsN5cYg7DHfxH/41v6q2i6QHW6te5Pkpqc+99kKM7OB+KB8eB3F1qNH/poeOG1zs=
X-Received: by 2002:ac5:c810:: with SMTP id y16mr1674253vkl.49.1588676958663;
 Tue, 05 May 2020 04:09:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200503162559.946-1-alex.kanavin@gmail.com> <20200503162559.946-8-alex.kanavin@gmail.com>
 <CAMKF1soShHWQoJp_XOzsU2Ud0ELTo4AMGMg58K5QmoLmu_PUdQ@mail.gmail.com>
In-Reply-To: <CAMKF1soShHWQoJp_XOzsU2Ud0ELTo4AMGMg58K5QmoLmu_PUdQ@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 5 May 2020 13:09:06 +0200
Message-ID: <CANNYZj8a8UUCN2Yu5N9aeUgrSYa1uK4cQq4G92yj5b_Af1-sJA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 08/17] avahi: merge avahi-ui into the main recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c8b86f05a4e4ade2"

--000000000000c8b86f05a4e4ade2
Content-Type: text/plain; charset="UTF-8"

This isn't going to work if you're building remmina against poky master, as
the avahi merge patch is not yet there :)

Alex

On Mon, 4 May 2020 at 23:01, Khem Raj <raj.khem@gmail.com> wrote:

> remmina from meta-oe depends on avahi-ui so anyway its fixable by
> changing the dependency but then it fails to find needed gtk3 support,
> please take a look
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/331
>
> On Sun, May 3, 2020 at 9:26 AM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> >
> > The split was building the same code twice, awkward to maintain,
> > and causing issues with upgrades.
> >
> > Disabling the gtk bits can be easily done through the standard
> > PACKAGECONFIG mechanism when needed.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/conf/distro/include/maintainers.inc      |  1 -
> >  .../avahi/avahi-ui_0.7.bb                     | 54 ----------
> >  meta/recipes-connectivity/avahi/avahi.inc     | 86 ----------------
> >  meta/recipes-connectivity/avahi/avahi_0.7.bb  | 98 ++++++++++++++++++-
> >  4 files changed, 95 insertions(+), 144 deletions(-)
> >  delete mode 100644 meta/recipes-connectivity/avahi/avahi-ui_0.7.bb
> >  delete mode 100644 meta/recipes-connectivity/avahi/avahi.inc
> >
> > diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> > index 340cda3300..54b3c5678c 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -57,7 +57,6 @@ RECIPE_MAINTAINER_pn-autoconf = "Robert Yang <
> liezhi.yang@windriver.com>"
> >  RECIPE_MAINTAINER_pn-autoconf-archive = "Robert Yang <
> liezhi.yang@windriver.com>"
> >  RECIPE_MAINTAINER_pn-automake = "Robert Yang <liezhi.yang@windriver.com
> >"
> >  RECIPE_MAINTAINER_pn-avahi = "Yi Zhao <yi.zhao@windriver.com>"
> > -RECIPE_MAINTAINER_pn-avahi-ui = "Yi Zhao <yi.zhao@windriver.com>"
> >  RECIPE_MAINTAINER_pn-babeltrace = "Alexander Kanavin <
> alex.kanavin@gmail.com>"
> >  RECIPE_MAINTAINER_pn-babeltrace2 = "Alexander Kanavin <
> alex.kanavin@gmail.com>"
> >  RECIPE_MAINTAINER_pn-base-files = "Anuj Mittal <anuj.mittal@intel.com>"
> > diff --git a/meta/recipes-connectivity/avahi/avahi-ui_0.7.bb
> b/meta/recipes-connectivity/avahi/avahi-ui_0.7.bb
> > deleted file mode 100644
> > index 1510a0ef4f..0000000000
> > --- a/meta/recipes-connectivity/avahi/avahi-ui_0.7.bb
> > +++ /dev/null
> > @@ -1,54 +0,0 @@
> > -require avahi.inc
> > -
> > -inherit features_check
> > -ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> > -
> > -DEPENDS += "avahi"
> > -
> > -AVAHI_GTK = "gtk3"
> > -
> > -S = "${WORKDIR}/avahi-${PV}"
> > -
> > -PACKAGES += "${PN}-utils avahi-discover"
> > -
> > -FILES_${PN} = "${libdir}/libavahi-ui*.so.*"
> > -FILES_${PN}-utils = "${bindir}/b* ${datadir}/applications/b*"
> > -FILES_avahi-discover = "${datadir}/applications/avahi-discover.desktop \
> > -                        ${datadir}/avahi/interfaces/avahi-discover.ui \
> > -                        ${bindir}/avahi-discover-standalone \
> > -                        "
> > -
> > -do_install_append () {
> > -       rm ${D}${sysconfdir} -rf
> > -       if
> ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','true','false',d)}; then
> > -               if [ "${nonarch_base_libdir}" != "${base_libdir}" ];then
> > -                   rm ${D}${nonarch_base_libdir} -rf
> > -               fi
> > -        else
> > -               rm ${D}${base_libdir} -rf
> > -        fi
> > -       rm ${D}${systemd_unitdir} -rf
> > -       # The ${systemd_unitdir} is /lib/systemd, so we need rmdir /lib,
> > -       # but not ${base_libdir} here. And the /lib may not exist
> > -       # whithout systemd.
> > -       [ ! -d ${D}/lib ] || rmdir ${D}/lib --ignore-fail-on-non-empty
> > -       rm ${D}${bindir}/avahi-b*
> > -       rm ${D}${bindir}/avahi-p*
> > -       rm ${D}${bindir}/avahi-r*
> > -       rm ${D}${bindir}/avahi-s*
> > -       rm ${D}${includedir}/avahi-c* -rf
> > -       rm ${D}${includedir}/avahi-g* -rf
> > -       rm ${D}${libdir}/libavahi-c*
> > -       rm ${D}${libdir}/libavahi-g*
> > -       rm ${D}${libdir}/pkgconfig/avahi-c*
> > -       rm ${D}${libdir}/pkgconfig/avahi-g*
> > -       rm ${D}${sbindir} -rf
> > -       rm ${D}${datadir}/avahi/a*
> > -       rm ${D}${datadir}/locale/ -rf
> > -       rm ${D}${datadir}/dbus* -rf
> > -       rm ${D}${mandir}/man1/a*
> > -       rm ${D}${mandir}/man5 -rf
> > -       rm ${D}${mandir}/man8 -rf
> > -        rm ${D}${libdir}/girepository-1.0/ -rf
> > -        rm ${D}${datadir}/gir-1.0/ -rf
> > -}
> > diff --git a/meta/recipes-connectivity/avahi/avahi.inc
> b/meta/recipes-connectivity/avahi/avahi.inc
> > deleted file mode 100644
> > index 94fe6a16b6..0000000000
> > --- a/meta/recipes-connectivity/avahi/avahi.inc
> > +++ /dev/null
> > @@ -1,86 +0,0 @@
> > -SUMMARY = "Avahi IPv4LL network address configuration daemon"
> > -DESCRIPTION = 'Avahi is a fully LGPL framework for Multicast DNS
> Service Discovery. It \
> > -allows programs to publish and discover services and hosts running on a
> local network \
> > -with no specific configuration. This tool implements IPv4LL, "Dynamic
> Configuration of \
> > -IPv4 Link-Local Addresses" (IETF RFC3927), a protocol for automatic IP
> address \
> > -configuration from the link-local 169.254.0.0/16 range without the
> need for a central \
> > -server.'
> > -AUTHOR = "Lennart Poettering <lennart@poettering.net>"
> > -HOMEPAGE = "http://avahi.org"
> > -BUGTRACKER = "https://github.com/lathiat/avahi/issues"
> > -SECTION = "network"
> > -
> > -# major part is under LGPLv2.1+, but several .dtd, .xsl, initscripts and
> > -# python scripts are under GPLv2+
> > -LICENSE = "GPLv2+ & LGPLv2.1+"
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1
> \
> > -
> file://avahi-common/address.h;endline=25;md5=b1d1d2cda1c07eb848ea7d6215712d9d
> \
> > -
> file://avahi-core/dns.h;endline=23;md5=6fe82590b81aa0ddea5095b548e2fdcb \
> > -
> file://avahi-daemon/main.c;endline=21;md5=9ee77368c5407af77caaef1b07285969 \
> > -
> file://avahi-client/client.h;endline=23;md5=f4ac741a25c4f434039ba3e18c8674cf"
> > -
> > -SRC_URI = "
> https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}.tar.gz
> \
> > -           file://fix-CVE-2017-6519.patch \
> > -           "
> > -
> > -UPSTREAM_CHECK_URI = "https://github.com/lathiat/avahi/releases/"
> > -SRC_URI[md5sum] = "d76c59d0882ac6c256d70a2a585362a6"
> > -SRC_URI[sha256sum] =
> "57a99b5dfe7fdae794e3d1ee7a62973a368e91e414bd0dfa5d84434de5b14804"
> > -
> > -DEPENDS = "expat libcap libdaemon glib-2.0 intltool-native"
> > -
> > -# For gtk related PACKAGECONFIGs: gtk, gtk3
> > -AVAHI_GTK ?= ""
> > -
> > -PACKAGECONFIG ??= "dbus ${AVAHI_GTK}"
> > -PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
> > -PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+"
> > -PACKAGECONFIG[gtk3] = "--enable-gtk3,--disable-gtk3,gtk+3"
> > -PACKAGECONFIG[libdns_sd] = "--enable-compat-libdns_sd
> --enable-dbus,,dbus"
> > -
> > -inherit autotools pkgconfig gettext gobject-introspection
> > -
> > -EXTRA_OECONF = "--with-avahi-priv-access-group=adm \
> > -             --disable-stack-protector \
> > -             --disable-gdbm \
> > -             --disable-mono \
> > -             --disable-monodoc \
> > -             --disable-qt3 \
> > -             --disable-qt4 \
> > -             --disable-python \
> > -             --disable-doxygen-doc \
> > -             --enable-manpages \
> > -             ${EXTRA_OECONF_SYSVINIT} \
> > -             ${EXTRA_OECONF_SYSTEMD} \
> > -           "
> > -
> > -# The distro choice determines what init scripts are installed
> > -EXTRA_OECONF_SYSVINIT =
> "${@bb.utils.contains('DISTRO_FEATURES','sysvinit','--with-distro=debian','--with-distro=none',d)}"
> > -EXTRA_OECONF_SYSTEMD =
> "${@bb.utils.contains('DISTRO_FEATURES','systemd','--with-systemdsystemunitdir=${systemd_unitdir}/system/','--without-systemdsystemunitdir',d)}"
> > -
> > -do_configure_prepend() {
> > -    sed 's:AM_CHECK_PYMOD:echo "no pymod" #AM_CHECK_PYMOD:g' -i ${S}/
> configure.ac
> > -
> > -    # This m4 file will get in the way of our introspection.m4 with
> special cross-compilation fixes
> > -    rm "${S}/common/introspection.m4" || true
> > -}
> > -
> > -do_compile_prepend() {
> > -    export
> GIR_EXTRA_LIBS_PATH="${B}/avahi-gobject/.libs:${B}/avahi-common/.libs:${B}/avahi-client/.libs:${B}/avahi-glib/.libs"
> > -}
> > -
> > -RRECOMMENDS_${PN}_append_libc-glibc = " libnss-mdns"
> > -
> > -do_install() {
> > -       autotools_do_install
> > -       rm -rf ${D}/run
> > -       rm -rf ${D}${datadir}/dbus-1/interfaces
> > -       test -d ${D}${datadir}/dbus-1 && rmdir
> --ignore-fail-on-non-empty ${D}${datadir}/dbus-1
> > -       rm -rf ${D}${libdir}/avahi
> > -}
> > -
> > -PACKAGES =+ "${@bb.utils.contains("PACKAGECONFIG", "libdns_sd",
> "libavahi-compat-libdnssd", "", d)}"
> > -
> > -FILES_libavahi-compat-libdnssd = "${libdir}/libdns_sd.so.*"
> > -
> > -RPROVIDES_libavahi-compat-libdnssd = "libdns-sd"
> > diff --git a/meta/recipes-connectivity/avahi/avahi_0.7.bb
> b/meta/recipes-connectivity/avahi/avahi_0.7.bb
> > index 24523c7f81..b25cffa3cd 100644
> > --- a/meta/recipes-connectivity/avahi/avahi_0.7.bb
> > +++ b/meta/recipes-connectivity/avahi/avahi_0.7.bb
> > @@ -1,4 +1,89 @@
> > -require avahi.inc
> > +SUMMARY = "Avahi IPv4LL network address configuration daemon"
> > +DESCRIPTION = 'Avahi is a fully LGPL framework for Multicast DNS
> Service Discovery. It \
> > +allows programs to publish and discover services and hosts running on a
> local network \
> > +with no specific configuration. This tool implements IPv4LL, "Dynamic
> Configuration of \
> > +IPv4 Link-Local Addresses" (IETF RFC3927), a protocol for automatic IP
> address \
> > +configuration from the link-local 169.254.0.0/16 range without the
> need for a central \
> > +server.'
> > +AUTHOR = "Lennart Poettering <lennart@poettering.net>"
> > +HOMEPAGE = "http://avahi.org"
> > +BUGTRACKER = "https://github.com/lathiat/avahi/issues"
> > +SECTION = "network"
> > +
> > +# major part is under LGPLv2.1+, but several .dtd, .xsl, initscripts and
> > +# python scripts are under GPLv2+
> > +LICENSE = "GPLv2+ & LGPLv2.1+"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1
> \
> > +
> file://avahi-common/address.h;endline=25;md5=b1d1d2cda1c07eb848ea7d6215712d9d
> \
> > +
> file://avahi-core/dns.h;endline=23;md5=6fe82590b81aa0ddea5095b548e2fdcb \
> > +
> file://avahi-daemon/main.c;endline=21;md5=9ee77368c5407af77caaef1b07285969 \
> > +
> file://avahi-client/client.h;endline=23;md5=f4ac741a25c4f434039ba3e18c8674cf"
> > +
> > +SRC_URI = "
> https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}.tar.gz
> \
> > +           file://fix-CVE-2017-6519.patch \
> > +           "
> > +
> > +UPSTREAM_CHECK_URI = "https://github.com/lathiat/avahi/releases/"
> > +SRC_URI[md5sum] = "d76c59d0882ac6c256d70a2a585362a6"
> > +SRC_URI[sha256sum] =
> "57a99b5dfe7fdae794e3d1ee7a62973a368e91e414bd0dfa5d84434de5b14804"
> > +
> > +DEPENDS = "expat libcap libdaemon glib-2.0 intltool-native"
> > +
> > +# For gtk related PACKAGECONFIGs: gtk, gtk3
> > +AVAHI_GTK ?= "gtk3"
> > +
> > +PACKAGECONFIG ??= "dbus ${AVAHI_GTK}"
> > +PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
> > +PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+"
> > +PACKAGECONFIG[gtk3] = "--enable-gtk3,--disable-gtk3,gtk+3"
> > +PACKAGECONFIG[libdns_sd] = "--enable-compat-libdns_sd
> --enable-dbus,,dbus"
> > +
> > +inherit autotools pkgconfig gettext gobject-introspection
> > +
> > +EXTRA_OECONF = "--with-avahi-priv-access-group=adm \
> > +             --disable-stack-protector \
> > +             --disable-gdbm \
> > +             --disable-mono \
> > +             --disable-monodoc \
> > +             --disable-qt3 \
> > +             --disable-qt4 \
> > +             --disable-python \
> > +             --disable-doxygen-doc \
> > +             --enable-manpages \
> > +             ${EXTRA_OECONF_SYSVINIT} \
> > +             ${EXTRA_OECONF_SYSTEMD} \
> > +           "
> > +
> > +# The distro choice determines what init scripts are installed
> > +EXTRA_OECONF_SYSVINIT =
> "${@bb.utils.contains('DISTRO_FEATURES','sysvinit','--with-distro=debian','--with-distro=none',d)}"
> > +EXTRA_OECONF_SYSTEMD =
> "${@bb.utils.contains('DISTRO_FEATURES','systemd','--with-systemdsystemunitdir=${systemd_unitdir}/system/','--without-systemdsystemunitdir',d)}"
> > +
> > +do_configure_prepend() {
> > +    sed 's:AM_CHECK_PYMOD:echo "no pymod" #AM_CHECK_PYMOD:g' -i ${S}/
> configure.ac
> > +
> > +    # This m4 file will get in the way of our introspection.m4 with
> special cross-compilation fixes
> > +    rm "${S}/common/introspection.m4" || true
> > +}
> > +
> > +do_compile_prepend() {
> > +    export
> GIR_EXTRA_LIBS_PATH="${B}/avahi-gobject/.libs:${B}/avahi-common/.libs:${B}/avahi-client/.libs:${B}/avahi-glib/.libs"
> > +}
> > +
> > +RRECOMMENDS_${PN}_append_libc-glibc = " libnss-mdns"
> > +
> > +do_install() {
> > +       autotools_do_install
> > +       rm -rf ${D}/run
> > +       rm -rf ${D}${datadir}/dbus-1/interfaces
> > +       test -d ${D}${datadir}/dbus-1 && rmdir
> --ignore-fail-on-non-empty ${D}${datadir}/dbus-1
> > +       rm -rf ${D}${libdir}/avahi
> > +}
> > +
> > +PACKAGES =+ "${@bb.utils.contains("PACKAGECONFIG", "libdns_sd",
> "libavahi-compat-libdnssd", "", d)}"
> > +
> > +FILES_libavahi-compat-libdnssd = "${libdir}/libdns_sd.so.*"
> > +
> > +RPROVIDES_libavahi-compat-libdnssd = "libdns-sd"
> >
> >  SRC_URI += "file://00avahi-autoipd \
> >             file://99avahi-autoipd \
> > @@ -8,7 +93,13 @@ SRC_URI += "file://00avahi-autoipd \
> >
> >  inherit update-rc.d systemd useradd
> >
> > -PACKAGES =+ "libavahi-gobject avahi-daemon libavahi-common
> libavahi-core libavahi-client avahi-dnsconfd libavahi-glib avahi-autoipd
> avahi-utils"
> > +PACKAGES =+ "libavahi-gobject avahi-daemon libavahi-common
> libavahi-core libavahi-client avahi-dnsconfd libavahi-glib avahi-autoipd
> avahi-utils avahi-discover avahi-ui"
> > +
> > +FILES_avahi-ui = "${libdir}/libavahi-ui*.so.*"
> > +FILES_avahi-discover = "${datadir}/applications/avahi-discover.desktop \
> > +                        ${datadir}/avahi/interfaces/avahi-discover.ui \
> > +                        ${bindir}/avahi-discover-standalone \
> > +                        "
> >
> >  LICENSE_libavahi-gobject = "LGPLv2.1+"
> >  LICENSE_avahi-daemon = "LGPLv2.1+"
> > @@ -46,7 +137,7 @@ FILES_avahi-dnsconfd = "${sbindir}/avahi-dnsconfd \
> >                          ${sysconfdir}/init.d/avahi-dnsconfd"
> >  FILES_libavahi-glib = "${libdir}/libavahi-glib.so.*"
> >  FILES_libavahi-gobject = "${libdir}/libavahi-gobject.so.*
> ${libdir}/girepository-1.0/Avahi*.typelib"
> > -FILES_avahi-utils = "${bindir}/avahi-*"
> > +FILES_avahi-utils = "${bindir}/avahi-* ${bindir}/b*
> ${datadir}/applications/b*"
> >
> >  RDEPENDS_${PN}-dev = "avahi-daemon (= ${EXTENDPKGV}) libavahi-core (=
> ${EXTENDPKGV})"
> >  RDEPENDS_${PN}-dev += "${@["", " libavahi-client (=
> ${EXTENDPKGV})"][bb.utils.contains('PACKAGECONFIG', 'dbus', 1, 0, d)]}"
> > @@ -89,3 +180,4 @@ if [ -z "$D" ]; then
> >         killall -q -HUP dbus-daemon || true
> >  fi
> >  }
> > +
> > --
> > 2.26.1
> >
> > 
>

--000000000000c8b86f05a4e4ade2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This isn&#39;t going to work if you&#39;re building r=
emmina against poky master, as the avahi merge patch is not yet there :)</d=
iv><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Mon, 4 May 2020 at 23:01, Khem Raj =
&lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">remmina from me=
ta-oe depends on avahi-ui so anyway its fixable by<br>
changing the dependency but then it fails to find needed gtk3 support,<br>
please take a look<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/88/buil=
ds/331" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/88/builds/331</a><br>
<br>
On Sun, May 3, 2020 at 9:26 AM Alexander Kanavin &lt;<a href=3D"mailto:ale=
x.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote=
:<br>
&gt;<br>
&gt; The split was building the same code twice, awkward to maintain,<br>
&gt; and causing issues with upgrades.<br>
&gt;<br>
&gt; Disabling the gtk bits can be easily done through the standard<br>
&gt; PACKAGECONFIG mechanism when needed.<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 -<br>
&gt;=C2=A0 .../avahi/<a href=3D"http://avahi-ui_0.7.bb" rel=3D"noreferrer"=
 target=3D"_blank">avahi-ui_0.7.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 54 ----------<br>
&gt;=C2=A0 meta/recipes-connectivity/avahi/avahi.inc=C2=A0 =C2=A0 =C2=A0| =
86 ----------------<br>
&gt;=C2=A0 meta/recipes-connectivity/avahi/<a href=3D"http://avahi_0.7.bb"=
 rel=3D"noreferrer" target=3D"_blank">avahi_0.7.bb</a>=C2=A0 | 98 +++++++++=
+++++++++-<br>
&gt;=C2=A0 4 files changed, 95 insertions(+), 144 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-connectivity/avahi/<a href=3D"h=
ttp://avahi-ui_0.7.bb" rel=3D"noreferrer" target=3D"_blank">avahi-ui_0.7.bb=
</a><br>
&gt;=C2=A0 delete mode 100644 meta/recipes-connectivity/avahi/avahi.inc<br=
>
&gt;<br>
&gt; diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/dis=
tro/include/maintainers.inc<br>
&gt; index 340cda3300..54b3c5678c 100644<br>
&gt; --- a/meta/conf/distro/include/maintainers.inc<br>
&gt; +++ b/meta/conf/distro/include/maintainers.inc<br>
&gt; @@ -57,7 +57,6 @@ RECIPE_MAINTAINER_pn-autoconf =3D &quot;Robert Yang=
 &lt;<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.=
yang@windriver.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-autoconf-archive =3D &quot;Robert Yang &lt=
;<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang=
@windriver.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-automake =3D &quot;Robert Yang &lt;<a href=
=
=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windri=
ver.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-avahi =3D &quot;Yi Zhao &lt;<a href=3D"mai=
lto:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;&=
quot;<br>
&gt; -RECIPE_MAINTAINER_pn-avahi-ui =3D &quot;Yi Zhao &lt;<a href=3D"mailt=
o:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;&qu=
ot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-babeltrace =3D &quot;Alexander Kanavin &lt=
;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@g=
mail.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-babeltrace2 =3D &quot;Alexander Kanavin &l=
t;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@=
gmail.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-base-files =3D &quot;Anuj Mittal &lt;<a hr=
ef=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com=
</a>&gt;&quot;<br>
&gt; diff --git a/meta/recipes-connectivity/avahi/<a href=3D"http://avahi-=
ui_0.7.bb" rel=3D"noreferrer" target=3D"_blank">avahi-ui_0.7.bb</a> b/meta/=
recipes-connectivity/avahi/<a href=3D"http://avahi-ui_0.7.bb" rel=3D"norefe=
rrer" target=3D"_blank">avahi-ui_0.7.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index 1510a0ef4f..0000000000<br>
&gt; --- a/meta/recipes-connectivity/avahi/<a href=3D"http://avahi-ui_0.7.=
bb" rel=3D"noreferrer" target=3D"_blank">avahi-ui_0.7.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,54 +0,0 @@<br>
&gt; -require avahi.inc<br>
&gt; -<br>
&gt; -inherit features_check<br>
&gt; -ANY_OF_DISTRO_FEATURES =3D &quot;${GTK3DISTROFEATURES}&quot;<br>
&gt; -<br>
&gt; -DEPENDS +=3D &quot;avahi&quot;<br>
&gt; -<br>
&gt; -AVAHI_GTK =3D &quot;gtk3&quot;<br>
&gt; -<br>
&gt; -S =3D &quot;${WORKDIR}/avahi-${PV}&quot;<br>
&gt; -<br>
&gt; -PACKAGES +=3D &quot;${PN}-utils avahi-discover&quot;<br>
&gt; -<br>
&gt; -FILES_${PN} =3D &quot;${libdir}/libavahi-ui*.so.*&quot;<br>
&gt; -FILES_${PN}-utils =3D &quot;${bindir}/b* ${datadir}/applications/b*&=
quot;<br>
&gt; -FILES_avahi-discover =3D &quot;${datadir}/applications/avahi-discove=
r.desktop \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ${datadir}/avahi/interfaces/avahi-discover.ui \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ${bindir}/avahi-discover-standalone \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; -<br>
&gt; -do_install_append () {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0rm ${D}${sysconfdir} -rf<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;DISTRO_FEATU=
RES&#39;,&#39;usrmerge&#39;,&#39;true&#39;,&#39;false&#39;,d)}; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${=
nonarch_base_libdir}&quot; !=3D &quot;${base_libdir}&quot; ];then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0rm ${D}${nonarch_base_libdir} -rf<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm ${D}${base=
_libdir} -rf<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0rm ${D}${systemd_unitdir} -rf<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# The ${systemd_unitdir} is /lib/systemd,=
 so we need rmdir /lib,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# but not ${base_libdir} here. And the /l=
ib may not exist<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# whithout systemd.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0[ ! -d ${D}/lib ] || rmdir ${D}/lib --ign=
ore-fail-on-non-empty<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0rm ${D}${bindir}/avahi-b*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0rm ${D}${bindir}/avahi-p*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0rm ${D}${bindir}/avahi-r*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0rm ${D}${bindir}/avahi-s*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0rm ${D}${includedir}/avahi-c* -rf<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0rm ${D}${includedir}/avahi-g* -rf<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0rm ${D}${libdir}/libavahi-c*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0rm ${D}${libdir}/libavahi-g*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0rm ${D}${libdir}/pkgconfig/avahi-c*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0rm ${D}${libdir}/pkgconfig/avahi-g*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0rm ${D}${sbindir} -rf<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0rm ${D}${datadir}/avahi/a*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0rm ${D}${datadir}/locale/ -rf<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0rm ${D}${datadir}/dbus* -rf<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0rm ${D}${mandir}/man1/a*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0rm ${D}${mandir}/man5 -rf<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0rm ${D}${mandir}/man8 -rf<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm ${D}${libdir}/girepository-1.0/ -rf<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm ${D}${datadir}/gir-1.0/ -rf<br>
&gt; -}<br>
&gt; diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes=
-connectivity/avahi/avahi.inc<br>
&gt; deleted file mode 100644<br>
&gt; index 94fe6a16b6..0000000000<br>
&gt; --- a/meta/recipes-connectivity/avahi/avahi.inc<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,86 +0,0 @@<br>
&gt; -SUMMARY =3D &quot;Avahi IPv4LL network address configuration daemon&=
quot;<br>
&gt; -DESCRIPTION =3D &#39;Avahi is a fully LGPL framework for Multicast D=
NS Service Discovery. It \<br>
&gt; -allows programs to publish and discover services and hosts running o=
n a local network \<br>
&gt; -with no specific configuration. This tool implements IPv4LL, &quot;D=
ynamic Configuration of \<br>
&gt; -IPv4 Link-Local Addresses&quot; (IETF RFC3927), a protocol for autom=
atic IP address \<br>
&gt; -configuration from the link-local <a href=3D"http://169.254.0.0/16" =
rel=3D"noreferrer" target=3D"_blank">169.254.0.0/16</a> range without the n=
eed for a central \<br>
&gt; -server.&#39;<br>
&gt; -AUTHOR =3D &quot;Lennart Poettering &lt;<a href=3D"mailto:lennart@po=
ettering.net" target=3D"_blank">lennart@poettering.net</a>&gt;&quot;<br>
&gt; -HOMEPAGE =3D &quot;<a href=3D"http://avahi.org" rel=3D"noreferrer" t=
arget=3D"_blank">http://avahi.org</a>&quot;<br>
&gt; -BUGTRACKER =3D &quot;<a href=3D"https://github.com/lathiat/avahi/iss=
ues" rel=3D"noreferrer" target=3D"_blank">https://github.com/lathiat/avahi/=
issues</a>&quot;<br>
&gt; -SECTION =3D &quot;network&quot;<br>
&gt; -<br>
&gt; -# major part is under LGPLv2.1+, but several .dtd, .xsl, initscripts=
 and<br>
&gt; -# python scripts are under GPLv2+<br>
&gt; -LICENSE =3D &quot;GPLv2+ &amp; LGPLv2.1+&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D2d5025d4aa3495befef8=
f17206a5b0a1 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 file://avahi-common/address.h;endline=3D25;md5=3Db1d1d2cda1c07eb848ea7=
d6215712d9d \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 file://avahi-core/dns.h;endline=3D23;md5=3D6fe82590b81aa0ddea5095b548e=
2fdcb \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 file://avahi-daemon/main.c;endline=3D21;md5=3D9ee77368c5407af77caaef1b=
07285969 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 file://avahi-client/client.h;endline=3D23;md5=3Df4ac741a25c4f434039ba3=
e18c8674cf&quot;<br>
&gt; -<br>
&gt; -SRC_URI =3D &quot;<a href=3D"https://github.com/lathiat/avahi/releas=
es/download/v$%7BPV%7D/avahi-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${=
PV}.tar.gz</a> \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-CVE-2017-6519.pa=
tch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; -<br>
&gt; -UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/lathiat/a=
vahi/releases/" rel=3D"noreferrer" target=3D"_blank">https://github.com/lat=
hiat/avahi/releases/</a>&quot;<br>
&gt; -SRC_URI[md5sum] =3D &quot;d76c59d0882ac6c256d70a2a585362a6&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;57a99b5dfe7fdae794e3d1ee7a62973a368e91e=
414bd0dfa5d84434de5b14804&quot;<br>
&gt; -<br>
&gt; -DEPENDS =3D &quot;expat libcap libdaemon glib-2.0 intltool-native&qu=
ot;<br>
&gt; -<br>
&gt; -# For gtk related PACKAGECONFIGs: gtk, gtk3<br>
&gt; -AVAHI_GTK ?=3D &quot;&quot;<br>
&gt; -<br>
&gt; -PACKAGECONFIG ??=3D &quot;dbus ${AVAHI_GTK}&quot;<br>
&gt; -PACKAGECONFIG[dbus] =3D &quot;--enable-dbus,--disable-dbus,dbus&quot=
;<br>
&gt; -PACKAGECONFIG[gtk] =3D &quot;--enable-gtk,--disable-gtk,gtk+&quot;<b=
r>
&gt; -PACKAGECONFIG[gtk3] =3D &quot;--enable-gtk3,--disable-gtk3,gtk+3&quo=
t;<br>
&gt; -PACKAGECONFIG[libdns_sd] =3D &quot;--enable-compat-libdns_sd --enabl=
e-dbus,,dbus&quot;<br>
&gt; -<br>
&gt; -inherit autotools pkgconfig gettext gobject-introspection<br>
&gt; -<br>
&gt; -EXTRA_OECONF =3D &quot;--with-avahi-priv-access-group=3Dadm \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-stack-prot=
ector \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-gdbm \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-mono \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-monodoc \<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-qt3 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-qt4 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-python \<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-doxygen-do=
c \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-manpages \<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${EXTRA_OECONF_SYSVI=
NIT} \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${EXTRA_OECONF_SYSTE=
MD} \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; -<br>
&gt; -# The distro choice determines what init scripts are installed<br>
&gt; -EXTRA_OECONF_SYSVINIT =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEA=
TURES&#39;,&#39;sysvinit&#39;,&#39;--with-distro=3Ddebian&#39;,&#39;--with-=
distro=3Dnone&#39;,d)}&quot;<br>
&gt; -EXTRA_OECONF_SYSTEMD =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEAT=
URES&#39;,&#39;systemd&#39;,&#39;--with-systemdsystemunitdir=3D${systemd_un=
itdir}/system/&#39;,&#39;--without-systemdsystemunitdir&#39;,d)}&quot;<br>
&gt; -<br>
&gt; -do_configure_prepend() {<br>
&gt; -=C2=A0 =C2=A0 sed &#39;s:AM_CHECK_PYMOD:echo &quot;no pymod&quot; #A=
M_CHECK_PYMOD:g&#39; -i ${S}/<a href=3D"http://configure.ac" rel=3D"norefer=
rer" target=3D"_blank">configure.ac</a><br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 # This m4 file will get in the way of our introspectio=
n.m4 with special cross-compilation fixes<br>
&gt; -=C2=A0 =C2=A0 rm &quot;${S}/common/introspection.m4&quot; || true<br=
>
&gt; -}<br>
&gt; -<br>
&gt; -do_compile_prepend() {<br>
&gt; -=C2=A0 =C2=A0 export GIR_EXTRA_LIBS_PATH=3D&quot;${B}/avahi-gobject/=
.libs:${B}/avahi-common/.libs:${B}/avahi-client/.libs:${B}/avahi-glib/.libs=
&quot;<br>
&gt; -}<br>
&gt; -<br>
&gt; -RRECOMMENDS_${PN}_append_libc-glibc =3D &quot; libnss-mdns&quot;<br>
&gt; -<br>
&gt; -do_install() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0autotools_do_install<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}/run<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${datadir}/dbus-1/interfaces<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0test -d ${D}${datadir}/dbus-1 &amp;&amp; =
rmdir --ignore-fail-on-non-empty ${D}${datadir}/dbus-1<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${libdir}/avahi<br>
&gt; -}<br>
&gt; -<br>
&gt; -PACKAGES =3D+ &quot;${@bb.utils.contains(&quot;PACKAGECONFIG&quot;, =
&quot;libdns_sd&quot;, &quot;libavahi-compat-libdnssd&quot;, &quot;&quot;, =
d)}&quot;<br>
&gt; -<br>
&gt; -FILES_libavahi-compat-libdnssd =3D &quot;${libdir}/libdns_sd.so.*&qu=
ot;<br>
&gt; -<br>
&gt; -RPROVIDES_libavahi-compat-libdnssd =3D &quot;libdns-sd&quot;<br>
&gt; diff --git a/meta/recipes-connectivity/avahi/<a href=3D"http://avahi_=
0.7.bb" rel=3D"noreferrer" target=3D"_blank">avahi_0.7.bb</a> b/meta/recipe=
s-connectivity/avahi/<a href=3D"http://avahi_0.7.bb" rel=3D"noreferrer" tar=
get=3D"_blank">avahi_0.7.bb</a><br>
&gt; index 24523c7f81..b25cffa3cd 100644<br>
&gt; --- a/meta/recipes-connectivity/avahi/<a href=3D"http://avahi_0.7.bb"=
 rel=3D"noreferrer" target=3D"_blank">avahi_0.7.bb</a><br>
&gt; +++ b/meta/recipes-connectivity/avahi/<a href=3D"http://avahi_0.7.bb"=
 rel=3D"noreferrer" target=3D"_blank">avahi_0.7.bb</a><br>
&gt; @@ -1,4 +1,89 @@<br>
&gt; -require avahi.inc<br>
&gt; +SUMMARY =3D &quot;Avahi IPv4LL network address configuration daemon&=
quot;<br>
&gt; +DESCRIPTION =3D &#39;Avahi is a fully LGPL framework for Multicast D=
NS Service Discovery. It \<br>
&gt; +allows programs to publish and discover services and hosts running o=
n a local network \<br>
&gt; +with no specific configuration. This tool implements IPv4LL, &quot;D=
ynamic Configuration of \<br>
&gt; +IPv4 Link-Local Addresses&quot; (IETF RFC3927), a protocol for autom=
atic IP address \<br>
&gt; +configuration from the link-local <a href=3D"http://169.254.0.0/16" =
rel=3D"noreferrer" target=3D"_blank">169.254.0.0/16</a> range without the n=
eed for a central \<br>
&gt; +server.&#39;<br>
&gt; +AUTHOR =3D &quot;Lennart Poettering &lt;<a href=3D"mailto:lennart@po=
ettering.net" target=3D"_blank">lennart@poettering.net</a>&gt;&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"http://avahi.org" rel=3D"noreferrer" t=
arget=3D"_blank">http://avahi.org</a>&quot;<br>
&gt; +BUGTRACKER =3D &quot;<a href=3D"https://github.com/lathiat/avahi/iss=
ues" rel=3D"noreferrer" target=3D"_blank">https://github.com/lathiat/avahi/=
issues</a>&quot;<br>
&gt; +SECTION =3D &quot;network&quot;<br>
&gt; +<br>
&gt; +# major part is under LGPLv2.1+, but several .dtd, .xsl, initscripts=
 and<br>
&gt; +# python scripts are under GPLv2+<br>
&gt; +LICENSE =3D &quot;GPLv2+ &amp; LGPLv2.1+&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D2d5025d4aa3495befef8=
f17206a5b0a1 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 file://avahi-common/address.h;endline=3D25;md5=3Db1d1d2cda1c07eb848ea7=
d6215712d9d \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 file://avahi-core/dns.h;endline=3D23;md5=3D6fe82590b81aa0ddea5095b548e=
2fdcb \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 file://avahi-daemon/main.c;endline=3D21;md5=3D9ee77368c5407af77caaef1b=
07285969 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 file://avahi-client/client.h;endline=3D23;md5=3Df4ac741a25c4f434039ba3=
e18c8674cf&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;<a href=3D"https://github.com/lathiat/avahi/releas=
es/download/v$%7BPV%7D/avahi-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${=
PV}.tar.gz</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-CVE-2017-6519.pa=
tch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; +<br>
&gt; +UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/lathiat/a=
vahi/releases/" rel=3D"noreferrer" target=3D"_blank">https://github.com/lat=
hiat/avahi/releases/</a>&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;d76c59d0882ac6c256d70a2a585362a6&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;57a99b5dfe7fdae794e3d1ee7a62973a368e91e=
414bd0dfa5d84434de5b14804&quot;<br>
&gt; +<br>
&gt; +DEPENDS =3D &quot;expat libcap libdaemon glib-2.0 intltool-native&qu=
ot;<br>
&gt; +<br>
&gt; +# For gtk related PACKAGECONFIGs: gtk, gtk3<br>
&gt; +AVAHI_GTK ?=3D &quot;gtk3&quot;<br>
&gt; +<br>
&gt; +PACKAGECONFIG ??=3D &quot;dbus ${AVAHI_GTK}&quot;<br>
&gt; +PACKAGECONFIG[dbus] =3D &quot;--enable-dbus,--disable-dbus,dbus&quot=
;<br>
&gt; +PACKAGECONFIG[gtk] =3D &quot;--enable-gtk,--disable-gtk,gtk+&quot;<b=
r>
&gt; +PACKAGECONFIG[gtk3] =3D &quot;--enable-gtk3,--disable-gtk3,gtk+3&quo=
t;<br>
&gt; +PACKAGECONFIG[libdns_sd] =3D &quot;--enable-compat-libdns_sd --enabl=
e-dbus,,dbus&quot;<br>
&gt; +<br>
&gt; +inherit autotools pkgconfig gettext gobject-introspection<br>
&gt; +<br>
&gt; +EXTRA_OECONF =3D &quot;--with-avahi-priv-access-group=3Dadm \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-stack-prot=
ector \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-gdbm \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-mono \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-monodoc \<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-qt3 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-qt4 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-python \<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-doxygen-do=
c \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-manpages \<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${EXTRA_OECONF_SYSVI=
NIT} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${EXTRA_OECONF_SYSTE=
MD} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; +<br>
&gt; +# The distro choice determines what init scripts are installed<br>
&gt; +EXTRA_OECONF_SYSVINIT =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEA=
TURES&#39;,&#39;sysvinit&#39;,&#39;--with-distro=3Ddebian&#39;,&#39;--with-=
distro=3Dnone&#39;,d)}&quot;<br>
&gt; +EXTRA_OECONF_SYSTEMD =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEAT=
URES&#39;,&#39;systemd&#39;,&#39;--with-systemdsystemunitdir=3D${systemd_un=
itdir}/system/&#39;,&#39;--without-systemdsystemunitdir&#39;,d)}&quot;<br>
&gt; +<br>
&gt; +do_configure_prepend() {<br>
&gt; +=C2=A0 =C2=A0 sed &#39;s:AM_CHECK_PYMOD:echo &quot;no pymod&quot; #A=
M_CHECK_PYMOD:g&#39; -i ${S}/<a href=3D"http://configure.ac" rel=3D"norefer=
rer" target=3D"_blank">configure.ac</a><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # This m4 file will get in the way of our introspectio=
n.m4 with special cross-compilation fixes<br>
&gt; +=C2=A0 =C2=A0 rm &quot;${S}/common/introspection.m4&quot; || true<br=
>
&gt; +}<br>
&gt; +<br>
&gt; +do_compile_prepend() {<br>
&gt; +=C2=A0 =C2=A0 export GIR_EXTRA_LIBS_PATH=3D&quot;${B}/avahi-gobject/=
.libs:${B}/avahi-common/.libs:${B}/avahi-client/.libs:${B}/avahi-glib/.libs=
&quot;<br>
&gt; +}<br>
&gt; +<br>
&gt; +RRECOMMENDS_${PN}_append_libc-glibc =3D &quot; libnss-mdns&quot;<br>
&gt; +<br>
&gt; +do_install() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0autotools_do_install<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}/run<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${datadir}/dbus-1/interfaces<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0test -d ${D}${datadir}/dbus-1 &amp;&amp; =
rmdir --ignore-fail-on-non-empty ${D}${datadir}/dbus-1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${libdir}/avahi<br>
&gt; +}<br>
&gt; +<br>
&gt; +PACKAGES =3D+ &quot;${@bb.utils.contains(&quot;PACKAGECONFIG&quot;, =
&quot;libdns_sd&quot;, &quot;libavahi-compat-libdnssd&quot;, &quot;&quot;, =
d)}&quot;<br>
&gt; +<br>
&gt; +FILES_libavahi-compat-libdnssd =3D &quot;${libdir}/libdns_sd.so.*&qu=
ot;<br>
&gt; +<br>
&gt; +RPROVIDES_libavahi-compat-libdnssd =3D &quot;libdns-sd&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI +=3D &quot;file://00avahi-autoipd \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://99avahi-autoipd=
 \<br>
&gt; @@ -8,7 +93,13 @@ SRC_URI +=3D &quot;file://00avahi-autoipd \<br>
&gt;<br>
&gt;=C2=A0 inherit update-rc.d systemd useradd<br>
&gt;<br>
&gt; -PACKAGES =3D+ &quot;libavahi-gobject avahi-daemon libavahi-common li=
bavahi-core libavahi-client avahi-dnsconfd libavahi-glib avahi-autoipd avah=
i-utils&quot;<br>
&gt; +PACKAGES =3D+ &quot;libavahi-gobject avahi-daemon libavahi-common li=
bavahi-core libavahi-client avahi-dnsconfd libavahi-glib avahi-autoipd avah=
i-utils avahi-discover avahi-ui&quot;<br>
&gt; +<br>
&gt; +FILES_avahi-ui =3D &quot;${libdir}/libavahi-ui*.so.*&quot;<br>
&gt; +FILES_avahi-discover =3D &quot;${datadir}/applications/avahi-discove=
r.desktop \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ${datadir}/avahi/interfaces/avahi-discover.ui \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ${bindir}/avahi-discover-standalone \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;<br>
&gt;=C2=A0 LICENSE_libavahi-gobject =3D &quot;LGPLv2.1+&quot;<br>
&gt;=C2=A0 LICENSE_avahi-daemon =3D &quot;LGPLv2.1+&quot;<br>
&gt; @@ -46,7 +137,7 @@ FILES_avahi-dnsconfd =3D &quot;${sbindir}/avahi-dn=
sconfd \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 ${sysconfdir}/init.d/avahi-dnsconfd&quot;<br>
&gt;=C2=A0 FILES_libavahi-glib =3D &quot;${libdir}/libavahi-glib.so.*&quot=
;<br>
&gt;=C2=A0 FILES_libavahi-gobject =3D &quot;${libdir}/libavahi-gobject.so.=
*=C2=A0 ${libdir}/girepository-1.0/Avahi*.typelib&quot;<br>
&gt; -FILES_avahi-utils =3D &quot;${bindir}/avahi-*&quot;<br>
&gt; +FILES_avahi-utils =3D &quot;${bindir}/avahi-* ${bindir}/b* ${datadir=
}/applications/b*&quot;<br>
&gt;<br>
&gt;=C2=A0 RDEPENDS_${PN}-dev =3D &quot;avahi-daemon (=3D ${EXTENDPKGV}) l=
ibavahi-core (=3D ${EXTENDPKGV})&quot;<br>
&gt;=C2=A0 RDEPENDS_${PN}-dev +=3D &quot;${@[&quot;&quot;, &quot; libavahi=
-client (=3D ${EXTENDPKGV})&quot;][bb.utils.contains(&#39;PACKAGECONFIG&#39=
;, &#39;dbus&#39;, 1, 0, d)]}&quot;<br>
&gt; @@ -89,3 +180,4 @@ if [ -z &quot;$D&quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0killall -q -HUP dbus-daemon || true<=
br>
&gt;=C2=A0 fi<br>
&gt;=C2=A0 }<br>
&gt; +<br>
&gt; --<br>
&gt; 2.26.1<br>
&gt;<br>
&gt; <br>
</blockquote></div>

--000000000000c8b86f05a4e4ade2--
