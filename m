Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RnWSi-000487-UN
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2012 15:26:05 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 Jan 2012 06:18:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="97839514"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by orsmga001.jf.intel.com with ESMTP; 18 Jan 2012 06:18:25 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org,
	dvhart@linux.intel.com
Date: Wed, 18 Jan 2012 22:18:20 +0800
Message-Id: <cover.1326894448.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [RFC PATCH 0/1] [RFC][PATCH][v2] enhance boot-directdisk.bbclass to generate .vmdk image
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jan 2012 14:26:05 -0000

Please review the following changes for suitability for inclusion. If you have
any objections or suggestions for improvement, please respond to the patches. If
you agree with the changes, please provide your Acked-by.

The following changes since commit 468998cddbe1a803096c9b357e1b5daa3b7e8c2e:

  command.py: add parseConfigurationFiles API (2012-01-06 16:01:44 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/self-hosted-v7
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/self-hosted-v7

Dexuan Cui (1):
  self-hosted-image: generate the .hdddirect and .vmdk image files

 meta/classes/boot-directdisk.bbclass          |    8 ++++++++
 meta/conf/machine/include/qemu.inc            |    2 ++
 meta/recipes-core/images/self-hosted-image.bb |   11 +++++++++--
 3 files changed, 19 insertions(+), 2 deletions(-)

-- 
1.7.6



