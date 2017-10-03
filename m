Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3651A6612D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Oct 2017 10:57:19 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id x15so11222185itb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Oct 2017 03:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iC2X77izpmY/FQJ03nPFrbE6ibS6Z6JK1IPIFpF5XaY=;
	b=W+t3BsDWrdDB1xtx6n4lNtavLbzchEGhZLkO6gjTWWyNvhf0eZGJmWdfRZvfZhUp/k
	ONjnKLsFi2K+75CpMlO7F+VrLLP38rh5gxpRFp8jOoTBjMaSu+PY1oTvaIQX5u1mdyI7
	8t0IPcswN9/jgyS3A/3qG7Q8s0jf9j29Tb5d3/FV6RtRhwJKFlnLHsMiY4gE/GhsTTWF
	FuXgp//lUkL96JIkxbeA87En0QzYVxe26GXTtKp80Lg6+7/LplKun7N1VI+kXl8oEXPJ
	9He9kuuqRDuPP/FFXmZYBx0+ms6LHzkxaOq7o1uyvv5bltR9C8OAwn7qtTXEBhAk+Deo
	aHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iC2X77izpmY/FQJ03nPFrbE6ibS6Z6JK1IPIFpF5XaY=;
	b=KBJkehIDQ9VIN3ENGvjxzCO/xYJzMFuEB8F6pJ/NzzBTNi0kcZWLKiHBw0pHkWA2PY
	sHCqjvoTwZbHvaPJYi2w7tBxSm1cOEtF+hJblp6zXS4P1gUIH0Cw1EQIkym+QCaKYDAA
	y7U6M3Jrb7v7bu2bs4XSTgMAvUpQGWYJrV0FT8xcJ9G4u1xVp8pPYsmjNyf3E8p1psH7
	h9zr0MUxlNJJbh/lF/zqio+aa93pI/JNkrLRYCKds+sy9cqgoliCvJv332dxg9BA5cFc
	EFWVc3ODoKCNpYwtqCzBJOW1svI9WJVZmRXzjbKw06qPxm9bNb/LLQEGVjjd0QdxsDdo
	y/ag==
X-Gm-Message-State: AHPjjUjgUjqvdTHd+RSF6NACd7vj4LQ6xFLjN1+okPT1iO06HRkRUKzG
	miPDON8DF0hwovIexMH0IDKyUMNcASbCPP2Daav5dw==
X-Google-Smtp-Source: AOwi7QD8cVkrQsLqEDddSnRRE+Kk+A3wn77JKt/mUyDerTWHchRr3qe5OfxMS2fsbSRtXDf4I3BYI3NDjhnqErUr3Fk=
X-Received: by 10.36.178.1 with SMTP id u1mr25308587ite.120.1507028241302;
	Tue, 03 Oct 2017 03:57:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.164.134 with HTTP; Tue, 3 Oct 2017 03:57:00 -0700 (PDT)
In-Reply-To: <1505980000-17996-1-git-send-email-fan.xin@jp.fujitsu.com>
References: <1505980000-17996-1-git-send-email-fan.xin@jp.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 3 Oct 2017 11:57:00 +0100
Message-ID: <CAJTo0LanRmbdE_n3epVS6ZLDH47dcopp0ucThXUU87P8GJ75Ug@mail.gmail.com>
To: Fan Xin <fan.xin@jp.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dbus: 1.10.20 -> 1.10.22
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
X-List-Received-Date: Tue, 03 Oct 2017 10:57:20 -0000
Content-Type: multipart/alternative; boundary="f403045d9c0efd751c055aa25af6"

--f403045d9c0efd751c055aa25af6
Content-Type: text/plain; charset="UTF-8"

Remember to upgrade dbus-test at the same time as otherwise you break
dbus-test.

Ross

On 21 September 2017 at 08:46, Fan Xin <fan.xin@jp.fujitsu.com> wrote:

> Upgrade dbus from 1.10.20 to 1.10.22
>
> Signed-off-by: fan.xin@jp.fujitsu.com
> ---
>  meta/recipes-core/dbus/dbus_1.10.20.bb | 180
> ---------------------------------
>  meta/recipes-core/dbus/dbus_1.10.22.bb | 180
> +++++++++++++++++++++++++++++++++
>  2 files changed, 180 insertions(+), 180 deletions(-)
>  delete mode 100644 meta/recipes-core/dbus/dbus_1.10.20.bb
>  create mode 100644 meta/recipes-core/dbus/dbus_1.10.22.bb
>
> diff --git a/meta/recipes-core/dbus/dbus_1.10.20.bb
> b/meta/recipes-core/dbus/dbus_1.10.20.bb
> deleted file mode 100644
> index 9ddedc1..0000000
> --- a/meta/recipes-core/dbus/dbus_1.10.20.bb
> +++ /dev/null
> @@ -1,180 +0,0 @@
> -SUMMARY = "D-Bus message bus"
> -DESCRIPTION = "D-Bus is a message bus system, a simple way for
> applications to talk to one another. In addition to interprocess
> communication, D-Bus helps coordinate process lifecycle; it makes it simple
> and reliable to code a \"single instance\" application or daemon, and to
> launch applications and daemons on demand when their services are needed."
> -HOMEPAGE = "http://dbus.freedesktop.org"
> -SECTION = "base"
> -LICENSE = "AFL-2 | GPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
> -                    file://dbus/dbus.h;beginline=6;endline=20;md5=
> 7755c9d7abccd5dbd25a6a974538bb3c"
> -DEPENDS = "expat virtual/libintl"
> -RDEPENDS_dbus_class-native = ""
> -RDEPENDS_dbus_class-nativesdk = ""
> -PACKAGES += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest',
> '${PN}-ptest', '', d)}"
> -ALLOW_EMPTY_dbus-ptest = "1"
> -RDEPENDS_dbus-ptest_class-target = "dbus-test-ptest"
> -
> -SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
> -           file://tmpdir.patch \
> -           file://dbus-1.init \
> -           file://os-test.patch \
> -           file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
> -           file://0001-configure.ac-explicitely-check-stdint.h.patch \
> -"
> -
> -SRC_URI[md5sum] = "94c991e763d4f9f13690416b2dcd9411"
> -SRC_URI[sha256sum] = "e574b9780b5425fde4d973bb596e7e
> a0f09e00fe2edd662da9016e976c460b48"
> -
> -inherit useradd autotools pkgconfig gettext update-rc.d
> upstream-version-is-even
> -
> -INITSCRIPT_NAME = "dbus-1"
> -INITSCRIPT_PARAMS = "start 02 5 3 2 . stop 20 0 1 6 ."
> -
> -python __anonymous() {
> -    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False,
> d):
> -        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
> -}
> -
> -USERADD_PACKAGES = "${PN}"
> -GROUPADD_PARAM_${PN} = "-r netdev"
> -USERADD_PARAM_${PN} = "--system --home ${localstatedir}/lib/dbus \
> -                       --no-create-home --shell /bin/false \
> -                       --user-group messagebus"
> -
> -CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.conf
> ${sysconfdir}/dbus-1/session.conf"
> -
> -DEBIANNAME_${PN} = "dbus-1"
> -
> -PACKAGES =+ "${PN}-lib"
> -
> -OLDPKGNAME = "dbus-x11"
> -OLDPKGNAME_class-nativesdk = ""
> -
> -# for compatibility
> -RPROVIDES_${PN} = "${OLDPKGNAME}"
> -RREPLACES_${PN} += "${OLDPKGNAME}"
> -
> -FILES_${PN} = "${bindir}/dbus-daemon* \
> -               ${bindir}/dbus-uuidgen \
> -               ${bindir}/dbus-cleanup-sockets \
> -               ${bindir}/dbus-send \
> -               ${bindir}/dbus-monitor \
> -               ${bindir}/dbus-launch \
> -               ${bindir}/dbus-run-session \
> -               ${bindir}/dbus-update-activation-environment \
> -               ${libexecdir}/dbus* \
> -               ${sysconfdir} \
> -               ${localstatedir} \
> -               ${datadir}/dbus-1/services \
> -               ${datadir}/dbus-1/system-services \
> -               ${datadir}/dbus-1/session.d \
> -               ${datadir}/dbus-1/session.conf \
> -               ${datadir}/dbus-1/system.d \
> -               ${datadir}/dbus-1/system.conf \
> -               ${systemd_system_unitdir} \
> -               ${systemd_user_unitdir} \
> -"
> -FILES_${PN}-lib = "${libdir}/lib*.so.*"
> -RRECOMMENDS_${PN}-lib = "${PN}"
> -FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-test-tool"
> -
> -PACKAGE_WRITE_DEPS += "${@bb.utils.contains('DISTRO_FEATURES','systemd
> sysvinit','systemd-systemctl-native','',d)}"
> -pkg_postinst_dbus() {
> -       # If both systemd and sysvinit are enabled, mask the dbus-1 init
> script
> -        if ${@bb.utils.contains('DISTRO_FEATURES','systemd
> sysvinit','true','false',d)}; then
> -               if [ -n "$D" ]; then
> -                       OPTS="--root=$D"
> -               fi
> -               systemctl $OPTS mask dbus-1.service
> -       fi
> -
> -       if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
> -               /etc/init.d/populate-volatile.sh update
> -       fi
> -}
> -
> -EXTRA_OECONF = "--disable-tests \
> -                --disable-xml-docs \
> -                --disable-doxygen-docs \
> -                --disable-libaudit \
> -                --enable-largefile \
> -                "
> -
> -EXTRA_OECONF_append_class-target = " SYSTEMCTL=${base_bindir}/systemctl"
> -EXTRA_OECONF_append_class-native = " --disable-selinux"
> -
> -PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11',
> d)}"
> -PACKAGECONFIG_class-native = ""
> -PACKAGECONFIG_class-nativesdk = ""
> -
> -PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${
> systemd_system_unitdir},--disable-systemd --without-
> systemdsystemunitdir,systemd"
> -PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x
> --disable-x11-autolaunch, virtual/libx11 libsm"
> -PACKAGECONFIG[user-session] = "--enable-user-session
> --with-systemduserunitdir=${systemd_user_unitdir},--disable-user-session"
> -
> -do_install() {
> -       autotools_do_install
> -
> -       if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true',
> 'false', d)}; then
> -               install -d ${D}${sysconfdir}/init.d
> -               sed 's:@bindir@:${bindir}:' < ${WORKDIR}/dbus-1.init
> >${WORKDIR}/dbus-1.init.sh
> -               install -m 0755 ${WORKDIR}/dbus-1.init.sh
> ${D}${sysconfdir}/init.d/dbus-1
> -       fi
> -
> -       if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true',
> 'false', d)}; then
> -               for i in dbus.target.wants sockets.target.wants
> multi-user.target.wants; do \
> -                       install -d ${D}${systemd_system_unitdir}/$i; done
> -               install -m 0644 ${B}/bus/dbus.service ${B}/bus/dbus.socket
> ${D}${systemd_system_unitdir}/
> -               ln -fs ../dbus.socket ${D}${systemd_system_unitdir}/
> dbus.target.wants/dbus.socket
> -               ln -fs ../dbus.socket ${D}${systemd_system_unitdir}/
> sockets.target.wants/dbus.socket
> -               ln -fs ../dbus.service ${D}${systemd_system_unitdir}/
> multi-user.target.wants/dbus.service
> -       fi
> -
> -       install -d ${D}${sysconfdir}/default/volatiles
> -       echo "d messagebus messagebus 0755 ${localstatedir}/run/dbus none"
> \
> -            > ${D}${sysconfdir}/default/volatiles/99_dbus
> -
> -
> -       mkdir -p ${D}${localstatedir}/lib/dbus
> -
> -       chown messagebus:messagebus ${D}${localstatedir}/lib/dbus
> -
> -       chown root:messagebus ${D}${libexecdir}/dbus-daemon-launch-helper
> -       chmod 4755 ${D}${libexecdir}/dbus-daemon-launch-helper
> -
> -       # Remove Red Hat initscript
> -       rm -rf ${D}${sysconfdir}/rc.d
> -
> -       # Remove empty testexec directory as we don't build tests
> -       rm -rf ${D}${libdir}/dbus-1.0/test
> -
> -       # Remove /var/run as it is created on startup
> -       rm -rf ${D}${localstatedir}/run
> -}
> -
> -do_install_class-native() {
> -       autotools_do_install
> -
> -       # for dbus-glib-native introspection generation
> -       install -d ${D}${STAGING_DATADIR_NATIVE}/dbus/
> -       # N.B. is below install actually required?
> -       install -m 0644 bus/session.conf ${D}${STAGING_DATADIR_NATIVE}/
> dbus/session.conf
> -
> -       # dbus-glib-native and dbus-glib need this xml file
> -       ./bus/dbus-daemon --introspect > ${D}${STAGING_DATADIR_NATIVE}/
> dbus/dbus-bus-introspect.xml
> -
> -       # dbus-launch has no X support so lets not install it in case the
> host
> -       # has a more featured and useful version
> -       rm -f ${D}${bindir}/dbus-launch
> -}
> -
> -do_install_class-nativesdk() {
> -       autotools_do_install
> -
> -       # dbus-launch has no X support so lets not install it in case the
> host
> -       # has a more featured and useful version
> -       rm -f ${D}${bindir}/dbus-launch
> -
> -       # Remove /var/run to avoid QA error
> -       rm -rf ${D}${localstatedir}/run
> -}
> -BBCLASSEXTEND = "native nativesdk"
> -
> -INSANE_SKIP_${PN}-ptest += "build-deps"
> diff --git a/meta/recipes-core/dbus/dbus_1.10.22.bb
> b/meta/recipes-core/dbus/dbus_1.10.22.bb
> new file mode 100644
> index 0000000..370e4b2
> --- /dev/null
> +++ b/meta/recipes-core/dbus/dbus_1.10.22.bb
> @@ -0,0 +1,180 @@
> +SUMMARY = "D-Bus message bus"
> +DESCRIPTION = "D-Bus is a message bus system, a simple way for
> applications to talk to one another. In addition to interprocess
> communication, D-Bus helps coordinate process lifecycle; it makes it simple
> and reliable to code a \"single instance\" application or daemon, and to
> launch applications and daemons on demand when their services are needed."
> +HOMEPAGE = "http://dbus.freedesktop.org"
> +SECTION = "base"
> +LICENSE = "AFL-2 | GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
> +                    file://dbus/dbus.h;beginline=6;endline=20;md5=
> 7755c9d7abccd5dbd25a6a974538bb3c"
> +DEPENDS = "expat virtual/libintl"
> +RDEPENDS_dbus_class-native = ""
> +RDEPENDS_dbus_class-nativesdk = ""
> +PACKAGES += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest',
> '${PN}-ptest', '', d)}"
> +ALLOW_EMPTY_dbus-ptest = "1"
> +RDEPENDS_dbus-ptest_class-target = "dbus-test-ptest"
> +
> +SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
> +           file://tmpdir.patch \
> +           file://dbus-1.init \
> +           file://os-test.patch \
> +           file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
> +           file://0001-configure.ac-explicitely-check-stdint.h.patch \
> +"
> +
> +SRC_URI[md5sum] = "baaa10b7cb49086ad91179a8decfadc5"
> +SRC_URI[sha256sum] = "e2b1401e3eedc7b5c9a2034d31254c
> 886e1fcbc7858006e0a1c59158fe4b7b97"
> +
> +inherit useradd autotools pkgconfig gettext update-rc.d
> upstream-version-is-even
> +
> +INITSCRIPT_NAME = "dbus-1"
> +INITSCRIPT_PARAMS = "start 02 5 3 2 . stop 20 0 1 6 ."
> +
> +python __anonymous() {
> +    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False,
> d):
> +        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
> +}
> +
> +USERADD_PACKAGES = "${PN}"
> +GROUPADD_PARAM_${PN} = "-r netdev"
> +USERADD_PARAM_${PN} = "--system --home ${localstatedir}/lib/dbus \
> +                       --no-create-home --shell /bin/false \
> +                       --user-group messagebus"
> +
> +CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.conf
> ${sysconfdir}/dbus-1/session.conf"
> +
> +DEBIANNAME_${PN} = "dbus-1"
> +
> +PACKAGES =+ "${PN}-lib"
> +
> +OLDPKGNAME = "dbus-x11"
> +OLDPKGNAME_class-nativesdk = ""
> +
> +# for compatibility
> +RPROVIDES_${PN} = "${OLDPKGNAME}"
> +RREPLACES_${PN} += "${OLDPKGNAME}"
> +
> +FILES_${PN} = "${bindir}/dbus-daemon* \
> +               ${bindir}/dbus-uuidgen \
> +               ${bindir}/dbus-cleanup-sockets \
> +               ${bindir}/dbus-send \
> +               ${bindir}/dbus-monitor \
> +               ${bindir}/dbus-launch \
> +               ${bindir}/dbus-run-session \
> +               ${bindir}/dbus-update-activation-environment \
> +               ${libexecdir}/dbus* \
> +               ${sysconfdir} \
> +               ${localstatedir} \
> +               ${datadir}/dbus-1/services \
> +               ${datadir}/dbus-1/system-services \
> +               ${datadir}/dbus-1/session.d \
> +               ${datadir}/dbus-1/session.conf \
> +               ${datadir}/dbus-1/system.d \
> +               ${datadir}/dbus-1/system.conf \
> +               ${systemd_system_unitdir} \
> +               ${systemd_user_unitdir} \
> +"
> +FILES_${PN}-lib = "${libdir}/lib*.so.*"
> +RRECOMMENDS_${PN}-lib = "${PN}"
> +FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-test-tool"
> +
> +PACKAGE_WRITE_DEPS += "${@bb.utils.contains('DISTRO_FEATURES','systemd
> sysvinit','systemd-systemctl-native','',d)}"
> +pkg_postinst_dbus() {
> +       # If both systemd and sysvinit are enabled, mask the dbus-1 init
> script
> +        if ${@bb.utils.contains('DISTRO_FEATURES','systemd
> sysvinit','true','false',d)}; then
> +               if [ -n "$D" ]; then
> +                       OPTS="--root=$D"
> +               fi
> +               systemctl $OPTS mask dbus-1.service
> +       fi
> +
> +       if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
> +               /etc/init.d/populate-volatile.sh update
> +       fi
> +}
> +
> +EXTRA_OECONF = "--disable-tests \
> +                --disable-xml-docs \
> +                --disable-doxygen-docs \
> +                --disable-libaudit \
> +                --enable-largefile \
> +                "
> +
> +EXTRA_OECONF_append_class-target = " SYSTEMCTL=${base_bindir}/systemctl"
> +EXTRA_OECONF_append_class-native = " --disable-selinux"
> +
> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11',
> d)}"
> +PACKAGECONFIG_class-native = ""
> +PACKAGECONFIG_class-nativesdk = ""
> +
> +PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${
> systemd_system_unitdir},--disable-systemd --without-
> systemdsystemunitdir,systemd"
> +PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x
> --disable-x11-autolaunch, virtual/libx11 libsm"
> +PACKAGECONFIG[user-session] = "--enable-user-session
> --with-systemduserunitdir=${systemd_user_unitdir},--disable-user-session"
> +
> +do_install() {
> +       autotools_do_install
> +
> +       if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true',
> 'false', d)}; then
> +               install -d ${D}${sysconfdir}/init.d
> +               sed 's:@bindir@:${bindir}:' < ${WORKDIR}/dbus-1.init
> >${WORKDIR}/dbus-1.init.sh
> +               install -m 0755 ${WORKDIR}/dbus-1.init.sh
> ${D}${sysconfdir}/init.d/dbus-1
> +       fi
> +
> +       if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true',
> 'false', d)}; then
> +               for i in dbus.target.wants sockets.target.wants
> multi-user.target.wants; do \
> +                       install -d ${D}${systemd_system_unitdir}/$i; done
> +               install -m 0644 ${B}/bus/dbus.service ${B}/bus/dbus.socket
> ${D}${systemd_system_unitdir}/
> +               ln -fs ../dbus.socket ${D}${systemd_system_unitdir}/
> dbus.target.wants/dbus.socket
> +               ln -fs ../dbus.socket ${D}${systemd_system_unitdir}/
> sockets.target.wants/dbus.socket
> +               ln -fs ../dbus.service ${D}${systemd_system_unitdir}/
> multi-user.target.wants/dbus.service
> +       fi
> +
> +       install -d ${D}${sysconfdir}/default/volatiles
> +       echo "d messagebus messagebus 0755 ${localstatedir}/run/dbus none"
> \
> +            > ${D}${sysconfdir}/default/volatiles/99_dbus
> +
> +
> +       mkdir -p ${D}${localstatedir}/lib/dbus
> +
> +       chown messagebus:messagebus ${D}${localstatedir}/lib/dbus
> +
> +       chown root:messagebus ${D}${libexecdir}/dbus-daemon-launch-helper
> +       chmod 4755 ${D}${libexecdir}/dbus-daemon-launch-helper
> +
> +       # Remove Red Hat initscript
> +       rm -rf ${D}${sysconfdir}/rc.d
> +
> +       # Remove empty testexec directory as we don't build tests
> +       rm -rf ${D}${libdir}/dbus-1.0/test
> +
> +       # Remove /var/run as it is created on startup
> +       rm -rf ${D}${localstatedir}/run
> +}
> +
> +do_install_class-native() {
> +       autotools_do_install
> +
> +       # for dbus-glib-native introspection generation
> +       install -d ${D}${STAGING_DATADIR_NATIVE}/dbus/
> +       # N.B. is below install actually required?
> +       install -m 0644 bus/session.conf ${D}${STAGING_DATADIR_NATIVE}/
> dbus/session.conf
> +
> +       # dbus-glib-native and dbus-glib need this xml file
> +       ./bus/dbus-daemon --introspect > ${D}${STAGING_DATADIR_NATIVE}/
> dbus/dbus-bus-introspect.xml
> +
> +       # dbus-launch has no X support so lets not install it in case the
> host
> +       # has a more featured and useful version
> +       rm -f ${D}${bindir}/dbus-launch
> +}
> +
> +do_install_class-nativesdk() {
> +       autotools_do_install
> +
> +       # dbus-launch has no X support so lets not install it in case the
> host
> +       # has a more featured and useful version
> +       rm -f ${D}${bindir}/dbus-launch
> +
> +       # Remove /var/run to avoid QA error
> +       rm -rf ${D}${localstatedir}/run
> +}
> +BBCLASSEXTEND = "native nativesdk"
> +
> +INSANE_SKIP_${PN}-ptest += "build-deps"
> --
> 2.7.4
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045d9c0efd751c055aa25af6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Remember to upgrade dbus-test at the same time as otherwis=
e you break dbus-test.<div><br></div><div>Ross</div></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On 21 September 2017 at 08:46, Fan=
 Xin <span dir=3D"ltr">&lt;<a href=3D"mailto:fan.xin@jp.fujitsu.com" target=
=3D"_blank">fan.xin@jp.fujitsu.com</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">Upgrade dbus from 1.10.20 to 1.10.22<br>
<br>
Signed-off-by: <a href=3D"mailto:fan.xin@jp.fujitsu.com">fan.xin@jp.fujitsu=
.com</a><br>
---<br>
=C2=A0meta/recipes-core/dbus/<a href=3D"http://dbus_1.10.20.bb" rel=3D"nore=
ferrer" target=3D"_blank">dbus_1.<wbr>10.20.bb</a> | 180 ------------------=
------------<wbr>---<br>
=C2=A0meta/recipes-core/dbus/<a href=3D"http://dbus_1.10.22.bb" rel=3D"nore=
ferrer" target=3D"_blank">dbus_1.<wbr>10.22.bb</a> | 180 ++++++++++++++++++=
++++++++++++<wbr>+++<br>
=C2=A02 files changed, 180 insertions(+), 180 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-core/dbus/<a href=3D"http://dbus_1.10=
.20.bb" rel=3D"noreferrer" target=3D"_blank">dbus_1.<wbr>10.20.bb</a><br>
=C2=A0create mode 100644 meta/recipes-core/dbus/<a href=3D"http://dbus_1.10=
.22.bb" rel=3D"noreferrer" target=3D"_blank">dbus_1.<wbr>10.22.bb</a><br>
<br>
diff --git a/meta/recipes-core/dbus/<a href=3D"http://dbus_1.10.20.bb" rel=
=3D"noreferrer" target=3D"_blank">dbus_<wbr>1.10.20.bb</a> b/meta/recipes-c=
ore/dbus/<a href=3D"http://dbus_1.10.20.bb" rel=3D"noreferrer" target=3D"_b=
lank">dbus_<wbr>1.10.20.bb</a><br>
deleted file mode 100644<br>
index 9ddedc1..0000000<br>
--- a/meta/recipes-core/dbus/<a href=3D"http://dbus_1.10.20.bb" rel=3D"nore=
ferrer" target=3D"_blank">dbus_<wbr>1.10.20.bb</a><br>
+++ /dev/null<br>
@@ -1,180 +0,0 @@<br>
-SUMMARY =3D &quot;D-Bus message bus&quot;<br>
-DESCRIPTION =3D &quot;D-Bus is a message bus system, a simple way for appl=
ications to talk to one another. In addition to interprocess communication,=
 D-Bus helps coordinate process lifecycle; it makes it simple and reliable =
to code a \&quot;single instance\&quot; application or daemon, and to launc=
h applications and daemons on demand when their services are needed.&quot;<=
br>
-HOMEPAGE =3D &quot;<a href=3D"http://dbus.freedesktop.org" rel=3D"noreferr=
er" target=3D"_blank">http://dbus.freedesktop.org</a>&quot;<br>
-SECTION =3D &quot;base&quot;<br>
-LICENSE =3D &quot;AFL-2 | GPLv2+&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>10dded3b58148f3f1fd80=
4b26354af<wbr>3e \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://dbus/dbus.h;beginline=3D<wbr>6;endline=3D20;md5=3D<wbr>7755c9d7abccd5dbd=
25a6a974538bb<wbr>3c&quot;<br>
-DEPENDS =3D &quot;expat virtual/libintl&quot;<br>
-RDEPENDS_dbus_class-native =3D &quot;&quot;<br>
-RDEPENDS_dbus_class-nativesdk =3D &quot;&quot;<br>
-PACKAGES +=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &=
#39;ptest&#39;, &#39;${PN}-ptest&#39;, &#39;&#39;, d)}&quot;<br>
-ALLOW_EMPTY_dbus-ptest =3D &quot;1&quot;<br>
-RDEPENDS_dbus-ptest_class-<wbr>target =3D &quot;dbus-test-ptest&quot;<br>
-<br>
-SRC_URI =3D &quot;<a href=3D"http://dbus.freedesktop.org/releases/dbus/dbu=
s-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://dbus.freedeskto=
p.org/<wbr>releases/dbus/dbus-${PV}.tar.<wbr>gz</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://tmpdir.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://dbus-1.init \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://os-test.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://clear-guid_from_server-<wb=
r>if-send_negotiate_unix_f.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-configure.ac-<wbr>exp=
licitely-check-stdint.h.<wbr>patch \<br>
-&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;<wbr>94c991e763d4f9f13690416b2dcd94<wbr>11&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>e574b9780b5425fde4d973bb596e7e<wbr>a0f09=
e00fe2edd662da9016e976c46<wbr>0b48&quot;<br>
-<br>
-inherit useradd autotools pkgconfig gettext update-rc.d upstream-version-i=
s-even<br>
-<br>
-INITSCRIPT_NAME =3D &quot;dbus-1&quot;<br>
-INITSCRIPT_PARAMS =3D &quot;start 02 5 3 2 . stop 20 0 1 6 .&quot;<br>
-<br>
-python __anonymous() {<br>
-=C2=A0 =C2=A0 if not bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#3=
9;sysvinit&#39;, True, False, d):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;INHIBIT_UPDATERCD_<wbr>BBCLASS&=
quot;, &quot;1&quot;)<br>
-}<br>
-<br>
-USERADD_PACKAGES =3D &quot;${PN}&quot;<br>
-GROUPADD_PARAM_${PN} =3D &quot;-r netdev&quot;<br>
-USERADD_PARAM_${PN} =3D &quot;--system --home ${localstatedir}/lib/dbus \<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0--no-create-home --shell /bin/false \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0--user-group messagebus&quot;<br>
-<br>
-CONFFILES_${PN} =3D &quot;${sysconfdir}/dbus-1/system.<wbr>conf ${sysconfd=
ir}/dbus-1/session.<wbr>conf&quot;<br>
-<br>
-DEBIANNAME_${PN} =3D &quot;dbus-1&quot;<br>
-<br>
-PACKAGES =3D+ &quot;${PN}-lib&quot;<br>
-<br>
-OLDPKGNAME =3D &quot;dbus-x11&quot;<br>
-OLDPKGNAME_class-nativesdk =3D &quot;&quot;<br>
-<br>
-# for compatibility<br>
-RPROVIDES_${PN} =3D &quot;${OLDPKGNAME}&quot;<br>
-RREPLACES_${PN} +=3D &quot;${OLDPKGNAME}&quot;<br>
-<br>
-FILES_${PN} =3D &quot;${bindir}/dbus-daemon* \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${bindir}/dbus-uuid=
gen \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${bindir}/dbus-clea=
nup-sockets \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${bindir}/dbus-send=
 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${bindir}/dbus-moni=
tor \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${bindir}/dbus-laun=
ch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${bindir}/dbus-run-=
session \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${bindir}/dbus-upda=
te-<wbr>activation-environment \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libexecdir}/dbus*=
 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${sysconfdir} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${localstatedir} \<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/dbus-1/s=
ervices \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/dbus-1/s=
ystem-<wbr>services \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/dbus-1/s=
ession.d \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/dbus-1/s=
ession.conf \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/dbus-1/s=
ystem.d \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/dbus-1/s=
ystem.conf \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${systemd_system_un=
itdir} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${systemd_user_unit=
dir} \<br>
-&quot;<br>
-FILES_${PN}-lib =3D &quot;${libdir}/lib*.so.*&quot;<br>
-RRECOMMENDS_${PN}-lib =3D &quot;${PN}&quot;<br>
-FILES_${PN}-dev +=3D &quot;${libdir}/dbus-1.0/include ${bindir}/dbus-test-=
tool&quot;<br>
-<br>
-PACKAGE_WRITE_DEPS +=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATUR=
ES&#39;,&#39;systemd sysvinit&#39;,&#39;systemd-systemctl-<wbr>native&#39;,=
&#39;&#39;,d)}&quot;<br>
-pkg_postinst_dbus() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# If both systemd and sysvinit are enabled, mas=
k the dbus-1 init script<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;DISTRO_<wbr>FEATU=
RES&#39;,&#39;systemd sysvinit&#39;,&#39;true&#39;,&#39;false&#39;,d)}; the=
n<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;$D&qu=
ot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0OPTS=3D&quot;--root=3D$D&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0systemctl $OPTS mas=
k dbus-1.service<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z &quot;$D&quot; ] &amp;&amp; [ -e /etc/i=
nit.d/populate-volatile.<wbr>sh ] ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/etc/init.d/populat=
e-volatile.<wbr>sh update<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-}<br>
-<br>
-EXTRA_OECONF =3D &quot;--disable-tests \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-xml-docs=
 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-doxygen-=
docs \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-libaudit=
 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-largefile=
 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-<br>
-EXTRA_OECONF_append_class-<wbr>target =3D &quot; SYSTEMCTL=3D${base_bindir=
}/<wbr>systemctl&quot;<br>
-EXTRA_OECONF_append_class-<wbr>native =3D &quot; --disable-selinux&quot;<b=
r>
-<br>
-PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_<wbr>FEATURES&#39=
;, &#39;systemd x11&#39;, d)}&quot;<br>
-PACKAGECONFIG_class-native =3D &quot;&quot;<br>
-PACKAGECONFIG_class-nativesdk =3D &quot;&quot;<br>
-<br>
-PACKAGECONFIG[systemd] =3D &quot;--enable-systemd --with-systemdsystemunit=
dir=3D${<wbr>systemd_system_unitdir},--<wbr>disable-systemd --without-<wbr>=
systemdsystemunitdir,systemd&quot;<br>
-PACKAGECONFIG[x11] =3D &quot;--with-x --enable-x11-autolaunch,--<wbr>witho=
ut-x --disable-x11-autolaunch, virtual/libx11 libsm&quot;<br>
-PACKAGECONFIG[user-session] =3D &quot;--enable-user-session --with-systemd=
userunitdir=3D${<wbr>systemd_user_unitdir},--<wbr>disable-user-session&quot=
;<br>
-<br>
-do_install() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0autotools_do_install<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;DISTRO_<wbr>FEATUR=
ES&#39;, &#39;sysvinit&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sy=
sconfdir}/init.d<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed &#39;s:@bindir@=
:${bindir}:&#39; &lt; ${WORKDIR}/dbus-1.init &gt;${WORKDIR}/<a href=3D"http=
://dbus-1.init.sh" rel=3D"noreferrer" target=3D"_blank">dbus-1.init.sh</a><=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${W=
ORKDIR}/<a href=3D"http://dbus-1.init.sh" rel=3D"noreferrer" target=3D"_bla=
nk">dbus-1.init.sh</a> ${D}${sysconfdir}/init.d/dbus-<wbr>1<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;DISTRO_<wbr>FEATUR=
ES&#39;, &#39;systemd&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for i in dbus.targe=
t.wants sockets.target.wants multi-user.target.wants; do \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0install -d ${D}${systemd_system_unitdir}/<wbr>$i; done<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${B=
}/bus/dbus.service ${B}/bus/dbus.socket ${D}${systemd_system_unitdir}/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -fs ../dbus.sock=
et ${D}${systemd_system_unitdir}/<wbr>dbus.target.wants/dbus.socket<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -fs ../dbus.sock=
et ${D}${systemd_system_unitdir}/<wbr>sockets.target.wants/dbus.<wbr>socket=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -fs ../dbus.serv=
ice ${D}${systemd_system_unitdir}/<wbr>multi-user.target.wants/dbus.<wbr>se=
rvice<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/default/<wbr>volat=
iles<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;d messagebus messagebus 0755 ${local=
statedir}/run/dbus none&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; ${D}${sysconfdir}/default/<=
wbr>volatiles/99_dbus<br>
-<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${D}${localstatedir}/lib/dbus<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0chown messagebus:messagebus ${D}${localstatedir=
}/lib/dbus<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0chown root:messagebus ${D}${libexecdir}/dbus-da=
emon-<wbr>launch-helper<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0chmod 4755 ${D}${libexecdir}/dbus-daemon-<wbr>l=
aunch-helper<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove Red Hat initscript<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${sysconfdir}/rc.d<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove empty testexec directory as we don&#39=
;t build tests<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${libdir}/dbus-1.0/test<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove /var/run as it is created on startup<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${localstatedir}/run<br>
-}<br>
-<br>
-do_install_class-native() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0autotools_do_install<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# for dbus-glib-native introspection generation=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${STAGING_DATADIR_NATIVE}/<wbr>d=
bus/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# N.B. is below install actually required?<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 bus/session.conf ${D}${STAGING_=
DATADIR_NATIVE}/<wbr>dbus/session.conf<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# dbus-glib-native and dbus-glib need this xml =
file<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0./bus/dbus-daemon --introspect &gt; ${D}${STAGI=
NG_DATADIR_NATIVE}/<wbr>dbus/dbus-bus-introspect.xml<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# dbus-launch has no X support so lets not inst=
all it in case the host<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# has a more featured and useful version<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}${bindir}/dbus-launch<br>
-}<br>
-<br>
-do_install_class-nativesdk() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0autotools_do_install<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# dbus-launch has no X support so lets not inst=
all it in case the host<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# has a more featured and useful version<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}${bindir}/dbus-launch<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove /var/run to avoid QA error<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${localstatedir}/run<br>
-}<br>
-BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-<br>
-INSANE_SKIP_${PN}-ptest +=3D &quot;build-deps&quot;<br>
diff --git a/meta/recipes-core/dbus/<a href=3D"http://dbus_1.10.22.bb" rel=
=3D"noreferrer" target=3D"_blank">dbus_<wbr>1.10.22.bb</a> b/meta/recipes-c=
ore/dbus/<a href=3D"http://dbus_1.10.22.bb" rel=3D"noreferrer" target=3D"_b=
lank">dbus_<wbr>1.10.22.bb</a><br>
new file mode 100644<br>
index 0000000..370e4b2<br>
--- /dev/null<br>
+++ b/meta/recipes-core/dbus/<a href=3D"http://dbus_1.10.22.bb" rel=3D"nore=
ferrer" target=3D"_blank">dbus_<wbr>1.10.22.bb</a><br>
@@ -0,0 +1,180 @@<br>
+SUMMARY =3D &quot;D-Bus message bus&quot;<br>
+DESCRIPTION =3D &quot;D-Bus is a message bus system, a simple way for appl=
ications to talk to one another. In addition to interprocess communication,=
 D-Bus helps coordinate process lifecycle; it makes it simple and reliable =
to code a \&quot;single instance\&quot; application or daemon, and to launc=
h applications and daemons on demand when their services are needed.&quot;<=
br>
+HOMEPAGE =3D &quot;<a href=3D"http://dbus.freedesktop.org" rel=3D"noreferr=
er" target=3D"_blank">http://dbus.freedesktop.org</a>&quot;<br>
+SECTION =3D &quot;base&quot;<br>
+LICENSE =3D &quot;AFL-2 | GPLv2+&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>10dded3b58148f3f1fd80=
4b26354af<wbr>3e \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://dbus/dbus.h;beginline=3D<wbr>6;endline=3D20;md5=3D<wbr>7755c9d7abccd5dbd=
25a6a974538bb<wbr>3c&quot;<br>
+DEPENDS =3D &quot;expat virtual/libintl&quot;<br>
+RDEPENDS_dbus_class-native =3D &quot;&quot;<br>
+RDEPENDS_dbus_class-nativesdk =3D &quot;&quot;<br>
+PACKAGES +=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &=
#39;ptest&#39;, &#39;${PN}-ptest&#39;, &#39;&#39;, d)}&quot;<br>
+ALLOW_EMPTY_dbus-ptest =3D &quot;1&quot;<br>
+RDEPENDS_dbus-ptest_class-<wbr>target =3D &quot;dbus-test-ptest&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"http://dbus.freedesktop.org/releases/dbus/dbu=
s-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://dbus.freedeskto=
p.org/<wbr>releases/dbus/dbus-${PV}.tar.<wbr>gz</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://tmpdir.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://dbus-1.init \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://os-test.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://clear-guid_from_server-<wb=
r>if-send_negotiate_unix_f.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-configure.ac-<wbr>exp=
licitely-check-stdint.h.<wbr>patch \<br>
+&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;<wbr>baaa10b7cb49086ad91179a8decfad<wbr>c5&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>e2b1401e3eedc7b5c9a2034d31254c<wbr>886e1=
fcbc7858006e0a1c59158fe4b<wbr>7b97&quot;<br>
+<br>
+inherit useradd autotools pkgconfig gettext update-rc.d upstream-version-i=
s-even<br>
+<br>
+INITSCRIPT_NAME =3D &quot;dbus-1&quot;<br>
+INITSCRIPT_PARAMS =3D &quot;start 02 5 3 2 . stop 20 0 1 6 .&quot;<br>
+<br>
+python __anonymous() {<br>
+=C2=A0 =C2=A0 if not bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#3=
9;sysvinit&#39;, True, False, d):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;INHIBIT_UPDATERCD_<wbr>BBCLASS&=
quot;, &quot;1&quot;)<br>
+}<br>
+<br>
+USERADD_PACKAGES =3D &quot;${PN}&quot;<br>
+GROUPADD_PARAM_${PN} =3D &quot;-r netdev&quot;<br>
+USERADD_PARAM_${PN} =3D &quot;--system --home ${localstatedir}/lib/dbus \<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0--no-create-home --shell /bin/false \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0--user-group messagebus&quot;<br>
+<br>
+CONFFILES_${PN} =3D &quot;${sysconfdir}/dbus-1/system.<wbr>conf ${sysconfd=
ir}/dbus-1/session.<wbr>conf&quot;<br>
+<br>
+DEBIANNAME_${PN} =3D &quot;dbus-1&quot;<br>
+<br>
+PACKAGES =3D+ &quot;${PN}-lib&quot;<br>
+<br>
+OLDPKGNAME =3D &quot;dbus-x11&quot;<br>
+OLDPKGNAME_class-nativesdk =3D &quot;&quot;<br>
+<br>
+# for compatibility<br>
+RPROVIDES_${PN} =3D &quot;${OLDPKGNAME}&quot;<br>
+RREPLACES_${PN} +=3D &quot;${OLDPKGNAME}&quot;<br>
+<br>
+FILES_${PN} =3D &quot;${bindir}/dbus-daemon* \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${bindir}/dbus-uuid=
gen \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${bindir}/dbus-clea=
nup-sockets \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${bindir}/dbus-send=
 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${bindir}/dbus-moni=
tor \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${bindir}/dbus-laun=
ch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${bindir}/dbus-run-=
session \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${bindir}/dbus-upda=
te-<wbr>activation-environment \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libexecdir}/dbus*=
 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${sysconfdir} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${localstatedir} \<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/dbus-1/s=
ervices \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/dbus-1/s=
ystem-<wbr>services \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/dbus-1/s=
ession.d \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/dbus-1/s=
ession.conf \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/dbus-1/s=
ystem.d \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/dbus-1/s=
ystem.conf \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${systemd_system_un=
itdir} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${systemd_user_unit=
dir} \<br>
+&quot;<br>
+FILES_${PN}-lib =3D &quot;${libdir}/lib*.so.*&quot;<br>
+RRECOMMENDS_${PN}-lib =3D &quot;${PN}&quot;<br>
+FILES_${PN}-dev +=3D &quot;${libdir}/dbus-1.0/include ${bindir}/dbus-test-=
tool&quot;<br>
+<br>
+PACKAGE_WRITE_DEPS +=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATUR=
ES&#39;,&#39;systemd sysvinit&#39;,&#39;systemd-systemctl-<wbr>native&#39;,=
&#39;&#39;,d)}&quot;<br>
+pkg_postinst_dbus() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# If both systemd and sysvinit are enabled, mas=
k the dbus-1 init script<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;DISTRO_<wbr>FEATU=
RES&#39;,&#39;systemd sysvinit&#39;,&#39;true&#39;,&#39;false&#39;,d)}; the=
n<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;$D&qu=
ot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0OPTS=3D&quot;--root=3D$D&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0systemctl $OPTS mas=
k dbus-1.service<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z &quot;$D&quot; ] &amp;&amp; [ -e /etc/i=
nit.d/populate-volatile.<wbr>sh ] ; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/etc/init.d/populat=
e-volatile.<wbr>sh update<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+}<br>
+<br>
+EXTRA_OECONF =3D &quot;--disable-tests \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-xml-docs=
 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-doxygen-=
docs \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-libaudit=
 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-largefile=
 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
+EXTRA_OECONF_append_class-<wbr>target =3D &quot; SYSTEMCTL=3D${base_bindir=
}/<wbr>systemctl&quot;<br>
+EXTRA_OECONF_append_class-<wbr>native =3D &quot; --disable-selinux&quot;<b=
r>
+<br>
+PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_<wbr>FEATURES&#39=
;, &#39;systemd x11&#39;, d)}&quot;<br>
+PACKAGECONFIG_class-native =3D &quot;&quot;<br>
+PACKAGECONFIG_class-nativesdk =3D &quot;&quot;<br>
+<br>
+PACKAGECONFIG[systemd] =3D &quot;--enable-systemd --with-systemdsystemunit=
dir=3D${<wbr>systemd_system_unitdir},--<wbr>disable-systemd --without-<wbr>=
systemdsystemunitdir,systemd&quot;<br>
+PACKAGECONFIG[x11] =3D &quot;--with-x --enable-x11-autolaunch,--<wbr>witho=
ut-x --disable-x11-autolaunch, virtual/libx11 libsm&quot;<br>
+PACKAGECONFIG[user-session] =3D &quot;--enable-user-session --with-systemd=
userunitdir=3D${<wbr>systemd_user_unitdir},--<wbr>disable-user-session&quot=
;<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0autotools_do_install<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;DISTRO_<wbr>FEATUR=
ES&#39;, &#39;sysvinit&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sy=
sconfdir}/init.d<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed &#39;s:@bindir@=
:${bindir}:&#39; &lt; ${WORKDIR}/dbus-1.init &gt;${WORKDIR}/<a href=3D"http=
://dbus-1.init.sh" rel=3D"noreferrer" target=3D"_blank">dbus-1.init.sh</a><=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${W=
ORKDIR}/<a href=3D"http://dbus-1.init.sh" rel=3D"noreferrer" target=3D"_bla=
nk">dbus-1.init.sh</a> ${D}${sysconfdir}/init.d/dbus-<wbr>1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;DISTRO_<wbr>FEATUR=
ES&#39;, &#39;systemd&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for i in dbus.targe=
t.wants sockets.target.wants multi-user.target.wants; do \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0install -d ${D}${systemd_system_unitdir}/<wbr>$i; done<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${B=
}/bus/dbus.service ${B}/bus/dbus.socket ${D}${systemd_system_unitdir}/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -fs ../dbus.sock=
et ${D}${systemd_system_unitdir}/<wbr>dbus.target.wants/dbus.socket<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -fs ../dbus.sock=
et ${D}${systemd_system_unitdir}/<wbr>sockets.target.wants/dbus.<wbr>socket=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -fs ../dbus.serv=
ice ${D}${systemd_system_unitdir}/<wbr>multi-user.target.wants/dbus.<wbr>se=
rvice<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/default/<wbr>volat=
iles<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;d messagebus messagebus 0755 ${local=
statedir}/run/dbus none&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; ${D}${sysconfdir}/default/<=
wbr>volatiles/99_dbus<br>
+<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${D}${localstatedir}/lib/dbus<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0chown messagebus:messagebus ${D}${localstatedir=
}/lib/dbus<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0chown root:messagebus ${D}${libexecdir}/dbus-da=
emon-<wbr>launch-helper<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0chmod 4755 ${D}${libexecdir}/dbus-daemon-<wbr>l=
aunch-helper<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove Red Hat initscript<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${sysconfdir}/rc.d<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove empty testexec directory as we don&#39=
;t build tests<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${libdir}/dbus-1.0/test<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove /var/run as it is created on startup<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${localstatedir}/run<br>
+}<br>
+<br>
+do_install_class-native() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0autotools_do_install<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# for dbus-glib-native introspection generation=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${STAGING_DATADIR_NATIVE}/<wbr>d=
bus/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# N.B. is below install actually required?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 bus/session.conf ${D}${STAGING_=
DATADIR_NATIVE}/<wbr>dbus/session.conf<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# dbus-glib-native and dbus-glib need this xml =
file<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0./bus/dbus-daemon --introspect &gt; ${D}${STAGI=
NG_DATADIR_NATIVE}/<wbr>dbus/dbus-bus-introspect.xml<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# dbus-launch has no X support so lets not inst=
all it in case the host<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# has a more featured and useful version<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}${bindir}/dbus-launch<br>
+}<br>
+<br>
+do_install_class-nativesdk() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0autotools_do_install<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# dbus-launch has no X support so lets not inst=
all it in case the host<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# has a more featured and useful version<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}${bindir}/dbus-launch<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove /var/run to avoid QA error<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${localstatedir}/run<br>
+}<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
+<br>
+INSANE_SKIP_${PN}-ptest +=3D &quot;build-deps&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--f403045d9c0efd751c055aa25af6--
