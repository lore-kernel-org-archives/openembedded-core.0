Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 470536E8A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 19:03:57 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 12 Mar 2014 12:03:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,639,1389772800"; d="scan'208";a="490708296"
Received: from drewstep-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.61])
	by fmsmga001.fm.intel.com with ESMTP; 12 Mar 2014 12:03:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Mar 2014 19:03:29 +0000
Message-Id: <cover.1394650870.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [dylan][PATCH 0/5] Fixes for 1.4.3 QA failures (cover letter only)
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
X-List-Received-Date: Wed, 12 Mar 2014 19:04:02 -0000

These are all fixes for 1.4.3 QA failures, and are all backports from
master. One of the fixes is not yet in dora and I have sent that for
dora separately.


The following changes since commit fae45abd37636741d51e5b75ad2c09f43b72d01d:

  gnutls: fix failure during do_compile (2014-03-06 10:31:45 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/dylan-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/dylan-fixes

Darren Hart (1):
  init-install-efi.sh: Remove unnecessary udev rules file to avoid
    errors

Mark Hatle (1):
  rpm: Enable compatibility with older RPM packages that have invalid
    platforms

Richard Purdie (2):
  python-2.7-manifest: Add missing python-ctypes dependency to
    python-multiprocessing
  runqemu: Use correct kvm CPU options for qemux86* with kvm

Stefan Stanacar (1):
  lsbtest: fix comparison bashism

 .../initrdscripts/files/init-install-efi.sh        |  1 +
 .../python/python-2.7-manifest.inc                 |  2 +-
 .../rpm/rpm/rpm-lsb-compatibility.patch            | 24 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |  3 ++-
 meta/recipes-extended/lsb/lsbtest/LSB_Test.sh      |  2 +-
 meta/recipes-extended/lsb/lsbtest_1.0.bb           |  6 +++---
 scripts/contrib/python/generate-manifest-2.7.py    |  2 +-
 scripts/runqemu                                    |  6 +++++-
 8 files changed, 38 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-lsb-compatibility.patch

-- 
1.8.5.3


