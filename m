Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9146960721
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 08:39:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 18 Dec 2015 00:39:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,445,1444719600"; d="scan'208";a="843854138"
Received: from lleszczu-mobl.igk.intel.com (HELO mqz-osx-suse64.fi.intel.com)
	([10.252.17.67])
	by orsmga001.jf.intel.com with ESMTP; 18 Dec 2015 00:39:47 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Dec 2015 10:39:40 +0200
Message-Id: <1450427985-12504-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/5] devtool: create kernel config fragment
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
X-List-Received-Date: Fri, 18 Dec 2015 08:39:49 -0000

This patchset implements an initial support for creating kernel config
fragments on 'devtool update-recipe'. The feature relies on having an updated
.config file and an initial base config (.config.orig) in the source tree.
Devtool does a diff operation between the two and creates/upates a config
fragment which is added to SRC_URI of the recipe.

The first patch in the series is a bugfix and should be straightforward to
merge.

[YOCTO #6658]


The following changes since commit 6f822a9fd185f479ef86c584b6d91a51b3a24e44:

  meta: more removals of redunant FILES_${PN}-dbg (2015-12-16 12:11:26 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/devtool/kernel

for you to fetch changes up to 2adc35e3129be74afe28dc3087ea44665a80221c:

  devtool: update-recipe: create kernel config fragment (2015-12-17 14:34:15 +0200)


Markus Lehtonen (5):
  devtool: extract: use the correct datastore for builddir
  kernel.bbclass: copy .config instead of moving
  devtool: extract: cleanup srctree
  cml1.bbclass: copy .config to S if externalsr is in use
  devtool: update-recipe: create kernel config fragment

 meta/classes/cml1.bbclass       |  5 ++++
 meta/classes/kernel.bbclass     |  2 +-
 scripts/lib/devtool/standard.py | 65 +++++++++++++++++++++++++++++++++++++++--
 3 files changed, 68 insertions(+), 4 deletions(-)

-- 
2.1.4


