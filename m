Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 16D0F776FF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 07:28:52 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 07 Sep 2016 00:28:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,295,1470726000"; d="scan'208";a="757913273"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Sep 2016 00:28:47 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2016 10:28:44 +0300
Message-Id: <1473233326-16830-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH 0/2] Fixes for oe-build-perf-test
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
X-List-Received-Date: Wed, 07 Sep 2016 07:28:53 -0000

Two small miscellanious fixes to build perf tests.

Markus Lehtonen (2):
  oeqa.buildperf: try harder when splitting 'nevr' string
  oeqa.buildperf: be sure to use the latest buildstats

 meta/lib/oeqa/buildperf/base.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
2.6.6


