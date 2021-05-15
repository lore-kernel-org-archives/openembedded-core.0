Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web10.6590.1621089082565574560
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 07:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: bwU0r/3tkZieg0M7pLO/ozfoW8PqbOyt3c70rYlNh/vsCniVWy5LWyk8tw8QKFR+r9IES2A78f
 m+GI9bTzNELA==
X-IronPort-AV: E=McAfee;i="6200,9189,9984"; a="200336490"
X-IronPort-AV: E=Sophos;i="5.82,303,1613462400"; 
   d="scan'208";a="200336490"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2021 07:31:21 -0700
IronPort-SDR: 1M6N8gzhTfQs7qI4a/JlziaLxEYIINlLEkKRwLqSghe/YSzxt8IiusIua9biM3dIRVCVdje5fx
 lQvnBSEBJ+rQ==
X-IronPort-AV: E=Sophos;i="5.82,303,1613462400"; 
   d="scan'208";a="393923833"
Received: from wongvero-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.132.29])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2021 07:31:19 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 00/15] pull request (cover letter only)
Date: Sat, 15 May 2021 22:31:15 +0800
Message-Id: <cover.1621088943.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please merge these changes in hardknott.

Thanks,

Anuj

The following changes since commit d5d88c2293e8ebc958d1bce9af8f796024443be9:

  libevent: Increase ptest timing tolerance 50 ms -> 100 ms (2021-05-07 08:51:54 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/hardknott-next

Alexander Kanavin (1):
  linux-firmware: upgrade 20210208 -> 20210315

Anuj Mittal (1):
  lsb-release: fix reproducibility failure

Bruce Ashfield (1):
  linux-yocto/5.4: qemuppc32: reduce serial shutdown issues

Chen Qi (1):
  db: update CVE_PRODUCT

Kai Kang (1):
  grub2.inc: remove '-O2' from CFLAGS

Michael Opdenacker (1):
  sanity.bbclass: mention CONNECTIVITY_CHECK_URIS in network failure
    message

Peter Kjellerstedt (1):
  libcap: Configure Make variables correctly without a horrible hack

Richard Purdie (4):
  oeqa/qemurunner: Improve logging thread exit handling for qemu
    shutdown test
  oeqa/qemurunner: Fix binary vs str issue
  oeqa/qemurunner: Improve handling of run_serial for shutdown commands
  puzzles: Upstream changed to main branch for development

Romain Naour (1):
  dejagnu: needs expect at runtime

Vinícius Ossanes Aquino (1):
  lttng-modules: backport patches to fix build against 5.12+ kernel

Yann Dirson (1):
  linux-firmware: include all relevant files in -bcm4356

zhengruoqin (1):
  ruby: upgrade 3.0.0 -> 3.0.1

 meta/classes/sanity.bbclass                   |   9 +-
 meta/lib/oeqa/selftest/cases/runqemu.py       |   9 +-
 meta/lib/oeqa/utils/qemurunner.py             |  21 +-
 meta/recipes-bsp/grub/grub2.inc               |   2 +
 .../recipes-devtools/dejagnu/dejagnu_1.6.2.bb |   1 +
 .../ruby/{ruby_3.0.0.bb => ruby_3.0.1.bb}     |   2 +-
 .../help2man-reproducibility.patch            |  27 ++
 meta/recipes-extended/lsb/lsb-release_1.4.bb  |   1 +
 ...20210208.bb => linux-firmware_20210315.bb} |   8 +-
 .../linux/linux-yocto-rt_5.4.bb               |   2 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |   2 +-
 ...block-add-a-disk_uevent-helper-v5.12.patch | 305 ++++++++++++++++++
 ...block-add-a-disk_uevent-helper-v5.12.patch |  48 +++
 ...free-event-name-mismatching-with-pro.patch |  71 ++++
 .../lttng/lttng-modules_2.12.5.bb             |   3 +
 meta/recipes-sato/puzzles/puzzles_git.bb      |   2 +-
 meta/recipes-support/db/db_5.3.28.bb          |   2 +-
 meta/recipes-support/libcap/libcap_2.48.bb    |  21 +-
 19 files changed, 504 insertions(+), 34 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_3.0.0.bb => ruby_3.0.1.bb} (97%)
 create mode 100644 meta/recipes-extended/lsb/lsb-release/help2man-reproducibility.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20210208.bb => linux-firmware_20210315.bb} (99%)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-fix-block-add-a-disk_uevent-helper-v5.12.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0006-fix-backport-block-add-a-disk_uevent-helper-v5.12.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0007-fix-mm-tracing-kfree-event-name-mismatching-with-pro.patch

-- 
2.31.1

