Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 3FF3C65D9C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Apr 2014 13:07:15 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Apr 2014 05:57:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,958,1389772800"; d="scan'208";a="425892237"
Received: from cgwithan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.50])
	by azsmga001.ch.intel.com with ESMTP; 30 Apr 2014 05:57:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Apr 2014 13:56:32 +0100
Message-Id: <cover.1398862499.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH 0/1] Restore SQLite version numbering
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
X-List-Received-Date: Wed, 30 Apr 2014 13:07:17 -0000

The following changes since commit 1e1b42f687b5cd34623fe2682218958e1947eb92:

  feature-arm-thumb.inc: set ARMPKGSFX_THUMB only when thumb is in TUNE_FEATURES (2014-04-29 23:35:53 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/sqlite-version
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/sqlite-version

Paul Eggleton (1):
  sqlite3: restore upstream version numbering

 .../recipes-support/sqlite/{sqlite3_3080403.bb => sqlite3_3.8.4.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3080403.bb => sqlite3_3.8.4.3.bb} (88%)

-- 
1.9.0


