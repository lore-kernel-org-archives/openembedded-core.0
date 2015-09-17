Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CEBB076DE1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 12:58:09 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 17 Sep 2015 05:58:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,547,1437462000"; d="scan'208";a="563542344"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 17 Sep 2015 05:58:08 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Sep 2015 16:00:20 +0300
Message-Id: <cover.1442494048.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/1] Add a dummy pointercal calibration for qemu
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
X-List-Received-Date: Thu, 17 Sep 2015 12:58:11 -0000

xinput_calibrator keeps popping up on every boot (or session start)
when testing Sato image on qemu: This seems to be because qemu
emulates a tablet and is made worse by xinput_calibrator not
actually being able to write xinput files for xorg drivers, so the
problem persists on following boots.

The patch adds a dummy calibration file for "qemuall". I wasn't sure
how this should be done so let me know if there's a better solution.

 - Jussi

The following changes since commit ea562de57590c966cd5a75fda8defecd397e6436:

  qemu: Update to upstream patches (2015-09-14 20:46:40 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/pointercal-xinput
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/pointercal-xinput

Jussi Kukkonen (1):
  xinput-calibrator: Add a dummy calibration file for qemu

 .../xinput-calibrator/pointercal-xinput/pointercal-qemu.xinput      | 2 ++
 meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb    | 6 ++++++
 2 files changed, 8 insertions(+)
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal-qemu.xinput

-- 
2.1.4


