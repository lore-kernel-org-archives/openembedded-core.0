Return-Path: <stefanx.stanacar@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 363336B4F7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 15:04:55 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 09 Aug 2013 08:04:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,846,1367996400"; d="scan'208";a="378605633"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 09 Aug 2013 08:04:34 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id D62142C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 08:04:32 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Aug 2013 18:04:28 +0300
Message-Id: <cover.1376060086.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 0/4] Fixes for testimage and new tests for systemd
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
X-List-Received-Date: Fri, 09 Aug 2013 15:04:55 -0000


The following changes since commit f63e7f4323368c0d6fe7a1d44393a7e15652d4f2:

  subversion: Add patch to use neon 0.30 (2013-08-07 07:43:47 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib stefans/oeqa-work2

for you to fetch changes up to ec7aac7ff30161a4900dbf98c0ba6fb4b7f00a35:

  lib/oeqa/runtime: add new systemd tests (2013-08-09 17:11:20 +0300)

----------------------------------------------------------------
Alexandru Palalau (1):
      lib/oeqa/runtime: add new systemd tests

Stefan Stanacar (3):
      oeqa/utils/qemurunner: get ip old fashioned way and use tcp serial console
      classes/testimage: create a link for qemu boot log
      lib/oeqa/runtime: rework syslog test

 meta/classes/testimage.bbclass       |  20 ++++--
 meta/lib/oeqa/runtime/syslog.py      |  23 +++++--
 meta/lib/oeqa/runtime/systemd.py     |  35 ++++++++++
 meta/lib/oeqa/utils/oeqemuconsole.py |  45 -------------
 meta/lib/oeqa/utils/qemurunner.py    | 123 +++++++++++++++++++++++------------
 5 files changed, 146 insertions(+), 100 deletions(-)
 delete mode 100644 meta/lib/oeqa/utils/oeqemuconsole.py

Alexandru Palalau (1):
  lib/oeqa/runtime: add new systemd tests

Stefan Stanacar (3):
  oeqa/utils/qemurunner: get ip old fashioned way and use tcp serial
    console
  classes/testimage: create a link for qemu boot log
  lib/oeqa/runtime: rework syslog test

 meta/classes/testimage.bbclass       |  20 ++++--
 meta/lib/oeqa/runtime/syslog.py      |  23 +++++--
 meta/lib/oeqa/runtime/systemd.py     |  35 ++++++++++
 meta/lib/oeqa/utils/oeqemuconsole.py |  45 -------------
 meta/lib/oeqa/utils/qemurunner.py    | 123 +++++++++++++++++++++++------------
 5 files changed, 146 insertions(+), 100 deletions(-)
 delete mode 100644 meta/lib/oeqa/utils/oeqemuconsole.py

-- 
1.8.3.1


