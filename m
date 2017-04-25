Return-Path: <juro.bystricky@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 88CA8779B1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 18:14:22 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Apr 2017 11:14:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,250,1488873600"; d="scan'208";a="960974560"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga003.jf.intel.com with ESMTP; 25 Apr 2017 11:14:13 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Apr 2017 11:14:05 -0700
Message-Id: <1493144048-12455-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493144048-12455-1-git-send-email-juro.bystricky@intel.com>
References: <1493144048-12455-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 1/4] bitbake.conf: new variable BUILD_REPRODUCIBLE_BINARIES
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
X-List-Received-Date: Tue, 25 Apr 2017 18:14:22 -0000

Building reproducible binaries may remove certain intentional
randomness intended for increased security. Hence, it is reasonable
to expect there will be cases where this is not desirable.
The user can select his/her preferences via the variable
BUILD_REPRODUCIBLE_BINARIES. The variable defaults to "0" (do not
build reproducible binaries) in order to minimize any potential
regressions. (Once the reproducible binaries code is mature enough,
it can be set to "1".)

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/conf/bitbake.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 227babd..0c1091e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -859,3 +859,6 @@ BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc deps depends \
 
 MLPREFIX ??= ""
 MULTILIB_VARIANTS ??= ""
+
+BUILD_REPRODUCIBLE_BINARIES ??= "0"
+BUILD_REPRODUCIBLE_BINARIES[export] = "1"
-- 
2.7.4


