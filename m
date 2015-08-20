Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 87C3165CBC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 11:37:18 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 20 Aug 2015 04:37:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,714,1432623600"; d="scan'208";a="787463673"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga002.fm.intel.com with ESMTP; 20 Aug 2015 04:37:18 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 14:37:45 +0300
Message-Id: <cover.1440070230.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/3] Upgrade lsof, libical, lsbinitscripts
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
X-List-Received-Date: Thu, 20 Aug 2015 11:37:21 -0000

The following changes since commit 6b8bb442880ef18097e47761f4f3b6f555f2877c:

  genericx86*: Update BSPs to use 4.1 Kernel (2015-08-19 18:05:56 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/lsof-lsb-libical
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/lsof-lsb-libical

Jussi Kukkonen (3):
  lsof: Upgrade 4.88 -> 4.89
  lsbinitscripts: Upgrade 9.63 -> 9.64
  libical: Upgrade 1.0.0 -> 1.0.1

 .../lsb/{lsbinitscripts_9.63.bb => lsbinitscripts_9.64.bb}        | 6 +++---
 meta/recipes-extended/lsof/{lsof_4.88.bb => lsof_4.89.bb}         | 4 ++--
 .../libical/{libical_1.0.0.bb => libical_1.0.1.bb}                | 8 +++++---
 3 files changed, 10 insertions(+), 8 deletions(-)
 rename meta/recipes-extended/lsb/{lsbinitscripts_9.63.bb => lsbinitscripts_9.64.bb} (81%)
 rename meta/recipes-extended/lsof/{lsof_4.88.bb => lsof_4.89.bb} (91%)
 rename meta/recipes-support/libical/{libical_1.0.0.bb => libical_1.0.1.bb} (67%)

-- 
2.1.4


