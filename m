Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E22CF6010D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 16:49:09 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 20 Jan 2016 08:49:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,321,1449561600"; d="scan'208";a="897452297"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2016 08:49:10 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 16:49:59 +0000
Message-Id: <41e5cfb9f2c47f139496bf6b0001d2df112d776c.1453308549.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1453308549.git.alejandro.hernandez@linux.intel.com>
References: <cover.1453308549.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH v2 1/1] python-native: Make python-native also RPROVIDE python-unittest-native
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
X-List-Received-Date: Wed, 20 Jan 2016 16:49:13 -0000

The python-nose upgrade to 1.3.7 required a new unittest runtime dependency
after this, bitbake cant find a runtime provider for it when trying to build
python-nose-native, this patch makes python-native RPROVIDES python-unittest-native
to fix the issue.

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-devtools/python/python-native_2.7.11.bb        | 2 +-
 meta/recipes-devtools/ruby/{ruby_2.2.2.bb => ruby_2.3.0.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ruby/{ruby_2.2.2.bb => ruby_2.3.0.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-native_2.7.11.bb b/meta/recipes-devtools/python/python-native_2.7.11.bb
index 34f5c29..4c204a4 100644
--- a/meta/recipes-devtools/python/python-native_2.7.11.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.11.bb
@@ -25,7 +25,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/${PN}:"
 
 inherit native
 
-RPROVIDES += "python-distutils-native python-compression-native python-textutils-native python-codecs-native python-core-native"
+RPROVIDES += "python-distutils-native python-compression-native python-textutils-native python-codecs-native python-core-native python-unittest-native"
 
 EXTRA_OECONF_append = " --bindir=${bindir}/${PN}"
 
diff --git a/meta/recipes-devtools/ruby/ruby_2.2.2.bb b/meta/recipes-devtools/ruby/ruby_2.3.0.bb
similarity index 100%
rename from meta/recipes-devtools/ruby/ruby_2.2.2.bb
rename to meta/recipes-devtools/ruby/ruby_2.3.0.bb
-- 
1.8.4.5


