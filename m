Return-Path: <stefanx.stanacar@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 92E656BD8B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 09:24:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 30 Aug 2013 02:24:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,989,1367996400"; d="scan'208";a="395892640"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 30 Aug 2013 02:24:40 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id BBEF36A4007;
	Fri, 30 Aug 2013 02:24:37 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2013 12:24:32 +0300
Message-Id: <1377854672-7536-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] lib/oeqa: move skeletoninit.py where it belongs
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
X-List-Received-Date: Fri, 30 Aug 2013 09:24:39 -0000

OE-core commit fcc59cbcdb1550489d372edf9f465efa7165245f /
poky commit 748ddc39e56623f4e48987f0467f4722f6e162f2 added a new test, but
in the wrong location.
I took the patch from Alex's branch but renamed it from meta/lib/oeqa/runtime/skeleton.py to meta/lib/oeqa/skeletoninit.py before sending. This was
unintentional, it should have been under meta/lib/oeqa/runtime.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/{ => runtime}/skeletoninit.py | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/lib/oeqa/{ => runtime}/skeletoninit.py (100%)

diff --git a/meta/lib/oeqa/skeletoninit.py b/meta/lib/oeqa/runtime/skeletoninit.py
similarity index 100%
rename from meta/lib/oeqa/skeletoninit.py
rename to meta/lib/oeqa/runtime/skeletoninit.py
-- 
1.8.3.1


