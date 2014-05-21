Return-Path: <georgex.l.musat@intel.com>
Received: from mga09.intel.com (unknown [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AD77465ED7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 15:12:06 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 May 2014 08:07:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,880,1392192000"; d="scan'208";a="544286404"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 21 May 2014 08:12:07 -0700
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id 8F60D6A4007;
	Wed, 21 May 2014 08:11:42 -0700 (PDT)
From: Lucian Musat <georgex.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 May 2014 18:10:03 +0300
Message-Id: <1400685003-28267-2-git-send-email-georgex.l.musat@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1400685003-28267-1-git-send-email-georgex.l.musat@intel.com>
References: <1400685003-28267-1-git-send-email-georgex.l.musat@intel.com>
Subject: [PATCH 2/2] oeqa/selftest/sstatetests: remove eglibc-initial from distro specific sstate test
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
X-List-Received-Date: Wed, 21 May 2014 15:12:08 -0000

Because eglibc-initial is non distro specific.

Signed-off-by: Lucian Musat <georgex.l.musat@intel.com>
---
 meta/lib/oeqa/selftest/sstatetests.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selftest/sstatetests.py
index 2626483..8b58203 100644
--- a/meta/lib/oeqa/selftest/sstatetests.py
+++ b/meta/lib/oeqa/selftest/sstatetests.py
@@ -69,7 +69,7 @@ class SStateTests(SStateBase):
 
     def test_cleansstate_task_distro_specific_tc_977(self):
         targetarch = get_bb_var('TUNE_ARCH')
-        self.run_test_cleansstate_task(['binutils-cross-'+ targetarch, 'binutils-native', 'eglibc-initial'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True)
+        self.run_test_cleansstate_task(['binutils-cross-'+ targetarch, 'binutils-native'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True)
 
 
     # Test rebuilding of distro-specific sstate files
-- 
1.9.1


