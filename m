Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5D62371ACC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 04:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489983391; x=1521519391; h=from:to:subject:date:message-id;
	bh=gKtLfh1O+9/XtnaodAE2l46cQiAoAU0MfBbXQqjPJwQ=;
	b=AtGIBjTABFMlF1H6SEBH09hJxdW5kLtgYoqDxsz1wx1+iSZq2ZabylFV
	aQBfHPi+DB5fgkYG03ZLNbmLkLkoMg==;
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Mar 2017 21:16:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,191,1486454400"; d="scan'208";a="238130024"
Received: from cloy-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.161.201])
	by fmsmga004.fm.intel.com with ESMTP; 19 Mar 2017 21:16:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Mar 2017 17:16:18 +1300
Message-Id: <cover.1489983267.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH 0/2] OE-Core fixes relating to tinfoil2 refactoring
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
X-List-Received-Date: Mon, 20 Mar 2017 04:16:29 -0000

Add some tests and fix parse failure handling in devtool after the
tinfoil2 refactoring.

NOTE: the bitbake patches I just sent should be applied first in order
to ensure the oe-selftest tests that the first patch introduces to pass.


The following changes since commit f43290f6e302dbacf5581d1fe1c6c991dd387779:

  neard: Fix parallel build issue (2017-03-17 16:56:02 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/tinfoil2-fixes-oecore
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/tinfoil2-fixes-oecore

Paul Eggleton (2):
  oe-selftest: tinfoil: add tests for recently enabled datastore operations
  devtool: tidy up handling of parse failures

 meta/lib/oeqa/selftest/tinfoil.py | 35 +++++++++++++++++++++++++++++++++++
 scripts/lib/devtool/__init__.py   | 11 +++++++++--
 2 files changed, 44 insertions(+), 2 deletions(-)

-- 
2.9.3


