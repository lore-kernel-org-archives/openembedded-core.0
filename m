Return-Path: <juro.bystricky@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 9FBEF65CBC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 22:15:17 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 28 Mar 2016 15:15:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,408,1455004800"; d="scan'208";a="943231161"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga002.jf.intel.com with ESMTP; 28 Mar 2016 15:15:18 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Mar 2016 15:01:23 -0700
Message-Id: <1459202484-4746-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: jurobystricky@hotmail.com
Subject: [PATCH 0/1] Build Appliance modifications
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
X-List-Received-Date: Mon, 28 Mar 2016 22:15:18 -0000

This patch fixes the Build Appliance problem
https://bugzilla.yoctoproject.org/show_bug.cgi?id=9314

The patch explicitly sets permissions in the directory 'poky', not assuming 
correct permissions when copying the directory from the host machine 
to the Build Appliance image. 

There are some additional minor tweaks, these are non-functional. 
The file .bashrc contains (commented out) two samples of how to 
setup proxy in conjunction with "oe-git-proxy".
A new environmental variable BA_SRCREV contains SRCREV that
was actually used to build the Build Appliance image. Without this, there is
no simple way to distinguish between the contents of various Build Appliance
images.

The SRCREV is bumped to a later master just so the Hob removal
patches and builder changes make it into the image. 
(This is provisional, final SRCREV will correspond to release commit number)


Juro Bystricky (1):
  build-appliance-image: Fix permissions

 .../images/build-appliance-image_14.0.0.bb          | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

-- 
1.9.1


