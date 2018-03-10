Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 62D9E70018
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 18:57:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Mar 2018 10:57:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,451,1515484800"; d="scan'208";a="23585912"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga007.jf.intel.com with ESMTP; 10 Mar 2018 10:57:50 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 10 Mar 2018 10:57:49 -0800
Message-Id: <1520708269-63591-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH] reproducible_build_simple.bbclass: simple environment for reproducible binaries
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
X-List-Received-Date: Sat, 10 Mar 2018 18:57:49 -0000

Export environmental variables needed for binary reproducibility with consistent values.

This class can be used either directly via:
INHERIT += "reproducible_build_simple"

or can be inherited by a more complex/complete bbclass, for example a bblass which
will crack SOURCE_DATE_EPOCH for each recipe.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/reproducible_build_simple.bbclass | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta/classes/reproducible_build_simple.bbclass

diff --git a/meta/classes/reproducible_build_simple.bbclass b/meta/classes/reproducible_build_simple.bbclass
new file mode 100644
index 0000000..dd11cd9
--- /dev/null
+++ b/meta/classes/reproducible_build_simple.bbclass
@@ -0,0 +1,11 @@
+# Setup default environment for reproducible builds.
+
+BUILD_REPRODUCIBLE_BINARIES = "1"
+
+export PYTHONHASHSEED = "0"
+export PERL_HASH_SEED = "0"
+export TZ = 'UTC'
+export SOURCE_DATE_EPOCH ??= "1520598896"
+
+REPRODUCIBLE_TIMESTAMP_ROOTFS ??= "1520598896"
+
-- 
2.7.4


