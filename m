Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1C884762B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 03:36:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5H3akXY008778
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 20:36:46 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 16 Jun 2016 20:36:45 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Jun 2016 11:36:43 +0800
Message-ID: <cover.1466134497.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/4] Upgrade systemd, dbus and util-linux
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
X-List-Received-Date: Fri, 17 Jun 2016 03:36:47 -0000
Content-Type: text/plain


===================================


Note that I've removed ptest support for util-linux because the codes have changed a lot.
If you think that ptest support is necessary for util-linux, I'll try to add it back for the new version.


===================================


The following changes since commit 7c1f1fc3d739d778886208d6833c34e6ca1dc148:

  build-appliance-image: Add LC_ALL setting and drop pseudo pieces (2016-06-16 22:43:57 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/PU-20160617
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/PU-20160617

Chen Qi (4):
  dbus/dbus-test: upgrade to 1.10.8
  systemd: upgrade to 230
  systemd-bootchart: add recipe
  util-linux: upgrade to 2.28

 .../{dbus-test_1.10.6.bb => dbus-test_1.10.8.bb}   |  4 +-
 ...onfigure.ac-support-large-file-for-stat64.patch | 53 -------------
 .../dbus/{dbus_1.10.6.bb => dbus_1.10.8.bb}        |  5 +-
 meta/recipes-core/systemd/systemd.inc              |  4 +-
 .../systemd/0003-define-exp10-if-missing.patch     | 15 ++--
 ...4-Make-root-s-home-directory-configurable.patch | 62 +++++++--------
 ...0015-systemd-user-avoid-using-system-auth.patch | 13 ++-
 ...-remove-userspace-firmware-loading-suppor.patch | 68 +++++++---------
 .../systemd/0018-make-test-dir-configurable.patch  | 32 ++++----
 .../systemd/{systemd_229.bb => systemd_230.bb}     |  5 +-
 meta/recipes-core/util-linux/util-linux.inc        | 31 +-------
 .../util-linux/avoid_parallel_tests.patch          | 19 -----
 .../util-linux/avoid_unsupported_grep_opts.patch   | 57 --------------
 .../util-linux/avoid_unsupported_sleep_param.patch | 20 -----
 .../util-linux/display_testname_for_subtest.patch  | 18 -----
 .../recipes-core/util-linux/util-linux/ptest.patch | 17 ----
 meta/recipes-core/util-linux/util-linux/run-ptest  | 25 ------
 .../util-linux/util-linux/util-linux-native.patch  | 57 --------------
 .../util-linux-ng-2.16-mount_lock_path.patch       | 27 -------
 .../util-linux/uuid-test-error-api.patch           | 92 ----------------------
 .../{util-linux_2.27.1.bb => util-linux_2.28.bb}   | 20 ++---
 .../systemd-bootchart/systemd-bootchart_230.bb     | 30 +++++++
 22 files changed, 130 insertions(+), 544 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.10.6.bb => dbus-test_1.10.8.bb} (93%)
 delete mode 100644 meta/recipes-core/dbus/dbus/0001-configure.ac-support-large-file-for-stat64.patch
 rename meta/recipes-core/dbus/{dbus_1.10.6.bb => dbus_1.10.8.bb} (96%)
 rename meta/recipes-core/systemd/{systemd_229.bb => systemd_230.bb} (99%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/avoid_unsupported_grep_opts.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/avoid_unsupported_sleep_param.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/ptest.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/run-ptest
 delete mode 100644 meta/recipes-core/util-linux/util-linux/util-linux-native.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/util-linux-ng-2.16-mount_lock_path.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/uuid-test-error-api.patch
 rename meta/recipes-core/util-linux/{util-linux_2.27.1.bb => util-linux_2.28.bb} (44%)
 create mode 100644 meta/recipes-devtools/systemd-bootchart/systemd-bootchart_230.bb

-- 
1.9.1


