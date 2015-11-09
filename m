Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 97DFA766EB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 22:15:49 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 09 Nov 2015 14:15:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,267,1444719600"; d="scan'208";a="597159041"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Nov 2015 14:15:50 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Nov 2015 14:04:37 +0000
Message-Id: <cover.1447077439.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Cc: paul.eggleton@linux.intel.com
Subject: [PATCHv2 0/6] Create image manifest
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
X-List-Received-Date: Mon, 09 Nov 2015 22:15:52 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

When building the rootfs the rootfs is created but the recipes
that deployed files in the image doesn't show up. Usually these
recipes include the bootloaders and the kernel.

With these patches a new manifest will be created that includes
the deployed recipes that were in the deployed. The format of the
manifest is different because the recipes doesn't install packages,
instead the recipes deploy files into the image

[YOCTO #6772]

Changes in v2:
- Correct a typo in title of the last commit

The following changes since commit fc45deac89ef63ca1c44e763c38ced7dfd72cbe1:

  build-appliance-image: Update to jethro head revision (2015-11-03 14:03:03 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug6772
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug6772

Mariano Lopez (6):
  license.bbclass: Split license create manifest
  license.bbclass: Added get_boot_dependencies function
  license.bbclass: Added function get_deployed_dependencies
  license.bbclass: Added get_package_from_deployed
  license.bbclass: Add function get_deployed_files
  license.bbclass: Create image license manifest

 meta/classes/license.bbclass | 219 +++++++++++++++++++++++++++++++++++++++----
 1 file changed, 200 insertions(+), 19 deletions(-)

-- 
1.8.4.5


