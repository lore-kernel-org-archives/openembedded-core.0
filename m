Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 71DB46D24F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 17:49:24 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 21 Oct 2013 10:49:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,540,1378882800"; d="scan'208";a="414632840"
Received: from unknown (HELO swold-linux.host.org) ([10.255.12.37])
	by fmsmga001.fm.intel.com with ESMTP; 21 Oct 2013 10:49:17 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Oct 2013 10:49:12 -0700
Message-Id: <1382377754-4904-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1382377754-4904-1-git-send-email-sgw@linux.intel.com>
References: <1382377754-4904-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 1/3] libcheck: Add native support for kbd-native
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
X-List-Received-Date: Mon, 21 Oct 2013 17:49:26 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/libcheck/libcheck_0.9.10.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/libcheck/libcheck_0.9.10.bb b/meta/recipes-support/libcheck/libcheck_0.9.10.bb
index a22271a..2cadf67 100644
--- a/meta/recipes-support/libcheck/libcheck_0.9.10.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.9.10.bb
@@ -20,3 +20,6 @@ CACHED_CONFIGUREVARS += "ac_cv_path_AWK_PATH=${bindir}/gawk"
 
 RREPLACES_${PN} = "check (<= 0.9.5)"
 RDEPENDS_${PN} += "gawk"
+RDEPENDS_${PN}_class-native = ""
+
+BBCLASSEXTEND = "native"
-- 
1.8.3.1


