Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 80D2F6FFCD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 09:43:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5O9hoBe014364
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 02:43:50 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 24 Jun 2016 02:43:49 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Jun 2016 17:43:59 +0800
Message-ID: <cover.1466761342.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V3 0/3] Package Upgrade: systemd and util-linux
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
X-List-Received-Date: Fri, 24 Jun 2016 09:43:50 -0000
Content-Type: text/plain

The following changes since commit afb40bf179a58b7f3a8e365d87510ba2c54437d0:

  puzzles: fix Samba conflict, clean up recipe (2016-06-23 14:23:42 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/PU-20160624
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/PU-20160624

Chen Qi (3):
  util-linux: upgrade to 2.28
  bash-completion: delete files util-linux provides
  systemd: upgrade to 230

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
 .../systemd-bootchart/systemd-bootchart_230.bb     |  27 +++++
 .../bash-completion/bash-completion_2.1.bb         |   2 +-
 19 files changed, 168 insertions(+), 426 deletions(-)
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


