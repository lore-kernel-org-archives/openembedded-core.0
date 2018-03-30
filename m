Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AB9F17467C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:46:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w2U6koOX023507
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Mar 2018 23:46:51 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 29 Mar 2018 23:46:50 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Mar 2018 02:46:27 -0400
Message-ID: <cover.1522392229.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/7] Upgrade 7 packages
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
X-List-Received-Date: Fri, 30 Mar 2018 06:46:54 -0000
Content-Type: text/plain

The following changes since commit afd8490dcbd2755f1ed924ea6357ab922ed1f481:

  meta-yocto-bsp: introduce v4.14&v4.15 kernel for non-x86 BSPs (2018-03-30 00:31:39 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/upgrade-20180330
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/upgrade-20180330

Hongxu Jia (7):
  ncureses: 6.0+20171125 -> 6.1
  bash: 4.4.12 -> 4.4.18
  ghostscript: 9.21 -> 9.23
  libgpg-error: 1.27 -> 1.28
  dhcp: 4.3.6 -> 4.4.1
  gnupg: upgrade 2.2.4 -> 2.2.5
  man-db: upgrade 2.8.1 -> 2.8.2

 meta/recipes-connectivity/dhcp/dhcp.inc            |   4 +-
 ...o-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch |   6 +-
 .../dhcp/dhcp/0002-dhclient-dbus.patch             |  10 +-
 .../dhcp/dhcp/0003-link-with-lcrypto.patch         |   6 +-
 .../dhcp/dhcp/0004-Fix-out-of-tree-builds.patch    |  87 +--------
 ...-fix-invoke-dhclient-script-failed-on-Rea.patch |   4 +-
 .../dhcp/0006-site.h-enable-gentle-shutdown.patch  |   6 +-
 ...re-argument-to-make-the-libxml2-dependenc.patch |  16 +-
 .../dhcp/0008-tweak-to-support-external-bind.patch | 161 ++++++----------
 ...09-remove-dhclient-script-bash-dependency.patch |   4 +-
 .../dhcp/dhcp/0010-build-shared-libs.patch         | 210 ++++++++++++---------
 ...all-to-isc_app_ctxstart-to-not-get-signal.patch |  81 --------
 ...orrect-the-intention-for-xml2-lib-search.patch} |  10 +-
 .../dhcp/{dhcp_4.3.6.bb => dhcp_4.4.1.bb}          |   7 +-
 .../recipes-core/ncurses/files/0001-tic-hang.patch |  24 +--
 .../files/0002-configure-reproducible.patch        |   8 +-
 meta/recipes-core/ncurses/ncurses.inc              |   1 +
 .../{ncurses_6.0+20171125.bb => ncurses_6.1.bb}    |   2 +-
 ...-memleak-bug-fix-for-builtin-command-read.patch |  35 ----
 .../bash/{bash_4.4.12.bb => bash_4.4.18.bb}        |   6 +-
 .../0001-contrib.mak-fix-for-parallel-build.patch} |  28 ++-
 ...base-gendev.c-fix-for-Werror-return-type.patch} |  10 +-
 ...nfigure.ac-do-not-check-local-png-source.patch} |  10 +-
 .../0004-avoid-host-contamination.patch}           |  18 +-
 ...allow-directories-to-be-created-more-tha.patch} |  16 +-
 .../0006-prevent-recompiling.patch}                |  79 +++-----
 ...7-not-generate-objarch.h-at-compile-time.patch} |  33 ++--
 .../0008-cups-no-gcrypt.patch}                     |  14 +-
 ...script-native-fix-disable-system-libtiff.patch} |  29 ++-
 ...-add-a-preprocessor-define-to-allow-fope.patch} |  14 +-
 .../files/0011-remove-direct-symlink.patch         |  40 ++++
 .../ghostscript/ghostscript/CVE-2017-11714.patch   |  61 ------
 .../ghostscript/ghostscript/CVE-2017-5951.patch    |  44 -----
 .../ghostscript/ghostscript/CVE-2017-7207.patch    |  39 ----
 .../ghostscript/ghostscript/CVE-2017-7975.patch    |  37 ----
 .../ghostscript/ghostscript/CVE-2017-9216.patch    |  36 ----
 .../ghostscript/ghostscript/CVE-2017-9611.patch    |  34 ----
 .../ghostscript/ghostscript/CVE-2017-9612.patch    |  35 ----
 .../ghostscript/ghostscript/CVE-2017-9726.patch    |  33 ----
 .../ghostscript/ghostscript/CVE-2017-9727.patch    |  35 ----
 .../ghostscript/ghostscript/CVE-2017-9739.patch    |  37 ----
 .../ghostscript/ghostscript/CVE-2017-9835.patch    | 125 ------------
 .../{ghostscript_9.21.bb => ghostscript_9.23.bb}   |  44 ++---
 .../man-db/{man-db_2.8.1.bb => man-db_2.8.2.bb}    |   4 +-
 ...c-use-a-custom-value-for-the-location-of-.patch |   7 +-
 .../gnupg/{gnupg_2.2.4.bb => gnupg_2.2.5.bb}       |   4 +-
 ...kgconfig.patch => 0001-support-pkgconfig.patch} |  67 ++++---
 .../{libgpg-error_1.27.bb => libgpg-error_1.28.bb} |   8 +-
 48 files changed, 502 insertions(+), 1127 deletions(-)
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/0011-Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch
 rename meta/recipes-connectivity/dhcp/dhcp/{0012-dhcp-correct-the-intention-for-xml2-lib-search.patch => 0011-dhcp-correct-the-intention-for-xml2-lib-search.patch} (82%)
 rename meta/recipes-connectivity/dhcp/{dhcp_4.3.6.bb => dhcp_4.4.1.bb} (73%)
 rename meta/recipes-core/ncurses/{ncurses_6.0+20171125.bb => ncurses_6.1.bb} (86%)
 delete mode 100644 meta/recipes-extended/bash/bash/bash-memleak-bug-fix-for-builtin-command-read.patch
 rename meta/recipes-extended/bash/{bash_4.4.12.bb => bash_4.4.18.bb} (74%)
 rename meta/recipes-extended/ghostscript/{ghostscript/ghostscript-9.15-parallel-make.patch => files/0001-contrib.mak-fix-for-parallel-build.patch} (55%)
 rename meta/recipes-extended/ghostscript/{ghostscript/ghostscript-9.16-Werror-return-type.patch => files/0002-base-gendev.c-fix-for-Werror-return-type.patch} (75%)
 rename meta/recipes-extended/ghostscript/files/{do-not-check-local-libpng-source.patch => 0003-configure.ac-do-not-check-local-png-source.patch} (81%)
 rename meta/recipes-extended/ghostscript/{ghostscript/avoid-host-contamination.patch => files/0004-avoid-host-contamination.patch} (61%)
 rename meta/recipes-extended/ghostscript/{ghostscript/mkdir-p.patch => files/0005-ghostscript-allow-directories-to-be-created-more-tha.patch} (80%)
 rename meta/recipes-extended/ghostscript/{ghostscript/ghostscript-9.21-prevent_recompiling.patch => files/0006-prevent-recompiling.patch} (48%)
 rename meta/recipes-extended/ghostscript/{ghostscript/ghostscript-9.02-genarch.patch => files/0007-not-generate-objarch.h-at-compile-time.patch} (42%)
 rename meta/recipes-extended/ghostscript/{ghostscript/cups-no-gcrypt.patch => files/0008-cups-no-gcrypt.patch} (67%)
 rename meta/recipes-extended/ghostscript/{ghostscript/ghostscript-9.21-native-fix-disable-system-libtiff.patch => files/0009-ghostscript-native-fix-disable-system-libtiff.patch} (53%)
 rename meta/recipes-extended/ghostscript/{ghostscript/base-genht.c-add-a-preprocessor-define-to-allow-fope.patch => files/0010-base-genht.c-add-a-preprocessor-define-to-allow-fope.patch} (68%)
 create mode 100644 meta/recipes-extended/ghostscript/files/0011-remove-direct-symlink.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-11714.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-5951.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-7207.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-7975.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9216.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9611.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9612.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9726.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9727.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9739.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9835.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_9.21.bb => ghostscript_9.23.bb} (71%)
 rename meta/recipes-extended/man-db/{man-db_2.8.1.bb => man-db_2.8.2.bb} (90%)
 rename meta/recipes-support/gnupg/{gnupg_2.2.4.bb => gnupg_2.2.5.bb} (92%)
 rename meta/recipes-support/libgpg-error/libgpg-error/{pkgconfig.patch => 0001-support-pkgconfig.patch} (76%)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.27.bb => libgpg-error_1.28.bb} (86%)

-- 
2.8.1


