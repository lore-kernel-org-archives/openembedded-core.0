Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 5C4D7719EF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 18:31:45 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga104.fm.intel.com with ESMTP; 14 Oct 2016 11:31:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,346,1473145200"; d="scan'208";a="19684155"
Received: from shealy-mobl4.ger.corp.intel.com (HELO
	heimdall.ger.corp.intel.com) ([10.252.27.118])
	by fmsmga005.fm.intel.com with ESMTP; 14 Oct 2016 11:31:46 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Oct 2016 21:31:39 +0300
Message-Id: <cover.1476469708.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH 0/2] Re-add piglit to sdk images
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
X-List-Received-Date: Fri, 14 Oct 2016 18:31:46 -0000

Piglit was removed because the current version was making sdk
images too large. This patchset reduces the installed size by 1.5GB
and adds piglit back to core-tools-testapps.

Running piglit still requires the same amount of space so in practice
this is useful for installed images only.

Q: Do I need to declare a runtime dependency that typically comes
from busybox (tar)?

Thanks,
 Jussi
 

The following changes since commit 371ab635086e2878ada1f00a59c7ec826481ba0a:

  build-appliance-image: Update to master head revision (2016-10-11 23:43:28 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/piglit-compress-tests
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/piglit-compress-tests

Jussi Kukkonen (2):
  piglit: Package tests in compressed form as well
  core-tools-testapps: Re-add piglit

 .../packagegroup-core-tools-testapps.bb              |  2 ++
 meta/recipes-graphics/piglit/piglit/piglit.sh        | 20 ++++++++++++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb           | 20 +++++++++++++++++++-
 3 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/piglit/piglit/piglit.sh

-- 
2.9.3


