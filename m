Return-Path: <laurentiu.palcu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id F1F4C610DC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 09:32:45 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 25 Sep 2013 02:32:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,977,1371106800"; d="scan'208";a="299122954"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 25 Sep 2013 02:32:36 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Sep 2013 12:32:32 +0300
Message-Id: <cover.1380101457.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] relocate_sdk.py: make it work also with python 3
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
X-List-Received-Date: Wed, 25 Sep 2013 09:32:48 -0000

Tests done:
 * installed meta-toolchain using both python 2.7 and 3.2;
 * compiled iptables with the installed toolchain;

Thanks,
Laurentiu

The following changes since commit 4d8ab87d25ea6e59dc88375813ef88ee0ac813d0:

  build-appliance: Update SRCREV (2013-09-24 18:09:12 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/b4866_sdk_relocate_script_fail_python3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/b4866_sdk_relocate_script_fail_python3

Laurentiu Palcu (1):
  relocate_sdk.py: make it work also with python 3

 scripts/relocate_sdk.py |   54 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 19 deletions(-)

-- 
1.7.9.5


