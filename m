Return-Path: <laurentiu.palcu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 585E06EF9B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 20:14:21 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 14 Feb 2014 12:14:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,846,1384329600"; d="scan'208";a="475432259"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by fmsmga001.fm.intel.com with ESMTP; 14 Feb 2014 12:14:20 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Feb 2014 22:14:17 +0200
Message-Id: <cover.1392408543.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] package_manager.py: move multilib prefix list computation function to RpmIndexer
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
X-List-Received-Date: Fri, 14 Feb 2014 20:14:22 -0000

I tested this with the following:

rm -rf tmp/ && bb core-image-sato && bb -c populate_sdk core-image-sato &&
bb lib32-core-image-minimal && rm -rf tmp/ && bb lib32-core-image-minimal

laurentiu

The following changes since commit b38c7cb7a6ab787d7be2b2c295ba58a98a954cd5:

  socat: upgrade to 1.7.2.3 (2014-02-14 12:31:10 +0000)

are available in the git repository at:

  git://mirror.rb.intel.com/git.yoctoproject.org/poky-contrib lpalcu/rpm_ml_build_fix

for you to fetch changes up to 4e62efc1659a4be94b6437049a771ec444515600:

  package_manager.py: move multilib prefix list computation function to RpmIndexer (2014-02-14 20:59:17 +0200)

----------------------------------------------------------------
Laurentiu Palcu (1):
      package_manager.py: move multilib prefix list computation function to RpmIndexer

 meta/lib/oe/package_manager.py |  105 ++++++++++++++++++++--------------------
 1 file changed, 53 insertions(+), 52 deletions(-)

Laurentiu Palcu (1):
  package_manager.py: move multilib prefix list computation function to
    RpmIndexer

 meta/lib/oe/package_manager.py |  105 ++++++++++++++++++++--------------------
 1 file changed, 53 insertions(+), 52 deletions(-)

-- 
1.7.9.5


