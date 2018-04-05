Return-Path: <amanda.r.brindle@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 1FE08745B6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 21:24:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Apr 2018 14:24:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,412,1517904000"; d="scan'208";a="45286385"
Received: from aurora.jf.intel.com ([10.7.198.68])
	by orsmga001.jf.intel.com with ESMTP; 05 Apr 2018 14:24:33 -0700
From: Amanda Brindle <amanda.r.brindle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Apr 2018 14:24:47 -0700
Message-Id: <cover.1522963233.git.amanda.r.brindle@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: alexander.kanavin@intel.com
Subject: [rocko 0/1] Backport debugedit fixes for Rocko
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
X-List-Received-Date: Thu, 05 Apr 2018 21:24:32 -0000

This is for 2.4.3

The following changes since commit fdeecc901196bbccd7c5b1ea4268a2cf56764a62:

  libvorbis: CVE-2018-5146 (2018-04-02 17:06:40 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib abrindle/rocko_backport
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=abrindle/rocko_backport

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


