Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0232170373
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 15:36:53 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 07 Jul 2014 08:36:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,618,1400050800"; d="scan'208";a="558373861"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 07 Jul 2014 08:36:35 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jul 2014 18:36:26 +0300
Message-Id: <cover.1404747336.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/2] Ofono and BlueZ5 upgrades
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
X-List-Received-Date: Mon, 07 Jul 2014 15:36:54 -0000

The following changes since commit a5531a2b8983318b99c119a87b78a92cf84160b8:

  bitbake: fetch2/svn: Add transportuser parameter (2014-07-04 09:28:36 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/PUs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/PUs

Cristian Iorga (2):
  bluez5: upgrade to 5.21
  ofono: upgrade to 1.15

 meta/recipes-connectivity/bluez5/bluez5_5.20.bb                  | 3 ---
 meta/recipes-connectivity/bluez5/bluez5_5.21.bb                  | 3 +++
 meta/recipes-connectivity/ofono/{ofono_1.14.bb => ofono_1.15.bb} | 6 ++----
 3 files changed, 5 insertions(+), 7 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.20.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.21.bb
 rename meta/recipes-connectivity/ofono/{ofono_1.14.bb => ofono_1.15.bb} (50%)

-- 
1.9.1


