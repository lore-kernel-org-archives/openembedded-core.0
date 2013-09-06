Return-Path: <mihai.prica@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 40D7A6BF5C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 14:50:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Sep 2013 07:50:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,854,1371106800"; d="scan'208";a="397701789"
Received: from unknown (HELO mihai-Vostro-460.rb.intel.com) ([10.237.105.155])
	by fmsmga002.fm.intel.com with ESMTP; 06 Sep 2013 07:50:20 -0700
From: Mihai Prica <mihai.prica@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Sep 2013 17:48:59 +0300
Message-Id: <cover.1378477619.git.mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] Bluez5 fixes
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
X-List-Received-Date: Fri, 06 Sep 2013 14:50:44 -0000

The following changes since commit c7994f83baa678a4670472e1f037bfc16cb1e3be:

  bitbake: runqueue: Fix scenequeue to pass file descriptors, not a float (2013-09-02 09:16:24 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mihaip/bluez5
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mihaip/bluez5

Mihai Prica (2):
  bluez5: Install the bluetooth library
  bluez5: Rename tests package to testtools

 meta/recipes-connectivity/bluez5/bluez5.inc |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
1.7.9.5


