Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 161077E099
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2019 08:17:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4C8GhfH008537
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 12 May 2019 01:16:53 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Sun, 12 May 2019 01:16:32 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Sun, 12 May 2019 16:16:20 +0800
Message-ID: <cover.1557628550.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 00/10] Upgrade 9 recipes and 1 fix
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
X-List-Received-Date: Sun, 12 May 2019 08:17:19 -0000
Content-Type: text/plain

The following changes since commit 244f2e5fb545dd40d020811799a6022e14468eeb:

  icu: Added armeb support. (2019-05-09 16:31:06 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/upgrade-20190510
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/upgrade-20190510

Hongxu Jia (10):
  apr: upgrade 1.6.5 -> 1.7.0
  man-pages: upgrade 4.16 -> 5.01
  man-db: upgrade 2.8.4 -> 2.8.5
  bash: upgrade 4.4.18 -> 5.0
  ncurses: fix incorrect UPSTREAM_CHECK_GITTAGREGEX
  gpgme: upgrade 1.12.0 -> 1.13.0
  subversion: upgrade 1.11.1 -> 1.12.0
  groff: upgrade 1.22.3 -> 1.22.4
  libxml2: upgrade 2.9.8 -> 2.9.9
  ghostscript: 9.26 -> 9.27

 ...1-Fix-infinite-loop-in-LZMA-decompression.patch |  55 --
 .../libxml/libxml2/fix-CVE-2017-8872.patch         |  65 ---
 .../libxml/libxml2/fix-CVE-2018-14404.patch        |  45 --
 .../libxml/libxml2/fix-execution-of-ptests.patch   |  24 +-
 .../recipes-core/libxml/libxml2/libxml-64bit.patch |  24 +-
 .../libxml/libxml2/libxml-m4-use-pkgconfig.patch   |  16 +-
 .../libxml/libxml2/python-sitepackages-dir.patch   |  13 +-
 meta/recipes-core/libxml/libxml2/runtest.patch     | 204 +++----
 .../libxml/{libxml2_2.9.8.bb => libxml2_2.9.9.bb}  |   7 +-
 meta/recipes-core/ncurses/ncurses_6.1+20181013.bb  |   2 +-
 .../subversion/subversion/disable_macos.patch      |  45 +-
 .../subversion/subversion/serfmacro.patch          |  27 +-
 .../subversion-1.12.0-apr_1.7.0_fix-1.patch        | 107 ++++
 .../{subversion_1.11.1.bb => subversion_1.12.0.bb} |   7 +-
 ...1-help-fix-printf-format-security-warning.patch |  35 --
 meta/recipes-extended/bash/bash/build-tests.patch  |   7 +-
 meta/recipes-extended/bash/bash/execute_cmd.patch  |  19 +-
 meta/recipes-extended/bash/bash/pathexp-dep.patch  |  13 -
 meta/recipes-extended/bash/bash_4.4.18.bb          |  41 --
 meta/recipes-extended/bash/bash_5.0.bb             |  45 ++
 .../ghostscript/CVE-2019-3835-0001.patch           |  99 ----
 .../ghostscript/CVE-2019-3835-0002.patch           |  71 ---
 .../ghostscript/CVE-2019-3835-0003.patch           | 295 ----------
 .../ghostscript/CVE-2019-3835-0004.patch           | 167 ------
 .../ghostscript/CVE-2019-3838-0001.patch           |  34 --
 .../ghostscript/CVE-2019-3838-0002.patch           |  30 --
 .../ghostscript/CVE-2019-6116-0001.patch           | 177 ------
 .../ghostscript/CVE-2019-6116-0002.patch           | 442 ---------------
 .../ghostscript/CVE-2019-6116-0003.patch           |  32 --
 .../ghostscript/CVE-2019-6116-0004.patch           | 136 -----
 .../ghostscript/CVE-2019-6116-0005.patch           | 250 ---------
 .../ghostscript/CVE-2019-6116-0006.patch           | 596 ---------------------
 .../ghostscript/CVE-2019-6116-0007.patch           | 346 ------------
 .../ghostscript/ghostscript-9.02-genarch.patch     |  14 +-
 .../{ghostscript_9.26.bb => ghostscript_9.27.bb}   |  19 +-
 .../groff/files/0001-fix-shebang-for-taget.patch   |  31 ++
 .../0001-replace-perl-w-with-use-warnings.patch    |  34 +-
 .../groff/files/0001-support-musl.patch            |  46 ++
 .../groff-not-search-fonts-on-build-host.patch     |  20 +-
 ...need_charset_alias-when-building-for-musl.patch |  30 --
 ...off-1.22.2-correct-man.local-install-path.patch |  34 --
 .../groff/{groff_1.22.3.bb => groff_1.22.4.bb}     |  36 +-
 .../man-db/{man-db_2.8.4.bb => man-db_2.8.5.bb}    |   9 +-
 .../{man-pages_4.16.bb => man-pages_5.01.bb}       |   4 +-
 ..._t-size-doesn-t-match-in-glibc-when-cross.patch |  26 +-
 .../apr/{apr_1.6.5.bb => apr_1.7.0.bb}             |   4 +-
 ...d-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch | 134 +++++
 .../gpgme/gpgme/0001-pkgconfig.patch               |  72 ++-
 ...python-gpg-error-config-should-not-be-use.patch |  33 +-
 .../gpgme/0008-do-not-auto-check-var-PYTHON.patch  |  36 ++
 .../gpgme/{gpgme_1.12.0.bb => gpgme_1.13.0.bb}     |  12 +-
 51 files changed, 763 insertions(+), 3307 deletions(-)
 delete mode 100644 meta/recipes-core/libxml/libxml2/0001-Fix-infinite-loop-in-LZMA-decompression.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/fix-CVE-2017-8872.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/fix-CVE-2018-14404.patch
 rename meta/recipes-core/libxml/{libxml2_2.9.8.bb => libxml2_2.9.9.bb} (93%)
 create mode 100644 meta/recipes-devtools/subversion/subversion/subversion-1.12.0-apr_1.7.0_fix-1.patch
 rename meta/recipes-devtools/subversion/{subversion_1.11.1.bb => subversion_1.12.0.bb} (92%)
 delete mode 100644 meta/recipes-extended/bash/bash/0001-help-fix-printf-format-security-warning.patch
 delete mode 100644 meta/recipes-extended/bash/bash/pathexp-dep.patch
 delete mode 100644 meta/recipes-extended/bash/bash_4.4.18.bb
 create mode 100644 meta/recipes-extended/bash/bash_5.0.bb
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3835-0001.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3835-0002.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3835-0003.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3835-0004.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3838-0001.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3838-0002.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-6116-0001.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-6116-0002.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-6116-0003.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-6116-0004.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-6116-0005.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-6116-0006.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-6116-0007.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_9.26.bb => ghostscript_9.27.bb} (85%)
 create mode 100644 meta/recipes-extended/groff/files/0001-fix-shebang-for-taget.patch
 rename meta/recipes-extended/groff/{groff-1.22.3 => files}/0001-replace-perl-w-with-use-warnings.patch (76%)
 create mode 100644 meta/recipes-extended/groff/files/0001-support-musl.patch
 rename meta/recipes-extended/groff/{groff-1.22.3 => files}/groff-not-search-fonts-on-build-host.patch (42%)
 delete mode 100644 meta/recipes-extended/groff/groff-1.22.3/0001-Unset-need_charset_alias-when-building-for-musl.patch
 delete mode 100644 meta/recipes-extended/groff/groff-1.22.3/groff-1.22.2-correct-man.local-install-path.patch
 rename meta/recipes-extended/groff/{groff_1.22.3.bb => groff_1.22.4.bb} (62%)
 rename meta/recipes-extended/man-db/{man-db_2.8.4.bb => man-db_2.8.5.bb} (86%)
 rename meta/recipes-extended/man-pages/{man-pages_4.16.bb => man-pages_5.01.bb} (87%)
 rename meta/recipes-support/apr/{apr_1.6.5.bb => apr_1.7.0.bb} (96%)
 create mode 100644 meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
 create mode 100644 meta/recipes-support/gpgme/gpgme/0008-do-not-auto-check-var-PYTHON.patch
 rename meta/recipes-support/gpgme/{gpgme_1.12.0.bb => gpgme_1.13.0.bb} (88%)

-- 
2.7.4


