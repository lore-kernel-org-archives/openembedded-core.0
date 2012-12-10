Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Ti690-0001QH-R6
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Dec 2012 17:23:53 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 Dec 2012 08:08:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,252,1355126400"; d="scan'208";a="231728642"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 10 Dec 2012 08:09:18 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Dec 2012 18:09:05 +0200
Message-Id: <cover.1355154246.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] Postinstall fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Dec 2012 16:24:14 -0000
X-List-Received-Date: Mon, 10 Dec 2012 16:24:14 -0000

Hi,

This patchset contains two fixes:
* when generating the SDK target sysroot, postinstall scriptlets could
  not benefit of the latest postinstall improvements because NATIVE_ROOT and
  INTERCEPT_DIR were not exported in populate_sdk_(deb|ipk|rpm).bbclass.
* gdk-pixbuf-query-loaders always returns 0 and the exit condition was not effective.
  Without this change the SDK builds failed because sed -i created some temporary
  files that could not be tarred and tar_sdk function failed;

Thanks,
Laurentiu

The following changes since commit c607095894cab60493ddfc4b967b0325e1c313b4:

  bitbake: Revert "BBHandler: Ensure parser state engine is correctly reset for new parsing" (2012-12-07 18:09:01 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/postinst
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/postinst

Laurentiu Palcu (2):
  populate_sdk_(deb|ipk|rpm): export NATIVE_ROOT and INTERCEPT_DIR
    variables
  gdk-pixbuf: handle postinstall errors differently

 meta/classes/populate_sdk_deb.bbclass              |    2 ++
 meta/classes/populate_sdk_ipk.bbclass              |    2 ++
 meta/classes/populate_sdk_rpm.bbclass              |    2 ++
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb |   20 +++++++++++++++++---
 4 files changed, 23 insertions(+), 3 deletions(-)

-- 
1.7.9.5



