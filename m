Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1TyG2K-0003tn-U4
	for Openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 07:11:48 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Jan 2013 21:55:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,527,1355126400"; d="scan'208";a="251573110"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by orsmga001.jf.intel.com with ESMTP; 23 Jan 2013 21:56:10 -0800
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org, meta-intel@yoctoproject.org,
	richard.purdie@linuxfoundation.org
Date: Wed, 23 Jan 2013 21:55:50 -0800
Message-Id: <cover.1359005591.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [RFC 0/3] infrastructure changes in oecore hw codecs
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
X-List-Received-Date: Thu, 24 Jan 2013 06:11:48 -0000
X-List-Received-Date: Thu, 24 Jan 2013 06:11:48 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Here are commits for getting feedback from the community on the work
happening in the oecore for supporting hwcodecs for H/W BSPs properly.
  The current requirements: we need a mechanism to 
1. Add accelerated codecs to the images
2. Exclude the X based codecs automatically for images not including
   the Xserver
3. Need a simple config mechanism to exclude all the accelerated
   codecs for any image of a BSP

The current mechanism available in the meta-intel BSP configs is failing
to fulfill the 2nd requirement above. And I could not find any
meta-intel specific solution to achieve it.

Richard and I discussed this matter and came up with the solution
included in these commits. These commits will lead to BSP config
changes similar to this commit:
  http://git.yoctoproject.org/cgit.cgi/meta-intel-contrib/commit/?h=nitin/hwcodec

This work is not final, and also not properly tested yet, but this
email is written with the intention of sharing the proposed
infrastructure changes in oecore layer to the community before
they solidify.

Thanks,
Nitin

The following changes since commit 8d6e55bf2192524bda84138b5356a2791adbbe61:

  prserv: add LOCALCOUNT to AUTOINCs migration feature (2013-01-22 16:01:32 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/misc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Richard Purdie (3):
  packagegroup-core-x11-xserver: Add XSERVERCODECS variable
  core-image-lsb-sdk/dev: Inherit the base image instead of duplicating
  core-image: Add hwcodecs IMAGE_FEATURE

 meta/classes/core-image.bbclass                    |    4 ++++
 meta/recipes-extended/images/core-image-lsb-dev.bb |   12 +++---------
 meta/recipes-extended/images/core-image-lsb-sdk.bb |   14 ++++----------
 meta/recipes-extended/images/core-image-lsb.bb     |    2 +-
 .../packagegroups/packagegroup-core-x11-xserver.bb |    2 ++
 meta/recipes-sato/images/core-image-sato.bb        |    2 +-
 6 files changed, 15 insertions(+), 21 deletions(-)

-- 
1.7.3.4



