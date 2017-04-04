Return-Path: <yin.thong.choong@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D06B06010D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 09:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491298176; x=1522834176;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=vyo46j7+oQNg7yzq7MkFzpj2ETkxA+AdUyTbPHV5N/c=;
	b=u06I2zgs3ZSvvEoSe2QqRiRfzAhPHddtzvYVZ9E20FlOH6g0QFRY0Ot8
	RJxfw3s0i5CiYLx/G4usghcuwSmYDw==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2017 02:29:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,274,1486454400"; d="scan'208";a="1115160776"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by orsmga001.jf.intel.com with ESMTP; 04 Apr 2017 02:29:35 -0700
From: yin.thong.choong@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Apr 2017 02:29:07 -0700
Message-Id: <1491298154-68270-2-git-send-email-yin.thong.choong@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491298154-68270-1-git-send-email-yin.thong.choong@intel.com>
References: <1491298154-68270-1-git-send-email-yin.thong.choong@intel.com>
Subject: [PATCH v2 1/8] selftest/recipetool: replace fedorahosted.org SRC_URI with github.com source
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
X-List-Received-Date: Tue, 04 Apr 2017 09:29:34 -0000

From: Choong YinThong <yin.thong.choong@intel.com>

fedorahosted.org was retired on March 1st, 2017. This is to
update the SRC_URI to point to github.com.

[YOCTO #11226]

Signed-off-by: Choong YinThong <yin.thong.choong@intel.com>
---
 meta/lib/oeqa/selftest/recipetool.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/recipetool.py b/meta/lib/oeqa/selftest/recipetool.py
index d62c8bb..d47b9dd 100644
--- a/meta/lib/oeqa/selftest/recipetool.py
+++ b/meta/lib/oeqa/selftest/recipetool.py
@@ -369,15 +369,15 @@ class RecipetoolTests(RecipetoolBase):
         tempsrc = os.path.join(self.tempdir, 'srctree')
         os.makedirs(tempsrc)
         recipefile = os.path.join(self.tempdir, 'logrotate_3.8.7.bb')
-        srcuri = 'https://fedorahosted.org/releases/l/o/logrotate/logrotate-3.8.7.tar.gz'
+        srcuri = 'https://github.com/logrotate/logrotate/archive/r3-8-7.tar.gz'
         result = runCmd('recipetool create -o %s %s -x %s' % (recipefile, srcuri, tempsrc))
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
         checkvars['LICENSE'] = 'GPLv2'
         checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=18810669f13b87348459e611d31ab760'
-        checkvars['SRC_URI'] = 'https://fedorahosted.org/releases/l/o/logrotate/logrotate-${PV}.tar.gz'
-        checkvars['SRC_URI[md5sum]'] = '99e08503ef24c3e2e3ff74cc5f3be213'
-        checkvars['SRC_URI[sha256sum]'] = 'f6ba691f40e30e640efa2752c1f9499a3f9738257660994de70a45fe00d12b64'
+        checkvars['SRC_URI'] = 'https://github.com/logrotate/logrotate/archive/r3-8-7.tar.gz'
+        checkvars['SRC_URI[md5sum]'] = '6b1aa0e0d07eda3c9a2526520850397a'
+        checkvars['SRC_URI[sha256sum]'] = 'dece4bfeb9d8374a0ecafa34be139b5a697db5c926dcc69a9b8715431a22e733'
         self._test_recipe_contents(recipefile, checkvars, [])
 
     @testcase(1194)
-- 
2.7.4


