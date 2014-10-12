Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D6B7871829
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Oct 2014 20:27:42 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Oct 2014 13:27:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,705,1406617200"; d="scan'208";a="613318001"
Received: from ohreyal-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.245])
	by fmsmga002.fm.intel.com with ESMTP; 12 Oct 2014 13:27:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Oct 2014 21:27:10 +0100
Message-Id: <cover.1413145539.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [dora][PATCH 0/4] Backport remaining shellshock fixes to dora branch
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
X-List-Received-Date: Sun, 12 Oct 2014 20:27:43 -0000

The following changes since commit a71680ec6e12c17159336dc34d904cb70155d0d7:

  bash: add missing patch for CVE-2014-7169 to 4.2 recipe (2014-10-02 16:39:35 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/bash-fixes-dora
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/bash-fixes-dora

Catalin Popeanga (4):
  bash: Fix for exported function namespace change
  bash: Fix for CVE-2014-7186 and CVE-2014-7187
  bash: Fix for CVE-2014-6277
  bash: Fix-for-CVE-2014-6278

 ...r-bash-exported-function-namespace-change.patch | 158 +++++++++++++++
 .../bash/bash-3.2.48/cve-2014-6277.patch           |  44 +++++
 .../bash/bash-3.2.48/cve-2014-6278.patch           |  99 ++++++++++
 .../bash-3.2.48/cve-2014-7186_cve-2014-7187.patch  |  99 ++++++++++
 ...r-bash-exported-function-namespace-change.patch | 212 +++++++++++++++++++++
 .../bash/bash-4.2/cve-2014-6277.patch              |  44 +++++
 .../bash/bash-4.2/cve-2014-6278.patch              | 127 ++++++++++++
 .../bash-4.2/cve-2014-7186_cve-2014-7187.patch     | 167 ++++++++++++++++
 meta/recipes-extended/bash/bash_3.2.48.bb          |   4 +
 meta/recipes-extended/bash/bash_4.2.bb             |   4 +
 10 files changed, 958 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/Fix-for-bash-exported-function-namespace-change.patch
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/cve-2014-6277.patch
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/cve-2014-6278.patch
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/cve-2014-7186_cve-2014-7187.patch
 create mode 100644 meta/recipes-extended/bash/bash-4.2/Fix-for-bash-exported-function-namespace-change.patch
 create mode 100644 meta/recipes-extended/bash/bash-4.2/cve-2014-6277.patch
 create mode 100644 meta/recipes-extended/bash/bash-4.2/cve-2014-6278.patch
 create mode 100644 meta/recipes-extended/bash/bash-4.2/cve-2014-7186_cve-2014-7187.patch

-- 
1.9.3


