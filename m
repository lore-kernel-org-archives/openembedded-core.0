Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D792377DB8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 11:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491565904; x=1523101904; h=from:to:subject:date:message-id;
	bh=sKmy6IaR0bBZ768wPd+ut0acnnQVbziHSzD8zq4TS7k=;
	b=CX1EtPfjabPAfJJYWPimbncayjWCrbK6hTlJOnukATqrRFimyBVGmR9U
	jtctxsVXUs4mWM9LyWiGbLSzMO8Q8A==;
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Apr 2017 04:51:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,164,1488873600"; d="scan'208";a="85948584"
Received: from cleane-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.10.237])
	by fmsmga005.fm.intel.com with ESMTP; 07 Apr 2017 04:51:43 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Apr 2017 14:51:38 +0300
Message-Id: <20170407115141.2564-1-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH 0/3] Fixes to build perf test reporting
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
X-List-Received-Date: Fri, 07 Apr 2017 11:51:44 -0000

Three miscellaneous one-liners fixing minor issues in build performance test
reporting scripts.


Markus Lehtonen (3):
  build-perf-test-wrapper.sh: support extra args for email script
  oe-build-perf-report-email.py: use proper fallback email address
  scripts/oe-build-perf-report: improve guessing of args

 scripts/contrib/build-perf-test-wrapper.sh    | 2 +-
 scripts/contrib/oe-build-perf-report-email.py | 4 +++-
 scripts/oe-build-perf-report                  | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

-- 
2.12.0


