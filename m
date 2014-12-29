Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 30CC67253D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Dec 2014 17:23:30 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 29 Dec 2014 09:23:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,691,1406617200"; d="scan'208";a="505352086"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.155])
	by orsmga003.jf.intel.com with ESMTP; 29 Dec 2014 09:18:23 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Dec 2014 11:24:03 -0600
Message-Id: <cover.1419873753.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/5] Package upgrades
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
X-List-Received-Date: Mon, 29 Dec 2014 17:23:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 6dde745bf90d9f9e52af3779df28879d91cbc64c:

  binutils: several security fixes (2014-12-27 22:53:40 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib alimon/package_upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=alimon/package_upgrades

Aníbal Limón (5):
  xrandr: Upgrade to 1.4.3
  acpid: Upgrade to 2.0.23
  lsof: Upgrade to 4.88
  mc: Upgrade to 4.8.13
  sqlite3: Upgrade to 3.8.7.4

 meta/recipes-bsp/acpid/{acpid_2.0.22.bb => acpid_2.0.23.bb}           | 4 ++--
 meta/recipes-extended/lsof/{lsof_4.87.bb => lsof_4.88.bb}             | 4 ++--
 meta/recipes-extended/mc/{mc_4.8.12.bb => mc_4.8.13.bb}               | 4 ++--
 meta/recipes-graphics/xorg-app/{xrandr_1.4.2.bb => xrandr_1.4.3.bb}   | 4 ++--
 .../recipes-support/sqlite/{sqlite3_3.8.6.0.bb => sqlite3_3.8.7.4.bb} | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-bsp/acpid/{acpid_2.0.22.bb => acpid_2.0.23.bb} (55%)
 rename meta/recipes-extended/lsof/{lsof_4.87.bb => lsof_4.88.bb} (91%)
 rename meta/recipes-extended/mc/{mc_4.8.12.bb => mc_4.8.13.bb} (93%)
 rename meta/recipes-graphics/xorg-app/{xrandr_1.4.2.bb => xrandr_1.4.3.bb} (72%)
 rename meta/recipes-support/sqlite/{sqlite3_3.8.6.0.bb => sqlite3_3.8.7.4.bb} (80%)

-- 
1.9.1


