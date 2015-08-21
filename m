Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A1C1C73E11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 10:37:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7LAbThT029128
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 03:37:29 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 21 Aug 2015 03:37:28 -0700
Message-ID: <55D6FF67.8040404@windriver.com>
Date: Fri, 21 Aug 2015 18:37:27 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1440152645.git.liezhi.yang@windriver.com>
	<8531a581968150f46d2ca9769189fb4860dbc2fe.1440152645.git.liezhi.yang@windriver.com>
In-Reply-To: <8531a581968150f46d2ca9769189fb4860dbc2fe.1440152645.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 1/1] meta: remove unneeded INSANE_SKIP
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
X-List-Received-Date: Fri, 21 Aug 2015 10:37:31 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/21/2015 06:24 PM, Robert Yang wrote:
> The build works well after remove INSANE_SKIP from the following
> recipes:
> meta/recipes-bsp/grub/grub_2.00.bb
> meta/recipes-bsp/grub/grub_git.bb
> meta/recipes-core/dbus/dbus.inc

Sorry, the one for dbus should be kept:
INSANE_SKIP_${PN}-ptest += "build-deps"

I've updated this in the repo.

// Robert

> meta/recipes-core/glib-2.0/glib.inc
> meta/recipes-devtools/pseudo/pseudo.inc
> meta/recipes-devtools/syslinux/syslinux_6.03.bb
> meta/recipes-extended/ltp/ltp_20150420.bb
> meta/recipes-kernel/kexec/kexec-tools.inc
> meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/recipes-bsp/grub/grub_2.00.bb              |    3 ---
>   meta/recipes-bsp/grub/grub_git.bb               |    3 ---
>   meta/recipes-core/dbus/dbus.inc                 |    2 --
>   meta/recipes-core/glib-2.0/glib.inc             |    2 --
>   meta/recipes-devtools/pseudo/pseudo.inc         |    2 --
>   meta/recipes-devtools/syslinux/syslinux_6.03.bb |    2 --
>   meta/recipes-extended/ltp/ltp_20150420.bb       |    2 --
>   meta/recipes-kernel/kexec/kexec-tools.inc       |    2 --
>   meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb  |    2 --
>   9 files changed, 20 deletions(-)
>
> diff --git a/meta/recipes-bsp/grub/grub_2.00.bb b/meta/recipes-bsp/grub/grub_2.00.bb
> index 88a709e..25b32c7 100644
> --- a/meta/recipes-bsp/grub/grub_2.00.bb
> +++ b/meta/recipes-bsp/grub/grub_2.00.bb
> @@ -12,6 +12,3 @@ EXTRA_OECONF = "--with-platform=pc --disable-grub-mkfont --program-prefix="" \
>   do_install_append () {
>       install -d ${D}${sysconfdir}/grub.d
>   }
> -
> -INSANE_SKIP_${PN} = "arch"
> -INSANE_SKIP_${PN}-dbg = "arch"
> diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub_git.bb
> index c2760c9..c8ea283 100644
> --- a/meta/recipes-bsp/grub/grub_git.bb
> +++ b/meta/recipes-bsp/grub/grub_git.bb
> @@ -45,6 +45,3 @@ INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>
>   RDEPENDS_${PN} = "diffutils freetype"
>   FILES_${PN}-dbg += "${libdir}/${BPN}/*/.debug"
> -
> -INSANE_SKIP_${PN} = "arch"
> -INSANE_SKIP_${PN}-dbg = "arch"
> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
> index 3971081..01066cb 100644
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -166,5 +166,3 @@ do_install_class-nativesdk() {
>   	rm -rf ${D}${localstatedir}/run
>   }
>   BBCLASSEXTEND = "native nativesdk"
> -
> -INSANE_SKIP_${PN}-ptest += "build-deps"
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
> index 072f790..0ef8500 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -100,5 +100,3 @@ RDEPENDS_${PN}-ptest_append_libc-glibc = "\
>               glibc-charmap-invariant \
>               glibc-localedata-translit-cjk-variants \
>              "
> -
> -INSANE_SKIP_${PN}-ptest += "libdir"
> diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
> index fe12258..371b780 100644
> --- a/meta/recipes-devtools/pseudo/pseudo.inc
> +++ b/meta/recipes-devtools/pseudo/pseudo.inc
> @@ -11,8 +11,6 @@ DEPENDS = "sqlite3 attr"
>
>   FILES_${PN} = "${prefix}/lib/pseudo/lib*/libpseudo.so ${bindir}/* ${localstatedir}/pseudo ${prefix}/var/pseudo"
>   FILES_${PN}-dbg += "${prefix}/lib/pseudo/lib*/.debug"
> -INSANE_SKIP_${PN} += "libdir"
> -INSANE_SKIP_${PN}-dbg += "libdir"
>
>   PROVIDES += "virtual/fakeroot"
>
> diff --git a/meta/recipes-devtools/syslinux/syslinux_6.03.bb b/meta/recipes-devtools/syslinux/syslinux_6.03.bb
> index ef9ae2f..5b5fa0b 100644
> --- a/meta/recipes-devtools/syslinux/syslinux_6.03.bb
> +++ b/meta/recipes-devtools/syslinux/syslinux_6.03.bb
> @@ -28,8 +28,6 @@ SRC_URI[sha256sum] = "26d3986d2bea109d5dc0e4f8c4822a459276cf021125e8c9f23c3cca5d
>
>   COMPATIBLE_HOST = '(x86_64|i.86).*-(linux|freebsd.*)'
>   # Don't let the sanity checker trip on the 32 bit real mode BIOS binaries
> -INSANE_SKIP_${PN}-misc = "arch"
> -INSANE_SKIP_${PN}-chain = "arch"
>
>   EXTRA_OEMAKE = " \
>   	BINDIR=${bindir} SBINDIR=${sbindir} LIBDIR=${libdir} \
> diff --git a/meta/recipes-extended/ltp/ltp_20150420.bb b/meta/recipes-extended/ltp/ltp_20150420.bb
> index 108ebf1..bec2e12 100644
> --- a/meta/recipes-extended/ltp/ltp_20150420.bb
> +++ b/meta/recipes-extended/ltp/ltp_20150420.bb
> @@ -82,5 +82,3 @@ FILES_${PN} += "/opt/ltp/* /opt/ltp/runtest/* /opt/ltp/scenario_groups/* /opt/lt
>   INHIBIT_PACKAGE_STRIP = "1"
>   INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>   # However, test_arch_stripped is already stripped, so...
> -INSANE_SKIP_${PN} += "already-stripped"
> -
> diff --git a/meta/recipes-kernel/kexec/kexec-tools.inc b/meta/recipes-kernel/kexec/kexec-tools.inc
> index 7797a25..20818e6 100644
> --- a/meta/recipes-kernel/kexec/kexec-tools.inc
> +++ b/meta/recipes-kernel/kexec/kexec-tools.inc
> @@ -16,8 +16,6 @@ inherit autotools
>
>   COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|powerpc.*|mips.*)-(linux|freebsd.*)'
>
> -INSANE_SKIP_${PN} = "arch"
> -
>   do_compile_prepend() {
>       # Remove the '*.d' file to make sure the recompile is OK
>       for dep in `find ${B} -type f -name '*.d'`; do
> diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
> index 6397a98..39ada7b 100644
> --- a/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
> +++ b/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
> @@ -49,8 +49,6 @@ FILES_${PN}-dev += "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.la"
>   # Since files are installed into ${libdir}/lttng/libexec we match
>   # the libexec insane test so skip it.
>   # Python module needs to keep _lttng.so
> -INSANE_SKIP_${PN} = "libexec dev-so"
> -INSANE_SKIP_${PN}-dbg = "libexec"
>
>   do_configure_prepend () {
>   	# Delete a shipped m4 file that overrides our patched one
>

