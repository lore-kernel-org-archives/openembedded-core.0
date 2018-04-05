Return-Path: <amanda.r.brindle@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 998C97505B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 21:12:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Apr 2018 14:12:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,412,1517904000"; d="scan'208";a="48340405"
Received: from aurora.jf.intel.com ([10.7.198.68])
	by orsmga002.jf.intel.com with ESMTP; 05 Apr 2018 14:12:55 -0700
From: Amanda Brindle <amanda.r.brindle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Apr 2018 14:12:56 -0700
Message-Id: <cover.1522962189.git.amanda.r.brindle@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: alexander.kanavin@intel.com
Subject: [pyro 0/1] Backport debugedit fixes for pyro
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
X-List-Received-Date: Thu, 05 Apr 2018 21:12:54 -0000

This is intended for 2.3.4.

The following changes since commit f3e674cb654d4dab3e4ba5b2ae1fac72ef8363da:

  distcc: Change SRC_URI (2018-04-05 16:26:20 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib abrindle/backport
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=abrindle/backport

Alexander Kanavin (1):
  package.bbclass: replace rpm/debugedit with dwarfsrcfiles

 meta/classes/package.bbclass                       |  29 ++++--
 .../dwarfsrcfiles/dwarfsrcfiles.bb                 |  22 ++++
 .../dwarfsrcfiles/files/dwarfsrcfiles.c            | 111 +++++++++++++++++++++
 3 files changed, 156 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb
 create mode 100644 meta/recipes-devtools/dwarfsrcfiles/files/dwarfsrcfiles.c

-- 
2.7.4


