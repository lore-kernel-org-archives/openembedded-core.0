Return-Path: <ionutx.chisanovici@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EBBE360E24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 08:38:35 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 30 Jun 2014 01:38:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="358298862"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Jun 2014 01:33:32 -0700
Received: from localhost.localdomain (unknown [10.237.112.210])
	by linux.intel.com (Postfix) with ESMTP id D6A4B2C8001;
	Mon, 30 Jun 2014 01:38:04 -0700 (PDT)
From: Ionut Chisanovici <ionutx.chisanovici@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jun 2014 11:41:38 +0300
Message-Id: <1404117699-5714-1-git-send-email-ionutx.chisanovici@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 1/2] oeqa/selftest/toaster.py: renamed to _toaster.py
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
X-List-Received-Date: Mon, 30 Jun 2014 08:38:36 -0000

In order not to run the toaster selftests by default, we renamed to _toaster.py

Signed-off-by: Ionut Chisanovici <ionutx.chisanovici@intel.com>
---
 meta/lib/oeqa/selftest/{toaster.py => _toaster.py} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/lib/oeqa/selftest/{toaster.py => _toaster.py} (100%)

diff --git a/meta/lib/oeqa/selftest/toaster.py b/meta/lib/oeqa/selftest/_toaster.py
similarity index 100%
rename from meta/lib/oeqa/selftest/toaster.py
rename to meta/lib/oeqa/selftest/_toaster.py
-- 
1.8.3.2


