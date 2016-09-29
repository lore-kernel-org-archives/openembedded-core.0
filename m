Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id C8CB560620
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 17:10:10 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 29 Sep 2016 10:10:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,415,1473145200"; d="scan'208";a="767258840"
Received: from wegenerj-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.44.79])
	by FMSMGA003.fm.intel.com with ESMTP; 29 Sep 2016 10:10:11 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Sep 2016 20:10:07 +0300
Message-Id: <1475169009-6003-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH 0/2] build-perf-test: usability improvements
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
X-List-Received-Date: Thu, 29 Sep 2016 17:10:13 -0000

Two small patches that slightly improve the usability of
build-perf-test-wrapper.sh script.

Markus Lehtonen (2):
  build-perf-test-wrapper.sh: check for positional arguments
  build-perf-test-wrapper.sh: show defaults for '-a' and '-w'

 scripts/contrib/build-perf-test-wrapper.sh | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

-- 
2.6.6


