Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B38C46C6F9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 08:16:29 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 27 May 2015 01:16:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,503,1427785200"; d="scan'208";a="716216318"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga001.fm.intel.com with ESMTP; 27 May 2015 01:16:29 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 May 2015 11:16:36 +0300
Message-Id: <cover.1432713868.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/1] Upgrade waffle and fix recipe issues
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
X-List-Received-Date: Wed, 27 May 2015 08:16:32 -0000

I've tried to fix the package configuration already in the recipe to
do what I think it was trying to do. If there is nowadays a smarter
way to set config based on the capabilities of the GL stack, do let me
know.


The following changes since commit a05663bfa10352fd5af6ca9a9d7b323c1c099f35:

  distro/upstream_tracking: remove stale update reasons (2015-05-26 22:43:46 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/waffle
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/waffle

Jussi Kukkonen (1):
  waffle: Upgrade 1.3.0 -> 1.5.1

 .../waffle/{waffle_1.3.0.bb => waffle_1.5.1.bb}       | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)
 rename meta/recipes-graphics/waffle/{waffle_1.3.0.bb => waffle_1.5.1.bb} (51%)

-- 
2.1.4


