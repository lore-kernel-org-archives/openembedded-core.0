Return-Path: <laurentiu.palcu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id A540460897
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 07:39:04 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 21 May 2013 00:39:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,713,1363158000"; d="scan'208";a="244495370"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 21 May 2013 00:38:49 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2013 10:38:39 +0300
Message-Id: <cover.1369121729.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2 0/1] runqemu: fix networking issues
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
X-List-Received-Date: Tue, 21 May 2013 07:39:04 -0000

Additional changes in v2:
 * Use 'ip route' instead of 'route';

Thanks,
Laurentiu

The following changes since commit 6271ac326d08fb3e9b4c2008b796233ee11a83e4:

  zlib: put shared libraries in base_libdir (2013-05-21 00:18:46 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/runqemu_fix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/runqemu_fix

Laurentiu Palcu (1):
  runqemu: fix networking issues

 scripts/runqemu-ifup |   15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

-- 
1.7.9.5


