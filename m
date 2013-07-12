Return-Path: <laurentiu.palcu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 70BFA608BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 12:04:04 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 12 Jul 2013 05:04:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,652,1367996400"; d="scan'208";a="330381357"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 12 Jul 2013 05:04:03 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jul 2013 15:04:02 +0300
Message-Id: <cover.1373630218.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1372686507.git.laurentiu.palcu@intel.com>
References: <cover.1372686507.git.laurentiu.palcu@intel.com>
Subject: [PATCH v3 0/1] xinput-calibrator: move it from meta-oe to oe-core (cover letter only)
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
X-List-Received-Date: Fri, 12 Jul 2013 12:04:04 -0000

Changes in v3:
 * do not install pointercal.xinput if it's the default one;

Changes in v2:
 * run calibration through xsession file;
 * allow normal user to write his calibration data to ~/.pointercal/pointercal.xinput
   and then use it when system boots;

Laurentiu

The following changes since commit a63229917a5708de2d161aba0d67168ce0da6365:

  meta-yocto-bsp: update reference board SRCREVs (2013-07-10 09:45:51 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/xinput-calibrator_oe-core_v3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/xinput-calibrator_oe-core_v3

Laurentiu Palcu (1):
  xinput-calibrator: move it from meta-oe to oe-core

 .../pointercal-xinput/pointercal.xinput            |    1 +
 .../xinput-calibrator/pointercal-xinput_0.0.bb     |   18 ++++++
 .../xinput-calibrator/30xinput_calibrate.sh        |    7 +++
 ...t_calibrator_pointercal.sh-to-be-run-as-n.patch |   66 ++++++++++++++++++++
 .../xinput-calibrator/xinput-calibrator_git.bb     |   30 +++++++++
 5 files changed, 122 insertions(+)
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
 create mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibrator/30xinput_calibrate.sh
 create mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibrator/Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch
 create mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb

-- 
1.7.9.5


