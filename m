Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2F11765D9C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Apr 2014 12:42:11 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 30 Apr 2014 05:32:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,958,1389772800"; d="scan'208";a="531267754"
Received: from cgwithan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.50])
	by fmsmga002.fm.intel.com with ESMTP; 30 Apr 2014 05:32:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Apr 2014 13:31:56 +0100
Message-Id: <cover.1398861075.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH 0/8] Automated hardware testing improvements
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
X-List-Received-Date: Wed, 30 Apr 2014 12:42:11 -0000

These add functionality required to deploy images and run tests on a
wider range of real hardware, as well as improving robustness in a
couple of areas.

A related patchset to add testing for two of the Yocto Project reference
platforms (beaglebone and edgerouter) will be sent for meta-yocto-bsp.


The following changes since commit 1e1b42f687b5cd34623fe2682218958e1947eb92:

  feature-arm-thumb.inc: set ARMPKGSFX_THUMB only when thumb is in TUNE_FEATURES (2014-04-29 23:35:53 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/testimage-hw
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/testimage-hw

Paul Eggleton (5):
  oeqa/controllers/masterimage: more robust master image startup
  classes/testimage: if start fails, don't try to stop
  scripts/contrib/serdevtry: add script to handle transient serial
    terminals
  scripts/contrib/dialog-power-control: add a trivial power prompt
    script
  oeqa: add proper handling for command errors where needed

Stefan Stanacar (3):
  oeqa/controllers/masterimage: add a base class for hw targets
  oeqa/targetcontrol: restart method shouldn't be abstract
  oeqa/controllers/masterimage: add a serial control command

 meta/classes/testimage.bbclass           |   2 +-
 meta/lib/oeqa/controllers/masterimage.py | 171 +++++++++++++++++++++----------
 meta/lib/oeqa/targetcontrol.py           |   8 +-
 meta/lib/oeqa/utils/__init__.py          |  12 +++
 meta/lib/oeqa/utils/commands.py          |  10 +-
 scripts/contrib/dialog-power-control     |  53 ++++++++++
 scripts/contrib/serdevtry                |  60 +++++++++++
 7 files changed, 254 insertions(+), 62 deletions(-)
 create mode 100755 scripts/contrib/dialog-power-control
 create mode 100755 scripts/contrib/serdevtry

-- 
1.9.0


