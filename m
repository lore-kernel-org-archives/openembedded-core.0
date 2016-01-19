Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id E20BD6FF73
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 10:44:56 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 19 Jan 2016 02:44:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,316,1449561600"; d="scan'208";a="863671943"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.31.203])
	by orsmga001.jf.intel.com with ESMTP; 19 Jan 2016 02:44:57 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 10:44:07 +0000
Message-Id: <fded6d2dc4a1c3e71d4a1ce1ed9aa985e3467a3c.1453200108.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1453200108.git.joshua.g.lock@intel.com>
References: <cover.1453200108.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1453200108.git.joshua.g.lock@intel.com>
References: <cover.1453200108.git.joshua.g.lock@intel.com>
Subject: [PATCH 2/2] uclibc: remove a use of immediate expansion and oe_filter_out ()
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

The remove overrides syntax is much clearer here, and more closely
matches the preferred style for modern metadata.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/recipes-core/uclibc/uclibc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 2b34c34..b63158a 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -62,7 +62,7 @@ export V="2"
 # -O<n> -fno-omit-frame-pointer ends up with GCC ICE on thumb as reported
 # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=44860
 #
-CFLAGS_arm := "${@oe_filter_out('-fno-omit-frame-pointer', '${CFLAGS}', d)}"
+CFLAGS_remove_arm = "-fno-omit-frame-pointer"
 UCLIBC_EXTRA_CFLAGS  := "${@oe_filter_out('(-I\S+|-i\S+)', '${CFLAGS}', d)}"
 
 configmangle = '/^KERNEL_HEADERS/d; \
-- 
2.5.0


