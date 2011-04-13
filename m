Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <qing.he@intel.com>) id 1Q9wUo-0006DI-R7
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Apr 2011 11:36:23 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 13 Apr 2011 02:34:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,203,1301900400"; d="scan'208";a="732712305"
Received: from qhe2-db.sh.intel.com ([10.239.13.48])
	by orsmga001.jf.intel.com with ESMTP; 13 Apr 2011 02:34:06 -0700
Received: from qhe2 by qhe2-db.sh.intel.com with local (Exim 4.71)
	(envelope-from <qing.he@intel.com>)
	id 1Q9wLM-0004mZ-RT; Wed, 13 Apr 2011 17:26:36 +0800
Message-Id: <cover.1302686656.git.qing.he@intel.com>
Old-Date: Wed, 13 Apr 2011 17:24:16 +0800
Date: Wed, 13 Apr 2011 17:26:36 +0800
To: openembedded-core@lists.openembedded.org
From: Qing He <qing.he@intel.com>
Subject: [PATCH 0/2] bug fix for quilt and sat-solver
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
X-List-Received-Date: Wed, 13 Apr 2011 09:36:23 -0000

From: Qing He <qing.he@intel.com>

the quilt fix fixes [YOCTO #969]
the sat-solver fix is related to [YOCTO #970]

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: qhe/fix
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=qhe/fix

Thanks,
    Qing He <qing.he@intel.com>
---


Qing He (2):
  sat-solver: fix arch=all packages
  quilt: fix test for target build

 .../quilt/quilt/gnu_patch_test_fix_target.patch    |   66 ++++++++++++++++++++
 meta/recipes-devtools/quilt/quilt_0.48.bb          |    6 +-
 .../sat-solver/sat-solver/sat-solver_poky.patch    |   19 ++++++
 meta/recipes-extended/sat-solver/sat-solver_git.bb |    4 +-
 4 files changed, 91 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/quilt/quilt/gnu_patch_test_fix_target.patch



