Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 448F87318F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 16:35:33 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id ph11so112345492igc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 08:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=p5M8MrXVXcOuTp8uTYizA2Qdp4dMDOg5CEiBZUjjCMQ=;
	b=FnC0FYDfjVbA1dVKydKxqImaXJ3MfHGiZM522CnmnaXU46eIlIigxq7PUfovqO3Gkj
	3hawJtLR7rrYJwWn9yRT7U/iXJzApjFKnSAAOV263R75fwzVqTQPibixiBn7xejlhJx7
	QTisQbIo1aneqJoqCz32lKb3C9Rui3hA75xrE2proDLF2VzxYg5+Lrmt4CnOAg51Et74
	MJJaU9WJRLnUWZe9T1GWh9NjHE/aAdmpLxv59d63bImP/5ADLhiJVGUIwdUuA8wh+qJY
	ITodJtz8AjQAfCzUuK02N8NNmdoESBard5HJJiQEuTl0DJIgg5KY85Xl4FR7CY5doM2g
	VkLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=p5M8MrXVXcOuTp8uTYizA2Qdp4dMDOg5CEiBZUjjCMQ=;
	b=TecWm15iSd0y32jnDwgbhj2AI1X79r8+/+KwtQ5pMb+zOIkzjMD+6wzs67SME3yG8a
	8N9lHhwvhe9VZVf/Efik1vw0kk5+aTzg/+nvQUAaC7MpFV1kvP+xBIO1BmrVbMrZNjBh
	qqnNxY2zJerhhyNZpFTefhFYqj7FJQGHUGFNZ8/ATGB2iJjz4ueL/yvtDsWi1op4vHqs
	V+yVtLnQkpoCZggtIROQxHxcaR3jyhOr8fhcu5ocoJfBH9AsFJFPHJJu4r/meBK7qzWi
	MnsOXySuWuvP1uuL8y7smqTVOEvHSEwRoT12EvcWh8EDjPAo7wwkeeTWICbS9OatoTCt
	rI1Q==
X-Gm-Message-State: ALoCoQkDNRlo5tDKq2VNkbN0J0o4qz4rSImxk9otyhTJmf1yTgl+QFpDN5zhrOHjQEYJnlIkHiI7wJzAS1srH09Ndhf26rHCQqprweUKPfp/W0LSBvhBTBE=
X-Received: by 10.50.30.69 with SMTP id q5mr5230944igh.78.1450197334380; Tue,
	15 Dec 2015 08:35:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Tue, 15 Dec 2015 08:35:14 -0800 (PST)
In-Reply-To: <1450197222-4442-1-git-send-email-ross.burton@intel.com>
References: <1450197222-4442-1-git-send-email-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 15 Dec 2015 16:35:14 +0000
Message-ID: <CAJTo0LYwOjP_CRFFYu+fPR0-Kv4xOHq8cjxGuL5xFqcqVYtN=Q@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta: remove removals of FILES_-dbg
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
X-List-Received-Date: Tue, 15 Dec 2015 16:35:34 -0000
Content-Type: multipart/alternative; boundary=047d7bdc1c0cf86ea50526f260bd

--047d7bdc1c0cf86ea50526f260bd
Content-Type: text/plain; charset=UTF-8

Well that subject made no sense, fixed it locally.

Ross

On 15 December 2015 at 16:33, Ross Burton <ross.burton@intel.com> wrote:

> In some recipes overly-split -dbg packages were merged into PN-dbg.  Unless
> there's a very good reason, recipes should have a single -dev and -dbg
> package.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-bsp/pcmciautils/pcmciautils_018.bb                    | 1 -
>  meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb                        | 3
> +--
>  meta/recipes-bsp/u-boot/u-boot.inc                                 | 2 --
>  meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb                 | 1 -
>  meta/recipes-connectivity/connman/connman.inc                      | 2 --
>  meta/recipes-connectivity/iproute2/iproute2.inc                    | 2 --
>  meta/recipes-connectivity/neard/neard_0.15.bb                      | 1 -
>  meta/recipes-connectivity/openssl/openssl_1.0.2e.bb                | 7
> +------
>  meta/recipes-connectivity/ppp/ppp_2.4.7.bb                         | 1 -
>  meta/recipes-connectivity/wireless-tools/wireless-tools_30.pre9.bb | 5
> +----
>  meta/recipes-core/dbus/dbus-glib.inc                               | 2 +-
>  meta/recipes-core/glib-networking/glib-networking_2.46.1.bb        | 1 -
>  meta/recipes-core/libcgroup/libcgroup_0.41.bb                      | 1 -
>  meta/recipes-core/libxml/libxml2_2.9.3.bb                          | 1 -
>  meta/recipes-core/uclibc/uclibc-package.inc                        | 3 +--
>  meta/recipes-core/util-linux/util-linux.inc                        | 1 -
>  meta/recipes-devtools/apt/apt.inc                                  | 2 --
>  meta/recipes-devtools/binutils/binutils.inc                        | 2 --
>  meta/recipes-devtools/bootchart2/bootchart2_0.14.7.bb              | 1 -
>  meta/recipes-devtools/gcc/gcc-sanitizers.inc                       | 7
> +------
>  meta/recipes-devtools/gcc/libgcc.inc                               | 2 --
>  meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb              | 2 --
>  meta/recipes-devtools/python/python-smartpm_git.bb                 | 2 --
>  meta/recipes-devtools/python/python3_3.5.0.bb                      | 3
> ---
>  meta/recipes-devtools/python/python_2.7.9.bb                       | 3
> ---
>  meta/recipes-devtools/rpm/rpm_5.4+cvs.bb                           | 2 +-
>  meta/recipes-devtools/ruby/ruby_2.2.2.bb                           | 5
> -----
>  meta/recipes-devtools/vala/vala.inc                                | 1 -
>  meta/recipes-devtools/valgrind/valgrind_3.10.1.bb                  | 2 --
>  meta/recipes-extended/cracklib/cracklib_2.9.5.bb                   | 1 -
>  meta/recipes-extended/gawk/gawk_3.1.5.bb                           | 1 -
>  meta/recipes-extended/gawk/gawk_4.1.3.bb                           | 1 -
>  meta/recipes-extended/iptables/iptables_1.4.21.bb                  | 1 -
>  meta/recipes-extended/libsolv/libsolv_git.bb                       | 3
> +--
>  meta/recipes-extended/libuser/libuser_0.62.bb                      | 1 -
>  meta/recipes-extended/mc/mc_4.7.5.2.bb                             | 2 --
>  meta/recipes-extended/mc/mc_4.8.15.bb                              | 2 --
>  meta/recipes-extended/newt/libnewt-python_0.52.18.bb               | 1 -
>  meta/recipes-extended/slang/slang_2.2.4.bb                         | 1 -
>  meta/recipes-extended/sysstat/sysstat.inc                          | 1 -
>  meta/recipes-gnome/epiphany/epiphany_3.16.3.bb                     | 1 -
>  meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.1.bb                 | 6
> ------
>  meta/recipes-gnome/gnome/gconf_3.2.6.bb                            | 1 -
>  meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb               | 1 -
>  meta/recipes-gnome/librsvg/librsvg_2.40.11.bb                      | 1 -
>  meta/recipes-graphics/harfbuzz/harfbuzz_1.1.2.bb                   | 3
> +--
>  meta/recipes-graphics/piglit/piglit_git.bb                         | 2 --
>  meta/recipes-graphics/tslib/tslib_1.1.bb                           | 1 -
>  meta/recipes-graphics/wayland/libinput_0.21.0.bb                   | 1 -
>  meta/recipes-graphics/xorg-driver/xorg-driver-common.inc           | 1 -
>  meta/recipes-graphics/xorg-driver/xorg-driver-input.inc            | 1 -
>  meta/recipes-kernel/cryptodev/cryptodev-tests_1.7.bb               | 1 -
>  meta/recipes-kernel/perf/perf.bb                                   | 1 -
>  meta/recipes-kernel/systemtap/systemtap_git.bb                     | 2 --
>  meta/recipes-kernel/trace-cmd/trace-cmd_git.bb                     | 2 --
>  meta/recipes-support/aspell/aspell_0.60.6.1.bb                     | 1 -
>  meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb                  | 1 -
>  meta/recipes-support/nss/nss_3.19.2.bb                             | 1 -
>  meta/recipes-support/p11-kit/p11-kit_0.22.1.bb                     | 2 +-
>  59 files changed, 10 insertions(+), 103 deletions(-)
>
> diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
> b/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
> index 857bd07..6a1c366 100644
> --- a/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
> +++ b/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
> @@ -9,5 +9,4 @@ SRC_URI[sha256sum] =
> "79e6ae441278e178c07501d492394ed2c0326fdb66894f6d040ec811b0
>
>  PR = "r1"
>
> -FILES_${PN}-dbg += "*/udev/.debug */*/udev/.debug"
>  FILES_${PN} += "*/udev */*/udev"
> diff --git a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
> b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
> index 8d35187..27cb3db 100644
> --- a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
> +++ b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
> @@ -22,5 +22,4 @@ do_configure_prepend () {
>  }
>
>  FILES_${PN} += "${libdir}/${BPN}/*"
> -FILES_${PN}-dbg += "${libdir}/${BPN}/bin/.debug \
> -                   ${datadir}/doc/pm-utils/README.debugging"
> +FILES_${PN}-dbg += "${datadir}/doc/pm-utils/README.debugging"
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc
> b/meta/recipes-bsp/u-boot/u-boot.inc
> index e66ffd1..41eb205 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -187,8 +187,6 @@ do_install () {
>  }
>
>  FILES_${PN} = "/boot ${sysconfdir}"
> -# Ensure the split debug part of any elf files are put into dbg
> -FILES_${PN}-dbg += "/boot/.debug"
>
>  do_deploy () {
>      if [ "x${UBOOT_CONFIG}" != "x" ]
> diff --git a/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
> b/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
> index 0d42b90..604ee9e 100644
> --- a/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
> +++ b/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
> @@ -26,7 +26,6 @@ S = "${WORKDIR}/avahi-${PV}"
>  PACKAGES = "${PN} ${PN}-utils ${PN}-dbg ${PN}-dev ${PN}-staticdev
> ${PN}-doc python-avahi avahi-discover avahi-discover-standalone"
>
>  FILES_${PN} = "${libdir}/libavahi-ui*.so.*"
> -FILES_${PN}-dbg += "${libdir}/.debug/libavah-ui*"
>  FILES_${PN}-dev += "${libdir}/libavahi-ui${SOLIBSDEV}"
>  FILES_${PN}-staticdev += "${libdir}/libavahi-ui.a"
>
> diff --git a/meta/recipes-connectivity/connman/connman.inc
> b/meta/recipes-connectivity/connman/connman.inc
> index 6324d7a..ba2ca24 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -154,8 +154,6 @@ FILES_${PN} = "${bindir}/* ${sbindir}/*
> ${libexecdir}/* ${libdir}/lib*.so.* \
>              ${base_bindir}/* ${base_sbindir}/* ${base_libdir}/*.so*
> ${datadir}/${PN} \
>              ${datadir}/dbus-1/system-services/*"
>
> -FILES_${PN}-dbg += "${libdir}/connman/*/.debug"
> -
>  FILES_${PN}-dev += "${libdir}/connman/*/*.la"
>
>  PACKAGES =+ "${PN}-vpn"
> diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc
> b/meta/recipes-connectivity/iproute2/iproute2.inc
> index 6a08114..9ce157b 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2.inc
> +++ b/meta/recipes-connectivity/iproute2/iproute2.inc
> @@ -36,8 +36,6 @@ PACKAGES =+ "${PN}-tc"
>  FILES_${PN}-tc = "${base_sbindir}/tc* \
>                    ${libdir}/tc/*.so"
>
> -FILES_${PN}-dbg += "${libdir}/tc/.debug"
> -
>  ALTERNATIVE_${PN} = "ip"
>  ALTERNATIVE_TARGET[ip] = "${base_sbindir}/ip.${BPN}"
>  ALTERNATIVE_LINK_NAME[ip] = "${base_sbindir}/ip"
> diff --git a/meta/recipes-connectivity/neard/neard_0.15.bb
> b/meta/recipes-connectivity/neard/neard_0.15.bb
> index f962310..93bddb3 100644
> --- a/meta/recipes-connectivity/neard/neard_0.15.bb
> +++ b/meta/recipes-connectivity/neard/neard_0.15.bb
> @@ -43,7 +43,6 @@ do_install_append() {
>  PACKAGES =+ "${PN}-tests"
>
>  FILES_${PN}-tests = "${libdir}/${BPN}/*-test"
> -FILES_${PN}-dbg += "${libexecdir}/nfc/.debug ${libdir}/${BPN}/*/.debug"
>
>  RDEPENDS_${PN} = "dbus python python-dbus python-pygobject"
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2e.bb
> b/meta/recipes-connectivity/openssl/openssl_1.0.2e.bb
> index c4e590f..d2a265a 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2e.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2e.bb
> @@ -43,13 +43,8 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
>  SRC_URI[md5sum] = "5262bfa25b60ed9de9f28d5d52d77fc5"
>  SRC_URI[sha256sum] =
> "e23ccafdb75cfcde782da0151731aa2185195ac745eea3846133f2e05c0e0bff"
>
> -PACKAGES =+ " \
> -       ${PN}-engines \
> -       ${PN}-engines-dbg \
> -       "
> -
> +PACKAGES =+ "${PN}-engines"
>  FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
> -FILES_${PN}-engines-dbg = "${libdir}/ssl/engines/.debug"
>
>  # The crypto_use_bigint patch means that perl's bignum module needs to be
>  # installed, but some distributions (for example Fedora 23) don't ship it
> by
> diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
> b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
> index adc38e1..5f06034 100644
> --- a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
> +++ b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
> @@ -78,7 +78,6 @@ do_install_append () {
>  CONFFILES_${PN} = "${sysconfdir}/ppp/pap-secrets
> ${sysconfdir}/ppp/chap-secrets ${sysconfdir}/ppp/options"
>  PACKAGES =+ "${PN}-oa ${PN}-oe ${PN}-radius ${PN}-winbind ${PN}-minconn
> ${PN}-password ${PN}-l2tp ${PN}-tools"
>  FILES_${PN}        = "${sysconfdir} ${bindir} ${sbindir}/chat
> ${sbindir}/pppd ${systemd_unitdir}/system/ppp@.service"
> -FILES_${PN}-dbg += "${libdir}/pppd/${PV}/.debug"
>  FILES_${PN}-oa       = "${libdir}/pppd/${PV}/pppoatm.so"
>  FILES_${PN}-oe       = "${sbindir}/pppoe-discovery
> ${libdir}/pppd/${PV}/rp-pppoe.so"
>  FILES_${PN}-radius   = "${libdir}/pppd/${PV}/radius.so
> ${libdir}/pppd/${PV}/radattr.so ${libdir}/pppd/${PV}/radrealms.so"
> diff --git a/meta/recipes-connectivity/wireless-tools/
> wireless-tools_30.pre9.bb b/meta/recipes-connectivity/wireless-tools/
> wireless-tools_30.pre9.bb
> index b6f33e5..c3b8f66 100644
> --- a/meta/recipes-connectivity/wireless-tools/wireless-tools_30.pre9.bb
> +++ b/meta/recipes-connectivity/wireless-tools/wireless-tools_30.pre9.bb
> @@ -39,11 +39,8 @@ do_install() {
>         install -m 0755 ifrename ${D}${sbindir}/ifrename
>  }
>
> -PACKAGES = "libiw-dbg ifrename-dbg ${PN}-dbg \
> -libiw libiw-dev libiw-doc ifrename-doc ifrename ${PN} ${PN}-doc"
> +PACKAGES = "libiw libiw-dev libiw-doc ifrename-doc ifrename ${PN}
> ${PN}-doc ${PN}-dbg"
>
> -FILES_libiw-dbg = "${libdir}/.debug/*.so.*"
> -FILES_ifrename-dbg = "${sbindir}/.debug/ifrename"
>  FILES_libiw = "${libdir}/*.so.*"
>  FILES_libiw-dev = "${libdir}/*.a ${libdir}/*.so ${includedir}"
>  FILES_libiw-doc = "${mandir}/man7"
> diff --git a/meta/recipes-core/dbus/dbus-glib.inc
> b/meta/recipes-core/dbus/dbus-glib.inc
> index 1c47873..f8c0ebe 100644
> --- a/meta/recipes-core/dbus/dbus-glib.inc
> +++ b/meta/recipes-core/dbus/dbus-glib.inc
> @@ -26,7 +26,7 @@ EXTRA_OECONF =
> "--with-introspect-xml=${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-in
>
>  --with-dbus-binding-tool=${STAGING_BINDIR_NATIVE}/dbus-binding-tool"
>  EXTRA_OECONF_class-native =
> "--with-introspect-xml=${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml"
>
> -PACKAGES += "${PN}-bash-completion ${PN}-tests-dbg ${PN}-tests"
> +PACKAGES += "${PN}-bash-completion ${PN}-tests"
>
>  FILES_${PN} = "${libdir}/lib*${SOLIBS}"
>  FILES_${PN}-bash-completion =
> "${sysconfdir}/bash_completion.d/dbus-bash-completion.sh \
> diff --git a/meta/recipes-core/glib-networking/glib-networking_2.46.1.bb
> b/meta/recipes-core/glib-networking/glib-networking_2.46.1.bb
> index c980a09..70be87c 100644
> --- a/meta/recipes-core/glib-networking/glib-networking_2.46.1.bb
> +++ b/meta/recipes-core/glib-networking/glib-networking_2.46.1.bb
> @@ -25,6 +25,5 @@ EXTRA_OECONF = "--without-gnome-proxy"
>  inherit gnomebase gettext upstream-version-is-even
>
>  FILES_${PN} += "${libdir}/gio/modules/libgio*.so
> ${datadir}/dbus-1/services/"
> -FILES_${PN}-dbg += "${libdir}/gio/modules/.debug/"
>  FILES_${PN}-dev += "${libdir}/gio/modules/libgio*.la"
>  FILES_${PN}-staticdev += "${libdir}/gio/modules/libgio*.a"
> diff --git a/meta/recipes-core/libcgroup/libcgroup_0.41.bb
> b/meta/recipes-core/libcgroup/libcgroup_0.41.bb
> index 1bbeb4a..287aecd 100644
> --- a/meta/recipes-core/libcgroup/libcgroup_0.41.bb
> +++ b/meta/recipes-core/libcgroup/libcgroup_0.41.bb
> @@ -21,7 +21,6 @@ EXTRA_OECONF = "${@bb.utils.contains('DISTRO_FEATURES',
> 'pam', '--enable-pam-mod
>
>  PACKAGES =+ "cgroups-pam-plugin"
>  FILES_cgroups-pam-plugin = "${base_libdir}/security/pam_cgroup.so*"
> -FILES_${PN}-dbg += "${base_libdir}/security/.debug"
>  FILES_${PN}-dev += "${base_libdir}/security/*.la"
>
>  do_install_append() {
> diff --git a/meta/recipes-core/libxml/libxml2_2.9.3.bb
> b/meta/recipes-core/libxml/libxml2_2.9.3.bb
> index 20bf1e0..9c9873f 100644
> --- a/meta/recipes-core/libxml/libxml2_2.9.3.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.9.3.bb
> @@ -62,7 +62,6 @@ python populate_packages_prepend () {
>
>  PACKAGES += "${PN}-utils ${PN}-python"
>
> -FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug"
>  FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/*.a"
>  FILES_${PN}-dev += "${libdir}/xml2Conf.sh ${libdir}/cmake/*"
>  FILES_${PN}-utils += "${bindir}/*"
> diff --git a/meta/recipes-core/uclibc/uclibc-package.inc
> b/meta/recipes-core/uclibc/uclibc-package.inc
> index c1815f9..439f84e 100644
> --- a/meta/recipes-core/uclibc/uclibc-package.inc
> +++ b/meta/recipes-core/uclibc/uclibc-package.inc
> @@ -1,6 +1,6 @@
>  # Ensure the uclibc-dev package is processed before uclibc-staticdev to
> allow
>  # *_nonshared.a libraries to be packaged in the uclibc-dev package.
> -PACKAGES = "ldd uclibc-utils-dbg uclibc-utils uclibc-gconv
> uclibc-thread-db uclibc-argp uclibc-backtrace uclibc-libcrypt
> uclibc-libintl uclibc-libnsl uclibc-libresolv uclibc-libm uclibc-libdl
> uclibc-libutil uclibc-libpthread uclibc-librt ${PN}-dbg ${PN}-dev
> ${PN}-staticdev ${PN}-doc ${PN}"
> +PACKAGES = "ldd uclibc-utils uclibc-gconv uclibc-thread-db uclibc-argp
> uclibc-backtrace uclibc-libcrypt uclibc-libintl uclibc-libnsl
> uclibc-libresolv uclibc-libm uclibc-libdl uclibc-libutil uclibc-libpthread
> uclibc-librt ${PN}-dbg ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}"
>
>  FILES_uclibc-libcrypt = "${base_libdir}/libcrypt*.so.*
> ${base_libdir}/libcrypt-*.so"
>  FILES_uclibc-libintl = "${base_libdir}/libintl*.so.*
> ${base_libdir}/libintl-*.so"
> @@ -14,7 +14,6 @@ FILES_uclibc-librt = "${base_libdir}/librt*.so.*
> ${base_libdir}/librt-*.so"
>
>  FILES_ldd = "${bindir}/ldd"
>  FILES_uclibc-utils = "${bindir} ${sbindir}"
> -FILES_uclibc-utils-dbg += "${bindir}/.debug ${sbindir}/.debug"
>  FILES_uclibc-gconv = "${libdir}/gconv"
>  FILES_uclibc-thread-db = "${base_libdir}/libthread_db*"
>  FILES_uclibc-argp = "${base_libdir}/libuargp-*.so
> ${base_libdir}/libuargp*.so.*"
> diff --git a/meta/recipes-core/util-linux/util-linux.inc
> b/meta/recipes-core/util-linux/util-linux.inc
> index 318c74b..cf321c6 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -65,7 +65,6 @@ FILES_${PN}-bash-completion +=
> "${datadir}/bash-completion"
>  FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
>
>  FILES_${PN}-dev += "${libdir}/${PYTHON_DIR}/dist-packages/libmount/
> pylibmount.la"
> -FILES_${PN}-dbg +=
> "${libdir}/${PYTHON_DIR}/dist-packages/libmount/.debug/"
>
>  FILES_util-linux-agetty = "${base_sbindir}/agetty"
>  FILES_util-linux-fdisk = "${base_sbindir}/fdisk.${BPN}"
> diff --git a/meta/recipes-devtools/apt/apt.inc
> b/meta/recipes-devtools/apt/apt.inc
> index 8e267c3..312c6a9 100644
> --- a/meta/recipes-devtools/apt/apt.inc
> +++ b/meta/recipes-devtools/apt/apt.inc
> @@ -28,5 +28,3 @@ do_configure_prepend() {
>      rm -rf ${S}/buildlib/config.sub
>      rm -rf ${S}/buildlib/config.guess
>  }
> -
> -FILES_${PN}-dbg += "${libdir}/apt/methods/.debug/"
> diff --git a/meta/recipes-devtools/binutils/binutils.inc
> b/meta/recipes-devtools/binutils/binutils.inc
> index a304867..79e2a12 100644
> --- a/meta/recipes-devtools/binutils/binutils.inc
> +++ b/meta/recipes-devtools/binutils/binutils.inc
> @@ -61,8 +61,6 @@ python do_package_prepend() {
>          d.setVarFlag('ALTERNATIVE_LINK_NAME', alt, bindir + "/" + alt)
>  }
>
> -# FILES_${PN}-dbg = "${prefix}/${TARGET_SYS}/bin/.debug
> ${prefix}/${libdir}/.debug"
> -
>  B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
>
>  EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
> diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.7.bb
> b/meta/recipes-devtools/bootchart2/bootchart2_0.14.7.bb
> index 8ca26ef..7586ff2 100644
> --- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.7.bb
> +++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.7.bb
> @@ -150,7 +150,6 @@ FILES_bootchartd-stop-initscript +=
> "${sysconfdir}/init.d ${sysconfdir}/rc*.d"
>  FILES_${PN} += "${base_libdir}/bootchart/bootchart-collector"
>  FILES_${PN} += "${base_libdir}/bootchart/tmpfs"
>  FILES_${PN} += "${libdir}"
> -FILES_${PN}-dbg += "${base_libdir}/bootchart/.debug"
>  FILES_${PN}-doc += "${datadir}/docs"
>
>  RCONFLICTS_${PN} = "bootchart"
> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> index c987ccb..a7b5d71 100644
> --- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> +++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> @@ -58,10 +58,9 @@ DEPENDS = "gcc-runtime"
>
>  BBCLASSEXTEND = "nativesdk"
>
> -PACKAGES = "${PN}"
> +PACKAGES = "${PN} ${PN}-dbg"
>  PACKAGES += "libasan libubsan liblsan libtsan"
>  PACKAGES += "libasan-dev libubsan-dev liblsan-dev libtsan-dev"
> -PACKAGES += "libasan-dbg libubsan-dbg liblsan-dbg libtsan-dbg"
>  PACKAGES += "libasan-staticdev libubsan-staticdev liblsan-staticdev
> libtsan-staticdev"
>
>  RDEPENDS_libasan += "libstdc++"
> @@ -84,7 +83,6 @@ do_package_write_rpm[depends] +=
> "virtual/${MLPREFIX}${TARGET_PREFIX}compilerlib
>  COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm).*-linux'
>
>  FILES_libasan += "${libdir}/libasan.so.*"
> -FILES_libasan-dbg += "${libdir}/.debug/libasan.so.*"
>  FILES_libasan-dev += "\
>      ${libdir}/libasan_preinit.o \
>      ${libdir}/libasan.so \
> @@ -93,7 +91,6 @@ FILES_libasan-dev += "\
>  FILES_libasan-staticdev += "${libdir}/libasan.a"
>
>  FILES_libubsan += "${libdir}/libubsan.so.*"
> -FILES_libubsan-dbg += "${libdir}/.debug/libubsan.so.*"
>  FILES_libubsan-dev += "\
>      ${libdir}/libubsan.so \
>      ${libdir}/libubsan.la \
> @@ -101,7 +98,6 @@ FILES_libubsan-dev += "\
>  FILES_libubsan-staticdev += "${libdir}/libubsan.a"
>
>  FILES_liblsan += "${libdir}/liblsan.so.*"
> -FILES_liblsan-dbg += "${libdir}/.debug/liblsan.so.*"
>  FILES_liblsan-dev += "\
>      ${libdir}/liblsan.so \
>      ${libdir}/liblsan.la \
> @@ -109,7 +105,6 @@ FILES_liblsan-dev += "\
>  FILES_liblsan-staticdev += "${libdir}/liblsan.a"
>
>  FILES_libtsan += "${libdir}/libtsan.so.*"
> -FILES_libtsan-dbg += "${libdir}/.debug/libtsan.so.*"
>  FILES_libtsan-dev += "\
>      ${libdir}/libtsan.so \
>      ${libdir}/libtsan.la \
> diff --git a/meta/recipes-devtools/gcc/libgcc.inc
> b/meta/recipes-devtools/gcc/libgcc.inc
> index 95fa3f4..68377869 100644
> --- a/meta/recipes-devtools/gcc/libgcc.inc
> +++ b/meta/recipes-devtools/gcc/libgcc.inc
> @@ -21,8 +21,6 @@ FILES_${PN}-dev = "\
>      ${libdir}/${TARGET_SYS}/${BINV}* \
>  "
>
> -FILES_${PN}-dbg += "${base_libdir}/.debug/"
> -
>  LIBGCCBUILDTREENAME = "gcc-build-internal-"
>
>  do_package[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
> diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
> b/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
> index 9ccd417..9561a59 100644
> --- a/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
> +++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
> @@ -31,7 +31,5 @@ do_compile_class-native() {
>         cpan_do_compile
>  }
>
> -FILES_${PN}-dbg +=
> "${libdir}/perl/vendor_perl/*/auto/XML/Parser/Expat/.debug/"
> -
>  BBCLASSEXTEND="native"
>
> diff --git a/meta/recipes-devtools/python/python-smartpm_git.bb
> b/meta/recipes-devtools/python/python-smartpm_git.bb
> index d6c378b..139bfd5 100644
> --- a/meta/recipes-devtools/python/python-smartpm_git.bb
> +++ b/meta/recipes-devtools/python/python-smartpm_git.bb
> @@ -128,8 +128,6 @@ RDEPENDS_${PN}-interface-gtk = "gtk+
> ${PN}-interface-images"
>
>  FILES_smartpm = "${bindir}/smart"
>
> -FILES_${PN}-dbg +=
> "${libdir}/python*/site-packages/smart/backends/rpm/.debug"
> -
>  FILES_${PN}-backend-rpm =
> "${libdir}/python*/site-packages/smart/backends/rpm"
>
>  FILES_${PN}-interface-qt4 =
> "${libdir}/python*/site-packages/smart/interfaces/qt4"
> diff --git a/meta/recipes-devtools/python/python3_3.5.0.bb
> b/meta/recipes-devtools/python/python3_3.5.0.bb
> index 7f6fbdb..a5663a1 100644
> --- a/meta/recipes-devtools/python/python3_3.5.0.bb
> +++ b/meta/recipes-devtools/python/python3_3.5.0.bb
> @@ -211,9 +211,6 @@ PACKAGES =+ "libpython3 libpython3-staticdev"
>  FILES_libpython3 = "${libdir}/libpython*.so.*"
>  FILES_libpython3-staticdev +=
> "${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}/libpython${PYTHON_BINABI}.a"
>
> -# catch debug extensions (isn't that already in python-core-dbg?)
> -FILES_${PN}-dbg += "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/.debug"
> -
>  # catch all the rest (unsorted)
>  PACKAGES += "${PN}-misc"
>  RDEPENDS_${PN}-misc += "${PN}-core"
> diff --git a/meta/recipes-devtools/python/python_2.7.9.bb
> b/meta/recipes-devtools/python/python_2.7.9.bb
> index f585a53..0287c19 100644
> --- a/meta/recipes-devtools/python/python_2.7.9.bb
> +++ b/meta/recipes-devtools/python/python_2.7.9.bb
> @@ -151,9 +151,6 @@ RRECOMMENDS_${PN}-crypt = "openssl"
>  PACKAGES =+ "lib${BPN}2"
>  FILES_lib${BPN}2 = "${libdir}/libpython*.so.*"
>
> -# catch debug extensions (isn't that already in python-core-dbg?)
> -FILES_${PN}-dbg += "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/.debug"
> -
>  # catch all the rest (unsorted)
>  PACKAGES += "${PN}-misc"
>  FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN}"
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
> b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
> index 0b38c3a..2747a24 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
> @@ -224,7 +224,7 @@ CFLAGS_append = " -DRPM_VENDOR_WINDRIVER
> -DRPM_VENDOR_POKY -DRPM_VENDOR_OE"
>
>  LDFLAGS_append_libc-uclibc = "-lrt -lpthread"
>
> -PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev
> ${PN}-staticdev ${PN}-common ${PN}-build python-rpm-dbg
> python-rpm-staticdev python-rpm-dev python-rpm perl-module-rpm
> perl-module-rpm-dev ${PN}-locale"
> +PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev
> ${PN}-staticdev ${PN}-common ${PN}-build python-rpm-staticdev
> python-rpm-dev python-rpm perl-module-rpm perl-module-rpm-dev ${PN}-locale"
>
>  SOLIBS = "5.4.so"
>
> diff --git a/meta/recipes-devtools/ruby/ruby_2.2.2.bb
> b/meta/recipes-devtools/ruby/ruby_2.2.2.bb
> index 78c943c..9b807a7 100644
> --- a/meta/recipes-devtools/ruby/ruby_2.2.2.bb
> +++ b/meta/recipes-devtools/ruby/ruby_2.2.2.bb
> @@ -34,9 +34,4 @@ do_install() {
>  FILES_${PN} += "${datadir}/rubygems \
>                  ${datadir}/ri"
>
> -FILES_${PN}-dbg += "${libdir}/ruby/*/.debug \
> -                    ${libdir}/ruby/*/*/.debug \
> -                    ${libdir}/ruby/*/*/*/.debug \
> -                    ${libdir}/ruby/*/*/*/*/.debug"
> -
>  BBCLASSEXTEND = "native"
> diff --git a/meta/recipes-devtools/vala/vala.inc
> b/meta/recipes-devtools/vala/vala.inc
> index c98244b..43f9bb3 100644
> --- a/meta/recipes-devtools/vala/vala.inc
> +++ b/meta/recipes-devtools/vala/vala.inc
> @@ -15,4 +15,3 @@ inherit autotools pkgconfig upstream-version-is-even
>
>  FILES_${PN} += "${datadir}/${BPN}-${SHRT_VER}/vapi
> ${libdir}/${BPN}-${SHRT_VER}/"
>  FILES_${PN}-doc += "${datadir}/devhelp"
> -FILES_${PN}-dbg += "${libdir}/${BPN}-${SHRT_VER}/.debug"
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
> b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
> index c386a19..c38a07b 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
> @@ -50,8 +50,6 @@ do_install_append () {
>
>  RDEPENDS_${PN} += "perl"
>
> -FILES_${PN}-dbg += "${libdir}/${PN}/*/.debug/*"
> -
>  # valgrind needs debug information for ld.so at runtime in order to
>  # redirect functions like strlen.
>  RRECOMMENDS_${PN} += "${TCLIBC}-dbg"
> diff --git a/meta/recipes-extended/cracklib/cracklib_2.9.5.bb
> b/meta/recipes-extended/cracklib/cracklib_2.9.5.bb
> index 35817c9..8c9063e 100644
> --- a/meta/recipes-extended/cracklib/cracklib_2.9.5.bb
> +++ b/meta/recipes-extended/cracklib/cracklib_2.9.5.bb
> @@ -45,7 +45,6 @@ BBCLASSEXTEND = "native nativesdk"
>  FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/cracklib.py \
>         ${PYTHON_SITEPACKAGES_DIR}/_cracklib.so \
>      "
> -FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug/_cracklib.so"
>  FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/_cracklib.a \
>         ${PYTHON_SITEPACKAGES_DIR}/_cracklib.la \
>      "
> diff --git a/meta/recipes-extended/gawk/gawk_3.1.5.bb
> b/meta/recipes-extended/gawk/gawk_3.1.5.bb
> index c7af4a9..bc188fa 100644
> --- a/meta/recipes-extended/gawk/gawk_3.1.5.bb
> +++ b/meta/recipes-extended/gawk/gawk_3.1.5.bb
> @@ -28,7 +28,6 @@ PACKAGES += "gawk-common pgawk"
>  FILES_${PN} = "${bindir}/gawk* ${bindir}/igawk"
>  FILES_gawk-common += "${datadir}/awk/* ${libdir}/gawk/awk/*"
>  FILES_pgawk = "${bindir}/pgawk*"
> -FILES_${PN}-dbg += "${libdir}/gawk/awk/.debug"
>
>  ALTERNATIVE_${PN} = "awk"
>  ALTERNATIVE_TARGET[awk] = "${bindir}/gawk"
> diff --git a/meta/recipes-extended/gawk/gawk_4.1.3.bb
> b/meta/recipes-extended/gawk/gawk_4.1.3.bb
> index d1a88e4..6ca7f3e 100644
> --- a/meta/recipes-extended/gawk/gawk_4.1.3.bb
> +++ b/meta/recipes-extended/gawk/gawk_4.1.3.bb
> @@ -26,7 +26,6 @@ inherit autotools gettext texinfo update-alternatives
>
>  FILES_${PN} += "${datadir}/awk"
>  FILES_${PN}-dev += "${libdir}/${BPN}/*.la"
> -FILES_${PN}-dbg += "${libexecdir}/awk/.debug"
>
>  ALTERNATIVE_${PN} = "awk"
>  ALTERNATIVE_TARGET[awk] = "${bindir}/gawk"
> diff --git a/meta/recipes-extended/iptables/iptables_1.4.21.bb
> b/meta/recipes-extended/iptables/iptables_1.4.21.bb
> index deea5e5..4118f54 100644
> --- a/meta/recipes-extended/iptables/iptables_1.4.21.bb
> +++ b/meta/recipes-extended/iptables/iptables_1.4.21.bb
> @@ -17,7 +17,6 @@ RRECOMMENDS_${PN} = "kernel-module-x-tables \
>                       kernel-module-nf-nat \
>                       kernel-module-ipt-masquerade"
>  FILES_${PN} =+ "${libdir}/xtables/ ${datadir}/xtables"
> -FILES_${PN}-dbg =+ "${libdir}/xtables/.debug"
>
>  SRC_URI = "
> http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
>
> file://types.h-add-defines-that-are-required-for-if_packet.patch \
> diff --git a/meta/recipes-extended/libsolv/libsolv_git.bb
> b/meta/recipes-extended/libsolv/libsolv_git.bb
> index 2011487..78a2d51 100644
> --- a/meta/recipes-extended/libsolv/libsolv_git.bb
> +++ b/meta/recipes-extended/libsolv/libsolv_git.bb
> @@ -18,11 +18,10 @@ inherit cmake
>
>  EXTRA_OECMAKE = "-DLIB=${baselib}"
>
> -PACKAGES =+ "${PN}-tools ${PN}ext ${PN}ext-dbg"
> +PACKAGES =+ "${PN}-tools ${PN}ext"
>
>  FILES_${PN}-dev += "${datadir}/cmake/Modules/FindLibSolv.cmake"
>  FILES_${PN}-tools = "${bindir}/*"
>  FILES_${PN}ext = "${libdir}/${PN}ext.so.*"
> -FILES_${PN}ext-dbg = "${libdir}/.debug/${PN}ext.so.*"
>
>  BBCLASSEXTEND =+ "native nativesdk"
> diff --git a/meta/recipes-extended/libuser/libuser_0.62.bb
> b/meta/recipes-extended/libuser/libuser_0.62.bb
> index c4ed459..4caa8a1 100644
> --- a/meta/recipes-extended/libuser/libuser_0.62.bb
> +++ b/meta/recipes-extended/libuser/libuser_0.62.bb
> @@ -25,6 +25,5 @@ EXTRA_OEMAKE =
> "PYTHON_CPPFLAGS=-I${STAGING_INCDIR}/${PYTHON_DIR}"
>
>  PACKAGES += "${PN}-python "
>
> -FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug"
>  FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
>
> diff --git a/meta/recipes-extended/mc/mc_4.7.5.2.bb
> b/meta/recipes-extended/mc/mc_4.7.5.2.bb
> index b47eb02..b38964d 100644
> --- a/meta/recipes-extended/mc/mc_4.7.5.2.bb
> +++ b/meta/recipes-extended/mc/mc_4.7.5.2.bb
> @@ -19,8 +19,6 @@ inherit autotools gettext pkgconfig
>
>  EXTRA_OECONF = "--with-screen=ncurses --without-gpm-mouse --without-x
> --without-samba"
>
> -FILES_${PN}-dbg += "${libexecdir}/mc/.debug/"
> -
>  do_install_append () {
>         sed -i -e '1s,#!.*perl,#!${bindir}/env perl,'
> ${D}${libexecdir}/mc/extfs.d/*
>         sed -i -e '1s,#!.*python,#!${bindir}/env python,'
> ${D}${libexecdir}/mc/extfs.d/*
> diff --git a/meta/recipes-extended/mc/mc_4.8.15.bb
> b/meta/recipes-extended/mc/mc_4.8.15.bb
> index ed53760..6c3a16a 100644
> --- a/meta/recipes-extended/mc/mc_4.8.15.bb
> +++ b/meta/recipes-extended/mc/mc_4.8.15.bb
> @@ -22,8 +22,6 @@ PACKAGECONFIG[sftp] =
> "--enable-vfs-sftp,--disable-vfs-sftp,libssh2,"
>
>  EXTRA_OECONF = "--with-screen=ncurses --without-gpm-mouse --without-x"
>
> -FILES_${PN}-dbg += "${libexecdir}/mc/.debug/"
> -
>  do_install_append () {
>         sed -i -e '1s,#!.*perl,#!${bindir}/env perl,'
> ${D}${libexecdir}/mc/extfs.d/*
>         sed -i -e '1s,#!.*python,#!${bindir}/env python,'
> ${D}${libexecdir}/mc/extfs.d/*
> diff --git a/meta/recipes-extended/newt/libnewt-python_0.52.18.bb
> b/meta/recipes-extended/newt/libnewt-python_0.52.18.bb
> index 94a41a3..ba04757 100644
> --- a/meta/recipes-extended/newt/libnewt-python_0.52.18.bb
> +++ b/meta/recipes-extended/newt/libnewt-python_0.52.18.bb
> @@ -24,6 +24,5 @@ do_install () {
>  PACKAGES_remove = "whiptail"
>
>  FILES_${PN} = "${PYTHON_SITEPACKAGES_DIR}/*"
> -FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug/"
>
>  BBCLASSEXTEND = "native"
> diff --git a/meta/recipes-extended/slang/slang_2.2.4.bb
> b/meta/recipes-extended/slang/slang_2.2.4.bb
> index e33e868..bfaa9a5 100644
> --- a/meta/recipes-extended/slang/slang_2.2.4.bb
> +++ b/meta/recipes-extended/slang/slang_2.2.4.bb
> @@ -48,7 +48,6 @@ do_install() {
>  }
>
>  FILES_${PN} += "${libdir}/${BPN}/v2/modules/ ${datadir}/slsh/"
> -FILES_${PN}-dbg += "${libdir}/${BPN}/v2/modules/.debug"
>
>  PARALLEL_MAKE = ""
>
> diff --git a/meta/recipes-extended/sysstat/sysstat.inc
> b/meta/recipes-extended/sysstat/sysstat.inc
> index 85be902..a954bba 100644
> --- a/meta/recipes-extended/sysstat/sysstat.inc
> +++ b/meta/recipes-extended/sysstat/sysstat.inc
> @@ -51,7 +51,6 @@ pkg_postinst_${PN} () {
>
>
>  FILES_${PN} += "${libdir}/sa"
> -FILES_${PN}-dbg += "${libdir}/sa/.debug/"
>
>  TARGET_CC_ARCH += "${LDFLAGS}"
>  LDFLAGS_append_libc-uclibc = " -lintl"
> diff --git a/meta/recipes-gnome/epiphany/epiphany_3.16.3.bb
> b/meta/recipes-gnome/epiphany/epiphany_3.16.3.bb
> index 3ff35fc..09633a6 100644
> --- a/meta/recipes-gnome/epiphany/epiphany_3.16.3.bb
> +++ b/meta/recipes-gnome/epiphany/epiphany_3.16.3.bb
> @@ -21,7 +21,6 @@ do_configure_prepend() {
>  }
>
>  FILES_${PN} += "${datadir}/appdata ${datadir}/dbus-1
> ${datadir}/gnome-shell/search-providers"
> -FILES_${PN}-dbg +=
> "${libdir}/epiphany/*/web-extensions/.debug/libephywebextension.so"
>  RDEPENDS_${PN} = "iso-codes adwaita-icon-theme"
>  RRECOMMENDS_${PN} = "ca-certificates"
>
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.1.bb
> b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.1.bb
> index dc05a03..084fe36 100644
> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.1.bb
> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.1.bb
> @@ -58,12 +58,6 @@ FILES_${PN}-dev += " \
>         ${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders/*.la \
>  "
>
> -FILES_${PN}-dbg += " \
> -       ${libdir}/.debug/* \
> -       ${libdir}/gdk-pixbuf-2.0/.debug/* \
> -       ${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders/.debug/* \
> -"
> -
>  PACKAGES_DYNAMIC += "^gdk-pixbuf-loader-.*"
>  PACKAGES_DYNAMIC_class-native = ""
>
> diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
> b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
> index 17fdafa..cd1df1a 100644
> --- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
> +++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
> @@ -54,7 +54,6 @@ FILES_${PN} += "${libdir}/GConf/* \
>                  ${datadir}/dbus-1/services/*.service \
>                  ${datadir}/dbus-1/system-services/*.service \
>                 "
> -FILES_${PN}-dbg += "${libdir}/*/*/.debug"
>  FILES_${PN}-dev += "${datadir}/sgml/gconf/gconf-1.0.dtd"
>
>  BBCLASSEXTEND = "native"
> diff --git a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
> b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
> index aaf8cab..c0ac911 100644
> --- a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
> +++ b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
> @@ -24,7 +24,6 @@ RDEPENDS_gtk-theme-clearlooks = "gtk-engine-clearlooks"
>
>  FILES_${PN} = ""
>  FILES_${PN}-dev += "${libdir}/gtk-2.0/*/engines/*.la"
> -FILES_${PN}-dbg += "${libdir}/gtk-2.0/*/engines/.debug"
>  FILES_${PN}-schemas = "${datadir}/gtk-engines/*.xml"
>
>  CFLAGS_prepend = "-DHAVE_ANIMATION "
> diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.11.bb
> b/meta/recipes-gnome/librsvg/librsvg_2.40.11.bb
> index 3ce1e55..d57c69d 100644
> --- a/meta/recipes-gnome/librsvg/librsvg_2.40.11.bb
> +++ b/meta/recipes-gnome/librsvg/librsvg_2.40.11.bb
> @@ -38,7 +38,6 @@ do_install_append() {
>
>  PACKAGES =+ "librsvg-gtk rsvg"
>  FILES_${PN} = "${libdir}/*.so.*"
> -FILES_${PN}-dbg += "${libdir}/gdk-pixbuf-2.0/*/loaders/.debug"
>  FILES_rsvg = "${bindir}/rsvg* \
>               ${datadir}/pixmaps/svg-viewer.svg \
>               ${datadir}/themes"
> diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.1.2.bb
> b/meta/recipes-graphics/harfbuzz/harfbuzz_1.1.2.bb
> index f34a647..db1e578 100644
> --- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.1.2.bb
> +++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.1.2.bb
> @@ -25,10 +25,9 @@ EXTRA_OECONF = "--with-glib --with-freetype
> --with-cairo --without-graphite2"
>  PACKAGECONFIG ??= "icu"
>  PACKAGECONFIG[icu] = "--with-icu,--without-icu,icu"
>
> -PACKAGES =+ "${PN}-icu ${PN}-icu-dbg ${PN}-icu-dev"
> +PACKAGES =+ "${PN}-icu ${PN}-icu-dev"
>
>  FILES_${PN}-icu = "${libdir}/libharfbuzz-icu.so.*"
> -FILES_${PN}-icu-dbg = "${libdir}/.debug/libharfbuzz-icu.so*"
>  FILES_${PN}-icu-dev = "${libdir}/libharfbuzz-icu.la \
>                         ${libdir}/libharfbuzz-icu.so \
>                         ${libdir}/pkgconfig/harfbuzz-icu.pc \
> diff --git a/meta/recipes-graphics/piglit/piglit_git.bb
> b/meta/recipes-graphics/piglit/piglit_git.bb
> index 0d825c9..e0bd1fe 100644
> --- a/meta/recipes-graphics/piglit/piglit_git.bb
> +++ b/meta/recipes-graphics/piglit/piglit_git.bb
> @@ -28,8 +28,6 @@ do_configure_prepend() {
>     fi
>  }
>
> -FILES_${PN}-dbg += "${libdir}/piglit/*/.debug/"
> -
>  RDEPENDS_${PN} = "waffle python python-mako python-json python-subprocess
> \
>         python-argparse python-importlib python-unixadmin \
>         python-multiprocessing python-textutils python-netserver
> python-shell \
> diff --git a/meta/recipes-graphics/tslib/tslib_1.1.bb
> b/meta/recipes-graphics/tslib/tslib_1.1.bb
> index 8e304a6..b0264c3 100644
> --- a/meta/recipes-graphics/tslib/tslib_1.1.bb
> +++ b/meta/recipes-graphics/tslib/tslib_1.1.bb
> @@ -46,7 +46,6 @@ DEBIAN_NOAUTONAME_tslib-calibrate = "1"
>  RDEPENDS_${PN} = "tslib-conf"
>  RRECOMMENDS_${PN} = "pointercal"
>
> -FILES_${PN}-dbg += "${libdir}/ts/.debug*"
>  FILES_${PN}-dev += "${libdir}/ts/*.la"
>  FILES_tslib-conf = "${sysconfdir}/ts.conf
> ${sysconfdir}/profile.d/tslib.sh ${datadir}/tslib"
>  FILES_${PN} = "${libdir}/*.so.* ${libdir}/ts/*.so*"
> diff --git a/meta/recipes-graphics/wayland/libinput_0.21.0.bb
> b/meta/recipes-graphics/wayland/libinput_0.21.0.bb
> index ac5a249..f6c5975 100644
> --- a/meta/recipes-graphics/wayland/libinput_0.21.0.bb
> +++ b/meta/recipes-graphics/wayland/libinput_0.21.0.bb
> @@ -21,4 +21,3 @@ PACKAGECONFIG[libunwind] =
> "--with-libunwind,--without-libunwind,libunwind"
>  PACKAGECONFIG[gui] = "--enable-event-gui,--disable-event-gui,cairo gtk+3"
>
>  FILES_${PN} += "${libdir}/udev/"
> -FILES_${PN}-dbg += "${libdir}/udev/.debug"
> diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> index 7ddd1c7..57a4c82 100644
> --- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> +++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> @@ -12,7 +12,6 @@ DEPENDS = "virtual/xserver xproto randrproto util-macros"
>  SRC_URI = "${XORG_MIRROR}/individual/driver/${BPN}-${PV}.tar.bz2"
>
>  FILES_${PN} += " ${libdir}/xorg/modules/drivers/*.so"
> -FILES_${PN}-dbg += " ${libdir}/xorg/modules/drivers/.debug"
>
>  inherit autotools pkgconfig distro_features_check
>  # depends on virtual/xserver
> diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc
> b/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc
> index 21b60c4..c4dba1b 100644
> --- a/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc
> +++ b/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc
> @@ -10,4 +10,3 @@ PACKAGEFUNCS =+ "add_xorg_abi_depends"
>  FILES_${PN} += " ${libdir}/xorg/modules/input/*.so \
>                   ${datadir}/X11/xorg.conf.d \
>                   "
> -FILES_${PN}-dbg += " ${libdir}/xorg/modules/input/.debug"
> diff --git a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.7.bb
> b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.7.bb
> index be59a4a..f1ca36e 100644
> --- a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.7.bb
> +++ b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.7.bb
> @@ -19,5 +19,4 @@ do_install() {
>         oe_runmake install_tests
>  }
>
> -FILES_${PN}-dbg += "${bindir}/tests_cryptodev/.debug"
>  FILES_${PN} = "${bindir}/tests_cryptodev/*"
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/
> perf.bb
> index 22bd3c8..33acb42 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -200,7 +200,6 @@ RSUGGESTS_SCRIPTING =
> "${@perf_feature_enabled('perf-scripting', '${PN}-perl ${P
>  RSUGGESTS_${PN} += "${PN}-archive ${PN}-tests ${RSUGGESTS_SCRIPTING}"
>
>  FILES_${PN} += "${libexecdir}/perf-core ${exec_prefix}/libexec/perf-core
> ${libdir}/traceevent"
> -FILES_${PN}-dbg += "${libdir}/python*/site-packages/.debug"
>  FILES_${PN}-archive = "${libdir}/perf/perf-core/perf-archive"
>  FILES_${PN}-tests = "${libdir}/perf/perf-core/tests"
>  FILES_${PN}-python = "${libdir}/python*/site-packages
> ${libdir}/perf/perf-core/scripts/python"
> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb
> b/meta/recipes-kernel/systemtap/systemtap_git.bb
> index d0dd42a..97064b8 100644
> --- a/meta/recipes-kernel/systemtap/systemtap_git.bb
> +++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
> @@ -26,5 +26,3 @@ PACKAGECONFIG[libvirt] =
> "--enable-libvirt,--disable-libvirt,libvirt"
>  inherit autotools gettext pkgconfig
>
>  BBCLASSEXTEND = "native nativesdk"
> -
> -FILES_${PN}-dbg += "${libexecdir}/systemtap/.debug"
> diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb
> b/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb
> index b1ac789..dd9a8a0 100644
> --- a/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb
> +++ b/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb
> @@ -22,8 +22,6 @@ EXTRA_OEMAKE = "\
>      NO_PYTHON=1 \
>  "
>
> -FILES_${PN}-dbg += "${libdir}/trace-cmd/plugins/.debug"
> -
>  do_compile_prepend() {
>      # Make sure the recompile is OK
>      rm -f ${B}/.*.d
> diff --git a/meta/recipes-support/aspell/aspell_0.60.6.1.bb
> b/meta/recipes-support/aspell/aspell_0.60.6.1.bb
> index 7cf17d6..5a23754 100644
> --- a/meta/recipes-support/aspell/aspell_0.60.6.1.bb
> +++ b/meta/recipes-support/aspell/aspell_0.60.6.1.bb
> @@ -17,7 +17,6 @@ PACKAGES += "libaspell libpspell aspell-utils"
>
>  RDEPENDS_${PN}-utils += "perl"
>
> -FILES_${PN}-dbg += "${libdir}/aspell-0.60/.debu*"
>  FILES_libaspell = "${libdir}/libaspell.so.* ${libdir}/aspell*"
>  FILES_aspell-utils = "${bindir}/word-list-compress
> ${bindir}/aspell-import ${bindir}/run-with-aspell ${bindir}/pre*"
>  FILES_${PN} = "${bindir}/aspell"
> diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb
> b/meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb
> index a31d5dc..5715467 100644
> --- a/meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb
> +++ b/meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb
> @@ -23,7 +23,6 @@ EXTRA_OEMAKE += "PYLIBVER='python${PYTHON_BASEVERSION}'
> PYINC='${STAGING_INCDIR}
>
>  PACKAGES += "${PN}-python"
>
> -FILES_${PN}-dbg += "${libdir}/python${PYTHON_BASEVERSION}/*/.debug"
>  FILES_${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}"
>
>  BBCLASSEXTEND = "native"
> diff --git a/meta/recipes-support/nss/nss_3.19.2.bb
> b/meta/recipes-support/nss/nss_3.19.2.bb
> index 65f3204..c51b056 100644
> --- a/meta/recipes-support/nss/nss_3.19.2.bb
> +++ b/meta/recipes-support/nss/nss_3.19.2.bb
> @@ -220,7 +220,6 @@ FILES_${PN}-dev = "\
>      ${libdir}/pkgconfig/* \
>      ${includedir}/* \
>      "
> -# FILES_${PN}-dbg is populated automatically
>
>  BBCLASSEXTEND = "native nativesdk"
>
> diff --git a/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb
> b/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb
> index 8f15894..f501372 100644
> --- a/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb
> +++ b/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb
> @@ -17,4 +17,4 @@ FILES_${PN}-dev += " \
>      ${libdir}/pkcs11/p11-kit-trust.so \
>  "
>  FILES_${PN}-dev += "${libdir}/pkcs11/*.la"
> -FILES_${PN}-dbg += "${libdir}/pkcs11/.debug"
> +
> --
> 2.1.4
>
>

--047d7bdc1c0cf86ea50526f260bd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Well that subject made no sense, fixed it locally.<div><br=
></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gm=
ail_quote">On 15 December 2015 at 16:33, Ross Burton <span dir=3D"ltr">&lt;=
<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@inte=
l.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">In some recip=
es overly-split -dbg packages were merged into PN-dbg.=C2=A0 Unless<br>
there&#39;s a very good reason, recipes should have a single -dev and -dbg =
package.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-bsp/pcmciautils/<a href=3D"http://pcmciautils_018.bb" re=
l=3D"noreferrer" target=3D"_blank">pcmciautils_018.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0meta/recipes-bsp/pm-utils/<a href=3D"http://pm-utils_1.4.1.bb" rel=3D=
"noreferrer" target=3D"_blank">pm-utils_1.4.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3 +--<br>
=C2=A0meta/recipes-bsp/u-boot/u-boot.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 2 --<br>
=C2=A0meta/recipes-connectivity/avahi/<a href=3D"http://avahi-ui_0.6.31.bb"=
 rel=3D"noreferrer" target=3D"_blank">avahi-ui_0.6.31.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0meta/recipes-connectivity/connman/connman.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 --<br>
=C2=A0meta/recipes-connectivity/iproute2/iproute2.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 --<br>
=C2=A0meta/recipes-connectivity/neard/<a href=3D"http://neard_0.15.bb" rel=
=3D"noreferrer" target=3D"_blank">neard_0.15.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.0.2e.bb=
" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2e.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +------<br>
=C2=A0meta/recipes-connectivity/ppp/<a href=3D"http://ppp_2.4.7.bb" rel=3D"=
noreferrer" target=3D"_blank">ppp_2.4.7.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0meta/recipes-connectivity/wireless-tools/<a href=3D"http://wireless-t=
ools_30.pre9.bb" rel=3D"noreferrer" target=3D"_blank">wireless-tools_30.pre=
9.bb</a> | 5 +----<br>
=C2=A0meta/recipes-core/dbus/dbus-glib.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 2 +-<br>
=C2=A0meta/recipes-core/glib-networking/<a href=3D"http://glib-networking_2=
.46.1.bb" rel=3D"noreferrer" target=3D"_blank">glib-networking_2.46.1.bb</a=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0meta/recipes-core/libcgroup/<a href=3D"http://libcgroup_0.41.bb" rel=
=3D"noreferrer" target=3D"_blank">libcgroup_0.41.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0meta/recipes-core/libxml/<a href=3D"http://libxml2_2.9.3.bb" rel=3D"n=
oreferrer" target=3D"_blank">libxml2_2.9.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br=
>
=C2=A0meta/recipes-core/uclibc/uclibc-package.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3 +--<br>
=C2=A0meta/recipes-core/util-linux/util-linux.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0meta/recipes-devtools/apt/apt.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 2 --<br>
=C2=A0meta/recipes-devtools/binutils/binutils.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 --<br>
=C2=A0meta/recipes-devtools/bootchart2/<a href=3D"http://bootchart2_0.14.7.=
bb" rel=3D"noreferrer" target=3D"_blank">bootchart2_0.14.7.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0meta/recipes-devtools/gcc/gcc-sanitizers.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 7 +------<br>
=C2=A0meta/recipes-devtools/gcc/libgcc.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 2 --<br>
=C2=A0meta/recipes-devtools/perl/<a href=3D"http://libxml-parser-perl_2.44.=
bb" rel=3D"noreferrer" target=3D"_blank">libxml-parser-perl_2.44.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 --<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python-smartpm_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">python-smartpm_git.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 --<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3_3.5.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.5.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3 ---<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python_2.7.9.bb" rel=
=3D"noreferrer" target=3D"_blank">python_2.7.9.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 ---<br>
=C2=A0meta/recipes-devtools/rpm/rpm_5.4+<a href=3D"http://cvs.bb" rel=3D"no=
referrer" target=3D"_blank">cvs.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta/recipes-devtools/ruby/<a href=3D"http://ruby_2.2.2.bb" rel=3D"no=
referrer" target=3D"_blank">ruby_2.2.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 --=
---<br>
=C2=A0meta/recipes-devtools/vala/vala.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 1 -<br>
=C2=A0meta/recipes-devtools/valgrind/<a href=3D"http://valgrind_3.10.1.bb" =
rel=3D"noreferrer" target=3D"_blank">valgrind_3.10.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 --<br>
=C2=A0meta/recipes-extended/cracklib/<a href=3D"http://cracklib_2.9.5.bb" r=
el=3D"noreferrer" target=3D"_blank">cracklib_2.9.5.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0meta/recipes-extended/gawk/<a href=3D"http://gawk_3.1.5.bb" rel=3D"no=
referrer" target=3D"_blank">gawk_3.1.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<=
br>
=C2=A0meta/recipes-extended/gawk/<a href=3D"http://gawk_4.1.3.bb" rel=3D"no=
referrer" target=3D"_blank">gawk_4.1.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<=
br>
=C2=A0meta/recipes-extended/iptables/<a href=3D"http://iptables_1.4.21.bb" =
rel=3D"noreferrer" target=3D"_blank">iptables_1.4.21.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0meta/recipes-extended/libsolv/<a href=3D"http://libsolv_git.bb" rel=
=3D"noreferrer" target=3D"_blank">libsolv_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 +--<br>
=C2=A0meta/recipes-extended/libuser/<a href=3D"http://libuser_0.62.bb" rel=
=3D"noreferrer" target=3D"_blank">libuser_0.62.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0meta/recipes-extended/mc/<a href=3D"http://mc_4.7.5.2.bb" rel=3D"nore=
ferrer" target=3D"_blank">mc_4.7.5.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
2 --<br>
=C2=A0meta/recipes-extended/mc/<a href=3D"http://mc_4.8.15.bb" rel=3D"noref=
errer" target=3D"_blank">mc_4.8.15.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 =
--<br>
=C2=A0meta/recipes-extended/newt/<a href=3D"http://libnewt-python_0.52.18.b=
b" rel=3D"noreferrer" target=3D"_blank">libnewt-python_0.52.18.bb</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0meta/recipes-extended/slang/<a href=3D"http://slang_2.2.4.bb" rel=3D"=
noreferrer" target=3D"_blank">slang_2.2.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0meta/recipes-extended/sysstat/sysstat.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0meta/recipes-gnome/epiphany/<a href=3D"http://epiphany_3.16.3.bb" rel=
=3D"noreferrer" target=3D"_blank">epiphany_3.16.3.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0meta/recipes-gnome/gdk-pixbuf/<a href=3D"http://gdk-pixbuf_2.32.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">gdk-pixbuf_2.32.1.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 ------<br>
=C2=A0meta/recipes-gnome/gnome/<a href=3D"http://gconf_3.2.6.bb" rel=3D"nor=
eferrer" target=3D"_blank">gconf_3.2.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -=
<br>
=C2=A0meta/recipes-gnome/gtk-engines/<a href=3D"http://gtk-engines_2.20.2.b=
b" rel=3D"noreferrer" target=3D"_blank">gtk-engines_2.20.2.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0meta/recipes-gnome/librsvg/<a href=3D"http://librsvg_2.40.11.bb" rel=
=3D"noreferrer" target=3D"_blank">librsvg_2.40.11.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0meta/recipes-graphics/harfbuzz/<a href=3D"http://harfbuzz_1.1.2.bb" r=
el=3D"noreferrer" target=3D"_blank">harfbuzz_1.1.2.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 +--<br>
=C2=A0meta/recipes-graphics/piglit/<a href=3D"http://piglit_git.bb" rel=3D"=
noreferrer" target=3D"_blank">piglit_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 --<br>
=C2=A0meta/recipes-graphics/tslib/<a href=3D"http://tslib_1.1.bb" rel=3D"no=
referrer" target=3D"_blank">tslib_1.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0meta/recipes-graphics/wayland/<a href=3D"http://libinput_0.21.0.bb" r=
el=3D"noreferrer" target=3D"_blank">libinput_0.21.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0meta/recipes-graphics/xorg-driver/xorg-driver-common.inc=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0meta/recipes-graphics/xorg-driver/xorg-driver-input.inc=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0meta/recipes-kernel/cryptodev/<a href=3D"http://cryptodev-tests_1.7.b=
b" rel=3D"noreferrer" target=3D"_blank">cryptodev-tests_1.7.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 1 -<br>
=C2=A0meta/recipes-kernel/systemtap/<a href=3D"http://systemtap_git.bb" rel=
=3D"noreferrer" target=3D"_blank">systemtap_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 --<br>
=C2=A0meta/recipes-kernel/trace-cmd/<a href=3D"http://trace-cmd_git.bb" rel=
=3D"noreferrer" target=3D"_blank">trace-cmd_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 --<br>
=C2=A0meta/recipes-support/aspell/<a href=3D"http://aspell_0.60.6.1.bb" rel=
=3D"noreferrer" target=3D"_blank">aspell_0.60.6.1.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0meta/recipes-support/libcap-ng/<a href=3D"http://libcap-ng_0.7.7.bb" =
rel=3D"noreferrer" target=3D"_blank">libcap-ng_0.7.7.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0meta/recipes-support/nss/<a href=3D"http://nss_3.19.2.bb" rel=3D"nore=
ferrer" target=3D"_blank">nss_3.19.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
1 -<br>
=C2=A0meta/recipes-support/p11-kit/<a href=3D"http://p11-kit_0.22.1.bb" rel=
=3D"noreferrer" target=3D"_blank">p11-kit_0.22.1.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A059 files changed, 10 insertions(+), 103 deletions(-)<br>
<br>
diff --git a/meta/recipes-bsp/pcmciautils/<a href=3D"http://pcmciautils_018=
.bb" rel=3D"noreferrer" target=3D"_blank">pcmciautils_018.bb</a> b/meta/rec=
ipes-bsp/pcmciautils/<a href=3D"http://pcmciautils_018.bb" rel=3D"noreferre=
r" target=3D"_blank">pcmciautils_018.bb</a><br>
index 857bd07..6a1c366 100644<br>
--- a/meta/recipes-bsp/pcmciautils/<a href=3D"http://pcmciautils_018.bb" re=
l=3D"noreferrer" target=3D"_blank">pcmciautils_018.bb</a><br>
+++ b/meta/recipes-bsp/pcmciautils/<a href=3D"http://pcmciautils_018.bb" re=
l=3D"noreferrer" target=3D"_blank">pcmciautils_018.bb</a><br>
@@ -9,5 +9,4 @@ SRC_URI[sha256sum] =3D &quot;79e6ae441278e178c07501d492394e=
d2c0326fdb66894f6d040ec811b0<br>
<br>
=C2=A0PR =3D &quot;r1&quot;<br>
<br>
-FILES_${PN}-dbg +=3D &quot;*/udev/.debug */*/udev/.debug&quot;<br>
=C2=A0FILES_${PN} +=3D &quot;*/udev */*/udev&quot;<br>
diff --git a/meta/recipes-bsp/pm-utils/<a href=3D"http://pm-utils_1.4.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">pm-utils_1.4.1.bb</a> b/meta/recipes-=
bsp/pm-utils/<a href=3D"http://pm-utils_1.4.1.bb" rel=3D"noreferrer" target=
=3D"_blank">pm-utils_1.4.1.bb</a><br>
index 8d35187..27cb3db 100644<br>
--- a/meta/recipes-bsp/pm-utils/<a href=3D"http://pm-utils_1.4.1.bb" rel=3D=
"noreferrer" target=3D"_blank">pm-utils_1.4.1.bb</a><br>
+++ b/meta/recipes-bsp/pm-utils/<a href=3D"http://pm-utils_1.4.1.bb" rel=3D=
"noreferrer" target=3D"_blank">pm-utils_1.4.1.bb</a><br>
@@ -22,5 +22,4 @@ do_configure_prepend () {<br>
=C2=A0}<br>
<br>
=C2=A0FILES_${PN} +=3D &quot;${libdir}/${BPN}/*&quot;<br>
-FILES_${PN}-dbg +=3D &quot;${libdir}/${BPN}/bin/.debug \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${dat=
adir}/doc/pm-utils/README.debugging&quot;<br>
+FILES_${PN}-dbg +=3D &quot;${datadir}/doc/pm-utils/README.debugging&quot;<=
br>
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u=
-boot.inc<br>
index e66ffd1..41eb205 100644<br>
--- a/meta/recipes-bsp/u-boot/u-boot.inc<br>
+++ b/meta/recipes-bsp/u-boot/u-boot.inc<br>
@@ -187,8 +187,6 @@ do_install () {<br>
=C2=A0}<br>
<br>
=C2=A0FILES_${PN} =3D &quot;/boot ${sysconfdir}&quot;<br>
-# Ensure the split debug part of any elf files are put into dbg<br>
-FILES_${PN}-dbg +=3D &quot;/boot/.debug&quot;<br>
<br>
=C2=A0do_deploy () {<br>
=C2=A0 =C2=A0 =C2=A0if [ &quot;x${UBOOT_CONFIG}&quot; !=3D &quot;x&quot; ]<=
br>
diff --git a/meta/recipes-connectivity/avahi/<a href=3D"http://avahi-ui_0.6=
.31.bb" rel=3D"noreferrer" target=3D"_blank">avahi-ui_0.6.31.bb</a> b/meta/=
recipes-connectivity/avahi/<a href=3D"http://avahi-ui_0.6.31.bb" rel=3D"nor=
eferrer" target=3D"_blank">avahi-ui_0.6.31.bb</a><br>
index 0d42b90..604ee9e 100644<br>
--- a/meta/recipes-connectivity/avahi/<a href=3D"http://avahi-ui_0.6.31.bb"=
 rel=3D"noreferrer" target=3D"_blank">avahi-ui_0.6.31.bb</a><br>
+++ b/meta/recipes-connectivity/avahi/<a href=3D"http://avahi-ui_0.6.31.bb"=
 rel=3D"noreferrer" target=3D"_blank">avahi-ui_0.6.31.bb</a><br>
@@ -26,7 +26,6 @@ S =3D &quot;${WORKDIR}/avahi-${PV}&quot;<br>
=C2=A0PACKAGES =3D &quot;${PN} ${PN}-utils ${PN}-dbg ${PN}-dev ${PN}-static=
dev ${PN}-doc python-avahi avahi-discover avahi-discover-standalone&quot;<b=
r>
<br>
=C2=A0FILES_${PN} =3D &quot;${libdir}/libavahi-ui*.so.*&quot;<br>
-FILES_${PN}-dbg +=3D &quot;${libdir}/.debug/libavah-ui*&quot;<br>
=C2=A0FILES_${PN}-dev +=3D &quot;${libdir}/libavahi-ui${SOLIBSDEV}&quot;<br=
>
=C2=A0FILES_${PN}-staticdev +=3D &quot;${libdir}/libavahi-ui.a&quot;<br>
<br>
diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-c=
onnectivity/connman/connman.inc<br>
index 6324d7a..ba2ca24 100644<br>
--- a/meta/recipes-connectivity/connman/connman.inc<br>
+++ b/meta/recipes-connectivity/connman/connman.inc<br>
@@ -154,8 +154,6 @@ FILES_${PN} =3D &quot;${bindir}/* ${sbindir}/* ${libexe=
cdir}/* ${libdir}/lib*.so.* \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${base_bindir}/* ${base_sbi=
ndir}/* ${base_libdir}/*.so* ${datadir}/${PN} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/dbus-1/system-se=
rvices/*&quot;<br>
<br>
-FILES_${PN}-dbg +=3D &quot;${libdir}/connman/*/.debug&quot;<br>
-<br>
=C2=A0FILES_${PN}-dev +=3D &quot;${libdir}/connman/*/*.la&quot;<br>
<br>
=C2=A0PACKAGES =3D+ &quot;${PN}-vpn&quot;<br>
diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes=
-connectivity/iproute2/iproute2.inc<br>
index 6a08114..9ce157b 100644<br>
--- a/meta/recipes-connectivity/iproute2/iproute2.inc<br>
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc<br>
@@ -36,8 +36,6 @@ PACKAGES =3D+ &quot;${PN}-tc&quot;<br>
=C2=A0FILES_${PN}-tc =3D &quot;${base_sbindir}/tc* \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libd=
ir}/tc/*.so&quot;<br>
<br>
-FILES_${PN}-dbg +=3D &quot;${libdir}/tc/.debug&quot;<br>
-<br>
=C2=A0ALTERNATIVE_${PN} =3D &quot;ip&quot;<br>
=C2=A0ALTERNATIVE_TARGET[ip] =3D &quot;${base_sbindir}/ip.${BPN}&quot;<br>
=C2=A0ALTERNATIVE_LINK_NAME[ip] =3D &quot;${base_sbindir}/ip&quot;<br>
diff --git a/meta/recipes-connectivity/neard/<a href=3D"http://neard_0.15.b=
b" rel=3D"noreferrer" target=3D"_blank">neard_0.15.bb</a> b/meta/recipes-co=
nnectivity/neard/<a href=3D"http://neard_0.15.bb" rel=3D"noreferrer" target=
=3D"_blank">neard_0.15.bb</a><br>
index f962310..93bddb3 100644<br>
--- a/meta/recipes-connectivity/neard/<a href=3D"http://neard_0.15.bb" rel=
=3D"noreferrer" target=3D"_blank">neard_0.15.bb</a><br>
+++ b/meta/recipes-connectivity/neard/<a href=3D"http://neard_0.15.bb" rel=
=3D"noreferrer" target=3D"_blank">neard_0.15.bb</a><br>
@@ -43,7 +43,6 @@ do_install_append() {<br>
=C2=A0PACKAGES =3D+ &quot;${PN}-tests&quot;<br>
<br>
=C2=A0FILES_${PN}-tests =3D &quot;${libdir}/${BPN}/*-test&quot;<br>
-FILES_${PN}-dbg +=3D &quot;${libexecdir}/nfc/.debug ${libdir}/${BPN}/*/.de=
bug&quot;<br>
<br>
=C2=A0RDEPENDS_${PN} =3D &quot;dbus python python-dbus python-pygobject&quo=
t;<br>
<br>
diff --git a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.=
0.2e.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2e.bb</a> b/meta/=
recipes-connectivity/openssl/<a href=3D"http://openssl_1.0.2e.bb" rel=3D"no=
referrer" target=3D"_blank">openssl_1.0.2e.bb</a><br>
index c4e590f..d2a265a 100644<br>
--- a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.0.2e.bb=
" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2e.bb</a><br>
+++ b/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.0.2e.bb=
" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2e.bb</a><br>
@@ -43,13 +43,8 @@ SRC_URI +=3D &quot;file://<a href=3D"http://find.pl" rel=
=3D"noreferrer" target=3D"_blank">find.pl</a>;subdir=3D${BP}/util/ \<br>
=C2=A0SRC_URI[md5sum] =3D &quot;5262bfa25b60ed9de9f28d5d52d77fc5&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;e23ccafdb75cfcde782da0151731aa2185195ac7=
45eea3846133f2e05c0e0bff&quot;<br>
<br>
-PACKAGES =3D+ &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${PN}-engines \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${PN}-engines-dbg \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-<br>
+PACKAGES =3D+ &quot;${PN}-engines&quot;<br>
=C2=A0FILES_${PN}-engines =3D &quot;${libdir}/ssl/engines/*.so ${libdir}/en=
gines&quot;<br>
-FILES_${PN}-engines-dbg =3D &quot;${libdir}/ssl/engines/.debug&quot;<br>
<br>
=C2=A0# The crypto_use_bigint patch means that perl&#39;s bignum module nee=
ds to be<br>
=C2=A0# installed, but some distributions (for example Fedora 23) don&#39;t=
 ship it by<br>
diff --git a/meta/recipes-connectivity/ppp/<a href=3D"http://ppp_2.4.7.bb" =
rel=3D"noreferrer" target=3D"_blank">ppp_2.4.7.bb</a> b/meta/recipes-connec=
tivity/ppp/<a href=3D"http://ppp_2.4.7.bb" rel=3D"noreferrer" target=3D"_bl=
ank">ppp_2.4.7.bb</a><br>
index adc38e1..5f06034 100644<br>
--- a/meta/recipes-connectivity/ppp/<a href=3D"http://ppp_2.4.7.bb" rel=3D"=
noreferrer" target=3D"_blank">ppp_2.4.7.bb</a><br>
+++ b/meta/recipes-connectivity/ppp/<a href=3D"http://ppp_2.4.7.bb" rel=3D"=
noreferrer" target=3D"_blank">ppp_2.4.7.bb</a><br>
@@ -78,7 +78,6 @@ do_install_append () {<br>
=C2=A0CONFFILES_${PN} =3D &quot;${sysconfdir}/ppp/pap-secrets ${sysconfdir}=
/ppp/chap-secrets ${sysconfdir}/ppp/options&quot;<br>
=C2=A0PACKAGES =3D+ &quot;${PN}-oa ${PN}-oe ${PN}-radius ${PN}-winbind ${PN=
}-minconn ${PN}-password ${PN}-l2tp ${PN}-tools&quot;<br>
=C2=A0FILES_${PN}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;${sysconfdir} ${bind=
ir} ${sbindir}/chat ${sbindir}/pppd ${systemd_unitdir}/system/ppp@.service&=
quot;<br>
-FILES_${PN}-dbg +=3D &quot;${libdir}/pppd/${PV}/.debug&quot;<br>
=C2=A0FILES_${PN}-oa=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;${libdir}/pppd/${P=
V}/pppoatm.so&quot;<br>
=C2=A0FILES_${PN}-oe=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;${sbindir}/pppoe-d=
iscovery ${libdir}/pppd/${PV}/rp-pppoe.so&quot;<br>
=C2=A0FILES_${PN}-radius=C2=A0 =C2=A0=3D &quot;${libdir}/pppd/${PV}/radius.=
so ${libdir}/pppd/${PV}/radattr.so ${libdir}/pppd/${PV}/radrealms.so&quot;<=
br>
diff --git a/meta/recipes-connectivity/wireless-tools/<a href=3D"http://wir=
eless-tools_30.pre9.bb" rel=3D"noreferrer" target=3D"_blank">wireless-tools=
_30.pre9.bb</a> b/meta/recipes-connectivity/wireless-tools/<a href=3D"http:=
//wireless-tools_30.pre9.bb" rel=3D"noreferrer" target=3D"_blank">wireless-=
tools_30.pre9.bb</a><br>
index b6f33e5..c3b8f66 100644<br>
--- a/meta/recipes-connectivity/wireless-tools/<a href=3D"http://wireless-t=
ools_30.pre9.bb" rel=3D"noreferrer" target=3D"_blank">wireless-tools_30.pre=
9.bb</a><br>
+++ b/meta/recipes-connectivity/wireless-tools/<a href=3D"http://wireless-t=
ools_30.pre9.bb" rel=3D"noreferrer" target=3D"_blank">wireless-tools_30.pre=
9.bb</a><br>
@@ -39,11 +39,8 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 ifrename ${D}${sbindir}/ifrenam=
e<br>
=C2=A0}<br>
<br>
-PACKAGES =3D &quot;libiw-dbg ifrename-dbg ${PN}-dbg \<br>
-libiw libiw-dev libiw-doc ifrename-doc ifrename ${PN} ${PN}-doc&quot;<br>
+PACKAGES =3D &quot;libiw libiw-dev libiw-doc ifrename-doc ifrename ${PN} $=
{PN}-doc ${PN}-dbg&quot;<br>
<br>
-FILES_libiw-dbg =3D &quot;${libdir}/.debug/*.so.*&quot;<br>
-FILES_ifrename-dbg =3D &quot;${sbindir}/.debug/ifrename&quot;<br>
=C2=A0FILES_libiw =3D &quot;${libdir}/*.so.*&quot;<br>
=C2=A0FILES_libiw-dev =3D &quot;${libdir}/*.a ${libdir}/*.so ${includedir}&=
quot;<br>
=C2=A0FILES_libiw-doc =3D &quot;${mandir}/man7&quot;<br>
diff --git a/meta/recipes-core/dbus/dbus-glib.inc b/meta/recipes-core/dbus/=
dbus-glib.inc<br>
index 1c47873..f8c0ebe 100644<br>
--- a/meta/recipes-core/dbus/dbus-glib.inc<br>
+++ b/meta/recipes-core/dbus/dbus-glib.inc<br>
@@ -26,7 +26,7 @@ EXTRA_OECONF =3D &quot;--with-introspect-xml=3D${STAGING_=
DATADIR_NATIVE}/dbus/dbus-bus-in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-dbus-b=
inding-tool=3D${STAGING_BINDIR_NATIVE}/dbus-binding-tool&quot;<br>
=C2=A0EXTRA_OECONF_class-native =3D &quot;--with-introspect-xml=3D${STAGING=
_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml&quot;<br>
<br>
-PACKAGES +=3D &quot;${PN}-bash-completion ${PN}-tests-dbg ${PN}-tests&quot=
;<br>
+PACKAGES +=3D &quot;${PN}-bash-completion ${PN}-tests&quot;<br>
<br>
=C2=A0FILES_${PN} =3D &quot;${libdir}/lib*${SOLIBS}&quot;<br>
=C2=A0FILES_${PN}-bash-completion =3D &quot;${sysconfdir}/bash_completion.d=
/dbus-bash-completion.sh \<br>
diff --git a/meta/recipes-core/glib-networking/<a href=3D"http://glib-netwo=
rking_2.46.1.bb" rel=3D"noreferrer" target=3D"_blank">glib-networking_2.46.=
1.bb</a> b/meta/recipes-core/glib-networking/<a href=3D"http://glib-network=
ing_2.46.1.bb" rel=3D"noreferrer" target=3D"_blank">glib-networking_2.46.1.=
bb</a><br>
index c980a09..70be87c 100644<br>
--- a/meta/recipes-core/glib-networking/<a href=3D"http://glib-networking_2=
.46.1.bb" rel=3D"noreferrer" target=3D"_blank">glib-networking_2.46.1.bb</a=
><br>
+++ b/meta/recipes-core/glib-networking/<a href=3D"http://glib-networking_2=
.46.1.bb" rel=3D"noreferrer" target=3D"_blank">glib-networking_2.46.1.bb</a=
><br>
@@ -25,6 +25,5 @@ EXTRA_OECONF =3D &quot;--without-gnome-proxy&quot;<br>
=C2=A0inherit gnomebase gettext upstream-version-is-even<br>
<br>
=C2=A0FILES_${PN} +=3D &quot;${libdir}/gio/modules/libgio*.so ${datadir}/db=
us-1/services/&quot;<br>
-FILES_${PN}-dbg +=3D &quot;${libdir}/gio/modules/.debug/&quot;<br>
=C2=A0FILES_${PN}-dev +=3D &quot;${libdir}/gio/modules/libgio*.la&quot;<br>
=C2=A0FILES_${PN}-staticdev +=3D &quot;${libdir}/gio/modules/libgio*.a&quot=
;<br>
diff --git a/meta/recipes-core/libcgroup/<a href=3D"http://libcgroup_0.41.b=
b" rel=3D"noreferrer" target=3D"_blank">libcgroup_0.41.bb</a> b/meta/recipe=
s-core/libcgroup/<a href=3D"http://libcgroup_0.41.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">libcgroup_0.41.bb</a><br>
index 1bbeb4a..287aecd 100644<br>
--- a/meta/recipes-core/libcgroup/<a href=3D"http://libcgroup_0.41.bb" rel=
=3D"noreferrer" target=3D"_blank">libcgroup_0.41.bb</a><br>
+++ b/meta/recipes-core/libcgroup/<a href=3D"http://libcgroup_0.41.bb" rel=
=3D"noreferrer" target=3D"_blank">libcgroup_0.41.bb</a><br>
@@ -21,7 +21,6 @@ EXTRA_OECONF =3D &quot;${@bb.utils.contains(&#39;DISTRO_F=
EATURES&#39;, &#39;pam&#39;, &#39;--enable-pam-mod<br>
<br>
=C2=A0PACKAGES =3D+ &quot;cgroups-pam-plugin&quot;<br>
=C2=A0FILES_cgroups-pam-plugin =3D &quot;${base_libdir}/security/pam_cgroup=
.so*&quot;<br>
-FILES_${PN}-dbg +=3D &quot;${base_libdir}/security/.debug&quot;<br>
=C2=A0FILES_${PN}-dev +=3D &quot;${base_libdir}/security/*.la&quot;<br>
<br>
=C2=A0do_install_append() {<br>
diff --git a/meta/recipes-core/libxml/<a href=3D"http://libxml2_2.9.3.bb" r=
el=3D"noreferrer" target=3D"_blank">libxml2_2.9.3.bb</a> b/meta/recipes-cor=
e/libxml/<a href=3D"http://libxml2_2.9.3.bb" rel=3D"noreferrer" target=3D"_=
blank">libxml2_2.9.3.bb</a><br>
index 20bf1e0..9c9873f 100644<br>
--- a/meta/recipes-core/libxml/<a href=3D"http://libxml2_2.9.3.bb" rel=3D"n=
oreferrer" target=3D"_blank">libxml2_2.9.3.bb</a><br>
+++ b/meta/recipes-core/libxml/<a href=3D"http://libxml2_2.9.3.bb" rel=3D"n=
oreferrer" target=3D"_blank">libxml2_2.9.3.bb</a><br>
@@ -62,7 +62,6 @@ python populate_packages_prepend () {<br>
<br>
=C2=A0PACKAGES +=3D &quot;${PN}-utils ${PN}-python&quot;<br>
<br>
-FILES_${PN}-dbg +=3D &quot;${PYTHON_SITEPACKAGES_DIR}/.debug&quot;<br>
=C2=A0FILES_${PN}-staticdev +=3D &quot;${PYTHON_SITEPACKAGES_DIR}/*.a&quot;=
<br>
=C2=A0FILES_${PN}-dev +=3D &quot;${libdir}/xml2Conf.sh ${libdir}/cmake/*&qu=
ot;<br>
=C2=A0FILES_${PN}-utils +=3D &quot;${bindir}/*&quot;<br>
diff --git a/meta/recipes-core/uclibc/uclibc-package.inc b/meta/recipes-cor=
e/uclibc/uclibc-package.inc<br>
index c1815f9..439f84e 100644<br>
--- a/meta/recipes-core/uclibc/uclibc-package.inc<br>
+++ b/meta/recipes-core/uclibc/uclibc-package.inc<br>
@@ -1,6 +1,6 @@<br>
=C2=A0# Ensure the uclibc-dev package is processed before uclibc-staticdev =
to allow<br>
=C2=A0# *_nonshared.a libraries to be packaged in the uclibc-dev package.<b=
r>
-PACKAGES =3D &quot;ldd uclibc-utils-dbg uclibc-utils uclibc-gconv uclibc-t=
hread-db uclibc-argp uclibc-backtrace uclibc-libcrypt uclibc-libintl uclibc=
-libnsl uclibc-libresolv uclibc-libm uclibc-libdl uclibc-libutil uclibc-lib=
pthread uclibc-librt ${PN}-dbg ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}&qu=
ot;<br>
+PACKAGES =3D &quot;ldd uclibc-utils uclibc-gconv uclibc-thread-db uclibc-a=
rgp uclibc-backtrace uclibc-libcrypt uclibc-libintl uclibc-libnsl uclibc-li=
bresolv uclibc-libm uclibc-libdl uclibc-libutil uclibc-libpthread uclibc-li=
brt ${PN}-dbg ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}&quot;<br>
<br>
=C2=A0FILES_uclibc-libcrypt =3D &quot;${base_libdir}/libcrypt*.so.* ${base_=
libdir}/libcrypt-*.so&quot;<br>
=C2=A0FILES_uclibc-libintl =3D &quot;${base_libdir}/libintl*.so.* ${base_li=
bdir}/libintl-*.so&quot;<br>
@@ -14,7 +14,6 @@ FILES_uclibc-librt =3D &quot;${base_libdir}/librt*.so.* $=
{base_libdir}/librt-*.so&quot;<br>
<br>
=C2=A0FILES_ldd =3D &quot;${bindir}/ldd&quot;<br>
=C2=A0FILES_uclibc-utils =3D &quot;${bindir} ${sbindir}&quot;<br>
-FILES_uclibc-utils-dbg +=3D &quot;${bindir}/.debug ${sbindir}/.debug&quot;=
<br>
=C2=A0FILES_uclibc-gconv =3D &quot;${libdir}/gconv&quot;<br>
=C2=A0FILES_uclibc-thread-db =3D &quot;${base_libdir}/libthread_db*&quot;<b=
r>
=C2=A0FILES_uclibc-argp =3D &quot;${base_libdir}/libuargp-*.so ${base_libdi=
r}/libuargp*.so.*&quot;<br>
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-cor=
e/util-linux/util-linux.inc<br>
index 318c74b..cf321c6 100644<br>
--- a/meta/recipes-core/util-linux/util-linux.inc<br>
+++ b/meta/recipes-core/util-linux/util-linux.inc<br>
@@ -65,7 +65,6 @@ FILES_${PN}-bash-completion +=3D &quot;${datadir}/bash-co=
mpletion&quot;<br>
=C2=A0FILES_${PN}-doc +=3D &quot;${datadir}/getopt/getopt-*.*&quot;<br>
<br>
=C2=A0FILES_${PN}-dev +=3D &quot;${libdir}/${PYTHON_DIR}/dist-packages/libm=
ount/<a href=3D"http://pylibmount.la" rel=3D"noreferrer" target=3D"_blank">=
pylibmount.la</a>&quot;<br>
-FILES_${PN}-dbg +=3D &quot;${libdir}/${PYTHON_DIR}/dist-packages/libmount/=
.debug/&quot;<br>
<br>
=C2=A0FILES_util-linux-agetty =3D &quot;${base_sbindir}/agetty&quot;<br>
=C2=A0FILES_util-linux-fdisk =3D &quot;${base_sbindir}/fdisk.${BPN}&quot;<b=
r>
diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/=
apt.inc<br>
index 8e267c3..312c6a9 100644<br>
--- a/meta/recipes-devtools/apt/apt.inc<br>
+++ b/meta/recipes-devtools/apt/apt.inc<br>
@@ -28,5 +28,3 @@ do_configure_prepend() {<br>
=C2=A0 =C2=A0 =C2=A0rm -rf ${S}/buildlib/config.sub<br>
=C2=A0 =C2=A0 =C2=A0rm -rf ${S}/buildlib/config.guess<br>
=C2=A0}<br>
-<br>
-FILES_${PN}-dbg +=3D &quot;${libdir}/apt/methods/.debug/&quot;<br>
diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-dev=
tools/binutils/binutils.inc<br>
index a304867..79e2a12 100644<br>
--- a/meta/recipes-devtools/binutils/binutils.inc<br>
+++ b/meta/recipes-devtools/binutils/binutils.inc<br>
@@ -61,8 +61,6 @@ python do_package_prepend() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVarFlag(&#39;ALTERNATIVE_LINK_NAME&#=
39;, alt, bindir + &quot;/&quot; + alt)<br>
=C2=A0}<br>
<br>
-# FILES_${PN}-dbg =3D &quot;${prefix}/${TARGET_SYS}/bin/.debug ${prefix}/$=
{libdir}/.debug&quot;<br>
-<br>
=C2=A0B =3D &quot;${S}/build.${HOST_SYS}.${TARGET_SYS}&quot;<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;--program-prefix=3D${TARGET_PREFIX} \<br>
diff --git a/meta/recipes-devtools/bootchart2/<a href=3D"http://bootchart2_=
0.14.7.bb" rel=3D"noreferrer" target=3D"_blank">bootchart2_0.14.7.bb</a> b/=
meta/recipes-devtools/bootchart2/<a href=3D"http://bootchart2_0.14.7.bb" re=
l=3D"noreferrer" target=3D"_blank">bootchart2_0.14.7.bb</a><br>
index 8ca26ef..7586ff2 100644<br>
--- a/meta/recipes-devtools/bootchart2/<a href=3D"http://bootchart2_0.14.7.=
bb" rel=3D"noreferrer" target=3D"_blank">bootchart2_0.14.7.bb</a><br>
+++ b/meta/recipes-devtools/bootchart2/<a href=3D"http://bootchart2_0.14.7.=
bb" rel=3D"noreferrer" target=3D"_blank">bootchart2_0.14.7.bb</a><br>
@@ -150,7 +150,6 @@ FILES_bootchartd-stop-initscript +=3D &quot;${sysconfdi=
r}/init.d ${sysconfdir}/rc*.d&quot;<br>
=C2=A0FILES_${PN} +=3D &quot;${base_libdir}/bootchart/bootchart-collector&q=
uot;<br>
=C2=A0FILES_${PN} +=3D &quot;${base_libdir}/bootchart/tmpfs&quot;<br>
=C2=A0FILES_${PN} +=3D &quot;${libdir}&quot;<br>
-FILES_${PN}-dbg +=3D &quot;${base_libdir}/bootchart/.debug&quot;<br>
=C2=A0FILES_${PN}-doc +=3D &quot;${datadir}/docs&quot;<br>
<br>
=C2=A0RCONFLICTS_${PN} =3D &quot;bootchart&quot;<br>
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-de=
vtools/gcc/gcc-sanitizers.inc<br>
index c987ccb..a7b5d71 100644<br>
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc<br>
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc<br>
@@ -58,10 +58,9 @@ DEPENDS =3D &quot;gcc-runtime&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;nativesdk&quot;<br>
<br>
-PACKAGES =3D &quot;${PN}&quot;<br>
+PACKAGES =3D &quot;${PN} ${PN}-dbg&quot;<br>
=C2=A0PACKAGES +=3D &quot;libasan libubsan liblsan libtsan&quot;<br>
=C2=A0PACKAGES +=3D &quot;libasan-dev libubsan-dev liblsan-dev libtsan-dev&=
quot;<br>
-PACKAGES +=3D &quot;libasan-dbg libubsan-dbg liblsan-dbg libtsan-dbg&quot;=
<br>
=C2=A0PACKAGES +=3D &quot;libasan-staticdev libubsan-staticdev liblsan-stat=
icdev libtsan-staticdev&quot;<br>
<br>
=C2=A0RDEPENDS_libasan +=3D &quot;libstdc++&quot;<br>
@@ -84,7 +83,6 @@ do_package_write_rpm[depends] +=3D &quot;virtual/${MLPREF=
IX}${TARGET_PREFIX}compilerlib<br>
=C2=A0COMPATIBLE_HOST =3D &#39;(x86_64|i.86|powerpc|arm).*-linux&#39;<br>
<br>
=C2=A0FILES_libasan +=3D &quot;${libdir}/libasan.so.*&quot;<br>
-FILES_libasan-dbg +=3D &quot;${libdir}/.debug/libasan.so.*&quot;<br>
=C2=A0FILES_libasan-dev +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libasan_preinit.o \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libasan.so \<br>
@@ -93,7 +91,6 @@ FILES_libasan-dev +=3D &quot;\<br>
=C2=A0FILES_libasan-staticdev +=3D &quot;${libdir}/libasan.a&quot;<br>
<br>
=C2=A0FILES_libubsan +=3D &quot;${libdir}/libubsan.so.*&quot;<br>
-FILES_libubsan-dbg +=3D &quot;${libdir}/.debug/libubsan.so.*&quot;<br>
=C2=A0FILES_libubsan-dev +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libubsan.so \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/<a href=3D"http://libubsan.la" rel=3D"norefer=
rer" target=3D"_blank">libubsan.la</a> \<br>
@@ -101,7 +98,6 @@ FILES_libubsan-dev +=3D &quot;\<br>
=C2=A0FILES_libubsan-staticdev +=3D &quot;${libdir}/libubsan.a&quot;<br>
<br>
=C2=A0FILES_liblsan +=3D &quot;${libdir}/liblsan.so.*&quot;<br>
-FILES_liblsan-dbg +=3D &quot;${libdir}/.debug/liblsan.so.*&quot;<br>
=C2=A0FILES_liblsan-dev +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/liblsan.so \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/<a href=3D"http://liblsan.la" rel=3D"noreferr=
er" target=3D"_blank">liblsan.la</a> \<br>
@@ -109,7 +105,6 @@ FILES_liblsan-dev +=3D &quot;\<br>
=C2=A0FILES_liblsan-staticdev +=3D &quot;${libdir}/liblsan.a&quot;<br>
<br>
=C2=A0FILES_libtsan +=3D &quot;${libdir}/libtsan.so.*&quot;<br>
-FILES_libtsan-dbg +=3D &quot;${libdir}/.debug/libtsan.so.*&quot;<br>
=C2=A0FILES_libtsan-dev +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libtsan.so \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/<a href=3D"http://libtsan.la" rel=3D"noreferr=
er" target=3D"_blank">libtsan.la</a> \<br>
diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/g=
cc/libgcc.inc<br>
index 95fa3f4..68377869 100644<br>
--- a/meta/recipes-devtools/gcc/libgcc.inc<br>
+++ b/meta/recipes-devtools/gcc/libgcc.inc<br>
@@ -21,8 +21,6 @@ FILES_${PN}-dev =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/${TARGET_SYS}/${BINV}* \<br>
=C2=A0&quot;<br>
<br>
-FILES_${PN}-dbg +=3D &quot;${base_libdir}/.debug/&quot;<br>
-<br>
=C2=A0LIBGCCBUILDTREENAME =3D &quot;gcc-build-internal-&quot;<br>
<br>
=C2=A0do_package[depends] +=3D &quot;virtual/${MLPREFIX}libc:do_packagedata=
&quot;<br>
diff --git a/meta/recipes-devtools/perl/<a href=3D"http://libxml-parser-per=
l_2.44.bb" rel=3D"noreferrer" target=3D"_blank">libxml-parser-perl_2.44.bb<=
/a> b/meta/recipes-devtools/perl/<a href=3D"http://libxml-parser-perl_2.44.=
bb" rel=3D"noreferrer" target=3D"_blank">libxml-parser-perl_2.44.bb</a><br>
index 9ccd417..9561a59 100644<br>
--- a/meta/recipes-devtools/perl/<a href=3D"http://libxml-parser-perl_2.44.=
bb" rel=3D"noreferrer" target=3D"_blank">libxml-parser-perl_2.44.bb</a><br>
+++ b/meta/recipes-devtools/perl/<a href=3D"http://libxml-parser-perl_2.44.=
bb" rel=3D"noreferrer" target=3D"_blank">libxml-parser-perl_2.44.bb</a><br>
@@ -31,7 +31,5 @@ do_compile_class-native() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpan_do_compile<br>
=C2=A0}<br>
<br>
-FILES_${PN}-dbg +=3D &quot;${libdir}/perl/vendor_perl/*/auto/XML/Parser/Ex=
pat/.debug/&quot;<br>
-<br>
=C2=A0BBCLASSEXTEND=3D&quot;native&quot;<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python-smartpm_=
git.bb" rel=3D"noreferrer" target=3D"_blank">python-smartpm_git.bb</a> b/me=
ta/recipes-devtools/python/<a href=3D"http://python-smartpm_git.bb" rel=3D"=
noreferrer" target=3D"_blank">python-smartpm_git.bb</a><br>
index d6c378b..139bfd5 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python-smartpm_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">python-smartpm_git.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python-smartpm_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">python-smartpm_git.bb</a><br>
@@ -128,8 +128,6 @@ RDEPENDS_${PN}-interface-gtk =3D &quot;gtk+ ${PN}-inter=
face-images&quot;<br>
<br>
=C2=A0FILES_smartpm =3D &quot;${bindir}/smart&quot;<br>
<br>
-FILES_${PN}-dbg +=3D &quot;${libdir}/python*/site-packages/smart/backends/=
rpm/.debug&quot;<br>
-<br>
=C2=A0FILES_${PN}-backend-rpm =3D &quot;${libdir}/python*/site-packages/sma=
rt/backends/rpm&quot;<br>
<br>
=C2=A0FILES_${PN}-interface-qt4 =3D &quot;${libdir}/python*/site-packages/s=
mart/interfaces/qt4&quot;<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3_3.5.0.b=
b" rel=3D"noreferrer" target=3D"_blank">python3_3.5.0.bb</a> b/meta/recipes=
-devtools/python/<a href=3D"http://python3_3.5.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">python3_3.5.0.bb</a><br>
index 7f6fbdb..a5663a1 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3_3.5.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.5.0.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3_3.5.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.5.0.bb</a><br>
@@ -211,9 +211,6 @@ PACKAGES =3D+ &quot;libpython3 libpython3-staticdev&quo=
t;<br>
=C2=A0FILES_libpython3 =3D &quot;${libdir}/libpython*.so.*&quot;<br>
=C2=A0FILES_libpython3-staticdev +=3D &quot;${libdir}/python${PYTHON_MAJMIN=
}/config-${PYTHON_BINABI}/libpython${PYTHON_BINABI}.a&quot;<br>
<br>
-# catch debug extensions (isn&#39;t that already in python-core-dbg?)<br>
-FILES_${PN}-dbg +=3D &quot;${libdir}/python${PYTHON_MAJMIN}/lib-dynload/.d=
ebug&quot;<br>
-<br>
=C2=A0# catch all the rest (unsorted)<br>
=C2=A0PACKAGES +=3D &quot;${PN}-misc&quot;<br>
=C2=A0RDEPENDS_${PN}-misc +=3D &quot;${PN}-core&quot;<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python_2.7.9.bb=
" rel=3D"noreferrer" target=3D"_blank">python_2.7.9.bb</a> b/meta/recipes-d=
evtools/python/<a href=3D"http://python_2.7.9.bb" rel=3D"noreferrer" target=
=3D"_blank">python_2.7.9.bb</a><br>
index f585a53..0287c19 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python_2.7.9.bb" rel=
=3D"noreferrer" target=3D"_blank">python_2.7.9.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python_2.7.9.bb" rel=
=3D"noreferrer" target=3D"_blank">python_2.7.9.bb</a><br>
@@ -151,9 +151,6 @@ RRECOMMENDS_${PN}-crypt =3D &quot;openssl&quot;<br>
=C2=A0PACKAGES =3D+ &quot;lib${BPN}2&quot;<br>
=C2=A0FILES_lib${BPN}2 =3D &quot;${libdir}/libpython*.so.*&quot;<br>
<br>
-# catch debug extensions (isn&#39;t that already in python-core-dbg?)<br>
-FILES_${PN}-dbg +=3D &quot;${libdir}/python${PYTHON_MAJMIN}/lib-dynload/.d=
ebug&quot;<br>
-<br>
=C2=A0# catch all the rest (unsorted)<br>
=C2=A0PACKAGES +=3D &quot;${PN}-misc&quot;<br>
=C2=A0FILES_${PN}-misc =3D &quot;${libdir}/python${PYTHON_MAJMIN}&quot;<br>
diff --git a/meta/recipes-devtools/rpm/rpm_5.4+<a href=3D"http://cvs.bb" re=
l=3D"noreferrer" target=3D"_blank">cvs.bb</a> b/meta/recipes-devtools/rpm/r=
pm_5.4+<a href=3D"http://cvs.bb" rel=3D"noreferrer" target=3D"_blank">cvs.b=
b</a><br>
index 0b38c3a..2747a24 100644<br>
--- a/meta/recipes-devtools/rpm/rpm_5.4+<a href=3D"http://cvs.bb" rel=3D"no=
referrer" target=3D"_blank">cvs.bb</a><br>
+++ b/meta/recipes-devtools/rpm/rpm_5.4+<a href=3D"http://cvs.bb" rel=3D"no=
referrer" target=3D"_blank">cvs.bb</a><br>
@@ -224,7 +224,7 @@ CFLAGS_append =3D &quot; -DRPM_VENDOR_WINDRIVER -DRPM_V=
ENDOR_POKY -DRPM_VENDOR_OE&quot;<br>
<br>
=C2=A0LDFLAGS_append_libc-uclibc =3D &quot;-lrt -lpthread&quot;<br>
<br>
-PACKAGES =3D &quot;${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev ${PN}-st=
aticdev ${PN}-common ${PN}-build python-rpm-dbg python-rpm-staticdev python=
-rpm-dev python-rpm perl-module-rpm perl-module-rpm-dev ${PN}-locale&quot;<=
br>
+PACKAGES =3D &quot;${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev ${PN}-st=
aticdev ${PN}-common ${PN}-build python-rpm-staticdev python-rpm-dev python=
-rpm perl-module-rpm perl-module-rpm-dev ${PN}-locale&quot;<br>
<br>
=C2=A0SOLIBS =3D &quot;<a href=3D"http://5.4.so" rel=3D"noreferrer" target=
=3D"_blank">5.4.so</a>&quot;<br>
<br>
diff --git a/meta/recipes-devtools/ruby/<a href=3D"http://ruby_2.2.2.bb" re=
l=3D"noreferrer" target=3D"_blank">ruby_2.2.2.bb</a> b/meta/recipes-devtool=
s/ruby/<a href=3D"http://ruby_2.2.2.bb" rel=3D"noreferrer" target=3D"_blank=
">ruby_2.2.2.bb</a><br>
index 78c943c..9b807a7 100644<br>
--- a/meta/recipes-devtools/ruby/<a href=3D"http://ruby_2.2.2.bb" rel=3D"no=
referrer" target=3D"_blank">ruby_2.2.2.bb</a><br>
+++ b/meta/recipes-devtools/ruby/<a href=3D"http://ruby_2.2.2.bb" rel=3D"no=
referrer" target=3D"_blank">ruby_2.2.2.bb</a><br>
@@ -34,9 +34,4 @@ do_install() {<br>
=C2=A0FILES_${PN} +=3D &quot;${datadir}/rubygems \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/ri=
&quot;<br>
<br>
-FILES_${PN}-dbg +=3D &quot;${libdir}/ruby/*/.debug \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${li=
bdir}/ruby/*/*/.debug \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${li=
bdir}/ruby/*/*/*/.debug \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${li=
bdir}/ruby/*/*/*/*/.debug&quot;<br>
-<br>
=C2=A0BBCLASSEXTEND =3D &quot;native&quot;<br>
diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/va=
la/vala.inc<br>
index c98244b..43f9bb3 100644<br>
--- a/meta/recipes-devtools/vala/vala.inc<br>
+++ b/meta/recipes-devtools/vala/vala.inc<br>
@@ -15,4 +15,3 @@ inherit autotools pkgconfig upstream-version-is-even<br>
<br>
=C2=A0FILES_${PN} +=3D &quot;${datadir}/${BPN}-${SHRT_VER}/vapi ${libdir}/$=
{BPN}-${SHRT_VER}/&quot;<br>
=C2=A0FILES_${PN}-doc +=3D &quot;${datadir}/devhelp&quot;<br>
-FILES_${PN}-dbg +=3D &quot;${libdir}/${BPN}-${SHRT_VER}/.debug&quot;<br>
diff --git a/meta/recipes-devtools/valgrind/<a href=3D"http://valgrind_3.10=
.1.bb" rel=3D"noreferrer" target=3D"_blank">valgrind_3.10.1.bb</a> b/meta/r=
ecipes-devtools/valgrind/<a href=3D"http://valgrind_3.10.1.bb" rel=3D"noref=
errer" target=3D"_blank">valgrind_3.10.1.bb</a><br>
index c386a19..c38a07b 100644<br>
--- a/meta/recipes-devtools/valgrind/<a href=3D"http://valgrind_3.10.1.bb" =
rel=3D"noreferrer" target=3D"_blank">valgrind_3.10.1.bb</a><br>
+++ b/meta/recipes-devtools/valgrind/<a href=3D"http://valgrind_3.10.1.bb" =
rel=3D"noreferrer" target=3D"_blank">valgrind_3.10.1.bb</a><br>
@@ -50,8 +50,6 @@ do_install_append () {<br>
<br>
=C2=A0RDEPENDS_${PN} +=3D &quot;perl&quot;<br>
<br>
-FILES_${PN}-dbg +=3D &quot;${libdir}/${PN}/*/.debug/*&quot;<br>
-<br>
=C2=A0# valgrind needs debug information for ld.so at runtime in order to<b=
r>
=C2=A0# redirect functions like strlen.<br>
=C2=A0RRECOMMENDS_${PN} +=3D &quot;${TCLIBC}-dbg&quot;<br>
diff --git a/meta/recipes-extended/cracklib/<a href=3D"http://cracklib_2.9.=
5.bb" rel=3D"noreferrer" target=3D"_blank">cracklib_2.9.5.bb</a> b/meta/rec=
ipes-extended/cracklib/<a href=3D"http://cracklib_2.9.5.bb" rel=3D"noreferr=
er" target=3D"_blank">cracklib_2.9.5.bb</a><br>
index 35817c9..8c9063e 100644<br>
--- a/meta/recipes-extended/cracklib/<a href=3D"http://cracklib_2.9.5.bb" r=
el=3D"noreferrer" target=3D"_blank">cracklib_2.9.5.bb</a><br>
+++ b/meta/recipes-extended/cracklib/<a href=3D"http://cracklib_2.9.5.bb" r=
el=3D"noreferrer" target=3D"_blank">cracklib_2.9.5.bb</a><br>
@@ -45,7 +45,6 @@ BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
=C2=A0FILES_${PN}-python =3D &quot;${PYTHON_SITEPACKAGES_DIR}/cracklib.py \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_SITEPACKAGES_DIR}/_cracklib.so \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
-FILES_${PN}-dbg +=3D &quot;${PYTHON_SITEPACKAGES_DIR}/.debug/_cracklib.so&=
quot;<br>
=C2=A0FILES_${PN}-staticdev +=3D &quot;${PYTHON_SITEPACKAGES_DIR}/_cracklib=
.a \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_SITEPACKAGES_DIR}/_<a href=3D"http://c=
racklib.la" rel=3D"noreferrer" target=3D"_blank">cracklib.la</a> \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
diff --git a/meta/recipes-extended/gawk/<a href=3D"http://gawk_3.1.5.bb" re=
l=3D"noreferrer" target=3D"_blank">gawk_3.1.5.bb</a> b/meta/recipes-extende=
d/gawk/<a href=3D"http://gawk_3.1.5.bb" rel=3D"noreferrer" target=3D"_blank=
">gawk_3.1.5.bb</a><br>
index c7af4a9..bc188fa 100644<br>
--- a/meta/recipes-extended/gawk/<a href=3D"http://gawk_3.1.5.bb" rel=3D"no=
referrer" target=3D"_blank">gawk_3.1.5.bb</a><br>
+++ b/meta/recipes-extended/gawk/<a href=3D"http://gawk_3.1.5.bb" rel=3D"no=
referrer" target=3D"_blank">gawk_3.1.5.bb</a><br>
@@ -28,7 +28,6 @@ PACKAGES +=3D &quot;gawk-common pgawk&quot;<br>
=C2=A0FILES_${PN} =3D &quot;${bindir}/gawk* ${bindir}/igawk&quot;<br>
=C2=A0FILES_gawk-common +=3D &quot;${datadir}/awk/* ${libdir}/gawk/awk/*&qu=
ot;<br>
=C2=A0FILES_pgawk =3D &quot;${bindir}/pgawk*&quot;<br>
-FILES_${PN}-dbg +=3D &quot;${libdir}/gawk/awk/.debug&quot;<br>
<br>
=C2=A0ALTERNATIVE_${PN} =3D &quot;awk&quot;<br>
=C2=A0ALTERNATIVE_TARGET[awk] =3D &quot;${bindir}/gawk&quot;<br>
diff --git a/meta/recipes-extended/gawk/<a href=3D"http://gawk_4.1.3.bb" re=
l=3D"noreferrer" target=3D"_blank">gawk_4.1.3.bb</a> b/meta/recipes-extende=
d/gawk/<a href=3D"http://gawk_4.1.3.bb" rel=3D"noreferrer" target=3D"_blank=
">gawk_4.1.3.bb</a><br>
index d1a88e4..6ca7f3e 100644<br>
--- a/meta/recipes-extended/gawk/<a href=3D"http://gawk_4.1.3.bb" rel=3D"no=
referrer" target=3D"_blank">gawk_4.1.3.bb</a><br>
+++ b/meta/recipes-extended/gawk/<a href=3D"http://gawk_4.1.3.bb" rel=3D"no=
referrer" target=3D"_blank">gawk_4.1.3.bb</a><br>
@@ -26,7 +26,6 @@ inherit autotools gettext texinfo update-alternatives<br>
<br>
=C2=A0FILES_${PN} +=3D &quot;${datadir}/awk&quot;<br>
=C2=A0FILES_${PN}-dev +=3D &quot;${libdir}/${BPN}/*.la&quot;<br>
-FILES_${PN}-dbg +=3D &quot;${libexecdir}/awk/.debug&quot;<br>
<br>
=C2=A0ALTERNATIVE_${PN} =3D &quot;awk&quot;<br>
=C2=A0ALTERNATIVE_TARGET[awk] =3D &quot;${bindir}/gawk&quot;<br>
diff --git a/meta/recipes-extended/iptables/<a href=3D"http://iptables_1.4.=
21.bb" rel=3D"noreferrer" target=3D"_blank">iptables_1.4.21.bb</a> b/meta/r=
ecipes-extended/iptables/<a href=3D"http://iptables_1.4.21.bb" rel=3D"noref=
errer" target=3D"_blank">iptables_1.4.21.bb</a><br>
index deea5e5..4118f54 100644<br>
--- a/meta/recipes-extended/iptables/<a href=3D"http://iptables_1.4.21.bb" =
rel=3D"noreferrer" target=3D"_blank">iptables_1.4.21.bb</a><br>
+++ b/meta/recipes-extended/iptables/<a href=3D"http://iptables_1.4.21.bb" =
rel=3D"noreferrer" target=3D"_blank">iptables_1.4.21.bb</a><br>
@@ -17,7 +17,6 @@ RRECOMMENDS_${PN} =3D &quot;kernel-module-x-tables \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel-module-nf-nat \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel-module-ipt-masquerade&quot;<br>
=C2=A0FILES_${PN} =3D+ &quot;${libdir}/xtables/ ${datadir}/xtables&quot;<br=
>
-FILES_${PN}-dbg =3D+ &quot;${libdir}/xtables/.debug&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://netfilter.org/projects/iptables/f=
iles/iptables-${PV}.tar.bz2" rel=3D"noreferrer" target=3D"_blank">http://ne=
tfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://types.h-add-defines-that-a=
re-required-for-if_packet.patch \<br>
diff --git a/meta/recipes-extended/libsolv/<a href=3D"http://libsolv_git.bb=
" rel=3D"noreferrer" target=3D"_blank">libsolv_git.bb</a> b/meta/recipes-ex=
tended/libsolv/<a href=3D"http://libsolv_git.bb" rel=3D"noreferrer" target=
=3D"_blank">libsolv_git.bb</a><br>
index 2011487..78a2d51 100644<br>
--- a/meta/recipes-extended/libsolv/<a href=3D"http://libsolv_git.bb" rel=
=3D"noreferrer" target=3D"_blank">libsolv_git.bb</a><br>
+++ b/meta/recipes-extended/libsolv/<a href=3D"http://libsolv_git.bb" rel=
=3D"noreferrer" target=3D"_blank">libsolv_git.bb</a><br>
@@ -18,11 +18,10 @@ inherit cmake<br>
<br>
=C2=A0EXTRA_OECMAKE =3D &quot;-DLIB=3D${baselib}&quot;<br>
<br>
-PACKAGES =3D+ &quot;${PN}-tools ${PN}ext ${PN}ext-dbg&quot;<br>
+PACKAGES =3D+ &quot;${PN}-tools ${PN}ext&quot;<br>
<br>
=C2=A0FILES_${PN}-dev +=3D &quot;${datadir}/cmake/Modules/FindLibSolv.cmake=
&quot;<br>
=C2=A0FILES_${PN}-tools =3D &quot;${bindir}/*&quot;<br>
=C2=A0FILES_${PN}ext =3D &quot;${libdir}/${PN}ext.so.*&quot;<br>
-FILES_${PN}ext-dbg =3D &quot;${libdir}/.debug/${PN}ext.so.*&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D+ &quot;native nativesdk&quot;<br>
diff --git a/meta/recipes-extended/libuser/<a href=3D"http://libuser_0.62.b=
b" rel=3D"noreferrer" target=3D"_blank">libuser_0.62.bb</a> b/meta/recipes-=
extended/libuser/<a href=3D"http://libuser_0.62.bb" rel=3D"noreferrer" targ=
et=3D"_blank">libuser_0.62.bb</a><br>
index c4ed459..4caa8a1 100644<br>
--- a/meta/recipes-extended/libuser/<a href=3D"http://libuser_0.62.bb" rel=
=3D"noreferrer" target=3D"_blank">libuser_0.62.bb</a><br>
+++ b/meta/recipes-extended/libuser/<a href=3D"http://libuser_0.62.bb" rel=
=3D"noreferrer" target=3D"_blank">libuser_0.62.bb</a><br>
@@ -25,6 +25,5 @@ EXTRA_OEMAKE =3D &quot;PYTHON_CPPFLAGS=3D-I${STAGING_INCD=
IR}/${PYTHON_DIR}&quot;<br>
<br>
=C2=A0PACKAGES +=3D &quot;${PN}-python &quot;<br>
<br>
-FILES_${PN}-dbg +=3D &quot;${PYTHON_SITEPACKAGES_DIR}/.debug&quot;<br>
=C2=A0FILES_${PN}-python =3D &quot;${PYTHON_SITEPACKAGES_DIR}&quot;<br>
<br>
diff --git a/meta/recipes-extended/mc/<a href=3D"http://mc_4.7.5.2.bb" rel=
=3D"noreferrer" target=3D"_blank">mc_4.7.5.2.bb</a> b/meta/recipes-extended=
/mc/<a href=3D"http://mc_4.7.5.2.bb" rel=3D"noreferrer" target=3D"_blank">m=
c_4.7.5.2.bb</a><br>
index b47eb02..b38964d 100644<br>
--- a/meta/recipes-extended/mc/<a href=3D"http://mc_4.7.5.2.bb" rel=3D"nore=
ferrer" target=3D"_blank">mc_4.7.5.2.bb</a><br>
+++ b/meta/recipes-extended/mc/<a href=3D"http://mc_4.7.5.2.bb" rel=3D"nore=
ferrer" target=3D"_blank">mc_4.7.5.2.bb</a><br>
@@ -19,8 +19,6 @@ inherit autotools gettext pkgconfig<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;--with-screen=3Dncurses --without-gpm-mouse --=
without-x --without-samba&quot;<br>
<br>
-FILES_${PN}-dbg +=3D &quot;${libexecdir}/mc/.debug/&quot;<br>
-<br>
=C2=A0do_install_append () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;1s,#!.*perl,#!${bindir}/env perl=
,&#39; ${D}${libexecdir}/mc/extfs.d/*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;1s,#!.*python,#!${bindir}/env py=
thon,&#39; ${D}${libexecdir}/mc/extfs.d/*<br>
diff --git a/meta/recipes-extended/mc/<a href=3D"http://mc_4.8.15.bb" rel=
=3D"noreferrer" target=3D"_blank">mc_4.8.15.bb</a> b/meta/recipes-extended/=
mc/<a href=3D"http://mc_4.8.15.bb" rel=3D"noreferrer" target=3D"_blank">mc_=
4.8.15.bb</a><br>
index ed53760..6c3a16a 100644<br>
--- a/meta/recipes-extended/mc/<a href=3D"http://mc_4.8.15.bb" rel=3D"noref=
errer" target=3D"_blank">mc_4.8.15.bb</a><br>
+++ b/meta/recipes-extended/mc/<a href=3D"http://mc_4.8.15.bb" rel=3D"noref=
errer" target=3D"_blank">mc_4.8.15.bb</a><br>
@@ -22,8 +22,6 @@ PACKAGECONFIG[sftp] =3D &quot;--enable-vfs-sftp,--disable=
-vfs-sftp,libssh2,&quot;<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;--with-screen=3Dncurses --without-gpm-mouse --=
without-x&quot;<br>
<br>
-FILES_${PN}-dbg +=3D &quot;${libexecdir}/mc/.debug/&quot;<br>
-<br>
=C2=A0do_install_append () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;1s,#!.*perl,#!${bindir}/env perl=
,&#39; ${D}${libexecdir}/mc/extfs.d/*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;1s,#!.*python,#!${bindir}/env py=
thon,&#39; ${D}${libexecdir}/mc/extfs.d/*<br>
diff --git a/meta/recipes-extended/newt/<a href=3D"http://libnewt-python_0.=
52.18.bb" rel=3D"noreferrer" target=3D"_blank">libnewt-python_0.52.18.bb</a=
> b/meta/recipes-extended/newt/<a href=3D"http://libnewt-python_0.52.18.bb"=
 rel=3D"noreferrer" target=3D"_blank">libnewt-python_0.52.18.bb</a><br>
index 94a41a3..ba04757 100644<br>
--- a/meta/recipes-extended/newt/<a href=3D"http://libnewt-python_0.52.18.b=
b" rel=3D"noreferrer" target=3D"_blank">libnewt-python_0.52.18.bb</a><br>
+++ b/meta/recipes-extended/newt/<a href=3D"http://libnewt-python_0.52.18.b=
b" rel=3D"noreferrer" target=3D"_blank">libnewt-python_0.52.18.bb</a><br>
@@ -24,6 +24,5 @@ do_install () {<br>
=C2=A0PACKAGES_remove =3D &quot;whiptail&quot;<br>
<br>
=C2=A0FILES_${PN} =3D &quot;${PYTHON_SITEPACKAGES_DIR}/*&quot;<br>
-FILES_${PN}-dbg +=3D &quot;${PYTHON_SITEPACKAGES_DIR}/.debug/&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native&quot;<br>
diff --git a/meta/recipes-extended/slang/<a href=3D"http://slang_2.2.4.bb" =
rel=3D"noreferrer" target=3D"_blank">slang_2.2.4.bb</a> b/meta/recipes-exte=
nded/slang/<a href=3D"http://slang_2.2.4.bb" rel=3D"noreferrer" target=3D"_=
blank">slang_2.2.4.bb</a><br>
index e33e868..bfaa9a5 100644<br>
--- a/meta/recipes-extended/slang/<a href=3D"http://slang_2.2.4.bb" rel=3D"=
noreferrer" target=3D"_blank">slang_2.2.4.bb</a><br>
+++ b/meta/recipes-extended/slang/<a href=3D"http://slang_2.2.4.bb" rel=3D"=
noreferrer" target=3D"_blank">slang_2.2.4.bb</a><br>
@@ -48,7 +48,6 @@ do_install() {<br>
=C2=A0}<br>
<br>
=C2=A0FILES_${PN} +=3D &quot;${libdir}/${BPN}/v2/modules/ ${datadir}/slsh/&=
quot;<br>
-FILES_${PN}-dbg +=3D &quot;${libdir}/${BPN}/v2/modules/.debug&quot;<br>
<br>
=C2=A0PARALLEL_MAKE =3D &quot;&quot;<br>
<br>
diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-exten=
ded/sysstat/sysstat.inc<br>
index 85be902..a954bba 100644<br>
--- a/meta/recipes-extended/sysstat/sysstat.inc<br>
+++ b/meta/recipes-extended/sysstat/sysstat.inc<br>
@@ -51,7 +51,6 @@ pkg_postinst_${PN} () {<br>
<br>
<br>
=C2=A0FILES_${PN} +=3D &quot;${libdir}/sa&quot;<br>
-FILES_${PN}-dbg +=3D &quot;${libdir}/sa/.debug/&quot;<br>
<br>
=C2=A0TARGET_CC_ARCH +=3D &quot;${LDFLAGS}&quot;<br>
=C2=A0LDFLAGS_append_libc-uclibc =3D &quot; -lintl&quot;<br>
diff --git a/meta/recipes-gnome/epiphany/<a href=3D"http://epiphany_3.16.3.=
bb" rel=3D"noreferrer" target=3D"_blank">epiphany_3.16.3.bb</a> b/meta/reci=
pes-gnome/epiphany/<a href=3D"http://epiphany_3.16.3.bb" rel=3D"noreferrer"=
 target=3D"_blank">epiphany_3.16.3.bb</a><br>
index 3ff35fc..09633a6 100644<br>
--- a/meta/recipes-gnome/epiphany/<a href=3D"http://epiphany_3.16.3.bb" rel=
=3D"noreferrer" target=3D"_blank">epiphany_3.16.3.bb</a><br>
+++ b/meta/recipes-gnome/epiphany/<a href=3D"http://epiphany_3.16.3.bb" rel=
=3D"noreferrer" target=3D"_blank">epiphany_3.16.3.bb</a><br>
@@ -21,7 +21,6 @@ do_configure_prepend() {<br>
=C2=A0}<br>
<br>
=C2=A0FILES_${PN} +=3D &quot;${datadir}/appdata ${datadir}/dbus-1 ${datadir=
}/gnome-shell/search-providers&quot;<br>
-FILES_${PN}-dbg +=3D &quot;${libdir}/epiphany/*/web-extensions/.debug/libe=
phywebextension.so&quot;<br>
=C2=A0RDEPENDS_${PN} =3D &quot;iso-codes adwaita-icon-theme&quot;<br>
=C2=A0RRECOMMENDS_${PN} =3D &quot;ca-certificates&quot;<br>
<br>
diff --git a/meta/recipes-gnome/gdk-pixbuf/<a href=3D"http://gdk-pixbuf_2.3=
2.1.bb" rel=3D"noreferrer" target=3D"_blank">gdk-pixbuf_2.32.1.bb</a> b/met=
a/recipes-gnome/gdk-pixbuf/<a href=3D"http://gdk-pixbuf_2.32.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">gdk-pixbuf_2.32.1.bb</a><br>
index dc05a03..084fe36 100644<br>
--- a/meta/recipes-gnome/gdk-pixbuf/<a href=3D"http://gdk-pixbuf_2.32.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">gdk-pixbuf_2.32.1.bb</a><br>
+++ b/meta/recipes-gnome/gdk-pixbuf/<a href=3D"http://gdk-pixbuf_2.32.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">gdk-pixbuf_2.32.1.bb</a><br>
@@ -58,12 +58,6 @@ FILES_${PN}-dev +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders/*.la \=
<br>
=C2=A0&quot;<br>
<br>
-FILES_${PN}-dbg +=3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/.debug/* \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/gdk-pixbuf-2.0/.debug/* \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders/.debug=
/* \<br>
-&quot;<br>
-<br>
=C2=A0PACKAGES_DYNAMIC +=3D &quot;^gdk-pixbuf-loader-.*&quot;<br>
=C2=A0PACKAGES_DYNAMIC_class-native =3D &quot;&quot;<br>
<br>
diff --git a/meta/recipes-gnome/gnome/<a href=3D"http://gconf_3.2.6.bb" rel=
=3D"noreferrer" target=3D"_blank">gconf_3.2.6.bb</a> b/meta/recipes-gnome/g=
nome/<a href=3D"http://gconf_3.2.6.bb" rel=3D"noreferrer" target=3D"_blank"=
>gconf_3.2.6.bb</a><br>
index 17fdafa..cd1df1a 100644<br>
--- a/meta/recipes-gnome/gnome/<a href=3D"http://gconf_3.2.6.bb" rel=3D"nor=
eferrer" target=3D"_blank">gconf_3.2.6.bb</a><br>
+++ b/meta/recipes-gnome/gnome/<a href=3D"http://gconf_3.2.6.bb" rel=3D"nor=
eferrer" target=3D"_blank">gconf_3.2.6.bb</a><br>
@@ -54,7 +54,6 @@ FILES_${PN} +=3D &quot;${libdir}/GConf/* \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/db=
us-1/services/*.service \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/db=
us-1/system-services/*.service \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-FILES_${PN}-dbg +=3D &quot;${libdir}/*/*/.debug&quot;<br>
=C2=A0FILES_${PN}-dev +=3D &quot;${datadir}/sgml/gconf/gconf-1.0.dtd&quot;<=
br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native&quot;<br>
diff --git a/meta/recipes-gnome/gtk-engines/<a href=3D"http://gtk-engines_2=
.20.2.bb" rel=3D"noreferrer" target=3D"_blank">gtk-engines_2.20.2.bb</a> b/=
meta/recipes-gnome/gtk-engines/<a href=3D"http://gtk-engines_2.20.2.bb" rel=
=3D"noreferrer" target=3D"_blank">gtk-engines_2.20.2.bb</a><br>
index aaf8cab..c0ac911 100644<br>
--- a/meta/recipes-gnome/gtk-engines/<a href=3D"http://gtk-engines_2.20.2.b=
b" rel=3D"noreferrer" target=3D"_blank">gtk-engines_2.20.2.bb</a><br>
+++ b/meta/recipes-gnome/gtk-engines/<a href=3D"http://gtk-engines_2.20.2.b=
b" rel=3D"noreferrer" target=3D"_blank">gtk-engines_2.20.2.bb</a><br>
@@ -24,7 +24,6 @@ RDEPENDS_gtk-theme-clearlooks =3D &quot;gtk-engine-clearl=
ooks&quot;<br>
<br>
=C2=A0FILES_${PN} =3D &quot;&quot;<br>
=C2=A0FILES_${PN}-dev +=3D &quot;${libdir}/gtk-2.0/*/engines/*.la&quot;<br>
-FILES_${PN}-dbg +=3D &quot;${libdir}/gtk-2.0/*/engines/.debug&quot;<br>
=C2=A0FILES_${PN}-schemas =3D &quot;${datadir}/gtk-engines/*.xml&quot;<br>
<br>
=C2=A0CFLAGS_prepend =3D &quot;-DHAVE_ANIMATION &quot;<br>
diff --git a/meta/recipes-gnome/librsvg/<a href=3D"http://librsvg_2.40.11.b=
b" rel=3D"noreferrer" target=3D"_blank">librsvg_2.40.11.bb</a> b/meta/recip=
es-gnome/librsvg/<a href=3D"http://librsvg_2.40.11.bb" rel=3D"noreferrer" t=
arget=3D"_blank">librsvg_2.40.11.bb</a><br>
index 3ce1e55..d57c69d 100644<br>
--- a/meta/recipes-gnome/librsvg/<a href=3D"http://librsvg_2.40.11.bb" rel=
=3D"noreferrer" target=3D"_blank">librsvg_2.40.11.bb</a><br>
+++ b/meta/recipes-gnome/librsvg/<a href=3D"http://librsvg_2.40.11.bb" rel=
=3D"noreferrer" target=3D"_blank">librsvg_2.40.11.bb</a><br>
@@ -38,7 +38,6 @@ do_install_append() {<br>
<br>
=C2=A0PACKAGES =3D+ &quot;librsvg-gtk rsvg&quot;<br>
=C2=A0FILES_${PN} =3D &quot;${libdir}/*.so.*&quot;<br>
-FILES_${PN}-dbg +=3D &quot;${libdir}/gdk-pixbuf-2.0/*/loaders/.debug&quot;=
<br>
=C2=A0FILES_rsvg =3D &quot;${bindir}/rsvg* \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/pixmaps/svg-vie=
wer.svg \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/themes&quot;<br=
>
diff --git a/meta/recipes-graphics/harfbuzz/<a href=3D"http://harfbuzz_1.1.=
2.bb" rel=3D"noreferrer" target=3D"_blank">harfbuzz_1.1.2.bb</a> b/meta/rec=
ipes-graphics/harfbuzz/<a href=3D"http://harfbuzz_1.1.2.bb" rel=3D"noreferr=
er" target=3D"_blank">harfbuzz_1.1.2.bb</a><br>
index f34a647..db1e578 100644<br>
--- a/meta/recipes-graphics/harfbuzz/<a href=3D"http://harfbuzz_1.1.2.bb" r=
el=3D"noreferrer" target=3D"_blank">harfbuzz_1.1.2.bb</a><br>
+++ b/meta/recipes-graphics/harfbuzz/<a href=3D"http://harfbuzz_1.1.2.bb" r=
el=3D"noreferrer" target=3D"_blank">harfbuzz_1.1.2.bb</a><br>
@@ -25,10 +25,9 @@ EXTRA_OECONF =3D &quot;--with-glib --with-freetype --wit=
h-cairo --without-graphite2&quot;<br>
=C2=A0PACKAGECONFIG ??=3D &quot;icu&quot;<br>
=C2=A0PACKAGECONFIG[icu] =3D &quot;--with-icu,--without-icu,icu&quot;<br>
<br>
-PACKAGES =3D+ &quot;${PN}-icu ${PN}-icu-dbg ${PN}-icu-dev&quot;<br>
+PACKAGES =3D+ &quot;${PN}-icu ${PN}-icu-dev&quot;<br>
<br>
=C2=A0FILES_${PN}-icu =3D &quot;${libdir}/libharfbuzz-icu.so.*&quot;<br>
-FILES_${PN}-icu-dbg =3D &quot;${libdir}/.debug/libharfbuzz-icu.so*&quot;<b=
r>
=C2=A0FILES_${PN}-icu-dev =3D &quot;${libdir}/<a href=3D"http://libharfbuzz=
-icu.la" rel=3D"noreferrer" target=3D"_blank">libharfbuzz-icu.la</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ${libdir}/libharfbuzz-icu.so \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ${libdir}/pkgconfig/harfbuzz-icu.pc \<br>
diff --git a/meta/recipes-graphics/piglit/<a href=3D"http://piglit_git.bb" =
rel=3D"noreferrer" target=3D"_blank">piglit_git.bb</a> b/meta/recipes-graph=
ics/piglit/<a href=3D"http://piglit_git.bb" rel=3D"noreferrer" target=3D"_b=
lank">piglit_git.bb</a><br>
index 0d825c9..e0bd1fe 100644<br>
--- a/meta/recipes-graphics/piglit/<a href=3D"http://piglit_git.bb" rel=3D"=
noreferrer" target=3D"_blank">piglit_git.bb</a><br>
+++ b/meta/recipes-graphics/piglit/<a href=3D"http://piglit_git.bb" rel=3D"=
noreferrer" target=3D"_blank">piglit_git.bb</a><br>
@@ -28,8 +28,6 @@ do_configure_prepend() {<br>
=C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
<br>
-FILES_${PN}-dbg +=3D &quot;${libdir}/piglit/*/.debug/&quot;<br>
-<br>
=C2=A0RDEPENDS_${PN} =3D &quot;waffle python python-mako python-json python=
-subprocess \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-argparse python-importlib python-unixadm=
in \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-multiprocessing python-textutils python-=
netserver python-shell \<br>
diff --git a/meta/recipes-graphics/tslib/<a href=3D"http://tslib_1.1.bb" re=
l=3D"noreferrer" target=3D"_blank">tslib_1.1.bb</a> b/meta/recipes-graphics=
/tslib/<a href=3D"http://tslib_1.1.bb" rel=3D"noreferrer" target=3D"_blank"=
>tslib_1.1.bb</a><br>
index 8e304a6..b0264c3 100644<br>
--- a/meta/recipes-graphics/tslib/<a href=3D"http://tslib_1.1.bb" rel=3D"no=
referrer" target=3D"_blank">tslib_1.1.bb</a><br>
+++ b/meta/recipes-graphics/tslib/<a href=3D"http://tslib_1.1.bb" rel=3D"no=
referrer" target=3D"_blank">tslib_1.1.bb</a><br>
@@ -46,7 +46,6 @@ DEBIAN_NOAUTONAME_tslib-calibrate =3D &quot;1&quot;<br>
=C2=A0RDEPENDS_${PN} =3D &quot;tslib-conf&quot;<br>
=C2=A0RRECOMMENDS_${PN} =3D &quot;pointercal&quot;<br>
<br>
-FILES_${PN}-dbg +=3D &quot;${libdir}/ts/.debug*&quot;<br>
=C2=A0FILES_${PN}-dev +=3D &quot;${libdir}/ts/*.la&quot;<br>
=C2=A0FILES_tslib-conf =3D &quot;${sysconfdir}/ts.conf ${sysconfdir}/profil=
e.d/tslib.sh ${datadir}/tslib&quot;<br>
=C2=A0FILES_${PN} =3D &quot;${libdir}/*.so.* ${libdir}/ts/*.so*&quot;<br>
diff --git a/meta/recipes-graphics/wayland/<a href=3D"http://libinput_0.21.=
0.bb" rel=3D"noreferrer" target=3D"_blank">libinput_0.21.0.bb</a> b/meta/re=
cipes-graphics/wayland/<a href=3D"http://libinput_0.21.0.bb" rel=3D"norefer=
rer" target=3D"_blank">libinput_0.21.0.bb</a><br>
index ac5a249..f6c5975 100644<br>
--- a/meta/recipes-graphics/wayland/<a href=3D"http://libinput_0.21.0.bb" r=
el=3D"noreferrer" target=3D"_blank">libinput_0.21.0.bb</a><br>
+++ b/meta/recipes-graphics/wayland/<a href=3D"http://libinput_0.21.0.bb" r=
el=3D"noreferrer" target=3D"_blank">libinput_0.21.0.bb</a><br>
@@ -21,4 +21,3 @@ PACKAGECONFIG[libunwind] =3D &quot;--with-libunwind,--wit=
hout-libunwind,libunwind&quot;<br>
=C2=A0PACKAGECONFIG[gui] =3D &quot;--enable-event-gui,--disable-event-gui,c=
airo gtk+3&quot;<br>
<br>
=C2=A0FILES_${PN} +=3D &quot;${libdir}/udev/&quot;<br>
-FILES_${PN}-dbg +=3D &quot;${libdir}/udev/.debug&quot;<br>
diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b/met=
a/recipes-graphics/xorg-driver/xorg-driver-common.inc<br>
index 7ddd1c7..57a4c82 100644<br>
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc<br>
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc<br>
@@ -12,7 +12,6 @@ DEPENDS =3D &quot;virtual/xserver xproto randrproto util-=
macros&quot;<br>
=C2=A0SRC_URI =3D &quot;${XORG_MIRROR}/individual/driver/${BPN}-${PV}.tar.b=
z2&quot;<br>
<br>
=C2=A0FILES_${PN} +=3D &quot; ${libdir}/xorg/modules/drivers/*.so&quot;<br>
-FILES_${PN}-dbg +=3D &quot; ${libdir}/xorg/modules/drivers/.debug&quot;<br=
>
<br>
=C2=A0inherit autotools pkgconfig distro_features_check<br>
=C2=A0# depends on virtual/xserver<br>
diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc b/meta=
/recipes-graphics/xorg-driver/xorg-driver-input.inc<br>
index 21b60c4..c4dba1b 100644<br>
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc<br>
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc<br>
@@ -10,4 +10,3 @@ PACKAGEFUNCS =3D+ &quot;add_xorg_abi_depends&quot;<br>
=C2=A0FILES_${PN} +=3D &quot; ${libdir}/xorg/modules/input/*.so \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/X=
11/xorg.conf.d \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-FILES_${PN}-dbg +=3D &quot; ${libdir}/xorg/modules/input/.debug&quot;<br>
diff --git a/meta/recipes-kernel/cryptodev/<a href=3D"http://cryptodev-test=
s_1.7.bb" rel=3D"noreferrer" target=3D"_blank">cryptodev-tests_1.7.bb</a> b=
/meta/recipes-kernel/cryptodev/<a href=3D"http://cryptodev-tests_1.7.bb" re=
l=3D"noreferrer" target=3D"_blank">cryptodev-tests_1.7.bb</a><br>
index be59a4a..f1ca36e 100644<br>
--- a/meta/recipes-kernel/cryptodev/<a href=3D"http://cryptodev-tests_1.7.b=
b" rel=3D"noreferrer" target=3D"_blank">cryptodev-tests_1.7.bb</a><br>
+++ b/meta/recipes-kernel/cryptodev/<a href=3D"http://cryptodev-tests_1.7.b=
b" rel=3D"noreferrer" target=3D"_blank">cryptodev-tests_1.7.bb</a><br>
@@ -19,5 +19,4 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake install_tests<br>
=C2=A0}<br>
<br>
-FILES_${PN}-dbg +=3D &quot;${bindir}/tests_cryptodev/.debug&quot;<br>
=C2=A0FILES_${PN} =3D &quot;${bindir}/tests_cryptodev/*&quot;<br>
diff --git a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"nor=
eferrer" target=3D"_blank">perf.bb</a> b/meta/recipes-kernel/perf/<a href=
=3D"http://perf.bb" rel=3D"noreferrer" target=3D"_blank">perf.bb</a><br>
index 22bd3c8..33acb42 100644<br>
--- a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
+++ b/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
@@ -200,7 +200,6 @@ RSUGGESTS_SCRIPTING =3D &quot;${@perf_feature_enabled(&=
#39;perf-scripting&#39;, &#39;${PN}-perl ${P<br>
=C2=A0RSUGGESTS_${PN} +=3D &quot;${PN}-archive ${PN}-tests ${RSUGGESTS_SCRI=
PTING}&quot;<br>
<br>
=C2=A0FILES_${PN} +=3D &quot;${libexecdir}/perf-core ${exec_prefix}/libexec=
/perf-core ${libdir}/traceevent&quot;<br>
-FILES_${PN}-dbg +=3D &quot;${libdir}/python*/site-packages/.debug&quot;<br=
>
=C2=A0FILES_${PN}-archive =3D &quot;${libdir}/perf/perf-core/perf-archive&q=
uot;<br>
=C2=A0FILES_${PN}-tests =3D &quot;${libdir}/perf/perf-core/tests&quot;<br>
=C2=A0FILES_${PN}-python =3D &quot;${libdir}/python*/site-packages ${libdir=
}/perf/perf-core/scripts/python&quot;<br>
diff --git a/meta/recipes-kernel/systemtap/<a href=3D"http://systemtap_git.=
bb" rel=3D"noreferrer" target=3D"_blank">systemtap_git.bb</a> b/meta/recipe=
s-kernel/systemtap/<a href=3D"http://systemtap_git.bb" rel=3D"noreferrer" t=
arget=3D"_blank">systemtap_git.bb</a><br>
index d0dd42a..97064b8 100644<br>
--- a/meta/recipes-kernel/systemtap/<a href=3D"http://systemtap_git.bb" rel=
=3D"noreferrer" target=3D"_blank">systemtap_git.bb</a><br>
+++ b/meta/recipes-kernel/systemtap/<a href=3D"http://systemtap_git.bb" rel=
=3D"noreferrer" target=3D"_blank">systemtap_git.bb</a><br>
@@ -26,5 +26,3 @@ PACKAGECONFIG[libvirt] =3D &quot;--enable-libvirt,--disab=
le-libvirt,libvirt&quot;<br>
=C2=A0inherit autotools gettext pkgconfig<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-<br>
-FILES_${PN}-dbg +=3D &quot;${libexecdir}/systemtap/.debug&quot;<br>
diff --git a/meta/recipes-kernel/trace-cmd/<a href=3D"http://trace-cmd_git.=
bb" rel=3D"noreferrer" target=3D"_blank">trace-cmd_git.bb</a> b/meta/recipe=
s-kernel/trace-cmd/<a href=3D"http://trace-cmd_git.bb" rel=3D"noreferrer" t=
arget=3D"_blank">trace-cmd_git.bb</a><br>
index b1ac789..dd9a8a0 100644<br>
--- a/meta/recipes-kernel/trace-cmd/<a href=3D"http://trace-cmd_git.bb" rel=
=3D"noreferrer" target=3D"_blank">trace-cmd_git.bb</a><br>
+++ b/meta/recipes-kernel/trace-cmd/<a href=3D"http://trace-cmd_git.bb" rel=
=3D"noreferrer" target=3D"_blank">trace-cmd_git.bb</a><br>
@@ -22,8 +22,6 @@ EXTRA_OEMAKE =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0NO_PYTHON=3D1 \<br>
=C2=A0&quot;<br>
<br>
-FILES_${PN}-dbg +=3D &quot;${libdir}/trace-cmd/plugins/.debug&quot;<br>
-<br>
=C2=A0do_compile_prepend() {<br>
=C2=A0 =C2=A0 =C2=A0# Make sure the recompile is OK<br>
=C2=A0 =C2=A0 =C2=A0rm -f ${B}/.*.d<br>
diff --git a/meta/recipes-support/aspell/<a href=3D"http://aspell_0.60.6.1.=
bb" rel=3D"noreferrer" target=3D"_blank">aspell_0.60.6.1.bb</a> b/meta/reci=
pes-support/aspell/<a href=3D"http://aspell_0.60.6.1.bb" rel=3D"noreferrer"=
 target=3D"_blank">aspell_0.60.6.1.bb</a><br>
index 7cf17d6..5a23754 100644<br>
--- a/meta/recipes-support/aspell/<a href=3D"http://aspell_0.60.6.1.bb" rel=
=3D"noreferrer" target=3D"_blank">aspell_0.60.6.1.bb</a><br>
+++ b/meta/recipes-support/aspell/<a href=3D"http://aspell_0.60.6.1.bb" rel=
=3D"noreferrer" target=3D"_blank">aspell_0.60.6.1.bb</a><br>
@@ -17,7 +17,6 @@ PACKAGES +=3D &quot;libaspell libpspell aspell-utils&quot=
;<br>
<br>
=C2=A0RDEPENDS_${PN}-utils +=3D &quot;perl&quot;<br>
<br>
-FILES_${PN}-dbg +=3D &quot;${libdir}/aspell-0.60/.debu*&quot;<br>
=C2=A0FILES_libaspell =3D &quot;${libdir}/libaspell.so.* ${libdir}/aspell*&=
quot;<br>
=C2=A0FILES_aspell-utils =3D &quot;${bindir}/word-list-compress ${bindir}/a=
spell-import ${bindir}/run-with-aspell ${bindir}/pre*&quot;<br>
=C2=A0FILES_${PN} =3D &quot;${bindir}/aspell&quot;<br>
diff --git a/meta/recipes-support/libcap-ng/<a href=3D"http://libcap-ng_0.7=
.7.bb" rel=3D"noreferrer" target=3D"_blank">libcap-ng_0.7.7.bb</a> b/meta/r=
ecipes-support/libcap-ng/<a href=3D"http://libcap-ng_0.7.7.bb" rel=3D"noref=
errer" target=3D"_blank">libcap-ng_0.7.7.bb</a><br>
index a31d5dc..5715467 100644<br>
--- a/meta/recipes-support/libcap-ng/<a href=3D"http://libcap-ng_0.7.7.bb" =
rel=3D"noreferrer" target=3D"_blank">libcap-ng_0.7.7.bb</a><br>
+++ b/meta/recipes-support/libcap-ng/<a href=3D"http://libcap-ng_0.7.7.bb" =
rel=3D"noreferrer" target=3D"_blank">libcap-ng_0.7.7.bb</a><br>
@@ -23,7 +23,6 @@ EXTRA_OEMAKE +=3D &quot;PYLIBVER=3D&#39;python${PYTHON_BA=
SEVERSION}&#39; PYINC=3D&#39;${STAGING_INCDIR}<br>
<br>
=C2=A0PACKAGES +=3D &quot;${PN}-python&quot;<br>
<br>
-FILES_${PN}-dbg +=3D &quot;${libdir}/python${PYTHON_BASEVERSION}/*/.debug&=
quot;<br>
=C2=A0FILES_${PN}-python =3D &quot;${libdir}/python${PYTHON_BASEVERSION}&qu=
ot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native&quot;<br>
diff --git a/meta/recipes-support/nss/<a href=3D"http://nss_3.19.2.bb" rel=
=3D"noreferrer" target=3D"_blank">nss_3.19.2.bb</a> b/meta/recipes-support/=
nss/<a href=3D"http://nss_3.19.2.bb" rel=3D"noreferrer" target=3D"_blank">n=
ss_3.19.2.bb</a><br>
index 65f3204..c51b056 100644<br>
--- a/meta/recipes-support/nss/<a href=3D"http://nss_3.19.2.bb" rel=3D"nore=
ferrer" target=3D"_blank">nss_3.19.2.bb</a><br>
+++ b/meta/recipes-support/nss/<a href=3D"http://nss_3.19.2.bb" rel=3D"nore=
ferrer" target=3D"_blank">nss_3.19.2.bb</a><br>
@@ -220,7 +220,6 @@ FILES_${PN}-dev =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/pkgconfig/* \<br>
=C2=A0 =C2=A0 =C2=A0${includedir}/* \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
-# FILES_${PN}-dbg is populated automatically<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
diff --git a/meta/recipes-support/p11-kit/<a href=3D"http://p11-kit_0.22.1.=
bb" rel=3D"noreferrer" target=3D"_blank">p11-kit_0.22.1.bb</a> b/meta/recip=
es-support/p11-kit/<a href=3D"http://p11-kit_0.22.1.bb" rel=3D"noreferrer" =
target=3D"_blank">p11-kit_0.22.1.bb</a><br>
index 8f15894..f501372 100644<br>
--- a/meta/recipes-support/p11-kit/<a href=3D"http://p11-kit_0.22.1.bb" rel=
=3D"noreferrer" target=3D"_blank">p11-kit_0.22.1.bb</a><br>
+++ b/meta/recipes-support/p11-kit/<a href=3D"http://p11-kit_0.22.1.bb" rel=
=3D"noreferrer" target=3D"_blank">p11-kit_0.22.1.bb</a><br>
@@ -17,4 +17,4 @@ FILES_${PN}-dev +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/pkcs11/p11-kit-trust.so \<br>
=C2=A0&quot;<br>
=C2=A0FILES_${PN}-dev +=3D &quot;${libdir}/pkcs11/*.la&quot;<br>
-FILES_${PN}-dbg +=3D &quot;${libdir}/pkcs11/.debug&quot;<br>
+<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
<br>
</font></span></blockquote></div><br></div>

--047d7bdc1c0cf86ea50526f260bd--
