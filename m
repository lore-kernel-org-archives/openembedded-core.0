Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web09.3944.1623383459422790226
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jun 2021 20:51:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 8BbRhjA8B5G69dreQOWYj5eDReSrgPaXz+m5N3xZkmqKdbo9uSJNMMtPu9SViMdsUNR3ZCbkIt
 +6ahVUtvuJxw==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="192565995"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="192565995"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 20:50:55 -0700
IronPort-SDR: p1nPTb0P+LQzfDBlkfjKsmQaTaGy73VXdoczeyXjf0kKDpTbMFmx5M/hCJPEeJDJpAJwFdiL93
 PqGoj0fETMLA==
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="403091572"
Received: from dlau-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.151.154])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 20:50:54 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 00/17] review request
Date: Fri, 11 Jun 2021 11:50:33 +0800
Message-Id: <cover.1623383318.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review these next set of changes for hardknott. No problems seen
while building/testing on autobuilder.

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

