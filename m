Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web09.29637.1620019218925237047
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 May 2021 22:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: fzoSO82uIh5jhDWU9L8vX24CBvBDaMkClkG1n07QD0LU6Ao75RV2jfYh6rwPDEix+xzLZYi5uN
 EM4+KrYD0Pnw==
X-IronPort-AV: E=McAfee;i="6200,9189,9972"; a="177199245"
X-IronPort-AV: E=Sophos;i="5.82,268,1613462400"; 
   d="scan'208";a="177199245"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2021 22:20:17 -0700
IronPort-SDR: MXQ9ZO4Ej7ovIiM0UTjmtRdV/ZldLr+VvefcAI4kPbWn5+mahugs9mkHOapLbsltqqWyWTwlTT
 bQQlLOv2mRMw==
X-IronPort-AV: E=Sophos;i="5.82,268,1613462400"; 
   d="scan'208";a="621004284"
Received: from limteng-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.163.79])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2021 22:20:15 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Subject: [hardknott][PATCH 00/10] pull request
Date: Mon,  3 May 2021 13:20:07 +0800
Message-Id: <cover.1620018976.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please merge these changes in hardknott.

Thanks,

Anuj

The following changes since commit 3357bbf0dad31306d5e16ad306d3e931042eec61:

  go: Use dl.google.com for SRC_URI (2021-04-26 08:44:53 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/hardknott-next

Alexander Kanavin (2):
  oeqa: tear down oeqa decorators if one of them raises an exception in
    setup
  meta/lib/oeqa/core/tests/cases/timeout.py: add a testcase for the
    previous fix

Chen Qi (3):
  glib-2.0: fix CVE-2021-28153
  weston: fix build failure due to race condition
  rsync: fix CVE-2020-14387

Kai Kang (2):
  kernel-yocto.bbclass: chdir to ${WORKDIR} for do_kernel_checkout
  cmake.bbclass: remove ${B} before cmake_do_configure

Richard Purdie (2):
  yocto-check-layer: Avoid bug when iterating and autoadding
    dependencies
  patchelf: Backport fix from upstream for note section overlap error

Stefan Ghinea (1):
  libssh2: fix build failure with option no-ecdsa

 meta/classes/cmake.bbclass                    |   8 +-
 meta/classes/kernel-yocto.bbclass             |   2 +-
 meta/lib/oeqa/core/case.py                    |   9 +-
 meta/lib/oeqa/core/decorator/oetimeout.py     |   5 +-
 meta/lib/oeqa/core/tests/cases/timeout.py     |  13 +
 meta/lib/oeqa/core/tests/test_decorators.py   |   6 +
 ...outputstream-Fix-a-typo-in-a-comment.patch |  32 ++
 ...-using-g_test_bug_base-in-file-tests.patch |  47 +++
 ...outputstream-Factor-out-a-flag-check.patch |  60 ++++
 ...stream-Fix-CREATE_REPLACE_DESTINATIO.patch | 294 ++++++++++++++++++
 ...stream-Add-a-missing-O_CLOEXEC-flag-.patch |  60 ++++
 meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb |  10 +
 ...c83653ce1b5fc201ff6db93b966394766814.patch |  44 +++
 .../patchelf/patchelf_0.12.bb                 |   1 +
 ...-the-hostname-in-the-certificate-whe.patch |  31 ++
 meta/recipes-devtools/rsync/rsync_3.2.3.bb    |   1 +
 ...001-meson.build-fix-incorrect-header.patch |  32 ++
 meta/recipes-graphics/wayland/weston_9.0.0.bb |   1 +
 ...EC-macro-outside-of-if-check-549-550.patch | 112 +++++++
 meta/recipes-support/libssh2/libssh2_1.9.0.bb |   1 +
 scripts/yocto-check-layer                     |   3 +
 21 files changed, 762 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-glocalfileoutputstream-Fix-a-typo-in-a-comment.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0002-tests-Stop-using-g_test_bug_base-in-file-tests.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0003-glocalfileoutputstream-Factor-out-a-flag-check.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0004-glocalfileoutputstream-Fix-CREATE_REPLACE_DESTINATIO.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0005-glocalfileoutputstream-Add-a-missing-O_CLOEXEC-flag-.patch
 create mode 100644 meta/recipes-devtools/patchelf/patchelf/6edec83653ce1b5fc201ff6db93b966394766814.patch
 create mode 100644 meta/recipes-devtools/rsync/files/0001-rsync-ssl-Verify-the-hostname-in-the-certificate-whe.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-meson.build-fix-incorrect-header.patch
 create mode 100644 meta/recipes-support/libssh2/files/0001-kex.c-move-EC-macro-outside-of-if-check-549-550.patch

-- 
2.30.2

