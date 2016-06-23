Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 715726012C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 08:16:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5N8GM7K017634
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 01:16:23 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 23 Jun 2016 01:16:21 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jun 2016 16:16:27 +0800
Message-ID: <cover.1466669684.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/5] Package Upgrades: systemd, dbus, util-linux, systemd-bootchart
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
X-List-Received-Date: Thu, 23 Jun 2016 08:16:23 -0000
Content-Type: text/plain

The following changes since commit 7c1f1fc3d739d778886208d6833c34e6ca1dc148:

  build-appliance-image: Add LC_ALL setting and drop pseudo pieces (2016-06-16 22:43:57 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/PU-20160623
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/PU-20160623

Chen Qi (5):
  dbus/dbus-test: upgrade to 1.10.8
  systemd: upgrade to 230
  systemd-bootchart: add recipe
  util-linux: upgrade to 2.28
  bash-completion: delete files util-linux provides

 .../{dbus-test_1.10.6.bb => dbus-test_1.10.8.bb}   |   4 +-
 ...onfigure.ac-support-large-file-for-stat64.patch |  53 ---------
 .../dbus/{dbus_1.10.6.bb => dbus_1.10.8.bb}        |   5 +-
 meta/recipes-core/systemd/systemd.inc              |   4 +-
 .../systemd/0003-define-exp10-if-missing.patch     |  15 ++-
 ...4-Make-root-s-home-directory-configurable.patch |  62 +++++------
 ...0015-systemd-user-avoid-using-system-auth.patch |  13 +--
 ...-remove-userspace-firmware-loading-suppor.patch |  68 +++++-------
 .../systemd/0018-make-test-dir-configurable.patch  |  32 +++---
 ...ild-sys-fix-build-with-libgrcypt-disabled.patch | 122 ---------------------
 .../systemd/{systemd_229.bb => systemd_230.bb}     |   5 +-
 meta/recipes-core/util-linux/util-linux.inc        |   4 +-
 .../util-linux/avoid_unsupported_grep_opts.patch   |  57 ----------
 .../util-linux/avoid_unsupported_sleep_param.patch |  20 ----
 .../util-linux/display_testname_for_subtest.patch  |  27 +++--
 .../recipes-core/util-linux/util-linux/ptest.patch |  16 ++-
 .../util-linux/util-linux/util-linux-native.patch  |  57 ----------
 .../util-linux-ng-2.16-mount_lock_path.patch       |  27 -----
 .../util-linux/uuid-test-error-api.patch           |  21 ++--
 .../{util-linux_2.27.1.bb => util-linux_2.28.bb}   |  15 +--
 .../systemd-bootchart/systemd-bootchart_230.bb     |  28 +++++
 .../bash-completion/bash-completion_2.1.bb         |   2 +-
 22 files changed, 172 insertions(+), 485 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.10.6.bb => dbus-test_1.10.8.bb} (93%)
 delete mode 100644 meta/recipes-core/dbus/dbus/0001-configure.ac-support-large-file-for-stat64.patch
 rename meta/recipes-core/dbus/{dbus_1.10.6.bb => dbus_1.10.8.bb} (96%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0023-build-sys-fix-build-with-libgrcypt-disabled.patch
 rename meta/recipes-core/systemd/{systemd_229.bb => systemd_230.bb} (99%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/avoid_unsupported_grep_opts.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/avoid_unsupported_sleep_param.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/util-linux-native.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/util-linux-ng-2.16-mount_lock_path.patch
 rename meta/recipes-core/util-linux/{util-linux_2.27.1.bb => util-linux_2.28.bb} (61%)
 create mode 100644 meta/recipes-devtools/systemd-bootchart/systemd-bootchart_230.bb

-- 
1.9.1


