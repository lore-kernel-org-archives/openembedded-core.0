Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DEAD461EEB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 14:13:53 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Jul 2013 07:13:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,719,1367996400"; d="scan'208";a="374133977"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2013 07:13:53 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jul 2013 17:13:52 +0300
Message-Id: <cover.1374502165.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1373630218.git.laurentiu.palcu@intel.com>
References: <cover.1373630218.git.laurentiu.palcu@intel.com>
Subject: [PATCH v4 0/1] xinput-calibrator: move it from meta-oe to oe-core (cover letter only)
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
X-List-Received-Date: Mon, 22 Jul 2013 14:13:54 -0000

Changes in v4:
 * restore original PR for both recipes;

Changes in v3:
 * do not install pointercal.xinput if it's the default one;

Changes in v2:
 * run calibration through xsession file;
 * allow normal user to write his calibration data to ~/.pointercal/pointercal.xinput
   and then use it when system boots;

Laurentiu

The following changes since commit 31e6eee860b5f9f4ac9ef0889bcff5648de6e3f9:

  poky-tiny.conf: blacklist core-image-weston option (2013-07-18 21:26:58 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/xinput-calibrator_oe-core_v4
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/xinput-calibrator_oe-core_v4

Laurentiu Palcu (1):
  xinput-calibrator: move it from meta-oe to oe-core

 .../pointercal-xinput/pointercal.xinput            |    1 +
 .../xinput-calibrator/pointercal-xinput_0.0.bb     |   20 ++++++
 .../xinput-calibrator/30xinput_calibrate.sh        |    7 +++
 ...t_calibrator_pointercal.sh-to-be-run-as-n.patch |   66 ++++++++++++++++++++
 .../xinput-calibrator/xinput-calibrator_git.bb     |   31 +++++++++
 5 files changed, 125 insertions(+)
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
 create mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibrator/30xinput_calibrate.sh
 create mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibrator/Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch
 create mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb

-- 
1.7.9.5


