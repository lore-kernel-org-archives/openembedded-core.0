Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2044077E93
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 03:47:15 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Sep 2017 20:47:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,416,1500966000"; d="scan'208";a="901616715"
Received: from thau-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.71.87])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Sep 2017 20:47:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Sep 2017 15:46:23 +1200
Message-Id: <cover.1505792710.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
Subject: [PATCH 0/1] scripts: rename yocto-compat-layer to remove "compatible" nomenclature
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
X-List-Received-Date: Tue, 19 Sep 2017 03:47:16 -0000

The following changes since commit cbc396dd10488990c98bb6fd94c7d10a736d57c1:

  gawk: Enable native building (2017-09-18 11:07:24 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/yocto-compat-rename
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/yocto-compat-rename

Paul Eggleton (1):
  scripts: rename yocto-compat-layer to remove "compatible" nomenclature

 scripts/lib/{compatlayer => checklayer}/__init__.py  |  2 +-
 scripts/lib/{compatlayer => checklayer}/case.py      |  2 +-
 .../{compatlayer => checklayer}/cases/__init__.py    |  0
 scripts/lib/{compatlayer => checklayer}/cases/bsp.py | 10 +++++-----
 .../lib/{compatlayer => checklayer}/cases/common.py  |  6 +++---
 .../lib/{compatlayer => checklayer}/cases/distro.py  |  8 ++++----
 scripts/lib/{compatlayer => checklayer}/context.py   |  4 ++--
 scripts/{yocto-compat-layer.py => yocto-check-layer} | 20 ++++++++++----------
 ...ompat-layer-wrapper => yocto-check-layer-wrapper} | 10 +++++-----
 9 files changed, 31 insertions(+), 31 deletions(-)
 rename scripts/lib/{compatlayer => checklayer}/__init__.py (99%)
 rename scripts/lib/{compatlayer => checklayer}/case.py (77%)
 rename scripts/lib/{compatlayer => checklayer}/cases/__init__.py (100%)
 rename scripts/lib/{compatlayer => checklayer}/cases/bsp.py (96%)
 rename scripts/lib/{compatlayer => checklayer}/cases/common.py (91%)
 rename scripts/lib/{compatlayer => checklayer}/cases/distro.py (77%)
 rename scripts/lib/{compatlayer => checklayer}/context.py (77%)
 rename scripts/{yocto-compat-layer.py => yocto-check-layer} (91%)
 rename scripts/{yocto-compat-layer-wrapper => yocto-check-layer-wrapper} (73%)

-- 
2.9.5


