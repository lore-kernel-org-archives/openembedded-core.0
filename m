Return-Path: <laurentiu.palcu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C2FF96D2E3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 20:47:10 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Oct 2013 13:47:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,588,1378882800"; d="scan'208";a="424167984"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by fmsmga002.fm.intel.com with ESMTP; 28 Oct 2013 13:46:24 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Oct 2013 22:46:19 +0200
Message-Id: <cover.1382992874.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2 0/2] QT toolchain relocation fix
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
X-List-Received-Date: Mon, 28 Oct 2013 20:47:11 -0000

v2:
 * the exported QT_CONF_PATH was missing qt.conf at the end. I had it right in
   my test directory but forgot to fix it in tree;

Thanks,
Laurentiu

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


