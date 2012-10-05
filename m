Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1TKHZU-0007pD-9y
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Oct 2012 01:44:44 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Oct 2012 16:31:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,541,1344236400"; d="scan'208";a="221341967"
Received: from fear.jf.intel.com (HELO rage.local) ([10.7.201.160])
	by orsmga002.jf.intel.com with ESMTP; 05 Oct 2012 16:31:39 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: Poky <poky@yoctoproject.org>,
	openembedded-core@lists.openembedded.org
Date: Fri,  5 Oct 2012 16:31:35 -0700
Message-Id: <cover.1349479383.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/2] Update poky-tiny to linux-yocto-tiny_3.4 for qemux86
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Oct 2012 23:44:44 -0000

As these patches are dependent on eachother, sending to both poky and oe-core
lists. Flame away.

The refresh to 3.4 for tiny is coming in rather late as I was focused on other
BSPs. However, qemux86 has been at 3.4 for poky and linux-yocto for a while now.
This update effectively uses a subset of that tested config for the images built
with poky-tiny. This only impacts qemux86 on poky-tiny.  That configuration
builds and boots to the serial console.

NOTE: This kernel recipe is pending a minor meta-data change to the
linux-yocto_3.4 git repository which will require a SRCREV_meta update. That
update can be made to only the linux-yocto-tiny_3.4 recipe in order to minimize
risk to the rest of the system. However, please do not commit this until the
meta-data patch goes in. At that point I will update the branch with the new
SRCREV and notify the list in response to this email.

The following changes since commit 415be864abdbd6f86e554aba684f5d7a9499e2e7:

  sstate: Add extra entries to the sstate duplicate files whitelist (2012-10-05 16:18:26 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib dvhart/1.3/tiny
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=dvhart/1.3/tiny

Darren Hart (2):
  linux-yocto-tiny: Add tiny recipe for the 3.4 linux-yocto kernel
  poky-tiny: Update the default kernel to linux-yocto-tiny_3.4

 meta-yocto/conf/distro/poky-tiny.conf             |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |   26 +++++++++++++++++++++
 2 files changed, 27 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb

-- 
1.7.5.4



