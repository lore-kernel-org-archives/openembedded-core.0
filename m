Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6E0966010B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 22:36:50 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 19 Nov 2015 14:36:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,319,1444719600"; d="scan'208";a="855244885"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by fmsmga002.fm.intel.com with ESMTP; 19 Nov 2015 14:36:50 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Nov 2015 14:25:13 +0000
Message-Id: <cover.1447942163.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Cc: paul.eggleton@linux.intel.com
Subject: [PATCHv3 0/6] Create image manifest
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
X-List-Received-Date: Thu, 19 Nov 2015 22:36:50 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

When building the rootfs the rootfs is created but the recipes
that deployed files in the image doesn't show up. Usually these
recipes include the bootloaders and the kernel.

With these patches a new manifest will be created that includes
the deployed recipes that were in the deployed. The format of the
manifest is different because the recipes doesn't install packages,
instead the recipes deploy files into the image

[YOCTO #6772]


Changes in v3:
- Create recipinfo file in every license folder to have the required
  information for the manifest file without using PKGDATA

The following changes since commit 1b25a70991589ed1f123015c16ee4806c46e3199:

  yocto-project-qs, ref-manual, poky.ent: CentOS Package updates (2015-11-18 16:42:22 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug6772v3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug6772v3

Mariano Lopez (6):
  license.bbclass: Write recipeinfo file in license folder
  license.bbclass: Split license create manifest
  license.bbclass: Added get_boot_dependencies function
  license.bbclass: Added function get_deployed_dependencies
  license.bbclass: Add function get_deployed_files
  license.bbclass: Create image license manifest

 meta/classes/license.bbclass | 207 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 182 insertions(+), 25 deletions(-)

-- 
1.8.4.5


