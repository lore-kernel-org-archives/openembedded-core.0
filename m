Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 864EE77BC2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 15:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490367852; x=1521903852; h=from:to:subject:date:message-id;
	bh=TVJqj1OzxxE9Iq9nFwv6xQuEsufezxjlxwQca0IZqzQ=;
	b=ZyqlGD5w+LgWz4YnWNgFqA1HUuk5HorlBnw0+WZ5eVtw8vgP+JfCxya2
	l70IeKJCfpHnAdSPBqfIfOWUKdqeIA==;
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Mar 2017 08:04:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,215,1486454400"; d="scan'208";a="80253121"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 24 Mar 2017 08:04:11 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id 922376A4080
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 08:04:04 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Mar 2017 17:03:18 +0200
Message-Id: <1490367800-28099-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 0/2] fix valgrind ptest
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
X-List-Received-Date: Fri, 24 Mar 2017 15:04:10 -0000

Updated perl path in vg_regtest (test script)
Fixed the .exp and .out comparison logic

[YOCTO #8471]

Maxin B. John (2):
  valgrind: vg_regtest.in: fix perl script
  valgrind: correct the comparison logic in vg_regtest

 ...-vg_test-wrapper-to-support-PTEST-formats.patch |  4 +--
 .../valgrind/valgrind/fixed-perl-path.patch        | 33 +++++++++++++++++++---
 2 files changed, 31 insertions(+), 6 deletions(-)

-- 
2.4.0


