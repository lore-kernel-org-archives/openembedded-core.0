Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 02B7E71A92
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2017 15:42:28 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP; 17 Jan 2017 07:42:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,245,1477983600"; d="scan'208";a="49719728"
Received: from yocto-ab04.ostc.intel.com ([10.54.69.51])
	by orsmga004.jf.intel.com with ESMTP; 17 Jan 2017 07:42:23 -0800
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2017 07:42:08 -0800
Message-Id: <cover.1484667160.git.jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 0/3] distutils3: add egg files to path
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
X-List-Received-Date: Tue, 17 Jan 2017 15:42:30 -0000

Packages that use egg files or directories for installation may
not be found when imported at the python3 interpreter.
egg files/directories path must be included in a pth file to
be appropriately included in python path.

These changes handle the egg files from the distutils3 class to avoid
the need to perform it individually at each recipe.

[YOCTO #8673]

The following changes since commit 63f899a950daf1018999455bafa7a2be8b22f164:

  bitbake: toaster: bin/toaster whitelist TOASTER_DIR (2017-01-17 13:18:47 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lamego/bug8673
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lamego/bug8673

Jose Lamego (3):
  distutils3.bbclass: add egg files/directories to python path
  python3-pip: Remove pth file creation at recipe level
  python3-setuptools: Remove pth file creation at recipe level

 meta/classes/distutils3.bbclass                           | 10 ++++++++++
 meta/recipes-devtools/python/python3-pip_9.0.1.bb         |  3 ---
 meta/recipes-devtools/python/python3-setuptools_31.0.0.bb |  3 ---
 3 files changed, 10 insertions(+), 6 deletions(-)

-- 
1.8.3.1


