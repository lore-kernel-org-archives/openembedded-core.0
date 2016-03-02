Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8FE166FF97
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Mar 2016 10:44:55 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 02 Mar 2016 02:44:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,528,1449561600"; d="scan'208";a="756622342"
Received: from sgominde-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.165.23])
	by orsmga003.jf.intel.com with ESMTP; 02 Mar 2016 02:44:54 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Mar 2016 23:44:18 +1300
Message-Id: <cover.1456915391.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 0/3] Extensible SDK improvements
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
X-List-Received-Date: Wed, 02 Mar 2016 10:44:56 -0000

Add ability to build derivative extensible SDK and fix up an issue with
the earlier patch introducing oe-workdir and oe-logs symlinks.


The following changes since commit 390bad905537820f49add855c95d726b5b55c8fa:

  sanity: Fix int verses string reference (2016-02-28 22:54:06 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/extsdkfixes8-oe
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/extsdkfixes8-oe

Paul Eggleton (3):
  classes/externalsrc: fix symlinking if symlink exists pointing to another path
  devtool: build-image: rename module
  devtool: add build-sdk subcommand

 meta/classes/externalsrc.bbclass                   |   1 +
 meta/classes/populate_sdk_ext.bbclass              | 148 +++++++++++++--------
 meta/lib/oe/copy_buildsystem.py                    |  59 +++++++-
 .../lib/devtool/{build-image.py => build_image.py} |  79 ++++++++---
 scripts/lib/devtool/build_sdk.py                   |  65 +++++++++
 5 files changed, 265 insertions(+), 87 deletions(-)
 rename scripts/lib/devtool/{build-image.py => build_image.py} (67%)
 create mode 100644 scripts/lib/devtool/build_sdk.py

-- 
2.5.0


