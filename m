Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6E28B65CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Apr 2015 07:38:32 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 30 Apr 2015 00:38:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,675,1422950400"; d="scan'208";a="718277210"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga002.fm.intel.com with ESMTP; 30 Apr 2015 00:38:32 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Apr 2015 10:38:04 +0300
Message-Id: <cover.1430379176.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/2] icu and freetype upgrades
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
X-List-Received-Date: Thu, 30 Apr 2015 07:38:33 -0000

The following changes since commit db409697db2ea0931cdcd2015d089b6b0ea39bbb:

  bitbake: bitbake: reset build mtime cache before the build (2015-04-29 10:59:54 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/update-fontz
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/update-fontz

Jussi Kukkonen (2):
  freetype: Upgrade 2.5.4 -> 2.5.5
  icu: Upgrade 54.1 -> 55.1

 .../freetype/{freetype_2.5.4.bb => freetype_2.5.5.bb}               | 4 ++--
 meta/recipes-support/icu/{icu_54.1.bb => icu_55.1.bb}               | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype_2.5.4.bb => freetype_2.5.5.bb} (92%)
 rename meta/recipes-support/icu/{icu_54.1.bb => icu_55.1.bb} (67%)

-- 
2.1.4


