Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1PvNhm-0006Dc-Su
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 06:37:35 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 Mar 2011 21:34:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,262,1297065600"; d="scan'208";a="397402569"
Received: from unknown (HELO localhost) ([10.255.12.133])
	by azsmga001.ch.intel.com with ESMTP; 03 Mar 2011 21:34:27 -0800
Message-Id: <cover.1299216097.git.dvhart@linux.intel.com>
Old-Date: Thu, 3 Mar 2011 21:21:37 -0800
Date: Thu, 03 Mar 2011 21:34:27 -0800
To: openembedded-core@lists.openembedded.org
From: Darren Hart <dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 0/2] Fix for building kernel modules outside of virtual/kernel recipe
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
X-List-Received-Date: Fri, 04 Mar 2011 05:37:35 -0000

From: Darren Hart <dvhart@linux.intel.com>

The following patches provide a mechanism to address [BUGID #241]

http://bugzilla.pokylinux.org/show_bug.cgi?id=241

through an addition to module.bbclass which builds the hostprogs. The second
patch adds an example kernel module.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: dvhart/modules
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/modules

Thanks,
    Darren Hart <dvhart@linux.intel.com>
---


Darren Hart (2):
  module: build hostprogs for each module
  hello-mod: add a module for testing module.bbclass

 meta/classes/module.bbclass                    |   12 +-
 meta/recipes-kernel/hello-mod/files/COPYING    |  340 ++++++++++++++++++++++++
 meta/recipes-kernel/hello-mod/files/Makefile   |   14 +
 meta/recipes-kernel/hello-mod/files/hello.c    |   33 +++
 meta/recipes-kernel/hello-mod/hello-mod_0.1.bb |   15 +
 5 files changed, 413 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-kernel/hello-mod/files/COPYING
 create mode 100644 meta/recipes-kernel/hello-mod/files/Makefile
 create mode 100644 meta/recipes-kernel/hello-mod/files/hello.c
 create mode 100644 meta/recipes-kernel/hello-mod/hello-mod_0.1.bb



