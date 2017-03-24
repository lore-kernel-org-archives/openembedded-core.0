Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 03CAF77BC5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 14:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490367203; x=1521903203; h=from:to:subject:date:message-id;
	bh=JRnHdeC+qk5zvUejmbsHILGOExYtpV/iHK0KDF0JELg=;
	b=ci7hPw+tDYc4tNWujFZjIJ49/aXP6Z+D9MnyBY0oCPyrCsZlY0MNfAbC
	exMUr9UBmPOpqvM2QYDiguPbVuIU7A==;
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Mar 2017 07:53:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,215,1486454400"; d="scan'208";a="838148592"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Mar 2017 07:53:00 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id 031B86A4080
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 07:52:53 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Mar 2017 16:52:43 +0200
Message-Id: <1490367165-27529-1-git-send-email-maxin.john@intel.com>
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
X-List-Received-Date: Fri, 24 Mar 2017 14:53:22 -0000

Updated perl path in vg_regtest (test script)
Fixed the .exp and .out comparison logic

[YOCTO #8471]

Maxin B. John (2):
  vg_regtest.in : fix perl script
  do_diffs: correct the comparison logic

 ...-vg_test-wrapper-to-support-PTEST-formats.patch |  4 +--
 .../valgrind/valgrind/fixed-perl-path.patch        | 33 +++++++++++++++++++---
 2 files changed, 31 insertions(+), 6 deletions(-)

-- 
2.4.0


