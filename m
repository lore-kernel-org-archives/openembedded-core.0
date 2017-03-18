Return-Path: <brian.avery@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 81A3D73068
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Mar 2017 15:06:37 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP; 18 Mar 2017 08:06:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,183,1486454400"; d="scan'208";a="945766134"
Received: from bavery-ws-desk.jf.intel.com ([10.7.198.85])
	by orsmga003.jf.intel.com with ESMTP; 18 Mar 2017 08:06:39 -0700
From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Mar 2017 08:08:46 -0700
Message-Id: <cover.1489849643.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/2] testsdk: use cpio instead of cvs as test
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
X-List-Received-Date: Sat, 18 Mar 2017 15:06:38 -0000

We were using cvs as our sdk test by running configure,make, and install using the sdk.  Unfortunately, cvs requires vi and we were therefore requiring vi as one of our HOSTTOOLS. Since this is a choice among many for editors, it makes for a fragile requirement. Furthermore, a build container would typically not have an editor in it but should still be able to build and test images.  This patch switches cpio (also autotools based and so checks the same steps) for cvs, thus dropping the vi requirement.

-brian

The following changes since commit 7e0985bab68547f946163828a16beab7542fca2e:

  nativesdk-packagegroup-sdk-host.bb: add cmake (2017-03-17 16:53:06 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib bavery/changeCVSTestToCpioTest
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=bavery/changeCVSTestToCpioTest

brian avery (2):
  meta/lib/oeqa: change sdk test from cvs to cpio
  bitbake.conf: remove vi from HOSTTOOLS list

 meta/classes/testimage.bbclass                            | 6 +++---
 meta/conf/bitbake.conf                                    | 2 +-
 meta/lib/oeqa/runtime/cases/{buildcvs.py => buildcpio.py} | 8 ++++----
 meta/lib/oeqa/sdk/cases/{buildcvs.py => buildcpio.py}     | 8 ++++----
 4 files changed, 12 insertions(+), 12 deletions(-)
 rename meta/lib/oeqa/runtime/cases/{buildcvs.py => buildcpio.py} (83%)
 rename meta/lib/oeqa/sdk/cases/{buildcvs.py => buildcpio.py} (80%)

--
1.9.1

