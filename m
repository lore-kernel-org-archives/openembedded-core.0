Return-Path: <laurentiu.palcu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E4A8360667
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 12:26:35 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 17 Jun 2013 05:26:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,880,1363158000"; d="scan'208";a="351041552"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jun 2013 05:27:11 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jun 2013 15:26:33 +0300
Message-Id: <cover.1371471166.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] xinput-calibrator: move it from meta-oe to oe-core
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
X-List-Received-Date: Mon, 17 Jun 2013 12:26:36 -0000

The following changes since commit 7abcaf14ec9cd760fe94c777f0cd8426163de2c5:

  oe-buildenv-internal: Fix exit verses return (2013-06-17 10:41:01 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/xinput-calibrator_oe-core
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/xinput-calibrator_oe-core

Laurentiu Palcu (1):
  xinput-calibrator: move it from meta-oe to oe-core

 .../pointercal-xinput/pointercal.xinput            |    1 +
 .../xinput-calibrator/pointercal-xinput_0.0.bb     |   17 ++++++++
 .../xinput-calibrator/xinput-calibrator.service    |   11 ++++++
 .../xinput-calibrator/xinput-calibrator_git.bb     |   41 ++++++++++++++++++++
 4 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
 create mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service
 create mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb

-- 
1.7.9.5


