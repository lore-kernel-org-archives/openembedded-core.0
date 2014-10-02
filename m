Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CD5247029A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Oct 2014 14:28:11 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by fmsmga102.fm.intel.com with ESMTP; 02 Oct 2014 07:28:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,638,1406617200"; d="scan'208";a="481510070"
Received: from cpariyar-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.78])
	by azsmga001.ch.intel.com with ESMTP; 02 Oct 2014 07:28:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Oct 2014 15:27:25 +0100
Message-Id: <cover.1412259899.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [dora][PATCH 0/2] Fixes for recent bash CVE backports
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
X-List-Received-Date: Thu, 02 Oct 2014 14:28:15 -0000

Fixes for the patches being missed from the 4.2 recipes when the CVE
patches were backported.


The following changes since commit 1c8f43767c7d78872d38652ea808f30ea825bbef:

  bash: Fix CVE-2014-7169 (2014-10-02 00:03:41 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/dora-bash-cve-backport-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/dora-bash-cve-backport-fixes

Paul Eggleton (2):
  bash: add missing patch for CVE-2014-6271 to 4.2 recipe
  bash: add missing patch for CVE-2014-7169 to 4.2 recipe

 .../bash/bash-4.2/cve-2014-6271.patch              | 95 ++++++++++++++++++++++
 .../bash/bash-4.2/cve-2014-7169.patch              | 16 ++++
 meta/recipes-extended/bash/bash_4.2.bb             |  2 +
 3 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash-4.2/cve-2014-6271.patch
 create mode 100644 meta/recipes-extended/bash/bash-4.2/cve-2014-7169.patch

-- 
1.9.3


