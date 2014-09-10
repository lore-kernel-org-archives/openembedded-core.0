Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1EA267142F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Sep 2014 17:20:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 Sep 2014 10:13:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,500,1406617200"; d="scan'208";a="571260046"
Received: from tmediriw-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.16])
	by orsmga001.jf.intel.com with ESMTP; 10 Sep 2014 10:19:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Sep 2014 18:19:30 +0100
Message-Id: <cover.1410369386.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/2] Locked sstate / SDK changes
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
X-List-Received-Date: Wed, 10 Sep 2014 17:20:12 -0000

A couple of changes related to the developer workflow work (see
https://bugzilla.yoctoproject.org/show_bug.cgi?id=6662 ).
Unfortunately the user facing parts of that are some way off
being ready for submission but here are a couple of the minimal
core pieces we need to make those work.

(Note that these are on top of Richard's locked sigs changes that
are still in review.)


The following changes since commit 00e869965818a08cec1ec4f48c35dcf0fe0d6959:

  sstatesig: Improve to handle locking of multiple machines (2014-09-10 18:15:41 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/sdkchanges
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/sdkchanges

Paul Eggleton (1):
  classes/populate_sdk_base: enable adding custom commands to SDK
    install script

Randy Witt (1):
  sstatesig.py: Add a path argument to dump_lockedsigs()

 meta/classes/populate_sdk_base.bbclass | 7 +++++++
 meta/files/toolchain-shar-template.sh  | 2 ++
 meta/lib/oe/sstatesig.py               | 7 ++++---
 3 files changed, 13 insertions(+), 3 deletions(-)

-- 
1.9.3


