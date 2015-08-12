Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D7A43607A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 22:14:06 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 12 Aug 2015 15:14:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,664,1432623600"; d="scan'208";a="540760337"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Aug 2015 15:14:06 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Aug 2015 14:05:50 +0000
Message-Id: <cover.1439387979.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH 0/6] Allow to dump commands from serial console when a test fails
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
X-List-Received-Date: Wed, 12 Aug 2015 22:14:10 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

These changes allows to run commands on the qemu serial console
when a test fails. Right now the tests are hardcoded but the
idea is to be able to customize them.

qemurunner.py: Added and tunned run_serial method to allow
to run serial commands on the target

oetest.py: Added tearDown method to oeRuntimeTest, this allows
to catch when a test fails and run the diagnostic commands on
the target

The following changes since commit 0f7df92e3d2dbbb4c94299171d5d0287887e0d28:

  clutter-gst: update to 3.0.8 (2015-08-11 09:28:52 -0700)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug8118v2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug8118v2

Mariano Lopez (6):
  qemurunner.py: Add method run_serial
  qemurunner.py: Added login to start method
  qemurunner.py: Added raw mode in run_serial
  qemurunner.py: Performance improvements in run_serial
  oetest.py: Added method tearDown for oeRuntimeTest
  oetest.py: Don't wait to write dump files

 meta/lib/oeqa/oetest.py           | 35 +++++++++++++++++++++++++++
 meta/lib/oeqa/utils/qemurunner.py | 50 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 85 insertions(+)

-- 
1.8.4.5


