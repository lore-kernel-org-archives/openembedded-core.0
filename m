Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id ACCB96093F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 03:47:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Dec 2018 19:47:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,347,1539673200"; d="scan'208";a="109138403"
Received: from weijianl-mobl.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.147.249])
	by fmsmga008.fm.intel.com with ESMTP; 12 Dec 2018 19:47:06 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Dec 2018 16:46:55 +1300
Message-Id: <cover.1544672785.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.17.2
Subject: [PATCH 0/1] oe-selftest: distrodata: change test_maintainers() to use tinfoil
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
X-List-Received-Date: Thu, 13 Dec 2018 03:47:08 -0000

The following changes since commit 8bc0d2f2197430723f8b2d0785169e48c883eedb:

  mdadm: Drop redundant patches and fix build with clang (2018-12-09 11:08:07 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/distrodata-selftest-fix
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/distrodata-selftest-fix

Paul Eggleton (1):
  oe-selftest: distrodata: change test_maintainers() to use tinfoil

 meta/lib/oeqa/selftest/cases/distrodata.py | 81 +++++++++-------------
 1 file changed, 34 insertions(+), 47 deletions(-)

-- 
2.17.2


