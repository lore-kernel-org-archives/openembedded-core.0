Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1A23B601D3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Dec 2016 08:09:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uBQ89BRq010769
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Dec 2016 00:09:11 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.184) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 26 Dec 2016 00:09:10 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Dec 2016 16:10:28 +0800
Message-ID: <cover.1482739038.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/7] Package Upgrade: systemd-bootchart, dbus, dus-test, sysstat, flex, grep, byacc, coreutils
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
X-List-Received-Date: Mon, 26 Dec 2016 08:09:10 -0000
Content-Type: text/plain

The following changes since commit dbb247cac5fbf7b037e4955f9793828451723924:

  bitbake: cookerdata: Convert multiconfig to use BB_CURRENT_MC (2016-12-22 12:36:40 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/PU-20161226
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/PU-20161226

Chen Qi (7):
  systemd-bootchart: upgrade to 231
  dbus/dbus-test: upgrade to 1.10.14
  sysstat: upgrade to 11.5.3
  flex: upgrade to 2.6.2
  grep: upgrade to 2.27
  byacc: upgrade to 20161202
  coreutils: upgrade to 8.26

 ...need_charset_alias-when-building-for-musl.patch |  0
 ...0001-local.mk-fix-cross-compiling-problem.patch | 26 +++++++++
 ...e-report-processor-and-hardware-correctly.patch |  0
 .../disable-ls-output-quoting.patch                |  0
 .../fix-selinux-flask.patch                        |  0
 .../man-decouple-manpages-from-build.patch         |  0
 .../remove-usr-local-lib-from-m4.patch             |  0
 .../{coreutils_8.25.bb => coreutils_8.26.bb}       |  9 +--
 .../{dbus-test_1.10.10.bb => dbus-test_1.10.14.bb} |  4 +-
 .../dbus/{dbus_1.10.10.bb => dbus_1.10.14.bb}      |  4 +-
 ...lex-from-flex-native-to-fix-cross-compili.patch | 51 +++++++++++++++++
 ...oid-c-comments-in-c-code-fails-with-gcc-6.patch | 64 ----------------------
 .../recipes-devtools/flex/flex/CVE-2016-6354.patch | 59 --------------------
 .../flex/flex/do_not_create_pdf_doc.patch          | 17 ------
 .../flex/{flex_2.6.0.bb => flex_2.6.2.bb}          | 16 +++---
 ...d-bootchart_230.bb => systemd-bootchart_231.bb} |  4 +-
 .../byacc/{byacc_20160606.bb => byacc_20161202.bb} |  4 +-
 .../grep/{grep_2.26.bb => grep_2.27.bb}            |  4 +-
 .../{sysstat_11.4.0.bb => sysstat_11.5.3.bb}       |  4 +-
 19 files changed, 103 insertions(+), 163 deletions(-)
 rename meta/recipes-core/coreutils/{coreutils-8.25 => coreutils-8.26}/0001-Unset-need_charset_alias-when-building-for-musl.patch (100%)
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.26/0001-local.mk-fix-cross-compiling-problem.patch
 rename meta/recipes-core/coreutils/{coreutils-8.25 => coreutils-8.26}/0001-uname-report-processor-and-hardware-correctly.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.25 => coreutils-8.26}/disable-ls-output-quoting.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.25 => coreutils-8.26}/fix-selinux-flask.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.25 => coreutils-8.26}/man-decouple-manpages-from-build.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.25 => coreutils-8.26}/remove-usr-local-lib-from-m4.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils_8.25.bb => coreutils_8.26.bb} (93%)
 rename meta/recipes-core/dbus/{dbus-test_1.10.10.bb => dbus-test_1.10.14.bb} (93%)
 rename meta/recipes-core/dbus/{dbus_1.10.10.bb => dbus_1.10.14.bb} (98%)
 create mode 100644 meta/recipes-devtools/flex/flex/0001-use-stage1flex-from-flex-native-to-fix-cross-compili.patch
 delete mode 100644 meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch
 delete mode 100644 meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
 delete mode 100644 meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
 rename meta/recipes-devtools/flex/{flex_2.6.0.bb => flex_2.6.2.bb} (79%)
 rename meta/recipes-devtools/systemd-bootchart/{systemd-bootchart_230.bb => systemd-bootchart_231.bb} (92%)
 rename meta/recipes-extended/byacc/{byacc_20160606.bb => byacc_20161202.bb} (74%)
 rename meta/recipes-extended/grep/{grep_2.26.bb => grep_2.27.bb} (88%)
 rename meta/recipes-extended/sysstat/{sysstat_11.4.0.bb => sysstat_11.5.3.bb} (53%)

-- 
1.9.1


