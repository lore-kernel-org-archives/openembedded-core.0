Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4BD946E708
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 17:30:25 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 Jan 2014 09:26:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,696,1384329600"; d="scan'208";a="470222815"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.212])
	by orsmga002.jf.intel.com with ESMTP; 21 Jan 2014 09:30:21 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jan 2014 17:30:02 +0000
Message-Id: <cover.1390325320.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.4.2
Subject: [dylan][PATCH 0/2] Texinfo fixes for dylan
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
X-List-Received-Date: Tue, 21 Jan 2014 17:30:25 -0000

One backport from master (already in dora) and one dylan-specific patch
to fix failures building dylan on newer distributions such as Ubuntu 13.10.


The following changes since commit bca606597de6c5c2de98ae1949857e4481623939:

  build-appliance-image: Update to dylan head revision (2014-01-15 17:49:59 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/dylan-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/dylan-next

Paul Eggleton (1):
  guile: fix build with Texinfo 5.0

Saul Wold (1):
  grep: Add patch for texinfo 5.1

 .../0001-doc-Fix-build-with-Texinfo-5.0.patch      | 71 ++++++++++++++++++++++
 meta/recipes-devtools/guile/guile_2.0.7.bb         |  1 +
 .../grep/grep-2.5.1a/fix-for-texinfo-5.1.patch     | 13 ++++
 meta/recipes-extended/grep/grep_2.5.1a.bb          |  1 +
 4 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-devtools/guile/files/0001-doc-Fix-build-with-Texinfo-5.0.patch
 create mode 100644 meta/recipes-extended/grep/grep-2.5.1a/fix-for-texinfo-5.1.patch

-- 
1.8.4.2


