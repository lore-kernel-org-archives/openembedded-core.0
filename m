Return-Path: <brian.avery@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9DCB46067C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 22:53:12 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 12 Jul 2016 15:53:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,354,1464678000"; d="scan'208";a="845145059"
Received: from bavery-ws-desk.jf.intel.com ([10.7.201.28])
	by orsmga003.jf.intel.com with ESMTP; 12 Jul 2016 15:53:12 -0700
From: bavery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2016 15:54:26 -0700
Message-Id: <cover.1468363460.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/2] toaster: Better SDK artifacts and fstypes V2
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
X-List-Received-Date: Tue, 12 Jul 2016 22:53:15 -0000

This is part of a patch set that is split over the openembedded-core and
bitbake-devel mailing lists.  This is a second version of the patch.

These patches remove complexity from the toaster.bbclass in order to move those
functions to bitbake/lib/toaster.

The overall intent of this set is to improve Toaster's ability to locate artifacts,
specify fstypes correctly, and add some tests for these changes.

-brian avery
an Intel employee


The following changes since commit 0659b4f780120b1459b068c85794be4f04f943bd:

  toaster: fix typo in arguments for libtoaster.js function (2016-07-12 14:12:16 -0700)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib bavery/submit/elliot/toaster/8556-image_fstypesV2_foroe
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=bavery/submit/elliot/toaster/8556-image_fstypesV2_foroe

Elliot Smith (2):
  toaster.bbclass: remove directory scan logic for detecting artifacts
  toaster.bbclass: only scan files-in-image.txt if it exists

 classes/toaster.bbclass | 99 ++++++++++++-------------------------------------
 1 file changed, 24 insertions(+), 75 deletions(-)

--
1.9.1

