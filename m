Return-Path: <laurentiu.palcu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 648CF610FF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 09:31:50 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 23 Sep 2013 02:31:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,961,1371106800"; d="scan'208";a="399635786"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 23 Sep 2013 02:31:48 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2013 12:31:44 +0300
Message-Id: <cover.1379928510.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] package_deb, apt.conf: fix apt failure in do_rootfs()
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
X-List-Received-Date: Mon, 23 Sep 2013 09:31:50 -0000

Tested by building and booting a core-image-minimal and a core-image-sato using
deb as package manager.

Thanks,
Laurentiu

The following changes since commit bf6b0d95db3863a2cfbccb154c0c7ad5b3bbf0b0:

  glib-2.0: fix broken python script header on machines using buildtools (2013-09-22 12:23:35 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/b5241_package_deb_fails
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/b5241_package_deb_fails

Laurentiu Palcu (1):
  package_deb, apt.conf: fix apt failure in do_rootfs()

 meta/classes/package_deb.bbclass         |    1 +
 meta/recipes-devtools/apt/files/apt.conf |    2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
1.7.9.5


