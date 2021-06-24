Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web10.3868.1624516242333095096
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jun 2021 23:30:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: mhtVDOaO5q019KW6xX9PozrXKQRMnLnbuabPbHZRQnSY5HopljshLHlAmCATDRsTjSH2xW5Nvh
 QQesEXlQtglA==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="205579323"
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; 
   d="scan'208";a="205579323"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2021 23:30:17 -0700
IronPort-SDR: zrAXIUFxrqouNVnh7hgh531r8xDrPhXqEPFyCo051jw11QCpPJyVbAGKnVngYZOc/wPNa0cUqs
 yg+Tu7amumfg==
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; 
   d="scan'208";a="445205290"
Received: from seng-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.180.105])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2021 23:30:16 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 00/13] pull request (cover letter only)
Date: Thu, 24 Jun 2021 14:30:10 +0800
Message-Id: <cover.1624516137.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please merge these changes in hardknott.

Thanks,

Anuj

The following changes since commit bfe25c99e914062b0527a6e74ebb8ce1eaad4ca8:

  linux-firmware: upgrade 20210315 -> 20210511 (2021-06-11 11:46:53 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/hardknott-next

Andrea Adami (1):
  kernel.bbclass: fix do_sizecheck() comparison

Bruce Ashfield (2):
  linux-yocto/5.4: update to v5.4.124
  linux-yocto/5.4: update to v5.4.125

Kai Kang (1):
  libx11: fix CVE-2021-31535

Khem Raj (1):
  linuxloader: Be aware of riscv32 ldso

Peter Kjellerstedt (2):
  util-linux.inc: Do not modify BPN
  native.bbclass: Do not remove "-native" in the middle of recipe names

Richard Purdie (2):
  lttng-tools: upgrade 2.12.3 -> 2.12.4
  perf: Use python3targetconfig to ensure we use target libraries

Ross Burton (1):
  avahi: apply fix for CVE-2021-3468

Tony Tascioglu (2):
  valgrind: remove buggy ptest from arm64
  valgrind: Actually install list of non-deterministic ptests

Trevor Gamblin (1):
  curl: cleanup CVE patches for hardknott

 meta/classes/kernel.bbclass                   |   2 +-
 meta/classes/linuxloader.bbclass              |   2 +
 meta/classes/native.bbclass                   |   8 +-
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   1 +
 .../avahi/files/handle-hup.patch              |  41 +++
 meta/recipes-core/util-linux/util-linux.inc   |   3 +-
 .../valgrind/valgrind/remove-for-aarch64      |   1 +
 .../valgrind/valgrind/run-ptest               |   4 +-
 .../valgrind/taskset_nondeterministic_tests   |   2 -
 .../valgrind/valgrind_3.16.1.bb               |   2 +
 .../xorg-lib/libx11/fix-CVE-2021-31535.patch  | 320 ++++++++++++++++++
 .../recipes-graphics/xorg-lib/libx11_1.7.0.bb |   5 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 ...-tools_2.12.3.bb => lttng-tools_2.12.4.bb} |   9 +-
 meta/recipes-kernel/perf/perf.bb              |   2 +-
 ...-argument-to-Curl_ssl_get-addsession.patch |  16 +-
 ...redentials-from-the-auto-referer-hea.patch |   5 +-
 19 files changed, 417 insertions(+), 42 deletions(-)
 create mode 100644 meta/recipes-connectivity/avahi/files/handle-hup.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/fix-CVE-2021-31535.patch
 rename meta/recipes-kernel/lttng/{lttng-tools_2.12.3.bb => lttng-tools_2.12.4.bb} (94%)

-- 
2.31.1

