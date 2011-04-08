Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q8EcB-0006Ba-Cu
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Apr 2011 18:32:55 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 08 Apr 2011 09:30:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,324,1299484800"; d="scan'208";a="625616019"
Received: from unknown (HELO localhost) ([10.255.13.36])
	by orsmga002.jf.intel.com with ESMTP; 08 Apr 2011 09:30:45 -0700
Message-Id: <cover.1302279301.git.sgw@linux.intel.com>
Old-Date: Fri, 8 Apr 2011 09:15:01 -0700
Date: Fri, 08 Apr 2011  9:30:44 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 0/2] fix MACHINE_ARCH issue in keymaps
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
X-List-Received-Date: Fri, 08 Apr 2011 16:32:55 -0000

From: Saul Wold <sgw@linux.intel.com>

This fixes a build failure on the autobuilder


Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: oe-work
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=oe-work

Thanks,
    Saul Wold <sgw@linux.intel.com>
---


Saul Wold (2):
  keymaps: Fix MACHINE -> MACHINE_ARCH
  bitbake.conf: fix PACKAGE_ARCH[vardepsexclude]

 meta/conf/bitbake.conf                  |    6 +++---
 meta/recipes-bsp/keymaps/keymaps_1.0.bb |    4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)



