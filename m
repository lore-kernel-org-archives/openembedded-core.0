Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TzlFV-0005Du-JJ
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 10:43:42 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Jan 2013 01:26:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,550,1355126400"; d="scan'208";a="277394506"
Received: from unknown (HELO [10.255.12.19]) ([10.255.12.19])
	by orsmga002.jf.intel.com with ESMTP; 28 Jan 2013 01:27:53 -0800
Message-ID: <51064498.1040604@linux.intel.com>
Date: Mon, 28 Jan 2013 01:27:52 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1359364363.git.sgw@linux.intel.com>
In-Reply-To: <cover.1359364363.git.sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/33] Systemd Update along with other Updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2013 09:43:47 -0000
X-List-Received-Date: Mon, 28 Jan 2013 09:43:47 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/28/2013 01:20 AM, Saul Wold wrote:
> *** BLURB HERE ***
> The following changes since commit ab692ed618f83df2ce452769165314e70b867345:
>
>    gettext: Fix build with uclibc remove upstreamed patches (2013-01-27 13:52:49 +0000)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib sgw/stage
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
>
> Andreas Müller (2):
>    buildhistory.bbclass: track also complementary package information
>    package.bbclass: remove RRECOMMENDS on base packages for locale
>      packages
>
> Chen Qi (1):
>    sysvinit & initscripts: use update-rc.d
>
> Cristian Iorga (1):
>    alsa-utils: upgrade to 1.0.26
>
This needs a commit message update, I missed removing it on this first pass.

Sau!

> Frans Meulenbroeks (1):
>    mtd-utils: split into multiple packages
>
> Hongxu Jia (2):
>    gtk-icon-cache.bbclass:fix support postrm at image creation time
>    gtk-immodules-cache.bbclass:fix support postrm at image creation time
>
> Khem Raj (7):
>    eglibc: Upgrade recipes 2.16 -> 2.17
>    eglibc_2.17: Fix Tibetian locale generation error
>    eglibc: Backport upstream 2.17 patches
>    rpcbind: Dont use nss with uclibc
>    quota: inherit gettext
>    icu: Fix build on uclibc
>    systemd: Upgrade to 197
>
> Marcin Juszkiewicz (1):
>    xorg-minimal-fonts: depend on font-alias instead of shipping
>      fonts.alias
>
> Martin Jansa (2):
>    license.bbclass: extract functionality to find license files to
>      separate function
>    license.bbclass: package license texts to PN-lic when
>      LICENSE_CREATE_PACKAGE is enabled
>
> Radu Moisan (1):
>    valgrind: update to 3.8.1
>
> Richard Purdie (1):
>    sanity.bbclass: Ensure tmpdir exists when running the check
>
> Riku Voipio (1):
>    libaio: add aarch64 support
>
> Saul Wold (12):
>    libnl: Update to 3.2.19
>    rgb: Update to 1.0.5
>    sysstat: Update to 10.1.3
>    mc: Update to 4.8.7
>    man-pages: Update to 3.45
>    libidn: Update to 1.26
>    cracklib: Update to 2.8.22
>    file: Update to 5.12
>    dhcp: Update to 4.2.5
>    util-linux: Update to 2.22.2
>    resolvconf: Update to 1.69
>    libcgroup: Update to 0.38
>
> Xin Ouyang (1):
>    libcgroup: fix the QA issue for pam_cgroup.so*
>
>   meta/classes/buildhistory.bbclass                  |    5 +
>   meta/classes/gtk-icon-cache.bbclass                |   18 +
>   meta/classes/gtk-immodules-cache.bbclass           |   13 +-
>   meta/classes/license.bbclass                       |   78 +-
>   meta/classes/package.bbclass                       |    3 +-
>   meta/classes/sanity.bbclass                        |    1 +
>   meta/conf/distro/include/tcmode-default.inc        |    2 +-
>   .../dhcp-3.0.3-dhclient-dbus.patch                 |    0
>   .../fix-client-path.patch                          |    0
>   .../fix-external-bind.patch                        |    0
>   .../fixincludes.patch                              |    0
>   .../link-with-lcrypto.patch                        |    0
>   .../{dhcp-4.2.4-P2 => dhcp-4.2.5}/noattrmode.patch |    0
>   .../dhcp/{dhcp-4.2.4-P2 => dhcp-4.2.5}/site.h      |    0
>   .../dhcp/{dhcp_4.2.4-P2.bb => dhcp_4.2.5.bb}       |    4 +-
>   .../{resolvconf_1.68.bb => resolvconf_1.69.bb}     |    4 +-
>   ...tive_2.16.bb => cross-localedef-native_2.17.bb} |   12 +-
>   .../0001-Add-ARM-specific-static-stubs.c.patch     |   27 -
>   ..._handle_at-open_by_handle-etc.-to-PowerPC.patch |   65 -
>   ...f-libgcc_s-and-libgcc_eh-when-building-gl.patch |  343 -
>   .../eglibc-2.16/use-sysroot-cxx-headers.patch      |   42 -
>   .../0001-R_ARM_TLS_DTPOFF32.patch                  |    0
>   .../0001-eglibc-menuconfig-support.patch           |    0
>   ...n-libm-err-tab.pl-with-specific-dirs-in-S.patch |    0
>   ...0002-eglibc-menuconfig-hex-string-options.patch |    0
>   ...0003-eglibc-menuconfig-build-instructions.patch |    0
>   .../GLRO_dl_debug_mask.patch                       |   55 +-
>   .../IO-acquire-lock-fix.patch                      |    0
>   .../add_resource_h_to_wait_h.patch                 |    0
>   .../eglibc-2.17/eglibc-2.17-PR15003-r22243.patch   |  207 +
>   .../eglibc/eglibc-2.17/eglibc-2.17-r22178.patch    | 9472 ++++++++++++++++++++
>   .../eglibc-svn-arm-lowlevellock-include-tls.patch  |    0
>   .../eglibc_fix_findidx_parameters.patch            |    0
>   .../{eglibc-2.16 => eglibc-2.17}/etc/ld.so.conf    |    0
>   .../fileops-without-wchar-io.patch                 |    0
>   .../eglibc/eglibc-2.17/fix-tibetian-locales.patch  |   38 +
>   .../fix_for_centos_5.8.patch                       |    0
>   .../fsl-ppc-no-fsqrt.patch                         |    0
>   .../generate-supported.mk                          |    0
>   .../glibc.fix_sqrt2.patch                          |    0
>   .../initgroups_keys.patch                          |    0
>   .../ld-search-order.patch                          |   20 +-
>   .../mips-rld-map-check.patch                       |    0
>   .../multilib_readlib.patch                         |    0
>   .../ppc-sqrt_finite.patch                          |    0
>   .../ppc_slow_ieee754_sqrt.patch                    |    0
>   .../relocatable_sdk.patch                          |    0
>   .../tzselect-awk.patch                             |    0
>   .../{eglibc-2.16 => eglibc-2.17}/tzselect-sh.patch |   54 +-
>   ...libc-initial_2.16.bb => eglibc-initial_2.17.bb} |    0
>   meta/recipes-core/eglibc/eglibc-locale.inc         |    2 -
>   ...eglibc-locale_2.16.bb => eglibc-locale_2.17.bb} |    0
>   meta/recipes-core/eglibc/eglibc-mtrace.inc         |    1 -
>   ...eglibc-mtrace_2.16.bb => eglibc-mtrace_2.17.bb} |    0
>   ...libc-scripts_2.16.bb => eglibc-scripts_2.17.bb} |    0
>   .../eglibc/{eglibc_2.16.bb => eglibc_2.17.bb}      |   44 +-
>   meta/recipes-core/initscripts/initscripts_1.0.bb   |   57 +-
>   .../{libcgroup_0.37.1.bb => libcgroup_0.38.bb}     |   24 +-
>   ...emd-analyze-use-argparse-instead-of-getop.patch |  106 -
>   .../0001-systemd-analyze-rewrite-in-C.patch        | 1087 +++
>   ...-analyze-use-GDBus-instead-of-dbus-python.patch |   94 -
>   .../systemd/{systemd_196.bb => systemd_197.bb}     |   12 +-
>   meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |   15 +-
>   .../{util-linux_2.22.1.bb => util-linux_2.22.2.bb} |    6 +-
>   .../file/file/obsolete_automake_macros.patch       |   15 -
>   .../file/{file_5.11.bb => file_5.12.bb}            |    7 +-
>   meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb       |    8 +-
>   .../valgrind/valgrind-3.7.0/configure-fix.patch    |   40 -
>   .../valgrind-3.7.0/fix_for_automake_1.11.2.patch   |   45 -
>   ...ind-3.7.0-fix-error-of-reading-debug-info.patch |   33 -
>   ...upport-for-PPC-instructions-mfatbu-mfatbl.patch |    0
>   .../configure-with-newer-glibc.patch               |   13 +-
>   .../fix_issue_caused_by_ccache.patch               |    0
>   .../fix_unsupporting_kernel_3.patch                |    0
>   .../fixed-perl-path.patch                          |    0
>   .../{valgrind_3.7.0.bb => valgrind_3.8.1.bb}       |   13 +-
>   .../{cracklib_2.8.19.bb => cracklib_2.8.22.bb}     |    4 +-
>   .../libaio/libaio/libaio-aarch64.patch             |   28 +
>   .../libaio/libaio/libaio-generic.patch             |   65 +
>   meta/recipes-extended/libaio/libaio_0.3.109.bb     |    5 +-
>   .../libidn/{libidn_1.25.bb => libidn_1.26.bb}      |    8 +-
>   .../{man-pages_3.44.bb => man-pages_3.45.bb}       |    4 +-
>   .../mc/{mc_4.8.6.bb => mc_4.8.7.bb}                |    4 +-
>   meta/recipes-extended/quota/quota_4.01.bb          |    2 +-
>   .../rpcbind/rpcbind/0001-uclibc-nss.patch          |   30 +
>   .../rpcbind/0002-uclibc-rpcsvc-defines.patch       |   60 +
>   meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb     |    8 +
>   .../{sysstat_10.1.2.bb => sysstat_10.1.3.bb}       |    6 +-
>   .../rgb-1.0.4/obsolete_automake_macros.patch       |   15 -
>   .../xorg-app/{rgb_1.0.4.bb => rgb_1.0.5.bb}        |    8 +-
>   .../xorg-font/xorg-minimal-fonts.bb                |    8 +-
>   .../xorg-font/xorg-minimal-fonts/misc/fonts.alias  |   80 -
>   .../alsa/alsa-utils-1.0.25/ncursesfix.patch        |   44 -
>   ...-t-let-systemd-unit-restore-the-volume-wh.patch |    0
>   .../obsolete_automake_macros.patch                 |    0
>   .../uclibc-exp10-replacement.patch                 |    0
>   .../{alsa-utils_1.0.25.bb => alsa-utils_1.0.26.bb} |    7 +-
>   meta/recipes-support/icu/icu.inc                   |    1 +
>   .../libnl/{libnl_3.2.18.bb => libnl_3.2.19.bb}     |    4 +-
>   99 files changed, 11294 insertions(+), 1182 deletions(-)
>   rename meta/recipes-connectivity/dhcp/{dhcp-4.2.4-P2 => dhcp-4.2.5}/dhcp-3.0.3-dhclient-dbus.patch (100%)
>   rename meta/recipes-connectivity/dhcp/{dhcp-4.2.4-P2 => dhcp-4.2.5}/fix-client-path.patch (100%)
>   rename meta/recipes-connectivity/dhcp/{dhcp-4.2.4-P2 => dhcp-4.2.5}/fix-external-bind.patch (100%)
>   rename meta/recipes-connectivity/dhcp/{dhcp-4.2.4-P2 => dhcp-4.2.5}/fixincludes.patch (100%)
>   rename meta/recipes-connectivity/dhcp/{dhcp-4.2.4-P2 => dhcp-4.2.5}/link-with-lcrypto.patch (100%)
>   rename meta/recipes-connectivity/dhcp/{dhcp-4.2.4-P2 => dhcp-4.2.5}/noattrmode.patch (100%)
>   rename meta/recipes-connectivity/dhcp/{dhcp-4.2.4-P2 => dhcp-4.2.5}/site.h (100%)
>   rename meta/recipes-connectivity/dhcp/{dhcp_4.2.4-P2.bb => dhcp_4.2.5.bb} (62%)
>   rename meta/recipes-connectivity/resolvconf/{resolvconf_1.68.bb => resolvconf_1.69.bb} (88%)
>   rename meta/recipes-core/eglibc/{cross-localedef-native_2.16.bb => cross-localedef-native_2.17.bb} (79%)
>   delete mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0001-Add-ARM-specific-static-stubs.c.patch
>   delete mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0001-Add-name_to_handle_at-open_by_handle-etc.-to-PowerPC.patch
>   delete mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0001-Avoid-use-of-libgcc_s-and-libgcc_eh-when-building-gl.patch
>   delete mode 100644 meta/recipes-core/eglibc/eglibc-2.16/use-sysroot-cxx-headers.patch
>   rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/0001-R_ARM_TLS_DTPOFF32.patch (100%)
>   rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/0001-eglibc-menuconfig-support.patch (100%)
>   rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch (100%)
>   rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/0002-eglibc-menuconfig-hex-string-options.patch (100%)
>   rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/0003-eglibc-menuconfig-build-instructions.patch (100%)
>   rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/GLRO_dl_debug_mask.patch (72%)
>   rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/IO-acquire-lock-fix.patch (100%)
>   rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/add_resource_h_to_wait_h.patch (100%)
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.17/eglibc-2.17-PR15003-r22243.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.17/eglibc-2.17-r22178.patch
>   rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/eglibc-svn-arm-lowlevellock-include-tls.patch (100%)
>   rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/eglibc_fix_findidx_parameters.patch (100%)
>   rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/etc/ld.so.conf (100%)
>   rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/fileops-without-wchar-io.patch (100%)
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.17/fix-tibetian-locales.patch
>   rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/fix_for_centos_5.8.patch (100%)
>   rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/fsl-ppc-no-fsqrt.patch (100%)
>   rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/generate-supported.mk (100%)
>   rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/glibc.fix_sqrt2.patch (100%)
>   rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/initgroups_keys.patch (100%)
>   rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/ld-search-order.patch (84%)
>   rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/mips-rld-map-check.patch (100%)
>   rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/multilib_readlib.patch (100%)
>   rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/ppc-sqrt_finite.patch (100%)
>   rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/ppc_slow_ieee754_sqrt.patch (100%)
>   rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/relocatable_sdk.patch (100%)
>   rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/tzselect-awk.patch (100%)
>   rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/tzselect-sh.patch (77%)
>   rename meta/recipes-core/eglibc/{eglibc-initial_2.16.bb => eglibc-initial_2.17.bb} (100%)
>   rename meta/recipes-core/eglibc/{eglibc-locale_2.16.bb => eglibc-locale_2.17.bb} (100%)
>   rename meta/recipes-core/eglibc/{eglibc-mtrace_2.16.bb => eglibc-mtrace_2.17.bb} (100%)
>   rename meta/recipes-core/eglibc/{eglibc-scripts_2.16.bb => eglibc-scripts_2.17.bb} (100%)
>   rename meta/recipes-core/eglibc/{eglibc_2.16.bb => eglibc_2.17.bb} (75%)
>   rename meta/recipes-core/libcgroup/{libcgroup_0.37.1.bb => libcgroup_0.38.bb} (46%)
>   delete mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/0001-systemd-analyze-rewrite-in-C.patch
>   delete mode 100644 meta/recipes-core/systemd/systemd/0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch
>   rename meta/recipes-core/systemd/{systemd_196.bb => systemd_197.bb} (95%)
>   rename meta/recipes-core/util-linux/{util-linux_2.22.1.bb => util-linux_2.22.2.bb} (89%)
>   delete mode 100644 meta/recipes-devtools/file/file/obsolete_automake_macros.patch
>   rename meta/recipes-devtools/file/{file_5.11.bb => file_5.12.bb} (81%)
>   delete mode 100644 meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-fix.patch
>   delete mode 100644 meta/recipes-devtools/valgrind/valgrind-3.7.0/fix_for_automake_1.11.2.patch
>   delete mode 100644 meta/recipes-devtools/valgrind/valgrind-3.7.0/valgrind-3.7.0-fix-error-of-reading-debug-info.patch
>   rename meta/recipes-devtools/valgrind/{valgrind-3.7.0 => valgrind-3.8.1}/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch (100%)
>   rename meta/recipes-devtools/valgrind/{valgrind-3.7.0 => valgrind-3.8.1}/configure-with-newer-glibc.patch (79%)
>   rename meta/recipes-devtools/valgrind/{valgrind-3.7.0 => valgrind-3.8.1}/fix_issue_caused_by_ccache.patch (100%)
>   rename meta/recipes-devtools/valgrind/{valgrind-3.7.0 => valgrind-3.8.1}/fix_unsupporting_kernel_3.patch (100%)
>   rename meta/recipes-devtools/valgrind/{valgrind-3.7.0 => valgrind-3.8.1}/fixed-perl-path.patch (100%)
>   rename meta/recipes-devtools/valgrind/{valgrind_3.7.0.bb => valgrind_3.8.1.bb} (74%)
>   rename meta/recipes-extended/cracklib/{cracklib_2.8.19.bb => cracklib_2.8.22.bb} (72%)
>   create mode 100644 meta/recipes-extended/libaio/libaio/libaio-aarch64.patch
>   create mode 100644 meta/recipes-extended/libaio/libaio/libaio-generic.patch
>   rename meta/recipes-extended/libidn/{libidn_1.25.bb => libidn_1.26.bb} (85%)
>   rename meta/recipes-extended/man-pages/{man-pages_3.44.bb => man-pages_3.45.bb} (82%)
>   rename meta/recipes-extended/mc/{mc_4.8.6.bb => mc_4.8.7.bb} (82%)
>   create mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-uclibc-nss.patch
>   create mode 100644 meta/recipes-extended/rpcbind/rpcbind/0002-uclibc-rpcsvc-defines.patch
>   rename meta/recipes-extended/sysstat/{sysstat_10.1.2.bb => sysstat_10.1.3.bb} (44%)
>   delete mode 100644 meta/recipes-graphics/xorg-app/rgb-1.0.4/obsolete_automake_macros.patch
>   rename meta/recipes-graphics/xorg-app/{rgb_1.0.4.bb => rgb_1.0.5.bb} (45%)
>   delete mode 100644 meta/recipes-graphics/xorg-font/xorg-minimal-fonts/misc/fonts.alias
>   delete mode 100644 meta/recipes-multimedia/alsa/alsa-utils-1.0.25/ncursesfix.patch
>   rename meta/recipes-multimedia/alsa/{alsa-utils-1.0.25 => alsa-utils}/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch (100%)
>   rename meta/recipes-multimedia/alsa/{alsa-utils-1.0.25 => alsa-utils}/obsolete_automake_macros.patch (100%)
>   rename meta/recipes-multimedia/alsa/{alsa-utils-1.0.25 => alsa-utils}/uclibc-exp10-replacement.patch (100%)
>   rename meta/recipes-multimedia/alsa/{alsa-utils_1.0.25.bb => alsa-utils_1.0.26.bb} (95%)
>   rename meta/recipes-support/libnl/{libnl_3.2.18.bb => libnl_3.2.19.bb} (90%)
>


