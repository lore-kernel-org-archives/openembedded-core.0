Return-Path: <laurentiu.palcu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 4FC4C6D273
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 15:46:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 28 Oct 2013 08:46:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,586,1378882800"; d="scan'208";a="418567041"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by fmsmga001.fm.intel.com with ESMTP; 28 Oct 2013 08:46:40 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Oct 2013 17:46:29 +0200
Message-Id: <cover.1382975017.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] QT toolchain relocation fix
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
X-List-Received-Date: Mon, 28 Oct 2013 15:46:48 -0000

The following changes since commit 78b91ab23d9856525fc7ac1bb8da2975382813bf:

  pigz: bump to 2.3.1 (2013-10-26 16:08:41 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/b5339_qt_toolchain_issue
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/b5339_qt_toolchain_issue

Laurentiu Palcu (2):
  nativesdk-qt4-tools: create qt.conf file
  meta-toolchain-qt: put QT_CONF_PATH in environment script

 meta/recipes-qt/meta/meta-toolchain-qt.inc  |    1 +
 meta/recipes-qt/qt4/nativesdk-qt4-tools.inc |    6 ++++++
 2 files changed, 7 insertions(+)

-- 
1.7.9.5


