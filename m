Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 8183F76FFA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 13:01:35 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 19 Aug 2016 06:01:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,544,1464678000"; d="scan'208";a="158381000"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga004.fm.intel.com with ESMTP; 19 Aug 2016 06:01:35 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Aug 2016 16:01:32 +0300
Message-Id: <1471611694-31473-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH 0/2] Fixes to oe-build-perf-test
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
X-List-Received-Date: Fri, 19 Aug 2016 13:01:35 -0000

Two patches to fix issues introduced in the previous conversion to Python
unittest framework.

The following changes since commit 5dca6cc2fcdb2799c19b1697f0647a16ce296290:

  systemd-compat-units: Only enable for systemd in DISTRO_FEATURES (2016-08-18 16:52:02 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/buildperf/unittest
  http://git.openembedded.org/openembedded-core-contrib/log/?h=marquiz/buildperf/unittest


Markus Lehtonen (2):
  oe-build-perf-test: align log message format with testrunner output
  oeqa.buildperf: fix crash when creating globalres.log

 meta/lib/oeqa/buildperf/base.py | 2 +-
 scripts/oe-build-perf-test      | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

-- 
2.6.6


