Return-Path: <nitin.a.kamble@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AEBB670281
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 18:45:12 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Aug 2014 11:38:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,418,1406617200"; d="scan'208";a="594717999"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by orsmga002.jf.intel.com with ESMTP; 28 Aug 2014 11:44:52 -0700
From: nitin.a.kamble@intel.com
To: darren.hart@intel.com, richard.purdie@linuxfoundation.org,
	saul.wold@intel.com, Openembedded-core@lists.openembedded.org
Date: Thu, 28 Aug 2014 11:47:05 -0700
Message-Id: <cover.1409251282.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 0/1] A tool for boottime image configuration
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
X-List-Received-Date: Thu, 28 Aug 2014 18:45:15 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This pull request provides the base recipe for the Image Configurator tool,
which provides ability to configure the BSP images for a particular hardware
at boot time.

  The recipe needs machine configuration files, which are to be provided in
the individual BSP layers. The meta-intel layer will be using this recipe to
support multiple machines with common BSPs. There is nothing architecture
specific here, and it can also be used by any other layer to consolidate
multiple BSPs.

Thanks,
Nitin

The following changes since commit 669c07d6022174d01fe5a95b7b0faa9ef86da1e2:

  bitbake: build/data: Write out more complete python run files (2014-08-28 15:12:45 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib nitin/misc
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (1):
  imageconfigurator: a new recipe for boottime image configuration

 .../imageconfigurator/imageconfigurator_git.bb     | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 meta/recipes-bsp/imageconfigurator/imageconfigurator_git.bb

-- 
1.8.1.4


