Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BE69A6DD15
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2013 18:50:56 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 02 Dec 2013 10:50:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,812,1378882800"; d="scan'208";a="445490165"
Received: from pmcgurk-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.121.184])
	by orsmga002.jf.intel.com with ESMTP; 02 Dec 2013 10:50:55 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Dec 2013 18:50:43 +0000
Message-Id: <cover.1386009885.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/8] pkgdata and buildhistory improvements
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
X-List-Received-Date: Mon, 02 Dec 2013 18:50:56 -0000

Fix up pkgdata, and change buildhistory to read from it rather than
collecting package information directly; also make some performance and
content improvements to buildhistory at the same time.

Note: there are minor changes necessary for Hob and Toaster UI code in
bitbake to match up with these; they have been sent separately to the
bitbake-devel list.


The following changes since commit 9cf1ac73c4e35101a4f5c01a5e1c53f9d567bc58:

  oe-init-build-env-memres: Add auto port functionality (2013-12-02 11:27:46 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/buildhistory
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildhistory

Paul Eggleton (8):
  classes/package: fix FILES_INFO serialisation in pkgdata
  classes/package: record PKGSIZE as total file size in pkgdata
  classes/package: write PE and PKGE out to pkgdata
  classes/buildhistory: drop cruft from old SRCREV tracking
    implementation
  classes/buildhistory: add additional variables to image information
  classes/buildhistory: improve collection of package info
  classes/buildhistory: reduce parsing time
  classes/buildhistory: do git garbage collection after committing

 meta/classes/buildhistory.bbclass    | 118 +++++++++++++++++------------------
 meta/classes/package.bbclass         |  33 +++++-----
 meta/classes/toaster.bbclass         |  28 ++-------
 meta/lib/oe/buildhistory_analysis.py |   4 +-
 scripts/oe-pkgdata-util              |  25 ++++----
 5 files changed, 92 insertions(+), 116 deletions(-)

-- 
1.8.1.2


