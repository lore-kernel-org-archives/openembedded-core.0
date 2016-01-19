Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id ABDAC6E668
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 10:44:56 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 19 Jan 2016 02:44:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,316,1449561600"; d="scan'208";a="863671932"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.31.203])
	by orsmga001.jf.intel.com with ESMTP; 19 Jan 2016 02:44:56 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 10:44:06 +0000
Message-Id: <67d8d3b06b6daf7bde8a09a63a0a8f778cb46958.1453200108.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1453200108.git.joshua.g.lock@intel.com>
References: <cover.1453200108.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1453200108.git.joshua.g.lock@intel.com>
References: <cover.1453200108.git.joshua.g.lock@intel.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] gcc-runtime: switch to removal override syntax to modify CXXFLAGS
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
X-List-Received-Date: Tue, 19 Jan 2016 10:44:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The use of immediate expansion can cause issues when trying to
override variables, further the removal override syntax is clearer
than oe_filter_out () — switch to using removal override syntax
instead.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index c31072a..075afbd 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -1,6 +1,6 @@
 require gcc-configure-common.inc
 
-CXXFLAGS := "${@oe_filter_out('-fvisibility-inlines-hidden', '${CXXFLAGS}', d)}"
+CXXFLAGS_remove = "-fvisibility-inlines-hidden"
 
 EXTRA_OECONF_PATHS = "\
     --with-gxx-include-dir=${includedir}/c++/${BINV} \
-- 
2.5.0


