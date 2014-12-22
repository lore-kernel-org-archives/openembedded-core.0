Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B0B6E7274C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 23:30:19 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 22 Dec 2014 15:27:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,627,1413270000"; d="scan'208";a="627935329"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.60])
	by orsmga001.jf.intel.com with ESMTP; 22 Dec 2014 15:30:19 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Dec 2014 17:30:44 -0600
Message-Id: <cover.1419290780.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] License class fixes
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
X-List-Received-Date: Mon, 22 Dec 2014 23:30:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The next couple of patches fixes next issues,

[YOCTO #6757] license.manifest shows LICENSE field differently to recipe 
[YOCTO #6758] Show warning/error if LICENSE field contains space separated entries 

The following changes since commit 15de188692d2572d897799424e2a22eab24c78e2:

  kernel-devsrc: Ensure we have a dependency on the actual source (2014-12-21 13:52:17 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib alimon/license_fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=alimon/license_fixes

Aníbal Limón (2):
  license_class: fix license.manifest shows LICENSE field differently to
    recipe
  license: Validate if LICENSE is well defined.

 meta/classes/base.bbclass    |  1 +
 meta/classes/license.bbclass | 35 +++++++++++++++++++++++++++++------
 2 files changed, 30 insertions(+), 6 deletions(-)

-- 
1.9.1


