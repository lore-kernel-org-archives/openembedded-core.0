Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3A36D7169F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 13:42:36 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Apr 2015 06:42:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,671,1422950400"; d="scan'208";a="721057391"
Received: from pkcletus-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.20.230])
	by orsmga002.jf.intel.com with ESMTP; 29 Apr 2015 06:42:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Apr 2015 14:41:54 +0100
Message-Id: <cover.1430314621.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/6] devtool: enable adding remote source
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
X-List-Received-Date: Wed, 29 Apr 2015 13:42:37 -0000

Enable specifying a remote URI to fetch and extract (so you don't have
to do this manually) as well as some related fixes and improvements.


The following changes since commit 82d00f7254b7d3bb6a167d675d798134884d1b19:

  split_and_strip_files: regroup hardlinks to make build deterministic (2015-04-29 10:39:41 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool-add-fetch
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool-add-fetch

Paul Eggleton (6):
  recipetool: avoid second-level subdir when extracting
  recipetool: ensure git clone is a full clone when extracting
  devtool: add: add an option to fetch remote source
  devtool: add: use the appropriate file naming and versioning for SCM
    recipes
  recipetool: allow specifying SRCREV via rev= in URI
  oe-selftest: devtool: add some tests for devtool add -f

 meta/lib/oeqa/selftest/devtool.py | 148 ++++++++++++++++++++++++++++++--------
 scripts/lib/devtool/standard.py   |  47 +++++++++---
 scripts/lib/recipetool/create.py  |  47 ++++++++----
 scripts/lib/scriptutils.py        |  10 +++
 4 files changed, 199 insertions(+), 53 deletions(-)

-- 
2.1.0


