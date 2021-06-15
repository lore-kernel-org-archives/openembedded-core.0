Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web09.6007.1623741433303778513
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 00:17:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 6StGJlQ56kIyYCbbj0lEy69GfvXt6zM6BIgCE1pjoa9mmAeNctdI6IZT3IcPyR/jLj/OsP5M6K
 V2S4iNh9Qjyw==
X-IronPort-AV: E=McAfee;i="6200,9189,10015"; a="205757499"
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; 
   d="scan'208";a="205757499"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2021 00:17:11 -0700
IronPort-SDR: od53YOTfYMsZNeJGiG6uVazg1hK6OtwuVVxhWAQTQu5EngKkwrvDEZF/plkMmqoZt3xBlREC6f
 BFaFr0BsCJgg==
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; 
   d="scan'208";a="487675475"
Received: from janetcha-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.152.113])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2021 00:17:10 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 00/17] pull request (cover letter only)
Date: Tue, 15 Jun 2021 15:17:06 +0800
Message-Id: <cover.1623741303.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please merge these changes in hardknott.

Thanks,

Anuj

The following changes since commit 6ca1047e98a1c8bc305a3f40ad1919c5038e1698:

  oeqa/runtime/rpm: Drop log message counting test component (2021-06-02 14:26:58 +0100)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/hardknott-next

Bruce Ashfield (11):
  linux-yocto/5.10: update to v5.10.35
  linux-yocto/5.4: update to v5.4.117
  linux-yocto/5.10: ktypes/standard: disable obsolete crypto options by
    default
  linux-yocto/5.10: update to v5.10.36
  linux-yocto/5.4: update to v5.4.118
  linux-yocto/5.10: update to v5.10.37
  linux-yocto/5.4: update to v5.4.119
  linux-yocto/5.10: update to v5.10.38
  linux-yocto/5.4: update to v5.4.120
  linux-yocto/5.10: update to v5.10.41
  linux-yocto/5.4: update to v5.4.123

Guillaume Champagne (1):
  image-live.bbclass: order do_bootimg after do_rootfs

Joshua Watt (1):
  classes/reproducible_build: Use atomic rename for SDE file

Kai Kang (1):
  valgrind: fix a typo

Richard Purdie (1):
  linux-firmware: upgrade 20210315 -> 20210511

Tony Tascioglu (1):
  valgrind: Improve non-deterministic ptest reliability

Trevor Gamblin (1):
  python3: upgrade 3.9.4 -> 3.9.5

 meta/classes/image-live.bbclass               |  2 +-
 meta/classes/reproducible_build.bbclass       | 13 +++++-----
 .../{python3_3.9.4.bb => python3_3.9.5.bb}    |  2 +-
 .../valgrind/valgrind/run-ptest               | 12 ++++++++++
 .../valgrind/taskset_nondeterministic_tests   |  4 ++++
 .../valgrind/valgrind_3.16.1.bb               |  2 +-
 ...20210315.bb => linux-firmware_20210511.bb} |  4 ++--
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 ++++++++---------
 13 files changed, 64 insertions(+), 49 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.9.4.bb => python3_3.9.5.bb} (99%)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/taskset_nondeterministic_tests
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20210315.bb => linux-firmware_20210511.bb} (99%)

-- 
2.31.1

