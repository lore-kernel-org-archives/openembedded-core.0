Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 5A91460043
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 13:12:48 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 13 Jan 2017 05:12:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,221,1477983600"; d="scan'208";a="1112091260"
Received: from hessakys-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.14.44])
	by fmsmga002.fm.intel.com with ESMTP; 13 Jan 2017 05:12:47 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2017 15:12:36 +0200
Message-Id: <1484313166-29604-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH v2 00/10] oeqa.utils.metadata: update xml schema
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
X-List-Received-Date: Fri, 13 Jan 2017 13:12:48 -0000

Changes since v1:
- import of git module moved back to function level
- two new patches regarding config variables


The following changes since commit acce512a0b85853b5acf2ef07e4163a3b4f33a98:

  selftest/devtool: update test to work with new mtd-utils (2017-01-09 13:34:32 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/oeqa-metaxml
  http://git.openembedded.org/openembedded-core-contrib/log/?h=marquiz/oeqa-metaxml


Markus Lehtonen (10):
  oeqa.utils.metadata: re-organise host distro information
  oeqa.utils.metadata: re-organise distro information
  oeqa.utils.metadata: drop 'unknown' git data elements
  oeqa.utils.metadata: fix retrieval of git branch and revision
  oeqa.utils.metadata: rename 'revision' to 'commit'
  oeqa.utils.metadata: add commit count information
  oeqa.utils.metadata: have layer name as an attribute in xml
  oeqa.utils.metadata: add bitbake revision information
  oeqa.utils.metadata: allow storing any bitbake config variables
  oeqa.utils.metadata: include BB_NUMBER_THREADS and PARALLEL_MAKE

 meta/lib/oeqa/utils/metadata.py | 87 +++++++++++++++++++++++++++++------------
 scripts/oe-selftest             | 12 +++---
 2 files changed, 67 insertions(+), 32 deletions(-)

-- 
2.6.6


