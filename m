Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C184F73163
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 04:44:41 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 08 May 2016 21:44:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,599,1455004800"; d="scan'208";a="99608785"
Received: from hschan-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.140.99])
	by fmsmga004.fm.intel.com with ESMTP; 08 May 2016 21:44:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 May 2016 16:43:26 +1200
Message-Id: <cover.1462768634.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Tom Zanussi <tom.zanussi@intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [RFC PATCH 0/6] Kernel configuration check for recipes
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
X-List-Received-Date: Mon, 09 May 2016 04:44:45 -0000

Add the capability for other recipes to verify that kernel
configuration options they depend upon at runtime are present, and warn
if they are missing. This seems functional enough to me but is still in
RFC - please let me know if it looks OK to you or I've missed anything
(no doubt there are recipes we could add the checks to, I refer mainly
to the mechanism itself).


Please review the following changes for suitability for inclusion. If you have
any objections or suggestions for improvement, please respond to the patches. If
you agree with the changes, please provide your Acked-by.

The following changes since commit ece101be5158beee709cdfbb85ecdbdc8d9fb864:

  test-empty-image: Fix LIC_FILES_CHKSUM typo (2016-05-06 10:47:59 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/kernel-check
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/kernel-check

Paul Eggleton (6):
  classes/kernel-check: add a class to check kernel config options
  eudev: check for required kernel config options
  systemd: check for required kernel config options
  classes/kernel: fix typo
  classes/kernel: check OLDEST_KERNEL at configure time
  classes/image: check kernel config supports IMAGE_FSTYPES items

 meta/classes/image.bbclass               | 23 ++++++++
 meta/classes/image_types.bbclass         | 11 ++++
 meta/classes/kernel-check.bbclass        | 97 ++++++++++++++++++++++++++++++++
 meta/classes/kernel.bbclass              | 16 +++++-
 meta/recipes-core/systemd/systemd_229.bb | 19 ++++++-
 meta/recipes-core/udev/eudev_3.1.5.bb    | 22 +++++++-
 6 files changed, 185 insertions(+), 3 deletions(-)
 create mode 100644 meta/classes/kernel-check.bbclass

-- 
2.5.5


