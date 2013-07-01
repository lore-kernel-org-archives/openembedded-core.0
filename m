Return-Path: <laurentiu.palcu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 5CD746A4AC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 13:58:41 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 01 Jul 2013 06:58:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,974,1363158000"; d="scan'208";a="262624489"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Jul 2013 06:58:40 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jul 2013 16:57:30 +0300
Message-Id: <cover.1372686507.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1371471166.git.laurentiu.palcu@intel.com>
References: <cover.1371471166.git.laurentiu.palcu@intel.com>
Subject: [PATCH v2 0/1] xinput-calibrator: move it from meta-oe to oe-core
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
X-List-Received-Date: Mon, 01 Jul 2013 13:58:41 -0000

Changes in v2:
 * run calibration through xsession file;
 * allow normal user to write his calibration data to ~/.pointercal/pointercal.xinput
   and then use it when system boots;

Laurentiu

The following changes since commit 80b263430453896189b704d0997943642eec6fef:

  classes/insane: remove la2 check which no longer exists from ERROR_QA (2013-06-28 16:33:08 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/xinput-calibrator_oe-core
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/xinput-calibrator_oe-core

Laurentiu Palcu (1):
  xinput-calibrator: move it from meta-oe to oe-core

 .../pointercal-xinput/pointercal.xinput            |    1 +
 .../xinput-calibrator/pointercal-xinput_0.0.bb     |   17 +++++
 .../xinput-calibrator/30xinput_calibrate.sh        |    7 +++
 ...t_calibrator_pointercal.sh-to-be-run-as-n.patch |   66 ++++++++++++++++++++
 .../xinput-calibrator/xinput-calibrator_git.bb     |   34 ++++++++++
 5 files changed, 125 insertions(+)
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
 create mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibrator/30xinput_calibrate.sh
 create mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibrator/Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch
 create mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb

-- 
1.7.9.5


