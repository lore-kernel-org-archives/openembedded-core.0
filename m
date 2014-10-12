Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 85E1F718D5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Oct 2014 20:31:48 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 12 Oct 2014 13:31:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,705,1406617200"; d="scan'208";a="604214962"
Received: from ohreyal-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.245])
	by fmsmga001.fm.intel.com with ESMTP; 12 Oct 2014 13:31:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Oct 2014 21:31:25 +0100
Message-Id: <cover.1413145831.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [dylan][PATCH 0/6] Backport shellshock fixes to dylan branch
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
X-List-Received-Date: Sun, 12 Oct 2014 20:31:54 -0000

The following changes since commit bf2d5380808bb3e0ad470e7853e3ae20617bbfd6:

  openssl: fix for CVE-2010-5298 (2014-06-09 13:57:13 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/bash-fixes-dylan
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/bash-fixes-dylan

Catalin Popeanga (4):
  bash: Fix for exported function namespace change
  bash: Fix for CVE-2014-7186 and CVE-2014-7187
  bash: Fix for CVE-2014-6277
  bash: Fix-for-CVE-2014-6278

Khem Raj (1):
  bash: Fix CVE-2014-7169

Ross Burton (1):
  bash: fix CVE-2014-6271

 ...r-bash-exported-function-namespace-change.patch | 158 +++++++++++++++
 .../bash/bash-3.2.48/cve-2014-6271.patch           |  77 ++++++++
 .../bash/bash-3.2.48/cve-2014-6277.patch           |  44 +++++
 .../bash/bash-3.2.48/cve-2014-6278.patch           |  99 ++++++++++
 .../bash/bash-3.2.48/cve-2014-7169.patch           |  16 ++
 .../bash-3.2.48/cve-2014-7186_cve-2014-7187.patch  |  99 ++++++++++
 ...r-bash-exported-function-namespace-change.patch | 212 +++++++++++++++++++++
 .../bash/bash-4.2/cve-2014-6271.patch              |  95 +++++++++
 .../bash/bash-4.2/cve-2014-6277.patch              |  44 +++++
 .../bash/bash-4.2/cve-2014-6278.patch              | 127 ++++++++++++
 .../bash/bash-4.2/cve-2014-7169.patch              |  16 ++
 .../bash-4.2/cve-2014-7186_cve-2014-7187.patch     | 167 ++++++++++++++++
 meta/recipes-extended/bash/bash_3.2.48.bb          |   6 +
 meta/recipes-extended/bash/bash_4.2.bb             |   6 +
 14 files changed, 1166 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/Fix-for-bash-exported-function-namespace-change.patch
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/cve-2014-6271.patch
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/cve-2014-6277.patch
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/cve-2014-6278.patch
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/cve-2014-7169.patch
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/cve-2014-7186_cve-2014-7187.patch
 create mode 100644 meta/recipes-extended/bash/bash-4.2/Fix-for-bash-exported-function-namespace-change.patch
 create mode 100644 meta/recipes-extended/bash/bash-4.2/cve-2014-6271.patch
 create mode 100644 meta/recipes-extended/bash/bash-4.2/cve-2014-6277.patch
 create mode 100644 meta/recipes-extended/bash/bash-4.2/cve-2014-6278.patch
 create mode 100644 meta/recipes-extended/bash/bash-4.2/cve-2014-7169.patch
 create mode 100644 meta/recipes-extended/bash/bash-4.2/cve-2014-7186_cve-2014-7187.patch

-- 
1.9.3


