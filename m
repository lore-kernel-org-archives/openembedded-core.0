Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 32A1F78391
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 08:31:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7G8VLDn025046
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Aug 2017 01:31:28 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 16 Aug 2017 01:31:23 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 16 Aug 2017 04:31:14 -0400
Message-ID: <cover.1502869419.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/8] upgrade 8 recipes
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
X-List-Received-Date: Wed, 16 Aug 2017 08:31:28 -0000
Content-Type: text/plain

The following changes since commit 034bff2ca431b49b7ca9b1e7b7c214ef94b0eb34:

  bitbake: cooker: Ignore common bitbake files for the parse cache invalidation (2017-08-13 09:28:14 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/upgrade-20170816
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/upgrade-20170816

Hongxu Jia (8):
  apr-util: 1.5.4 -> 1.6.0
  bash: 4.3.30 -> 4.4
  dhcp: 4.3.5 -> 4.3.6
  elfutils: 0.168 -> 0.170
  libgcrypt: 1.7.8 -> 1.8.0
  gnupg: 2.1.20 -> 2.1.23
  gpgme: 1.8.0 -> 1.9.0
  ncurses: 6.0+20161126 -> 6.0+20170715

 meta/recipes-connectivity/dhcp/dhcp.inc            |   4 +-
 ...-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch} |  12 +-
 ...hclient-dbus.patch => 0002-dhclient-dbus.patch} |  97 +++++---
 ...-lcrypto.patch => 0003-link-with-lcrypto.patch} |  20 +-
 ...ild.patch => 0004-Fix-out-of-tree-builds.patch} |   9 +-
 ...-fix-invoke-dhclient-script-failed-on-Rea.patch |  36 +++
 ...ch => 0006-site.h-enable-gentle-shutdown.patch} |  17 +-
 ...re-argument-to-make-the-libxml2-dependenc.patch |  42 ++++
 ...h => 0008-tweak-to-support-external-bind.patch} |  12 +-
 ...09-remove-dhclient-script-bash-dependency.patch |  28 +++
 ...red-libs.patch => 0010-build-shared-libs.patch} |  30 ++-
 ...ll-to-isc_app_ctxstart-to-not-get-signal.patch} |  10 +-
 ...dhclient-script-drop-resolv.conf.dhclient.patch |  70 ------
 .../dhcp/dhcp/libxml2-configure-argument.patch     |  38 ----
 .../remove-dhclient-script-bash-dependency.patch   |  55 -----
 .../dhcp/dhcp/replace-ifconfig-route.patch         | 188 ---------------
 .../dhcp/dhcp/search-for-libxml2.patch             |  23 --
 meta/recipes-connectivity/dhcp/dhcp_4.3.5.bb       |  20 --
 meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb       |  20 ++
 .../files/{tic-hang.patch => 0001-tic-hang.patch}  |  26 ++-
 ...ble.patch => 0002-configure-reproducible.patch} |  21 +-
 .../ncurses/files/fix-cflags-mangle.patch          |  18 --
 ...ses_6.0+20161126.bb => ncurses_6.0+20170715.bb} |   7 +-
 ...m-Silence-Werror-maybe-uninitialized-fals.patch |  35 ---
 .../elfutils-0.168/Fix_one_GCC7_warning.patch      |  44 ----
 .../elfutils/elfutils-0.168/debian/hurd_path.patch |  17 --
 .../elfutils-0.168/debian/ignore_strmerge.diff     |  14 --
 .../elfutils-0.168/debian/kfreebsd_path.patch      |  20 --
 .../debian/testsuite-ignore-elflint.diff           |  42 ----
 .../elfutils/elfutils-0.168/shadow.patch           |  23 --
 .../elfutils/elfutils/dso-link-change.patch        |  32 ---
 .../{elfutils_0.168.bb => elfutils_0.170.bb}       |  32 ++-
 .../elfutils/files/0001-dso-link-change.patch      |  52 +++++
 ...elf_cvt_gunhash-if-dest-and-src-are-same.patch} |  15 +-
 .../0003-fixheadercheck.patch}                     |  23 +-
 .../0004-Disable-the-test-to-convert-euc-jp.patch} |  10 +-
 .../0005-fix-a-stack-usage-warning.patch}          |  15 +-
 .../0006-Fix-build-on-aarch64-musl.patch}          |  38 +++-
 ...-path-where-we-have-str-as-uninitialized-.patch |  45 ++++
 ...e-alternatives-for-glibc-assumptions-hel.patch} | 168 ++++++--------
 ...ferences-between-mips-machine-identifiers.patch |   0
 ...-support-for-mips64-abis-in-mips_retval.c.patch |   0
 .../0003-Add-mips-n64-relocation-format-hack.patch |   0
 .../debian/arm_backend.diff                        |   0
 .../debian}/fallthrough.patch                      |   0
 .../debian/hppa_backend.diff                       |   0
 .../debian/mips_backend.patch}                     | 115 ++++++----
 .../debian/mips_readelf_w.patch                    |   0
 meta/recipes-extended/bash/bash.inc                |   4 +
 .../recipes-extended/bash/bash/CVE-2016-9401.patch |  50 ----
 ...roc-run-heredoc-run-execscript-run-test-f.patch | 158 ++-----------
 meta/recipes-extended/bash/bash/fix-run-intl.patch | 110 ---------
 meta/recipes-extended/bash/bash/test-output.patch  |  47 ++--
 meta/recipes-extended/bash/bash_4.3.30.bb          |  75 ------
 meta/recipes-extended/bash/bash_4.4.bb             |  58 +++++
 .../recipes-support/apr/apr-util/openssl-1.1.patch | 253 ---------------------
 .../apr/{apr-util_1.5.4.bb => apr-util_1.6.0.bb}   |   7 +-
 ...config-to-find-pth-instead-of-pth-config.patch} |  29 ++-
 ...002-use-pkgconfig-instead-of-npth-config.patch} |  21 +-
 .../gnupg/0003-dirmngr-uses-libgpg-error.patch     |  32 +++
 ...en.sh-fix-find-version-for-beta-checking.patch} |  17 +-
 .../gnupg/gnupg/dirmngr-uses-libgpg-error.patch    |  16 --
 .../gnupg/{gnupg_2.1.20.bb => gnupg_2.1.23.bb}     |  14 +-
 .../{pkgconfig.patch => 0001-pkgconfig.patch}      |  16 +-
 ...ython-gpg-error-config-should-not-be-use.patch} |  25 +-
 ...=> 0003-Correctly-install-python-modules.patch} |  22 +-
 ...ython-import.patch => 0004-python-import.patch} |  15 ++
 ...-skip-all-lib-or-usr-lib-directories-in-.patch} |   6 +-
 .../gpgme/{gpgme_1.8.0.bb => gpgme_1.9.0.bb}       |  16 +-
 ...pkg-config-for-libgcrypt-instead-of-conf.patch} |  18 +-
 ...x-building-error-with-O2-in-sysroot-path.patch} |  29 ++-
 ...slope.c-workaround-ICE-failure-on-mips-w.patch} |  24 +-
 ...le.am-fix-undefined-reference-to-pthread.patch} |  11 +-
 .../{libgcrypt_1.7.8.bb => libgcrypt_1.8.0.bb}     |  12 +-
 74 files changed, 973 insertions(+), 1655 deletions(-)
 rename meta/recipes-connectivity/dhcp/dhcp/{define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch => 0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch} (70%)
 rename meta/recipes-connectivity/dhcp/dhcp/{dhcp-3.0.3-dhclient-dbus.patch => 0002-dhclient-dbus.patch} (45%)
 rename meta/recipes-connectivity/dhcp/dhcp/{link-with-lcrypto.patch => 0003-link-with-lcrypto.patch} (68%)
 rename meta/recipes-connectivity/dhcp/dhcp/{fixsepbuild.patch => 0004-Fix-out-of-tree-builds.patch} (92%)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0005-dhcp-client-fix-invoke-dhclient-script-failed-on-Rea.patch
 rename meta/recipes-connectivity/dhcp/dhcp/{0001-site.h-enable-gentle-shutdown.patch => 0006-site.h-enable-gentle-shutdown.patch} (65%)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0007-Add-configure-argument-to-make-the-libxml2-dependenc.patch
 rename meta/recipes-connectivity/dhcp/dhcp/{tweak-to-support-external-bind.patch => 0008-tweak-to-support-external-bind.patch} (93%)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0009-remove-dhclient-script-bash-dependency.patch
 rename meta/recipes-connectivity/dhcp/dhcp/{build-shared-libs.patch => 0010-build-shared-libs.patch} (90%)
 rename meta/recipes-connectivity/dhcp/dhcp/{Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch => 0011-Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch} (92%)
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/dhclient-script-drop-resolv.conf.dhclient.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/libxml2-configure-argument.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/remove-dhclient-script-bash-dependency.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/replace-ifconfig-route.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/search-for-libxml2.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp_4.3.5.bb
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb
 rename meta/recipes-core/ncurses/files/{tic-hang.patch => 0001-tic-hang.patch} (63%)
 rename meta/recipes-core/ncurses/files/{configure-reproducible.patch => 0002-configure-reproducible.patch} (50%)
 delete mode 100644 meta/recipes-core/ncurses/files/fix-cflags-mangle.patch
 rename meta/recipes-core/ncurses/{ncurses_6.0+20161126.bb => ncurses_6.0+20170715.bb} (56%)
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.168/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.168/Fix_one_GCC7_warning.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.168/debian/hurd_path.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.168/debian/ignore_strmerge.diff
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.168/debian/kfreebsd_path.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.168/debian/testsuite-ignore-elflint.diff
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.168/shadow.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils/dso-link-change.patch
 rename meta/recipes-devtools/elfutils/{elfutils_0.168.bb => elfutils_0.170.bb} (71%)
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
 rename meta/recipes-devtools/elfutils/{elfutils/Fix_elf_cvt_gunhash.patch => files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch} (72%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168/fixheadercheck.patch => files/0003-fixheadercheck.patch} (69%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168/0001-remove-the-unneed-checking.patch => files/0004-Disable-the-test-to-convert-euc-jp.patch} (76%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168/0001-fix-a-stack-usage-warning.patch => files/0005-fix-a-stack-usage-warning.patch} (72%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168/aarch64_uio.patch => files/0006-Fix-build-on-aarch64-musl.patch} (51%)
 create mode 100644 meta/recipes-devtools/elfutils/files/0007-Fix-control-path-where-we-have-str-as-uninitialized-.patch
 rename meta/recipes-devtools/elfutils/{elfutils-0.168/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch => files/0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch} (89%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168 => files}/debian/0001-Ignore-differences-between-mips-machine-identifiers.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168 => files}/debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168 => files}/debian/0003-Add-mips-n64-relocation-format-hack.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168 => files}/debian/arm_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168 => files/debian}/fallthrough.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168 => files}/debian/hppa_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168/debian/mips_backend.diff => files/debian/mips_backend.patch} (92%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168 => files}/debian/mips_readelf_w.patch (100%)
 delete mode 100644 meta/recipes-extended/bash/bash/CVE-2016-9401.patch
 delete mode 100644 meta/recipes-extended/bash/bash/fix-run-intl.patch
 delete mode 100644 meta/recipes-extended/bash/bash_4.3.30.bb
 create mode 100644 meta/recipes-extended/bash/bash_4.4.bb
 delete mode 100644 meta/recipes-support/apr/apr-util/openssl-1.1.patch
 rename meta/recipes-support/apr/{apr-util_1.5.4.bb => apr-util_1.6.0.bb} (92%)
 rename meta/recipes-support/gnupg/gnupg/{pkgconfig.patch => 0001-Use-pkg-config-to-find-pth-instead-of-pth-config.patch} (81%)
 rename meta/recipes-support/gnupg/gnupg/{use-pkgconfig-instead-of-npth-config.patch => 0002-use-pkgconfig-instead-of-npth-config.patch} (81%)
 create mode 100644 meta/recipes-support/gnupg/gnupg/0003-dirmngr-uses-libgpg-error.patch
 rename meta/recipes-support/gnupg/gnupg/{autogen.sh-fix-find-version-for-beta-checking.patch => 0004-autogen.sh-fix-find-version-for-beta-checking.patch} (58%)
 delete mode 100644 meta/recipes-support/gnupg/gnupg/dirmngr-uses-libgpg-error.patch
 rename meta/recipes-support/gnupg/{gnupg_2.1.20.bb => gnupg_2.1.23.bb} (69%)
 rename meta/recipes-support/gpgme/gpgme/{pkgconfig.patch => 0001-pkgconfig.patch} (96%)
 rename meta/recipes-support/gpgme/gpgme/{python-lang-config.patch => 0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch} (72%)
 rename meta/recipes-support/gpgme/gpgme/{0001-Correctly-install-python-modules.patch => 0003-Correctly-install-python-modules.patch} (52%)
 rename meta/recipes-support/gpgme/gpgme/{python-import.patch => 0004-python-import.patch} (66%)
 rename meta/recipes-support/gpgme/gpgme/{0001-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch => 0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch} (85%)
 rename meta/recipes-support/gpgme/{gpgme_1.8.0.bb => gpgme_1.9.0.bb} (84%)
 rename meta/recipes-support/libgcrypt/files/{add-pkgconfig-support.patch => 0001-Add-and-use-pkg-config-for-libgcrypt-instead-of-conf.patch} (94%)
 rename meta/recipes-support/libgcrypt/files/{libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch => 0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch} (55%)
 rename meta/recipes-support/libgcrypt/files/{fix-ICE-failure-on-mips-with-option-O-and-g.patch => 0003-tests-bench-slope.c-workaround-ICE-failure-on-mips-w.patch} (73%)
 rename meta/recipes-support/libgcrypt/files/{fix-undefined-reference-to-pthread.patch => 0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch} (70%)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.7.8.bb => libgcrypt_1.8.0.bb} (75%)

-- 
2.8.1


