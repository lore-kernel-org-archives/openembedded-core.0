Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5489560034
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 00:36:17 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 18 Mar 2015 17:36:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,426,1422950400"; d="scan'208";a="542951789"
Received: from yctb03.ostc.intel.com (HELO yctb03.otcr.jf.intel.com)
	([10.23.219.52])
	by orsmga003.jf.intel.com with ESMTP; 18 Mar 2015 17:36:18 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Mar 2015 16:31:14 +0000
Message-Id: <cover.1426695976.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
MIME-Version: 1.0
Subject: [PATCH 0/2] init fixes
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
X-List-Received-Date: Thu, 19 Mar 2015 00:36:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The next changes fixes issues related to [YOCTO #5336]

The following changes since commit df0672b038e6942c97d266af9ca175a06f2b0423:

  bitbake: toaster: Fix the orderkey to match the column (2015-03-16 17:44:13 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib alimon/init_fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=alimon/init_fixes

Aníbal Limón (2):
  sysvinit-inittab: Fix no tty in runlevel 1.
  initscripts: Add changetodefaultvt for 2, 3, 4 runlevels

 .../initscripts/initscripts-1.0/changetodefaultvt.sh           | 10 ++++++++++
 meta/recipes-core/initscripts/initscripts_1.0.bb               |  3 +++
 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb         |  2 +-
 3 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-core/initscripts/initscripts-1.0/changetodefaultvt.sh

-- 
1.8.4.5


