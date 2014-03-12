Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 585E560B9B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 18:59:48 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 12 Mar 2014 11:59:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,639,1389772800"; d="scan'208";a="497176494"
Received: from drewstep-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.61])
	by fmsmga002.fm.intel.com with ESMTP; 12 Mar 2014 11:59:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Mar 2014 18:59:27 +0000
Message-Id: <cover.1394650701.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [dora][PATCH 0/1] Dora backport of master fix
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
X-List-Received-Date: Wed, 12 Mar 2014 18:59:51 -0000

Backporting this to dora since it's about to be backported to dylan as
well.


The following changes since commit ca55e7321f0c52fbe13d301d0dfe3adff5435639:

  iproute2: de-bash its scripts to remove the bash dependency (2014-03-11 07:56:29 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/dora-lsbtest
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/dora-lsbtest

Stefan Stanacar (1):
  lsbtest: fix comparison bashism

 meta/recipes-extended/lsb/lsbtest/LSB_Test.sh | 2 +-
 meta/recipes-extended/lsb/lsbtest_1.0.bb      | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
1.8.5.3


