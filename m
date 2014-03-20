Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2C97E6F92F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 19:24:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Mar 2014 12:24:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,697,1389772800"; d="scan'208";a="476625213"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.120.182])
	by orsmga001.jf.intel.com with ESMTP; 20 Mar 2014 12:24:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Mar 2014 19:24:32 +0000
Message-Id: <cover.1395343268.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH 0/5] Fixes for python module packaging
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
X-List-Received-Date: Thu, 20 Mar 2014 19:24:55 -0000

Some fixes for module package dependencies and SUMMARY values in
Python 2.7/3.3.


The following changes since commit ef196434620522affc11b5b1b867386b5d14a4c3:

  alsa-tools: fix build when x11 and gtk+ not available (2014-03-19 14:41:55 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/python-manifest
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/python-manifest

Paul Eggleton (5):
  python: add python-mmap to python-multiprocessing RDEPENDS
  generate-manifest-*.py: set SUMMARY instead of DESCRIPTION
  generate-manifest-2.7.py: sync with python-2.7-manifest.inc
  generate-manifest-3.3.py: sync descriptions with 2.7 version
  python3: sync module dependencies from 2.7

 .../python/python-2.7-manifest.inc                 |   2 +-
 .../python/python-3.3-manifest.inc                 | 130 ++++++++++-----------
 scripts/contrib/python/generate-manifest-2.7.py    | 122 +++++++++----------
 scripts/contrib/python/generate-manifest-3.3.py    | 114 +++++++++---------
 4 files changed, 184 insertions(+), 184 deletions(-)

-- 
1.8.5.3


