Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 29B3265CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Apr 2015 09:16:13 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 30 Apr 2015 02:16:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,675,1422950400"; d="scan'208";a="487591006"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Apr 2015 02:16:13 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Apr 2015 12:16:06 +0300
Message-Id: <1430385372-6975-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 0/6] devtool: improve handling of local source files
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
X-List-Received-Date: Thu, 30 Apr 2015 09:16:20 -0000

This patchset tries to improve handling of local source files (i.e. file:// in
SRC_URI). First, it improves packages for which S=WORKDIR (that possibly only
have local sources. Second, it makes local sources available in the srctree for
all packages.

See yocto bug #7602

Markus Lehtonen (6):
  devtool: extract: remove patches when S=WORKDIR
  recipeutils: implement get_recipe_local_files()
  oe.patch.GitApplyTree: add paths argument to extractPatches
  devtool: update-recipe: update local files directly
  devtool: extract: always import local files to srctree
  devtool: modify: make bitbake use local files from srctree

 meta/lib/oe/patch.py            |   5 +-
 meta/lib/oe/recipeutils.py      |   8 +++
 scripts/lib/devtool/standard.py | 116 +++++++++++++++++++++++++++++++++++++---
 3 files changed, 122 insertions(+), 7 deletions(-)

-- 
2.1.4


