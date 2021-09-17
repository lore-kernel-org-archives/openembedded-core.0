Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web10.213.1631893596493193908
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Sep 2021 08:46:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10110"; a="202979786"
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; 
   d="scan'208";a="202979786"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2021 08:46:33 -0700
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; 
   d="scan'208";a="530877355"
Received: from weileewo-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.140.160])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2021 08:46:32 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 00/17] Pull request (cover letter only)
Date: Fri, 17 Sep 2021 23:46:27 +0800
Message-Id: <cover.1631893475.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please merge these changes.

Thanks,

Anuj

The following changes since commit 567dd35d893c5d8969d41f263a24da8fbae3fc2f:

  build-appliance-image: Update to hardknott head revision (2021-09-09 10:19:49 +0100)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/hardknott-next

Armin Kuster (1):
  apr: Security fix for CVE-2021-35940

Bruce Ashfield (4):
  linux-yocto/5.10: update to v5.10.61
  linux-yocto/5.10: update to v5.10.63
  linux-yocto/5.4: update to v5.4.143
  linux-yocto/5.4: update to v5.4.144

Changqing Li (1):
  sqlite3: fix CVE-2021-36690

Kai Kang (2):
  mc: fix CVE-2021-36370
  squashfs-tools: fix CVE-2021-40153

Kiran Surendran (2):
  ffmpeg: fix CVE-2021-38291
  ffmpeg: fix CVE-2021-38171

Mingli Yu (1):
  ruby: fix CVE-2021-31799

Richard Purdie (4):
  tcl: Exclude CVE-2021-35331 from checks
  flex: Add CVE-2019-6293 to exclusions for checks
  go: Exclude CVE-2021-29923 from report list
  systemtap: Fix headers issue with x86 and 5.13 headers

Trevor Gamblin (1):
  bluez5: fix CVE-2021-0129

Yi Zhao (1):
  ruby: Security fixes for CVE-2021-31810/CVE-2021-32066

 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
 ...er-Fix-not-properly-checking-for-sec.patch | 113 ++++
 meta/recipes-devtools/flex/flex_2.6.4.bb      |   5 +
 meta/recipes-devtools/go/go-1.16.7.inc        |   5 +
 .../ruby/ruby/CVE-2021-31799.patch            |  57 ++
 .../ruby/ruby/CVE-2021-31810.patch            | 258 ++++++++
 .../ruby/ruby/CVE-2021-32066.patch            | 102 +++
 meta/recipes-devtools/ruby/ruby_3.0.1.bb      |   3 +
 .../squashfs-tools/files/CVE-2021-40153.patch | 253 ++++++++
 .../squashfs-tools/squashfs-tools_git.bb      |   1 +
 meta/recipes-devtools/tcltk/tcl_8.6.11.bb     |   3 +
 .../mc/files/CVE-2021-36370.patch             | 609 ++++++++++++++++++
 meta/recipes-extended/mc/mc_4.8.26.bb         |   1 +
 .../linux/linux-yocto-rt_5.10.bb              |   4 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  22 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 ...8b9eda402e4e96c4e3ce01e7ff95d3e10470.patch |  26 +
 .../systemtap/systemtap_git.inc               |   1 +
 .../ffmpeg/ffmpeg/fix-CVE-2021-38171.patch    |  40 ++
 .../ffmpeg/ffmpeg/fix-CVE-2021-38291.patch    |  54 ++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb |   2 +
 .../apr/apr/CVE-2021-35940.patch              |  58 ++
 meta/recipes-support/apr/apr_1.7.0.bb         |   1 +
 .../sqlite/sqlite3/CVE-2021-36690.patch       |  62 ++
 meta/recipes-support/sqlite/sqlite3_3.35.0.bb |   4 +-
 28 files changed, 1692 insertions(+), 35 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-shared-gatt-server-Fix-not-properly-checking-for-sec.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2021-31799.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2021-31810.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2021-32066.patch
 create mode 100644 meta/recipes-devtools/squashfs-tools/files/CVE-2021-40153.patch
 create mode 100644 meta/recipes-extended/mc/files/CVE-2021-36370.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/ef5a8b9eda402e4e96c4e3ce01e7ff95d3e10470.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38171.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38291.patch
 create mode 100644 meta/recipes-support/apr/apr/CVE-2021-35940.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2021-36690.patch

-- 
2.31.1

